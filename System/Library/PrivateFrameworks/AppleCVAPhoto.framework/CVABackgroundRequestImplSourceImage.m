@implementation CVABackgroundRequestImplSourceImage

- (__CVBuffer)sourceColorPixelBuffer
{
  return self->_sourceColorPixelBuffer;
}

- (void)setSourceColorPixelBuffer:(__CVBuffer *)a3
{
  self->_sourceColorPixelBuffer = a3;
}

@end
