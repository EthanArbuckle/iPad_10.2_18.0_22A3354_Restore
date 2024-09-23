@implementation SCNTextureDelegateSource

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SCNTextureDelegateSource;
  -[SCNTextureSource dealloc](&v3, sel_dealloc);
}

- (void)renderWithEngineContext:(__C3DEngineContext *)a3 textureSampler:(__C3DTextureSampler *)a4 nextFrameTime:(double *)a5
{
  __C3DRendererContext *v7;
  uint64_t GLContext;
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

  v7 = -[SCNTextureSource rendererContextForTextureSourceWithEngineContext:](self, "rendererContextForTextureSourceWithEngineContext:", a3, a4, a5);
  if (v7)
    GLContext = C3DRendererContextGetGLContext((uint64_t)v7);
  else
    GLContext = 0;
  Scene = C3DEngineContextGetScene((uint64_t)a3);
  AnimationManager = C3DSceneGetAnimationManager(Scene);
  if (!AnimationManager)
  {
    v11 = scn_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      C3DAnimationManagerSetSystemTime_cold_1(v11, v12, v13, v14, v15, v16, v17, v18);
  }
  objc_msgSend(self->_delegate, "drawInContext:atTime:", GLContext, C3DAnimationManagerGetSystemTime(AnimationManager));
}

- (void)__updateTextureWithDelegate:(id)a3 engineContext:(__C3DEngineContext *)a4
{
  __C3DRendererContext *v6;
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
  double v18;
  double lastUpdate;
  uint64_t GLContext;
  char v21;
  double v22;

  v6 = -[SCNTextureSource rendererContextForTextureSourceWithEngineContext:](self, "rendererContextForTextureSourceWithEngineContext:", a4);
  Scene = C3DEngineContextGetScene((uint64_t)a4);
  AnimationManager = C3DSceneGetAnimationManager(Scene);
  if (!AnimationManager)
  {
    v9 = scn_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      C3DAnimationManagerSetSystemTime_cold_1(v9, v10, v11, v12, v13, v14, v15, v16);
  }
  SystemTime = C3DAnimationManagerGetSystemTime(AnimationManager);
  if (self->super._framebuffer)
  {
    v18 = SystemTime;
    lastUpdate = self->_lastUpdate;
    if (lastUpdate != v18
      && (lastUpdate == 0.0
       || v18 > self->_nextUpdateDate
       || (objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(self->_delegate, "needsUpdate")))
    {
      self->_lastUpdate = v18;
      GLContext = C3DRendererContextGetGLContext((uint64_t)v6);
      -[SCNTextureOffscreenRenderingSource _bindFramebuffer:](self, "_bindFramebuffer:", a4);
      objc_msgSend(self->_delegate, "drawInContext:atTime:", GLContext, v18);
      -[SCNTextureOffscreenRenderingSource _unbindFramebuffer:](self, "_unbindFramebuffer:", a4);
      v21 = objc_opt_respondsToSelector();
      v22 = 0.0;
      if ((v21 & 1) != 0)
        objc_msgSend(self->_delegate, "nextFrameTime", 0.0);
      self->_nextUpdateDate = v18 + v22;
    }
  }
}

- (void)cleanup:(__C3DRendererContext *)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SCNTextureDelegateSource;
  -[SCNTextureOffscreenRenderingSource cleanup:](&v3, sel_cleanup_, a3);
}

- (__C3DTexture)textureWithEngineContext:(__C3DEngineContext *)a3 textureSampler:(__C3DTextureSampler *)a4 nextFrameTime:(double *)a5
{
  uint64_t Stats;
  double v9;
  id v10;
  id v11;
  double v12;
  __C3DTexture *v13;
  double v14;
  NSObject *v15;

  Stats = C3DEngineContextGetStats((uint64_t)a3);
  v9 = CACurrentMediaTime();
  v10 = -[SCNTextureDelegateSource delegate](self, "delegate");
  if (v10)
  {
    v11 = v10;
    objc_msgSend(v10, "contentSize");
    v13 = 0;
    if (v14 > 0.0 && v12 > 0.0)
    {
      v13 = -[SCNTextureOffscreenRenderingSource __prepareFramebufferWithSize:withEngineContext:textureSampler:needsStencil:](self, "__prepareFramebufferWithSize:withEngineContext:textureSampler:needsStencil:", a3, a4, 0);
      -[SCNTextureDelegateSource __updateTextureWithDelegate:engineContext:](self, "__updateTextureWithDelegate:engineContext:", v11, a3);
    }
    *(double *)(Stats + 160) = *(double *)(Stats + 160) + CACurrentMediaTime() - v9;
  }
  else
  {
    v15 = scn_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[SCNTextureDelegateSource textureWithEngineContext:textureSampler:nextFrameTime:].cold.1(v15);
    return 0;
  }
  return v13;
}

- (id)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (void)textureWithEngineContext:(os_log_t)log textureSampler:nextFrameTime:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_ERROR, "Error: SCNTextureDelegateSource::textureProxy -> no delegate", v1, 2u);
}

@end
