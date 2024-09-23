@implementation AVCacheLargestInscribedRectInBoundingPathValue

- (AVCacheLargestInscribedRectInBoundingPathValue)initWithLargestInscribedRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  AVCacheLargestInscribedRectInBoundingPathValue *v7;
  AVCacheLargestInscribedRectInBoundingPathValue *v8;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)AVCacheLargestInscribedRectInBoundingPathValue;
  v7 = -[AVCacheLargestInscribedRectInBoundingPathValue init](&v10, sel_init);
  v8 = v7;
  if (v7)
    -[AVCacheLargestInscribedRectInBoundingPathValue setLargestInscribedRect:](v7, "setLargestInscribedRect:", x, y, width, height);
  return v8;
}

- (CGRect)largestInscribedRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_largestInscribedRect.origin.x;
  y = self->_largestInscribedRect.origin.y;
  width = self->_largestInscribedRect.size.width;
  height = self->_largestInscribedRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setLargestInscribedRect:(CGRect)a3
{
  self->_largestInscribedRect = a3;
}

@end
