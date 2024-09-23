@implementation AAUIOBInheritanceSetupCompleteViewModel

- (AAUIOBInheritanceSetupCompleteViewModel)initWithBeneficiaryName:(id)a3 accessKeyShareType:(unint64_t)a4
{
  AAUIOBInheritanceSetupCompleteViewModel *v4;
  AAUIOBInheritanceSetupCompleteViewModel *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AAUIOBInheritanceSetupCompleteViewModel;
  v4 = -[AAOBInheritanceSetupCompleteModel initWithBeneficiaryName:accessKeyShareType:](&v7, sel_initWithBeneficiaryName_accessKeyShareType_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[AAUIOBInheritanceSetupCompleteViewModel _setInheritanceInvitationImageIfNecessary](v4, "_setInheritanceInvitationImageIfNecessary");
    v5->_contentViewLayout = 2;
  }
  return v5;
}

- (AAUIOBInheritanceSetupCompleteViewModel)initWithBeneficiaryName:(id)a3 accessKeyShareType:(unint64_t)a4 inviteType:(unint64_t)a5
{
  AAUIOBInheritanceSetupCompleteViewModel *v5;
  AAUIOBInheritanceSetupCompleteViewModel *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AAUIOBInheritanceSetupCompleteViewModel;
  v5 = -[AAOBInheritanceSetupCompleteModel initWithBeneficiaryName:accessKeyShareType:inviteType:](&v8, sel_initWithBeneficiaryName_accessKeyShareType_inviteType_, a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    -[AAUIOBInheritanceSetupCompleteViewModel _setInheritanceInvitationImageIfNecessary](v5, "_setInheritanceInvitationImageIfNecessary");
    v6->_contentViewLayout = 2;
  }
  return v6;
}

- (void)_setInheritanceInvitationImageIfNecessary
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[AAOBInheritanceSetupCompleteModel imageName](self, "imageName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0DC3870];
    -[AAOBInheritanceSetupCompleteModel imageName](self, "imageName");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "imageNamed:inBundle:", v8, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUIOBInheritanceSetupCompleteViewModel setImage:](self, "setImage:", v7);

  }
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (UIView)secondaryView
{
  return self->_secondaryView;
}

- (void)setSecondaryView:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (int64_t)contentViewLayout
{
  return self->_contentViewLayout;
}

- (void)setContentViewLayout:(int64_t)a3
{
  self->_contentViewLayout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end
