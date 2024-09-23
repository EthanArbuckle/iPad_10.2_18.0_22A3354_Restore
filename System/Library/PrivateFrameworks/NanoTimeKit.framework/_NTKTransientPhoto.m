@implementation _NTKTransientPhoto

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (CGRect)originalCrop
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_originalCrop.origin.x;
  y = self->_originalCrop.origin.y;
  width = self->_originalCrop.size.width;
  height = self->_originalCrop.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setOriginalCrop:(CGRect)a3
{
  self->_originalCrop = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
}

@end
