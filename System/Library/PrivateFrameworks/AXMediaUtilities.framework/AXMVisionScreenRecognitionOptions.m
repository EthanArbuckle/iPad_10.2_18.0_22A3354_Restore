@implementation AXMVisionScreenRecognitionOptions

- (CIImage)testingImage
{
  return self->_testingImage;
}

- (void)setTestingImage:(id)a3
{
  objc_storeStrong((id *)&self->_testingImage, a3);
}

- (BOOL)disableCoagulator
{
  return self->_disableCoagulator;
}

- (void)setDisableCoagulator:(BOOL)a3
{
  self->_disableCoagulator = a3;
}

- (CGRect)fullRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_fullRect.origin.x;
  y = self->_fullRect.origin.y;
  width = self->_fullRect.size.width;
  height = self->_fullRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setFullRect:(CGRect)a3
{
  self->_fullRect = a3;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (void)setOrientation:(int64_t)a3
{
  self->_orientation = a3;
}

- (BOOL)isRTL
{
  return self->_isRTL;
}

- (void)setIsRTL:(BOOL)a3
{
  self->_isRTL = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testingImage, 0);
}

@end
