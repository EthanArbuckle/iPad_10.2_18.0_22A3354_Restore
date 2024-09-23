@implementation NUImageBufferRenderRequest

- (id)newRenderJob
{
  return -[NUImageRenderJob initWithImageRequest:]([NUImageBufferRenderJob alloc], "initWithImageRequest:", self);
}

@end
