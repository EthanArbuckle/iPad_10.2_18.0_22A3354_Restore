@implementation CVAPortraitGenericRequestCubeImpl

- (void)dealloc
{
  objc_super v3;

  CVPixelBufferRelease(self->_sourceColorPixelBuffer);
  v3.receiver = self;
  v3.super_class = (Class)CVAPortraitGenericRequestCubeImpl;
  -[CVAPortraitGenericRequestCubeImpl dealloc](&v3, sel_dealloc);
}

- (CVAPortraitVideoPipeline)portraitVideoPipeline
{
  return (CVAPortraitVideoPipeline *)objc_getProperty(self, a2, 8, 1);
}

- (void)setPortraitVideoPipeline:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (__CVBuffer)sourceColorPixelBuffer
{
  return self->_sourceColorPixelBuffer;
}

- (void)setSourceColorPixelBuffer:(__CVBuffer *)a3
{
  self->_sourceColorPixelBuffer = a3;
}

- (NSData)cubeData
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCubeData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cubeData, 0);
  objc_storeStrong((id *)&self->_portraitVideoPipeline, 0);
}

@end
