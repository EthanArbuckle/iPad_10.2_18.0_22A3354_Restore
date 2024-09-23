@implementation EKRecentContactWithImage

- (CRRecentContact)recent
{
  return self->_recent;
}

- (void)setRecent:(id)a3
{
  objc_storeStrong((id *)&self->_recent, a3);
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_recent, 0);
}

@end
