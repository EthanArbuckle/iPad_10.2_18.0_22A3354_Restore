@implementation MDLTextureSampler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->transform, 0);
  objc_storeStrong((id *)&self->hardwareFilter, 0);
  objc_storeStrong((id *)&self->texture, 0);
}

- (MDLTextureFilter)hardwareFilter
{
  return self->hardwareFilter;
}

- (void)setTextureComponents:(int64_t)a3
{
  self->textureComponents = a3;
}

- (void)setTexture:(MDLTexture *)texture
{
  objc_storeStrong((id *)&self->texture, texture);
}

- (void)setMappingChannel:(unint64_t)a3
{
  self->mappingChannel = a3;
}

- (void)setHardwareFilter:(MDLTextureFilter *)hardwareFilter
{
  objc_storeStrong((id *)&self->hardwareFilter, hardwareFilter);
}

- (MDLTextureSampler)init
{
  MDLTextureSampler *v2;
  MDLTextureSampler *v3;
  MDLTransform *v4;
  MDLTransform *transform;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MDLTextureSampler;
  v2 = -[MDLTextureSampler init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    *(_OWORD *)&v2->mappingChannel = xmmword_1DCC57C20;
    v4 = objc_alloc_init(MDLTransform);
    transform = v3->transform;
    v3->transform = v4;

  }
  return v3;
}

- (MDLTransform)transform
{
  return self->transform;
}

- (MDLTexture)texture
{
  return self->texture;
}

- (int64_t)textureComponents
{
  return self->textureComponents;
}

- (unint64_t)mappingChannel
{
  return self->mappingChannel;
}

- (void)setTransform:(MDLTransform *)transform
{
  objc_storeStrong((id *)&self->transform, transform);
}

@end
