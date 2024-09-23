@implementation ARFrameLuminanceManager

- (ARFrameLuminanceManager)init
{
  ARFrameLuminanceManager *v2;
  ARFrameLuminanceManager *v3;
  ARFrameLuminanceManager *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ARFrameLuminanceManager;
  v2 = -[ARFrameLuminanceManager init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lastComputedLuminance = 0.0;
    v2->_currentFrameId = 0;
    v4 = v2;
  }

  return v3;
}

- (double)computeLuminanceFromPixelBuffer:(__CVBuffer *)a3
{
  unint64_t v4;
  size_t BytesPerRowOfPlane;
  size_t WidthOfPlane;
  size_t HeightOfPlane;
  unsigned __int8 *BaseAddressOfPlane;
  size_t v10;
  unint64_t v11;
  unint64_t v12;
  size_t i;
  double result;

  v4 = self->_currentFrameId + 1;
  self->_currentFrameId = v4;
  if ((v4 & 3) != 1)
    return self->_lastComputedLuminance;
  BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a3, 0);
  WidthOfPlane = CVPixelBufferGetWidthOfPlane(a3, 0);
  HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, 0);
  CVPixelBufferLockBaseAddress(a3, 0);
  BaseAddressOfPlane = (unsigned __int8 *)CVPixelBufferGetBaseAddressOfPlane(a3, 0);
  if (HeightOfPlane)
  {
    v10 = 0;
    v11 = 0;
    v12 = 0;
    do
    {
      if (WidthOfPlane)
      {
        for (i = 0; i < WidthOfPlane; i += 4)
          v12 += BaseAddressOfPlane[i];
        v11 += ((WidthOfPlane - 1) >> 2) + 1;
      }
      v10 += 4;
      BaseAddressOfPlane += 4 * BytesPerRowOfPlane;
    }
    while (v10 < HeightOfPlane);
  }
  else
  {
    v12 = 0;
    v11 = 0;
  }
  CVPixelBufferUnlockBaseAddress(a3, 0);
  result = (double)v12 / (double)v11;
  self->_lastComputedLuminance = result;
  return result;
}

- (double)lastComputedLuminance
{
  return self->_lastComputedLuminance;
}

- (void)setLastComputedLuminance:(double)a3
{
  self->_lastComputedLuminance = a3;
}

- (unint64_t)currentFrameId
{
  return self->_currentFrameId;
}

- (void)setCurrentFrameId:(unint64_t)a3
{
  self->_currentFrameId = a3;
}

@end
