@implementation MTLTextureDescriptor

+ (MTLTextureDescriptor)texture2DDescriptorWithPixelFormat:(MTLPixelFormat)pixelFormat width:(NSUInteger)width height:(NSUInteger)height mipmapped:(BOOL)mipmapped
{
  _BOOL4 v6;
  MTLTextureDescriptorInternal *v10;
  MTLTextureDescriptor *p_super;
  NSUInteger v12;
  unint64_t v13;
  uint64_t v14;

  v6 = mipmapped;
  v10 = objc_alloc_init(MTLTextureDescriptorInternal);
  p_super = &v10->super;
  if (v10)
  {
    -[MTLTextureDescriptorInternal setTextureType:](v10, "setTextureType:", 2);
    -[MTLTextureDescriptor setPixelFormat:](p_super, "setPixelFormat:", pixelFormat);
    -[MTLTextureDescriptor setWidth:](p_super, "setWidth:", width);
    -[MTLTextureDescriptor setHeight:](p_super, "setHeight:", height);
    if (width <= height)
      v12 = height;
    else
      v12 = width;
    v13 = 64 - __clz(v12);
    if (v6)
      v14 = v13;
    else
      v14 = 1;
    -[MTLTextureDescriptor setMipmapLevelCount:](p_super, "setMipmapLevelCount:", v14);
  }
  return p_super;
}

+ (MTLTextureDescriptor)allocWithZone:(_NSZone *)a3
{
  objc_super v6;

  if ((id)objc_opt_class() == a1)
    return (MTLTextureDescriptor *)+[MTLTextureDescriptor allocWithZone:](MTLTextureDescriptorInternal, "allocWithZone:", a3);
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___MTLTextureDescriptor;
  return (MTLTextureDescriptor *)objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return 0;
}

+ (MTLTextureDescriptor)textureCubeDescriptorWithPixelFormat:(MTLPixelFormat)pixelFormat size:(NSUInteger)size mipmapped:(BOOL)mipmapped
{
  _BOOL4 v5;
  MTLTextureDescriptorInternal *v8;
  MTLTextureDescriptor *p_super;
  unint64_t v10;
  uint64_t v11;

  v5 = mipmapped;
  v8 = objc_alloc_init(MTLTextureDescriptorInternal);
  p_super = &v8->super;
  if (v8)
  {
    -[MTLTextureDescriptorInternal setTextureType:](v8, "setTextureType:", 5);
    -[MTLTextureDescriptor setPixelFormat:](p_super, "setPixelFormat:", pixelFormat);
    -[MTLTextureDescriptor setWidth:](p_super, "setWidth:", size);
    -[MTLTextureDescriptor setHeight:](p_super, "setHeight:", size);
    v10 = 64 - __clz(size);
    if (v5)
      v11 = v10;
    else
      v11 = 1;
    -[MTLTextureDescriptor setMipmapLevelCount:](p_super, "setMipmapLevelCount:", v11);
  }
  return p_super;
}

+ (MTLTextureDescriptor)textureBufferDescriptorWithPixelFormat:(MTLPixelFormat)pixelFormat width:(NSUInteger)width resourceOptions:(MTLResourceOptions)resourceOptions usage:(MTLTextureUsage)usage
{
  MTLTextureDescriptorInternal *v10;
  MTLTextureDescriptor *p_super;

  v10 = objc_alloc_init(MTLTextureDescriptorInternal);
  p_super = &v10->super;
  if (v10)
  {
    -[MTLTextureDescriptorInternal setTextureType:](v10, "setTextureType:", 9);
    -[MTLTextureDescriptor setPixelFormat:](p_super, "setPixelFormat:", pixelFormat);
    -[MTLTextureDescriptor setWidth:](p_super, "setWidth:", width);
    -[MTLTextureDescriptor setResourceOptions:](p_super, "setResourceOptions:", resourceOptions);
    -[MTLTextureDescriptor setUsage:](p_super, "setUsage:", usage);
  }
  return p_super;
}

@end
