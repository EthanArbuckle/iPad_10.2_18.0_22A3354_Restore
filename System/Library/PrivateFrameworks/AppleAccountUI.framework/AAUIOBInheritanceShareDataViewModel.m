@implementation AAUIOBInheritanceShareDataViewModel

- (AAUIOBInheritanceShareDataViewModel)initWithBeneficiaryName:(id)a3
{
  AAUIOBInheritanceShareDataViewModel *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  UIImage *image;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AAUIOBInheritanceShareDataViewModel;
  v3 = -[AAOBInheritanceShareDataModel initWithBeneficiaryName:](&v9, sel_initWithBeneficiaryName_, a3);
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0DC3870];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "imageNamed:inBundle:", CFSTR("beneficiary_share_data"), v5);
    v6 = objc_claimAutoreleasedReturnValue();
    image = v3->_image;
    v3->_image = (UIImage *)v6;

    v3->_contentViewLayout = 2;
  }
  return v3;
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
