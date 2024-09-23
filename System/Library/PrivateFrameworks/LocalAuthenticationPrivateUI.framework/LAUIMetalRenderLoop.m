@implementation LAUIMetalRenderLoop

- (LAUIMetalRenderLoop)init
{

  return 0;
}

- (LAUIMetalRenderLoop)initWithPixelFormat:(unint64_t)a3 forDevice:(id)a4
{
  MTLPixelFormat v7;
  id v8;
  CGColorSpaceRef default_color_space;
  LAUIMetalRenderLoop *v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  LAUIMetalRenderLoop *v16;
  objc_super v18;

  v8 = a4;
  if (v8
  {
    v18.receiver = self;
    v18.super_class = (Class)LAUIMetalRenderLoop;
    v10 = -[LAUIRenderLoop init](&v18, sel_init);
    v11 = (uint64_t)v10;
    if (v10)
    {
      v10->_pixel_format = a3;
      objc_storeStrong((id *)&v10->_device, a4);
      *(_QWORD *)(v11 + 104) = default_color_space;
      v12 = objc_alloc_init(MEMORY[0x24BDE5708]);
      v13 = *(void **)(v11 + 72);
      *(_QWORD *)(v11 + 72) = v12;

      objc_msgSend(*(id *)(v11 + 72), "setDevice:", *(_QWORD *)(v11 + 112));
      objc_msgSend(*(id *)(v11 + 72), "setPixelFormat:", *(_QWORD *)(v11 + 96));
      objc_msgSend(*(id *)(v11 + 72), "setColorspace:", *(_QWORD *)(v11 + 104));
      objc_msgSend(*(id *)(v11 + 72), "setLowLatency:", 0);
      objc_msgSend(*(id *)(v11 + 72), "drawableSize");
      *(_QWORD *)(v11 + 120) = v14;
      *(_QWORD *)(v11 + 128) = v15;
      -[LAUIRenderLoop _setNeedsForcingPauseUpdate](v11);
    }
    else
    {
      CFRelease(default_color_space);
    }
    self = (LAUIMetalRenderLoop *)(id)v11;
    v16 = self;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (void)dealloc
{
  objc_super v3;

  CGColorSpaceRelease(self->_color_space);
  v3.receiver = self;
  v3.super_class = (Class)LAUIMetalRenderLoop;
  -[LAUIRenderLoop dealloc](&v3, sel_dealloc);
}

- (BOOL)isDrawableAvailable
{
  if (self->super._invalidated)
    return 0;
  if (self->_current_drawable)
    return 1;
  if (!self->super._drawing)
    return 0;
  return -[CAMetalLayer isDrawableAvailable](self->_layer, "isDrawableAvailable");
}

- (id)currentDrawable
{
  CAMetalDrawable *v2;
  CAMetalDrawable *v4;
  CAMetalDrawable *current_drawable;

  if (self->super._invalidated)
  {
    v2 = 0;
  }
  else
  {
    if (self->super._drawing && !self->_current_drawable)
    {
      -[CAMetalLayer nextDrawable](self->_layer, "nextDrawable");
      v4 = (CAMetalDrawable *)objc_claimAutoreleasedReturnValue();
      current_drawable = self->_current_drawable;
      self->_current_drawable = v4;

    }
    v2 = self->_current_drawable;
  }
  return v2;
}

- (CALayer)layer
{
  return (CALayer *)self->_layer;
}

- (BOOL)framebufferOnly
{
  return -[CAMetalLayer framebufferOnly](self->_layer, "framebufferOnly");
}

- (void)setFramebufferOnly:(BOOL)a3
{
  -[CAMetalLayer setFramebufferOnly:](self->_layer, "setFramebufferOnly:", a3);
}

- (void)setDrawableSize:(CGSize)a3
{
  CGSize *p_drawable_size;
  id WeakRetained;

  p_drawable_size = &self->_drawable_size;
  if (self->_drawable_size.width != a3.width || self->_drawable_size.height != a3.height)
  {
    p_drawable_size->width = a3.width;
    self->_drawable_size.height = a3.height;
    if (a3.width == *MEMORY[0x24BDBF148] && a3.height == *(double *)(MEMORY[0x24BDBF148] + 8))
    {
      self->_drawable_size_dirty = 0;
      -[CAMetalLayer setDrawableSize:](self->_layer, "setDrawableSize:");
    }
    else
    {
      self->_drawable_size_dirty = 1;
    }
    -[LAUIRenderLoop _setNeedsForcingPauseUpdate]((uint64_t)self);
    WeakRetained = objc_loadWeakRetained((id *)&self->super._delegate);
    objc_msgSend(WeakRetained, "renderLoop:drawableSizeDidChange:", self, p_drawable_size->width, p_drawable_size->height);

  }
}

- (void)setColorSpace:(CGColorSpace *)a3
{
  CGColorSpace *default_color_space;

  if (a3)
  {
    default_color_space = a3;
    CGColorSpaceRetain(a3);
  }
  else
  {
  }
  CGColorSpaceRelease(self->_color_space);
  self->_color_space = default_color_space;
  -[CAMetalLayer setColorspace:](self->_layer, "setColorspace:", default_color_space);
}

- (void)_didInvalidate
{
  MTLDevice *device;
  CAMetalLayer *layer;
  CAMetalDrawable *current_drawable;
  objc_super v6;

  device = self->_device;
  self->_device = 0;

  layer = self->_layer;
  self->_layer = 0;

  current_drawable = self->_current_drawable;
  self->_current_drawable = 0;

  v6.receiver = self;
  v6.super_class = (Class)LAUIMetalRenderLoop;
  -[LAUIRenderLoop _didInvalidate](&v6, sel__didInvalidate);
}

- (void)_willDraw
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)LAUIMetalRenderLoop;
  -[LAUIRenderLoop _willDraw](&v3, sel__willDraw);
  if (self->_drawable_size_dirty)
  {
    self->_drawable_size_dirty = 0;
    -[CAMetalLayer setDrawableSize:](self->_layer, "setDrawableSize:", self->_drawable_size.width, self->_drawable_size.height);
  }
}

- (void)_didDraw
{
  CAMetalDrawable *current_drawable;
  objc_super v4;

  current_drawable = self->_current_drawable;
  self->_current_drawable = 0;

  v4.receiver = self;
  v4.super_class = (Class)LAUIMetalRenderLoop;
  -[LAUIRenderLoop _didDraw](&v4, sel__didDraw);
}

- (BOOL)_isForcingPause
{
  objc_super v4;

  if (self->_drawable_size.width == *MEMORY[0x24BDBF148]
    && self->_drawable_size.height == *(double *)(MEMORY[0x24BDBF148] + 8))
  {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)LAUIMetalRenderLoop;
  return -[LAUIRenderLoop _isForcingPause](&v4, sel__isForcingPause);
}

- (unint64_t)pixelFormat
{
  return self->_pixel_format;
}

- (CGSize)drawableSize
{
  double width;
  double height;
  CGSize result;

  width = self->_drawable_size.width;
  height = self->_drawable_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGColorSpace)colorSpace
{
  return self->_color_space;
}

- (MTLDevice)device
{
  return self->_device;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_current_drawable, 0);
  objc_storeStrong((id *)&self->_layer, 0);
}

@end
