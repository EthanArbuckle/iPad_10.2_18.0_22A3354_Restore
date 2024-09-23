@implementation MTKOffscreenDrawable

- (MTKOffscreenDrawable)initWithDevice:(id)a3 pixelFormat:(unint64_t)a4 size:(CGSize)a5 drawableID:(unint64_t)a6
{
  CGFloat height;
  CGFloat width;
  id v12;
  MTKOffscreenDrawable *v13;
  MTKOffscreenDrawable *v14;
  objc_super v16;

  height = a5.height;
  width = a5.width;
  v12 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MTKOffscreenDrawable;
  v13 = -[MTKOffscreenDrawable init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_textureDirty = 1;
    v13->_size.width = width;
    v13->_size.height = height;
    v13->_pixelFormat = a4;
    objc_storeStrong((id *)&v13->_device, a3);
    v14->_drawableID = a6;
  }

  return v14;
}

- (void)present
{
  self->_presentedTime = CACurrentMediaTime() + 0.0166666667;
}

- (void)presentAfterMinimumDuration:(double)a3
{
  self->_presentedTime = CACurrentMediaTime() + a3;
}

- (void)presentAtTime:(double)a3
{
  self->_presentedTime = a3;
}

- (MTLTexture)texture
{
  void *v3;
  MTLTexture *v4;
  MTLTexture *texture;

  if (self->_textureDirty)
  {
    objc_msgSend(MEMORY[0x24BDDD740], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", self->_pixelFormat, (unint64_t)self->_size.width, (unint64_t)self->_size.height, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setUsage:", 5);
    objc_msgSend(v3, "setStorageMode:", 2);
    if (self->_size.width != 0.0 && self->_size.height != 0.0 && self->_pixelFormat)
    {
      v4 = (MTLTexture *)-[MTLDevice newTextureWithDescriptor:](self->_device, "newTextureWithDescriptor:", v3);
      texture = self->_texture;
      self->_texture = v4;

      self->_textureDirty = 0;
    }

  }
  return self->_texture;
}

- (void)setPixelFormat:(unint64_t)a3
{
  if (self->_pixelFormat != a3)
  {
    self->_pixelFormat = a3;
    self->_textureDirty = 1;
  }
}

- (unint64_t)pixelFormat
{
  return self->_pixelFormat;
}

- (void)setDevice:(id)a3
{
  MTLDevice *v5;
  MTLDevice *v6;

  v5 = (MTLDevice *)a3;
  if (self->_device != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_device, a3);
    v5 = v6;
    self->_textureDirty = 1;
  }

}

- (void)setSize:(CGSize)a3
{
  if (self->_size.width != a3.width || self->_size.height != a3.height)
  {
    self->_size = a3;
    self->_textureDirty = 1;
  }
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)addPresentedHandler:(id)a3
{
  (*((void (**)(id, MTKOffscreenDrawable *))a3 + 2))(a3, self);
}

- (CAMetalLayer)layer
{
  return (CAMetalLayer *)objc_getProperty(self, a2, 48, 1);
}

- (double)presentedTime
{
  return self->_presentedTime;
}

- (unint64_t)drawableID
{
  return self->_drawableID;
}

- (MTLDevice)device
{
  return self->_device;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_layer, 0);
  objc_storeStrong((id *)&self->_texture, 0);
}

@end
