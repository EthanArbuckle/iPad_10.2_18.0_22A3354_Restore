@implementation SCNTextureOffscreenRenderingSource

- (float32x2_t)textureSize
{
  return vcvt_f32_f64(*(float64x2_t *)(a1 + 40));
}

- (void)cleanup:(__C3DRendererContext *)a3
{
  __C3DFramebuffer *framebuffer;

  framebuffer = self->_framebuffer;
  if (framebuffer)
  {
    C3DRendererContextDeleteFramebuffer((uint64_t)a3, (uint64_t)framebuffer, 1);
    CFRelease(self->_framebuffer);
  }
  self->_framebufferSize.width = 0.0;
}

- (void)_createFramebufferWithEngineContext:(__C3DEngineContext *)a3 size:(CGSize)a4
{
  _BOOL4 v6;
  int v7;
  __C3DRendererContext *v8;
  uint64_t v9;
  __C3DFramebuffer *framebuffer;
  __C3DFramebuffer *v11;
  uint64_t v12;
  __C3DFramebuffer *v13;
  float64x2_t v14;
  uint64_t v15;
  CGFloat height;
  double width;

  height = a4.height;
  width = a4.width;
  v6 = !-[SCNTextureSource supportsMetal](self, "supportsMetal") && C3DEngineContextGetRenderContext((uint64_t)a3) != 0;
  v7 = -[SCNTextureSource prefersGL3](self, "prefersGL3") || v6;
  v8 = -[SCNTextureSource rendererContextForTextureSourceWithEngineContext:](self, "rendererContextForTextureSourceWithEngineContext:", a3);
  v9 = (uint64_t)v8;
  framebuffer = self->_framebuffer;
  if (framebuffer)
  {
    C3DRendererContextDeleteFramebuffer((uint64_t)v8, (uint64_t)framebuffer, 1);
    v11 = self->_framebuffer;
    if (v11)
    {
      CFRelease(v11);
      self->_framebuffer = 0;
    }
  }
  if (v7)
  {
    if (((int)width & 0xB) != 0)
      width = (double)(int)(((int)width & 0xFFFFFFFC) + 4);
    v12 = 0x8000000;
  }
  else
  {
    v12 = 0;
  }
  v13 = (__C3DFramebuffer *)C3DFramebufferCreate();
  self->_framebuffer = v13;
  v14.f64[0] = width;
  v14.f64[1] = height;
  C3DFramebufferSetSize((uint64_t)v13, COERCE_DOUBLE(vcvt_f32_f64(vrndpq_f64(v14))));
  v15 = C3DRenderTargetDescriptionMake(1u, 1);
  C3DFramebufferAddRenderTargetDescription((uint64_t)self->_framebuffer, 0, v15 & 0xFFFFFFFFF7FFFFFFLL | v12);
  C3DRendererContextSetupFramebuffer(v9, (uint64_t)self->_framebuffer);
}

- (__C3DTexture)__prepareFramebufferWithSize:(CGSize)a3 withEngineContext:(__C3DEngineContext *)a4 textureSampler:(__C3DTextureSampler *)a5 needsStencil:(BOOL)a6
{
  double height;
  double width;
  CGSize *p_framebufferSize;
  int WrapModeS;
  int WrapModeT;

  height = a3.height;
  width = a3.width;
  p_framebufferSize = &self->_framebufferSize;
  if (a3.width != self->_framebufferSize.width || a3.height != self->_framebufferSize.height)
  {
    -[SCNTextureSource setMTLTextureCache:](self, "setMTLTextureCache:", 0, a5, a6);
    -[SCNTextureSource setGlTextureCache:](self, "setGlTextureCache:", 0);
    p_framebufferSize->width = width;
    p_framebufferSize->height = height;
    WrapModeS = C3DTextureSamplerGetWrapModeS((uint64_t)a5);
    WrapModeT = C3DTextureSamplerGetWrapModeT((uint64_t)a5);
    if ((WrapModeS & 0xFFFFFFFD) != 1 || (WrapModeT & 0xFFFFFFFD) != 1 || C3DTextureSamplerUseMipmaps((uint64_t)a5))
    {
      width = (double)(int)C3DMakePowerOfTwo((int)width);
      height = (double)(int)C3DMakePowerOfTwo((int)height);
    }
    -[SCNTextureOffscreenRenderingSource _createFramebufferWithEngineContext:size:](self, "_createFramebufferWithEngineContext:size:", a4, width, height);
  }
  return (__C3DTexture *)C3DFramebufferGetTextureWithSlot((uint64_t)self->_framebuffer, 0);
}

- (void)_buildMipmaps:(__C3DEngineContext *)a3
{
  __C3DRendererContext *v5;
  const void *TextureWithSlot;
  uint64_t v7;
  GLenum TargetMode;
  GLuint ID;

  if (!C3DEngineContextGetRenderContext((uint64_t)a3))
  {
    v5 = -[SCNTextureSource rendererContextForTextureSourceWithEngineContext:](self, "rendererContextForTextureSourceWithEngineContext:", a3);
    TextureWithSlot = C3DFramebufferGetTextureWithSlot((uint64_t)self->_framebuffer, 0);
    if (TextureWithSlot)
    {
      v7 = (uint64_t)TextureWithSlot;
      if (!C3DTextureGetIOSurface((uint64_t)TextureWithSlot))
      {
        TargetMode = C3DTextureGetTargetMode(v7);
        ID = C3DTextureGetID(v7);
        _C3DRendererContextBindTextureGL((uint64_t)v5, TargetMode, ID);
        glGenerateMipmap(TargetMode);
      }
    }
  }
}

- (void)_bindFramebuffer:(__C3DEngineContext *)a3
{
  C3DRendererContextBindFramebuffer((uint64_t)-[SCNTextureSource rendererContextForTextureSourceWithEngineContext:](self, "rendererContextForTextureSourceWithEngineContext:", a3), (uint64_t)self->_framebuffer);
}

- (void)_unbindFramebuffer:(__C3DEngineContext *)a3
{
  C3DRendererContextUnbindFramebuffer((uint64_t)-[SCNTextureSource rendererContextForTextureSourceWithEngineContext:](self, "rendererContextForTextureSourceWithEngineContext:", a3));
}

@end
