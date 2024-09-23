@implementation FigIOSurfaceData

+ (void)initialize
{
  objc_opt_class();
}

+ (id)dataWithIOSurface:(__IOSurface *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithIOSurface:", a3);
}

+ (id)dataWithIOSurface:(__IOSurface *)a3 length:(unint64_t)a4
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithIOSurface:length:", a3, a4);
}

- (FigIOSurfaceData)initWithIOSurface:(__IOSurface *)a3
{
  return -[FigIOSurfaceData initWithIOSurface:length:](self, "initWithIOSurface:length:", a3, 0);
}

- (FigIOSurfaceData)initWithIOSurface:(__IOSurface *)a3 length:(unint64_t)a4
{
  FigIOSurfaceData *v6;
  __IOSurface *v7;
  size_t AllocSize;
  unint64_t v10;
  objc_super v12;

  if (a3)
  {
    v12.receiver = self;
    v12.super_class = (Class)FigIOSurfaceData;
    v6 = -[FigIOSurfaceData init](&v12, sel_init);
    if (v6)
    {
      v7 = (__IOSurface *)CFRetain(a3);
      v6->_surface = v7;
      AllocSize = IOSurfaceGetAllocSize(v7);
      if (AllocSize <= a4 || a4 == 0)
        v10 = AllocSize;
      else
        v10 = a4;
      v6->_length = v10;
    }
  }
  else
  {

    return 0;
  }
  return v6;
}

- (unint64_t)length
{
  return self->_length;
}

- (const)bytes
{
  const void *result;

  result = self->_bytes;
  if (!result)
  {
    IOSurfaceLock(self->_surface, 1u, 0);
    result = IOSurfaceGetBaseAddress(self->_surface);
    self->_bytes = result;
  }
  return result;
}

- (void)dealloc
{
  __IOSurface *surface;
  objc_super v4;

  surface = self->_surface;
  if (surface)
  {
    if (self->_bytes)
    {
      IOSurfaceUnlock(surface, 1u, 0);
      self->_bytes = 0;
      surface = self->_surface;
    }
    CFRelease(surface);
  }
  v4.receiver = self;
  v4.super_class = (Class)FigIOSurfaceData;
  -[FigIOSurfaceData dealloc](&v4, sel_dealloc);
}

@end
