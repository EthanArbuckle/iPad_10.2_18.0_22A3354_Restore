@implementation BWTrackedSurface

- (BWTrackedSurface)initWithSurface:(__IOSurface *)a3 handler:(id)a4
{
  BWTrackedSurface *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BWTrackedSurface;
  v6 = -[BWTrackedSurface init](&v8, sel_init);
  if (v6)
  {
    v6->_surface = (__IOSurface *)CFRetain(a3);
    v6->_handler = (id)objc_msgSend(a4, "copy");
  }
  return v6;
}

- (void)dealloc
{
  __IOSurface *surface;
  objc_super v4;

  surface = self->_surface;
  if (surface)
    CFRelease(surface);

  v4.receiver = self;
  v4.super_class = (Class)BWTrackedSurface;
  -[BWTrackedSurface dealloc](&v4, sel_dealloc);
}

- (__IOSurface)surface
{
  return self->_surface;
}

- (id)handler
{
  return self->_handler;
}

- (int)clientUseCount
{
  return self->_clientUseCount;
}

- (void)setClientUseCount:(int)a3
{
  self->_clientUseCount = a3;
}

- (BOOL)owningPixelBufferDeallocated
{
  return self->_owningPixelBufferDeallocated;
}

- (void)setOwningPixelBufferDeallocated:(BOOL)a3
{
  self->_owningPixelBufferDeallocated = a3;
}

@end
