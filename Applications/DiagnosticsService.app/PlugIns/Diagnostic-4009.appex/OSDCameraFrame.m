@implementation OSDCameraFrame

- (void)setBuffer:(__CVBuffer *)a3
{
  __CVBuffer *buffer;

  buffer = self->_buffer;
  if (buffer)
  {
    CVPixelBufferRelease(buffer);
    self->_buffer = 0;
  }
  if (a3)
  {
    CVPixelBufferRetain(a3);
    self->_buffer = a3;
  }
}

- (void)dealloc
{
  __CVBuffer *buffer;
  objc_super v4;

  buffer = self->_buffer;
  if (buffer)
    CVPixelBufferRelease(buffer);
  v4.receiver = self;
  v4.super_class = (Class)OSDCameraFrame;
  -[OSDCameraFrame dealloc](&v4, "dealloc");
}

- (__CVBuffer)buffer
{
  return self->_buffer;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
}

@end
