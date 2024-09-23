@implementation SCNTextureSpriteKitSource

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SCNTextureSpriteKitSource;
  -[SCNTextureSource dealloc](&v3, sel_dealloc);
}

- (void)renderWithEngineContext:(__C3DEngineContext *)a3 textureSampler:(__C3DTextureSampler *)a4 nextFrameTime:(double *)a5
{
  uint64_t Scene;
  uint64_t AnimationManager;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double SystemTime;
  void *v18;
  uint64_t RenderContext;
  uint64_t v20;
  __n128 Viewport;

  Scene = C3DEngineContextGetScene((uint64_t)a3);
  AnimationManager = C3DSceneGetAnimationManager(Scene);
  if (!AnimationManager)
  {
    v9 = scn_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[SCNTextureSpriteKitSource renderWithEngineContext:textureSampler:nextFrameTime:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
  }
  SystemTime = C3DAnimationManagerGetSystemTime(AnimationManager);
  v18 = (void *)objc_msgSend(+[SCNSourceRendererRegistry sharedRegistry](SCNSourceRendererRegistry, "sharedRegistry"), "sourceRendererForEngineContext:source:textureSource:targetTexture:", a3, self->_scene, self, 0);
  Viewport = C3DEngineContextGetViewport((__n128 *)a3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if ((-[SKScene _isDirty](self->_scene, "_isDirty") & 1) != 0)
      C3DEngineContextSetNextFrameTimeToAsap((uint64_t)a3);
    else
      -[SKScene _notifyNextDirtyState](self->_scene, "_notifyNextDirtyState");
  }
  RenderContext = C3DEngineContextGetRenderContext((uint64_t)a3);
  if (RenderContext)
  {
    v20 = RenderContext;
    objc_msgSend(v18, "setBounds:", Viewport.n128_f32[0], Viewport.n128_f32[1], Viewport.n128_f32[2], Viewport.n128_f32[3]);
    if ((SKScene *)objc_msgSend(v18, "scene") != self->_scene)
      objc_msgSend(v18, "setScene:");
    -[SCNMTLRenderContext renderSKSceneWithRenderer:overlay:atTime:](v20, v18, 0);
  }
  else
  {
    -[SCNTextureSpriteKitSource __renderSKScene:withSKSCNRenderer:engineContext:viewport:atTime:](self, "__renderSKScene:withSKSCNRenderer:engineContext:viewport:atTime:", self->_scene, v18, a3, Viewport.n128_f64[0], SystemTime);
  }
}

- (void)__renderSKScene:(id)a3 withSKSCNRenderer:(id)a4 engineContext:(__C3DEngineContext *)a5 viewport:(double)a6 atTime:
{
  double v6;
  double v7;
  __C3DRendererContext *v11;
  int IsEnabled;
  int v13;
  uint64_t BoundFramebuffer;
  uint64_t FBO;
  __n128 Viewport;
  __n128 v17;
  __n128 v18;
  GLint v19[2];
  GLint params[2];

  v7 = v6;
  v18 = *(__n128 *)&a6;
  v11 = -[SCNTextureSource rendererContextForTextureSourceWithEngineContext:](self, "rendererContextForTextureSourceWithEngineContext:", a5);
  Viewport = C3DEngineContextGetViewport((__n128 *)a5);
  C3DRendererContextSetViewport(v18);
  objc_msgSend(a4, "setBounds:", v18.n128_f32[0], v18.n128_f32[1], v18.n128_f32[2], v18.n128_f32[3]);
  if ((id)objc_msgSend(a4, "scene") != a3)
    objc_msgSend(a4, "setScene:", a3, *(_OWORD *)&Viewport);
  objc_msgSend(a4, "updateAtTime:", v7, *(_OWORD *)&Viewport);
  IsEnabled = glIsEnabled(0xB44u);
  v13 = glIsEnabled(0xBE2u);
  glDisable(0xBE2u);
  glDisable(0xB44u);
  *(_QWORD *)v19 = 0;
  *(_QWORD *)params = 0;
  glGetIntegerv(0x80CBu, &params[1]);
  glGetIntegerv(0x80CAu, params);
  glGetIntegerv(0x80C9u, &v19[1]);
  glGetIntegerv(0x80C8u, v19);
  glBlendFunc(0x302u, 0x303u);
  C3DRendererContextUnbindProgramObject((uint64_t)v11);
  C3DRendererContextUnbindBufferObjects((uint64_t)v11);
  BoundFramebuffer = C3DRendererContextGetBoundFramebuffer((uint64_t)v11);
  if (BoundFramebuffer)
    FBO = C3DFramebufferGetFBO(BoundFramebuffer);
  else
    FBO = 0;
  objc_msgSend(a4, "renderToFramebuffer:shouldClear:", FBO, 1);
  if (IsEnabled)
    glEnable(0xB44u);
  glBlendFuncSeparate(v19[1], v19[0], params[1], params[0]);
  if (v13)
    glEnable(0xBE2u);
  C3DRendererContextSetViewport(v17);
}

- (double)__updateTextureWithSKScene:(id)a3 engineContext:(__C3DEngineContext *)a4 sampler:(__C3DTextureSampler *)a5
{
  uint64_t Scene;
  uint64_t AnimationManager;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double SystemTime;
  uint64_t v20;

  Scene = C3DEngineContextGetScene((uint64_t)a4);
  AnimationManager = C3DSceneGetAnimationManager(Scene);
  if (!AnimationManager)
  {
    v11 = scn_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      -[SCNTextureSpriteKitSource renderWithEngineContext:textureSampler:nextFrameTime:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);
  }
  SystemTime = C3DAnimationManagerGetSystemTime(AnimationManager);
  if (self->super._framebuffer)
  {
    if (self->_lastUpdate != SystemTime)
    {
      self->_lastUpdate = SystemTime;
      v20 = objc_msgSend(+[SCNSourceRendererRegistry sharedRegistry](SCNSourceRendererRegistry, "sharedRegistry"), "sourceRendererForEngineContext:source:textureSource:targetTexture:", a4, a3, self, 0);
      -[SCNTextureOffscreenRenderingSource _bindFramebuffer:](self, "_bindFramebuffer:", a4);
      -[SCNTextureSpriteKitSource __renderSKScene:withSKSCNRenderer:engineContext:viewport:atTime:](self, "__renderSKScene:withSKSCNRenderer:engineContext:viewport:atTime:", a3, v20, a4, *(double *)vcvt_hight_f32_f64(0, (float64x2_t)self->super._framebufferSize).i64, SystemTime);
      -[SCNTextureOffscreenRenderingSource _unbindFramebuffer:](self, "_unbindFramebuffer:", a4);
      if (C3DTextureSamplerGetMipFilter((uint64_t)a5))
        -[SCNTextureOffscreenRenderingSource _buildMipmaps:](self, "_buildMipmaps:", a4);
    }
  }
  return SystemTime;
}

- (void)cleanup:(__C3DRendererContext *)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SCNTextureSpriteKitSource;
  -[SCNTextureOffscreenRenderingSource cleanup:](&v3, sel_cleanup_, a3);
}

- (__C3DTexture)textureWithEngineContext:(__C3DEngineContext *)a3 textureSampler:(__C3DTextureSampler *)a4 nextFrameTime:(double *)a5
{
  uint64_t Stats;
  double v10;
  SKScene *v11;
  SKScene *v12;
  double v13;
  __C3DTexture *v14;
  double v15;
  uint64_t v16;
  double v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  Stats = C3DEngineContextGetStats((uint64_t)a3);
  v10 = CACurrentMediaTime();
  v11 = -[SCNTextureSpriteKitSource scene](self, "scene");
  if (v11)
  {
    v12 = v11;
    -[SKScene size](v11, "size");
    v14 = 0;
    if (v15 > 0.0 && v13 > 0.0)
    {
      v14 = -[SCNTextureOffscreenRenderingSource __prepareFramebufferWithSize:withEngineContext:textureSampler:needsStencil:](self, "__prepareFramebufferWithSize:withEngineContext:textureSampler:needsStencil:", a3, a4, 1);
      -[SCNTextureSpriteKitSource __updateTextureWithSKScene:engineContext:sampler:](self, "__updateTextureWithSKScene:engineContext:sampler:", v12, a3, a4);
      *(_QWORD *)a5 = v16;
    }
    v17 = CACurrentMediaTime();
  }
  else
  {
    v18 = scn_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[SCNTextureSpriteKitSource textureWithEngineContext:textureSampler:nextFrameTime:].cold.1(v18, v19, v20, v21, v22, v23, v24, v25);
    v17 = CACurrentMediaTime();
    v14 = 0;
  }
  *(double *)(Stats + 160) = *(double *)(Stats + 160) + v17 - v10;
  return v14;
}

- (id)metalTextureWithEngineContext:(__C3DEngineContext *)a3 textureSampler:(__C3DTextureSampler *)a4 nextFrameTime:(double *)a5 status:(id *)a6
{
  uint64_t RenderContext;
  void *v11;
  uint64_t Stats;
  SKScene *v13;
  SKScene *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;
  void *v21;
  uint64_t Scene;
  uint64_t AnimationManager;
  double SystemTime;
  double v25;
  void *v26;
  int v27;
  BOOL v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  void *v38;
  uint8_t v40[16];

  RenderContext = C3DEngineContextGetRenderContext((uint64_t)a3);
  v11 = (void *)-[SCNMTLRenderContext device](RenderContext);
  Stats = C3DEngineContextGetStats((uint64_t)a3);
  v13 = -[SCNTextureSpriteKitSource scene](self, "scene");
  if (v13)
  {
    v14 = v13;
    v15 = CACurrentMediaTime();
    -[SKScene size](v14, "size");
    v17 = v16;
    v19 = v18;
    v20 = -[SCNTextureSource MTLTextureCache](self, "MTLTextureCache");
    if (!v20)
    {
      v21 = (void *)objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", C3DMetalFramebufferPixelFormat(0), (unint64_t)v17, (unint64_t)v19, 0);
      objc_msgSend(v21, "setStorageMode:", 2);
      objc_msgSend(v21, "setUsage:", 21);
      v20 = (id)objc_msgSend(v11, "newTextureWithDescriptor:", v21);
      -[SCNTextureSource setMTLTextureCache:](self, "setMTLTextureCache:", v20);

    }
    Scene = C3DEngineContextGetScene((uint64_t)a3);
    AnimationManager = C3DSceneGetAnimationManager(Scene);
    SystemTime = C3DAnimationManagerGetSystemTime(AnimationManager);
    if (!v20 || (v25 = SystemTime, self->_lastUpdate == SystemTime))
    {
      v28 = 0;
LABEL_22:
      a6->var0 = v28;
      a6->var1 = 1;
      *(double *)(Stats + 160) = *(double *)(Stats + 160) + CACurrentMediaTime() - v15;
      return v20;
    }
    self->_lastUpdate = SystemTime;
    v26 = (void *)objc_msgSend(+[SCNSourceRendererRegistry sharedRegistry](SCNSourceRendererRegistry, "sharedRegistry"), "sourceRendererForEngineContext:source:textureSource:targetTexture:", a3, v14, self, 0);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v27 = -[SKScene _isDirty](v14, "_isDirty") ^ 1;
    else
      v27 = 0;
    objc_msgSend(v26, "setBounds:", 0.0, 0.0, v17, v19);
    if ((SKScene *)objc_msgSend(v26, "scene") != v14)
    {
      v37 = scn_default_log();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v40 = 0;
        _os_log_impl(&dword_1DCCB8000, v37, OS_LOG_TYPE_DEFAULT, "Warning: SCNTextureSource unexpected SKScene", v40, 2u);
      }
    }
    objc_msgSend(v26, "updateAtTime:", v25);
    if (C3DLinearRenderingIsEnabled())
    {
      v38 = (void *)objc_msgSend(v20, "newTextureViewWithPixelFormat:", SCNMTLPixelFormatNonSRGBVariant(objc_msgSend(v20, "pixelFormat")));
      objc_msgSend(v26, "renderToTexture:commandQueue:", v38, -[SCNMTLRenderContext commandQueue](RenderContext));

      if (!v27)
      {
LABEL_18:
        *a5 = v25;
LABEL_21:
        v28 = 1;
        goto LABEL_22;
      }
    }
    else
    {
      objc_msgSend(v26, "renderToTexture:commandQueue:", v20, -[SCNMTLRenderContext commandQueue](RenderContext));
      if (!v27)
        goto LABEL_18;
    }
    -[SKScene _notifyNextDirtyState](v14, "_notifyNextDirtyState");
    goto LABEL_21;
  }
  v29 = scn_default_log();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    -[SCNTextureSpriteKitSource textureWithEngineContext:textureSampler:nextFrameTime:].cold.1(v29, v30, v31, v32, v33, v34, v35, v36);
  return 0;
}

- (SKScene)scene
{
  return self->_scene;
}

- (void)setScene:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (void)renderWithEngineContext:(uint64_t)a3 textureSampler:(uint64_t)a4 nextFrameTime:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
}

- (void)textureWithEngineContext:(uint64_t)a3 textureSampler:(uint64_t)a4 nextFrameTime:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, a1, a3, "Error: SCNTextureSpriteKitSource::textureProxy -> no scene", a5, a6, a7, a8, 0);
}

@end
