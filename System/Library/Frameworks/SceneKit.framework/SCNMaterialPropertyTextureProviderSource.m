@implementation SCNMaterialPropertyTextureProviderSource

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SCNMaterialPropertyTextureProviderSource;
  -[SCNTextureSource dealloc](&v3, sel_dealloc);
}

- (void)setTextureProvider:(id)a3
{
  if (self->_textureProvider != a3)
  {

    self->_texture = 0;
    self->_textureProvider = (SCNMaterialPropertyTextureProvider *)a3;
  }
}

- (SCNMaterialPropertyTextureProvider)textureProvider
{
  return self->_textureProvider;
}

- (void)connectToProxy:(__C3DImageProxy *)a3
{
  _OWORD v4[2];

  C3DImageProxySetSource((uint64_t)a3, self, 0);
  v4[0] = xmmword_1EA59FE38;
  v4[1] = *(_OWORD *)&off_1EA59FE48;
  C3DImageProxySetCallbacks((uint64_t)a3, (uint64_t)v4);
}

- (id)metalTextureWithEngineContext:(__C3DEngineContext *)a3 textureSampler:(__C3DTextureSampler *)a4 nextFrameTime:(double *)a5 status:(id *)a6
{
  uint64_t RenderContext;
  uint64_t v9;
  BOOL v10;

  self->_engineContext = a3;
  RenderContext = C3DEngineContextGetRenderContext((uint64_t)a3);
  v9 = RenderContext;
  if (self->_texture)
  {
    v10 = 0;
  }
  else
  {
    self->_texture = (MTLTexture *)-[SCNMaterialPropertyTextureProvider newTextureForDevice:](self->_textureProvider, "newTextureForDevice:", -[SCNMTLRenderContext device](RenderContext));
    v10 = 1;
  }
  a6->var0 = v10;
  a6->var1 = 1;
  __renderToTexture(self->_textureProvider, (uint64_t)self->_texture, (uint64_t)self, v9);
  return self->_texture;
}

- (void)renderWithEngineContext:(__C3DEngineContext *)a3 textureSampler:(__C3DTextureSampler *)a4 nextFrameTime:(double *)a5
{
  uint64_t RenderContext;

  self->_engineContext = a3;
  RenderContext = C3DEngineContextGetRenderContext((uint64_t)a3);
  __renderToTexture(self->_textureProvider, (uint64_t)self->_texture, (uint64_t)self, RenderContext);
}

- (id)cachedTextureWithURL:(id)a3 token:(id *)a4
{
  return -[SCNMaterialPropertyTextureProviderSource cachedTextureWithURL:token:didFallbackToDefaultTexture:](self, "cachedTextureWithURL:token:didFallbackToDefaultTexture:", a3, a4, 0);
}

- (id)cachedTextureWithURL:(id)a3 token:(id *)a4 didFallbackToDefaultTexture:(BOOL *)a5
{
  const void *v9;
  const void *v10;
  void *v11;
  id *RenderContext;
  void *v13;
  void *v14;
  id *v15;
  BOOL v17;

  v9 = C3DImageCopyCachedImageForSource(a3);
  if (v9)
  {
    v10 = v9;
    if (a4)
    {
      v11 = 0;
LABEL_5:
      *a4 = v11;
    }
  }
  else
  {
    v11 = (void *)C3DImageCreateWithURL(a3);
    C3DImageCacheImageWithSource(v11, a3);
    v10 = v11;
    if (a4)
      goto LABEL_5;
  }
  CFAutorelease(v10);
  v17 = 0;
  RenderContext = (id *)C3DEngineContextGetRenderContext((uint64_t)self->_engineContext);
  v13 = (void *)-[SCNMTLRenderContext resourceManager]((uint64_t)RenderContext);
  v14 = (void *)objc_msgSend(v13, "renderResourceForImage:sampler:options:engineContext:didFallbackToDefaultTexture:", v10, C3DTextureSamplerGetDefault(), 0, self->_engineContext, &v17);
  if (v17)
  {
    v15 = -[SCNMTLRenderContext resourceManagerMonitor](RenderContext);
    if (v15)
      objc_msgSend(v15, "renderContext:didFallbackToDefaultTextureForSource:message:", RenderContext, a3, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SCNMaterialPropertyTextureProviderHelper could not find texture for %@"), a3));
  }
  if (a5)
    *a5 = v17;
  return v14;
}

@end
