@implementation AAUIOBInheritanceIntroViewModel

- (AAUIOBInheritanceIntroViewModel)init
{
  AAUIOBInheritanceIntroViewModel *v2;
  AAUIOBInheritanceIntroViewModel *v3;
  UIImage *image;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AAUIOBInheritanceIntroViewModel;
  v2 = -[AAUIOBInheritanceIntroViewModel init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    image = v2->_image;
    v2->_image = 0;

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
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (UIView)secondaryView
{
  return self->_secondaryView;
}

- (void)setSecondaryView:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
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
