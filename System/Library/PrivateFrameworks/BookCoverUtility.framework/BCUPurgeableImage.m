@implementation BCUPurgeableImage

- (BCUPurgeableImage)initWithImage:(CGImage *)a3 surface:(__IOSurface *)a4 contentsScale:(double)a5
{
  BCUPurgeableImage *v8;
  BCUPurgeableImage *v9;
  double v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)BCUPurgeableImage;
  v8 = -[BCUPurgeableImage init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    v10 = 1.0;
    if (a5 != 0.0)
      v10 = a5;
    v8->_contentsScale = v10;
    v8->_image = CGImageRetain(a3);
    v9->_surface = a4;
    if (a4)
      CFRetain(a4);
  }
  return v9;
}

- (void)dealloc
{
  __IOSurface *surface;
  objc_super v4;

  surface = self->_surface;
  if (surface)
    CFRelease(surface);
  CGImageRelease(self->_image);
  v4.receiver = self;
  v4.super_class = (Class)BCUPurgeableImage;
  -[BCUPurgeableImage dealloc](&v4, sel_dealloc);
}

- (CGSize)size
{
  CGImage *image;
  double v4;
  double v5;
  double v6;
  CGSize result;

  image = self->_image;
  if (image)
  {
    v4 = (double)CGImageGetWidth(image) / self->_contentsScale;
    v5 = (double)CGImageGetHeight(self->_image) / self->_contentsScale;
  }
  else
  {
    v4 = *MEMORY[0x24BDBF148];
    v5 = *(double *)(MEMORY[0x24BDBF148] + 8);
  }
  v6 = v4;
  result.height = v5;
  result.width = v6;
  return result;
}

- (id)layerContents
{
  return self->_image;
}

- (CGImage)CGImage
{
  CGImage *result;
  CGImageRef v3;

  result = self->_image;
  if (result)
  {
    v3 = CGImageRetain(result);
    return (CGImage *)CFAutorelease(v3);
  }
  return result;
}

- (BOOL)markAsVolatile
{
  __IOSurface *surface;

  surface = self->_surface;
  if (surface)
    IOSurfaceSetPurgeable(self->_surface, 1u, 0);
  return surface != 0;
}

- (BOOL)markAsNonVolatile
{
  __IOSurface *surface;
  uint32_t oldState;

  surface = self->_surface;
  if (!surface)
    return 1;
  oldState = 0;
  IOSurfaceSetPurgeable(surface, 0, &oldState);
  return oldState != 2;
}

- (double)contentsScale
{
  return self->_contentsScale;
}

@end
