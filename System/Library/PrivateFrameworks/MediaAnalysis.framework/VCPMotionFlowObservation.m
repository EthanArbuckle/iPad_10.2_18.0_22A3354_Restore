@implementation VCPMotionFlowObservation

- (void)dealloc
{
  __CVBuffer *pixelBuffer;
  objc_super v4;

  pixelBuffer = self->_pixelBuffer;
  if (pixelBuffer)
    CFRelease(pixelBuffer);
  v4.receiver = self;
  v4.super_class = (Class)VCPMotionFlowObservation;
  -[VCPMotionFlowObservation dealloc](&v4, sel_dealloc);
}

- (__CVBuffer)pixelBuffer
{
  return self->_pixelBuffer;
}

- (void)setPixelBuffer:(__CVBuffer *)a3
{
  self->_pixelBuffer = a3;
}

- (int)revision
{
  return self->_revision;
}

- (void)setRevision:(int)a3
{
  self->_revision = a3;
}

@end
