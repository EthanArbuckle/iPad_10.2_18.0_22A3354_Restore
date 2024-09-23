@implementation AAUIOBCustodianIntroViewModel

- (id)initHidingNotNowButton:(BOOL)a3
{
  AAUIOBCustodianIntroViewModel *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  UIImage *image;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AAUIOBCustodianIntroViewModel;
  v4 = -[AAUIOBCustodianIntroViewModel init](&v10, sel_init);
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0DC3870];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "imageNamed:inBundle:", CFSTR("AccountRecoveryContact"), v6);
    v7 = objc_claimAutoreleasedReturnValue();
    image = v4->_image;
    v4->_image = (UIImage *)v7;

    v4->_contentViewLayout = 2;
    v4->_hideNotNowButton = a3;
  }
  return v4;
}

- (NSString)secondaryButton
{
  objc_super v3;

  if (self->_hideNotNowButton)
    return (NSString *)0;
  v3.receiver = self;
  v3.super_class = (Class)AAUIOBCustodianIntroViewModel;
  -[AATrustedContactsCustodianSplashScreenModel secondaryButton](&v3, sel_secondaryButton);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (UIView)secondaryView
{
  return self->_secondaryView;
}

- (void)setSecondaryView:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
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
