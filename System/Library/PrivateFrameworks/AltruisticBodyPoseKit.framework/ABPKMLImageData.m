@implementation ABPKMLImageData

- (ABPKMLImageData)initWithPixelBuffer:(__CVBuffer *)a3 timestamp:(double)a4 abpkDeviceOrientation:(int64_t)a5 preprocessingParameters:(id)a6
{
  id v11;
  ABPKMLImageData *v12;
  objc_super v14;

  v11 = a6;
  v14.receiver = self;
  v14.super_class = (Class)ABPKMLImageData;
  v12 = -[ABPKMLImageData init](&v14, sel_init);
  if (v12)
  {
    v12->_pixelBuffer = CVPixelBufferRetain(a3);
    v12->_timestamp = a4;
    v12->_abpkDeviceOrientation = a5;
    objc_storeStrong((id *)&v12->_preprocessingParams, a6);
  }

  return v12;
}

- (void)dealloc
{
  objc_super v3;

  CVPixelBufferRelease(self->_pixelBuffer);
  v3.receiver = self;
  v3.super_class = (Class)ABPKMLImageData;
  -[ABPKMLImageData dealloc](&v3, sel_dealloc);
}

- (__CVBuffer)pixelBuffer
{
  return self->_pixelBuffer;
}

- (void)setPixelBuffer:(__CVBuffer *)a3
{
  self->_pixelBuffer = a3;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (ABPKImagePreProcessingParams)preprocessingParams
{
  return self->_preprocessingParams;
}

- (void)setPreprocessingParams:(id)a3
{
  objc_storeStrong((id *)&self->_preprocessingParams, a3);
}

- (int64_t)abpkDeviceOrientation
{
  return self->_abpkDeviceOrientation;
}

- (void)setAbpkDeviceOrientation:(int64_t)a3
{
  self->_abpkDeviceOrientation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preprocessingParams, 0);
}

@end
