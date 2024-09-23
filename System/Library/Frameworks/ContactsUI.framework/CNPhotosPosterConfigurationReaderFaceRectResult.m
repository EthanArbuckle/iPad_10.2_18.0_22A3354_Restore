@implementation CNPhotosPosterConfigurationReaderFaceRectResult

- (double)percentFromTop
{
  return self->_percentFromTop;
}

- (void)setPercentFromTop:(double)a3
{
  self->_percentFromTop = a3;
}

- (CGRect)faceRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_faceRect.origin.x;
  y = self->_faceRect.origin.y;
  width = self->_faceRect.size.width;
  height = self->_faceRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setFaceRect:(CGRect)a3
{
  self->_faceRect = a3;
}

@end
