@implementation NUSurfaceRenderRequest

- (id)newRenderJob
{
  return -[NUImageRenderJob initWithImageRequest:]([NUSurfaceRenderJob alloc], "initWithImageRequest:", self);
}

@end
