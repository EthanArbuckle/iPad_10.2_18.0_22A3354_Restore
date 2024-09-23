@implementation MDLTextureFilter

- (void)setTWrapMode:(MDLMaterialTextureWrapMode)tWrapMode
{
  self->tWrapMode = tWrapMode;
}

- (void)setSWrapMode:(MDLMaterialTextureWrapMode)sWrapMode
{
  self->sWrapMode = sWrapMode;
}

- (MDLTextureFilter)init
{
  MDLTextureFilter *v2;
  const char *v3;
  MDLTextureFilter *v4;
  const char *v5;
  const char *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MDLTextureFilter;
  v2 = -[MDLTextureFilter init](&v8, sel_init);
  v4 = v2;
  if (v2)
  {
    objc_msgSend_setMagFilter_(v2, v3, 1);
    objc_msgSend_setMinFilter_(v4, v5, 1);
    objc_msgSend_setMipFilter_(v4, v6, 1);
  }
  return v4;
}

- (void)setMipFilter:(MDLMaterialMipMapFilterMode)mipFilter
{
  self->mipFilter = mipFilter;
}

- (void)setMinFilter:(MDLMaterialTextureFilterMode)minFilter
{
  self->minFilter = minFilter;
}

- (void)setMagFilter:(MDLMaterialTextureFilterMode)magFilter
{
  self->magFilter = magFilter;
}

- (MDLMaterialTextureWrapMode)tWrapMode
{
  return self->tWrapMode;
}

- (MDLMaterialTextureWrapMode)sWrapMode
{
  return self->sWrapMode;
}

- (MDLMaterialMipMapFilterMode)mipFilter
{
  return self->mipFilter;
}

- (MDLMaterialTextureFilterMode)minFilter
{
  return self->minFilter;
}

- (MDLMaterialTextureFilterMode)magFilter
{
  return self->magFilter;
}

- (MDLMaterialTextureWrapMode)rWrapMode
{
  return self->rWrapMode;
}

- (void)setRWrapMode:(MDLMaterialTextureWrapMode)rWrapMode
{
  self->rWrapMode = rWrapMode;
}

@end
