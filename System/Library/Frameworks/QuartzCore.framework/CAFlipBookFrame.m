@implementation CAFlipBookFrame

- (id)_initWithPresentationTime:(unint64_t)a3 frameId:(unint64_t)a4 generation:(unsigned int)a5 apl:(float)a6 aplDimming:(float)a7 memoryUsage:(unint64_t)a8 inverted:(BOOL)a9 userInfo:(id)a10
{
  char *v18;
  void *v19;
  __int128 v20;
  objc_super v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v22.receiver = self;
  v22.super_class = (Class)CAFlipBookFrame;
  v18 = -[CAFlipBookFrame init](&v22, sel_init);
  v19 = v18;
  if (v18)
  {
    *((_QWORD *)v18 + 1) = a3;
    *((_QWORD *)v18 + 2) = a4;
    *((_DWORD *)v18 + 6) = a5;
    *((float *)v18 + 7) = a6;
    *((float *)v18 + 8) = a7;
    *((_QWORD *)v18 + 5) = a8;
    *((_QWORD *)v18 + 6) = 0;
    v20 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
    *(_OWORD *)(v18 + 56) = *MEMORY[0x1E0C9D628];
    *(_OWORD *)(v18 + 72) = v20;
    *((_QWORD *)v18 + 11) = 0;
    v18[104] = a9;
    *((_QWORD *)v18 + 12) = a10;
  }
  return v19;
}

- (void)dealloc
{
  __IOSurface *rawSurface;
  __IOSurface *surface;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  rawSurface = self->_rawSurface;
  if (rawSurface)
  {
    CFRelease(rawSurface);
    self->_rawSurface = 0;
  }
  surface = self->_surface;
  if (surface)
  {
    CFRelease(surface);
    self->_surface = 0;
  }

  self->_userInfo = 0;
  v5.receiver = self;
  v5.super_class = (Class)CAFlipBookFrame;
  -[CAFlipBookFrame dealloc](&v5, sel_dealloc);
}

- (unint64_t)presentationTime
{
  return self->_presentationTime;
}

- (unint64_t)frameId
{
  return self->_frameId;
}

- (unsigned)generation
{
  return self->_generation;
}

- (float)apl
{
  return self->_apl;
}

- (float)aplDimming
{
  return self->_aplDimming;
}

- (unint64_t)memoryUsage
{
  return self->_memoryUsage;
}

- (void)setRawSurface:(__IOSurface *)a3
{
  __IOSurface *rawSurface;

  rawSurface = self->_rawSurface;
  if (rawSurface != a3)
  {
    if (rawSurface)
      CFRelease(rawSurface);
    self->_rawSurface = 0;
    if (a3)
      self->_rawSurface = (__IOSurface *)CFRetain(a3);
  }
}

- (__IOSurface)rawSurface
{
  return self->_rawSurface;
}

- (void)setRawSurfaceFrame:(CGRect)a3
{
  self->_rawSurfaceFrame = a3;
}

- (CGRect)rawSurfaceFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_rawSurfaceFrame.origin.x;
  y = self->_rawSurfaceFrame.origin.y;
  width = self->_rawSurfaceFrame.size.width;
  height = self->_rawSurfaceFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setSurface:(__IOSurface *)a3
{
  __IOSurface *surface;

  surface = self->_surface;
  if (surface != a3)
  {
    if (surface)
      CFRelease(surface);
    self->_surface = 0;
    if (a3)
      self->_surface = (__IOSurface *)CFRetain(a3);
  }
}

- (__IOSurface)surface
{
  return self->_surface;
}

- (id)userInfo
{
  return self->_userInfo;
}

- (void)releaseSurface
{
  -[CAFlipBookFrame setSurface:](self, "setSurface:", 0);
}

- (BOOL)isInverted
{
  return self->_inverted;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<CAFlipBookFrame: time %llu, id %llu, generation %u, userInfo %p>"), self->_presentationTime, self->_frameId, self->_generation, self->_userInfo);
}

@end
