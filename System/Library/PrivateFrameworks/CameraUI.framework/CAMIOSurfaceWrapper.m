@implementation CAMIOSurfaceWrapper

- (CAMIOSurfaceWrapper)initWithIOSurface:(void *)a3
{
  CAMIOSurfaceWrapper *v4;
  CAMIOSurfaceWrapper *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CAMIOSurfaceWrapper;
  v4 = -[CAMIOSurfaceWrapper init](&v7, sel_init);
  if (v4)
  {
    if (a3)
      v4->_surface = (void *)CFRetain(a3);
    v5 = v4;
  }

  return v4;
}

- (void)dealloc
{
  void *surface;
  objc_super v4;

  surface = self->_surface;
  if (surface)
    CFRelease(surface);
  v4.receiver = self;
  v4.super_class = (Class)CAMIOSurfaceWrapper;
  -[CAMIOSurfaceWrapper dealloc](&v4, sel_dealloc);
}

- (void)surface
{
  return self->_surface;
}

@end
