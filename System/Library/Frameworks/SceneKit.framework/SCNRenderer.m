@implementation SCNRenderer

- (void)__CFObject
{
  return self->_engineContext;
}

uint64_t __42__SCNRenderer_setScene_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __42__SCNRenderer_setScene_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  const void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(const void **)(v1 + 216);
  if (v2)
    C3DEngineContextSetupWithScene(v2, (const void *)objc_msgSend(*(id *)(v1 + 8), "sceneRef"));
}

- (void)_setupOffscreenRendererWithSize:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  SCNSceneRenderer *privateRendererOwner;
  uint64_t v7;

  height = a3.height;
  width = a3.width;
  -[SCNRenderer setBackgroundColor:](self, "setBackgroundColor:", objc_msgSend(MEMORY[0x1E0CEA478], "clearColor"));
  *((_BYTE *)self + 129) |= 0x10u;
  self->_framebufferInfo.drawableSize.width = width;
  self->_framebufferInfo.drawableSize.height = height;
  privateRendererOwner = self->_privateRendererOwner;
  if (privateRendererOwner)
    v7 = -[SCNSceneRenderer antialiasingMode](privateRendererOwner, "antialiasingMode");
  else
    v7 = 2 * (self->_renderingAPI == 0);
  -[SCNRenderer set_antialiasingMode:](self, "set_antialiasingMode:", v7);
}

- (void)setBackgroundColor:(id)a3
{
  UIColor *backgroundColor;
  UIColor *v6;
  float32x4_t v7;
  uint64_t v8;
  C3DColor4 v9;

  backgroundColor = self->_backgroundColor;
  if (backgroundColor != a3)
  {

    v6 = (UIColor *)a3;
    self->_backgroundColor = v6;
    v7.i64[0] = -[UIColor scn_C3DColorIgnoringColorSpace:success:](v6, "scn_C3DColorIgnoringColorSpace:success:", 0, 0);
    v7.i64[1] = v8;
    v9 = (C3DColor4)vmulq_f32(v7, (float32x4_t)vdupq_n_s32(HIDWORD(v8)));
    v9.var0.var0[3] = *((float *)&v8 + 1);
    self->_c3dBackgroundColor = v9;
    -[SCNRenderer _c3dBackgroundColorDidChange](self, "_c3dBackgroundColorDidChange");
  }
}

- (void)_c3dBackgroundColorDidChange
{
  __C3DEngineContext *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = -[SCNRenderer _engineContext](self, "_engineContext");
  if (!v3)
  {
    v4 = scn_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      C3DEngineContextGetStats_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
  }
  C3DEngineContextSetMainClearColor((uint64_t)v3, *(_QWORD *)self->_c3dBackgroundColor.var0.var0, *(_QWORD *)&self->_c3dBackgroundColor.var0.var1.var2);
}

BOOL __35__SCNRenderer__defaultPOVForScene___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t v4;

  v4 = objc_msgSend(a2, "camera");
  if (v4)
    *a3 = 1;
  return v4 != 0;
}

- (void)_willRenderScene:(id)a3
{
  uint64_t Stats;
  double v6;
  double forceSystemTime;
  void *privateRendererOwner;

  if ((*(_WORD *)&self->_delegationConformance & 0x10) != 0
    || (*(_WORD *)&self->_selfDelegationConformance & 0x10) != 0
    || (*(_WORD *)&self->_privateRendererOwnerDelegationConformance & 0x10) != 0)
  {
    +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", 1);
    +[SCNTransaction setImmediateModeRestrictedContext:](SCNTransaction, "setImmediateModeRestrictedContext:", objc_msgSend(a3, "sceneRef"));
    Stats = C3DEngineContextGetStats((uint64_t)self->_engineContext);
    v6 = CACurrentMediaTime();
    -[SCNRenderer _getFrameIndex](self, "_getFrameIndex");
    kdebug_trace();
    forceSystemTime = self->_forceSystemTime;
    if (forceSystemTime == 0.0)
      forceSystemTime = self->_currentSystemTime;
    if ((*(_WORD *)&self->_privateRendererOwnerDelegationConformance & 0x10) != 0)
      -[SCNSceneRenderer _renderer:willRenderScene:atTime:](self->_privateRendererOwner, "_renderer:willRenderScene:atTime:", self->_privateRendererOwner, a3, forceSystemTime);
    if ((*(_WORD *)&self->_selfDelegationConformance & 0x10) != 0)
      -[SCNRenderer _renderer:willRenderScene:atTime:](self, "_renderer:willRenderScene:atTime:", self, a3, forceSystemTime);
    if ((*(_WORD *)&self->_delegationConformance & 0x10) != 0)
    {
      privateRendererOwner = self;
      if ((*((_BYTE *)self + 129) & 4) != 0)
        privateRendererOwner = self->_privateRendererOwner;
      objc_msgSend(self->_delegate, "renderer:willRenderScene:atTime:", privateRendererOwner, a3, forceSystemTime);
    }
    kdebug_trace();
    *(double *)(Stats + 168) = *(double *)(Stats + 168) + CACurrentMediaTime() - v6;
    +[SCNTransaction setImmediateModeRestrictedContext:](SCNTransaction, "setImmediateModeRestrictedContext:", 0);
    +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", 0);
  }
}

- (void)dealloc
{
  EAGLContext *v3;
  EAGLContext *v4;
  EAGLContext *glContext;
  uint64_t RendererContextGL;
  EAGLContext *v7;
  EAGLContext *v8;
  NSObject *renderingQueue;
  NSObject *prepareQueue;
  objc_super v11;

  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:", self);
  objc_storeWeak(&self->_delegate, 0);

  self->_preloadRenderer = 0;
  self->_technique = 0;

  self->_mtlTexture = 0;
  if (self->_glContext)
  {
    v3 = (EAGLContext *)(id)objc_msgSend(MEMORY[0x1E0CD0958], "currentContext");
    v4 = v3;
    glContext = self->_glContext;
    if (glContext && v3 != glContext)
      objc_msgSend(MEMORY[0x1E0CD0958], "setCurrentContext:");
  }
  else
  {
    v4 = 0;
  }
  if (self->_framebufferInfo.frameBuffer)
  {
    RendererContextGL = C3DEngineContextGetRendererContextGL((uint64_t)self->_engineContext);
    deleteGLFramebufferInfo((uint64_t *)&self->_framebufferInfo, RendererContextGL);
  }

  if (self->_engineContext)
  {
    objc_msgSend(+[SCNSourceRendererRegistry sharedRegistry](SCNSourceRendererRegistry, "sharedRegistry"), "removeSourceRenderersForEngineContext:", self->_engineContext);
    C3DEngineContextCleanup((uint64_t)self->_engineContext);
    CFRelease(self->_engineContext);
  }
  v7 = self->_glContext;
  if (v7)
  {
    v8 = v4;
    if (v4 == v7)
    {
      if (-[EAGLContext retainCount](v4, "retainCount", v4) != 2)
        goto LABEL_15;
      v8 = 0;
    }
    objc_msgSend(MEMORY[0x1E0CD0958], "setCurrentContext:", v8);
  }
LABEL_15:
  renderingQueue = self->__renderingQueue;
  if (renderingQueue)
    dispatch_release(renderingQueue);
  prepareQueue = self->__prepareQueue;
  if (prepareQueue)
    dispatch_release(prepareQueue);

  self->_glContext = 0;
  v11.receiver = self;
  v11.super_class = (Class)SCNRenderer;
  -[SCNRenderer dealloc](&v11, sel_dealloc);
}

- (void)setScene:(id)a3 completionHandler:(id)a4
{
  uint64_t v7;
  id v8;
  void *privateRendererOwner;
  __C3DEngineContext *engineContext;
  id AuthoringEnvironment;
  _QWORD v12[5];
  _QWORD v13[5];

  self->_scene = (SCNScene *)a3;
  v7 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __42__SCNRenderer_setScene_completionHandler___block_invoke;
  v13[3] = &unk_1EA59E4A0;
  v13[4] = self;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", 0, self, v13);
  if (a3 && (!self->_pointOfViewWasSet || -[SCNNode scene](self->_pointOfView, "scene") != self->_scene))
  {
    v8 = -[SCNRenderer _defaultPOVForScene:](self, "_defaultPOVForScene:", a3);
    if ((*((_BYTE *)self + 129) & 4) != 0)
      privateRendererOwner = self->_privateRendererOwner;
    else
      privateRendererOwner = self;
    objc_msgSend(privateRendererOwner, "setPointOfView:", v8);
    self->_pointOfViewWasSet = 0;
  }
  if (a4)
  {
    v12[0] = v7;
    v12[1] = 3221225472;
    v12[2] = __42__SCNRenderer_setScene_completionHandler___block_invoke_2;
    v12[3] = &unk_1EA5A2508;
    v12[4] = a4;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", 0, self, v12);
  }
  engineContext = self->_engineContext;
  if (engineContext)
  {
    AuthoringEnvironment = C3DEngineContextGetAuthoringEnvironment((uint64_t)engineContext, 0);
    if (AuthoringEnvironment)
      C3DAuthoringEnvironmentSceneDidChange((uint64_t)AuthoringEnvironment, (uint64_t)a3);
  }
}

- (void)setPointOfView:(id)a3
{
  id v3;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  SCNNode *v13;
  SCNNode *v14;
  double v15;
  double v16;
  int v17;
  uint64_t Scene;
  uint64_t v19;
  void *v21;
  void *v22;
  void *v23;
  SCNCamera *v24;
  void *v25;
  double height;
  CGFloat v27;
  double v28;
  double v29;
  double v30;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  float v48;
  double v49;
  uint64_t v50;
  uint64_t v51;
  double v52;
  void *v53;
  void *v54;
  const __CFString *v55;
  double v56;
  double v57;
  double v58;
  void *v59;
  void *v60;
  double v61;
  double v62;
  double v63;
  float32x2_t v64;
  float32x2_t v65;
  float32x2_t v66;
  uint32x2_t v67;
  float32x2_t v68;
  float32x2_t v69;
  float32x2_t v70;
  float32x2_t v71;
  void *v72;
  __int128 v73;
  float32x2_t v74;
  float32x2_t v75;
  uint32x2_t v76;
  float32x2_t v77;
  void *v78;
  float64x2_t v79;
  float64x2_t v80;
  float32x2_t v81;
  float32x2_t v82;
  uint32x2_t v83;
  float32x2_t v84;
  void *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t i;
  uint64_t v90;
  double v91;
  double v92;
  double v93;
  double v94;
  void *v95;
  SCNCamera *v96;
  id v97;
  void *v98;
  uint64_t v99;
  void *v100;
  void *v101;
  CAMediaTimingFunction *ImplicitAnimationTimingFunction;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  CGAffineTransform t2;
  CGAffineTransform t1;
  SCNMatrix4 m;
  SCNMatrix4 a;
  SCNMatrix4 v111;
  SCNMatrix4 v112;
  SCNMatrix4 v113;
  _QWORD v114[6];
  _BYTE v115[128];
  uint64_t v116;

  v116 = *MEMORY[0x1E0C80C00];
  if (self->_pointOfView != a3)
  {
    v3 = a3;
    self->_pointOfViewWasSet = 1;
    if (objc_msgSend(a3, "isPresentationInstance"))
    {
      v5 = scn_default_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        -[SCNRenderer setPointOfView:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
    v13 = -[SCNNode presentationNode](-[SCNRenderer pointOfView](self, "pointOfView"), "presentationNode");
    v14 = self->_pointOfView;
    self->_pointOfView = (SCNNode *)v3;
    +[SCNTransaction animationDuration](SCNTransaction, "animationDuration");
    v16 = v15;
    v17 = (v15 > 0.0) & ~+[SCNTransaction disableActions](SCNTransaction, "disableActions");
    Scene = C3DEngineContextGetScene((uint64_t)self->_engineContext);
    v19 = Scene;
    if (v17 == 1 && Scene != 0)
      v17 = C3DSceneIsPausedForEditing(Scene) ^ 1;
    if (+[SCNTransaction immediateMode](SCNTransaction, "immediateMode"))
    {
      v17 = 0;
    }
    else
    {
      if (!v13)
        v17 = 0;
      +[SCNTransaction begin](SCNTransaction, "begin");
    }
    v114[0] = MEMORY[0x1E0C809B0];
    v114[1] = 3221225472;
    v114[2] = __30__SCNRenderer_setPointOfView___block_invoke;
    v114[3] = &unk_1EA59F740;
    v114[4] = v3;
    v114[5] = self;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v19, self, v114);
    if (!v17)
      goto LABEL_107;
    ImplicitAnimationTimingFunction = +[SCNTransaction animationTimingFunction](SCNTransaction, "animationTimingFunction");
    if (!ImplicitAnimationTimingFunction)
      ImplicitAnimationTimingFunction = SCNKitGetImplicitAnimationTimingFunction();
    memset(&v113, 0, sizeof(v113));
    memset(&v112, 0, sizeof(v112));
    if (objc_msgSend(v3, "parentNode"))
    {
      v21 = (void *)objc_msgSend((id)objc_msgSend(v3, "parentNode"), "presentationNode");
      if (v21)
      {
        v111 = SCNMatrix4Identity;
        objc_msgSend(v21, "convertTransform:fromNode:", &v111, v13);
        goto LABEL_24;
      }
    }
    else if (v13)
    {
      -[SCNNode worldTransform](v13, "worldTransform");
      goto LABEL_24;
    }
    memset(&v112, 0, sizeof(v112));
LABEL_24:
    memset(&v111, 0, sizeof(v111));
    v22 = (void *)objc_msgSend(v3, "presentationNode");
    if (v22)
      objc_msgSend(v22, "transform");
    else
      memset(&v111, 0, sizeof(v111));
    m = v111;
    SCNMatrix4Invert(&a, &m);
    v111 = a;
    a = v112;
    m = v111;
    SCNMatrix4Mult(&v113, &a, &m);
    v23 = (void *)objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("transform"));
    objc_msgSend(v23, "setDuration:", v16);
    objc_msgSend(v23, "setTimingFunction:", ImplicitAnimationTimingFunction);
    objc_msgSend(v23, "setAdditive:", 1);
    a = v113;
    objc_msgSend(v23, "setFromValue:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithSCNMatrix4:", &a));
    a = SCNMatrix4Identity;
    objc_msgSend(v23, "setToValue:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithSCNMatrix4:", &a));
    objc_msgSend(v3, "addAnimation:forKey:", v23, 0);
    v24 = -[SCNNode camera](v13, "camera");
    v25 = (void *)objc_msgSend((id)objc_msgSend(v3, "presentationNode"), "camera");
    if (-[SCNCamera hasCustomProjectionTransform](v24, "hasCustomProjectionTransform")
      || (objc_msgSend(v25, "hasCustomProjectionTransform") & 1) != 0)
    {
LABEL_98:
      v105 = 0u;
      v106 = 0u;
      v103 = 0u;
      v104 = 0u;
      v86 = objc_msgSend(&unk_1EA5FF6F0, "countByEnumeratingWithState:objects:count:", &v103, v115, 16);
      if (v86)
      {
        v87 = v86;
        v88 = *(_QWORD *)v104;
        do
        {
          for (i = 0; i != v87; ++i)
          {
            if (*(_QWORD *)v104 != v88)
              objc_enumerationMutation(&unk_1EA5FF6F0);
            v90 = *(_QWORD *)(*((_QWORD *)&v103 + 1) + 8 * i);
            objc_msgSend((id)objc_msgSend(v25, "valueForKey:", v90), "doubleValue");
            v92 = v91;
            objc_msgSend((id)-[SCNCamera valueForKey:](v24, "valueForKey:", v90), "doubleValue");
            if (v92 != v93)
            {
              v94 = v93;
              v95 = v25;
              v96 = v24;
              v97 = v3;
              v98 = (void *)MEMORY[0x1E0CD2710];
              v99 = objc_msgSend(CFSTR("camera."), "stringByAppendingString:", v90);
              v100 = v98;
              v3 = v97;
              v24 = v96;
              v25 = v95;
              v101 = (void *)objc_msgSend(v100, "animationWithKeyPath:", v99);
              objc_msgSend(v101, "setDuration:", v16);
              objc_msgSend(v101, "setTimingFunction:", ImplicitAnimationTimingFunction);
              objc_msgSend(v101, "setFromValue:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v94 - v92));
              objc_msgSend(v101, "setToValue:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0));
              objc_msgSend(v101, "setAdditive:", 1);
              objc_msgSend(v3, "addAnimation:forKey:", v101, 0);
            }
          }
          v87 = objc_msgSend(&unk_1EA5FF6F0, "countByEnumeratingWithState:objects:count:", &v103, v115, 16);
        }
        while (v87);
      }
LABEL_107:
      if (!+[SCNTransaction immediateMode](SCNTransaction, "immediateMode"))
        +[SCNTransaction commit](SCNTransaction, "commit");
      return;
    }
    height = self->_framebufferInfo.drawableSize.height;
    if (height == 0.0)
      v27 = 1.0;
    else
      v27 = self->_framebufferInfo.drawableSize.width / height;
    if (objc_msgSend(v25, "useLegacyFov"))
    {
      objc_msgSend(v25, "xFov");
      v29 = v28;
      objc_msgSend(v25, "yFov");
      if (v30 == 0.0 && v29 == 0.0)
        v32 = 60.0;
      else
        v32 = v30;
      if (v29 != 0.0 && v32 != 0.0)
      {
        v33 = tan(v29 / 180.0 * 3.14159265);
        if (v33 / tan(v32 / 180.0 * 3.14159265) <= v27)
          v29 = 0.0;
        else
          v32 = 0.0;
      }
      *(_QWORD *)&a.m11 = 0;
      *(_QWORD *)&m.m11 = 0;
      if (-[SCNCamera useLegacyFov](v24, "useLegacyFov"))
      {
        -[SCNCamera xFov](v24, "xFov");
        v35 = v34;
        -[SCNCamera yFov](v24, "yFov");
        _SCNGetEffectiveLegacyFieldOfView((double *)&a.m11, (double *)&m.m11, v35, v36, v27);
        if (v29 == 0.0)
        {
          *(_QWORD *)&a.m11 = 0;
          v38 = *(double *)&m.m11;
          if (*(double *)&m.m11 == 0.0)
            v38 = _SCNConvertFieldOfViewFromHorizontalToVertical(0.0, v27);
          *(double *)&m.m11 = v38;
          v37 = 0.0;
        }
        else
        {
          v37 = *(double *)&a.m11;
          if (*(double *)&a.m11 == 0.0)
            v37 = _SCNConvertFieldOfViewFromVerticalToHorizontal(*(double *)&m.m11, v27);
          *(double *)&a.m11 = v37;
          *(_QWORD *)&m.m11 = 0;
          v38 = 0.0;
        }
      }
      else
      {
        -[SCNCamera fieldOfView](v24, "fieldOfView");
        v48 = v47;
        if (v29 == 0.0)
        {
          *(_QWORD *)&a.m11 = 0;
          v38 = v48;
          v37 = 0.0;
          if (-[SCNCamera projectionDirection](v24, "projectionDirection"))
            v38 = _SCNConvertFieldOfViewFromHorizontalToVertical(v38, v27);
        }
        else
        {
          v37 = v48;
          if (-[SCNCamera projectionDirection](v24, "projectionDirection") != SCNCameraProjectionDirectionHorizontal)
            v37 = _SCNConvertFieldOfViewFromVerticalToHorizontal(v37, v27);
          *(double *)&a.m11 = v37;
          v38 = 0.0;
        }
        *(double *)&m.m11 = v38;
      }
      if (v29 == 0.0)
      {
        if (v32 == 0.0)
          goto LABEL_83;
        if (v38 == v32)
        {
          v55 = CFSTR("camera.xFov");
          goto LABEL_81;
        }
        v54 = (void *)objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("camera.yFov"));
        objc_msgSend(v54, "setDuration:", v16);
        objc_msgSend(v54, "setTimingFunction:", ImplicitAnimationTimingFunction);
        objc_msgSend(v54, "setFromValue:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v38 - v32));
        v55 = CFSTR("camera.xFov");
      }
      else
      {
        if (v37 == v29)
        {
          v55 = CFSTR("camera.yFov");
          goto LABEL_81;
        }
        v54 = (void *)objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("camera.xFov"));
        objc_msgSend(v54, "setDuration:", v16);
        objc_msgSend(v54, "setTimingFunction:", ImplicitAnimationTimingFunction);
        objc_msgSend(v54, "setFromValue:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v37 - v29));
        v55 = CFSTR("camera.yFov");
      }
      objc_msgSend(v54, "setToValue:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0));
      objc_msgSend(v54, "setAdditive:", 1);
      objc_msgSend(v3, "addAnimation:forKey:", v54, 0);
LABEL_81:
      v53 = (void *)objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", v55);
      objc_msgSend(v53, "setDuration:", v16);
      objc_msgSend(v53, "setTimingFunction:", ImplicitAnimationTimingFunction);
      objc_msgSend(v53, "setFromValue:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0));
      objc_msgSend(v53, "setToValue:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0));
LABEL_82:
      objc_msgSend(v3, "addAnimation:forKey:", v53, 0);
LABEL_83:
      if (-[SCNCamera usesOrthographicProjection](v24, "usesOrthographicProjection"))
      {
        if (objc_msgSend(v25, "usesOrthographicProjection"))
        {
          -[SCNCamera orthographicScale](v24, "orthographicScale");
          v57 = v56;
          objc_msgSend(v25, "orthographicScale");
          if (v57 != v58)
          {
            v59 = (void *)objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("camera.orthographicScale"));
            objc_msgSend(v59, "setDuration:", v16);
            objc_msgSend(v59, "setTimingFunction:", ImplicitAnimationTimingFunction);
            v60 = (void *)MEMORY[0x1E0CB37E8];
            -[SCNCamera orthographicScale](v24, "orthographicScale");
            v62 = v61;
            objc_msgSend(v25, "orthographicScale");
            objc_msgSend(v59, "setFromValue:", objc_msgSend(v60, "numberWithDouble:", v62 - v63));
            objc_msgSend(v59, "setToValue:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0));
            objc_msgSend(v59, "setAdditive:", 1);
            objc_msgSend(v3, "addAnimation:forKey:", v59, 0);
          }
        }
      }
      -[SCNCamera lensShift](v24, "lensShift");
      v65 = v64;
      objc_msgSend(v25, "lensShift");
      v67 = (uint32x2_t)vmvn_s8((int8x8_t)vceq_f32(v65, v66));
      if ((vpmax_u32(v67, v67).u32[0] & 0x80000000) != 0)
      {
        -[SCNCamera lensShift](v24, "lensShift");
        v69 = v68;
        objc_msgSend(v25, "lensShift");
        v71 = vsub_f32(v69, v70);
        v72 = (void *)objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("camera.lensShift"));
        objc_msgSend(v72, "setDuration:", v16);
        objc_msgSend(v72, "setTimingFunction:", ImplicitAnimationTimingFunction);
        objc_msgSend(v72, "setFromValue:", objc_msgSend(MEMORY[0x1E0CB3B18], "SCN_valueWithCGPoint:", vcvtq_f64_f32(v71)));
        objc_msgSend(v72, "setToValue:", objc_msgSend(MEMORY[0x1E0CB37E8], "SCN_valueWithCGPoint:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8)));
        objc_msgSend(v72, "setAdditive:", 1);
        objc_msgSend(v3, "addAnimation:forKey:", v72, 0);
      }
      v73 = 0uLL;
      memset(&a, 0, 48);
      if (v24)
      {
        -[SCNCamera postProjectionTransform](v24, "postProjectionTransform");
        v73 = 0uLL;
      }
      *(_OWORD *)&m.m21 = v73;
      *(_OWORD *)&m.m31 = v73;
      *(_OWORD *)&m.m11 = v73;
      if (v25)
        objc_msgSend(v25, "postProjectionTransform");
      *(_OWORD *)&t1.a = *(_OWORD *)&a.m11;
      *(_OWORD *)&t1.c = *(_OWORD *)&a.m21;
      *(_OWORD *)&t1.tx = *(_OWORD *)&a.m31;
      *(_OWORD *)&t2.a = *(_OWORD *)&m.m11;
      *(_OWORD *)&t2.c = *(_OWORD *)&m.m21;
      *(_OWORD *)&t2.tx = *(_OWORD *)&m.m31;
      if (!CGAffineTransformEqualToTransform(&t1, &t2))
      {
        v74 = vcvt_f32_f64(*(float64x2_t *)&a.m31);
        v75 = vcvt_f32_f64(*(float64x2_t *)&m.m31);
        v76 = (uint32x2_t)vmvn_s8((int8x8_t)vceq_f32(v74, v75));
        if ((vpmax_u32(v76, v76).u32[0] & 0x80000000) != 0)
        {
          v77 = vsub_f32(v74, v75);
          v78 = (void *)objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("camera.postProjectionTransformTranslation"));
          objc_msgSend(v78, "setDuration:", v16);
          objc_msgSend(v78, "setTimingFunction:", ImplicitAnimationTimingFunction);
          objc_msgSend(v78, "setFromValue:", objc_msgSend(MEMORY[0x1E0CB3B18], "SCN_valueWithCGPoint:", vcvtq_f64_f32(v77)));
          objc_msgSend(v78, "setToValue:", objc_msgSend(MEMORY[0x1E0CB37E8], "SCN_valueWithCGPoint:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8)));
          objc_msgSend(v78, "setAdditive:", 1);
          objc_msgSend(v3, "addAnimation:forKey:", v78, 0);
        }
        v79.f64[0] = *(float64_t *)&a.m11;
        v79.f64[1] = *(float64_t *)&a.m23;
        v80.f64[0] = *(float64_t *)&m.m11;
        v80.f64[1] = *(float64_t *)&m.m23;
        v81 = vcvt_f32_f64(v79);
        v82 = vcvt_f32_f64(v80);
        v83 = (uint32x2_t)vmvn_s8((int8x8_t)vceq_f32(v81, v82));
        if ((vpmax_u32(v83, v83).u32[0] & 0x80000000) != 0)
        {
          v84 = vsub_f32(v81, v82);
          v85 = (void *)objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("camera.postProjectionTransformScale"));
          objc_msgSend(v85, "setDuration:", v16);
          objc_msgSend(v85, "setTimingFunction:", ImplicitAnimationTimingFunction);
          objc_msgSend(v85, "setFromValue:", objc_msgSend(MEMORY[0x1E0CB3B18], "SCN_valueWithCGPoint:", vcvtq_f64_f32(v84)));
          objc_msgSend(v85, "setToValue:", objc_msgSend(MEMORY[0x1E0CB37E8], "SCN_valueWithCGPoint:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8)));
          objc_msgSend(v85, "setAdditive:", 1);
          objc_msgSend(v3, "addAnimation:forKey:", v85, 0);
        }
      }
      goto LABEL_98;
    }
    objc_msgSend(v25, "fieldOfView");
    v40 = v39;
    if (-[SCNCamera useLegacyFov](v24, "useLegacyFov"))
    {
      *(_QWORD *)&a.m11 = 0;
      *(_QWORD *)&m.m11 = 0;
      -[SCNCamera xFov](v24, "xFov");
      v42 = v41;
      -[SCNCamera yFov](v24, "yFov");
      _SCNGetEffectiveLegacyFieldOfView((double *)&a.m11, (double *)&m.m11, v42, v43, v27);
      if (objc_msgSend(v25, "projectionDirection") == 1)
      {
        v44 = *(double *)&a.m11;
        if (*(double *)&a.m11 == 0.0)
        {
          v45 = *(double *)&m.m11;
          v46 = v27;
LABEL_59:
          v52 = _SCNConvertFieldOfViewFromVerticalToHorizontal(v45, v46);
LABEL_63:
          v44 = v52;
        }
LABEL_64:
        if (v44 == v40)
          goto LABEL_83;
        v53 = (void *)objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("camera.fieldOfView"));
        objc_msgSend(v53, "setDuration:", v16);
        objc_msgSend(v53, "setTimingFunction:", ImplicitAnimationTimingFunction);
        objc_msgSend(v53, "setFromValue:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v44 - v40));
        objc_msgSend(v53, "setToValue:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0));
        objc_msgSend(v53, "setAdditive:", 1);
        goto LABEL_82;
      }
      v44 = *(double *)&m.m11;
      if (*(double *)&m.m11 != 0.0)
        goto LABEL_64;
      v45 = *(double *)&a.m11;
      v46 = v27;
    }
    else
    {
      -[SCNCamera fieldOfView](v24, "fieldOfView");
      v44 = v49;
      v50 = objc_msgSend(v25, "projectionDirection");
      if (v50 == -[SCNCamera projectionDirection](v24, "projectionDirection"))
        goto LABEL_64;
      v51 = objc_msgSend(v25, "projectionDirection");
      v45 = v44;
      v46 = v27;
      if (v51 == 1)
        goto LABEL_59;
    }
    v52 = _SCNConvertFieldOfViewFromHorizontalToVertical(v45, v46);
    goto LABEL_63;
  }
}

- (id)_defaultPOVForScene:(id)a3
{
  void *v5;
  id result;
  __n128 *v7;
  int v8;
  id v9;
  SCNNode *v10;

  v5 = (void *)objc_msgSend((id)objc_msgSend(a3, "rootNode"), "childNodesPassingTest:", &__block_literal_global_73);
  if (objc_msgSend(v5, "count"))
    return (id)objc_msgSend(v5, "objectAtIndex:", 0);
  v7 = (__n128 *)objc_msgSend(a3, "sceneRef");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = -[SCNSceneRenderer _isEditor](self->_privateRendererOwner, "_isEditor");
  else
    v8 = 0;
  result = C3DCreateDefaultCameraNode(v7, v8);
  if (result)
  {
    v9 = result;
    v10 = +[SCNNode nodeWithNodeRef:](SCNNode, "nodeWithNodeRef:", result);
    CFRelease(v9);
    return v10;
  }
  return result;
}

- (SCNNode)pointOfView
{
  return self->_pointOfView;
}

void __30__SCNRenderer_setPointOfView___block_invoke(uint64_t a1)
{
  float32x4_t *v2;
  uint64_t PointOfViewIfAny;
  const __CFDictionary *Camera;
  uint64_t v5;
  int HasDepthOfField;
  _BOOL4 v7;
  const __CFDictionary *v8;
  uint64_t v9;
  int v10;
  _BOOL4 v11;
  int v12;
  uint64_t SharedInstance;
  const void *v14;

  v2 = (float32x4_t *)objc_msgSend(*(id *)(a1 + 32), "nodeRef");
  PointOfViewIfAny = C3DEngineContextGetPointOfViewIfAny(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 216));
  if (PointOfViewIfAny && (Camera = C3DNodeGetCamera(PointOfViewIfAny)) != 0)
  {
    v5 = (uint64_t)Camera;
    HasDepthOfField = C3DCameraHasDepthOfField((uint64_t)Camera);
    v7 = C3DCameraGetTechnique(v5) != 0;
  }
  else
  {
    HasDepthOfField = 0;
    v7 = 0;
  }
  C3DEngineContextSetPointOfView(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 216), v2);
  if (v2)
  {
    v8 = C3DNodeGetCamera((uint64_t)v2);
    if (v8)
    {
      v9 = (uint64_t)v8;
      v10 = C3DCameraHasDepthOfField((uint64_t)v8);
      v11 = C3DCameraGetTechnique(v9) != 0;
    }
    else
    {
      v10 = 0;
      v11 = 0;
    }
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:", CFSTR("kC3DSceneDidUpdateNotification"), C3DGetScene(v2));
    v12 = v10 != HasDepthOfField || v11;
    if ((v12 | v7) == 1)
    {
      SharedInstance = C3DNotificationCenterGetSharedInstance();
      v14 = (const void *)C3DGetScene(v2);
      C3DNotificationCenterPostNotification(SharedInstance, CFSTR("kC3DNotificationEngineContextInvalidatePasses"), v14, 0, 1u);
    }
  }
}

- (BOOL)_preloadResource:(id)a3 abortHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CGSize drawableSize;
  __n128 v11;
  char v12;
  BOOL v13;
  uint64_t RendererContextGL;
  float32x4_t v16;

  if (self->_renderingAPI)
  {
    v7 = objc_msgSend(MEMORY[0x1E0CD0958], "currentContext");
    objc_msgSend(MEMORY[0x1E0CD0958], "setCurrentContext:", -[SCNRenderer context](self, "context"));
  }
  else
  {
    v7 = 0;
  }
  v8 = objc_msgSend(a3, "sceneRef");
  v9 = v8;
  if (v8)
    C3DSceneLock(v8);
  -[SCNRenderer lock](self, "lock");
  *((_BYTE *)self + 129) |= 0x20u;
  if (!self->_renderingAPI)
  {
    drawableSize = self->_framebufferInfo.drawableSize;
    v16 = vcvt_hight_f32_f64(0, (float64x2_t)drawableSize);
    C3DEngineContextSetDrawableSize((uint64_t)self->_engineContext, COERCE_DOUBLE(vcvt_f32_f64((float64x2_t)drawableSize)));
    -[SCNRenderer adjustViewportForRendering:](self, "adjustViewportForRendering:", *(double *)v16.i64);
    C3DEngineContextSetViewport(v11, (__n128 *)self->_engineContext);
LABEL_10:
    -[SCNRenderer _beginFrame](self, "_beginFrame", *(_OWORD *)&v16);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = C3DWarmupSceneVRAMResourcesForEngineContext((const void *)objc_msgSend(a3, "sceneRef"), (__n128 *)self->_engineContext, (uint64_t)a4);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v12 = C3DWarmupNodeTreeVRAMResourcesForEngineContext(objc_msgSend(a3, "nodeRef"), (uint64_t)self->_engineContext, (uint64_t)a4);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v12 = C3DWarmupGeometryVRAMResourcesForEngineContext(objc_msgSend(a3, "geometryRef"), (uint64_t)self->_engineContext, (uint64_t)a4);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v13 = 0;
            goto LABEL_22;
          }
          v12 = C3DWarmupMaterialVRAMResourcesForEngineContext(objc_msgSend(a3, "materialRef"), (uint64_t)self->_engineContext, (uint64_t)a4);
        }
      }
    }
    v13 = v12;
LABEL_22:
    if (self->_renderingAPI)
    {
      RendererContextGL = C3DEngineContextGetRendererContextGL((uint64_t)self->_engineContext);
      C3DRendererContextUnbindFramebuffer(RendererContextGL);
      glFlush();
    }
    else
    {
      -[SCNRenderer _endFrame](self, "_endFrame");
    }
    *((_BYTE *)self + 129) &= ~0x20u;
    -[SCNRenderer unlock](self, "unlock");
    if (v9)
      C3DSceneUnlock(v9);
    if (self->_renderingAPI)
      objc_msgSend(MEMORY[0x1E0CD0958], "setCurrentContext:", v7);
    return v13;
  }
  if (-[SCNRenderer _installContext](self, "_installContext"))
  {
    glViewport(0, 0, 32, 32);
    goto LABEL_10;
  }
  if (v9)
    C3DSceneUnlock(v9);
  -[SCNRenderer unlock](self, "unlock");
  return 0;
}

- (void)_endFrame
{
  SCNRenderer *privateRendererOwner;
  SCNRenderer *delegate;
  double SystemTime;
  SCNRenderer *v6;
  uint64_t RendererContextGL;
  SCNRenderer *v8;
  double v9;

  if (self->_renderContext)
  {
    if ((*(_WORD *)&self->_selfDelegationConformance & 0x40) != 0)
    {
      SystemTime = C3DEngineContextGetSystemTime((uint64_t)self->_engineContext);
      v6 = self;
      v8 = self;
    }
    else
    {
      if ((*(_WORD *)&self->_privateRendererOwnerDelegationConformance & 0x40) != 0)
      {
        privateRendererOwner = (SCNRenderer *)self->_privateRendererOwner;
        SystemTime = C3DEngineContextGetSystemTime((uint64_t)self->_engineContext);
        v6 = privateRendererOwner;
      }
      else
      {
        if ((*(_WORD *)&self->_delegationConformance & 0x40) == 0)
        {
LABEL_14:
          -[SCNMTLRenderContext endFrameWaitingUntilCompleted:status:error:]((uint64_t)self->_renderContext, (*((unsigned __int8 *)self + 129) >> 4) & 1, 0, 0);
          return;
        }
        privateRendererOwner = self;
        if ((*((_BYTE *)self + 129) & 4) != 0)
          privateRendererOwner = (SCNRenderer *)self->_privateRendererOwner;
        delegate = (SCNRenderer *)self->_delegate;
        SystemTime = C3DEngineContextGetSystemTime((uint64_t)self->_engineContext);
        v6 = delegate;
      }
      v8 = privateRendererOwner;
    }
    -[SCNRenderer _renderer:inputTimeForCurrentFrameWithTime:](v6, "_renderer:inputTimeForCurrentFrameWithTime:", v8, SystemTime);
    objc_msgSend(-[SCNRenderer metalLayer](self, "metalLayer"), "setInputTime:", v9);
    goto LABEL_14;
  }
  RendererContextGL = C3DEngineContextGetRendererContextGL((uint64_t)self->_engineContext);
  if (self->_framebufferInfo.frameBuffer)
    C3DRendererContextUnbindFramebuffer(RendererContextGL);
}

- (void)_beginFrame
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. _beginFrame - unexpected rendering API", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_prepareRenderTarget
{
  char v3;

  v3 = *((_BYTE *)self + 129);
  if ((v3 & 1) != 0)
  {
    if (self->_renderingAPI)
    {
      -[SCNRenderer _deleteGLFramebuffer](self, "_deleteGLFramebuffer");
    }
    else
    {

      self->_mtlTexture = 0;
    }
    v3 = *((_BYTE *)self + 129) & 0xFE;
    *((_BYTE *)self + 129) = v3;
  }
  if ((v3 & 0x20) != 0 && !self->_renderingAPI)
  {
    -[SCNRenderer _createPrepareFramebufferIfNeeded](self, "_createPrepareFramebufferIfNeeded");
  }
  else if ((v3 & 0x10) != 0)
  {
    -[SCNRenderer _createOffscreenFramebufferIfNeeded](self, "_createOffscreenFramebufferIfNeeded");
  }
  else if (self->_renderingAPI)
  {
    -[SCNRenderer _prepareGLRenderTarget](self, "_prepareGLRenderTarget");
  }
}

- (void)_createPrepareFramebufferIfNeeded
{
  MTLTexture *mtlTexture;
  uint64_t v4;
  char v5;
  char v6;
  void *v7;

  if (!self->_renderingAPI)
  {
    mtlTexture = self->_mtlTexture;
    if ((*((_BYTE *)self + 129) & 1) != 0)
    {

      self->_mtlTexture = 0;
      *((_BYTE *)self + 129) &= ~1u;
    }
    else if (mtlTexture)
    {
      return;
    }
    v4 = -[SCNRenderer _preparePixelFormat](self, "_preparePixelFormat");
    if (!v4)
    {
      v5 = -[SCNMTLRenderContext wantsWideGamut]((uint64_t)self->_renderContext);
      if (self->__antialiasingMode)
        v6 = v5 | 8;
      else
        v6 = v5;
      v4 = C3DMetalFramebufferPixelFormat(v6 | 0x10u);
    }
    v7 = (void *)objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", v4, 32, 32, 0);
    objc_msgSend(v7, "setUsage:", 5);
    objc_msgSend(v7, "setStorageMode:", 0);
    if (C3DEngineContextGetPreferredRenderMode((uint64_t)self->_engineContext) == 1)
    {
      objc_msgSend(v7, "setArrayLength:", C3DEngineContextGetEyeCount((uint64_t)self->_engineContext));
      objc_msgSend(v7, "setTextureType:", 3);
    }
    self->_mtlTexture = (MTLTexture *)objc_msgSend(-[SCNRenderer metalDevice](self, "metalDevice"), "newTextureWithDescriptor:", v7);
  }
}

- (unint64_t)_preparePixelFormat
{
  return self->__preparePixelFormat;
}

- (void)setJitteringEnabled:(BOOL)a3
{
  *((_BYTE *)self + 288) = *((_BYTE *)self + 288) & 0xFE | a3;
}

- (id)_renderContextMetal
{
  return self->_renderContext;
}

- (void)unlock
{
  -[SCNRecursiveLock unlock](self->_lock, "unlock");
}

- (void)lock
{
  -[SCNRecursiveLock lock](self->_lock, "lock");
}

- (id)_initWithOptions:(id)a3 isPrivateRenderer:(BOOL)a4 privateRendererOwner:(id)a5 clearsOnDraw:(BOOL)a6 context:(void *)a7 renderingAPI:(unint64_t)a8
{
  _BOOL4 v12;
  SCNRenderer *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  char v18;
  char isKindOfClass;
  char v20;
  char v21;
  void *v22;
  int v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  objc_class *v33;
  const char *v34;
  NSObject *v35;
  Class v36;
  NSObject *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  Class v46;
  objc_super v48;

  v12 = a4;
  v48.receiver = self;
  v48.super_class = (Class)SCNRenderer;
  v14 = -[SCNRenderer init](&v48, sel_init);
  v15 = (uint64_t)v14;
  if (v14)
  {
    v14->_scene = 0;
    v14->_viewpoints = 0;
    v14->_contentScaleFactor = 1.0;
    v14->_engineContext = (__C3DEngineContext *)C3DEngineContextCreateWithOptions((const __CFDictionary *)a3);
    *(_QWORD *)(v15 + 224) = a8;
    *(_BYTE *)(v15 + 129) |= 0x40u;
    if (!a8)
      C3DNotifyMetalIsUsed();
    *(_QWORD *)(v15 + 32) = objc_alloc_init(SCNRecursiveLock);
    objc_msgSend((id)v15, "_updateEngineCallbacks");
    C3DEngineContextSetRenderingOptionForKey(*(_QWORD *)(v15 + 216), CFSTR("frustumCulling"), (void *)*MEMORY[0x1E0C9AE50]);
    C3DEngineContextSetClearsOnDraw(*(_QWORD *)(v15 + 216), a6);
    v16 = *(_QWORD *)(v15 + 216);
    if (v16)
    {
      C3DEngineContextSetUserInfo(v16, v15);
    }
    else
    {
      v17 = scn_default_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[SCNRenderer _initWithOptions:isPrivateRenderer:privateRendererOwner:clearsOnDraw:context:renderingAPI:].cold.3();
    }
    *(_BYTE *)(v15 + 193) = 1;
    if (v12)
      v18 = 4;
    else
      v18 = 0;
    *(_BYTE *)(v15 + 129) = *(_BYTE *)(v15 + 129) & 0xFB | v18;
    *(_QWORD *)(v15 + 344) = a5;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v20 = *(_BYTE *)(v15 + 129);
    if ((isKindOfClass & 1) != 0)
      v21 = 8;
    else
      v21 = 0;
    *(_BYTE *)(v15 + 129) = v20 & 0xF7 | v21;
    if ((v20 & 4) != 0)
    {
      v22 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      objc_msgSend(v22, "addObserver:selector:name:object:", v15, sel__UIOrientationDidChangeNotification_, *MEMORY[0x1E0CEB280], 0);
      if ((*(_BYTE *)(v15 + 129) & 8) != 0)
        v23 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(v15 + 344), "window"), "windowScene"), "interfaceOrientation");
      else
        v23 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication"), "statusBarOrientation");
      C3DEngineContextSetInterfaceOrientation(*(_QWORD *)(v15 + 216), v23);
    }
    *(_QWORD *)(v15 + 56) = 0;
    if (v12)
    {
      if ((_initWithOptions_isPrivateRenderer_privateRendererOwner_clearsOnDraw_context_renderingAPI__first & 1) == 0)
      {
        _initWithOptions_isPrivateRenderer_privateRendererOwner_clearsOnDraw_context_renderingAPI__first = 1;
        getpid();
        proc_disable_wakemon();
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v24 = scn_default_log();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
          -[SCNRenderer _initWithOptions:isPrivateRenderer:privateRendererOwner:clearsOnDraw:context:renderingAPI:].cold.2(v24, v25, v26, v27, v28, v29, v30, v31);
      }
      v32 = (void *)MEMORY[0x1E0CB3940];
      v33 = (objc_class *)objc_opt_class();
      v34 = (const char *)objc_msgSend((id)objc_msgSend(v32, "stringWithFormat:", CFSTR("com.apple.scenekit.renderingQueue.%@%p"), NSStringFromClass(v33), *(_QWORD *)(v15 + 344)), "cStringUsingEncoding:", 1);
      v35 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
      *(_QWORD *)(v15 + 40) = dispatch_queue_create(v34, v35);
    }
    if (*(_QWORD *)(v15 + 224))
    {
      if (a7)
      {
        objc_msgSend((id)v15, "setContext:", a7);
        v36 = NSClassFromString(CFSTR("SKGlobalSharedContextRegistry"));
        -[objc_class setPrefersOpenGL:](NSClassFromString(CFSTR("SKSCNRenderer")), "setPrefersOpenGL:", 1);
        if (!-[objc_class globalGLSharedContext](v36, "globalGLSharedContext"))
          -[objc_class setGlobalGLSharedContext:](v36, "setGlobalGLSharedContext:", a7);
      }
    }
    else
    {
      if ((objc_msgSend(a7, "conformsToProtocol:", &unk_1F040F090) & 1) == 0)
      {
        v37 = scn_default_log();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
          -[SCNRenderer _initWithOptions:isPrivateRenderer:privateRendererOwner:clearsOnDraw:context:renderingAPI:].cold.1(v37, v38, v39, v40, v41, v42, v43, v44);
      }
      *(_QWORD *)(v15 + 280) = -[SCNMTLRenderContext initWithDevice:engineContext:]([SCNMTLRenderContext alloc], (MTLDevice *)a7, *(__C3DEngineContext **)(v15 + 216));
      v45 = SCNSampleCountForAntialiasingMode(objc_msgSend((id)v15, "_antialiasingMode"));
      -[SCNMTLRenderContext setSampleCount:](*(_QWORD *)(v15 + 280), v45);
      C3DEngineContextSetRenderContext(*(_QWORD *)(v15 + 216), *(CFTypeRef *)(v15 + 280));

      v46 = NSClassFromString(CFSTR("SKGlobalSharedContextRegistry"));
      if ((objc_opt_respondsToSelector() & 1) != 0)
        -[objc_class setGlobalMetalDevice:](v46, "setGlobalMetalDevice:", a7);
    }
  }
  return (id)v15;
}

- (void)_updateEngineCallbacks
{
  __C3DEngineContext *engineContext;
  _QWORD *RenderCallbacks;
  __int16 delegationConformance;
  __int16 selfDelegationConformance;

  engineContext = self->_engineContext;
  if (engineContext)
  {
    RenderCallbacks = (_QWORD *)C3DEngineContextGetRenderCallbacks((uint64_t)engineContext);
    delegationConformance = (__int16)self->_delegationConformance;
    if ((delegationConformance & 0x10) != 0
      || (*(_WORD *)&self->_selfDelegationConformance & 0x10) != 0
      || (*(_WORD *)&self->_privateRendererOwnerDelegationConformance & 0x10) != 0)
    {
      *RenderCallbacks = _willRenderSceneEngineContextCallback;
      delegationConformance = (__int16)self->_delegationConformance;
    }
    if ((delegationConformance & 0x20) != 0
      || (*(_WORD *)&self->_selfDelegationConformance & 0x20) != 0
      || (*(_WORD *)&self->_privateRendererOwnerDelegationConformance & 0x20) != 0)
    {
      RenderCallbacks[1] = _didRenderSceneEngineContextCallback;
      delegationConformance = (__int16)self->_delegationConformance;
    }
    if ((delegationConformance & 0x80) != 0
      || (*(_WORD *)&self->_selfDelegationConformance & 0x80) != 0
      || (*(_WORD *)&self->_privateRendererOwnerDelegationConformance & 0x80) != 0)
    {
      RenderCallbacks[3] = _readSubdivCacheEngineContextCallback;
      delegationConformance = (__int16)self->_delegationConformance;
    }
    if ((delegationConformance & 0x100) != 0
      || (selfDelegationConformance = (__int16)self->_selfDelegationConformance, (selfDelegationConformance & 0x100) != 0)
      || (*(_WORD *)&self->_privateRendererOwnerDelegationConformance & 0x100) != 0)
    {
      RenderCallbacks[4] = _writeSubdivCacheEngineContextCallback;
      selfDelegationConformance = (__int16)self->_selfDelegationConformance;
    }
    if ((selfDelegationConformance & 0x200) != 0
      || (*(_WORD *)&self->_privateRendererOwnerDelegationConformance & 0x200) != 0)
    {
      RenderCallbacks[5] = _wantsMainPassCustomPostProcessEncodingEngineContextCallback;
      RenderCallbacks[6] = _mainPassCustomPostProcessUsesExtraRenderTargetEngineContextCallback;
      RenderCallbacks[7] = _useSpecificMainPassClearColorEngineContextCallback;
      RenderCallbacks[8] = _encodeMainPassCustomPostProcessEngineContextCallback;
    }
    RenderCallbacks[2] = _renderOverlayEngineContextCallback;
  }
}

- (void)set_antialiasingMode:(unint64_t)a3
{
  uint64_t v4;
  uint64_t RendererContextGL;
  SCNMTLRenderContext *renderContext;

  if (self->__antialiasingMode != a3)
  {
    self->__antialiasingMode = a3;
    -[SCNRenderer _invalidateFramebuffer](self, "_invalidateFramebuffer");
    v4 = SCNSampleCountForAntialiasingMode(-[SCNRenderer _antialiasingMode](self, "_antialiasingMode"));
    RendererContextGL = C3DEngineContextGetRendererContextGL((uint64_t)-[SCNRenderer _engineContext](self, "_engineContext"));
    if (RendererContextGL)
    {
      C3DRendererContextSetSampleCount(RendererContextGL, v4);
    }
    else
    {
      renderContext = self->_renderContext;
      if (renderContext)
        -[SCNMTLRenderContext setSampleCount:]((uint64_t)renderContext, v4);
    }
  }
}

- (void)_invalidateFramebuffer
{
  *((_BYTE *)self + 129) |= 1u;
}

- (unint64_t)_antialiasingMode
{
  if (C3DPreferencesGetBool(5))
    return 0;
  else
    return self->__antialiasingMode;
}

- (void)_didRenderScene:(id)a3
{
  uint64_t Stats;
  double v6;
  double forceSystemTime;
  void *privateRendererOwner;

  if ((*(_WORD *)&self->_delegationConformance & 0x20) != 0
    || (*(_WORD *)&self->_selfDelegationConformance & 0x20) != 0
    || (*(_WORD *)&self->_privateRendererOwnerDelegationConformance & 0x20) != 0)
  {
    +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", 1);
    +[SCNTransaction setImmediateModeRestrictedContext:](SCNTransaction, "setImmediateModeRestrictedContext:", objc_msgSend(a3, "sceneRef"));
    Stats = C3DEngineContextGetStats((uint64_t)self->_engineContext);
    v6 = CACurrentMediaTime();
    -[SCNRenderer _getFrameIndex](self, "_getFrameIndex");
    kdebug_trace();
    if (!self->_renderingAPI && !-[SCNMTLRenderContext clientCommandBuffer]((uint64_t)self->_renderContext))
      objc_msgSend((id)-[SCNMTLRenderContext currentCommandBuffer]((uint64_t)self->_renderContext), "enqueue");
    forceSystemTime = self->_forceSystemTime;
    if (forceSystemTime == 0.0)
      forceSystemTime = self->_currentSystemTime;
    if ((*(_WORD *)&self->_delegationConformance & 0x20) != 0)
    {
      privateRendererOwner = self;
      if ((*((_BYTE *)self + 129) & 4) != 0)
        privateRendererOwner = self->_privateRendererOwner;
      objc_msgSend(self->_delegate, "renderer:didRenderScene:atTime:", privateRendererOwner, a3, forceSystemTime);
    }
    if ((*(_WORD *)&self->_selfDelegationConformance & 0x20) != 0)
      -[SCNRenderer _renderer:didRenderScene:atTime:](self, "_renderer:didRenderScene:atTime:", self, a3, forceSystemTime);
    if ((*(_WORD *)&self->_privateRendererOwnerDelegationConformance & 0x20) != 0)
      -[SCNSceneRenderer _renderer:didRenderScene:atTime:](self->_privateRendererOwner, "_renderer:didRenderScene:atTime:", self->_privateRendererOwner, a3, forceSystemTime);
    kdebug_trace();
    *(double *)(Stats + 168) = *(double *)(Stats + 168) + CACurrentMediaTime() - v6;
    +[SCNTransaction setImmediateModeRestrictedContext:](SCNTransaction, "setImmediateModeRestrictedContext:", 0);
    +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", 0);
  }
}

- (int64_t)_getFrameIndex
{
  return (int)C3DEngineContextGetFrameIndex((uint64_t)self->_engineContext);
}

- (id)_renderingQueue
{
  return self->__renderingQueue;
}

- (BOOL)prepareObject:(id)a3 shouldAbortBlock:(id)a4
{
  uint64_t v7;
  _BOOL4 v8;

  objc_sync_enter(self);
  if (!self->_renderingAPI && (*((_BYTE *)self + 129) & 8) != 0)
    v7 = -[SCNSceneRenderer layer](self->_privateRendererOwner, "layer");
  else
    v7 = 0;
  v8 = -[SCNRenderer _preparePreloadRenderer:](self, "_preparePreloadRenderer:", v7);
  if (v8)
  {
    +[SCNTransaction flush](SCNTransaction, "flush");
    -[SCNRenderer _prepareObject:shouldAbortBlock:](self, "_prepareObject:shouldAbortBlock:", a3, a4);
    -[SCNRenderer _releasePreloadRenderer](self, "_releasePreloadRenderer");
  }
  objc_sync_exit(self);
  return v8;
}

- (void)_releasePreloadRenderer
{
  __C3DEngineContext *v3;
  uint64_t RendererContextGL;
  _QWORD v5[5];

  v3 = -[SCNRenderer _engineContext](self->_preloadRenderer, "_engineContext");
  if (v3 && (RendererContextGL = C3DEngineContextGetRendererContextGL((uint64_t)v3)) != 0)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __38__SCNRenderer__releasePreloadRenderer__block_invoke;
    v5[3] = &__block_descriptor_40_e5_v8__0l;
    v5[4] = RendererContextGL;
    C3DRendererContextExecuteOnContext(RendererContextGL, (uint64_t)v5);
  }
  else
  {

    self->_preloadRenderer = 0;
  }
}

- (BOOL)_preparePreloadRenderer:(id)a3
{
  void *v4;
  uint64_t v5;
  SCNOffscreenRenderer *v7;
  _QWORD *RenderGraph;
  unint64_t v9;
  unsigned __int16 v10;
  id v11;
  __C3DEngineContext *v12;
  const __CFDictionary *RenderingOptionForKey;
  _BOOL4 v14;
  NSObject *v15;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  if (self->_preloadRenderer)
  {
LABEL_15:
    LOBYTE(v14) = 1;
    return v14;
  }
  if (!self->_renderingAPI)
  {
    v7 = +[SCNOffscreenRenderer offscreenRendererWithDevice:sceneRendererDelegate:size:](SCNOffscreenRenderer, "offscreenRendererWithDevice:sceneRendererDelegate:size:", -[SCNRenderer metalDevice](self, "metalDevice"), self, 32.0, 32.0);
    self->_preloadRenderer = &v7->super;
    -[SCNRenderer set_antialiasingMode:](v7, "set_antialiasingMode:", self->__antialiasingMode);
    -[SCNRenderer set_resourceManagerMonitor:](self->_preloadRenderer, "set_resourceManagerMonitor:", objc_loadWeak((id *)&self->_resourceManagerMonitor));
    if ((*((_BYTE *)self + 129) & 8) != 0)
      -[SCNRenderer set_preparePixelFormat:](self->_preloadRenderer, "set_preparePixelFormat:", objc_msgSend(a3, "pixelFormat"));
    RenderGraph = (_QWORD *)C3DEngineContextGetRenderGraph((uint64_t)-[SCNRenderer _engineContext](self->_preloadRenderer, "_engineContext"));
    v9 = -[SCNRenderer colorPixelFormat](self, "colorPixelFormat");
    if (v9)
      v10 = v9;
    else
      v10 = 80;
    C3DRenderGraphSetWarmupPixelFormat(RenderGraph, v10);
    goto LABEL_11;
  }
  if (-[SCNRenderer context](self, "context", a3))
  {
    v4 = -[SCNRenderer context](self, "context");
    v17 = *MEMORY[0x1E0CD0D30];
    v18[0] = objc_msgSend(v4, "sharegroup");
    v5 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    self->_preloadRenderer = (SCNRenderer *)+[SCNOffscreenRenderer offscreenRendererWithContext:size:](SCNOffscreenRenderer, "offscreenRendererWithContext:size:", (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CD0958]), "initWithAPI:properties:", 2, v5), 32.0, 32.0);
LABEL_11:
    if (-[SCNRenderer _collectCompilationErrors](self, "_collectCompilationErrors"))
    {
      C3DEngineContextGetRendererContextGL((uint64_t)self->_engineContext);
      v11 = -[SCNRenderer _renderContextMetal](self->_preloadRenderer, "_renderContextMetal");
      if (v11)
        -[SCNMTLRenderContext setCollectsCompilationErrors:]((uint64_t)v11, 1);
    }
    v12 = -[SCNRenderer _engineContext](self->_preloadRenderer, "_engineContext");
    RenderingOptionForKey = C3DEngineContextGetRenderingOptionForKey((uint64_t)-[SCNRenderer _engineContext](self, "_engineContext"), CFSTR("defaultLight"));
    C3DEngineContextSetRenderingOptionForKey((uint64_t)v12, CFSTR("defaultLight"), RenderingOptionForKey);
    goto LABEL_15;
  }
  v15 = scn_default_log();
  v14 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
  if (v14)
  {
    -[SCNRenderer _preparePreloadRenderer:].cold.1();
    LOBYTE(v14) = 0;
  }
  return v14;
}

- (__C3DEngineContext)_engineContext
{
  return self->_engineContext;
}

- (id)metalDevice
{
  return (id)-[SCNMTLRenderContext device]((uint64_t)self->_renderContext);
}

- (void)set_resourceManagerMonitor:(id)a3
{
  _SCNSceneRendererResourceManagerMonitor **p_resourceManagerMonitor;
  id v6;
  SCNRenderer *v7;

  p_resourceManagerMonitor = &self->_resourceManagerMonitor;
  if (objc_loadWeak((id *)&self->_resourceManagerMonitor) != a3)
  {
    if (a3)
      v6 = a3;
    else
      v6 = 0;
    if (a3)
      v7 = self;
    else
      v7 = 0;
    objc_storeWeak((id *)p_resourceManagerMonitor, v6);
    -[SCNMTLRenderContext setResourceManagerMonitor:]((id *)&self->_renderContext->super.isa, v7);
    -[SCNMTLRenderContext setResourceManagerMonitor:]((id *)-[SCNRenderer _renderContextMetal](self->_preloadRenderer, "_renderContextMetal"), v7);
  }
}

- (void)set_preparePixelFormat:(unint64_t)a3
{
  self->__preparePixelFormat = a3;
}

- (unint64_t)colorPixelFormat
{
  MTLTexture *mtlTexture;

  if (self->_renderingAPI)
    return 0;
  if ((*((_BYTE *)self + 129) & 0x10) != 0)
    mtlTexture = self->_mtlTexture;
  else
    mtlTexture = -[SCNRenderer metalLayer](self, "metalLayer");
  return -[MTLTexture pixelFormat](mtlTexture, "pixelFormat");
}

- (id)metalLayer
{
  if ((*((_BYTE *)self + 129) & 8) != 0)
    return (id)-[SCNSceneRenderer scn_backingLayer](self->_privateRendererOwner, "scn_backingLayer");
  else
    return 0;
}

- (BOOL)_prepareObject:(id)a3 shouldAbortBlock:(id)a4
{
  __C3DEngineContext *v7;
  uint64_t RendererContextGL;
  double v9;
  uint64_t Stats;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  SCNRenderer *preloadRenderer;
  _QWORD *v15;
  BOOL v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t RenderContext;
  uint64_t v20;
  void *v21;
  _QWORD v23[5];
  _QWORD v24[6];

  -[SCNRenderer _getFrameIndex](self, "_getFrameIndex");
  kdebug_trace();
  v7 = -[SCNRenderer _engineContext](self->_preloadRenderer, "_engineContext");
  RendererContextGL = C3DEngineContextGetRendererContextGL((uint64_t)v7);
  if (RendererContextGL)
  {
    Stats = C3DEngineContextGetStats((uint64_t)v7);
    v9 = C3DEngineStatsResetResourceStats(Stats);
  }
  v11 = objc_msgSend(MEMORY[0x1E0CB38A8], "currentProgress", v9);
  if (v11)
  {
    v12 = v11;
    v13 = (void *)MEMORY[0x1DF0D4CF4]();
    preloadRenderer = self->_preloadRenderer;
    if (a4)
    {
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __47__SCNRenderer__prepareObject_shouldAbortBlock___block_invoke;
      v24[3] = &unk_1EA5A2530;
      v24[4] = v12;
      v24[5] = a4;
      v15 = v24;
    }
    else
    {
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __47__SCNRenderer__prepareObject_shouldAbortBlock___block_invoke_2;
      v23[3] = &unk_1EA5A2558;
      v23[4] = v12;
      v15 = v23;
    }
    v16 = -[SCNRenderer _preloadResource:abortHandler:](preloadRenderer, "_preloadResource:abortHandler:", a3, v15);
    objc_autoreleasePoolPop(v13);
  }
  else
  {
    v16 = -[SCNRenderer _preloadResource:abortHandler:](self->_preloadRenderer, "_preloadResource:abortHandler:", a3, a4);
  }
  if (RendererContextGL)
  {
    v17 = C3DEngineContextGetStats((uint64_t)v7);
    v18 = C3DEngineContextGetStats((uint64_t)-[SCNRenderer _engineContext](self, "_engineContext"));
    C3DEngineStatsMergeResourceStats(v17, v18);
  }
  else
  {
    RenderContext = C3DEngineContextGetRenderContext((uint64_t)v7);
    v20 = C3DEngineContextGetRenderContext((uint64_t)self->_engineContext);
    if (RenderContext && v20)
    {
      v21 = (void *)-[SCNMTLRenderContext compilationErrors](v20);
      objc_msgSend(v21, "addEntriesFromDictionary:", -[SCNMTLRenderContext compilationErrors](RenderContext));
    }
  }
  kdebug_trace();
  return v16;
}

- (BOOL)_collectCompilationErrors
{
  uint64_t RendererContextGL;
  uint64_t RenderContext;

  RendererContextGL = C3DEngineContextGetRendererContextGL((uint64_t)self->_engineContext);
  if (RendererContextGL)
    return C3DRendererContextGetCompilationErrorsCollection(RendererContextGL);
  RenderContext = C3DEngineContextGetRenderContext((uint64_t)self->_engineContext);
  return self->_renderContext && -[SCNMTLRenderContext collectsCompilationErrors](RenderContext);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_commandBufferStatusMonitor);
  objc_destroyWeak((id *)&self->_resourceManagerMonitor);
}

- (void)setContext:(id)a3
{
  uint64_t v5;
  void *privateRendererOwner;
  SCNAuthoringEnvironment *v7;
  uint64_t RendererContextGL;
  uint64_t v9;
  int v10;

  if (self->_engineContext && self->_glContext != a3)
  {
    v5 = objc_msgSend(MEMORY[0x1E0CD0958], "currentContext");
    if (self->_glContext)
    {
      objc_msgSend(MEMORY[0x1E0CD0958], "setCurrentContext:");
      -[SCNRenderer _deleteGLFramebuffer](self, "_deleteGLFramebuffer");

    }
    self->_glContext = (EAGLContext *)a3;
    objc_msgSend(MEMORY[0x1E0CD0958], "setCurrentContext:", v5);
    if (self->_glContext)
    {
      objc_msgSend(MEMORY[0x1E0CD0958], "setCurrentContext:");
      C3DEngineContextSetGLContext((uint64_t)self->_engineContext, self->_glContext);
      if (self->_authoringEnvironment)
      {
        if (self->_privateRendererOwner)
          privateRendererOwner = self->_privateRendererOwner;
        else
          privateRendererOwner = self;
        v7 = (SCNAuthoringEnvironment *)+[SCNAuthoringEnvironment authoringEnvironmentForSceneRenderer:createIfNeeded:](SCNAuthoringEnvironment, "authoringEnvironmentForSceneRenderer:createIfNeeded:", privateRendererOwner, 1);

        self->_authoringEnvironment = v7;
      }
      C3DFXInvalidatePasses((uint64_t)self->_engineContext);
      RendererContextGL = C3DEngineContextGetRendererContextGL((uint64_t)self->_engineContext);
      if (RendererContextGL)
      {
        v9 = RendererContextGL;
        v10 = SCNSampleCountForAntialiasingMode(-[SCNRenderer _antialiasingMode](self, "_antialiasingMode"));
        C3DRendererContextSetSampleCount(v9, v10);
      }
    }
  }
}

- (BOOL)showsStatistics
{
  return self->_showStatistics;
}

- (SKScene)overlaySKScene
{
  return (SKScene *)self->_overlayScene;
}

- (void)set_wantsSceneRendererDelegationMessages:(BOOL)a3
{
  char v4;
  __int16 v5;
  __int16 v6;
  __int16 v7;
  __int16 v8;
  __int16 v9;
  __int16 v10;
  __int16 v11;
  __int16 v12;
  __int16 v13;
  __int16 selfDelegationConformance;

  if (a3)
    v4 = 8;
  else
    v4 = 0;
  *((_BYTE *)self + 288) = *((_BYTE *)self + 288) & 0xF7 | v4;
  if (!a3 || (*((_BYTE *)self + 129) & 4) != 0)
  {
    v13 = 0;
    selfDelegationConformance = *(_WORD *)&self->_selfDelegationConformance & 0xFE00;
  }
  else
  {
    *(_WORD *)&self->_selfDelegationConformance = *(_WORD *)&self->_selfDelegationConformance & 0xFFFE | objc_opt_respondsToSelector() & 1;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = 2;
    else
      v5 = 0;
    *(_WORD *)&self->_selfDelegationConformance = *(_WORD *)&self->_selfDelegationConformance & 0xFFFD | v5;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = 4;
    else
      v6 = 0;
    *(_WORD *)&self->_selfDelegationConformance = *(_WORD *)&self->_selfDelegationConformance & 0xFFFB | v6;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = 8;
    else
      v7 = 0;
    *(_WORD *)&self->_selfDelegationConformance = *(_WORD *)&self->_selfDelegationConformance & 0xFFF7 | v7;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v8 = 16;
    else
      v8 = 0;
    *(_WORD *)&self->_selfDelegationConformance = *(_WORD *)&self->_selfDelegationConformance & 0xFFEF | v8;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v9 = 32;
    else
      v9 = 0;
    *(_WORD *)&self->_selfDelegationConformance = *(_WORD *)&self->_selfDelegationConformance & 0xFFDF | v9;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v10 = 128;
    else
      v10 = 0;
    *(_WORD *)&self->_selfDelegationConformance = *(_WORD *)&self->_selfDelegationConformance & 0xFF7F | v10;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v11 = 256;
    else
      v11 = 0;
    *(_WORD *)&self->_selfDelegationConformance = *(_WORD *)&self->_selfDelegationConformance & 0xFEFF | v11;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v12 = 64;
    else
      v12 = 0;
    *(_WORD *)&self->_selfDelegationConformance = *(_WORD *)&self->_selfDelegationConformance & 0xFFBF | v12;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v13 = 512;
    else
      v13 = 0;
    selfDelegationConformance = (__int16)self->_selfDelegationConformance;
  }
  *(_WORD *)&self->_selfDelegationConformance = selfDelegationConformance & 0xFDFF | v13;
  -[SCNRenderer _updateEngineCallbacks](self, "_updateEngineCallbacks");
}

- (SCNRenderer)init
{
  -[SCNRenderer doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return self;
}

+ (SCNRenderer)rendererWithDevice:(id)device options:(NSDictionary *)options
{
  void *v5;
  SCNRenderer *result;

  v5 = device;
  if (device)
    return (SCNRenderer *)(id)objc_msgSend(objc_alloc((Class)a1), "_initWithOptions:isPrivateRenderer:privateRendererOwner:clearsOnDraw:context:renderingAPI:", options, 0, 0, 0, v5, 0);
  result = +[SCNView deviceForOptions:](SCNView, "deviceForOptions:", options);
  v5 = result;
  if (result)
    return (SCNRenderer *)(id)objc_msgSend(objc_alloc((Class)a1), "_initWithOptions:isPrivateRenderer:privateRendererOwner:clearsOnDraw:context:renderingAPI:", options, 0, 0, 0, v5, 0);
  return result;
}

+ (SCNRenderer)rendererWithContext:(EAGLContext *)context options:(NSDictionary *)options
{
  EAGLContext *v4;
  id v6;

  v4 = context;
  if (!context)
  {
    v6 = objc_alloc(MEMORY[0x1E0CD0958]);
    v4 = (EAGLContext *)(id)objc_msgSend(v6, "initWithAPI:properties:", 2, MEMORY[0x1E0C9AA70]);
  }
  return (SCNRenderer *)(id)objc_msgSend(objc_alloc((Class)a1), "_initWithOptions:isPrivateRenderer:privateRendererOwner:clearsOnDraw:context:renderingAPI:", 0, 0, 0, 0, v4, __inferRenderingAPIFromGLContext(v4));
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  NSString *v5;
  SCNScene *v6;
  SCNNode *v7;
  uint64_t v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = -[SCNRenderer scene](self, "scene");
  v7 = -[SCNRenderer pointOfView](self, "pointOfView");
  -[SCNRenderer sceneTime](self, "sceneTime");
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p: scene = %@, pointOfView = %@, sceneTime = %f, context = %p>"), v5, self, v6, v7, v8, -[SCNRenderer context](self, "context"));
}

- (unint64_t)renderingAPI
{
  return self->_renderingAPI;
}

- (id)currentCommandBuffer
{
  if (self->_renderingAPI)
    return 0;
  else
    return (id)-[SCNMTLRenderContext currentCommandBuffer]((uint64_t)self->_renderContext);
}

- (MTLRenderPassDescriptor)currentRenderPassDescriptor
{
  if (self->_renderingAPI)
    return 0;
  else
    return (MTLRenderPassDescriptor *)-[SCNMTLRenderContext currentRenderPassDescriptor]((uint64_t)self->_renderContext);
}

- (MTLRenderCommandEncoder)currentRenderCommandEncoder
{
  if (self->_renderingAPI)
    return 0;
  else
    return (MTLRenderCommandEncoder *)-[SCNMTLRenderContext currentRenderCommandEncoder]((uint64_t)self->_renderContext);
}

- (MTLDevice)device
{
  if (self->_renderingAPI)
    return 0;
  else
    return (MTLDevice *)-[SCNMTLRenderContext device]((uint64_t)self->_renderContext);
}

- (MTLCommandQueue)commandQueue
{
  if (self->_renderingAPI)
    return 0;
  else
    return (MTLCommandQueue *)-[SCNMTLRenderContext commandQueue]((uint64_t)self->_renderContext);
}

- (unint64_t)depthPixelFormat
{
  if (self->_renderingAPI)
    return 0;
  else
    return 252;
}

- (unint64_t)stencilPixelFormat
{
  return 0;
}

- (BOOL)_installContext
{
  void *v2;

  if (self->_renderContext)
    goto LABEL_4;
  v2 = -[SCNRenderer context](self, "context");
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CD0958], "setCurrentContext:", v2);
LABEL_4:
    LOBYTE(v2) = 1;
  }
  return (char)v2;
}

- (void)_installViewport
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. invalid renderer", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_clearBackBuffer
{
  SCNMTLRenderContext *renderContext;
  __C3DEngineContext *engineContext;
  uint64_t RenderGraph;
  uint64_t RendererContextGL;
  C3DColor4 *p_c3dBackgroundColor;
  GLbitfield v8;

  renderContext = self->_renderContext;
  engineContext = self->_engineContext;
  if (renderContext)
  {
    RenderGraph = C3DEngineContextGetRenderGraph((uint64_t)engineContext);
    C3DRenderGraphClearDrawable(RenderGraph);
  }
  else
  {
    RendererContextGL = C3DEngineContextGetRendererContextGL((uint64_t)engineContext);
    if (self->_backgroundColor)
    {
      p_c3dBackgroundColor = &self->_c3dBackgroundColor;
      v8 = 17664;
    }
    else
    {
      v8 = 1280;
      p_c3dBackgroundColor = 0;
    }
    C3DRendererContextClear(RendererContextGL, v8, (float32x4_t *)p_c3dBackgroundColor);
  }
}

- (void)_setContentsScaleFactor:(double)a3
{
  float v3;
  uint64_t RendererContextGL;

  v3 = a3;
  self->_contentScaleFactor = v3;
  if (self->_renderContext)
  {
    -[SCNMTLRenderContext setContentScaleFactor:]((uint64_t)self->_renderContext, a3);
  }
  else
  {
    RendererContextGL = C3DEngineContextGetRendererContextGL((uint64_t)self->_engineContext);
    if (RendererContextGL)
      C3DRendererContextSetContentScaleFactor(RendererContextGL, v3);
  }
}

- (double)_contentsScaleFactor
{
  return self->_contentScaleFactor;
}

- (CGSize)_backingSize
{
  double width;
  double height;
  CGSize result;

  width = self->_framebufferInfo.drawableSize.width;
  height = self->_framebufferInfo.drawableSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)_setBackingSize:(CGSize)a3
{
  double height;
  double width;

  height = a3.height;
  width = a3.width;
  if (a3.width != self->_framebufferInfo.drawableSize.width || a3.height != self->_framebufferInfo.drawableSize.height)
  {
    self->_framebufferInfo.drawableSize = a3;
    -[SCNRenderer _invalidateFramebuffer](self, "_invalidateFramebuffer");
    if (self->_renderContext && !self->_renderingAPI && (*((_BYTE *)self + 129) & 8) != 0)
      objc_msgSend(-[SCNRenderer metalLayer](self, "metalLayer"), "setDrawableSize:", width, height);
    if (self->_overlayScene)
      -[SCNRenderer _prepareSKRenderer](self, "_prepareSKRenderer");
  }
}

- (void)_deleteGLFramebuffer
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. invalid context", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_resolveAndDiscardGL
{
  uint64_t RendererContextGL;
  uint64_t v4;
  double Size;
  __int128 v6;
  __int128 v7;

  RendererContextGL = C3DEngineContextGetRendererContextGL((uint64_t)self->_engineContext);
  if (self->_framebufferInfo.multisamplingFrameBuffer)
  {
    v4 = RendererContextGL;
    Size = C3DFramebufferGetSize((uint64_t)self->_framebufferInfo.frameBuffer);
    *(_QWORD *)&v6 = 0;
    *((double *)&v6 + 1) = Size;
    v7 = v6;
    C3DRendererContextResolveFramebuffer(v4, (uint64_t)self->_framebufferInfo.frameBuffer, (uint64_t)self->_framebufferInfo.multisamplingFrameBuffer, 1, 1, &v7);
  }
}

- (void)_prepareGLRenderTarget
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. invalid framebuffer state", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __37__SCNRenderer__prepareGLRenderTarget__block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 344), "scn_backingLayer");
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 272), "renderbufferStorage:fromDrawable:", 36161, v2) & 1) == 0)
  {
    v3 = scn_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __37__SCNRenderer__prepareGLRenderTarget__block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

- (void)_createOffscreenFramebufferIfNeeded
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: framebuffer width must be > 0", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)set_superSamplingFactor:(double)a3
{
  float v3;

  v3 = a3;
  C3DEngineContextSetSuperSamplingFactor((uint64_t)self->_engineContext, v3);
}

- (double)_superSamplingFactor
{
  return C3DEngineContextGetSuperSamplingFactor((uint64_t)self->_engineContext);
}

- (void)set_aspectRatio:(double)a3
{
  self->__aspectRatio = a3;
}

- (double)_aspectRatio
{
  return self->__aspectRatio;
}

- (void)set_screenTransform:(SCNMatrix4 *)a3
{
  __int128 v3;
  __int128 v4;
  _OWORD v5[4];

  v3 = *(_OWORD *)&a3->m21;
  v5[0] = *(_OWORD *)&a3->m11;
  v5[1] = v3;
  v4 = *(_OWORD *)&a3->m41;
  v5[2] = *(_OWORD *)&a3->m31;
  v5[3] = v4;
  -[SCNMTLRenderContext setScreenTransform:]((uint64_t)self->_renderContext, (uint64_t)v5);
}

- (SCNMatrix4)_screenTransform
{
  SCNMatrix4 *result;

  -[SCNMTLRenderContext screenTransform](self->_renderContext, retstr);
  return result;
}

- (__C3DRendererContext)_rendererContextGL
{
  __C3DRendererContext *result;

  result = (__C3DRendererContext *)self->_engineContext;
  if (result)
    return (__C3DRendererContext *)C3DEngineContextGetRendererContextGL((uint64_t)result);
  return result;
}

- (BOOL)autoenablesDefaultLighting
{
  __C3DEngineContext *v3;
  BOOL v4;
  NSObject *v5;

  -[SCNRenderer lock](self, "lock");
  v3 = -[SCNRenderer _engineContext](self, "_engineContext");
  if (v3)
  {
    v4 = C3DEngineContextGetRenderingOptionForKey((uint64_t)v3, CFSTR("defaultLight")) == (const __CFDictionary *)*MEMORY[0x1E0C9AE50];
  }
  else
  {
    v5 = scn_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[SCNRenderer autoenablesDefaultLighting].cold.1();
    v4 = 0;
  }
  -[SCNRenderer unlock](self, "unlock");
  return v4;
}

- (void)setAutoenablesDefaultLighting:(BOOL)a3
{
  _BOOL4 v3;
  __C3DEngineContext *v5;
  uint64_t v6;
  uint64_t Scene;
  uint64_t v8;
  void **v9;
  NSObject *v10;
  void **v11;

  v3 = a3;
  -[SCNRenderer lock](self, "lock");
  v5 = -[SCNRenderer _engineContext](self, "_engineContext");
  if (v5)
  {
    v6 = (uint64_t)v5;
    Scene = C3DEngineContextGetScene((uint64_t)v5);
    if (Scene)
    {
      v8 = Scene;
      C3DSceneLock(Scene);
      v9 = (void **)MEMORY[0x1E0C9AE40];
      if (v3)
        v9 = (void **)MEMORY[0x1E0C9AE50];
      C3DEngineContextSetRenderingOptionForKey(v6, CFSTR("defaultLight"), *v9);
      C3DSceneUnlock(v8);
    }
    else
    {
      v11 = (void **)MEMORY[0x1E0C9AE40];
      if (v3)
        v11 = (void **)MEMORY[0x1E0C9AE50];
      C3DEngineContextSetRenderingOptionForKey(v6, CFSTR("defaultLight"), *v11);
    }
  }
  else
  {
    v10 = scn_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[SCNRenderer setAutoenablesDefaultLighting:].cold.1();
  }
  -[SCNRenderer unlock](self, "unlock");
}

- (void)setPointOfCulling:(id)a3
{
  SCNNode *pointOfCulling;
  SCNNode *v6;
  uint64_t Scene;
  _QWORD v8[6];

  pointOfCulling = self->_pointOfCulling;
  if (pointOfCulling != a3)
  {
    v6 = pointOfCulling;
    self->_pointOfCulling = (SCNNode *)a3;
    Scene = C3DEngineContextGetScene((uint64_t)self->_engineContext);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __33__SCNRenderer_setPointOfCulling___block_invoke;
    v8[3] = &unk_1EA59F740;
    v8[4] = a3;
    v8[5] = self;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", Scene, self, v8);
  }
}

CFTypeRef __33__SCNRenderer_setPointOfCulling___block_invoke(uint64_t a1)
{
  return C3DEngineContextSetPointOfCulling(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 216), (CFTypeRef)objc_msgSend(*(id *)(a1 + 32), "nodeRef"));
}

- (id)pointOfCulling
{
  return self->_pointOfCulling;
}

- (void)_projectPoints:(SCNVector3 *)a3 count:(unint64_t)a4 viewport:(SCNVector4)a5
{
  __C3DEngineContext *v8;
  uint64_t v9;
  float32x4_t *PointOfView;
  float32x4_t *v11;
  __n128 v12;
  float32x4_t v13;
  char CoordinatesSystemOptions;
  float *p_z;
  __int32 v16;
  float y;
  float x;
  __n128 v19;
  float32x4_t v20;

  y = a5.y;
  x = a5.x;
  v8 = -[SCNRenderer _engineContext](self, "_engineContext");
  if (v8)
  {
    v9 = (uint64_t)v8;
    PointOfView = C3DEngineContextGetPointOfView((uint64_t)v8);
    if (PointOfView)
    {
      v11 = PointOfView;
      -[SCNRenderer adjustViewportForRendering:](self, "adjustViewportForRendering:", COERCE_DOUBLE(__PAIR64__(LODWORD(y), LODWORD(x))));
      v19 = v12;
      if ((C3DWasLinkedBeforeMajorOSYear2020() & 1) != 0)
      {
        CoordinatesSystemOptions = 0;
        if (!a4)
          return;
      }
      else
      {
        CoordinatesSystemOptions = C3DEngineContextGetCoordinatesSystemOptions(v9);
        if (!a4)
          return;
      }
      p_z = &a3->z;
      do
      {
        v13.i64[0] = *((_QWORD *)p_z - 1);
        v13.f32[2] = *p_z;
        v20 = v13;
        if (_C3DProjectPoints(&v20, 1, v11, (uint64_t)-[SCNScene sceneRef](-[SCNRenderer scene](self, "scene"), "sceneRef"), CoordinatesSystemOptions, &v20, v19))
        {
          v16 = v20.i32[2];
          *((_QWORD *)p_z - 1) = v20.i64[0];
          *(_DWORD *)p_z = v16;
        }
        p_z += 3;
        --a4;
      }
      while (a4);
    }
  }
}

- (SCNVector3)_projectPoint:(SCNVector3)a3 viewport:(SCNVector4)a4
{
  __C3DEngineContext *v5;
  uint64_t v6;
  float32x4_t *PointOfView;
  float32x4_t *v8;
  __n128 v9;
  float32x4_t v10;
  char CoordinatesSystemOptions;
  __C3DScene *v12;
  char v13;
  float v14;
  float v15;
  float v16;
  float y;
  float x;
  __n128 v19;
  float32x4_t v20;
  float v21;
  float z;
  float32x4_t v23;
  SCNVector3 result;

  y = a4.y;
  x = a4.x;
  z = a3.z;
  v21 = a3.y;
  v20.i64[0] = *(_QWORD *)&a3.x;
  v5 = -[SCNRenderer _engineContext](self, "_engineContext");
  if (v5)
  {
    v6 = (uint64_t)v5;
    PointOfView = C3DEngineContextGetPointOfView((uint64_t)v5);
    if (PointOfView)
    {
      v8 = PointOfView;
      -[SCNRenderer adjustViewportForRendering:](self, "adjustViewportForRendering:", COERCE_DOUBLE(__PAIR64__(LODWORD(y), LODWORD(x))));
      v19 = v9;
      v10 = v20;
      v10.f32[1] = v21;
      v10.f32[2] = z;
      v23 = v10;
      if ((C3DWasLinkedBeforeMajorOSYear2020() & 1) != 0)
        CoordinatesSystemOptions = 0;
      else
        CoordinatesSystemOptions = C3DEngineContextGetCoordinatesSystemOptions(v6);
      v12 = -[SCNScene sceneRef](-[SCNRenderer scene](self, "scene"), "sceneRef");
      C3DSceneLock((uint64_t)v12);
      v13 = _C3DProjectPoints(&v23, 1, v8, (uint64_t)v12, CoordinatesSystemOptions, &v23, v19);
      C3DSceneUnlock((uint64_t)v12);
      if ((v13 & 1) != 0)
      {
        v21 = v23.f32[1];
        v20.i32[0] = v23.i32[0];
        z = v23.f32[2];
      }
    }
  }
  v14 = v20.f32[0];
  v15 = v21;
  v16 = z;
  result.z = v16;
  result.y = v15;
  result.x = v14;
  return result;
}

- (SCNVector3)_unprojectPoint:(SCNVector3)a3 viewport:(SCNVector4)a4
{
  __C3DEngineContext *v5;
  uint64_t v6;
  float32x4_t *PointOfView;
  float32x4_t *v8;
  __n128 v9;
  float32x4_t v10;
  char CoordinatesSystemOptions;
  __C3DScene *v12;
  char v13;
  float v14;
  float v15;
  float v16;
  float y;
  float x;
  __n128 v19;
  float32x4_t v20;
  float v21;
  float z;
  float32x4_t v23;
  SCNVector3 result;

  y = a4.y;
  x = a4.x;
  z = a3.z;
  v21 = a3.y;
  v20.i64[0] = *(_QWORD *)&a3.x;
  v5 = -[SCNRenderer _engineContext](self, "_engineContext");
  if (v5)
  {
    v6 = (uint64_t)v5;
    PointOfView = C3DEngineContextGetPointOfView((uint64_t)v5);
    if (PointOfView)
    {
      v8 = PointOfView;
      -[SCNRenderer adjustViewportForRendering:](self, "adjustViewportForRendering:", COERCE_DOUBLE(__PAIR64__(LODWORD(y), LODWORD(x))));
      v19 = v9;
      v10 = v20;
      v10.f32[1] = v21;
      v10.f32[2] = z;
      v23 = v10;
      if ((C3DWasLinkedBeforeMajorOSYear2020() & 1) != 0)
        CoordinatesSystemOptions = 0;
      else
        CoordinatesSystemOptions = C3DEngineContextGetCoordinatesSystemOptions(v6);
      v12 = -[SCNScene sceneRef](-[SCNRenderer scene](self, "scene"), "sceneRef");
      C3DSceneLock((uint64_t)v12);
      v13 = _C3DUnProjectPoints((uint64_t)&v23, 1, v8, (uint64_t)v12, CoordinatesSystemOptions, &v23, v19);
      C3DSceneUnlock((uint64_t)v12);
      if ((v13 & 1) != 0)
      {
        v21 = v23.f32[1];
        v20.i32[0] = v23.i32[0];
        z = v23.f32[2];
      }
    }
  }
  v14 = v20.f32[0];
  v15 = v21;
  v16 = z;
  result.z = v16;
  result.y = v15;
  result.x = v14;
  return result;
}

- (SCNVector3)projectPoint:(SCNVector3)result
{
  double v3;
  double v4;
  double width;
  double height;

  width = self->_framebufferInfo.drawableSize.width;
  if (width != 0.0)
  {
    height = self->_framebufferInfo.drawableSize.height;
    *(float *)&v3 = width;
    *(float *)&v4 = height;
    LODWORD(width) = 0;
    LODWORD(height) = 0;
    -[SCNRenderer _projectPoint:viewport:](self, "_projectPoint:viewport:", *(double *)&result.x, *(double *)&result.y, *(double *)&result.z, width, height, v3, v4);
  }
  return result;
}

- (SCNVector3)unprojectPoint:(SCNVector3)result
{
  double v3;
  double v4;
  double width;
  double height;

  width = self->_framebufferInfo.drawableSize.width;
  if (width != 0.0)
  {
    height = self->_framebufferInfo.drawableSize.height;
    *(float *)&v3 = width;
    *(float *)&v4 = height;
    LODWORD(width) = 0;
    LODWORD(height) = 0;
    -[SCNRenderer _unprojectPoint:viewport:](self, "_unprojectPoint:viewport:", *(double *)&result.x, *(double *)&result.y, *(double *)&result.z, width, height, v3, v4);
  }
  return result;
}

- (id)_readSubdivCacheForHash:(id)a3
{
  id result;
  void *privateRendererOwner;

  if (((*(_WORD *)&self->_privateRendererOwnerDelegationConformance & 0x80) == 0
     || (result = (id)-[SCNSceneRenderer _renderer:subdivDataForHash:](self->_privateRendererOwner, "_renderer:subdivDataForHash:", self->_privateRendererOwner, a3)) == 0)&& ((*(_WORD *)&self->_selfDelegationConformance & 0x80) == 0|| (result = (id)-[SCNRenderer _renderer:subdivDataForHash:](self, "_renderer:subdivDataForHash:", self, a3)) == 0))
  {
    if ((*(_WORD *)&self->_delegationConformance & 0x80) == 0)
      return 0;
    privateRendererOwner = self;
    if ((*((_BYTE *)self + 129) & 4) != 0)
      privateRendererOwner = self->_privateRendererOwner;
    result = (id)objc_msgSend(self->_delegate, "_renderer:subdivDataForHash:", privateRendererOwner, a3);
    if (!result)
      return 0;
  }
  return result;
}

- (void)_writeSubdivCacheForHash:(id)a3 dataProvider:(id)a4
{
  void *privateRendererOwner;

  if ((*(_WORD *)&self->_privateRendererOwnerDelegationConformance & 0x100) != 0)
    -[SCNSceneRenderer _renderer:didBuildSubdivDataForHash:dataProvider:](self->_privateRendererOwner, "_renderer:didBuildSubdivDataForHash:dataProvider:", self->_privateRendererOwner, a3, a4);
  if ((*(_WORD *)&self->_selfDelegationConformance & 0x100) != 0)
    -[SCNRenderer _renderer:didBuildSubdivDataForHash:dataProvider:](self, "_renderer:didBuildSubdivDataForHash:dataProvider:", self, a3, a4);
  if ((*(_WORD *)&self->_delegationConformance & 0x100) != 0)
  {
    privateRendererOwner = self;
    if ((*((_BYTE *)self + 129) & 4) != 0)
      privateRendererOwner = self->_privateRendererOwner;
    objc_msgSend(self->_delegate, "_renderer:didBuildSubdivDataForHash:dataProvider:", privateRendererOwner, a3, a4);
  }
}

- (void)setAutoAdjustCamera:(BOOL)a3
{
  _BOOL4 v3;
  __C3DEngineContext *v4;

  v3 = a3;
  v4 = -[SCNRenderer _engineContext](self, "_engineContext");
  if (v4)
    C3DEngineContextSetAutoAdjustZRange((uint64_t)v4, v3);
}

- (BOOL)autoAdjustCamera
{
  __C3DEngineContext *v2;

  v2 = -[SCNRenderer _engineContext](self, "_engineContext");
  if (v2)
    LOBYTE(v2) = C3DEngineContextGetAutoAdjustZRange((uint64_t)v2) != 0;
  return (char)v2;
}

- (void)_updatePointOfView
{
  __C3DEngineContext *engineContext;
  float32x4_t *PointOfView;
  BOOL v5;

  engineContext = self->_engineContext;
  if (engineContext)
  {
    PointOfView = C3DEngineContextGetPointOfView((uint64_t)engineContext);
    if (self->_pointOfView)
      v5 = 1;
    else
      v5 = PointOfView == 0;
    if (!v5)
    {
      -[SCNRenderer setPointOfView:](self, "setPointOfView:", +[SCNNode nodeWithNodeRef:](SCNNode, "nodeWithNodeRef:", PointOfView));
      self->_pointOfViewWasSet = 0;
    }
  }
}

- (SCNScene)scene
{
  return self->_scene;
}

- (void)__setTransitionContext:(id)a3
{

  self->_transitionContext = (SCNRendererTransitionContext *)objc_msgSend(a3, "copy");
}

- (void)_prepareForTransition:(id)a3 outgoingScene:(id)a4 outgoingPointOfView:(id)a5 completionHandler:(id)a6
{
  SCNRendererTransitionContext *transitionContext;
  SCNRendererTransitionContext *v12;
  void *v13;

  transitionContext = self->_transitionContext;
  if (transitionContext)
  {

    self->_transitionContext = 0;
  }
  v12 = objc_alloc_init(SCNRendererTransitionContext);
  self->_transitionContext = v12;
  if (a6)
  {
    v13 = _Block_copy(a6);
    v12 = self->_transitionContext;
  }
  else
  {
    v13 = 0;
  }
  v12->completionHandler = v13;
  -[SCNRendererTransitionContext setOutgoingScene:](self->_transitionContext, "setOutgoingScene:", a4);
  -[SCNRendererTransitionContext setOutgoingPointOfView:](self->_transitionContext, "setOutgoingPointOfView:", a5);
  -[SCNRendererTransitionContext setTransition:](self->_transitionContext, "setTransition:", a3);
  -[SCNRendererTransitionContext setTransitionStartTime:](self->_transitionContext, "setTransitionStartTime:", CACurrentMediaTime());
  if (objc_msgSend(a3, "pausesIncomingScene"))
    -[SCNScene setPaused:](self->_scene, "setPaused:", 1);
  if (objc_msgSend(a3, "pausesOutgoingScene"))
    objc_msgSend(a4, "setPaused:", 1);
}

- (void)presentScene:(id)a3 withTransition:(id)a4 incomingPointOfView:(id)a5 completionHandler:(id)a6
{
  SCNScene *scene;
  SCNNode *v12;

  scene = self->_scene;
  v12 = -[SCNRenderer pointOfView](self, "pointOfView");
  -[SCNRenderer lock](self, "lock");
  +[SCNTransaction begin](SCNTransaction, "begin");
  +[SCNTransaction setAnimationDuration:](SCNTransaction, "setAnimationDuration:", 0.0);
  +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", 1);
  -[SCNRenderer setScene:](self, "setScene:", a3);
  -[SCNRenderer setPointOfView:](self, "setPointOfView:", a5);
  if (a4)
    -[SCNRenderer _prepareForTransition:outgoingScene:outgoingPointOfView:completionHandler:](self, "_prepareForTransition:outgoingScene:outgoingPointOfView:completionHandler:", a4, scene, v12, a6);
  +[SCNTransaction commit](SCNTransaction, "commit");
  -[SCNRenderer unlock](self, "unlock");
}

- (void)setScene:(SCNScene *)scene
{
  SCNScene *v5;
  __C3DEngineContext *engineContext;

  if (self->_scene != scene)
  {
    -[SCNRenderer lock](self, "lock");

    v5 = scene;
    self->_scene = v5;
    engineContext = self->_engineContext;
    if (engineContext)
      C3DEngineContextSetupWithScene(engineContext, -[SCNScene sceneRef](v5, "sceneRef"));
    -[SCNRenderer unlock](self, "unlock");
  }
}

- (id)backgroundColor
{
  return self->_backgroundColor;
}

- (void)resolvedBackgroundColorDidChange
{
  float32x4_t v3;
  uint64_t v4;
  C3DColor4 v5;

  v3.i64[0] = -[UIColor scn_C3DColorIgnoringColorSpace:success:](self->_backgroundColor, "scn_C3DColorIgnoringColorSpace:success:", 0, 0);
  v3.i64[1] = v4;
  v5 = (C3DColor4)vmulq_f32(v3, (float32x4_t)vdupq_n_s32(HIDWORD(v4)));
  v5.var0.var0[3] = *((float *)&v4 + 1);
  self->_c3dBackgroundColor = v5;
  -[SCNRenderer _c3dBackgroundColorDidChange](self, "_c3dBackgroundColorDidChange");
}

- (BOOL)disableOverlays
{
  return self->_disableOverlays;
}

- (void)setDisableOverlays:(BOOL)a3
{
  self->_disableOverlays = a3;
}

- (id)_setupSKRendererIfNeeded
{
  id result;
  Class v4;
  EAGLContext *glContext;
  __SKSCNRenderer *v6;

  result = self->_overlayRenderer;
  if (!result)
  {
    v4 = NSClassFromString(CFSTR("SKSCNRenderer"));
    if (self->_renderingAPI)
    {
      -[SCNRenderer context](self, "context");
      glContext = self->_glContext;
      -[SCNRenderer lock](self, "lock");
      if (glContext)
      {
        v6 = (__SKSCNRenderer *)(id)-[objc_class rendererWithContext:options:](v4, "rendererWithContext:options:", glContext, 0);
        self->_overlayRenderer = v6;
        -[__SKSCNRenderer setScene:](v6, "setScene:", self->_overlayScene);
      }
      -[SCNRenderer unlock](self, "unlock");
    }
    else
    {
      self->_overlayRenderer = (__SKSCNRenderer *)(id)-[objc_class rendererWithDevice:options:](v4, "rendererWithDevice:options:", -[SCNRenderer metalDevice](self, "metalDevice"), 0);
    }
    -[SCNRenderer _contentsScaleFactor](self, "_contentsScaleFactor");
    -[__SKSCNRenderer setBackingScaleFactor:](self->_overlayRenderer, "setBackingScaleFactor:");
    return self->_overlayRenderer;
  }
  return result;
}

- (id)_prepareSKRenderer
{
  id v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double width;
  double height;
  double v14;
  double v15;
  double v16;
  void *v17;
  CGRect v19;
  CGRect v20;

  v3 = -[SCNRenderer _setupSKRendererIfNeeded](self, "_setupSKRendererIfNeeded");
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  width = self->_framebufferInfo.drawableSize.width;
  height = self->_framebufferInfo.drawableSize.height;
  -[SCNRenderer _contentsScaleFactor](self, "_contentsScaleFactor");
  v15 = width / v14;
  v16 = height / v14;
  objc_msgSend(v3, "setBackingScaleFactor:");
  v20.origin.x = 0.0;
  v20.origin.y = 0.0;
  v19.origin.x = v5;
  v19.origin.y = v7;
  v19.size.width = v9;
  v19.size.height = v11;
  v20.size.width = v15;
  v20.size.height = v16;
  if (!CGRectEqualToRect(v19, v20))
  {
    v17 = (void *)objc_msgSend(v3, "scene");
    if (objc_msgSend(v17, "scaleMode") == 3)
      objc_msgSend(v17, "setSize:", v15, v16);
    objc_msgSend(v3, "setBounds:", 0.0, 0.0, v15, v16);
  }
  return v3;
}

- (void)_overlaysDidUpdate:(id)a3
{
  -[SCNSceneRenderer _sceneDidUpdate:](self->_privateRendererOwner, "_sceneDidUpdate:", a3);
}

- (void)setOverlaySKScene:(id)a3
{
  __C3DScene *v5;
  _QWORD v6[6];

  -[SCNRenderer lock](self, "lock");
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:name:object:", self, CFSTR("kC3DSceneDidUpdateNotification"), 0);
  self->_overlayScene = a3;
  if (a3)
  {
    if ((*((_BYTE *)self + 129) & 4) != 0)
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "addObserver:selector:name:object:", self, sel__overlaysDidUpdate_, CFSTR("kC3DSceneDidUpdateNotification"), a3);
    -[SCNRenderer _setupSKRendererIfNeeded](self, "_setupSKRendererIfNeeded");
  }
  v5 = -[SCNScene sceneRef](self->_scene, "sceneRef");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __33__SCNRenderer_setOverlaySKScene___block_invoke;
  v6[3] = &unk_1EA59F740;
  v6[4] = a3;
  v6[5] = self;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, 0, v6);
  -[SCNRenderer unlock](self, "unlock");
}

void __33__SCNRenderer_setOverlaySKScene___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(*(_QWORD *)(a1 + 40) + 368);
  if (v2)
  {
    objc_msgSend(v3, "setScene:");
  }
  else
  {

    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 368) = 0;
  }
}

- (void)setTechnique:(id)a3
{
  SCNTechnique *technique;
  __C3DScene *v6;
  _QWORD v7[5];

  technique = self->_technique;
  if (technique != a3)
  {

    self->_technique = (SCNTechnique *)a3;
    v6 = -[SCNScene sceneRef](self->_scene, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __28__SCNRenderer_setTechnique___block_invoke;
    v7[3] = &unk_1EA59E4A0;
    v7[4] = self;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v6, 0, v7);
  }
}

void __28__SCNRenderer_setTechnique___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t FXContext;
  uint64_t RenderGraph;
  NSObject *v7;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_engineContext");
  if (v2)
  {
    v3 = v2;
    v4 = (_BYTE *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 352), "techniqueRef");
    FXContext = C3DEngineContextGetFXContext(v3);
    if (FXContext)
      C3DFXContextSetPostProcessTechnique(FXContext, v4, v3);
    RenderGraph = C3DEngineContextGetRenderGraph(v3);
    if (RenderGraph)
      C3DRenderGraphSetCustomTechnique(RenderGraph, v4);
  }
  else
  {
    v7 = scn_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __28__SCNRenderer_setTechnique___block_invoke_cold_1();
  }
}

- (SCNTechnique)technique
{
  return self->_technique;
}

- (id)_copyPassDescription
{
  uint64_t FXContext;
  id v4;

  -[SCNRenderer lock](self, "lock");
  FXContext = C3DEngineContextGetFXContext((uint64_t)self->_engineContext);
  v4 = C3DFXContextCopyPassDescription(FXContext, (uint64_t)self->_engineContext);
  -[SCNRenderer unlock](self, "unlock");
  return v4;
}

- (id)_copyRenderGraphDescription
{
  uint64_t RenderGraph;
  void *v4;

  -[SCNRenderer lock](self, "lock");
  RenderGraph = C3DEngineContextGetRenderGraph((uint64_t)self->_engineContext);
  v4 = (void *)objc_msgSend((id)C3DRenderGraphGetDescription(RenderGraph), "copy");
  -[SCNRenderer unlock](self, "unlock");
  return v4;
}

- (void)_renderGraphFrameRecordingAtPath:(id)a3 withCompletion:(id)a4
{
  uint64_t RenderGraph;

  -[SCNRenderer lock](self, "lock");
  RenderGraph = C3DEngineContextGetRenderGraph((uint64_t)self->_engineContext);
  C3DRenderGraphRecordFrame(RenderGraph, a3, a4);
  -[SCNRenderer unlock](self, "unlock");
}

- (BOOL)_recordWithoutExecute
{
  uint64_t RenderGraph;
  char IsRecordingWithoutExecute;

  -[SCNRenderer lock](self, "lock");
  RenderGraph = C3DEngineContextGetRenderGraph((uint64_t)self->_engineContext);
  IsRecordingWithoutExecute = C3DRenderGraphIsRecordingWithoutExecute(RenderGraph);
  -[SCNRenderer unlock](self, "unlock");
  return IsRecordingWithoutExecute;
}

- (void)set_recordWithoutExecute:(BOOL)a3
{
  uint64_t RenderGraph;

  -[SCNRenderer lock](self, "lock");
  -[SCNRenderer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("_recordWithoutExecute"));
  RenderGraph = C3DEngineContextGetRenderGraph((uint64_t)self->_engineContext);
  C3DRenderGraphSetRecordWithoutExecute(RenderGraph, a3);
  -[SCNRenderer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("_recordWithoutExecute"));
  -[SCNRenderer unlock](self, "unlock");
}

- (id)_computedLightingEnvironmentMapsPath
{
  uint64_t RenderContext;

  RenderContext = C3DEngineContextGetRenderContext((uint64_t)self->_engineContext);
  return (id)-[SCNMTLRenderContext generatedTexturePath](RenderContext);
}

- (void)set_computedLightingEnvironmentMapsPath:(id)a3
{
  void *RenderContext;

  RenderContext = (void *)C3DEngineContextGetRenderContext((uint64_t)self->_engineContext);
  -[SCNMTLRenderContext setGeneratedTexturePath:](RenderContext, (char *)a3);
}

void __38__SCNRenderer__releasePreloadRenderer__block_invoke(uint64_t a1)
{
  C3DRendererContextDestroyAllVertexArrayObjects(*(void **)(a1 + 32));
}

uint64_t __47__SCNRenderer__prepareObject_shouldAbortBlock___block_invoke(uint64_t a1)
{
  if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) != 0)
    return 1;
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __47__SCNRenderer__prepareObject_shouldAbortBlock___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "isCancelled");
}

- (void)prepareObjects:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v7;
  void *v8;
  objc_class *v9;
  const char *v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *prepareQueue;
  _QWORD block[9];

  if (!self->_renderingAPI && (*((_BYTE *)self + 129) & 8) != 0)
    v7 = -[SCNSceneRenderer layer](self->_privateRendererOwner, "layer");
  else
    v7 = 0;
  if (!self->__prepareQueue)
  {
    -[SCNRenderer lock](self, "lock");
    if (!self->__prepareQueue)
    {
      v8 = (void *)MEMORY[0x1E0CB3940];
      v9 = (objc_class *)objc_opt_class();
      v10 = (const char *)objc_msgSend((id)objc_msgSend(v8, "stringWithFormat:", CFSTR("com.apple.scenekit.prepareQueue.%@%p"), NSStringFromClass(v9), self->_privateRendererOwner), "cStringUsingEncoding:", 1);
      v11 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
      self->__prepareQueue = (OS_dispatch_queue *)dispatch_queue_create(v10, v11);
    }
    -[SCNRenderer unlock](self, "unlock");
  }
  v12 = objc_msgSend(MEMORY[0x1E0CB38A8], "currentProgress");
  if (v12)
    v12 = objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", objc_msgSend(a3, "count"));
  prepareQueue = self->__prepareQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__SCNRenderer_prepareObjects_withCompletionHandler___block_invoke;
  block[3] = &unk_1EA5A25A8;
  block[4] = v12;
  block[5] = self;
  block[6] = v7;
  block[7] = a3;
  block[8] = a4;
  dispatch_async(prepareQueue, block);
}

void __52__SCNRenderer_prepareObjects_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[5];
  char v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _QWORD v19[5];
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = MEMORY[0x1E0C809B0];
  if (v2)
  {
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __52__SCNRenderer_prepareObjects_withCompletionHandler___block_invoke_2;
    v19[3] = &unk_1EA5A2558;
    v19[4] = v2;
    v4 = v19;
  }
  else
  {
    v4 = 0;
  }
  v5 = *(void **)(a1 + 40);
  objc_sync_enter(v5);
  if (objc_msgSend(*(id *)(a1 + 40), "_preparePreloadRenderer:", *(_QWORD *)(a1 + 48)))
  {
    +[SCNTransaction flush](SCNTransaction, "flush");
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = *(void **)(a1 + 56);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v16;
      v9 = 1;
LABEL_7:
      v10 = 0;
      while (1)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10);
        objc_msgSend(*(id *)(a1 + 32), "becomeCurrentWithPendingUnitCount:", 1);
        LOBYTE(v11) = objc_msgSend(*(id *)(a1 + 40), "_prepareObject:shouldAbortBlock:", v11, v4);
        objc_msgSend(*(id *)(a1 + 32), "resignCurrent");
        v9 &= v11;
        if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) != 0)
          break;
        if (v7 == ++v10)
        {
          v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
          if (v7)
            goto LABEL_7;
          break;
        }
      }
    }
    else
    {
      v9 = 1;
    }
    objc_msgSend(*(id *)(a1 + 40), "_releasePreloadRenderer");
    v3 = MEMORY[0x1E0C809B0];
  }
  else
  {
    v9 = 0;
  }
  objc_sync_exit(v5);
  v12 = *(_QWORD *)(a1 + 64);
  if (v12)
  {
    v13[0] = v3;
    v13[1] = 3221225472;
    v13[2] = __52__SCNRenderer_prepareObjects_withCompletionHandler___block_invoke_3;
    v13[3] = &unk_1EA5A2580;
    v13[4] = v12;
    v14 = v9;
    dispatch_async(MEMORY[0x1E0C80D38], v13);
  }
}

uint64_t __52__SCNRenderer_prepareObjects_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "isCancelled");
}

uint64_t __52__SCNRenderer_prepareObjects_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (id)programWithNode:(id)a3 withMaterial:(id)a4
{
  __C3DEngineContext *v8;
  uint64_t RendererContextGL;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  __C3DGeometry *v13;
  uint64_t Mesh;
  uint64_t v15;
  uint64_t v16;
  __C3DFXProgram *v17;
  __C3DFXProgram *v18;
  SCNProgram *v19;
  CFTypeID v20;
  uint64_t ShaderSources;
  uint64_t v22;
  uint64_t v23;

  v8 = -[SCNRenderer _engineContext](self, "_engineContext");
  RendererContextGL = C3DEngineContextGetRendererContextGL((uint64_t)v8);
  if (!RendererContextGL || !C3DRendererContextGetGLContext(RendererContextGL))
    return 0;
  if (!v8)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SCNRenderer.m"), 3340, CFSTR("We should have an engine context at this stage"));
  v10 = objc_msgSend(a3, "nodeRef");
  if (!v10)
    return 0;
  v11 = (_QWORD *)v10;
  v12 = objc_msgSend((id)objc_msgSend(a3, "geometry"), "geometryRef");
  if (!v12)
    return 0;
  v13 = (__C3DGeometry *)v12;
  Mesh = C3DGeometryGetMesh(v12);
  if (!Mesh)
    return 0;
  v15 = Mesh;
  v16 = objc_msgSend(a4, "materialRef");
  if (!-[SCNScene sceneRef](-[SCNRenderer scene](self, "scene"), "sceneRef"))
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SCNRenderer.m"), 3358, CFSTR("No C Scene associated with %@"), -[SCNRenderer scene](self, "scene"));
  v17 = C3DEngineContextEvaluateProgram((uint64_t)v8, v11, v13, v15, v16);
  if (!v17)
    return 0;
  v18 = v17;
  v19 = +[SCNProgram program](SCNProgram, "program");
  v20 = CFGetTypeID(v18);
  if (v20 == C3DFXGLSLProgramGetTypeID())
  {
    ShaderSources = C3DFXGLSLProgramGetShaderSources(v18);
    v23 = v22;
    -[SCNProgram setVertexShader:](v19, "setVertexShader:", ShaderSources);
    -[SCNProgram setFragmentShader:](v19, "setFragmentShader:", v23);
  }
  else
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SCNRenderer.m"), 3377, CFSTR("Metal implementation not done"));
  }
  return v19;
}

- (void)setDelegate:(id)a3
{
  __int16 v4;
  __int16 v5;
  __int16 v6;
  __int16 v7;
  __int16 v8;
  __int16 v9;
  __int16 v10;
  __int16 v11;

  objc_storeWeak(&self->_delegate, a3);
  *(_WORD *)&self->_delegationConformance = *(_WORD *)&self->_delegationConformance & 0xFFFE | objc_opt_respondsToSelector() & 1;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = 2;
  else
    v4 = 0;
  *(_WORD *)&self->_delegationConformance = *(_WORD *)&self->_delegationConformance & 0xFFFD | v4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = 4;
  else
    v5 = 0;
  *(_WORD *)&self->_delegationConformance = *(_WORD *)&self->_delegationConformance & 0xFFFB | v5;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v6 = 8;
  else
    v6 = 0;
  *(_WORD *)&self->_delegationConformance = *(_WORD *)&self->_delegationConformance & 0xFFF7 | v6;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v7 = 16;
  else
    v7 = 0;
  *(_WORD *)&self->_delegationConformance = *(_WORD *)&self->_delegationConformance & 0xFFEF | v7;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v8 = 32;
  else
    v8 = 0;
  *(_WORD *)&self->_delegationConformance = *(_WORD *)&self->_delegationConformance & 0xFFDF | v8;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v9 = 64;
  else
    v9 = 0;
  *(_WORD *)&self->_delegationConformance = *(_WORD *)&self->_delegationConformance & 0xFFBF | v9;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v10 = 128;
  else
    v10 = 0;
  *(_WORD *)&self->_delegationConformance = *(_WORD *)&self->_delegationConformance & 0xFF7F | v10;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v11 = 256;
  else
    v11 = 0;
  *(_WORD *)&self->_delegationConformance = *(_WORD *)&self->_delegationConformance & 0xFCFF | v11;
  -[SCNRenderer _updateEngineCallbacks](self, "_updateEngineCallbacks");
}

- (SCNSceneRendererDelegate)delegate
{
  return (SCNSceneRendererDelegate *)objc_loadWeak(&self->_delegate);
}

- (BOOL)_wantsSceneRendererDelegationMessages
{
  return (*((unsigned __int8 *)self + 288) >> 3) & 1;
}

- (BOOL)_shouldForwardSceneRendererDelegationMessagesToPrivateRendererOwner
{
  return (*((unsigned __int8 *)self + 288) >> 4) & 1;
}

- (void)set_shouldForwardSceneRendererDelegationMessagesToPrivateRendererOwner:(BOOL)a3
{
  char v4;
  __int16 v5;
  __int16 privateRendererOwnerDelegationConformance;
  __int16 v7;
  __int16 v8;
  __int16 v9;
  __int16 v10;
  __int16 v11;
  __int16 v12;
  __int16 v13;
  __int16 v14;

  if (a3)
    v4 = 16;
  else
    v4 = 0;
  *((_BYTE *)self + 288) = *((_BYTE *)self + 288) & 0xEF | v4;
  if (a3 && (*((_BYTE *)self + 129) & 4) != 0)
  {
    *(_WORD *)&self->_privateRendererOwnerDelegationConformance = *(_WORD *)&self->_privateRendererOwnerDelegationConformance & 0xFFFE | objc_opt_respondsToSelector() & 1;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = 2;
    else
      v7 = 0;
    *(_WORD *)&self->_privateRendererOwnerDelegationConformance = *(_WORD *)&self->_privateRendererOwnerDelegationConformance & 0xFFFD | v7;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v8 = 4;
    else
      v8 = 0;
    *(_WORD *)&self->_privateRendererOwnerDelegationConformance = *(_WORD *)&self->_privateRendererOwnerDelegationConformance & 0xFFFB | v8;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v9 = 8;
    else
      v9 = 0;
    *(_WORD *)&self->_privateRendererOwnerDelegationConformance = *(_WORD *)&self->_privateRendererOwnerDelegationConformance & 0xFFF7 | v9;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v10 = 16;
    else
      v10 = 0;
    *(_WORD *)&self->_privateRendererOwnerDelegationConformance = *(_WORD *)&self->_privateRendererOwnerDelegationConformance & 0xFFEF | v10;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v11 = 32;
    else
      v11 = 0;
    *(_WORD *)&self->_privateRendererOwnerDelegationConformance = *(_WORD *)&self->_privateRendererOwnerDelegationConformance & 0xFFDF | v11;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v12 = 128;
    else
      v12 = 0;
    *(_WORD *)&self->_privateRendererOwnerDelegationConformance = *(_WORD *)&self->_privateRendererOwnerDelegationConformance & 0xFF7F | v12;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v13 = 256;
    else
      v13 = 0;
    *(_WORD *)&self->_privateRendererOwnerDelegationConformance = *(_WORD *)&self->_privateRendererOwnerDelegationConformance & 0xFEFF | v13;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v14 = 64;
    else
      v14 = 0;
    *(_WORD *)&self->_privateRendererOwnerDelegationConformance = *(_WORD *)&self->_privateRendererOwnerDelegationConformance & 0xFFBF | v14;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = 512;
    else
      v5 = 0;
    privateRendererOwnerDelegationConformance = (__int16)self->_privateRendererOwnerDelegationConformance;
  }
  else
  {
    v5 = 0;
    privateRendererOwnerDelegationConformance = *(_WORD *)&self->_privateRendererOwnerDelegationConformance & 0xFE00;
  }
  *(_WORD *)&self->_privateRendererOwnerDelegationConformance = privateRendererOwnerDelegationConformance & 0xFDFF | v5;
  -[SCNRenderer _updateEngineCallbacks](self, "_updateEngineCallbacks");
}

- (id)_resourceManagerMonitor
{
  return objc_loadWeak((id *)&self->_resourceManagerMonitor);
}

- (void)renderContext:(id)a3 didFallbackToDefaultTextureForSource:(id)a4 message:(id)a5
{
  void *privateRendererOwner;

  privateRendererOwner = self;
  if ((*((_BYTE *)self + 129) & 4) != 0)
    privateRendererOwner = self->_privateRendererOwner;
  objc_msgSend(objc_loadWeak((id *)&self->_resourceManagerMonitor), "renderer:didFallbackToDefaultTextureForSource:message:", privateRendererOwner, a4, a5);
}

- (id)_commandBufferStatusMonitor
{
  return objc_loadWeak((id *)&self->_commandBufferStatusMonitor);
}

- (void)set_commandBufferStatusMonitor:(id)a3
{
  _SCNSceneCommandBufferStatusMonitor **p_commandBufferStatusMonitor;
  id v6;
  SCNRenderer *v7;

  p_commandBufferStatusMonitor = &self->_commandBufferStatusMonitor;
  if (objc_loadWeak((id *)&self->_commandBufferStatusMonitor) != a3)
  {
    if (a3)
      v6 = a3;
    else
      v6 = 0;
    if (a3)
      v7 = self;
    else
      v7 = 0;
    objc_storeWeak((id *)p_commandBufferStatusMonitor, v6);
    -[SCNMTLRenderContext setCommandBufferStatusMonitor:]((id *)&self->_renderContext->super.isa, v7);
    -[SCNMTLRenderContext setCommandBufferStatusMonitor:]((id *)-[SCNRenderer _renderContextMetal](self->_preloadRenderer, "_renderContextMetal"), v7);
  }
}

- (void)renderContext:(id)a3 commandBufferDidCompleteWithError:(id)a4
{
  void *privateRendererOwner;

  privateRendererOwner = self;
  if ((*((_BYTE *)self + 129) & 4) != 0)
    privateRendererOwner = self->_privateRendererOwner;
  objc_msgSend(objc_loadWeak((id *)&self->_commandBufferStatusMonitor), "renderer:commandBufferDidCompleteWithError:", privateRendererOwner, a4);
}

- (void)updateCurrentTimeIfPlayingWithSystemTime:(double)a3
{
  __C3DScene *v5;
  uint64_t v6;
  double currentSceneTime;
  _BOOL4 playing;
  double v10;
  float PlaybackSpeed;
  double StartTime;
  double lastSystemTime;
  double v14;
  double EndTime;
  long double v16;
  double v17;

  v5 = -[SCNScene sceneRef](self->_scene, "sceneRef");
  v6 = (uint64_t)v5;
  currentSceneTime = self->_currentSceneTime;
  playing = self->_playing;
  if (!self->_playing || v5 == 0)
  {
    self->_lastSystemTime = a3;
    v10 = currentSceneTime;
    if (!v5)
      goto LABEL_21;
    if (!playing)
    {
LABEL_20:
      v10 = currentSceneTime;
      goto LABEL_21;
    }
  }
  else
  {
    PlaybackSpeed = C3DSceneGetPlaybackSpeed((uint64_t)v5);
    StartTime = C3DSceneGetStartTime(v6);
    if (currentSceneTime < StartTime)
      currentSceneTime = StartTime;
    lastSystemTime = self->_lastSystemTime;
    if (lastSystemTime != 0.0)
    {
      v14 = a3 - lastSystemTime;
      if (v14 > 1.0)
        v14 = 0.0166666667;
      currentSceneTime = currentSceneTime + v14 * PlaybackSpeed;
    }
    self->_lastSystemTime = a3;
    if (!self->_playing)
      goto LABEL_20;
  }
  EndTime = C3DSceneGetEndTime(v6);
  if (currentSceneTime <= EndTime)
    goto LABEL_20;
  v16 = EndTime;
  if (self->_loops)
  {
    v10 = 0.0;
    if (v16 != 0.0)
    {
      v17 = C3DSceneGetStartTime(v6);
      v10 = fmod(currentSceneTime - v16, v16) + v17;
    }
  }
  else
  {
    -[SCNRenderer setPlaying:](self, "setPlaying:", 0);
    v10 = v16;
  }
LABEL_21:
  -[SCNRenderer _setSceneTime:](self, "_setSceneTime:", v10);
}

- (void)set_nextFrameTime:(double)a3
{
  self->__nextFrameTime = a3;
}

- (double)_nextFrameTime
{
  return self->__nextFrameTime;
}

- (CFTimeInterval)nextFrameTime
{
  return self->__nextFrameTime;
}

- (BOOL)_needsRepetitiveRedraw
{
  _BOOL4 v2;

  if (self->_isAnimating || self->_playing)
    LOBYTE(v2) = 1;
  else
    return (*((unsigned __int8 *)self + 129) >> 1) & 1;
  return v2;
}

- (double)sceneTime
{
  return self->_currentSceneTime;
}

- (void)_setSceneTime:(double)a3
{
  if ((*((_BYTE *)self + 288) & 4) == 0)
  {
    -[SCNRenderer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("sceneTime"));
    self->_currentSceneTime = a3;
    -[SCNRenderer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("sceneTime"));
  }
}

- (void)setSceneTime:(double)a3
{
  __C3DScene *v5;
  _QWORD v6[6];

  if ((*((_BYTE *)self + 288) & 4) == 0)
  {
    if ((*((_BYTE *)self + 129) & 4) != 0)
    {
      v5 = -[SCNScene sceneRef](self->_scene, "sceneRef");
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __28__SCNRenderer_setSceneTime___block_invoke;
      v6[3] = &unk_1EA59E450;
      v6[4] = self;
      *(double *)&v6[5] = a3;
      +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v6);
    }
    else
    {
      self->_currentSceneTime = a3;
    }
  }
}

uint64_t __28__SCNRenderer_setSceneTime___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setSceneTime:", *(double *)(a1 + 40));
}

- (double)_systemTime
{
  double result;

  result = self->_forceSystemTime;
  if (result == 0.0)
    return self->_currentSystemTime;
  return result;
}

- (void)set_systemTime:(double)a3
{
  if ((*((_BYTE *)self + 288) & 4) == 0)
  {
    self->_currentSystemTime = a3;
    -[SCNRenderer updateCurrentTimeIfPlayingWithSystemTime:](self, "updateCurrentTimeIfPlayingWithSystemTime:");
  }
}

- (void)set_deltaTime:(double)a3
{
  if ((*((_BYTE *)self + 288) & 4) != 0)
    a3 = 0.0;
  self->_deltaTime = a3;
}

- (void)context
{
  unint64_t renderingAPI;
  uint64_t v4;

  renderingAPI = self->_renderingAPI;
  if (renderingAPI)
  {
    if (!self->_glContext)
    {
      if (self->_isRunningInExtension)
      {
LABEL_6:
        if ((_DWORD)renderingAPI == 2)
          v4 = 3;
        else
          v4 = 2;
        -[SCNRenderer setContext:](self, "setContext:", (id)SCNCreateGLESContext(v4));
        return self->_glContext;
      }
      if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication"), "applicationState") != 2)
      {
        LODWORD(renderingAPI) = self->_renderingAPI;
        goto LABEL_6;
      }
    }
    return self->_glContext;
  }
  return 0;
}

- (void)_update:(__C3DScene *)a3
{
  double v5;
  double v6;
  double deltaTime;
  int IsPaused;
  int IsPausedForEditing;
  double v10;
  double v11;
  double v12;
  void *v13;
  double *Stats;
  double v15;
  void *privateRendererOwner;
  uint64_t ModelValueStorage;
  double v18;
  uint64_t AnimationManager;
  uint64_t v20;
  double currentSceneTime;
  double v22;
  void *v23;
  double v24;
  uint64_t v25;
  void *v26;
  double v27;
  void *v28;
  double v29;
  uint64_t ControllerManager;
  uint64_t v31;
  double v32;
  void *v33;
  double v34;
  _QWORD *ParticleManager;
  uint64_t v36;
  id v37;
  void *SelectedNodes;
  _BOOL4 v39;
  char v40;
  uint64_t EnginePipeline;
  char v42;
  SCNAuthoringEnvironment2 *AuthoringEnvironment2;
  _QWORD v44[5];
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  char v48;

  -[SCNRenderer _systemTime](self, "_systemTime");
  v6 = v5;
  -[SCNRenderer _getFrameIndex](self, "_getFrameIndex");
  C3DEngineContextSetSystemTime((uint64_t)self->_engineContext, v6);
  C3DEngineContextSetDeltaTime((uint64_t)self->_engineContext, self->_deltaTime);
  deltaTime = self->_deltaTime;
  IsPaused = C3DSceneIsPaused((uint64_t)a3);
  IsPausedForEditing = C3DSceneIsPausedForEditing((uint64_t)a3);
  v10 = 0.0;
  if (IsPaused)
    v11 = 0.0;
  else
    v11 = deltaTime;
  if (v11 >= 0.0)
    v10 = v11;
  if (v10 <= 1.0)
    v12 = v10;
  else
    v12 = 0.0166666667;
  self->_isAnimating = 0;
  +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", 1);
  v13 = (void *)MEMORY[0x1DF0D4CF4](+[SCNTransaction setImmediateModeRestrictedContext:](SCNTransaction, "setImmediateModeRestrictedContext:", a3));
  Stats = (double *)C3DEngineContextGetStats((uint64_t)self->_engineContext);
  if ((*(_WORD *)&self->_delegationConformance & 1) != 0
    || (*(_WORD *)&self->_selfDelegationConformance & 1) != 0
    || (*(_WORD *)&self->_privateRendererOwnerDelegationConformance & 1) != 0)
  {
    v15 = CACurrentMediaTime();
    kdebug_trace();
    if ((*(_WORD *)&self->_privateRendererOwnerDelegationConformance & 1) != 0)
      -[SCNSceneRenderer _renderer:updateAtTime:](self->_privateRendererOwner, "_renderer:updateAtTime:", self->_privateRendererOwner, v6);
    if ((*(_WORD *)&self->_selfDelegationConformance & 1) != 0)
      -[SCNRenderer _renderer:updateAtTime:](self, "_renderer:updateAtTime:", self, v6);
    if ((*(_WORD *)&self->_delegationConformance & 1) != 0)
    {
      privateRendererOwner = self;
      if ((*((_BYTE *)self + 129) & 4) != 0)
        privateRendererOwner = self->_privateRendererOwner;
      objc_msgSend(self->_delegate, "renderer:updateAtTime:", privateRendererOwner, v6);
    }
    kdebug_trace();
    Stats[21] = Stats[21] + CACurrentMediaTime() - v15;
  }
  ModelValueStorage = C3DSceneGetModelValueStorage((uint64_t)a3);
  C3DModelValueStoragePrepareNextFrame(ModelValueStorage);
  v18 = CACurrentMediaTime();
  AnimationManager = C3DSceneGetAnimationManager((uint64_t)a3);
  if (AnimationManager)
  {
    v20 = AnimationManager;
    C3DAnimationManagerSetPausedForEditing(AnimationManager, IsPausedForEditing);
    kdebug_trace();
    C3DAnimationManagerApplyAnimations(v20, v6, self->_currentSceneTime);
    kdebug_trace();
    kdebug_trace();
    currentSceneTime = v6;
    if (IsPausedForEditing)
      currentSceneTime = self->_currentSceneTime;
    C3DAnimationManagerApplyActions(v20, currentSceneTime);
    kdebug_trace();
    C3DAnimationManagerApplyBindings(v20);
    if ((IsPaused ^ 1 | IsPausedForEditing) == 1)
      self->_isAnimating = C3DAnimationManagerNeedsRedraw(v20, IsPausedForEditing);
  }
  Stats[16] = Stats[16] + CACurrentMediaTime() - v18;
  if ((*(_BYTE *)&self->_delegationConformance & 2) != 0
    || (*(_WORD *)&self->_selfDelegationConformance & 2) != 0
    || (*(_WORD *)&self->_privateRendererOwnerDelegationConformance & 2) != 0)
  {
    v22 = CACurrentMediaTime();
    kdebug_trace();
    if ((*(_WORD *)&self->_privateRendererOwnerDelegationConformance & 2) != 0)
      -[SCNSceneRenderer _renderer:didApplyAnimationsAtTime:](self->_privateRendererOwner, "_renderer:didApplyAnimationsAtTime:", self->_privateRendererOwner, v6);
    if ((*(_WORD *)&self->_selfDelegationConformance & 2) != 0)
      -[SCNRenderer _renderer:didApplyAnimationsAtTime:](self, "_renderer:didApplyAnimationsAtTime:", self, v6);
    if ((*(_WORD *)&self->_delegationConformance & 2) != 0)
    {
      v23 = self;
      if ((*((_BYTE *)self + 129) & 4) != 0)
        v23 = self->_privateRendererOwner;
      objc_msgSend(self->_delegate, "renderer:didApplyAnimationsAtTime:", v23, v6);
    }
    kdebug_trace();
    Stats[21] = Stats[21] + CACurrentMediaTime() - v22;
  }
  v24 = CACurrentMediaTime();
  v25 = objc_msgSend(C3DEntityGetObjCWrapper((id *)a3), "_physicsWorldCreateIfNeeded:", 0);
  if (v25)
  {
    v26 = (void *)v25;
    kdebug_trace();
    objc_msgSend(v26, "_updatePhysicsFieldsTransforms");
    if ((IsPausedForEditing & 1) != 0)
    {
      kdebug_trace();
    }
    else
    {
      objc_msgSend(v26, "_step:", v12);
      kdebug_trace();
      if ((IsPaused & 1) == 0 && !self->_isAnimating)
        self->_isAnimating = objc_msgSend(v26, "_needsRedraw");
    }
  }
  Stats[14] = Stats[14] + CACurrentMediaTime() - v24;
  if ((*(_BYTE *)&self->_delegationConformance & 4) != 0
    || (*(_WORD *)&self->_selfDelegationConformance & 4) != 0
    || (*(_WORD *)&self->_privateRendererOwnerDelegationConformance & 4) != 0)
  {
    v27 = CACurrentMediaTime();
    kdebug_trace();
    if ((*(_WORD *)&self->_privateRendererOwnerDelegationConformance & 4) != 0)
      -[SCNSceneRenderer _renderer:didSimulatePhysicsAtTime:](self->_privateRendererOwner, "_renderer:didSimulatePhysicsAtTime:", self->_privateRendererOwner, v6);
    if ((*(_WORD *)&self->_selfDelegationConformance & 4) != 0)
      -[SCNRenderer _renderer:didSimulatePhysicsAtTime:](self, "_renderer:didSimulatePhysicsAtTime:", self, v6);
    if ((*(_WORD *)&self->_delegationConformance & 4) != 0)
    {
      v28 = self;
      if ((*((_BYTE *)self + 129) & 4) != 0)
        v28 = self->_privateRendererOwner;
      objc_msgSend(self->_delegate, "renderer:didSimulatePhysicsAtTime:", v28, v6);
    }
    kdebug_trace();
    Stats[21] = Stats[21] + CACurrentMediaTime() - v27;
  }
  v29 = CACurrentMediaTime();
  ControllerManager = C3DSceneGetControllerManager((uint64_t)a3);
  if (ControllerManager)
  {
    v31 = ControllerManager;
    *(_QWORD *)(ControllerManager + 32) = -[SCNRenderer _engineContext](self, "_engineContext");
    kdebug_trace();
    C3DConstraintManagerApply(v31);
    kdebug_trace();
  }
  Stats[13] = Stats[13] + CACurrentMediaTime() - v29;
  if ((*(_BYTE *)&self->_delegationConformance & 8) != 0
    || (*(_WORD *)&self->_selfDelegationConformance & 8) != 0
    || (*(_WORD *)&self->_privateRendererOwnerDelegationConformance & 8) != 0)
  {
    v32 = CACurrentMediaTime();
    kdebug_trace();
    if ((*(_WORD *)&self->_privateRendererOwnerDelegationConformance & 8) != 0)
      -[SCNSceneRenderer _renderer:didApplyConstraintsAtTime:](self->_privateRendererOwner, "_renderer:didApplyConstraintsAtTime:", self->_privateRendererOwner, v6);
    if ((*(_WORD *)&self->_selfDelegationConformance & 8) != 0)
      -[SCNRenderer _renderer:didApplyConstraintsAtTime:](self, "_renderer:didApplyConstraintsAtTime:", self, v6);
    if ((*(_WORD *)&self->_delegationConformance & 8) != 0)
    {
      v33 = self;
      if ((*((_BYTE *)self + 129) & 4) != 0)
        v33 = self->_privateRendererOwner;
      objc_msgSend(self->_delegate, "renderer:didApplyConstraintsAtTime:", v33, v6);
    }
    kdebug_trace();
    Stats[21] = Stats[21] + CACurrentMediaTime() - v32;
  }
  v34 = CACurrentMediaTime();
  ParticleManager = C3DSceneGetParticleManager((uint64_t)a3, 0);
  v36 = (uint64_t)ParticleManager;
  if (!IsPausedForEditing)
  {
    v39 = 1;
    if (!ParticleManager)
      goto LABEL_84;
    goto LABEL_76;
  }
  v45 = 0;
  v46 = &v45;
  v47 = 0x2020000000;
  v48 = 0;
  v37 = -[SCNRenderer _authoringEnvironment](self, "_authoringEnvironment");
  if (v37)
  {
    SelectedNodes = (void *)C3DAuthoringEnvironmentGetSelectedNodes(v37);
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __23__SCNRenderer__update___block_invoke;
    v44[3] = &unk_1EA5A25D0;
    v44[4] = &v45;
    objc_msgSend(SelectedNodes, "enumerateObjectsUsingBlock:", v44);
  }
  v39 = *((_BYTE *)v46 + 24) != 0;
  _Block_object_dispose(&v45, 8);
  if (v36)
  {
LABEL_76:
    kdebug_trace();
    if (!v39)
      v12 = 0.0;
    v40 = !v39;
    EnginePipeline = C3DSceneGetEnginePipeline((uint64_t)a3);
    C3DParticleManagerUpdate(v36, EnginePipeline, v12);
    if (self->_isAnimating)
      v42 = 1;
    else
      v42 = v40;
    if ((v42 & 1) == 0)
      self->_isAnimating = C3DParticleManagerNeedRedraw(v36);
    kdebug_trace();
  }
LABEL_84:
  Stats[15] = Stats[15] + CACurrentMediaTime() - v34;
  kdebug_trace();
  C3DAudioManagerUpdateNodes(self->_engineContext);
  kdebug_trace();
  AuthoringEnvironment2 = C3DSceneGetAuthoringEnvironment2((SCNAuthoringEnvironment2 *)a3, 0);
  if (AuthoringEnvironment2)
    C3DAuthoringEnvironment2Update(AuthoringEnvironment2, (const char *)self);
  objc_autoreleasePoolPop(v13);
  +[SCNTransaction setImmediateModeRestrictedContext:](SCNTransaction, "setImmediateModeRestrictedContext:", 0);
  +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", 0);
}

const __CFDictionary *__23__SCNRenderer__update___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  const __CFDictionary *result;

  result = C3DNodeGetParticleSystems(a2);
  if (result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (void)_updateWithSystemTime:(double)a3
{
  __C3DEngineContext *engineContext;
  uint64_t Scene;
  uint64_t v7;

  -[SCNRenderer lock](self, "lock");
  -[SCNRenderer _updateSystemTimeAndDeltaTimeWithCurrentTime:](self, "_updateSystemTimeAndDeltaTimeWithCurrentTime:", a3);
  +[SCNTransaction lock](SCNTransaction, "lock");
  engineContext = self->_engineContext;
  if (engineContext)
  {
    Scene = C3DEngineContextGetScene((uint64_t)engineContext);
    if (Scene)
    {
      v7 = Scene;
      C3DSceneLock(Scene);
      -[SCNRenderer _update:](self, "_update:", v7);
      C3DSceneUnlock(v7);
    }
  }
  +[SCNTransaction unlock](SCNTransaction, "unlock");
  -[SCNRenderer unlock](self, "unlock");
}

- (void)updateAndDrawStatisticsIfNeeded
{
  int v3;
  int v5;
  uint64_t RendererContextGL;
  int *Stats;
  uint64_t v8;
  uint64_t v9;
  double Current;
  double statisticsTimeStamp;
  id v12;
  uint64_t v13;
  _OWORD v14[54];

  v3 = SCNGetPerformanceStatisticsEnabled();
  if (self->_showStatistics || v3 != 0)
  {
    v5 = v3;
    if (self->_renderingAPI)
    {
      RendererContextGL = C3DEngineContextGetRendererContextGL((uint64_t)self->_engineContext);
      Stats = (int *)C3DRendererContextGetStats(RendererContextGL);
      v8 = 0;
    }
    else
    {
      Stats = (int *)-[SCNMTLResourceManager commandQueue]((uint64_t)self->_renderContext);
      v9 = -[SCNMTLRenderContext resourceManager]((uint64_t)self->_renderContext);
      v8 = -[SCNMTLResourceManager stats](v9);
    }
    C3DEngineStatsFinish((uint64_t)Stats);
    Current = CFAbsoluteTimeGetCurrent();
    statisticsTimeStamp = self->_statisticsTimeStamp;
    v12 = -[SCNRenderer _authoringEnvironment](self, "_authoringEnvironment");
    if (statisticsTimeStamp <= Current)
    {
      v13 = (uint64_t)v12;
      memset(v14, 0, 512);
      C3DEngineStatsEndFrameAndCopy(Stats, v8, (uint64_t)v14);
      C3DEngineStatsReset((uint64_t)Stats);
      if (self->_showStatistics)
        C3DAuthoringEnvironmentUpdateStats(v13, (double *)v14, v8);
      if (v5)
        SCNPushPerformanceStatistics((uint64_t)v14);
      self->_statisticsTimeStamp = Current + 1.0;
    }
  }
}

- (void)_drawOverlaySceneAtTime:(double)a3
{
  uint64_t Stats;
  double v6;
  id v7;
  uint64_t RendererContextGL;

  if (self->_overlayScene && !self->_disableOverlays)
  {
    Stats = C3DEngineContextGetStats((uint64_t)self->_engineContext);
    v6 = CACurrentMediaTime();
    v7 = -[SCNRenderer _prepareSKRenderer](self, "_prepareSKRenderer");
    if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(self->_overlayScene, "_isDirty") & 1) == 0)
    {
      if (!-[SCNRenderer _needsRepetitiveRedraw](self, "_needsRepetitiveRedraw"))
        objc_msgSend(self->_overlayScene, "_notifyNextDirtyState");
    }
    else
    {
      C3DEngineContextSetNextFrameTimeToAsap((uint64_t)self->_engineContext);
    }
    if (self->_renderingAPI)
    {
      objc_msgSend(v7, "updateAtTime:", a3);
      RendererContextGL = C3DEngineContextGetRendererContextGL((uint64_t)self->_engineContext);
      C3DRendererContextPushGroupMarker(RendererContextGL, "SpriteKit - Draw Overlay");
      objc_msgSend(v7, "render:", 0);
      C3DRendererContextPopGroupMarker();
    }
    else
    {
      -[SCNMTLRenderContext renderSKSceneWithRenderer:overlay:atTime:]((uint64_t)self->_renderContext, v7, 1u);
    }
    *(double *)(Stats + 160) = *(double *)(Stats + 160) + CACurrentMediaTime() - v6;
  }
}

- (id)hitTest:(CGPoint)a3 options:(id)a4
{
  double width;

  width = self->_framebufferInfo.drawableSize.width;
  if (width == 0.0)
    return (id)MEMORY[0x1E0C9AA60];
  else
    return -[SCNRenderer _hitTest:viewport:options:](self, "_hitTest:viewport:options:", a4, a3.x, a3.y, width, self->_framebufferInfo.drawableSize.height);
}

- (id)hitTestWithSegmentFromPoint:(SCNVector3)a3 toPoint:(SCNVector3)a4 options:(id)a5
{
  float z;
  float y;
  float x;
  float v9;
  float v10;
  float v11;
  SCNNode *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;

  z = a4.z;
  y = a4.y;
  x = a4.x;
  v9 = a3.z;
  v10 = a3.y;
  v11 = a3.x;
  v12 = -[SCNScene rootNode](-[SCNRenderer scene](self, "scene"), "rootNode");
  *(float *)&v13 = v11;
  *(float *)&v14 = v10;
  *(float *)&v15 = v9;
  *(float *)&v16 = x;
  *(float *)&v17 = y;
  *(float *)&v18 = z;
  return -[SCNNode hitTestWithSegmentFromPoint:toPoint:options:](v12, "hitTestWithSegmentFromPoint:toPoint:options:", a5, v13, v14, v15, v16, v17, v18);
}

- (id)_hitTest:(CGPoint)a3 viewport:(CGSize)a4 options:(id)a5
{
  SCNScene *v7;
  __C3DScene *v8;
  __n128 *v9;
  __n128 *v10;
  __C3DEngineContext *v11;
  uint64_t v12;
  float32x4_t *PointOfView;
  float32x4_t *v14;
  uint64_t v15;
  float64x2_t v16;
  float64x2_t v17;
  double v18;
  __n128 v19;
  uint64_t HitTestResultsAtPoint;
  const void *v21;
  id v22;
  CGFloat x;
  CGFloat y;
  CGFloat height;
  CGFloat width;

  height = a4.height;
  width = a4.width;
  x = a3.x;
  y = a3.y;
  v7 = -[SCNRenderer scene](self, "scene");
  +[SCNTransaction lock](SCNTransaction, "lock");
  v8 = -[SCNScene sceneRef](v7, "sceneRef");
  if (v8 && (v9 = (__n128 *)CFRetain(v8)) != 0)
  {
    v10 = v9;
    C3DSceneLock((uint64_t)v9);
    v11 = -[SCNRenderer _engineContext](self, "_engineContext");
    if (!v11)
      goto LABEL_13;
    v12 = (uint64_t)v11;
    PointOfView = C3DEngineContextGetPointOfView((uint64_t)v11);
    if (!PointOfView)
      goto LABEL_13;
    v14 = PointOfView;
    if (a5)
    {
      if (!objc_msgSend(a5, "objectForKey:", CFSTR("kHitTestRootNode"))
        || (v15 = objc_msgSend((id)objc_msgSend(a5, "objectForKey:", CFSTR("kHitTestRootNode")), "nodeRef"),
            a5 = (id)objc_msgSend(a5, "mutableCopy"),
            objc_msgSend(a5, "setObject:forKey:", v15, CFSTR("kHitTestRootNode")),
            a5))
      {
        if (objc_msgSend(a5, "objectForKey:", CFSTR("kHitTestShowDebugInfo")))
        {
          a5 = (id)objc_msgSend(a5, "mutableCopy");
          objc_msgSend(a5, "setObject:forKey:", C3DEngineContextGetAuthoringEnvironment(v12, 0), CFSTR("auth"));
        }
      }
    }
    v16.f64[0] = width;
    v17.f64[0] = x;
    v17.f64[1] = y;
    v18 = COERCE_DOUBLE(vcvt_f32_f64(v17));
    v16.f64[1] = height;
    -[SCNRenderer adjustViewportForRendering:](self, "adjustViewportForRendering:", *(double *)vcvt_hight_f32_f64(0, v16).i64);
    HitTestResultsAtPoint = C3DSceneCreateHitTestResultsAtPoint(v10, v14, (const __CFDictionary *)a5, v18, v19);
    if (HitTestResultsAtPoint)
    {
      v21 = (const void *)HitTestResultsAtPoint;
      v22 = +[SCNHitTestResult hitTestResultsFromHitTestResultRef:](SCNHitTestResult, "hitTestResultsFromHitTestResultRef:", HitTestResultsAtPoint);
      CFRelease(v21);
    }
    else
    {
LABEL_13:
      v22 = 0;
    }
    C3DSceneUnlock((uint64_t)v10);
    +[SCNTransaction unlock](SCNTransaction, "unlock");
    CFRelease(v10);
  }
  else
  {
    +[SCNTransaction unlock](SCNTransaction, "unlock");
    v22 = 0;
  }
  if (v22)
    return v22;
  else
    return (id)MEMORY[0x1E0C9AA60];
}

- (BOOL)_isNodeInsideFrustum:(id)a3 withPointOfView:(id)a4 viewport:(SCNVector4)a5
{
  SCNNode *v6;
  float v7;
  float32x4_t *WorldMatrix;
  BOOL v9;
  double v10;
  float32x4_t v11;
  float32x4_t v12;
  float32x4_t v13;
  uint64_t i;
  unint64_t v15;
  float32x4_t v16;
  float32x4_t v17;
  float32x4_t v18;
  float32x4_t v19;
  float32x4_t v20;
  int8x16_t v21;
  float32x4_t v22;
  float y;
  float x;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  float32x4_t v32;
  float32x4_t v33;
  float32x4_t v34;
  float32x4_t v35;
  _OWORD v36[4];
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;

  if (!a4)
  {
    x = a5.x;
    y = a5.y;
    v6 = -[SCNRenderer pointOfView](self, "pointOfView");
    a5.y = y;
    a5.x = x;
    a4 = v6;
    if (!v6)
      return 0;
  }
  v7 = a5.y;
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  if (objc_msgSend(a4, "getFrustum:withViewport:", &v37, *(double *)&a5.x))
  {
    memset(v36, 0, sizeof(v36));
    v34 = 0u;
    v35 = 0u;
    if (objc_msgSend(a3, "isPresentationInstance"))
    {
      WorldMatrix = C3DNodeGetWorldMatrix((float32x4_t *)objc_msgSend(a3, "nodeRef"));
      C3DNodeComputeHierarchicalBoundingBox((float32x4_t *)objc_msgSend(a3, "nodeRef"), 1, &v34);
    }
    else
    {
      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      if (a3)
        objc_msgSend(a3, "worldTransform");
      WorldMatrix = (float32x4_t *)v36;
      *(_QWORD *)&v10 = C3DMatrix4x4FromSCNMatrix4(v36, (uint64_t)&v26).n128_u64[0];
      v33.i32[2] = 0;
      v33.i64[0] = 0;
      v32.i32[2] = 0;
      v32.i64[0] = 0;
      objc_msgSend(a3, "getBoundingBoxMin:max:", &v33, &v32, v10);
      v11.i64[0] = 0x3F0000003F000000;
      v11.i64[1] = 0x3F0000003F000000;
      v12 = vmulq_f32(vaddq_f32(v33, v32), v11);
      v13 = vmulq_f32(vsubq_f32(v32, v33), v11);
      v12.i32[3] = 1.0;
      v13.i32[3] = 0;
      v34 = v12;
      v35 = v13;
    }
    for (i = 0; i != 96; i += 16)
      *(__int128 *)((char *)&v37 + i) = (__int128)vnegq_f32(*(float32x4_t *)((char *)&v37 + i));
    v15 = 0;
    v9 = 0;
    v16 = WorldMatrix[1];
    v17 = WorldMatrix[2];
    v18 = vaddq_f32(WorldMatrix[3], vmlaq_laneq_f32(vmlaq_n_f32(vmulq_lane_f32(v16, *(float32x2_t *)v34.f32, 1), *WorldMatrix, v34.f32[0]), v17, v34, 2));
    v18.i32[3] = 1.0;
    v19 = vaddq_f32(vaddq_f32(vabsq_f32(vmulq_n_f32(*WorldMatrix, v35.f32[0])), vabsq_f32(vmulq_lane_f32(v16, *(float32x2_t *)v35.f32, 1))), vabsq_f32(vmulq_laneq_f32(v17, v35, 2)));
    v28 = v39;
    v29 = v40;
    v30 = v41;
    v31 = v42;
    v26 = v37;
    v27 = v38;
    do
    {
      v20 = (float32x4_t)*(&v26 + v15);
      v21 = (int8x16_t)vmulq_f32(v18, v20);
      v22 = vmulq_f32(v19, vabsq_f32(v20));
      if (vaddv_f32(vadd_f32(*(float32x2_t *)v21.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v21, v21, 8uLL))) > vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v22, 2), vaddq_f32(v22, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v22.f32, 1))).f32[0])
        break;
      v9 = v15++ > 4;
    }
    while (v15 != 6);
  }
  else
  {
    return 0;
  }
  return v9;
}

- (BOOL)isNodeInsideFrustum:(id)a3 withPointOfView:(id)a4
{
  double v4;
  double v5;
  double width;
  double height;

  width = self->_framebufferInfo.drawableSize.width;
  if (width == 0.0)
    return 0;
  height = self->_framebufferInfo.drawableSize.height;
  *(float *)&v4 = width;
  *(float *)&v5 = height;
  LODWORD(width) = 0;
  LODWORD(height) = 0;
  return -[SCNRenderer _isNodeInsideFrustum:withPointOfView:viewport:](self, "_isNodeInsideFrustum:withPointOfView:viewport:", a3, a4, width, height, v4, v5);
}

- (id)_nodesInsideFrustumWithPointOfView:(id)a3 viewport:(SCNVector4)a4
{
  void *v6;
  __C3DScene *v7;
  uint64_t CullingSystem;
  _QWORD v10[5];
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  _OWORD v14[6];

  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array", *(double *)&a4.x, *(double *)&a4.y);
  if (a3 || (a3 = -[SCNRenderer pointOfView](self, "pointOfView")) != 0)
  {
    if (-[SCNRenderer scene](self, "scene"))
    {
      memset(v14, 0, sizeof(v14));
      if (objc_msgSend(a3, "getFrustum:withViewport:", v14, 0.0))
      {
        v7 = -[SCNScene sceneRef](self->_scene, "sceneRef");
        C3DSceneLock((uint64_t)v7);
        CullingSystem = C3DSceneGetCullingSystem((uint64_t)v7);
        v13 = 0;
        v11 = 0u;
        v12 = 0u;
        v10[0] = MEMORY[0x1E0C809B0];
        v10[1] = 3221225472;
        v10[2] = __59__SCNRenderer__nodesInsideFrustumWithPointOfView_viewport___block_invoke;
        v10[3] = &unk_1EA5A25F8;
        v10[4] = v6;
        v11 = (unint64_t)objc_msgSend((id)objc_msgSend(a3, "camera", C3DCullingSystemQueryMake((uint64_t)v10, (uint64_t)&v11)), "categoryBitMask");
        DWORD1(v12) = 1;
        C3DCullingSystemCull(CullingSystem);
        C3DSceneUnlock((uint64_t)v7);
      }
    }
  }
  return v6;
}

uint64_t __59__SCNRenderer__nodesInsideFrustumWithPointOfView_viewport___block_invoke(uint64_t result, uint64_t *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  if (a3 >= 1)
  {
    v15 = v8;
    v16 = v7;
    v17 = v6;
    v18 = v5;
    v19 = v4;
    v20 = v3;
    v21 = v9;
    v22 = v10;
    v11 = a3;
    v13 = result;
    do
    {
      v14 = *a2++;
      result = objc_msgSend(*(id *)(v13 + 32), "addObject:", +[SCNNode nodeWithNodeRef:](SCNNode, "nodeWithNodeRef:", v14, v15, v16, v17, v18, v19, v20, v21, v22));
      --v11;
    }
    while (v11);
  }
  return result;
}

- (id)nodesInsideFrustumWithPointOfView:(id)a3
{
  double v3;
  double v4;
  double width;
  double height;

  width = self->_framebufferInfo.drawableSize.width;
  if (width == 0.0)
    return (id)MEMORY[0x1E0C9AA60];
  height = self->_framebufferInfo.drawableSize.height;
  *(float *)&v3 = width;
  *(float *)&v4 = height;
  LODWORD(width) = 0;
  LODWORD(height) = 0;
  return -[SCNRenderer _nodesInsideFrustumWithPointOfView:viewport:](self, "_nodesInsideFrustumWithPointOfView:viewport:", a3, width, height, v3, v4);
}

- (void)_play
{
  if (!self->_playing)
  {
    self->_lastSystemTime = 0.0;
    self->_playing = 1;
  }
}

- (void)_pause
{
  self->_playing = 0;
}

- (void)_stop
{
  SCNScene *scene;
  double StartTime;

  self->_playing = 0;
  scene = self->_scene;
  if (scene)
    StartTime = C3DSceneGetStartTime((uint64_t)-[SCNScene sceneRef](scene, "sceneRef"));
  else
    StartTime = 0.0;
  -[SCNRenderer _setSceneTime:](self, "_setSceneTime:", StartTime);
}

- (BOOL)isPlaying
{
  return self->_playing;
}

- (void)setPlaying:(BOOL)a3
{
  if (a3)
    -[SCNRenderer _play](self, "_play");
  else
    -[SCNRenderer _pause](self, "_pause");
}

- (void)setRendersContinuously:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *((_BYTE *)self + 129) = *((_BYTE *)self + 129) & 0xFD | v3;
}

- (BOOL)loops
{
  return self->_loops;
}

- (void)setLoops:(BOOL)a3
{
  self->_loops = a3;
}

- (BOOL)isJitteringEnabled
{
  return *((_BYTE *)self + 288) & 1;
}

- (BOOL)jitteringEnabled
{
  return *((_BYTE *)self + 288) & 1;
}

- (BOOL)isVertexAmplificationEnabled
{
  return C3DEngineContextGetVertexAmplificationEnabled((uint64_t)self->_engineContext);
}

- (BOOL)forceAsyncShaderCompilation
{
  return -[SCNMTLRenderContext forceAsyncShaderCompilation]((_BOOL8)self->_renderContext);
}

- (void)setForceAsyncShaderCompilation:(BOOL)a3
{
  -[SCNMTLRenderContext setForceAsyncShaderCompilation:]((uint64_t)self->_renderContext, a3);
}

- (void)setVertexAmplificationEnabled:(BOOL)a3
{
  C3DEngineContextSetVertexAmplificationEnabled((uint64_t)self->_engineContext, a3);
}

- (BOOL)isTemporalAntialiasingEnabled
{
  return (*((unsigned __int8 *)self + 288) >> 1) & 1;
}

- (void)setTemporalAntialiasingEnabled:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *((_BYTE *)self + 288) = *((_BYTE *)self + 288) & 0xFD | v3;
}

- (BOOL)temporalAntialiasingEnabled
{
  return (*((unsigned __int8 *)self + 288) >> 1) & 1;
}

- (BOOL)frozen
{
  return (*((unsigned __int8 *)self + 288) >> 2) & 1;
}

- (void)setFrozen:(BOOL)a3
{
  _BOOL4 v3;
  char v5;

  v3 = a3;
  -[SCNRenderer lock](self, "lock");
  if (v3)
    v5 = 4;
  else
    v5 = 0;
  *((_BYTE *)self + 288) = *((_BYTE *)self + 288) & 0xFB | v5;
  -[SCNRenderer unlock](self, "unlock");
}

- (id)_copyPerformanceStatistics
{
  __C3DEngineContext *v3;
  uint64_t Stats;
  void *v5;
  __int128 v7;
  _BYTE v8[20];

  *(_OWORD *)v8 = 0u;
  -[SCNRenderer lock](self, "lock", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, *(_QWORD *)&v8[12]);
  v3 = -[SCNRenderer _engineContext](self, "_engineContext");
  if (v3 && (Stats = C3DEngineContextGetStats((uint64_t)v3)) != 0)
  {
    SCNConvertEngineStatsToPerformanceData(Stats, &v7, 0);
    v5 = _SCNGetPerformanceStatisticsFromPerformanceData((unsigned __int8 *)&v7, 0);
  }
  else
  {
    v5 = 0;
  }
  -[SCNRenderer unlock](self, "unlock");
  return v5;
}

- (void)_displayLinkStatsTick
{
  __C3DEngineContext *v2;
  uint64_t Stats;

  v2 = -[SCNRenderer _engineContext](self, "_engineContext");
  if (v2)
  {
    Stats = C3DEngineContextGetStats((uint64_t)v2);
    if (Stats)
      *(double *)(Stats + 184) = *(double *)(Stats + 184) + CACurrentMediaTime() - *(double *)(Stats + 208);
  }
}

- (void)_displayLinkStatsTack
{
  __C3DEngineContext *v2;
  uint64_t Stats;

  v2 = -[SCNRenderer _engineContext](self, "_engineContext");
  if (v2)
  {
    Stats = C3DEngineContextGetStats((uint64_t)v2);
    if (Stats)
      *(CFTimeInterval *)(Stats + 208) = CACurrentMediaTime();
  }
}

- (void)setShowsStatistics:(BOOL)a3
{
  if (a3)
    -[SCNRenderer setupAuthoringEnvironment](self, "setupAuthoringEnvironment");
  self->_showStatistics = a3;
}

- (void)_runningInExtension
{
  self->_isRunningInExtension = 1;
}

- (void)_presentFramebuffer
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t Stats;
  double v12;
  const void *RenderTarget;
  GLuint RenderBuffer;

  if (self->_renderContext)
  {
    -[SCNRenderer _endFrame](self, "_endFrame");
  }
  else
  {
    if (self->_renderingAPI && (EAGLContext *)objc_msgSend(MEMORY[0x1E0CD0958], "currentContext") != self->_glContext)
    {
      v3 = scn_default_log();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
        -[SCNRenderer _deleteGLFramebuffer].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
    Stats = C3DEngineContextGetStats((uint64_t)self->_engineContext);
    v12 = CACurrentMediaTime();
    glPushGroupMarkerEXT(0, "SceneKit - Flush");
    -[SCNRenderer _resolveAndDiscardGL](self, "_resolveAndDiscardGL");
    RenderTarget = C3DFramebufferGetRenderTarget((uint64_t)self->_framebufferInfo.frameBuffer, 0);
    RenderBuffer = C3DRenderTargetGetRenderBuffer((uint64_t)RenderTarget);
    glBindRenderbuffer(0x8D41u, RenderBuffer);
    -[EAGLContext presentRenderbuffer:](self->_glContext, "presentRenderbuffer:", 36161);
    glPopGroupMarkerEXT();
    *(double *)(Stats + 176) = *(double *)(Stats + 176) + CACurrentMediaTime() - v12;
  }
}

- (void)setDebugOptions:(unint64_t)a3
{
  unint64_t renderingAPI;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  int v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t RenderContext;

  if (self->_debugOptions != a3)
  {
    -[SCNRenderer setupAuthoringEnvironment](self, "setupAuthoringEnvironment");
    self->_debugOptions = a3;
    -[SCNRenderer lock](self, "lock");
    renderingAPI = self->_renderingAPI;
    if (-[SCNRenderer _showsAuthoringEnvironment](self, "_showsAuthoringEnvironment"))
      v6 = objc_msgSend(-[SCNRenderer _authoringEnvironment](self, "_authoringEnvironment"), "authoringDisplayMask") & 0xFFFFFFFFFFFFFF82;
    else
      v6 = 0;
    v7 = (a3 << 6) & 0x40 | (a3 >> 1) & 1 | ((uint64_t)(a3 << 60) >> 63) & 0x28 | ((uint64_t)(a3 << 53) >> 63) & 0x14 | v6;
    if ((a3 & 4) != 0)
    {
      v9 = C3DIsRunningInXcode();
      v10 = v7 | 0x1000;
      if (v9)
        v10 = v7;
      v8 = v10 | 0x200;
    }
    else
    {
      v8 = (a3 << 6) & 0x40 | (a3 >> 1) & 1 | ((uint64_t)(a3 << 60) >> 63) & 0x28 | ((uint64_t)(a3 << 53) >> 63) & 0x14 | v6 & 0xFFFFFFFFFFFFEDFFLL;
    }
    v11 = v8 & 0xFFFFFFFFFFFFFF7FLL | (((a3 >> 4) & 1) << 7);
    v12 = v11 & 0xFFFFFFFFFFFFFBFFLL;
    if ((a3 & 0x20) != 0)
      v12 = v11 | 0x400;
    if (renderingAPI)
      v11 = v12;
    v13 = ((_WORD)a3 << 6) & 0x4000 | (16 * (int)a3) & 0xA800 | (((a3 >> 12) & 1) << 17) | v11 & 0xFFFFFFFFFFFD17FFLL;
    -[SCNRenderer set_showsAuthoringEnvironment:](self, "set_showsAuthoringEnvironment:", v13 != 0);
    objc_msgSend(-[SCNRenderer _authoringEnvironment](self, "_authoringEnvironment"), "setAuthoringDisplayMask:", v13);
    if (!renderingAPI)
    {
      RenderContext = C3DEngineContextGetRenderContext((uint64_t)self->_engineContext);
      -[SCNMTLRenderContext setDebugOptions:](RenderContext, (a3 >> 3) & 4 | (a3 >> 5) & 2);
    }
    -[SCNRenderer unlock](self, "unlock");
  }
}

- (unint64_t)debugOptions
{
  return self->_debugOptions;
}

- (BOOL)usesReverseZ
{
  SCNMTLRenderContext *renderContext;

  renderContext = self->_renderContext;
  if (renderContext)
    LOBYTE(renderContext) = -[SCNMTLRenderContext reverseZ]((uint64_t)renderContext);
  return (char)renderContext;
}

- (void)setUsesReverseZ:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  if (-[SCNRenderer usesReverseZ](self, "usesReverseZ") != a3)
    -[SCNMTLRenderContext setReverseZ:]((uint64_t)self->_renderContext, v3);
}

- (void)_reloadDebugOptions
{
  unint64_t v3;
  uint64_t v4;

  if (-[SCNRenderer _showsAuthoringEnvironment](self, "_showsAuthoringEnvironment"))
  {
    v3 = objc_msgSend(-[SCNRenderer _authoringEnvironment](self, "_authoringEnvironment"), "authoringDisplayMask");
    v4 = v3 & 8 | (v3 >> 6) & 1 | (2 * (v3 & 1)) | (((v3 >> 4) & 1) << 10) | (v3 >> 7) & 4 | (v3 >> 3) & 0x10 | (v3 >> 5) & 0x20 | (v3 >> 4) & 0x80 | (v3 >> 6) & 0x100 | (v3 >> 4) & 0xA00 | (v3 >> 5) & 0x1000;
  }
  else
  {
    v4 = 0;
  }
  self->_debugOptions = self->_debugOptions & 0x60 | v4;
}

- (BOOL)_disableLinearRendering
{
  return *((unsigned __int8 *)self + 129) >> 7;
}

- (void)set_disableLinearRendering:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *((_BYTE *)self + 129) = v3 & 0x80 | *((_BYTE *)self + 129) & 0x7F;
}

- (BOOL)_enableARMode
{
  SCNMTLRenderContext *renderContext;

  renderContext = self->_renderContext;
  if (renderContext)
    LOBYTE(renderContext) = -[SCNMTLRenderContext enableARMode]((uint64_t)renderContext);
  return (char)renderContext;
}

- (void)set_enableARMode:(BOOL)a3
{
  SCNMTLRenderContext *renderContext;

  renderContext = self->_renderContext;
  if (renderContext)
    -[SCNMTLRenderContext setEnableARMode:]((uint64_t)renderContext, a3);
}

- (BOOL)_shouldDelegateARCompositing
{
  SCNMTLRenderContext *renderContext;

  renderContext = self->_renderContext;
  if (renderContext)
    LOBYTE(renderContext) = -[SCNMTLRenderContext shouldDelegateARCompositing]((uint64_t)renderContext);
  return (char)renderContext;
}

- (void)set_shouldDelegateARCompositing:(BOOL)a3
{
  SCNMTLRenderContext *renderContext;

  renderContext = self->_renderContext;
  if (renderContext)
    -[SCNMTLRenderContext setShouldDelegateARCompositing:]((uint64_t)renderContext, a3);
}

- (void)set_collectCompilationErrors:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t RendererContextGL;
  uint64_t RenderContext;

  v3 = a3;
  RendererContextGL = C3DEngineContextGetRendererContextGL((uint64_t)self->_engineContext);
  if (RendererContextGL)
    C3DRendererContextSetCompilationErrorsCollection(RendererContextGL, v3);
  RenderContext = C3DEngineContextGetRenderContext((uint64_t)self->_engineContext);
  if (self->_renderContext)
    -[SCNMTLRenderContext setCollectsCompilationErrors:](RenderContext, v3);
}

- (id)_compilationErrors
{
  SCNRenderer *snapshotRenderer;
  uint64_t RendererContextGL;
  uint64_t RenderContext;

  snapshotRenderer = self->_snapshotRenderer;
  if (snapshotRenderer)
    return -[SCNRenderer _compilationErrors](snapshotRenderer, "_compilationErrors");
  RendererContextGL = C3DEngineContextGetRendererContextGL((uint64_t)self->_engineContext);
  if (RendererContextGL)
    return C3DRendererContextGetCompilationErrors(RendererContextGL);
  RenderContext = C3DEngineContextGetRenderContext((uint64_t)self->_engineContext);
  if (self->_renderContext)
    return (id)-[SCNMTLRenderContext compilationErrors](RenderContext);
  else
    return 0;
}

- (BOOL)_showsAuthoringEnvironment
{
  return self->_showAuthoringEnvironment;
}

- (void)set_showsAuthoringEnvironment:(BOOL)a3
{
  uint64_t RendererContextGL;
  uint64_t RenderContext;

  if (self->_showAuthoringEnvironment != a3)
  {
    self->_showAuthoringEnvironment = a3;
    if (a3)
      -[SCNRenderer setupAuthoringEnvironment](self, "setupAuthoringEnvironment");
    RendererContextGL = C3DEngineContextGetRendererContextGL((uint64_t)self->_engineContext);
    if (RendererContextGL)
      C3DAnimationManagerSetPausedForEditing(RendererContextGL, a3);
    RenderContext = C3DEngineContextGetRenderContext((uint64_t)self->_engineContext);
    if (self->_renderContext)
      -[SCNMTLRenderContext setShowsAuthoringEnvironment:](RenderContext, a3);
    -[SCNRenderer _reloadDebugOptions](self, "_reloadDebugOptions");
  }
}

- (void)setupAuthoringEnvironment
{
  void *privateRendererOwner;

  if (!self->_authoringEnvironment)
  {
    -[SCNRenderer lock](self, "lock");
    if (self->_privateRendererOwner)
      privateRendererOwner = self->_privateRendererOwner;
    else
      privateRendererOwner = self;
    self->_authoringEnvironment = (SCNAuthoringEnvironment *)+[SCNAuthoringEnvironment authoringEnvironmentForSceneRenderer:createIfNeeded:](SCNAuthoringEnvironment, "authoringEnvironmentForSceneRenderer:createIfNeeded:", privateRendererOwner, 1);
    -[SCNRenderer _reloadDebugOptions](self, "_reloadDebugOptions");
    -[SCNRenderer unlock](self, "unlock");
  }
}

- (id)_authoringEnvironment
{
  return self->_authoringEnvironment;
}

- (SCNVector4)_viewport
{
  float x;
  float y;
  float z;
  float w;
  SCNVector4 result;

  x = self->__viewport.x;
  y = self->__viewport.y;
  z = self->__viewport.z;
  w = self->__viewport.w;
  result.w = w;
  result.z = z;
  result.y = y;
  result.x = x;
  return result;
}

- (CGRect)currentViewport
{
  __C3DEngineContext *v2;
  __n128 Viewport;
  float64x2_t v4;
  float64x2_t v5;
  double v6;
  double v7;
  CGRect result;

  v2 = -[SCNRenderer _engineContext](self, "_engineContext");
  if (v2)
  {
    Viewport = C3DEngineContextGetViewport((__n128 *)v2);
    v4 = vcvt_hight_f64_f32((float32x4_t)Viewport);
    v5 = vcvtq_f64_f32((float32x2_t)Viewport.n128_u64[0]);
  }
  else
  {
    v5 = *(float64x2_t *)MEMORY[0x1E0C9D648];
    v4 = *(float64x2_t *)(MEMORY[0x1E0C9D648] + 16);
  }
  v6 = v5.f64[1];
  v7 = v4.f64[1];
  result.size.width = v4.f64[0];
  result.origin.x = v5.f64[0];
  result.size.height = v7;
  result.origin.y = v6;
  return result;
}

- (void)set_viewport:(SCNVector4)a3
{
  __C3DEngineContext *v4;
  __n128 *v5;
  __n128 v6;
  float y;
  float w;
  float z;
  float x;

  x = a3.x;
  self->__viewport = a3;
  y = a3.y;
  w = a3.w;
  z = a3.z;
  v4 = -[SCNRenderer _engineContext](self, "_engineContext");
  if (v4)
  {
    v5 = (__n128 *)v4;
    C3DEngineContextSetDrawableSize((uint64_t)v4, COERCE_DOUBLE(__PAIR64__(LODWORD(w), LODWORD(z))));
    -[SCNRenderer adjustViewportForRendering:](self, "adjustViewportForRendering:", COERCE_DOUBLE(__PAIR64__(LODWORD(y), LODWORD(x))));
    C3DEngineContextSetViewport(v6, v5);
  }
}

- (__n128)_drawableSafeAreaInsets
{
  return a1[16];
}

- (void)set_drawableSafeAreaInsets:(SCNRenderer *)self
{
  __n128 v2;
  __C3DEngineContext *v3;
  __n128 v4;

  v4 = v2;
  *(__n128 *)self->__drawableSafeAreaInsets = v2;
  v3 = -[SCNRenderer _engineContext](self, "_engineContext");
  if (v3)
    C3DEngineContextSetDrawableSafeAreaInsets((__n128 *)v3, v4);
}

- (AVAudioEngine)audioEngine
{
  return (AVAudioEngine *)C3DAudioManagerGetAudioEngine(1);
}

- (AVAudioEnvironmentNode)audioEnvironmentNode
{
  return (AVAudioEnvironmentNode *)C3DAudioManagerGetAudioEnvironmentNode(self->_engineContext);
}

- (SCNNode)audioListener
{
  uint64_t Scene;
  uint64_t v4;
  id *Listener;
  SCNNode *ObjCWrapper;
  id *v8;

  Scene = C3DEngineContextGetScene((uint64_t)self->_engineContext);
  if (Scene)
  {
    v4 = Scene;
    C3DSceneLock(Scene);
    Listener = (id *)C3DAudioManagerGetListener(self->_engineContext);
    ObjCWrapper = (SCNNode *)C3DEntityGetObjCWrapper(Listener);
    C3DSceneUnlock(v4);
    return ObjCWrapper;
  }
  else
  {
    v8 = (id *)C3DAudioManagerGetListener(self->_engineContext);
    return (SCNNode *)C3DEntityGetObjCWrapper(v8);
  }
}

- (void)setAudioListener:(id)a3
{
  uint64_t Scene;
  _QWORD v6[6];

  Scene = C3DEngineContextGetScene((uint64_t)self->_engineContext);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __32__SCNRenderer_setAudioListener___block_invoke;
  v6[3] = &unk_1EA59F740;
  v6[4] = self;
  v6[5] = a3;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", Scene, self, v6);
}

_QWORD *__32__SCNRenderer_setAudioListener___block_invoke(uint64_t a1)
{
  return C3DAudioManagerSetListener(*(__C3DEngineContext **)(*(_QWORD *)(a1 + 32) + 216), objc_msgSend(*(id *)(a1 + 40), "nodeRef"));
}

- (id)MTLTexture
{
  return self->_mtlTexture;
}

- (void)_drawWithJitteringPresentationMode
{
  -[SCNRenderer _drawAtTime:](self, "_drawAtTime:", CACurrentMediaTime());
}

- (void)_renderSceneWithEngineContext:(__C3DEngineContext *)a3 sceneTime:(double)a4
{
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t Scene;
  uint64_t v16;
  uint64_t RendererContextGL;
  uint64_t ResourceManager;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id *AuthoringEnvironment;
  uint64_t Stats;
  double v29;
  uint64_t EnginePipeline;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  SCNMTLRenderContext *renderContext;
  uint64_t v40;
  char viewpointCoordinateSpace;
  NSArray *viewpoints;
  id v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  _BOOL4 v50;
  unsigned int v51;
  unsigned int v52;
  _BOOL4 v53;
  unint64_t v54;
  _BOOL4 v55;
  uint64_t v56;
  unsigned int v57;
  int v58;
  int v59;
  int v60;
  char v61;
  char v62;
  uint64_t v63;
  unsigned int i;
  id v65;
  void *v66;
  float64x2_t v67;
  float64x2_t v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  uint64_t v77;
  __n128 v78;
  uint64_t v79;
  uint64_t v80;
  float32x4_t v81;
  float32x4_t v82;
  float32x4_t v83;
  float32x4_t v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  float64x2_t v89;
  float64x2_t v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  uint64_t v95[2];
  __int128 v96;
  __int128 v97;
  _OWORD v98[4];
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  simd_float4x4 v103;

  if (!a3)
  {
    v7 = scn_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      C3DEngineContextGetStats_cold_1(v7, v8, v9, v10, v11, v12, v13, v14);
  }
  C3DEngineContextResetNextFrameTime((uint64_t)a3);
  C3DEngineContextSetSceneTime((uint64_t)a3, a4);
  Scene = C3DEngineContextGetScene((uint64_t)a3);
  if (Scene)
  {
    v16 = Scene;
    RendererContextGL = C3DEngineContextGetRendererContextGL((uint64_t)a3);
    ResourceManager = C3DEngineContextGetResourceManager((uint64_t)a3);
    if (!self->_renderContext)
    {
      if (!RendererContextGL)
      {
        v19 = scn_default_log();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
          C3DEngineContextRenderScene_cold_2(v19, v20, v21, v22, v23, v24, v25, v26);
      }
      C3DResourceManagerLockVRAMResourceAccess(ResourceManager);
      C3DRendererContextInvalidateCache(RendererContextGL);
    }
    AuthoringEnvironment = (id *)C3DEngineContextGetAuthoringEnvironment((uint64_t)a3, 0);
    if (AuthoringEnvironment)
      C3DAuthoringEnvironmentBeginFrame(AuthoringEnvironment);
    Stats = C3DEngineContextGetStats((uint64_t)a3);
    v29 = CACurrentMediaTime();
    EnginePipeline = C3DSceneGetEnginePipeline(v16);
    if (!EnginePipeline)
    {
      v31 = scn_default_log();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
        C3DEngineContextRenderScene_cold_1(v31, v32, v33, v34, v35, v36, v37, v38);
    }
    v95[0] = EnginePipeline;
    v95[1] = (uint64_t)a3;
    v96 = 0u;
    v97 = 0u;
    C3DEnginePipelineApplyNotificationQueue(v95);
    *(double *)(Stats + 152) = *(double *)(Stats + 152) + CACurrentMediaTime() - v29;
    C3DEngineContextReloadShadersIfNeeded((uint64_t)a3);
    renderContext = self->_renderContext;
    if (renderContext)
    {
      v40 = -[SCNMTLRenderContext resourceManager]((uint64_t)renderContext);
      C3DSceneSourcePerformConsistencyCheck(v40);
    }
    else
    {
      C3DRendererContextPushGroupMarker(RendererContextGL, "Resource Manager Flush");
      C3DResourceManagerFlush(ResourceManager);
      C3DRendererContextPopGroupMarker();
    }
    C3DEngineContextApplyModifiers((uint64_t)a3, EnginePipeline);
    if (self->_viewpoints)
      viewpointCoordinateSpace = self->_viewpointCoordinateSpace;
    else
      viewpointCoordinateSpace = 2;
    C3DEngineContextSetViewpointCoordinateSpace((uint64_t)a3, viewpointCoordinateSpace);
    viewpoints = self->_viewpoints;
    if (viewpoints)
    {
      v80 = ResourceManager;
      v43 = -[NSArray objectAtIndexedSubscript:](viewpoints, "objectAtIndexedSubscript:", 0);
      v44 = v43;
      v93 = 0u;
      v94 = 0u;
      v92 = 0u;
      if (v43)
      {
        objc_msgSend(v43, "viewport");
        if (*((double *)&v94 + 1) != *(double *)&v94)
          -[SCNRenderer setUsesReverseZ:](self, "setUsesReverseZ:", *((double *)&v94 + 1) < *(double *)&v94, *((double *)&v94 + 1));
      }
      v103 = __invert_f4(*(simd_float4x4 *)_PromotedConst);
      v83 = (float32x4_t)v103.columns[1];
      v84 = (float32x4_t)v103.columns[0];
      v81 = (float32x4_t)v103.columns[3];
      v82 = (float32x4_t)v103.columns[2];
      v45 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v44, "passDescriptor"), "colorAttachments"), "objectAtIndexedSubscript:", 0), "texture");
      v46 = objc_msgSend(v45, "textureType");
      v47 = v46;
      v50 = v46 == 5 || v46 == 3 || v46 == 8;
      v51 = -[SCNMTLRenderContext features]((uint64_t)self->_renderContext);
      v52 = -[SCNMTLRenderContext features]((uint64_t)self->_renderContext);
      v53 = v47 == 2;
      v54 = -[NSArray count](self->_viewpoints, "count");
      if (v54)
      {
        v79 = RendererContextGL;
        v55 = v50;
        v56 = 0;
        v57 = 0;
        LOBYTE(RendererContextGL) = 1;
        v58 = v55 & (v51 >> 5);
        v59 = v53 & (v52 >> 7);
        ResourceManager = v80;
        do
        {
          C3DEngineContextSetRenderPassDescriptorForEye((uint64_t)a3, (CFTypeRef)objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_viewpoints, "objectAtIndexedSubscript:", v56, v79), "passDescriptor"), v57);
          LODWORD(RendererContextGL) = (RendererContextGL & 1) != 0
                                    && v45 == (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_viewpoints, "objectAtIndexedSubscript:", v56), "passDescriptor"), "colorAttachments"), "objectAtIndexedSubscript:", 0), "texture");
          v56 = ++v57;
        }
        while (v54 > v57);
        if (v54 > 1)
          v60 = RendererContextGL;
        else
          v60 = 0;
        if (v59)
          v61 = 2;
        else
          v61 = v58;
        if ((v60 & (v59 | v58)) != 0)
          v62 = v61;
        else
          v62 = 0;
        C3DEngineContextSetPreferredRenderMode((uint64_t)a3, v62);
        C3DEngineContextSetEyeCount((uint64_t)a3, v54);
        RendererContextGL = v79;
        v63 = 0;
        for (i = 0; i < v54; v63 = i)
        {
          v65 = -[NSArray objectAtIndexedSubscript:](self->_viewpoints, "objectAtIndexedSubscript:", v63);
          v66 = v65;
          if (v65)
          {
            objc_msgSend(v65, "viewport");
            v67 = v89;
            v68 = v90;
          }
          else
          {
            v90 = 0u;
            v91 = 0u;
            v67 = 0uLL;
            v68 = 0uLL;
            v89 = 0u;
          }
          C3DEngineContextSetViewportAtIndex((uint64_t)a3, i, (__n128)vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v67), v68));
          v87 = 0u;
          v88 = 0u;
          v85 = 0u;
          v86 = 0u;
          objc_msgSend(v66, "simdViewMatrix");
          v85 = v69;
          v86 = v70;
          v87 = v71;
          v88 = v72;
          objc_msgSend(v66, "simdProjectionMatrix", C3DEngineContextSetEyeMatrix4x4((uint64_t)a3, 1, (uint64_t)&v85, i).n128_f64[0]);
          v85 = v73;
          v86 = v74;
          v87 = v75;
          v88 = v76;
          if (*((float *)&v75 + 2) > 0.0)
          {
            v77 = 0;
            v98[0] = v73;
            v98[1] = v74;
            v98[2] = v75;
            v98[3] = v76;
            v99 = 0u;
            v100 = 0u;
            v101 = 0u;
            v102 = 0u;
            do
            {
              *(__int128 *)((char *)&v99 + v77 * 16) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v84, COERCE_FLOAT(v98[v77])), v83, *(float32x2_t *)&v98[v77], 1), v82, (float32x4_t)v98[v77], 2), v81, (float32x4_t)v98[v77], 3);
              ++v77;
            }
            while (v77 != 4);
            v85 = v99;
            v86 = v100;
            v87 = v101;
            v88 = v102;
          }
          C3DEngineContextSetEyeMatrix4x4((uint64_t)a3, 0, (uint64_t)&v85, i++);
        }
      }
      else
      {
        C3DEngineContextSetPreferredRenderMode((uint64_t)a3, 0);
        C3DEngineContextSetEyeCount((uint64_t)a3, 0);
        ResourceManager = v80;
      }
    }
    else
    {
      -[SCNRenderer adjustViewportForRendering:](self, "adjustViewportForRendering:", *(double *)&self->__viewport.x);
      C3DEngineContextSetViewport(v78, (__n128 *)a3);
    }
    if (self->_renderContext)
      C3DEngineContextRenderWithRenderGraph((uint64_t)a3);
    else
      C3DEngineContextRenderMainTechnique((__n128 *)a3);
    if (!self->_renderContext)
    {
      C3DRendererContextUnbindTextureUnits(RendererContextGL);
      C3DRendererContextResetToDefaultStates(RendererContextGL);
      C3DRendererContextResetVolatileObjects(RendererContextGL);
      C3DResourceManagerUnlockVRAMResourceAccess(ResourceManager);
    }
  }
}

- (BOOL)_drawSceneWithNewRenderer:(__C3DScene *)a3
{
  char v5;
  _BOOL4 v6;
  uint64_t v7;
  int i;

  if (a3)
  {
    v5 = *((_BYTE *)self + 129);
    if ((v5 & 0x18) == 8)
    {
      v6 = 0;
    }
    else
    {
      v6 = -[SCNRenderer isJitteringEnabled](self, "isJitteringEnabled");
      v5 = *((_BYTE *)self + 129);
    }
    if ((v5 & 4) == 0)
      +[SCNTransaction lock](SCNTransaction, "lock");
    C3DSceneLock((uint64_t)a3);
    v7 = -[SCNMTLResourceManager commandQueue]((uint64_t)self->_renderContext);
    if ((*((_BYTE *)self + 288) & 4) != 0)
      C3DEngineStatsReset(v7);
    else
      *(_DWORD *)(v7 + 12) = 0;
    C3DSceneBumpFrameStamp((uint64_t)a3);
    if ((*((_BYTE *)self + 129) & 0x40) != 0)
      -[SCNRenderer _update:](self, "_update:", a3);
    if (v6)
      C3DEngineContextSetJitteringEnabled((uint64_t)self->_engineContext, 1);
    C3DEngineContextSetTemporalAntialiasingEnabled((uint64_t)self->_engineContext, -[SCNRenderer isTemporalAntialiasingEnabled](self, "isTemporalAntialiasingEnabled"));
    -[SCNRenderer _renderSceneWithEngineContext:sceneTime:](self, "_renderSceneWithEngineContext:sceneTime:", self->_engineContext, self->_currentSceneTime);
    if (v6)
    {
      C3DEngineContextSetJitteringEnabled((uint64_t)self->_engineContext, 1);
      -[SCNRenderer _endFrame](self, "_endFrame");
      for (i = 0; ; ++i)
      {
        -[SCNRenderer _beginFrame](self, "_beginFrame");
        C3DEngineContextSetUpdateMainFramebuffer((uint64_t)self->_engineContext, i == 80);
        C3DEngineContextSetJitteringStep((uint64_t)self->_engineContext, i);
        -[SCNRenderer _renderSceneWithEngineContext:sceneTime:](self, "_renderSceneWithEngineContext:sceneTime:", self->_engineContext, self->_currentSceneTime);
        if (i == 80)
          break;
        -[SCNRenderer _endFrame](self, "_endFrame");
      }
      C3DEngineContextSetJitteringEnabled((uint64_t)self->_engineContext, 0);
    }
    -[SCNRenderer _computeNextFrameTime](self, "_computeNextFrameTime");
    -[SCNRenderer set_nextFrameTime:](self, "set_nextFrameTime:");
    -[SCNMTLRenderContext endFrameSceneSpecifics](self->_renderContext);
    C3DSceneUnlock((uint64_t)a3);
    if ((*((_BYTE *)self + 129) & 4) == 0)
      +[SCNTransaction unlock](SCNTransaction, "unlock");
    -[SCNRenderer updateAndDrawStatisticsIfNeeded](self, "updateAndDrawStatisticsIfNeeded");
  }
  return a3 != 0;
}

- (BOOL)_drawSceneWithLegacyRenderer:(__C3DScene *)a3
{
  _BOOL4 v5;
  uint64_t RendererContextGL;
  uint64_t Stats;
  uint64_t v8;
  __C3DEngineContext *engineContext;
  double currentSceneTime;
  int i;
  _QWORD v13[5];

  if (a3)
  {
    v5 = (*((_BYTE *)self + 129) & 0x18) != 8 && -[SCNRenderer isJitteringEnabled](self, "isJitteringEnabled");
    RendererContextGL = C3DEngineContextGetRendererContextGL((uint64_t)self->_engineContext);
    if ((*((_BYTE *)self + 129) & 4) == 0)
      self->_framebufferInfo.drawableSize = (CGSize)vcvt_hight_f64_f32((float32x4_t)C3DEngineContextGetViewport((__n128 *)self->_engineContext));
    Stats = C3DRendererContextGetStats(RendererContextGL);
    if ((*((_BYTE *)self + 288) & 4) != 0)
      C3DEngineStatsReset(Stats);
    else
      *(_DWORD *)(Stats + 12) = 0;
    if ((*((_BYTE *)self + 129) & 4) == 0)
      +[SCNTransaction lock](SCNTransaction, "lock");
    C3DSceneLock((uint64_t)a3);
    v8 = objc_msgSend(MEMORY[0x1E0CD0958], "currentContext");
    objc_msgSend(MEMORY[0x1E0CD0958], "setCurrentContext:", self->_glContext);
    C3DSceneBumpFrameStamp((uint64_t)a3);
    -[SCNRenderer _update:](self, "_update:", a3);
    if (v5)
      C3DEngineContextSetJitteringEnabled((uint64_t)self->_engineContext, 1);
    engineContext = self->_engineContext;
    currentSceneTime = self->_currentSceneTime;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __44__SCNRenderer__drawSceneWithLegacyRenderer___block_invoke;
    v13[3] = &unk_1EA59E288;
    v13[4] = self;
    C3DEngineContextRenderScene((__n128 *)engineContext, currentSceneTime, 0, (uint64_t)v13);
    if (v5)
    {
      C3DEngineContextSetJitteringEnabled((uint64_t)self->_engineContext, 1);
      C3DEngineContextSetJitteringStep((uint64_t)self->_engineContext, 0);
      for (i = 0; i != 81; ++i)
      {
        C3DEngineContextSetUpdateMainFramebuffer((uint64_t)self->_engineContext, i == 80);
        C3DEngineContextSetJitteringStep((uint64_t)self->_engineContext, i);
        C3DEngineContextRenderScene((__n128 *)self->_engineContext, self->_currentSceneTime, 0, 0);
      }
      C3DEngineContextSetJitteringEnabled((uint64_t)self->_engineContext, 0);
    }
    objc_msgSend(MEMORY[0x1E0CD0958], "setCurrentContext:", v8);
    -[SCNRenderer _computeNextFrameTime](self, "_computeNextFrameTime");
    -[SCNRenderer set_nextFrameTime:](self, "set_nextFrameTime:");
    C3DSceneUnlock((uint64_t)a3);
    if ((*((_BYTE *)self + 129) & 4) == 0)
      +[SCNTransaction unlock](SCNTransaction, "unlock");
    C3DEngineContextSetForceShaderReload((uint64_t)self->_engineContext, 0);
  }
  return a3 != 0;
}

uint64_t __44__SCNRenderer__drawSceneWithLegacyRenderer___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateAndDrawStatisticsIfNeeded");
}

- (BOOL)_needsRedrawAsap
{
  uint64_t Scene;
  uint64_t v4;
  float32x4_t *PointOfView;
  const __CFDictionary *Camera;
  uint64_t v7;
  float ExposureAdaptationDarkeningSpeedFactor;
  float ExposureAdaptationBrighteningSpeedFactor;
  double v10;
  float v11;
  int v12;
  uint64_t FXContext;
  unsigned int v14;
  unsigned int adaptativeState0;

  if (!-[SCNRenderer _needsRepetitiveRedraw](self, "_needsRepetitiveRedraw"))
  {
    if (C3DEngineContextGetNextFrameTime((uint64_t)self->_engineContext) == INFINITY)
    {
      Scene = C3DEngineContextGetScene((uint64_t)self->_engineContext);
      if (!Scene)
        return Scene;
      v4 = Scene;
      PointOfView = C3DEngineContextGetPointOfView((uint64_t)self->_engineContext);
      if (PointOfView)
      {
        Camera = C3DNodeGetCamera((uint64_t)PointOfView);
        if (Camera)
        {
          v7 = (uint64_t)Camera;
          if (C3DCameraGetWantsHDR((uint64_t)Camera) && (C3DCameraGetWantsExposureAdaptation(v7) & 1) != 0)
          {
            ExposureAdaptationDarkeningSpeedFactor = C3DCameraGetExposureAdaptationDarkeningSpeedFactor(v7);
            ExposureAdaptationBrighteningSpeedFactor = C3DCameraGetExposureAdaptationBrighteningSpeedFactor(v7);
            if (ExposureAdaptationDarkeningSpeedFactor < ExposureAdaptationBrighteningSpeedFactor)
              ExposureAdaptationBrighteningSpeedFactor = ExposureAdaptationDarkeningSpeedFactor;
            v10 = ExposureAdaptationBrighteningSpeedFactor;
            v11 = ExposureAdaptationBrighteningSpeedFactor + 1.0;
            if (v10 <= 0.01)
              v11 = 1.01;
            v12 = (int)(5.0 / logf(v11) * 60.0);
            if (!v12)
              goto LABEL_24;
          }
          else
          {
            if (C3DCameraGetMotionBlurIntensity(v7) == 0.0)
              goto LABEL_24;
            v12 = 2;
          }
          FXContext = C3DEngineContextGetFXContext((uint64_t)self->_engineContext);
          if (FXContext)
            v14 = *(_DWORD *)(FXContext + 116);
          else
            v14 = 0;
          if (self->_adaptativeTechniqueTimeStamp != v14
            || (adaptativeState0 = self->_adaptativeState0, adaptativeState0 != C3DSceneGetStateStamp(v4)))
          {
            self->_adaptativeState0 = C3DSceneGetStateStamp(v4);
            self->_adaptativeEndFrame = C3DSceneGetFrameStamp(v4) + v12;
            self->_adaptativeTechniqueTimeStamp = v14;
          }
          if (C3DSceneGetFrameStamp(v4) < self->_adaptativeEndFrame)
            goto LABEL_2;
        }
      }
    }
LABEL_24:
    LOBYTE(Scene) = 0;
    return Scene;
  }
LABEL_2:
  LOBYTE(Scene) = 1;
  return Scene;
}

- (double)_computeNextFrameTime
{
  double NextFrameTime;
  double v4;

  NextFrameTime = C3DEngineContextGetNextFrameTime((uint64_t)self->_engineContext);
  if (-[SCNRenderer _needsRedrawAsap](self, "_needsRedrawAsap"))
  {
    v4 = CACurrentMediaTime();
    if (NextFrameTime >= v4)
      return v4;
  }
  return NextFrameTime;
}

- (void)_drawScene:(__C3DScene *)a3
{
  BOOL v4;
  id AuthoringEnvironment;

  if (!self->_engineContext)
    goto LABEL_8;
  if (self->_renderContext)
  {
    if (-[SCNRenderer _drawSceneWithNewRenderer:](self, "_drawSceneWithNewRenderer:", a3))
      return;
LABEL_8:
    -[SCNRenderer set_nextFrameTime:](self, "set_nextFrameTime:", a3, INFINITY);
    -[SCNRenderer _clearBackBuffer](self, "_clearBackBuffer");
    return;
  }
  v4 = -[SCNRenderer _drawSceneWithLegacyRenderer:](self, "_drawSceneWithLegacyRenderer:", a3);
  AuthoringEnvironment = C3DEngineContextGetAuthoringEnvironment((uint64_t)self->_engineContext, 0);
  if (AuthoringEnvironment)
    C3DAuthoringEnvironmentEndFrame((uint64_t)AuthoringEnvironment);
  if (!v4)
    goto LABEL_8;
}

- (void)_updateSystemTimeAndDeltaTimeWithCurrentTime:(double)a3
{
  double forceSystemTime;
  double lastSystemTime;
  double v7;
  double v8;

  forceSystemTime = self->_forceSystemTime;
  if (forceSystemTime == 0.0)
  {
    -[SCNRenderer _systemTime](self, "_systemTime");
    lastSystemTime = v7;
    forceSystemTime = a3;
  }
  else if (self->_lastSystemTime == 0.0)
  {
    lastSystemTime = self->_forceSystemTime;
  }
  else
  {
    lastSystemTime = self->_lastSystemTime;
  }
  -[SCNRenderer set_systemTime:](self, "set_systemTime:", forceSystemTime);
  v8 = forceSystemTime - lastSystemTime;
  if (lastSystemTime == 0.0)
    v8 = 0.0;
  -[SCNRenderer set_deltaTime:](self, "set_deltaTime:", v8);
}

- (void)_draw
{
  -[SCNRenderer _drawAtTime:](self, "_drawAtTime:", CACurrentMediaTime());
}

- (void)_drawAtTime:(double)a3
{
  char v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  GLenum Error;
  int v14;
  NSObject *v15;
  int8x16_t v16;
  __n128 v17;
  __C3DEngineContext *engineContext;
  __C3DScene *Scene;
  SCNRendererTransitionContext *transitionContext;
  SCNOffscreenRenderer *v21;
  double v22;
  double v23;
  id v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  id v30;
  void *v31;
  SKTransition *v32;
  uint64_t v33;
  uint64_t v34;
  double v35;
  uint64_t v36;
  uint64_t v37;
  SCNMTLRenderContext *renderContext;
  _BOOL8 v39;
  uint64_t RenderGraph;
  SKTransition *v41;
  float v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  double v46;
  uint64_t v47;
  SCNRendererTransitionContext *v48;
  void (**completionHandler)(void);
  int8x16_t v50;
  __int16 v51;
  __int16 v52;

  v4 = *((_BYTE *)self + 129);
  if ((v4 & 0x40) != 0)
  {
    -[SCNRenderer _updateSystemTimeAndDeltaTimeWithCurrentTime:](self, "_updateSystemTimeAndDeltaTimeWithCurrentTime:", a3);
    v4 = *((_BYTE *)self + 129);
  }
  if ((v4 & 4) != 0)
  {
    -[SCNRenderer _installViewport](self, "_installViewport", a3);
  }
  else if (self->_renderingAPI)
  {
    if ((EAGLContext *)objc_msgSend(MEMORY[0x1E0CD0958], "currentContext", a3) != self->_glContext)
    {
      v5 = scn_default_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        -[SCNRenderer _deleteGLFramebuffer].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
    Error = glGetError();
    if (Error)
    {
      v14 = Error;
      v15 = scn_default_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[SCNRenderer _drawAtTime:].cold.1(v14, v15);
    }
    C3DEngineContextGetRendererContextGL((uint64_t)self->_engineContext);
    *(double *)v16.i64 = C3DRendererContextGetViewport();
    v50 = v16;
    C3DEngineContextSetDrawableSize((uint64_t)self->_engineContext, *(double *)vextq_s8(v16, v16, 8uLL).i64);
    -[SCNRenderer adjustViewportForRendering:](self, "adjustViewportForRendering:", *(double *)v50.i64);
    C3DEngineContextSetViewport(v17, (__n128 *)self->_engineContext);
  }
  -[SCNRenderer lock](self, "lock", a3, *(_OWORD *)&v50);
  engineContext = self->_engineContext;
  if (engineContext)
    Scene = (__C3DScene *)C3DEngineContextGetScene((uint64_t)engineContext);
  else
    Scene = 0;
  transitionContext = self->_transitionContext;
  if (transitionContext)
  {
    v21 = transitionContext->_renderers[0];
    -[SCNRenderer _systemTime](self, "_systemTime");
    v23 = v22;
    v24 = -[SCNRenderer _prepareSKRenderer](self, "_prepareSKRenderer");
    -[SKTransition _duration](-[SCNRendererTransitionContext transition](self->_transitionContext, "transition"), "_duration");
    v26 = 1.0;
    if (v25 == 0.0)
      v27 = 1.0;
    else
      v27 = v25;
    -[SCNRendererTransitionContext transitionStartTime](self->_transitionContext, "transitionStartTime");
    v29 = (v23 - v28) / v27;
    if (v29 <= 1.0)
      v26 = v29;
    v52 = 0;
    v51 = 0;
    objc_msgSend(v24, "settingsForTransition:atTime:renderIncomingToTexture:renderOutgoingToTexture:renderIncomingToScreen:renderOutgoingToScreen:", -[SCNRendererTransitionContext transition](self->_transitionContext, "transition"), (char *)&v52 + 1, &v52, (char *)&v51 + 1, &v51, v26);
    if ((_BYTE)v52)
    {
      v30 = -[SCNRendererTransitionContext prepareRendererAtIndex:withScene:renderSize:pointOfView:parentRenderer:](self->_transitionContext, "prepareRendererAtIndex:withScene:renderSize:pointOfView:parentRenderer:", 0, -[SCNRendererTransitionContext outgoingScene](self->_transitionContext, "outgoingScene"), -[SCNRendererTransitionContext outgoingPointOfView](self->_transitionContext, "outgoingPointOfView"), self, self->_framebufferInfo.drawableSize.width, self->_framebufferInfo.drawableSize.height);
      -[SCNRenderer _viewport](self, "_viewport");
      objc_msgSend(v30, "set_viewport:");
      if (!v21 || (objc_msgSend((id)objc_msgSend(v30, "scene"), "isPaused") & 1) == 0)
        objc_msgSend(v30, "renderAtTime:", v23);
    }
    else
    {
      v30 = 0;
    }
    if (HIBYTE(v52))
    {
      if ((_BYTE)v52)
        v31 = v30;
      else
        v31 = 0;
      v30 = -[SCNRendererTransitionContext prepareRendererAtIndex:withScene:renderSize:pointOfView:parentRenderer:](self->_transitionContext, "prepareRendererAtIndex:withScene:renderSize:pointOfView:parentRenderer:", 1, self->_scene, self->_pointOfView, self, self->_framebufferInfo.drawableSize.width, self->_framebufferInfo.drawableSize.height);
      -[SCNRenderer _viewport](self, "_viewport");
      objc_msgSend(v30, "set_viewport:");
      if (!v21 || (objc_msgSend((id)objc_msgSend(v30, "scene"), "isPaused") & 1) == 0)
        objc_msgSend(v30, "renderAtTime:", v23);
    }
    else
    {
      v31 = 0;
    }
    if (HIBYTE(v51))
      -[SCNRenderer _drawScene:](self, "_drawScene:", Scene);
    if ((_BYTE)v51)
      objc_msgSend(-[SCNRendererTransitionContext prepareRendererAtIndex:withScene:renderSize:pointOfView:parentRenderer:](self->_transitionContext, "prepareRendererAtIndex:withScene:renderSize:pointOfView:parentRenderer:", 0, -[SCNRendererTransitionContext outgoingScene](self->_transitionContext, "outgoingScene"), -[SCNRendererTransitionContext outgoingPointOfView](self->_transitionContext, "outgoingPointOfView"), self, self->_framebufferInfo.drawableSize.width, self->_framebufferInfo.drawableSize.height), "_drawAtTime:", v23);
    if (self->_renderingAPI)
    {
      v32 = -[SCNRendererTransitionContext transition](self->_transitionContext, "transition");
      v33 = objc_msgSend(v30, "textureID");
      v34 = objc_msgSend(v31, "textureID");
      *(float *)&v35 = v26;
      objc_msgSend(v24, "renderTransition:withInputTexture:outputTexture:inputTextureSize:outputTextureSize:time:", v32, v33, v34, self->_framebufferInfo.drawableSize.width, self->_framebufferInfo.drawableSize.height, self->_framebufferInfo.drawableSize.width, self->_framebufferInfo.drawableSize.height, v35);
    }
    else
    {
      v36 = objc_msgSend(v30, "MTLTexture");
      v37 = objc_msgSend(v31, "MTLTexture");
      renderContext = self->_renderContext;
      v39 = (HIBYTE(v51) | v51) == 0;
      RenderGraph = C3DEngineContextGetRenderGraph((uint64_t)self->_engineContext);
      C3DRenderGraphSpriteKitTransitionBegin(RenderGraph, v39);
      v41 = -[SCNRendererTransitionContext transition](self->_transitionContext, "transition");
      v43 = -[SCNMTLRenderContext currentRenderCommandEncoder]((uint64_t)renderContext);
      v44 = -[SCNMTLRenderContext currentRenderPassDescriptor]((uint64_t)renderContext);
      v45 = -[SCNMTLRenderContext commandQueue]((uint64_t)renderContext);
      v42 = v26;
      *(float *)&v46 = v42;
      objc_msgSend(v24, "renderTransition:withInputTexture:outputTexture:time:encoder:pass:commandQueue:", v41, v36, v37, v43, v44, v45, v46);
      v47 = C3DEngineContextGetRenderGraph((uint64_t)self->_engineContext);
      C3DRenderGraphSpriteKitTransitionEnd(v47);
    }
    -[SCNRenderer set_nextFrameTime:](self, "set_nextFrameTime:", CACurrentMediaTime());
    if (v26 == 1.0)
    {
      if (-[SKTransition pausesIncomingScene](-[SCNRendererTransitionContext transition](self->_transitionContext, "transition"), "pausesIncomingScene"))
      {
        -[SCNScene setPaused:](self->_scene, "setPaused:", 0);
      }
      v48 = self->_transitionContext;
      completionHandler = (void (**)(void))v48->completionHandler;
      if (completionHandler)
      {
        completionHandler[2]();
        v48 = self->_transitionContext;
      }

      self->_transitionContext = 0;
    }
  }
  else
  {
    -[SCNRenderer _drawScene:](self, "_drawScene:", Scene);
  }
  if (!self->_pointOfView && Scene == -[SCNScene sceneRef](self->_scene, "sceneRef"))
    -[SCNRenderer _updatePointOfView](self, "_updatePointOfView");
  -[SCNRenderer unlock](self, "unlock");
}

- (void)_renderAtTime:(double)a3
{
  -[SCNRenderer _getFrameIndex](self, "_getFrameIndex");
  kdebug_trace();
  self->_forceSystemTime = a3;
  -[SCNRenderer _drawAtTime:](self, "_drawAtTime:", a3);
  self->_forceSystemTime = 0.0;
  kdebug_trace();
}

- (void)renderAtTime:(CFTimeInterval)time
{
  -[SCNRenderer _beginFrame](self, "_beginFrame");
  -[SCNRenderer _renderAtTime:](self, "_renderAtTime:", time);
  if (self->_renderingAPI)
    -[SCNRenderer _resolveAndDiscardGL](self, "_resolveAndDiscardGL");
  -[SCNRenderer _endFrame](self, "_endFrame");
}

- (void)renderWithViewport:(CGRect)viewport commandBuffer:(id)commandBuffer passDescriptor:(MTLRenderPassDescriptor *)renderPassDescriptor
{
  *((_BYTE *)self + 129) &= ~0x40u;
  -[SCNRenderer _renderAtTime:viewport:encoder:passDescriptor:commandQueue:commandBuffer:](self, "_renderAtTime:viewport:encoder:passDescriptor:commandQueue:commandBuffer:", 0, renderPassDescriptor, objc_msgSend(commandBuffer, "commandQueue"), commandBuffer, 0.0, viewport.origin.x, viewport.origin.y, viewport.size.width, viewport.size.height);
  *((_BYTE *)self + 129) |= 0x40u;
}

- (void)renderAtTime:(CFTimeInterval)time viewport:(CGRect)viewport commandBuffer:(id)commandBuffer passDescriptor:(MTLRenderPassDescriptor *)renderPassDescriptor
{
  -[SCNRenderer _renderAtTime:viewport:encoder:passDescriptor:commandQueue:commandBuffer:](self, "_renderAtTime:viewport:encoder:passDescriptor:commandQueue:commandBuffer:", 0, renderPassDescriptor, objc_msgSend(commandBuffer, "commandQueue"), commandBuffer, time, viewport.origin.x, viewport.origin.y, viewport.size.width, viewport.size.height);
}

- (void)_renderAtTime:(double)a3 viewport:(CGRect)a4 encoder:(id)a5 passDescriptor:(id)a6 commandQueue:(id)a7 commandBuffer:(id)a8
{
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  NSObject *v26;
  float64x2_t v27;
  float64x2_t v28;
  __n128 v29;
  void *v30;
  __C3DEngineContext *engineContext;
  unint64_t v32;
  double v33;
  double v34;
  NSObject *v35;
  __int128 v36;
  CGFloat v37;
  CGFloat x;
  CGFloat y;
  float64_t width;
  int8x16_t v41;
  float v42;

  v36 = *(_OWORD *)&a4.size.height;
  x = a4.origin.x;
  y = a4.origin.y;
  width = a4.size.width;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v14 = scn_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      -[SCNRenderer _renderAtTime:viewport:encoder:passDescriptor:commandQueue:commandBuffer:].cold.3(v14, v15, v16, v17, v18, v19, v20, v21);
  }
  v22 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a6, "colorAttachments", v36), "objectAtIndexedSubscript:", 0), "texture"), "sampleCount");
  if (v22 == 2)
    v23 = 1;
  else
    v23 = 2 * (v22 == 4);
  -[SCNRenderer set_antialiasingMode:](self, "set_antialiasingMode:", v23);
  -[SCNMTLRenderContext setClientRenderPassDescriptor:](self->_renderContext, (char *)a6);
  v24 = objc_msgSend((id)objc_msgSend(a6, "depthAttachment"), "texture");
  if (a5)
  {
    if (v24)
    {
      if (-[SCNMTLRenderContext reverseZ]((uint64_t)self->_renderContext))
      {
        objc_msgSend((id)objc_msgSend(a6, "depthAttachment"), "clearDepth");
        if (v25 == 1.0 && (_renderAtTime_viewport_encoder_passDescriptor_commandQueue_commandBuffer__done & 1) == 0)
        {
          _renderAtTime_viewport_encoder_passDescriptor_commandQueue_commandBuffer__done = 1;
          v26 = scn_default_log();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            -[SCNRenderer _renderAtTime:viewport:encoder:passDescriptor:commandQueue:commandBuffer:].cold.2();
        }
      }
    }
  }
  -[SCNMTLRenderContext setClientCommandQueue:](self->_renderContext, (char *)a7);
  -[SCNMTLRenderContext setClientRenderCommandEncoder:](self->_renderContext, (char *)a5);
  -[SCNMTLRenderContext setClientCommandBuffer:](self->_renderContext, (char *)a8);
  v27.f64[0] = width;
  self->_framebufferInfo.drawableSize.width = width;
  v28.f64[0] = x;
  v27.f64[1] = v37;
  self->_framebufferInfo.drawableSize.height = v37;
  v28.f64[1] = y;
  self->__viewport = (SCNVector4)vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v28), v27);
  -[SCNRenderer adjustViewportForRendering:](self, "adjustViewportForRendering:");
  v41 = (int8x16_t)v29;
  C3DEngineContextSetViewport(v29, (__n128 *)self->_engineContext);
  v30 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a6, "colorAttachments"), "objectAtIndexedSubscript:", 0), "resolveTexture");
  if (!v30)
    v30 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a6, "colorAttachments"), "objectAtIndexedSubscript:", 0), "texture");
  engineContext = self->_engineContext;
  if (a6)
  {
    v42 = (float)(unint64_t)objc_msgSend(v30, "width");
    v32 = objc_msgSend(v30, "height");
    *(float *)&v33 = v42;
    *((float *)&v33 + 1) = (float)v32;
    v34 = v33;
  }
  else
  {
    *(_QWORD *)&v34 = vextq_s8(v41, v41, 8uLL).u64[0];
  }
  C3DEngineContextSetDrawableSize((uint64_t)engineContext, v34);
  if (v30)
  {
    -[SCNMTLRenderContext beginFrame:]((uint64_t)self->_renderContext, v30);
    -[SCNRenderer _renderAtTime:](self, "_renderAtTime:", a3);
    -[SCNMTLRenderContext endFrameWaitingUntilCompleted:status:error:]((uint64_t)self->_renderContext, 0, 0, 0);
  }
  else
  {
    v35 = scn_default_log();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      -[SCNRenderer _renderAtTime:viewport:encoder:passDescriptor:commandQueue:commandBuffer:].cold.1();
  }
}

- (void)renderAtTime:(double)a3 viewport:(CGRect)a4 encoder:(id)a5 passDescriptor:(id)a6 commandQueue:(id)a7
{
  -[SCNRenderer _renderAtTime:viewport:encoder:passDescriptor:commandQueue:commandBuffer:](self, "_renderAtTime:viewport:encoder:passDescriptor:commandQueue:commandBuffer:", a5, a6, a7, 0, a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

- (void)renderWithCommandBuffer:(id)a3 viewPoints:(id)a4
{
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;

  self->_viewpoints = (NSArray *)a4;
  self->_viewpointCoordinateSpace = 0;
  if (a4)
  {
    v8 = 0u;
    v9 = 0u;
    v7 = 0u;
    v6 = (void *)objc_msgSend(a4, "objectAtIndexedSubscript:", 0);
    if (v6)
    {
      objc_msgSend(v6, "viewport");
    }
    else
    {
      v8 = 0u;
      v9 = 0u;
      v7 = 0u;
    }
    -[SCNRenderer renderWithViewport:commandBuffer:passDescriptor:](self, "renderWithViewport:commandBuffer:passDescriptor:", a3, objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_viewpoints, "objectAtIndexedSubscript:", 0, v7, v8, v9), "passDescriptor"), 0.0, 0.0, 0.0, 0.0);
    self->_viewpoints = 0;
  }
}

- (void)renderWithCommandBuffer:(id)a3 viewpoints:(id)a4 coordinateSpace:(unint64_t)a5
{
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;

  self->_viewpoints = (NSArray *)a4;
  self->_viewpointCoordinateSpace = a5;
  if (a4)
  {
    v9 = 0u;
    v10 = 0u;
    v8 = 0u;
    v7 = (void *)objc_msgSend(a4, "objectAtIndexedSubscript:", 0);
    if (v7)
    {
      objc_msgSend(v7, "viewport");
    }
    else
    {
      v9 = 0u;
      v10 = 0u;
      v8 = 0u;
    }
    -[SCNRenderer renderWithViewport:commandBuffer:passDescriptor:](self, "renderWithViewport:commandBuffer:passDescriptor:", a3, objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_viewpoints, "objectAtIndexedSubscript:", 0, v8, v9, v10), "passDescriptor"), 0.0, 0.0, 0.0, 0.0);
    self->_viewpoints = 0;
  }
}

- (void)renderAtTime:(double)a3 encoder:(id)a4 commandQueue:(id)a5 passDescriptor:(id)a6 viewPoints:(id)a7
{
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;

  self->_viewpoints = (NSArray *)a7;
  self->_viewpointCoordinateSpace = 0;
  if (a7)
  {
    v14 = 0u;
    v15 = 0u;
    v13 = 0u;
    v12 = (void *)objc_msgSend(a7, "objectAtIndexedSubscript:", 0);
    if (v12)
    {
      objc_msgSend(v12, "viewport");
    }
    else
    {
      v14 = 0u;
      v15 = 0u;
      v13 = 0u;
    }
    -[SCNRenderer _renderAtTime:viewport:encoder:passDescriptor:commandQueue:commandBuffer:](self, "_renderAtTime:viewport:encoder:passDescriptor:commandQueue:commandBuffer:", a4, a6, a5, 0, a3, 0.0, 0.0, 0.0, 0.0, v13, v14, v15);
    self->_viewpoints = 0;
  }
}

- (void)renderAtTime:(double)a3 encoder:(id)a4 commandQueue:(id)a5 passDescriptor:(id)a6 viewPoints:(id)a7 coordinateSpace:(unint64_t)a8
{
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;

  self->_viewpoints = (NSArray *)a7;
  self->_viewpointCoordinateSpace = a8;
  if (a7)
  {
    v15 = 0u;
    v16 = 0u;
    v14 = 0u;
    v13 = (void *)objc_msgSend(a7, "objectAtIndexedSubscript:", 0);
    if (v13)
    {
      objc_msgSend(v13, "viewport");
    }
    else
    {
      v15 = 0u;
      v16 = 0u;
      v14 = 0u;
    }
    -[SCNRenderer _renderAtTime:viewport:encoder:passDescriptor:commandQueue:commandBuffer:](self, "_renderAtTime:viewport:encoder:passDescriptor:commandQueue:commandBuffer:", a4, a6, a5, 0, a3, 0.0, 0.0, 0.0, 0.0, v14, v15, v16);
    self->_viewpoints = 0;
  }
}

- (void)render
{
  -[SCNRenderer renderAtTime:](self, "renderAtTime:", CACurrentMediaTime());
}

- (void)_installGLContextAndSetViewport
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (self->_renderingAPI)
  {
    -[SCNRenderer _installContext](self, "_installContext");
    if (self->_glContext)
    {
      if (self->_renderingAPI && (EAGLContext *)objc_msgSend(MEMORY[0x1E0CD0958], "currentContext") != self->_glContext)
      {
        v3 = scn_default_log();
        if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
          -[SCNRenderer _deleteGLFramebuffer].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
      }
      glViewport(0, 0, (int)self->_framebufferInfo.drawableSize.width, (int)self->_framebufferInfo.drawableSize.height);
    }
  }
}

- (CGImage)createSnapshot:(double)a3 error:(id *)a4
{
  uint64_t RendererContextGL;
  uint64_t v8;
  double width;
  double height;
  void *v11;
  CGColorSpace *DeviceRGB;
  size_t v13;
  CGContext *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  CGImage *Image;
  CGContext *v24;
  CGImage *v25;
  NSObject *v26;
  NSObject *v27;
  uint64_t v29;
  uint8_t buf[8];
  CGRect v31;

  -[SCNRenderer _beginFrame](self, "_beginFrame");
  -[SCNRenderer _installGLContextAndSetViewport](self, "_installGLContextAndSetViewport");
  -[SCNRenderer _renderAtTime:](self, "_renderAtTime:", a3);
  if (self->_renderingAPI)
  {
    -[SCNRenderer _resolveAndDiscardGL](self, "_resolveAndDiscardGL");
    -[SCNRenderer _endFrame](self, "_endFrame");
    RendererContextGL = C3DEngineContextGetRendererContextGL((uint64_t)self->_engineContext);
    if (RendererContextGL)
    {
      v8 = RendererContextGL;
      width = self->_framebufferInfo.drawableSize.width;
      height = self->_framebufferInfo.drawableSize.height;
      v11 = malloc_type_malloc(vcvtd_n_u64_f64(width * height, 2uLL), 0xA99C2FB7uLL);
      DeviceRGB = CGColorSpaceCreateDeviceRGB();
      v13 = vcvtd_n_u64_f64(width, 2uLL);
      v14 = CGBitmapContextCreate(v11, (unint64_t)width, (unint64_t)height, 8uLL, v13, DeviceRGB, 0x4001u);
      CGColorSpaceRelease(DeviceRGB);
      if (self->_renderingAPI)
      {
        if ((EAGLContext *)objc_msgSend(MEMORY[0x1E0CD0958], "currentContext") != self->_glContext)
        {
          v15 = scn_default_log();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
            -[SCNRenderer _deleteGLFramebuffer].cold.1(v15, v16, v17, v18, v19, v20, v21, v22);
        }
      }
      C3DRendererContextBindFramebuffer(v8, (uint64_t)self->_framebufferInfo.frameBuffer);
      glReadPixels(0, 0, (int)width, (int)height, 0x1908u, 0x1401u, v11);
      C3DRendererContextUnbindFramebuffer(v8);
      Image = CGBitmapContextCreateImage(v14);
      CGContextRelease(v14);
      free(v11);
      v24 = CGBitmapContextCreate(0, (unint64_t)width, (unint64_t)height, 8uLL, v13, DeviceRGB, 0x4001u);
      CGContextScaleCTM(v24, 1.0, -1.0);
      CGContextTranslateCTM(v24, 0.0, -height);
      v31.origin.x = 0.0;
      v31.origin.y = 0.0;
      v31.size.width = width;
      v31.size.height = height;
      CGContextDrawImage(v24, v31, Image);
      CGImageRelease(Image);
      v25 = CGBitmapContextCreateImage(v24);
      CGContextRelease(v24);
    }
    else
    {
      v26 = scn_default_log();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DCCB8000, v26, OS_LOG_TYPE_DEFAULT, "Warning: createSnapshot: no GL context", buf, 2u);
      }
      return 0;
    }
  }
  else
  {
    v29 = 0;
    *(_QWORD *)buf = 0;
    -[SCNMTLRenderContext endFrameWaitingUntilCompleted:status:error:]((uint64_t)self->_renderContext, 1, &v29, buf);
    if (v29 == 4)
    {
      return C3DCreateImageWithTexture(-[SCNRenderer MTLTexture](self, "MTLTexture"));
    }
    else
    {
      v27 = scn_default_log();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        -[SCNRenderer createSnapshot:error:].cold.1((id *)buf, v27);
      v25 = 0;
      if (a4)
        *a4 = *(id *)buf;
    }
  }
  return v25;
}

- (id)snapshotAtTime:(double)a3
{
  CGImage *v3;
  void *v4;

  v3 = -[SCNRenderer createSnapshot:error:](self, "createSnapshot:error:", 0, a3);
  v4 = (void *)objc_msgSend(MEMORY[0x1E0CEA638], "imageWithCGImage:", v3);
  CGImageRelease(v3);
  return v4;
}

- (CGImage)_createBackgroundColorImageWithSize:(CGSize)a3
{
  double height;
  double width;
  size_t v6;
  size_t v7;
  size_t v8;
  void *v9;
  CGColorSpace *v10;
  CGContext *v11;
  CGImage *Image;
  CGRect v14;

  height = a3.height;
  width = a3.width;
  v6 = (unint64_t)a3.width;
  v7 = (unint64_t)a3.height;
  v8 = 4 * (unint64_t)a3.width;
  v9 = malloc_type_malloc(v8 * (unint64_t)a3.height, 0x709C7A4uLL);
  v10 = (CGColorSpace *)C3DColorSpaceSRGB();
  v11 = CGBitmapContextCreate(v9, v6, v7, 8uLL, v8, v10, 0x4001u);
  CGContextSetFillColorWithColor(v11, (CGColorRef)objc_msgSend(-[SCNRenderer backgroundColor](self, "backgroundColor"), "CGColor"));
  v14.size.width = (double)(unint64_t)width;
  v14.size.height = (double)(unint64_t)height;
  v14.origin.x = 0.0;
  v14.origin.y = 0.0;
  CGContextFillRect(v11, v14);
  Image = CGBitmapContextCreateImage(v11);
  CGContextRelease(v11);
  free(v9);
  return Image;
}

- (UIImage)snapshotAtTime:(CFTimeInterval)time withSize:(CGSize)size antialiasingMode:(SCNAntialiasingMode)antialiasingMode
{
  double height;
  double width;
  CGImage *v8;
  UIImage *v9;

  height = size.height;
  width = size.width;
  v8 = -[SCNRenderer _createSnapshotAtTime:withSize:antialiasingMode:error:](self, "_createSnapshotAtTime:withSize:antialiasingMode:error:", antialiasingMode, 0, time);
  if (!v8)
    v8 = -[SCNRenderer _createBackgroundColorImageWithSize:](self, "_createBackgroundColorImageWithSize:", width, height);
  v9 = (UIImage *)objc_msgSend(MEMORY[0x1E0CEA638], "imageWithCGImage:", v8);
  CGImageRelease(v8);
  return v9;
}

- (id)snapshotAtTime:(double)a3 withSize:(CGSize)a4 antialiasingMode:(unint64_t)a5 error:(id *)a6
{
  id result;
  CGImage *v7;
  void *v8;

  result = -[SCNRenderer _createSnapshotAtTime:withSize:antialiasingMode:error:](self, "_createSnapshotAtTime:withSize:antialiasingMode:error:", a5, a6, a3, a4.width, a4.height);
  if (result)
  {
    v7 = (CGImage *)result;
    v8 = (void *)objc_msgSend(MEMORY[0x1E0CEA638], "imageWithCGImage:", result);
    CGImageRelease(v7);
    return v8;
  }
  return result;
}

- (CGImage)_createSnapshotAtTime:(double)a3 withSize:(CGSize)a4 antialiasingMode:(unint64_t)a5
{
  return -[SCNRenderer _createSnapshotAtTime:withSize:antialiasingMode:error:](self, "_createSnapshotAtTime:withSize:antialiasingMode:error:", a5, 0, a3, a4.width, a4.height);
}

- (CGImage)_createSnapshotAtTime:(double)a3 withSize:(CGSize)a4 antialiasingMode:(unint64_t)a5 error:(id *)a6
{
  float width;
  float v11;
  float height;
  float v13;
  id v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGImage *v19;

  width = a4.width;
  v11 = rintf(width);
  height = a4.height;
  v13 = rintf(height);
  if ((*((_BYTE *)self + 129) & 4) == 0)
    -[SCNRenderer _setBackingSize:](self, "_setBackingSize:", v11, v13);
  v14 = -[SCNRenderer snapshotRendererWithSize:](self, "snapshotRendererWithSize:", v11, v13);
  objc_msgSend(v14, "set_computedLightingEnvironmentMapsPath:", -[SCNRenderer _computedLightingEnvironmentMapsPath](self, "_computedLightingEnvironmentMapsPath"));
  objc_msgSend(v14, "set_antialiasingMode:", a5);
  LODWORD(v15) = 0;
  LODWORD(v16) = 0;
  *(float *)&v17 = v11;
  *(float *)&v18 = v13;
  objc_msgSend(v14, "set_viewport:", v15, v16, v17, v18);
  if (self->_renderingAPI)
    -[SCNRenderer lock](self, "lock");
  v19 = (CGImage *)objc_msgSend(v14, "createSnapshot:error:", a6, a3);
  if (self->_renderingAPI)
    -[SCNRenderer unlock](self, "unlock");
  if (!self->_pointOfView)
  {
    -[SCNRenderer setPointOfView:](self, "setPointOfView:", objc_msgSend(v14, "pointOfView"));
    self->_pointOfViewWasSet = 0;
  }
  if ((*((_BYTE *)self + 129) & 4) != 0)
  {

    self->_snapshotRenderer = 0;
  }
  return v19;
}

- (id)snapshotRendererWithSize:(CGSize)a3
{
  double height;
  double width;
  SCNRenderer *snapshotRenderer;
  unint64_t renderingAPI;
  void *v8;
  void *v9;
  SCNRenderer *v10;
  double v11;
  SCNRenderer *v12;
  __C3DEngineContext *v13;
  int InterfaceOrientation;
  _OWORD v16[8];

  height = a3.height;
  width = a3.width;
  snapshotRenderer = self->_snapshotRenderer;
  if (snapshotRenderer)
  {
    -[SCNRenderer _setBackingSize:](snapshotRenderer, "_setBackingSize:", a3.width, a3.height);
  }
  else
  {
    renderingAPI = self->_renderingAPI;
    v8 = (void *)objc_opt_class();
    if (renderingAPI)
      v9 = (void *)objc_msgSend(v8, "rendererWithContext:options:", -[SCNRenderer context](self, "context"), 0);
    else
      v9 = (void *)objc_msgSend(v8, "rendererWithDevice:options:", -[SCNRenderer device](self, "device"), 0);
    v10 = v9;
    self->_snapshotRenderer = v10;
    -[SCNRenderer _setupOffscreenRendererWithSize:](v10, "_setupOffscreenRendererWithSize:", width, height);
  }
  -[SCNRenderer lock](self, "lock");
  +[SCNTransaction begin](SCNTransaction, "begin");
  +[SCNTransaction setDisableActions:](SCNTransaction, "setDisableActions:", 1);
  +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", 1);
  -[SCNScene lock](-[SCNRenderer scene](self, "scene"), "lock");
  -[SCNRenderer _contentsScaleFactor](self, "_contentsScaleFactor");
  *(float *)&v11 = v11;
  self->_snapshotRenderer->_contentScaleFactor = *(float *)&v11;
  -[SCNRenderer setScene:](self->_snapshotRenderer, "setScene:", -[SCNRenderer scene](self, "scene"));
  -[SCNRenderer setOverlaySKScene:](self->_snapshotRenderer, "setOverlaySKScene:", -[SCNRenderer overlaySKScene](self, "overlaySKScene"));
  -[SCNRenderer setJitteringEnabled:](self->_snapshotRenderer, "setJitteringEnabled:", -[SCNRenderer isJitteringEnabled](self, "isJitteringEnabled"));
  -[SCNRenderer setJitteringEnabled:](self->_snapshotRenderer, "setJitteringEnabled:", -[SCNRenderer isJitteringEnabled](self, "isJitteringEnabled"));
  -[SCNRenderer setVertexAmplificationEnabled:](self->_snapshotRenderer, "setVertexAmplificationEnabled:", -[SCNRenderer vertexAmplificationEnabled](self, "vertexAmplificationEnabled"));
  -[SCNRenderer setPointOfView:](self->_snapshotRenderer, "setPointOfView:", -[SCNRenderer pointOfView](self, "pointOfView"));
  -[SCNRenderer setAutoenablesDefaultLighting:](self->_snapshotRenderer, "setAutoenablesDefaultLighting:", -[SCNRenderer autoenablesDefaultLighting](self, "autoenablesDefaultLighting"));
  -[SCNRenderer setAutoAdjustCamera:](self->_snapshotRenderer, "setAutoAdjustCamera:", -[SCNRenderer autoAdjustCamera](self, "autoAdjustCamera"));
  -[SCNRenderer setLoops:](self->_snapshotRenderer, "setLoops:", -[SCNRenderer loops](self, "loops"));
  -[SCNRenderer setPlaying:](self->_snapshotRenderer, "setPlaying:", -[SCNRenderer isPlaying](self, "isPlaying"));
  -[SCNRenderer sceneTime](self, "sceneTime");
  -[SCNRenderer setSceneTime:](self->_snapshotRenderer, "setSceneTime:");
  -[SCNRenderer setDelegate:](self->_snapshotRenderer, "setDelegate:", -[SCNRenderer delegate](self, "delegate"));
  -[SCNRenderer set_wantsSceneRendererDelegationMessages:](self->_snapshotRenderer, "set_wantsSceneRendererDelegationMessages:", -[SCNRenderer _wantsSceneRendererDelegationMessages](self, "_wantsSceneRendererDelegationMessages"));
  -[SCNRenderer setBackgroundColor:](self->_snapshotRenderer, "setBackgroundColor:", -[SCNRenderer backgroundColor](self, "backgroundColor"));
  -[SCNRenderer setTechnique:](self->_snapshotRenderer, "setTechnique:", -[SCNRenderer technique](self, "technique"));
  -[SCNRenderer setDebugOptions:](self->_snapshotRenderer, "setDebugOptions:", -[SCNRenderer debugOptions](self, "debugOptions"));
  -[SCNRenderer _superSamplingFactor](self, "_superSamplingFactor");
  -[SCNRenderer set_superSamplingFactor:](self->_snapshotRenderer, "set_superSamplingFactor:");
  -[SCNRenderer _screenTransform](self, "_screenTransform");
  v12 = self->_snapshotRenderer;
  v16[0] = v16[4];
  v16[1] = v16[5];
  v16[2] = v16[6];
  v16[3] = v16[7];
  -[SCNRenderer set_screenTransform:](v12, "set_screenTransform:", v16);
  -[SCNRenderer set_collectCompilationErrors:](self->_snapshotRenderer, "set_collectCompilationErrors:", -[SCNRenderer _collectCompilationErrors](self, "_collectCompilationErrors"));
  -[SCNRenderer set_resourceManagerMonitor:](self->_snapshotRenderer, "set_resourceManagerMonitor:", -[SCNRenderer _resourceManagerMonitor](self, "_resourceManagerMonitor"));
  -[SCNRenderer set_commandBufferStatusMonitor:](self->_snapshotRenderer, "set_commandBufferStatusMonitor:", -[SCNRenderer _commandBufferStatusMonitor](self, "_commandBufferStatusMonitor"));
  -[SCNRenderer __setTransitionContext:](self->_snapshotRenderer, "__setTransitionContext:", self->_transitionContext);
  C3DEngineContextSetClearsOnDraw((uint64_t)-[SCNRenderer _engineContext](self->_snapshotRenderer, "_engineContext"), 1);
  v13 = -[SCNRenderer _engineContext](self->_snapshotRenderer, "_engineContext");
  InterfaceOrientation = C3DEngineContextGetInterfaceOrientation((uint64_t)self->_engineContext);
  C3DEngineContextSetInterfaceOrientation((uint64_t)v13, InterfaceOrientation);
  -[SCNScene unlock](-[SCNRenderer scene](self, "scene"), "unlock");
  +[SCNTransaction commit](SCNTransaction, "commit");
  -[SCNRenderer unlock](self, "unlock");
  return self->_snapshotRenderer;
}

- (void)_updateProbes:(id)a3 withProgress:(id)a4
{
  objc_msgSend(a4, "becomeCurrentWithPendingUnitCount:", 1);
  -[SCNRenderer updateProbes:atTime:](self, "updateProbes:atTime:", a3, CACurrentMediaTime());
  objc_msgSend(a4, "resignCurrent");
}

- (void)updateProbes:(NSArray *)lightProbes atTime:(CFTimeInterval)time
{
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  MTLDevice *v15;
  void *v16;
  float v17;
  float v18;
  uint64_t v19;
  float v20;
  float v21;
  float v22;
  float v23;
  uint64_t BackgroundEffectSlot;
  float *ColorIfApplicable;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  double v31;
  double v32;
  double v33;
  uint64_t v34;
  void *v35;
  unint64_t v36;
  NSObject *v37;
  NSObject *v38;
  unint64_t v39;
  void *v40;
  SCNNode *v41;
  double v42;
  double v43;
  float32x4_t v44;
  float32x4_t v45;
  float32x4_t v46;
  float32x4_t v47;
  char WantsSSR;
  uint64_t i;
  void *v50;
  uint64_t v51;
  _OWORD *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  void *v56;
  void *v57;
  void *v58;
  float32x4_t *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t j;
  NSObject *v66;
  uint64_t v67;
  int *v68;
  NSArray *v69;
  SCNRenderer *v70;
  float32x4_t v71;
  float32x4_t v72;
  float32x4_t v73;
  __int128 v74;
  float32x4_t v75;
  float32x4_t v76;
  __int128 v77;
  uint64_t v78;
  void *v79;
  MTLCommandQueue *v80;
  uint64_t v81;
  void *v82;
  unsigned int v83;
  uint64_t v84;
  __C3DScene *v85;
  void *v86;
  void *v87;
  float32x4_t v88;
  float32x4_t v89;
  float32x4_t v90;
  float32x4_t v91;
  void *v92;
  SCNRenderer *v93;
  NSArray *obj;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  char v99;
  char v100[15];
  char v101;
  char v102[15];
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  _OWORD v107[4];
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  uint8_t buf[4];
  int v113;
  _BYTE v114[128];
  _OWORD v115[24];
  _BYTE v116[128];
  uint64_t v117;

  v117 = *MEMORY[0x1E0C80C00];
  if (!-[SCNRenderer scene](self, "scene"))
  {
    v7 = scn_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[SCNRenderer updateProbes:atTime:].cold.5(v7, v8, v9, v10, v11, v12, v13, v14);
  }
  v15 = -[SCNRenderer device](self, "device");
  v80 = -[SCNRenderer commandQueue](self, "commandQueue");
  v16 = (void *)objc_msgSend(MEMORY[0x1E0CC6BB0], "textureCubeDescriptorWithPixelFormat:size:mipmapped:", 115, 1024, 0);
  objc_msgSend(v16, "setResourceOptions:", 32);
  objc_msgSend(v16, "setUsage:", 5);
  v87 = (void *)-[MTLDevice newTextureWithDescriptor:](v15, "newTextureWithDescriptor:", v16);
  v93 = +[SCNRenderer rendererWithDevice:options:](SCNRenderer, "rendererWithDevice:options:", v15, 0);
  -[SCNRenderer setScene:](v93, "setScene:", -[SCNRenderer scene](self, "scene"));
  v19 = objc_msgSend(-[SCNRenderer backgroundColor](self, "backgroundColor"), "scn_C3DColorIgnoringColorSpace:success:", 0, 0);
  v18 = *((float *)&v19 + 1);
  v17 = *(float *)&v19;
  v21 = v20;
  v23 = v22;
  v85 = -[SCNScene sceneRef](-[SCNRenderer scene](self, "scene"), "sceneRef");
  BackgroundEffectSlot = C3DSceneGetBackgroundEffectSlot((uint64_t)v85, 0);
  if (BackgroundEffectSlot)
  {
    ColorIfApplicable = (float *)C3DEffectSlotGetColorIfApplicable(BackgroundEffectSlot);
    if (ColorIfApplicable)
    {
      v17 = *ColorIfApplicable;
      v18 = ColorIfApplicable[1];
      v21 = ColorIfApplicable[2];
      v23 = ColorIfApplicable[3];
    }
  }
  obj = -[SCNNode childNodesPassingTest:](-[SCNScene rootNode](-[SCNRenderer scene](self, "scene"), "rootNode"), "childNodesPassingTest:", &__block_literal_global_573);
  v70 = self;
  if (objc_msgSend(MEMORY[0x1E0CB38A8], "currentProgress"))
    v26 = (void *)objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", -[NSArray count](lightProbes, "count"));
  else
    v26 = 0;
  v105 = 0u;
  v106 = 0u;
  v103 = 0u;
  v104 = 0u;
  v27 = -[NSArray countByEnumeratingWithState:objects:count:](lightProbes, "countByEnumeratingWithState:objects:count:", &v103, v116, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v104;
    v30 = v17;
    v31 = v18;
    v32 = v21;
    v33 = v23;
    v76 = *(float32x4_t *)(MEMORY[0x1E0C83FF0] + 16);
    v77 = *MEMORY[0x1E0C83FF0];
    v73 = vnegq_f32(*MEMORY[0x1E0C83FF0]);
    v74 = *(_OWORD *)(MEMORY[0x1E0C83FF0] + 48);
    v75 = *(float32x4_t *)(MEMORY[0x1E0C83FF0] + 32);
    v71 = vnegq_f32(v76);
    v72 = vnegq_f32(v75);
    v68 = &v113;
    v69 = lightProbes;
    v78 = *(_QWORD *)v104;
    v79 = v26;
    do
    {
      v34 = 0;
      v81 = v28;
      do
      {
        if (*(_QWORD *)v104 != v29)
          objc_enumerationMutation(lightProbes);
        v35 = *(void **)(*((_QWORD *)&v103 + 1) + 8 * v34);
        if (objc_msgSend(v35, "light", v68)
          && SCNLightTypeToC3DLightType((void *)objc_msgSend((id)objc_msgSend(v35, "light"), "type")) == 4)
        {
          v36 = objc_msgSend((id)objc_msgSend(v35, "light"), "probeType");
          if (v36 < 2)
          {
            v39 = v36;
            if ((objc_msgSend(v26, "isCancelled") & 1) != 0)
              goto LABEL_44;
            v84 = v34;
            v82 = (void *)-[MTLCommandQueue commandBuffer](v80, "commandBuffer");
            objc_msgSend(v26, "becomeCurrentWithPendingUnitCount:", 1);
            v40 = (void *)objc_msgSend(MEMORY[0x1E0CC6B50], "renderPassDescriptor");
            objc_msgSend((id)objc_msgSend((id)objc_msgSend(v40, "colorAttachments"), "objectAtIndexedSubscript:", 0), "setClearColor:", v30, v31, v32, v33);
            objc_msgSend((id)objc_msgSend((id)objc_msgSend(v40, "colorAttachments"), "objectAtIndexedSubscript:", 0), "setLoadAction:", 2);
            v41 = +[SCNNode node](SCNNode, "node");
            -[SCNNode setCamera:](v41, "setCamera:", +[SCNCamera camera](SCNCamera, "camera"));
            -[SCNCamera setFieldOfView:](-[SCNNode camera](v41, "camera"), "setFieldOfView:", 90.0);
            objc_msgSend((id)objc_msgSend(v35, "light"), "zNear");
            -[SCNCamera setZNear:](-[SCNNode camera](v41, "camera"), "setZNear:", v42);
            objc_msgSend((id)objc_msgSend(v35, "light"), "zFar");
            -[SCNCamera setZFar:](-[SCNNode camera](v41, "camera"), "setZFar:", v43);
            -[SCNNode setLight:](v41, "setLight:", +[SCNLight light](SCNLight, "light"));
            -[SCNLight setType:](-[SCNNode light](v41, "light"), "setType:", CFSTR("probe"));
            -[SCNRenderer setPointOfView:](v93, "setPointOfView:", v41);
            objc_msgSend(v35, "simdWorldTransform");
            v90 = v45;
            v91 = v44;
            v88 = v47;
            v89 = v46;
            v83 = objc_msgSend(v35, "isHidden");
            v86 = v35;
            objc_msgSend(v35, "setHidden:", 1);
            v115[0] = v75;
            v115[1] = v76;
            v115[2] = v73;
            v115[3] = v74;
            v115[4] = v72;
            v115[5] = v76;
            v115[6] = v77;
            v115[7] = v74;
            v115[8] = v77;
            v115[9] = v75;
            v115[10] = v71;
            v115[11] = v74;
            v115[12] = v77;
            v115[13] = v72;
            v115[14] = v76;
            v115[15] = v74;
            v115[16] = v77;
            v115[17] = v76;
            v115[18] = v75;
            v115[19] = v74;
            v115[20] = v73;
            v115[21] = v76;
            v115[22] = v72;
            v115[23] = v74;
            WantsSSR = C3DSceneGetWantsSSR((uint64_t)v85);
            C3DSceneSetWantsSSR((uint64_t)v85, 0);
            for (i = 0; i != 6; ++i)
            {
              v50 = (void *)objc_msgSend(v87, "newTextureViewWithPixelFormat:textureType:levels:slices:", objc_msgSend(v87, "pixelFormat"), 2, 0, objc_msgSend(v87, "mipmapLevelCount"), i, 1);
              objc_msgSend((id)objc_msgSend((id)objc_msgSend(v40, "colorAttachments"), "objectAtIndexedSubscript:", 0), "setTexture:", v50);
              v51 = 0;
              v52 = &v115[4 * i];
              v53 = v52[1];
              v54 = v52[2];
              v55 = v52[3];
              v107[0] = *v52;
              v107[1] = v53;
              v107[2] = v54;
              v107[3] = v55;
              v108 = 0u;
              v109 = 0u;
              v110 = 0u;
              v111 = 0u;
              do
              {
                *(__int128 *)((char *)&v108 + v51 * 16) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v91, COERCE_FLOAT(v107[v51])), v90, *(float32x2_t *)&v107[v51], 1), v89, (float32x4_t)v107[v51], 2), v88, (float32x4_t)v107[v51], 3);
                ++v51;
              }
              while (v51 != 4);
              -[SCNNode setSimdTransform:](v41, "setSimdTransform:", *(double *)&v108, *(double *)&v109, *(double *)&v110, *(double *)&v111);
              +[SCNTransaction flush](SCNTransaction, "flush");
              -[SCNRenderer renderAtTime:viewport:commandBuffer:passDescriptor:](v93, "renderAtTime:viewport:commandBuffer:passDescriptor:", 0, v40, time, 0.0, 0.0, (double)(unint64_t)objc_msgSend(v50, "width"), (double)(unint64_t)objc_msgSend(v50, "height"));

            }
            objc_msgSend(v86, "setHidden:", v83);
            C3DSceneSetWantsSSR((uint64_t)v85, WantsSSR);
            v56 = (void *)-[SCNMTLRenderContext resourceManager]((uint64_t)-[SCNRenderer _renderContextMetal](v93, "_renderContextMetal"));
            if (v39)
            {
              v57 = (void *)objc_msgSend(v56, "newRadianceTextureForEnvironmentTexture:engineContext:cpuAccessible:commandBuffer:", v87, v70->_engineContext, 1, v82);
              objc_msgSend(v82, "commit");
              objc_msgSend(v82, "waitUntilCompleted");
              objc_msgSend((id)objc_msgSend((id)objc_msgSend(v86, "light"), "probeEnvironment"), "setContents:", v57);

            }
            else
            {
              v58 = (void *)objc_msgSend(v56, "sphericalHarmonicsForEnvironmentTexture:order:commandBuffer:", v87, 3, v82);
              objc_msgSend(v82, "commit");
              objc_msgSend(v82, "waitUntilCompleted");
              v59 = (float32x4_t *)objc_msgSend(v86, "nodeRef");
              v60 = objc_msgSend((id)objc_msgSend(v86, "light"), "lightRef");
              v92 = v58;
              v61 = objc_msgSend(v58, "contents");
              v95 = 0u;
              v96 = 0u;
              v97 = 0u;
              v98 = 0u;
              v62 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v95, v114, 16);
              if (v62)
              {
                v63 = v62;
                v64 = *(_QWORD *)v96;
                do
                {
                  for (j = 0; j != v63; ++j)
                  {
                    if (*(_QWORD *)v96 != v64)
                      objc_enumerationMutation(obj);
                    C3DLightAddLightSHContribution(v60, v59, objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v95 + 1) + 8 * j), "light"), "lightRef"), (float32x4_t *)objc_msgSend(*(id *)(*((_QWORD *)&v95 + 1) + 8 * j), "nodeRef"), 3u, v61);
                  }
                  v63 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v95, v114, 16);
                }
                while (v63);
              }
              if (objc_msgSend(v92, "length") != 108)
              {
                v66 = scn_default_log();
                if (os_log_type_enabled(v66, OS_LOG_TYPE_FAULT))
                  -[SCNRenderer updateProbes:atTime:].cold.4(buf, v68, v66);
              }
              objc_msgSend((id)objc_msgSend(v86, "light"), "set_sphericalHarmonics:", objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", objc_msgSend(v92, "contents"), objc_msgSend(v92, "length")));
              lightProbes = v69;
            }
            v29 = v78;
            v26 = v79;
            v28 = v81;
            v34 = v84;
            objc_msgSend(v79, "resignCurrent");
          }
          else
          {
            v37 = scn_default_log();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
              -[SCNRenderer updateProbes:atTime:].cold.2(&v99, v100);
          }
        }
        else
        {
          v38 = scn_default_log();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
            -[SCNRenderer updateProbes:atTime:].cold.1(&v101, v102);
        }
        ++v34;
      }
      while (v34 != v28);
      v67 = -[NSArray countByEnumeratingWithState:objects:count:](lightProbes, "countByEnumeratingWithState:objects:count:", &v103, v116, 16);
      v28 = v67;
    }
    while (v67);
  }
LABEL_44:

}

uint64_t __35__SCNRenderer_updateProbes_atTime___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "light");
  if (result)
  {
    if ((C3DNodeIsHiddenOrIsHiddenByAncestor(objc_msgSend(a2, "nodeRef")) & 1) != 0)
    {
      return 0;
    }
    else
    {
      result = objc_msgSend((id)objc_msgSend(a2, "light"), "isBaked");
      if ((_DWORD)result)
      {
        if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "light"), "type"), "isEqualToString:", CFSTR("directional")) & 1) != 0|| (objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "light"), "type"), "isEqualToString:", CFSTR("omni")) & 1) != 0)
        {
          return 1;
        }
        else
        {
          return objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "light"), "type"), "isEqualToString:", CFSTR("spot"));
        }
      }
    }
  }
  return result;
}

- (void)_jitterAtStep:(unint64_t)a3 updateMainFramebuffer:(BOOL)a4 redisplay:(BOOL)a5 jitterer:(id)a6
{
  unint64_t v11;
  NSObject *renderingQueue;
  _QWORD v13[7];
  BOOL v14;
  BOOL v15;
  BOOL v16;

  v11 = -[SCNRenderer renderingAPI](self, "renderingAPI");
  renderingQueue = self->__renderingQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __70__SCNRenderer__jitterAtStep_updateMainFramebuffer_redisplay_jitterer___block_invoke;
  v13[3] = &unk_1EA5A2640;
  v13[4] = self;
  v13[5] = a6;
  v13[6] = a3;
  v14 = a4;
  v15 = v11 != 0;
  v16 = a5;
  dispatch_sync(renderingQueue, v13);
}

uint64_t __70__SCNRenderer__jitterAtStep_updateMainFramebuffer_redisplay_jitterer___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  id v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_engineContext");
  result = objc_msgSend(*(id *)(a1 + 40), "isAborting");
  if ((result & 1) == 0)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "_installContext");
    if ((_DWORD)result)
    {
      objc_msgSend(*(id *)(a1 + 32), "lock");
      +[SCNTransaction lock](SCNTransaction, "lock");
      C3DEngineContextSetJitteringEnabled(v2, 1);
      C3DEngineContextSetJitteringStep(v2, *(_DWORD *)(a1 + 48));
      C3DEngineContextSetUpdateMainFramebuffer(v2, *(unsigned __int8 *)(a1 + 56));
      v4 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
      if (*(_BYTE *)(a1 + 57))
        glPushGroupMarkerEXT(0, "SceneKit - Jitter");
      objc_msgSend(*(id *)(a1 + 32), "_beginFrame");
      objc_msgSend(*(id *)(a1 + 32), "_drawAtTime:", CACurrentMediaTime());
      C3DEngineContextSetUpdateMainFramebuffer(v2, 1);
      C3DEngineContextSetJitteringEnabled(v2, 0);
      objc_msgSend(*(id *)(a1 + 32), "_endFrame");
      if (*(_BYTE *)(a1 + 58))
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 344), "_jitterRedisplay");
      if (*(_BYTE *)(a1 + 57))
        glPopGroupMarkerEXT();
      objc_msgSend(v4, "drain");
      +[SCNTransaction unlock](SCNTransaction, "unlock");
      return objc_msgSend(*(id *)(a1 + 32), "unlock");
    }
  }
  return result;
}

- (id)privateRendererOwner
{
  return self->_privateRendererOwner;
}

- (void)_addGPUFrameScheduledHandler:(id)a3
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (self->_renderingAPI)
  {
    v4 = scn_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[SCNRenderer _addGPUFrameScheduledHandler:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
    (*((void (**)(id))a3 + 2))(a3);
  }
  else
  {
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", 0, MEMORY[0x1E0C809B0], 3221225472, __44__SCNRenderer__addGPUFrameScheduledHandler___block_invoke, &unk_1EA5A2668, self, a3);
  }
}

void __44__SCNRenderer__addGPUFrameScheduledHandler___block_invoke(uint64_t a1)
{
  -[SCNMTLRenderContext addCommandBufferScheduledHandler:](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 280), *(void **)(a1 + 40));
}

- (void)_addGPUFrameCompletedHandler:(id)a3
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (self->_renderingAPI)
  {
    v4 = scn_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[SCNRenderer _addGPUFrameCompletedHandler:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
    (*((void (**)(id))a3 + 2))(a3);
  }
  else
  {
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", 0, MEMORY[0x1E0C809B0], 3221225472, __44__SCNRenderer__addGPUFrameCompletedHandler___block_invoke, &unk_1EA5A2668, self, a3);
  }
}

void __44__SCNRenderer__addGPUFrameCompletedHandler___block_invoke(uint64_t a1)
{
  -[SCNMTLRenderContext addCommandBufferCompletedHandler:](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 280), *(void **)(a1 + 40));
}

- (void)_addGPUFramePresentedHandler:(id)a3
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[6];

  if (self->_renderingAPI)
  {
    v4 = scn_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[SCNRenderer _addGPUFramePresentedHandler:].cold.2(v4, v5, v6, v7, v8, v9, v10, v11);
    (*((void (**)(id))a3 + 2))(a3);
  }
  else if ((*((_BYTE *)self + 129) & 4) != 0)
  {
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __44__SCNRenderer__addGPUFramePresentedHandler___block_invoke;
    v21[3] = &unk_1EA5A2668;
    v21[4] = self;
    v21[5] = a3;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", 0, self, v21);
  }
  else
  {
    v13 = scn_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[SCNRenderer _addGPUFramePresentedHandler:].cold.1(v13, v14, v15, v16, v17, v18, v19, v20);
    -[SCNRenderer _addGPUFrameCompletedHandler:](self, "_addGPUFrameCompletedHandler:", a3);
  }
}

void __44__SCNRenderer__addGPUFramePresentedHandler___block_invoke(uint64_t a1)
{
  -[SCNMTLRenderContext addDrawablePresentedHandler:](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 280), *(void **)(a1 + 40));
}

- (void)_discardPendingGPUFrameScheduledHandlers
{
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, a1, a3, "Error: %s should only be called when using Metal", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __55__SCNRenderer__discardPendingGPUFrameScheduledHandlers__block_invoke(uint64_t a1)
{
  -[SCNMTLRenderContext discardPendingCommandBufferScheduledHandlers](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 280));
}

- (void)_discardPendingGPUFrameCompletedHandlers
{
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, a1, a3, "Error: %s should only be called when using Metal", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __55__SCNRenderer__discardPendingGPUFrameCompletedHandlers__block_invoke(uint64_t a1)
{
  -[SCNMTLRenderContext discardPendingCommandBufferCompletedHandlers](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 280));
}

- (void)_discardPendingGPUFramePresentedHandlers
{
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, a1, a3, "Error: %s should only be called when using Metal", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __55__SCNRenderer__discardPendingGPUFramePresentedHandlers__block_invoke(uint64_t a1)
{
  -[SCNMTLRenderContext discardPendingDrawablePresentedHandlers](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 280));
}

- (void)_allowGPUBackgroundExecution
{
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, a1, a3, "Error: %s should only be called when using Metal", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

uint64_t *__43__SCNRenderer__allowGPUBackgroundExecution__block_invoke(uint64_t a1)
{
  return -[SCNMTLRenderContext _allowGPUBackgroundExecution](*(uint64_t **)(*(_QWORD *)(a1 + 32) + 280));
}

- (void)_interfaceOrientationDidChange
{
  uint64_t v3;

  if ((*((_BYTE *)self + 129) & 8) != 0)
    v3 = objc_msgSend((id)objc_msgSend((id)-[SCNSceneRenderer window](self->_privateRendererOwner, "window"), "windowScene"), "interfaceOrientation");
  else
    v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication"), "statusBarOrientation");
  -[SCNRenderer _setInterfaceOrientation:](self, "_setInterfaceOrientation:", v3);
}

- (void)_setInterfaceOrientation:(int64_t)a3
{
  int v3;

  v3 = a3;
  -[SCNRenderer lock](self, "lock");
  C3DEngineContextSetInterfaceOrientation((uint64_t)self->_engineContext, v3);
  -[SCNRenderer unlock](self, "unlock");
}

- (BOOL)renderMovieToURL:(id)a3 size:(CGSize)a4 antialiasingMode:(unint64_t)a5 attributes:(id)a6 error:(id *)a7
{
  SCNMovieExportOperation *v9;
  uint64_t v10;
  uint64_t v11;

  v9 = -[SCNMovieExportOperation initWithRenderer:size:attributes:outputURL:]([SCNMovieExportOperation alloc], "initWithRenderer:size:attributes:outputURL:", self, a6, a3, a4.width, a4.height);
  -[_SCNExportOperation setAntialiasingMode:](v9, "setAntialiasingMode:", a5);
  -[SCNMovieExportOperation main](v9, "main");
  v10 = -[_SCNExportOperation error](v9, "error");
  v11 = v10;
  if (a7 && v10)
    *a7 = -[_SCNExportOperation error](v9, "error");
  return v11 == 0;
}

- (void)_initWithOptions:(uint64_t)a3 isPrivateRenderer:(uint64_t)a4 privateRendererOwner:(uint64_t)a5 clearsOnDraw:(uint64_t)a6 context:(uint64_t)a7 renderingAPI:(uint64_t)a8 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. device context doesn't conform to MTLDevice protocol", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_initWithOptions:(uint64_t)a3 isPrivateRenderer:(uint64_t)a4 privateRendererOwner:(uint64_t)a5 clearsOnDraw:(uint64_t)a6 context:(uint64_t)a7 renderingAPI:(uint64_t)a8 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Private renderer only supports SCNView", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_initWithOptions:isPrivateRenderer:privateRendererOwner:clearsOnDraw:context:renderingAPI:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: SCNRenderer::init - no engine context", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __37__SCNRenderer__prepareGLRenderTarget__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, a2, a3, "Error: Failed to bind EAGLDrawable: %@ to GL_RENDERBUFFER", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)autoenablesDefaultLighting
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: autoenablesDefaultLighting: renderer has no context", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)setAutoenablesDefaultLighting:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: setAutoenablesDefaultLighting: renderer has no context", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)setPointOfView:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. can't set a presentation instance as a point of view", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __28__SCNRenderer_setTechnique___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: SCNRenderer::setTechnique - no engine available yet - ignoring", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_preparePreloadRenderer:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: prepareObject:shouldAbortBlock renderer has no GL context", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_drawAtTime:(int)a1 .cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1DCCB8000, a2, OS_LOG_TYPE_ERROR, "Error: glError before rendering SceneKit contents: %x", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_5();
}

- (void)_renderAtTime:viewport:encoder:passDescriptor:commandQueue:commandBuffer:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: Render pass descriptor misconfigured - missing drawable texture", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_renderAtTime:viewport:encoder:passDescriptor:commandQueue:commandBuffer:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: Starting iOS 13.0 and macOS 10.15, SceneKit uses reverseZ depth buffer to achieve better precision. You must clear your depth to 0.0 or everything will be discarded. To opt out of this new behavior you can set the SCNDisableReverseZ key to a BOOLean value of YES in your app's Info.plist file.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_renderAtTime:(uint64_t)a3 viewport:(uint64_t)a4 encoder:(uint64_t)a5 passDescriptor:(uint64_t)a6 commandQueue:(uint64_t)a7 commandBuffer:(uint64_t)a8 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. can't call renderAtTime:withEncoder:pass:commandQueue: with a GL context", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)createSnapshot:(id *)a1 error:(NSObject *)a2 .cold.1(id *a1, NSObject *a2)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(*a1, "description");
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1DCCB8000, a2, OS_LOG_TYPE_ERROR, "Error: Failed to create snapshot with error %@", (uint8_t *)&v4, 0xCu);
}

- (void)updateProbes:(_BYTE *)a1 atTime:(_BYTE *)a2 .cold.1(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_3(a1, a2);
  OUTLINED_FUNCTION_0_3(&dword_1DCCB8000, v2, (uint64_t)v2, "Error: Can only update lightProbe", v3);
}

- (void)updateProbes:(_BYTE *)a1 atTime:(_BYTE *)a2 .cold.2(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_3(a1, a2);
  OUTLINED_FUNCTION_0_3(&dword_1DCCB8000, v2, (uint64_t)v2, "Error: Can only update 'baked' lightProbes", v3);
}

- (void)updateProbes:(_BYTE *)a1 atTime:(_BYTE *)a2 .cold.3(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_3(a1, a2);
  OUTLINED_FUNCTION_0_3(&dword_1DCCB8000, v2, (uint64_t)v2, "Unreachable code: Unsupported probe type", v3);
}

- (void)updateProbes:(os_log_t)log atTime:.cold.4(uint8_t *buf, _QWORD *a2, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *a2 = "shBuffer.length == ((shOrder * shOrder) * 3 * sizeof(float))";
  _os_log_fault_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. MTLBuffer containing the SH coefficients has not the expected size", buf, 0xCu);
}

- (void)updateProbes:(uint64_t)a3 atTime:(uint64_t)a4 .cold.5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_addGPUFrameScheduledHandler:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, a1, a3, "Error: %s should only be called when using Metal", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_addGPUFrameCompletedHandler:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, a1, a3, "Error: %s should only be called when using Metal", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_addGPUFramePresentedHandler:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, a1, a3, "Error: %s should only be called on a private renderer, using -[SCNRenderer _addGPUFrameCompletedHandler:] instead", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_addGPUFramePresentedHandler:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, a1, a3, "Error: %s should only be called when using Metal", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
