@implementation MUDisclosureActionViewModel

- (NSString)titleString
{
  return self->_titleString;
}

- (void)setTitleString:(id)a3
{
  objc_storeStrong((id *)&self->_titleString, a3);
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (id)actionBlock
{
  return self->_actionBlock;
}

- (void)setActionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (UIColor)imageTintColor
{
  return self->_imageTintColor;
}

- (void)setImageTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_imageTintColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageTintColor, 0);
  objc_storeStrong(&self->_actionBlock, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_titleString, 0);
}

@end
