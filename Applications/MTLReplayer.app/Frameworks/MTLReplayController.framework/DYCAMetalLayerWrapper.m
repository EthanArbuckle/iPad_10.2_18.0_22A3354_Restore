@implementation DYCAMetalLayerWrapper

- (DYCAMetalLayerWrapper)init
{
  DYCAMetalLayerWrapper *v2;
  CAMetalLayer *v3;
  CAMetalLayer *layer;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DYCAMetalLayerWrapper;
  v2 = -[DYCAMetalLayerWrapper init](&v6, "init");
  if (v2)
  {
    v3 = (CAMetalLayer *)objc_alloc_init((Class)CAMetalLayer);
    layer = v2->_layer;
    v2->_layer = v3;

  }
  return v2;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  return self->_layer;
}

- (id)nextDrawable
{
  return -[CAMetalLayer nextDrawable](self->_layer, "nextDrawable");
}

- (id)nextDrawableWithTextureResourceIndex:(unint64_t)a3
{
  MTLPixelFormat v5;
  double v6;
  unint64_t v7;
  double v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  DYMetalDrawable *v16;

  v5 = -[CAMetalLayer pixelFormat](self->_layer, "pixelFormat");
  -[CAMetalLayer drawableSize](self->_layer, "drawableSize");
  v7 = (unint64_t)(v6 + 0.5);
  -[CAMetalLayer drawableSize](self->_layer, "drawableSize");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MTLTextureDescriptor texture2DDescriptorWithPixelFormat:width:height:mipmapped:](MTLTextureDescriptor, "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", v5, v7, (unint64_t)(v8 + 0.5), 0));
  if (-[CAMetalLayer framebufferOnly](self->_layer, "framebufferOnly"))
    v10 = 4;
  else
    v10 = 0;
  objc_msgSend(v9, "setUsage:", v10);
  objc_msgSend(v9, "setResourceIndex:", a3);
  objc_msgSend(v9, "setForceResourceIndex:", 1);
  objc_msgSend(v9, "setIsDrawable:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CAMetalLayer nextDrawable](self->_layer, "nextDrawable"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "texture"));
  v13 = objc_msgSend(v12, "iosurface");

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CAMetalLayer device](self->_layer, "device"));
  v15 = objc_msgSend(v14, "newTextureWithDescriptor:iosurface:plane:", v9, v13, 0);

  objc_msgSend(v15, "setLabel:", CFSTR("CAMetalLayer Drawable"));
  v16 = -[DYMetalDrawable initWithTexture:]([DYMetalDrawable alloc], "initWithTexture:", v15);

  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layer, 0);
}

@end
