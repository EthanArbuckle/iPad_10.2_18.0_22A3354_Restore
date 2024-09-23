@implementation CMIInferenceNetworkInstanceBindingEspressoV1

- (void)dealloc
{
  __CVBuffer *pixelBuffer;
  objc_super v4;

  pixelBuffer = self->_pixelBuffer;
  if (pixelBuffer)
  {
    CVPixelBufferRelease(pixelBuffer);
    self->_pixelBuffer = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CMIInferenceNetworkInstanceBindingEspressoV1;
  -[CMIInferenceNetworkInstanceBindingEspressoV1 dealloc](&v4, sel_dealloc);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (__CVBuffer)pixelBuffer
{
  return self->_pixelBuffer;
}

- (void)setPixelBuffer:(__CVBuffer *)a3
{
  self->_pixelBuffer = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
