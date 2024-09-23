@implementation AMSUIMessageRequest

- (UIImage)iconImage
{
  return self->_iconImage;
}

- (void)setIconImage:(id)a3
{
  objc_storeStrong((id *)&self->_iconImage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconImage, 0);
}

@end
