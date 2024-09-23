@implementation AAUIOBInheritanceInvitationViewModel

- (AAUIOBInheritanceInvitationViewModel)initWithBenefactorInfo:(id)a3
{
  AAUIOBInheritanceInvitationViewModel *v3;
  AAUIOBInheritanceInvitationViewModel *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AAUIOBInheritanceInvitationViewModel;
  v3 = -[AAOBInheritanceInvitationModel initWithBenefactorInfo:](&v6, sel_initWithBenefactorInfo_, a3);
  v4 = v3;
  if (v3)
  {
    -[AAUIOBInheritanceInvitationViewModel _setInheritanceInvitationImageIfNecessary](v3, "_setInheritanceInvitationImageIfNecessary");
    v4->_contentViewLayout = 2;
  }
  return v4;
}

- (AAUIOBInheritanceInvitationViewModel)initWithAcceptedViewForBenefactorInfo:(id)a3
{
  AAUIOBInheritanceInvitationViewModel *v3;
  AAUIOBInheritanceInvitationViewModel *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AAUIOBInheritanceInvitationViewModel;
  v3 = -[AAOBInheritanceInvitationModel initWithAcceptedViewForBenefactorInfo:](&v6, sel_initWithAcceptedViewForBenefactorInfo_, a3);
  v4 = v3;
  if (v3)
  {
    -[AAUIOBInheritanceInvitationViewModel _setInheritanceInvitationImageIfNecessary](v3, "_setInheritanceInvitationImageIfNecessary");
    v4->_contentViewLayout = 2;
  }
  return v4;
}

- (AAUIOBInheritanceInvitationViewModel)initWithModel:(id)a3
{
  AAUIOBInheritanceInvitationViewModel *v3;
  AAUIOBInheritanceInvitationViewModel *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AAUIOBInheritanceInvitationViewModel;
  v3 = -[AAOBInheritanceInvitationModel initWithModel:](&v6, sel_initWithModel_, a3);
  v4 = v3;
  if (v3)
  {
    -[AAUIOBInheritanceInvitationViewModel _setInheritanceInvitationImageIfNecessary](v3, "_setInheritanceInvitationImageIfNecessary");
    v4->_contentViewLayout = 2;
  }
  return v4;
}

- (void)_setInheritanceInvitationImageIfNecessary
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[AAOBInheritanceInvitationModel imageName](self, "imageName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0DC3870];
    -[AAOBInheritanceInvitationModel imageName](self, "imageName");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "imageNamed:inBundle:", v8, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUIOBInheritanceInvitationViewModel setImage:](self, "setImage:", v7);

  }
}

- (int64_t)contentViewLayout
{
  return self->_contentViewLayout;
}

- (void)setContentViewLayout:(int64_t)a3
{
  self->_contentViewLayout = a3;
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (UIView)secondaryView
{
  return self->_secondaryView;
}

- (void)setSecondaryView:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end
