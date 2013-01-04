class Ability
  include CanCan::Ability # We can remove this once we're using Hydra-head 5.2.0+

  include Hydra::Ability

  def custom_permissions
    if @user.admin?
      can [:index, :edit, :destroy], User
      can :access, :rails_admin   # grant access to rails_admin
      can :dashboard              # grant access to the dashboard
    end

  end
end
