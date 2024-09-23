@implementation JFXExternalImageData

- (void)setPixelBuffer:(__CVBuffer *)a3
{
  __CVBuffer *pixelBuffer;

  pixelBuffer = self->_pixelBuffer;
  self->_pixelBuffer = CVPixelBufferRetain(a3);
  CVPixelBufferRelease(pixelBuffer);
}

- (void)dealloc
{
  objc_super v3;

  CVPixelBufferRelease(self->_pixelBuffer);
  v3.receiver = self;
  v3.super_class = (Class)JFXExternalImageData;
  -[JFXExternalImageData dealloc](&v3, sel_dealloc);
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (__n128)cameraIntrinsics
{
  return a1[6];
}

- (__n128)setCameraIntrinsics:(__n128)a3
{
  result[6] = a2;
  result[7] = a3;
  result[8] = a4;
  return result;
}

- (__CVBuffer)pixelBuffer
{
  return self->_pixelBuffer;
}

- (int64_t)cameraPosition
{
  return self->_cameraPosition;
}

- (void)setCameraPosition:(int64_t)a3
{
  self->_cameraPosition = a3;
}

- (int64_t)captureFramesPerSecond
{
  return self->_captureFramesPerSecond;
}

- (void)setCaptureFramesPerSecond:(int64_t)a3
{
  self->_captureFramesPerSecond = a3;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (void)setOrientation:(int64_t)a3
{
  self->_orientation = a3;
}

- (BOOL)hasValidFaceData
{
  return self->_hasValidFaceData;
}

- (void)setHasValidFaceData:(BOOL)a3
{
  self->_hasValidFaceData = a3;
}

- (BOOL)requiresFaceTracking
{
  return self->_requiresFaceTracking;
}

- (void)setRequiresFaceTracking:(BOOL)a3
{
  self->_requiresFaceTracking = a3;
}

- (CGRect)normalizedFaceRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_normalizedFaceRect.origin.x;
  y = self->_normalizedFaceRect.origin.y;
  width = self->_normalizedFaceRect.size.width;
  height = self->_normalizedFaceRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setNormalizedFaceRect:(CGRect)a3
{
  self->_normalizedFaceRect = a3;
}

- (double)rollAngle
{
  return self->_rollAngle;
}

- (void)setRollAngle:(double)a3
{
  self->_rollAngle = a3;
}

@end
