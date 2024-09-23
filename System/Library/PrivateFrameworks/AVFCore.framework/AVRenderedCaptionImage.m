@implementation AVRenderedCaptionImage

- (AVRenderedCaptionImage)initWithPixelBuffer:(__CVBuffer *)a3 atPosition:(CGPoint)a4
{
  CGFloat y;
  CGFloat x;
  AVRenderedCaptionImage *v7;
  AVRenderedCaptionImage *v8;
  objc_super v10;

  y = a4.y;
  x = a4.x;
  v10.receiver = self;
  v10.super_class = (Class)AVRenderedCaptionImage;
  v7 = -[AVRenderedCaptionImage init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_position.x = x;
    v7->_position.y = y;
    v7->_pixelBuffer = CVPixelBufferRetain(a3);
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  CVPixelBufferRelease(self->_pixelBuffer);
  v3.receiver = self;
  v3.super_class = (Class)AVRenderedCaptionImage;
  -[AVRenderedCaptionImage dealloc](&v3, sel_dealloc);
}

- (__CVBuffer)pixelBuffer
{
  return self->_pixelBuffer;
}

- (CGPoint)position
{
  double x;
  double y;
  CGPoint result;

  x = self->_position.x;
  y = self->_position.y;
  result.y = y;
  result.x = x;
  return result;
}

@end
