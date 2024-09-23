@implementation ARMLImageDownScalingResult

- (ARMLImageDownScalingResult)initWithPixelBuffer:(__CVBuffer *)a3 regionOfInterest:(CGSize)a4 cropRegion:(CGRect)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v9;
  CGFloat v10;
  ARMLImageDownScalingResult *v12;
  ARMLImageDownScalingResult *v13;
  objc_super v15;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v9 = a4.height;
  v10 = a4.width;
  v15.receiver = self;
  v15.super_class = (Class)ARMLImageDownScalingResult;
  v12 = -[ARMLImageDownScalingResult init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    -[ARMLImageDownScalingResult setPixelBuffer:](v12, "setPixelBuffer:", a3);
    v13->_regionOfInterest.width = v10;
    v13->_regionOfInterest.height = v9;
    v13->_cropRegion.origin.x = x;
    v13->_cropRegion.origin.y = y;
    v13->_cropRegion.size.width = width;
    v13->_cropRegion.size.height = height;
  }
  return v13;
}

- (void)dealloc
{
  __CVBuffer *undistortedPixelBuffer;
  objc_super v4;

  CVPixelBufferRelease(self->_pixelBuffer);
  undistortedPixelBuffer = self->_undistortedPixelBuffer;
  if (undistortedPixelBuffer)
    CVPixelBufferRelease(undistortedPixelBuffer);
  v4.receiver = self;
  v4.super_class = (Class)ARMLImageDownScalingResult;
  -[ARMLImageDownScalingResult dealloc](&v4, sel_dealloc);
}

- (void)setPixelBuffer:(__CVBuffer *)a3
{
  __CVBuffer *pixelBuffer;

  pixelBuffer = self->_pixelBuffer;
  if (pixelBuffer != a3)
  {
    CVPixelBufferRelease(pixelBuffer);
    self->_pixelBuffer = a3;
    CVPixelBufferRetain(a3);
  }
}

- (void)setUndistortedPixelBuffer:(__CVBuffer *)a3
{
  __CVBuffer *undistortedPixelBuffer;

  undistortedPixelBuffer = self->_undistortedPixelBuffer;
  if (undistortedPixelBuffer != a3)
  {
    CVPixelBufferRelease(undistortedPixelBuffer);
    self->_undistortedPixelBuffer = a3;
    CVPixelBufferRetain(a3);
  }
}

- (CGSize)imageResolution
{
  __CVBuffer *pixelBuffer;
  double Width;
  double Height;
  double v5;
  CGSize result;

  pixelBuffer = self->_pixelBuffer;
  if (pixelBuffer)
  {
    Width = (double)CVPixelBufferGetWidth(self->_pixelBuffer);
    Height = (double)CVPixelBufferGetHeight(pixelBuffer);
  }
  else
  {
    Width = *MEMORY[0x1E0C9D820];
    Height = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  v5 = Width;
  result.height = Height;
  result.width = v5;
  return result;
}

- (__CVBuffer)pixelBuffer
{
  return self->_pixelBuffer;
}

- (CGSize)regionOfInterest
{
  double width;
  double height;
  CGSize result;

  width = self->_regionOfInterest.width;
  height = self->_regionOfInterest.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGRect)cropRegion
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_cropRegion.origin.x;
  y = self->_cropRegion.origin.y;
  width = self->_cropRegion.size.width;
  height = self->_cropRegion.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (__CVBuffer)undistortedPixelBuffer
{
  return self->_undistortedPixelBuffer;
}

@end
