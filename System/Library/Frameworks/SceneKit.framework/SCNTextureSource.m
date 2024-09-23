@implementation SCNTextureSource

- (void)setSize:(SCNTextureSource *)self
{
  uint64_t v2;

  *(_QWORD *)self->_size = v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SCNTextureSource;
  -[SCNTextureSource dealloc](&v3, sel_dealloc);
}

- (BOOL)shouldFlip
{
  return 1;
}

- (BOOL)supportsMetal
{
  return 1;
}

- (BOOL)prefersGL3
{
  return 0;
}

- (__C3DRendererContext)rendererContextForTextureSourceWithEngineContext:(__C3DEngineContext *)a3
{
  __C3DRendererContext *RendererContextGL;

  RendererContextGL = (__C3DRendererContext *)C3DEngineContextGetRendererContextGL((uint64_t)a3);
  if (-[SCNTextureSource prefersGL3](self, "prefersGL3") || !RendererContextGL)
  {
    if (C3DTextureSourceGetSharedRendererContext_onceToken != -1)
      dispatch_once(&C3DTextureSourceGetSharedRendererContext_onceToken, &__block_literal_global_111);
    return (__C3DRendererContext *)C3DTextureSourceGetSharedRendererContext_rendererContext;
  }
  return RendererContextGL;
}

- (__C3DTexture)textureWithEngineContext:(__C3DEngineContext *)a3 textureSampler:(__C3DTextureSampler *)a4 nextFrameTime:(double *)a5
{
  NSObject *v6;

  v6 = scn_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[SCNTextureSource textureWithEngineContext:textureSampler:nextFrameTime:].cold.1(a2);
  return 0;
}

- (__C3DTexture)_textureWithEngineContext:(__C3DEngineContext *)a3 textureSampler:(__C3DTextureSampler *)a4 nextFrameTime:(double *)a5
{
  NSObject *v6;

  v6 = scn_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[SCNTextureSource textureWithEngineContext:textureSampler:nextFrameTime:].cold.1(a2);
  return 0;
}

- (double)textureSize
{
  NSObject *v3;
  double result;

  v3 = scn_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    -[SCNTextureSource textureWithEngineContext:textureSampler:nextFrameTime:].cold.1(a2);
  __asm { FMOV            V0.2S, #1.0 }
  return result;
}

- (id)metalTextureWithEngineContext:(__C3DEngineContext *)a3 textureSampler:(__C3DTextureSampler *)a4 nextFrameTime:(double *)a5 status:(id *)a6
{
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t IOSurface;
  id result;
  uint64_t RenderContext;
  void *v21;
  __int128 v22;
  uint64_t v23;
  void *v24;
  void *v25;
  __int128 v26;

  if (!C3DEngineContextGetRenderContext((uint64_t)a3))
  {
    v10 = scn_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[SCNTextureSource metalTextureWithEngineContext:textureSampler:nextFrameTime:status:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
  }
  if (-[SCNTextureSource supportsMetal](self, "supportsMetal"))
  {
    IOSurface = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CD0958], "setCurrentContext:", C3DRendererContextGetGLContext((uint64_t)-[SCNTextureSource rendererContextForTextureSourceWithEngineContext:](self, "rendererContextForTextureSourceWithEngineContext:", a3)));
    result = -[SCNTextureSource _textureWithEngineContext:textureSampler:nextFrameTime:](self, "_textureWithEngineContext:textureSampler:nextFrameTime:", a3, a4, a5);
    if (!result)
      return result;
    IOSurface = C3DTextureGetIOSurface((uint64_t)result);
    glFlush();
  }
  result = -[SCNTextureSource MTLTextureCache](self, "MTLTextureCache");
  if (!result)
  {
    RenderContext = C3DEngineContextGetRenderContext((uint64_t)a3);
    v21 = (void *)-[SCNMTLRenderContext device](RenderContext);
    -[SCNTextureSource textureSize](self, "textureSize");
    v26 = v22;
    if (C3DLinearRenderingIsEnabled())
      v23 = 71;
    else
      v23 = 70;
    v24 = (void *)objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", v23, (unint64_t)*(float *)&v26, (unint64_t)*((float *)&v26 + 1), 0, v26);
    objc_msgSend(v24, "setStorageMode:", 2 * (IOSurface == 0));
    objc_msgSend(v24, "setUsage:", 1);
    v25 = (void *)objc_msgSend(v21, "newTextureWithDescriptor:iosurface:plane:", v24, IOSurface, 0);
    -[SCNTextureSource setMTLTextureCache:](self, "setMTLTextureCache:", v25);
    return v25;
  }
  return result;
}

- (void)renderWithEngineContext:(__C3DEngineContext *)a3 textureSampler:(__C3DTextureSampler *)a4 nextFrameTime:(double *)a5
{
  NSObject *v6;

  v6 = scn_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[SCNTextureSource textureWithEngineContext:textureSampler:nextFrameTime:].cold.1(a2);
}

- (void)cleanup:(__C3DRendererContext *)a3
{
  NSObject *v4;

  v4 = scn_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    -[SCNTextureSource textureWithEngineContext:textureSampler:nextFrameTime:].cold.1(a2);
}

- (double)nextFrameTime
{
  return INFINITY;
}

- (id)MTLTextureCache
{
  return self->_mtlTextureCache;
}

- (void)setMTLTextureCache:(id)a3
{
  id mtlTextureCache;

  mtlTextureCache = self->_mtlTextureCache;
  if (mtlTextureCache != a3)
  {

    self->_mtlTextureCache = a3;
  }
}

- (id)glTextureCache
{
  return self->_glTextureCache;
}

- (void)setGlTextureCache:(id)a3
{
  id glTextureCache;

  glTextureCache = self->_glTextureCache;
  if (glTextureCache != a3)
  {

    self->_glTextureCache = a3;
  }
}

- (void)textureWithEngineContext:(const char *)a1 textureSampler:nextFrameTime:.cold.1(const char *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_3_7(a1);
  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_3_3(&dword_1DCCB8000, v1, v2, "Error: SCNTextureSource abstract method invoked %@", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_4_4();
}

- (void)metalTextureWithEngineContext:(uint64_t)a3 textureSampler:(uint64_t)a4 nextFrameTime:(uint64_t)a5 status:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
