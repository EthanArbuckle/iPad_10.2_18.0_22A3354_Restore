@implementation SCNTextureCoreAnimationSource

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SCNTextureCoreAnimationSource;
  -[SCNTextureSource dealloc](&v3, sel_dealloc);
}

- (BOOL)supportsMetal
{
  return 1;
}

- (BOOL)prefersGL3
{
  return 1;
}

- (void)setLayer:(id)a3
{
  CALayer *layer;

  layer = self->_layer;
  if (layer != a3)
  {

    self->_layer = (CALayer *)a3;
  }
}

- (void)renderWithEngineContext:(__C3DEngineContext *)a3 textureSampler:(__C3DTextureSampler *)a4 nextFrameTime:(double *)a5 status:(id *)a6
{
  id v11;
  uint64_t RenderContext;
  void *v13;
  double v14;
  CFTimeInterval v15;

  if (C3DEngineContextGetRenderContext((uint64_t)a3))
  {
    v11 = -[SCNTextureCoreAnimationSource metalTextureWithEngineContext:textureSampler:nextFrameTime:status:](self, "metalTextureWithEngineContext:textureSampler:nextFrameTime:status:", a3, a4, a5, a6);
    RenderContext = C3DEngineContextGetRenderContext((uint64_t)a3);
    -[SCNMTLRenderContext _drawFullScreenTexture:over:](RenderContext, v11, 0);
  }
  else
  {
    v13 = (void *)objc_msgSend(+[SCNSourceRendererRegistry sharedRegistry](SCNSourceRendererRegistry, "sharedRegistry"), "sourceRendererForEngineContext:source:textureSource:targetTexture:", a3, self->_layer, self, 0);
    objc_msgSend((id)objc_msgSend(v13, "layer"), "beginTime");
    v15 = CACurrentMediaTime() - v14;
    -[SCNTextureCoreAnimationSource __renderLayer:withCARenderer:engineContext:viewport:atTime:forceUpdate:didUpdate:](self, "__renderLayer:withCARenderer:engineContext:viewport:atTime:forceUpdate:didUpdate:", self->_layer, v13, a3, 1, 0, C3DEngineContextGetViewport((__n128 *)a3).n128_f64[0], v15);
  }
}

- (id)layerToFocusForRenderedLayer:(id)a3
{
  return a3;
}

- (float)clearValue
{
  return 0.0;
}

- (BOOL)requiresMainThreadUpdates
{
  return 0;
}

- (void)_resizeLayer:(id)a3 toSize:(CGSize)a4 updateLayer:(BOOL)a5 updateTransform:(BOOL)a6 caRenderer:(id)a7 isMainThread:(BOOL)a8
{
  _BOOL4 v10;
  _BOOL4 v11;
  double height;
  double width;
  id v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  _BOOL4 v26;
  CATransform3D *v27;
  double v28;
  CGFloat v29;
  double v30;
  CATransform3D v31;
  CATransform3D v32;
  CATransform3D v33;
  CATransform3D v34;
  CATransform3D v35;
  CATransform3D b;
  CATransform3D a;
  CATransform3D v38;
  CATransform3D v39;
  CATransform3D v40;
  CATransform3D v41;
  CATransform3D v42;
  CATransform3D v43;
  CATransform3D v44;

  v10 = a6;
  v11 = a5;
  height = a4.height;
  width = a4.width;
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  if (!a8)
    objc_msgSend(MEMORY[0x1E0CD28B0], "activateBackground:", 1);
  objc_msgSend(MEMORY[0x1E0CD28B0], "setValue:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CD3160]);
  if (v11)
    objc_msgSend(a7, "setLayer:", a3);
  if (v10)
  {
    v16 = -[SCNTextureCoreAnimationSource layerToFocusForRenderedLayer:](self, "layerToFocusForRenderedLayer:", a3);
    if (v16 != a3)
    {
      objc_msgSend(a3, "setAnchorPoint:", 0.0, 0.0);
      objc_msgSend(v16, "setAnchorPoint:", 0.0, 0.0);
      objc_msgSend(a3, "setPosition:", 0.0, 0.0);
      objc_msgSend(v16, "setPosition:", 0.0, 0.0);
    }
    objc_msgSend(v16, "bounds");
    v18 = v17;
    v20 = v19;
    objc_msgSend(v16, "contentsScale");
    v22 = v21 * v18;
    v23 = v21 * v20;
    if (v21 * v18 != 0.0 || v23 != 0.0)
    {
      v24 = width / v22;
      v25 = height / v23;
      v26 = -[SCNTextureSource shouldFlip](self, "shouldFlip");
      if (v26)
      {
        if (v16 == a3)
        {
          objc_msgSend(a3, "anchorPoint");
          v29 = v22 * ((v24 + -1.0) * v28);
          objc_msgSend(a3, "anchorPoint");
          CATransform3DMakeTranslation(&v42, v29, v23 * ((v25 + -1.0) * v30), 0.0);
          v41 = v42;
          v27 = &v41;
        }
        else
        {
          CATransform3DMakeTranslation(&v44, 0.0, height, 0.0);
          v43 = v44;
          v27 = &v43;
        }
      }
      else
      {
        CATransform3DMakeTranslation(&v40, 0.0, 0.0, 0.0);
        v39 = v40;
        v27 = &v39;
      }
      objc_msgSend(a3, "setTransform:", v27);
      CATransform3DMakeScale(&a, v24, v25, 1.0);
      if (a3)
        objc_msgSend(a3, "transform");
      else
        memset(&b, 0, sizeof(b));
      CATransform3DConcat(&v38, &a, &b);
      v35 = v38;
      objc_msgSend(a3, "setTransform:", &v35);
      if (v26)
      {
        CATransform3DMakeScale(&v33, 1.0, -1.0, 1.0);
        if (a3)
          objc_msgSend(a3, "transform");
        else
          memset(&v32, 0, sizeof(v32));
        CATransform3DConcat(&v34, &v33, &v32);
        v31 = v34;
        objc_msgSend(a3, "setTransform:", &v31);
      }
    }
  }
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

- (void)_resizeLayer:(id)a3 toSize:(CGSize)a4 updateLayer:(BOOL)a5 updateTransform:(BOOL)a6 caRenderer:(id)a7
{
  _BOOL8 v8;
  _BOOL8 v9;
  double height;
  double width;
  int v14;
  _QWORD v15[9];
  BOOL v16;
  BOOL v17;

  v8 = a6;
  v9 = a5;
  height = a4.height;
  width = a4.width;
  v14 = pthread_main_np();
  if (v14 || !-[SCNTextureCoreAnimationSource requiresMainThreadUpdates](self, "requiresMainThreadUpdates"))
  {
    -[SCNTextureCoreAnimationSource _resizeLayer:toSize:updateLayer:updateTransform:caRenderer:isMainThread:](self, "_resizeLayer:toSize:updateLayer:updateTransform:caRenderer:isMainThread:", a3, v9, v8, a7, v14 != 0, width, height);
  }
  else
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __92__SCNTextureCoreAnimationSource__resizeLayer_toSize_updateLayer_updateTransform_caRenderer___block_invoke;
    v15[3] = &unk_1EA59E428;
    v15[4] = self;
    v15[5] = a3;
    *(double *)&v15[7] = width;
    *(double *)&v15[8] = height;
    v16 = v9;
    v17 = v8;
    v15[6] = a7;
    dispatch_async(MEMORY[0x1E0C80D38], v15);
  }
}

uint64_t __92__SCNTextureCoreAnimationSource__resizeLayer_toSize_updateLayer_updateTransform_caRenderer___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resizeLayer:toSize:updateLayer:updateTransform:caRenderer:isMainThread:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 72), *(unsigned __int8 *)(a1 + 73), *(_QWORD *)(a1 + 48), 1, *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (double)__renderLayerUsingMetal:(id)a3 withCARenderer:(id)a4 engineContext:(__C3DEngineContext *)a5 viewport:(double)a6 atTime:(BOOL)a7 forceUpdate:(BOOL *)a8 didUpdate:
{
  double v8;
  double v11;
  id v15;
  double v16;
  double v17;
  double v18;
  float64x2_t rect2;
  double v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;

  v11 = v8;
  rect2 = vcvt_hight_f64_f32(*(float32x4_t *)&a6);
  objc_msgSend(a4, "bounds");
  v24.size.width = rect2.f64[0];
  v24.origin.x = 0.0;
  v24.origin.y = 0.0;
  v24.size.height = rect2.f64[1];
  if (!CGRectEqualToRect(v22, v24))
    objc_msgSend(a4, "setBounds:", 0.0, 0.0, *(_OWORD *)&rect2);
  v15 = (id)objc_msgSend(a4, "layer");
  if (v15 != a3 || a3 && (objc_msgSend(a3, "transform"), v21 > 0.0))
    -[SCNTextureCoreAnimationSource _resizeLayer:toSize:updateLayer:updateTransform:caRenderer:](self, "_resizeLayer:toSize:updateLayer:updateTransform:caRenderer:", a3, v15 != a3, 1, a4, *(_OWORD *)&rect2);
  objc_msgSend(a4, "beginFrameAtTime:timeStamp:", 0, v11);
  if (a7 || (objc_msgSend(a4, "updateBounds"), !CGRectIsEmpty(v23)))
  {
    if (a8)
      *a8 = 1;
    objc_msgSend(a4, "addUpdateRect:", 0.0, 0.0, *(_OWORD *)&rect2);
    objc_msgSend(a4, "render");
    objc_msgSend(a4, "nextFrameTime");
    v17 = v18;
    objc_msgSend(a4, "endFrame");
  }
  else
  {
    objc_msgSend(a4, "nextFrameTime");
    v17 = v16;
    objc_msgSend(a4, "endFrame");
    if (a8)
      *a8 = 0;
  }
  return v17;
}

- (double)__renderLayer:(id)a3 withCARenderer:(id)a4 engineContext:(__C3DEngineContext *)a5 viewport:(double)a6 atTime:(BOOL)a7 forceUpdate:(BOOL *)a8 didUpdate:
{
  double v8;
  double v11;
  __C3DRendererContext *v15;
  __int128 v16;
  id v17;
  double v18;
  double v19;
  int32x2_t v20;
  int IsEnabled;
  int v22;
  double v23;
  __int128 v25;
  __n128 v26;
  __n128 v27;
  float64x2_t rect2;
  int32x4_t v29;
  GLint v30[2];
  GLint params[2];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;

  v11 = v8;
  v27 = *(__n128 *)&a6;
  v15 = -[SCNTextureSource rendererContextForTextureSourceWithEngineContext:](self, "rendererContextForTextureSourceWithEngineContext:", a5);
  objc_msgSend(MEMORY[0x1E0CD0958], "setCurrentContext:", C3DRendererContextGetGLContext((uint64_t)v15));
  rect2 = vcvt_hight_f64_f32((float32x4_t)v27);
  *(double *)&v16 = C3DRendererContextGetViewport();
  v25 = v16;
  C3DRendererContextSetViewport(v27);
  objc_msgSend(a4, "bounds");
  v42.size.width = rect2.f64[0];
  v42.origin.x = 0.0;
  v42.origin.y = 0.0;
  v42.size.height = rect2.f64[1];
  if (!CGRectEqualToRect(v40, v42))
    objc_msgSend(a4, "setBounds:", 0.0, 0.0, *(_OWORD *)&rect2, v25);
  v17 = (id)objc_msgSend(a4, "layer", v25);
  if (v17 == a3)
  {
    if (!a3)
    {
      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      goto LABEL_5;
    }
    objc_msgSend(a3, "transform");
    if (*((double *)&v34 + 1) <= 0.0)
      goto LABEL_5;
  }
  -[SCNTextureCoreAnimationSource _resizeLayer:toSize:updateLayer:updateTransform:caRenderer:](self, "_resizeLayer:toSize:updateLayer:updateTransform:caRenderer:", a3, v17 != a3, 1, a4, *(_OWORD *)&rect2);
LABEL_5:
  objc_msgSend(a4, "beginFrameAtTime:timeStamp:", 0, v11);
  if (a7 || (objc_msgSend(a4, "updateBounds"), !CGRectIsEmpty(v41)))
  {
    if (a8)
      *a8 = 1;
    *(_QWORD *)v30 = 0;
    *(_QWORD *)params = 0;
    -[SCNTextureCoreAnimationSource clearValue](self, "clearValue");
    v29 = vdupq_lane_s32(v20, 0);
    C3DRendererContextClear((uint64_t)v15, 0x4000u, (float32x4_t *)&v29);
    IsEnabled = glIsEnabled(0xB44u);
    v22 = glIsEnabled(0xBE2u);
    glDisable(0xBE2u);
    glDisable(0xB44u);
    glGetIntegerv(0x80CBu, &params[1]);
    glGetIntegerv(0x80CAu, params);
    glGetIntegerv(0x80C9u, &v30[1]);
    glGetIntegerv(0x80C8u, v30);
    glBlendFunc(0x302u, 0x303u);
    C3DRendererContextUnbindProgramObject((uint64_t)v15);
    C3DRendererContextUnbindBufferObjects((uint64_t)v15);
    objc_msgSend(a4, "addUpdateRect:", 0.0, 0.0, *(_OWORD *)&rect2);
    objc_msgSend(a4, "render");
    objc_msgSend(a4, "nextFrameTime");
    v19 = v23;
    objc_msgSend(a4, "endFrame");
    if (IsEnabled)
      glEnable(0xB44u);
    glBlendFuncSeparate(v30[1], v30[0], params[1], params[0]);
    if (v22)
      glEnable(0xBE2u);
    C3DRendererContextSetViewport(v26);
  }
  else
  {
    objc_msgSend(a4, "nextFrameTime");
    v19 = v18;
    objc_msgSend(a4, "endFrame");
    if (a8)
      *a8 = 0;
  }
  return v19;
}

- (double)__updateTextureWithLayer:(id)a3 texture:(id)a4 engineContext:(__C3DEngineContext *)a5 sampler:(__C3DTextureSampler *)a6
{
  uint64_t Scene;
  uint64_t AnimationManager;
  NSObject *v13;
  double SystemTime;
  void *v15;
  double v16;
  double v17;
  double lastUpdate;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  double v29;
  double v30;
  double v31;
  double v32;
  char v33;
  CGRect v34;

  Scene = C3DEngineContextGetScene((uint64_t)a5);
  if (Scene)
  {
    AnimationManager = C3DSceneGetAnimationManager(Scene);
    if (!AnimationManager)
    {
      v13 = scn_default_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        -[SCNTextureCoreAnimationSource __updateTextureWithLayer:texture:engineContext:sampler:].cold.1(v13);
    }
    SystemTime = C3DAnimationManagerGetSystemTime(AnimationManager);
  }
  else
  {
    SystemTime = 0.0;
  }
  if (self->super._framebufferSize.width <= 0.0)
    return INFINITY;
  if (self->_lastUpdate == SystemTime)
    return INFINITY;
  v15 = (void *)objc_msgSend(+[SCNSourceRendererRegistry sharedRegistry](SCNSourceRendererRegistry, "sharedRegistry"), "sourceRendererForEngineContext:source:textureSource:targetTexture:", a5, a3, self, a4);
  objc_msgSend((id)objc_msgSend(v15, "layer"), "beginTime");
  v17 = CACurrentMediaTime() - v16;
  lastUpdate = self->_lastUpdate;
  if (lastUpdate == 0.0)
    goto LABEL_15;
  if (SystemTime >= self->_nextUpdateDate + -0.0166666667)
    goto LABEL_15;
  if (SystemTime == lastUpdate)
    return INFINITY;
  objc_msgSend(v15, "beginFrameAtTime:timeStamp:", 0, v17);
  objc_msgSend(v15, "updateBounds");
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;
  objc_msgSend(v15, "endFrame");
  v34.origin.x = v20;
  v34.origin.y = v22;
  v34.size.width = v24;
  v34.size.height = v26;
  if (CGRectIsEmpty(v34))
    return INFINITY;
LABEL_15:
  self->_lastUpdate = SystemTime;
  if (!a4)
    -[SCNTextureOffscreenRenderingSource _bindFramebuffer:](self, "_bindFramebuffer:", a5);
  v33 = 0;
  *(_QWORD *)&v29 = vcvt_hight_f32_f64(0, (float64x2_t)self->super._framebufferSize).u64[0];
  if (a4)
  {
    -[SCNTextureCoreAnimationSource __renderLayerUsingMetal:withCARenderer:engineContext:viewport:atTime:forceUpdate:didUpdate:](self, "__renderLayerUsingMetal:withCARenderer:engineContext:viewport:atTime:forceUpdate:didUpdate:", a3, v15, a5, 1, &v33, v29, v17);
    v27 = v30;
  }
  else
  {
    -[SCNTextureCoreAnimationSource __renderLayer:withCARenderer:engineContext:viewport:atTime:forceUpdate:didUpdate:](self, "__renderLayer:withCARenderer:engineContext:viewport:atTime:forceUpdate:didUpdate:", a3, v15, a5, 1, &v33, v29, v17);
    v27 = v31;
    -[SCNTextureOffscreenRenderingSource _unbindFramebuffer:](self, "_unbindFramebuffer:", a5);
  }
  if (v33 && C3DTextureSamplerGetMipFilter((uint64_t)a6))
    -[SCNTextureOffscreenRenderingSource _buildMipmaps:](self, "_buildMipmaps:", a5);
  self->_nextUpdateDate = 3.40282347e38;
  if (v27 != INFINITY && v27 != 3.40282347e38)
  {
    v32 = CACurrentMediaTime() - v27;
    if (v32 > 0.0)
      self->_nextUpdateDate = SystemTime + v32;
  }
  return v27;
}

- (void)cleanup:(__C3DRendererContext *)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SCNTextureCoreAnimationSource;
  -[SCNTextureOffscreenRenderingSource cleanup:](&v3, sel_cleanup_, a3);
}

- (CGSize)layerSizeInPixels
{
  CALayer *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  v2 = -[SCNTextureCoreAnimationSource layer](self, "layer");
  -[CALayer bounds](v2, "bounds");
  v4 = v3;
  v6 = v5;
  -[CALayer contentsScale](v2, "contentsScale");
  v8 = v7 * v6;
  v9 = v7 * v4;
  result.height = v8;
  result.width = v9;
  return result;
}

- (double)layerContentsScaleFactor
{
  double result;

  -[CALayer contentsScale](-[SCNTextureCoreAnimationSource layer](self, "layer"), "contentsScale");
  return result;
}

- (__C3DTexture)textureWithEngineContext:(__C3DEngineContext *)a3 textureSampler:(__C3DTextureSampler *)a4 nextFrameTime:(double *)a5
{
  double v9;
  double v10;
  __C3DTexture *v11;
  id v12;
  __C3DRendererContext *v13;
  uint64_t IOSurface;
  const void *v15;
  float64x2_t v16;
  double v17;
  uint64_t RendererContextGL;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  float64_t v28;
  float64_t v29;

  if (-[SCNTextureCoreAnimationSource layer](self, "layer"))
  {
    -[SCNTextureCoreAnimationSource layerSizeInPixels](self, "layerSizeInPixels");
    v11 = 0;
    if (v9 > 0.0)
    {
      v28 = v10;
      v29 = v9;
      if (v10 > 0.0)
      {
        v12 = (id)objc_msgSend(MEMORY[0x1E0CD0958], "currentContext");
        v13 = -[SCNTextureSource rendererContextForTextureSourceWithEngineContext:](self, "rendererContextForTextureSourceWithEngineContext:", a3);
        objc_msgSend(MEMORY[0x1E0CD0958], "setCurrentContext:", C3DRendererContextGetGLContext((uint64_t)v13));
        v11 = -[SCNTextureCoreAnimationSource _textureWithEngineContext:textureSampler:nextFrameTime:](self, "_textureWithEngineContext:textureSampler:nextFrameTime:", a3, a4, a5);
        glFlush();
        if (v12)
        {
          objc_msgSend(MEMORY[0x1E0CD0958], "setCurrentContext:", v12);

        }
        if (v11)
        {
          IOSurface = C3DTextureGetIOSurface((uint64_t)v11);
          if (IOSurface)
          {
            v15 = (const void *)IOSurface;
            v11 = -[SCNTextureSource glTextureCache](self, "glTextureCache");
            if (!v11)
            {
              v16.f64[0] = v29;
              v16.f64[1] = v28;
              v17 = COERCE_DOUBLE(vcvt_f32_f64(v16));
              RendererContextGL = C3DEngineContextGetRendererContextGL((uint64_t)a3);
              v11 = (__C3DTexture *)C3DCreateTextureFromIOSurface(RendererContextGL, v15, 6408, (uint64_t)a4, v17);
              -[SCNTextureSource setGlTextureCache:](self, "setGlTextureCache:", v11);
              CFRelease(v11);
            }
          }
        }
      }
    }
  }
  else
  {
    v19 = scn_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[SCNTextureCoreAnimationSource textureWithEngineContext:textureSampler:nextFrameTime:].cold.1(v19, v20, v21, v22, v23, v24, v25, v26);
    return 0;
  }
  return v11;
}

- (__C3DTexture)_textureWithEngineContext:(__C3DEngineContext *)a3 textureSampler:(__C3DTextureSampler *)a4 nextFrameTime:(double *)a5
{
  uint64_t Stats;
  double v10;
  CALayer *v11;
  CALayer *v12;
  double v13;
  __C3DTexture *v14;
  double v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  Stats = C3DEngineContextGetStats((uint64_t)a3);
  v10 = CACurrentMediaTime();
  v11 = -[SCNTextureCoreAnimationSource layer](self, "layer");
  if (v11)
  {
    v12 = v11;
    -[SCNTextureCoreAnimationSource layerSizeInPixels](self, "layerSizeInPixels");
    v14 = 0;
    if (v15 > 0.0 && v13 > 0.0)
    {
      v14 = -[SCNTextureOffscreenRenderingSource __prepareFramebufferWithSize:withEngineContext:textureSampler:needsStencil:](self, "__prepareFramebufferWithSize:withEngineContext:textureSampler:needsStencil:", a3, a4, 0);
      -[SCNTextureCoreAnimationSource __updateTextureWithLayer:texture:engineContext:sampler:](self, "__updateTextureWithLayer:texture:engineContext:sampler:", v12, 0, a3, a4);
      *(_QWORD *)a5 = v16;
    }
    *(double *)(Stats + 160) = *(double *)(Stats + 160) + CACurrentMediaTime() - v10;
  }
  else
  {
    v17 = scn_default_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[SCNTextureCoreAnimationSource textureWithEngineContext:textureSampler:nextFrameTime:].cold.1(v17, v18, v19, v20, v21, v22, v23, v24);
    return 0;
  }
  return v14;
}

- (id)metalTextureWithEngineContext:(__C3DEngineContext *)a3 textureSampler:(__C3DTextureSampler *)a4 nextFrameTime:(double *)a5 status:(id *)a6
{
  uint64_t RenderContext;
  void *v12;
  uint64_t Stats;
  double v14;
  CALayer *v15;
  CALayer *v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  id v21;
  void *v22;
  BOOL v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  void *v33;
  uint64_t v34;
  objc_super v36;

  if (-[SCNTextureCoreAnimationSource supportsMetal](self, "supportsMetal"))
  {
    RenderContext = C3DEngineContextGetRenderContext((uint64_t)a3);
    v12 = (void *)-[SCNMTLRenderContext device](RenderContext);
    Stats = C3DEngineContextGetStats((uint64_t)a3);
    v14 = CACurrentMediaTime();
    v15 = -[SCNTextureCoreAnimationSource layer](self, "layer");
    if (v15)
    {
      v16 = v15;
      -[SCNTextureCoreAnimationSource layerSizeInPixels](self, "layerSizeInPixels");
      v18 = v17;
      v20 = v19;
      self->super._framebufferSize.width = v17;
      self->super._framebufferSize.height = v19;
      v21 = -[SCNTextureSource MTLTextureCache](self, "MTLTextureCache");
      if (v21)
      {
        v22 = v21;
        v23 = 0;
      }
      else
      {
        v33 = (void *)objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", C3DMetalFramebufferPixelFormat(0), (unint64_t)v18, (unint64_t)v20, 0);
        objc_msgSend(v33, "setStorageMode:", 2);
        objc_msgSend(v33, "setUsage:", 5);
        v22 = (void *)objc_msgSend(v12, "newTextureWithDescriptor:", v33);
        -[SCNTextureSource setMTLTextureCache:](self, "setMTLTextureCache:", v22);

        v23 = 1;
      }
      a6->var0 = v23;
      a6->var1 = 1;
      -[SCNTextureCoreAnimationSource __updateTextureWithLayer:texture:engineContext:sampler:](self, "__updateTextureWithLayer:texture:engineContext:sampler:", v16, v22, a3, a4);
      *(_QWORD *)a5 = v34;
      v32 = CACurrentMediaTime();
    }
    else
    {
      v24 = scn_default_log();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        -[SCNTextureCoreAnimationSource textureWithEngineContext:textureSampler:nextFrameTime:].cold.1(v24, v25, v26, v27, v28, v29, v30, v31);
      v32 = CACurrentMediaTime();
      v22 = 0;
    }
    *(double *)(Stats + 160) = *(double *)(Stats + 160) + v32 - v14;
  }
  else
  {
    v36.receiver = self;
    v36.super_class = (Class)SCNTextureCoreAnimationSource;
    return -[SCNTextureSource metalTextureWithEngineContext:textureSampler:nextFrameTime:status:](&v36, sel_metalTextureWithEngineContext_textureSampler_nextFrameTime_status_, a3, a4, a5, a6);
  }
  return v22;
}

- (CALayer)layer
{
  return self->_layer;
}

- (void)__updateTextureWithLayer:(os_log_t)log texture:engineContext:sampler:.cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "animationManager";
  _os_log_fault_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. Null argument", (uint8_t *)&v1, 0xCu);
}

- (void)textureWithEngineContext:(uint64_t)a3 textureSampler:(uint64_t)a4 nextFrameTime:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, a1, a3, "Error: SCNTextureCoreAnimationSource::textureProxy -> no layer", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

@end
