@implementation _SFBarItemConfiguration

- (void)setHidden:(BOOL)a3
{
  self->_hidden = a3;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (UIMenu)menu
{
  return self->_menu;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (BOOL)hasImage
{
  return self->_hasImage;
}

- (void)setMenu:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (UIImage)image
{
  return self->_image;
}

- (NSString)title
{
  return self->_title;
}

- (_SFBarItemConfiguration)init
{
  _SFBarItemConfiguration *v2;
  _SFBarItemConfiguration *v3;
  _SFBarItemConfiguration *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_SFBarItemConfiguration;
  v2 = -[_SFBarItemConfiguration init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_enabled = 1;
    v4 = v2;
  }

  return v3;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setAttributedTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
  self->_hasImage = 1;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
}

- (NSAttributedString)attributedTitle
{
  return self->_attributedTitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributedTitle, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_menu, 0);
}

@end
