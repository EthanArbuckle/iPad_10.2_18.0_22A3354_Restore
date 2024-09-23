@implementation SCNView

- (void)__CFObject
{
  return 0;
}

uint64_t __20__SCNView_setScene___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setNeedsDisplay");
}

uint64_t __27__SCNView__setNeedsDisplay__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_createDisplayLinkIfNeeded");
}

uint64_t __30__SCNView_setBackgroundColor___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 480), "setBackgroundColor:", *(_QWORD *)(a1 + 40));
}

- (void)setScene:(SCNScene *)scene
{
  SCNScene *v5;
  SCNRenderer *renderer;
  _QWORD v7[5];

  if (self->_scene != scene)
  {
    -[SCNView lock](self, "lock");
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:name:object:", self, CFSTR("kC3DSceneDidUpdateNotification"), 0);
    -[SCNScene removeObserver:forKeyPath:](self->_scene, "removeObserver:forKeyPath:", self, CFSTR("background.contents"));
    -[SCNEventHandler sceneWillChange](self->_navigationCameraController, "sceneWillChange");

    v5 = scene;
    self->_scene = v5;
    if (v5)
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "addObserver:selector:name:object:", self, sel__sceneDidUpdate_, CFSTR("kC3DSceneDidUpdateNotification"), -[SCNScene sceneRef](self->_scene, "sceneRef"));
      -[SCNScene addObserver:forKeyPath:options:context:](self->_scene, "addObserver:forKeyPath:options:context:", self, CFSTR("background.contents"), 0, CFSTR("kSCNViewObservingContext"));
    }
    renderer = self->_renderer;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __20__SCNView_setScene___block_invoke;
    v7[3] = &unk_1EA59E288;
    v7[4] = self;
    -[SCNRenderer setScene:completionHandler:](renderer, "setScene:completionHandler:", scene, v7);
    -[SCNEventHandler sceneDidChange](self->_navigationCameraController, "sceneDidChange");
    -[SCNView unlock](self, "unlock");
    -[SCNView _updateOpacity](self, "_updateOpacity");
  }
}

- (void)setPointOfView:(id)a3
{
  if (-[SCNView pointOfView](self, "pointOfView") != a3)
  {
    -[SCNEventHandler cameraWillChange](self->_navigationCameraController, "cameraWillChange");
    -[SCNRenderer setPointOfView:](self->_renderer, "setPointOfView:", a3);
    -[SCNEventHandler cameraDidChange](self->_navigationCameraController, "cameraDidChange");
  }
}

- (SCNNode)pointOfView
{
  return -[SCNRenderer pointOfView](self->_renderer, "pointOfView");
}

- (SCNScene)scene
{
  return self->_scene;
}

- (id)renderer
{
  return self->_renderer;
}

- (SCNView)initWithFrame:(CGRect)a3
{
  return -[SCNView initWithFrame:options:](self, "initWithFrame:options:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)setJitteringEnabled:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[SCNJitterer setEnabled:](self->_jitterer, "setEnabled:");
  -[SCNRenderer setJitteringEnabled:](self->_renderer, "setJitteringEnabled:", v3);
  -[SCNView _setNeedsDisplay](self, "_setNeedsDisplay");
}

- (void)scn_updateGestureRecognizers
{
  void *v3;
  SCNEventHandler *navigationCameraController;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  navigationCameraController = self->_navigationCameraController;
  if (navigationCameraController)
    objc_msgSend(v3, "addObjectsFromArray:", -[SCNEventHandler gestureRecognizers](navigationCameraController, "gestureRecognizers"));
  -[SCNView scn_setGestureRecognizers:](self, "scn_setGestureRecognizers:", v3);
}

- (void)setNavigationCameraController:(id)a3
{
  SCNEventHandler *navigationCameraController;

  navigationCameraController = self->_navigationCameraController;
  if (navigationCameraController != a3)
  {
    -[SCNEventHandler setDelegate:](navigationCameraController, "setDelegate:", 0);

    self->_navigationCameraController = (SCNEventHandler *)a3;
    objc_msgSend(-[SCNView navigationCameraController](self, "navigationCameraController"), "setDelegate:", self);
    -[SCNView scn_updateGestureRecognizers](self, "scn_updateGestureRecognizers");
  }
}

- (id)navigationCameraController
{
  return self->_navigationCameraController;
}

- (void)_commonInit:(id)a3
{
  unint64_t renderingAPI;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  EAGLContext *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const __CFString **v14;
  int v15;
  void *v16;
  const __CFString *v17;
  char v18;
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  SCNGetPerformanceStatisticsEnabled();
  *((_BYTE *)self + 464) |= 1u;
  *((_BYTE *)self + 464) |= 0x10u;
  self->_currentSystemTime = CACurrentMediaTime();
  self->_lock = objc_alloc_init(SCNRecursiveLock);
  renderingAPI = self->_renderingAPI;
  v6 = (void *)-[SCNView layer](self, "layer");
  v7 = v6;
  if (renderingAPI)
  {
    objc_msgSend(v6, "setOpaque:", 1);
    v8 = *MEMORY[0x1E0CD0D40];
    v19[0] = *MEMORY[0x1E0CD0D48];
    v19[1] = v8;
    v9 = *MEMORY[0x1E0CD0D18];
    v20[0] = MEMORY[0x1E0C9AAA0];
    v20[1] = v9;
    objc_msgSend(v7, "setDrawableProperties:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2));
    -[SCNView scn_setBackingLayer:](self, "scn_setBackingLayer:", v7);
    v10 = -[SCNView eaglContext](self, "eaglContext");
    if (!v10)
    {
      if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication"), "applicationState") == 2)
      {
        v10 = 0;
      }
      else
      {
        if (LODWORD(self->_renderingAPI) == 2)
          v11 = 3;
        else
          v11 = 2;
        v10 = (EAGLContext *)(id)SCNCreateGLESContext(v11);
      }
    }
  }
  else
  {
    _setupMetalBackingLayer(v6, (*((unsigned __int8 *)self + 465) >> 1) & 1);
    -[SCNView scn_setBackingLayer:](self, "scn_setBackingLayer:", v7);
    v10 = (EAGLContext *)objc_msgSend(v7, "device");
    self->_device = (MTLDevice *)v10;
  }
  if (objc_msgSend((id)objc_opt_class(), "shouldObserveApplicationStateToPreventBackgroundGPUAccess"))
  {
    if (_UIApplicationIsExtension())
    {
      v12 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      objc_msgSend(v12, "addObserver:selector:name:object:", self, sel__enterForeground_, *MEMORY[0x1E0CB29E8], 0);
      v13 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v14 = (const __CFString **)MEMORY[0x1E0CB2A00];
    }
    else
    {
      v15 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEAC18], "_applicationKeyWindow"), "_isHostedInAnotherProcess");
      v16 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      if (v15)
      {
        objc_msgSend(v16, "addObserver:selector:name:object:", self, sel__enterForeground_, CFSTR("_UIViewServiceHostDidBecomeActiveNotification"), 0);
        v13 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v17 = CFSTR("_UIViewServiceHostWillResignActiveNotification");
LABEL_17:
        objc_msgSend(v13, "addObserver:selector:name:object:", self, sel__enterBackground_, v17, 0);
        goto LABEL_18;
      }
      objc_msgSend(v16, "addObserver:selector:name:object:", self, sel__enterForeground_, *MEMORY[0x1E0CEB270], 0);
      v13 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v14 = (const __CFString **)MEMORY[0x1E0CEB358];
    }
    v17 = *v14;
    goto LABEL_17;
  }
LABEL_18:
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen"), "nativeScale");
  -[SCNView setContentScaleFactor:](self, "setContentScaleFactor:");
  -[SCNView setContentMode:](self, "setContentMode:", 4);
  -[SCNView setMultipleTouchEnabled:](self, "setMultipleTouchEnabled:", 1);
  self->_renderer = (SCNRenderer *)-[SCNRenderer _initWithOptions:isPrivateRenderer:privateRendererOwner:clearsOnDraw:context:renderingAPI:]([SCNRenderer alloc], "_initWithOptions:isPrivateRenderer:privateRendererOwner:clearsOnDraw:context:renderingAPI:", a3, 1, self, 1, v10, self->_renderingAPI);
  self->_jitterer = -[SCNJitterer initWithDelegate:]([SCNJitterer alloc], "initWithDelegate:", self);
  -[SCNView setBackgroundColor:](self, "setBackgroundColor:", -[SCNView _defaultBackgroundColor](self, "_defaultBackgroundColor"));
  if (C3DPreferencesGetBool(3))
    -[SCNView setAllowsCameraControl:](self, "setAllowsCameraControl:", 1);
  if (C3DPreferencesGetBool(2))
    -[SCNView setShowsStatistics:](self, "setShowsStatistics:", 1);
  SCNUIKitSourceSetCurrentViewEvent(self);
  if ((MGGetBoolAnswer() & 1) != 0 || !NSClassFromString(CFSTR("ARSCNView")))
    v18 = 1;
  else
    v18 = objc_opt_isKindOfClass() ^ 1;
  -[SCNMTLRenderContext setShouldPresentAfterMinimumDuration:]((uint64_t)-[SCNRenderer _renderContextMetal](self->_renderer, "_renderContextMetal"), v18 & 1);
  -[SCNMTLRenderContext setPreferredFramesPerSecond:]((uint64_t)-[SCNRenderer _renderContextMetal](self->_renderer, "_renderContextMetal"), 0);
  if (_UIApplicationIsExtension())
    -[SCNRenderer _runningInExtension](self->_renderer, "_runningInExtension");
  -[SCNView setNavigationCameraController:](self, "setNavigationCameraController:", -[SCNCameraNavigationController initWithView:]([SCNCameraNavigationController alloc], "initWithView:", self));
}

- (void)setContentScaleFactor:(double)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SCNView;
  -[SCNView setContentScaleFactor:](&v4, sel_setContentScaleFactor_, a3);
  if (self->_renderer)
  {
    -[SCNView _updateBackingSize](self, "_updateBackingSize");
    -[SCNView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

uint64_t __30__SCNView_setBackgroundColor___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v4[4];
  __int128 v5;

  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __30__SCNView_setBackgroundColor___block_invoke_2;
  v4[3] = &unk_1EA59F420;
  v5 = *(_OWORD *)(a1 + 40);
  objc_msgSend(v2, "performAsCurrentTraitCollection:", v4);
  return objc_msgSend(*(id *)(a1 + 40), "_setNeedsDisplay");
}

- (void)setNeedsDisplay
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SCNView;
  -[SCNView setNeedsDisplay](&v3, sel_setNeedsDisplay);
  if (!self->_renderingAPI)
    -[SCNView _setNeedsDisplay](self, "_setNeedsDisplay");
}

- (void)_setNeedsDisplay
{
  uint64_t (*v3)(uint64_t);
  uint64_t *p_block;
  uint64_t v5;
  uint64_t block;

  if ((*((_BYTE *)self + 464) & 0x10) == 0)
  {
    -[SCNJitterer stopIfNeeded](self->_jitterer, "stopIfNeeded");
    self->_didTriggerRedrawWhileRendering = 1;
    if (self->_displayLink)
    {
      v5 = MEMORY[0x1E0C809B0];
      v3 = __27__SCNView__setNeedsDisplay__block_invoke_2;
      p_block = &v5;
    }
    else
    {
      block = MEMORY[0x1E0C809B0];
      v3 = __27__SCNView__setNeedsDisplay__block_invoke;
      p_block = &block;
    }
    p_block[1] = 3221225472;
    p_block[2] = (uint64_t)v3;
    p_block[3] = (uint64_t)&unk_1EA59E288;
    p_block[4] = (uint64_t)self;
    dispatch_async(MEMORY[0x1E0C80D38], p_block);
  }
}

- (void)_adjustBackingLayerPixelFormat
{
  int v3;
  _BOOL4 v4;
  unint64_t v5;
  char v6;
  char v7;
  char v8;

  if (!self->_renderingAPI)
  {
    -[SCNView lock](self, "lock");
    -[SCNRenderer lock](self->_renderer, "lock");
    v3 = -[SCNView isOpaque](self, "isOpaque");
    -[SCNMTLRenderContext setIsOpaque:]((uint64_t)-[SCNRenderer _renderContextMetal](self->_renderer, "_renderContextMetal"), v3);
    if (C3DWideGamutIsUsed())
      v4 = objc_msgSend((id)objc_msgSend((id)-[SCNView window](self, "window"), "screen"), "gamut") == 1;
    else
      v4 = 0;
    v5 = -[SCNRenderer _antialiasingMode](self->_renderer, "_antialiasingMode");
    v6 = v4 | 8;
    if (!v5)
      v6 = v4;
    if (v3)
      v7 = v6;
    else
      v7 = v6 | 0x10;
    v8 = v7 & 0xDF | (32 * ((*((_BYTE *)self + 465) & 2) != 0));
    -[SCNMTLRenderContext setWantsWideGamut:]((uint64_t)-[SCNRenderer _renderContextMetal](self->_renderer, "_renderContextMetal"), v4);
    -[SCNMTLRenderContext setDisableLinearRendering:]((uint64_t)-[SCNRenderer _renderContextMetal](self->_renderer, "_renderContextMetal"), (*((unsigned __int8 *)self + 465) >> 1) & 1);
    objc_msgSend((id)-[SCNView layer](self, "layer"), "setPixelFormat:", C3DMetalFramebufferPixelFormat(v8));
    -[SCNRenderer unlock](self->_renderer, "unlock");
    -[SCNView unlock](self, "unlock");
  }
}

- (void)lock
{
  -[SCNRecursiveLock lock](self->_lock, "lock");
}

- (BOOL)isOpaque
{
  return *((_BYTE *)self + 464) & 1;
}

- (void)setBackgroundColor:(NSColor *)backgroundColor
{
  NSColor *v3;
  NSColor *v5;
  uint64_t v6;
  _QWORD v7[7];
  objc_super v8;

  v3 = backgroundColor;
  v5 = (NSColor *)self->_backgroundColor;
  if (v5 != backgroundColor)
  {

    self->_backgroundColor = (UIColor *)v3;
  }
  if (!v3)
    v3 = -[SCNView _defaultBackgroundColor](self, "_defaultBackgroundColor");
  v8.receiver = self;
  v8.super_class = (Class)SCNView;
  -[SCNView setBackgroundColor:](&v8, sel_setBackgroundColor_, v3);
  v6 = -[SCNView traitCollection](self, "traitCollection");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __30__SCNView_setBackgroundColor___block_invoke;
  v7[3] = &unk_1EA59F718;
  v7[4] = v6;
  v7[5] = self;
  v7[6] = v3;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", 0, self, v7);
  -[SCNView _backgroundDidChange](self, "_backgroundDidChange");
}

- (void)unlock
{
  -[SCNRecursiveLock unlock](self->_lock, "unlock");
}

- (void)_backgroundDidChange
{
  -[SCNView _updateOpacity](self, "_updateOpacity");
  -[SCNView _adjustBackingLayerPixelFormat](self, "_adjustBackingLayerPixelFormat");
}

- (void)_updateOpacity
{
  NSColor *v3;
  float v4;
  double v5;
  char v6;
  _BOOL8 v8;
  char v9;

  v3 = (NSColor *)scn_NSColorFromCGColorIfApplicable(-[SCNMaterialProperty contents](-[SCNScene background](self->_scene, "background"), "contents"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || !v3)
  {
    v3 = -[SCNView backgroundColor](self, "backgroundColor");
    if (!v3)
      v3 = -[SCNView _defaultBackgroundColor](self, "_defaultBackgroundColor");
  }
  v9 = 0;
  -[NSColor scn_C3DColorIgnoringColorSpace:success:](v3, "scn_C3DColorIgnoringColorSpace:success:", 0, &v9);
  *(float *)&v5 = v4;
  v6 = *((_BYTE *)self + 464);
  v8 = v4 == 1.0 || v9 == 0;
  *((_BYTE *)self + 464) = v6 & 0xFE | v8;
  if (((v6 & 1) == 0) == v8)
  {
    objc_msgSend((id)-[SCNView layer](self, "layer", v5), "setOpaque:", v8);
    -[SCNView setOpaque:](self, "setOpaque:", *((_BYTE *)self + 464) & 1);
  }
}

- (NSColor)backgroundColor
{
  return (NSColor *)self->_backgroundColor;
}

- (void)scn_setBackingLayer:(id)a3
{
  CALayer *backingLayer;

  backingLayer = self->_backingLayer;
  if (backingLayer != a3)
  {

    self->_backingLayer = (CALayer *)a3;
  }
}

- (id)_defaultBackgroundColor
{
  return (id)objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
}

+ (BOOL)shouldObserveApplicationStateToPreventBackgroundGPUAccess
{
  return 1;
}

- (void)_sceneDidUpdate:(id)a3
{
  self->_lastUpdate = CACurrentMediaTime();
  -[SCNView _setNeedsDisplay](self, "_setNeedsDisplay");
}

- (void)scn_setGestureRecognizers:(id)a3
{
  NSArray *controllerGestureRecognizers;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  controllerGestureRecognizers = self->_controllerGestureRecognizers;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](controllerGestureRecognizers, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(controllerGestureRecognizers);
        -[SCNView removeGestureRecognizer:](self, "removeGestureRecognizer:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i));
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](controllerGestureRecognizers, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v7);
  }

  v10 = (NSArray *)a3;
  self->_controllerGestureRecognizers = v10;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        -[SCNView addGestureRecognizer:](self, "addGestureRecognizer:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * j));
      }
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
  }
}

void __85__SCNView_SCNDisplayLink___initializeDisplayLinkWithScreen_policy_completionHandler___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  int v4;
  NSObject *v5;
  OS_os_workgroup *v6;
  OS_os_workgroup *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  uint8_t v17[16];
  os_workgroup_join_token_opaque_s token_out;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  memset(&token_out, 0, sizeof(token_out));
  if (WeakRetained)
  {
    v4 = objc_msgSend((id)objc_opt_class(), "usesSeparateWorkGroup");
    if (v4)
    {
      scn_default_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl(&dword_1DCCB8000, v5, OS_LOG_TYPE_INFO, "Info: [SCNView] Using separate work group", v17, 2u);
      }

      if (os_workgroup_attr_set_flags())
        __85__SCNView_SCNDisplayLink___initializeDisplayLinkWithScreen_policy_completionHandler___block_invoke_cold_3();
      v6 = (OS_os_workgroup *)os_workgroup_create();
      if (!v6)
        __85__SCNView_SCNDisplayLink___initializeDisplayLinkWithScreen_policy_completionHandler___block_invoke_cold_1();
      v7 = v6;
      if (os_workgroup_join(v6, &token_out))
        __85__SCNView_SCNDisplayLink___initializeDisplayLinkWithScreen_policy_completionHandler___block_invoke_cold_2();
    }
    else
    {
      v7 = 0;
    }
    objc_msgSend(WeakRetained, "renderer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_renderingQueue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "SCN_setupDisplayLinkWithQueue:screen:policy:", v9, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v7 = 0;
    v4 = 0;
  }

  objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  pthread_setname_np("com.apple.scenekit.scnview-renderer");
  pthread_set_fixedpriority_self();
  v12 = objc_loadWeakRetained(v2);

  if (v12)
  {
    v13 = *MEMORY[0x1E0C99748];
    do
    {
      v14 = (void *)MEMORY[0x1DF0D4CF4]();
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 1.0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "runMode:beforeDate:", v13, v15);

      objc_autoreleasePoolPop(v14);
      v16 = objc_loadWeakRetained(v2);

    }
    while (v16);
  }
  if (v4)
    os_workgroup_leave(v7, &token_out);

}

void __37__SCNView__createDisplayLinkIfNeeded__block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD v3[5];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __37__SCNView__createDisplayLinkIfNeeded__block_invoke_2;
  v3[3] = &unk_1EA5A34F0;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  v3[4] = a2;
  dispatch_async(MEMORY[0x1E0C80D38], v3);
  objc_destroyWeak(&v4);
}

+ (BOOL)usesSeparateWorkGroup
{
  return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "BOOLForKey:", CFSTR("com.apple.sceneKit.forceSeparateWorkGroup"));
}

- (void)setAntialiasingMode:(SCNAntialiasingMode)antialiasingMode
{
  -[SCNRenderer set_antialiasingMode:](self->_renderer, "set_antialiasingMode:", antialiasingMode);
  -[SCNView _setNeedsDisplay](self, "_setNeedsDisplay");
}

- (id)scn_backingLayer
{
  return self->_backingLayer;
}

+ (Class)layerClass
{
  if (!gTmpRenderingAPI)
    objc_msgSend(a1, "lowLatency");
  return (Class)objc_opt_class();
}

+ (BOOL)lowLatency
{
  return 0;
}

- (SCNView)initWithFrame:(CGRect)frame options:(NSDictionary *)options
{
  double height;
  double width;
  double y;
  double x;
  SCNView *v10;
  SCNView *v11;
  objc_super v13;

  height = frame.size.height;
  width = frame.size.width;
  y = frame.origin.y;
  x = frame.origin.x;
  -[SCNView _selectRenderingAPIWithOptions:](self, "_selectRenderingAPIWithOptions:");
  v13.receiver = self;
  v13.super_class = (Class)SCNView;
  v10 = -[SCNView initWithFrame:](&v13, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    v10->_boundsSize.width = width;
    v10->_boundsSize.height = height;
    -[SCNView _commonInit:](v10, "_commonInit:", options);
  }
  return v11;
}

- (void)_selectRenderingAPIWithOptions:(id)a3
{
  objc_class *v4;
  objc_method *InstanceMethod;
  void (*Implementation)(void);
  objc_class *v7;
  objc_method *v8;
  unint64_t renderingAPI;

  self->_renderingAPI = objc_msgSend((id)objc_opt_class(), "renderingAPIForOptions:", a3);
  v4 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v4, sel_renderingAPI);
  Implementation = method_getImplementation(InstanceMethod);
  v7 = (objc_class *)objc_opt_class();
  v8 = class_getInstanceMethod(v7, sel_renderingAPI);
  if (Implementation == method_getImplementation(v8))
  {
    renderingAPI = self->_renderingAPI;
    if (renderingAPI)
      goto LABEL_9;
  }
  else
  {
    renderingAPI = -[SCNView renderingAPI](self, "renderingAPI");
    self->_renderingAPI = renderingAPI;
    if (renderingAPI)
      goto LABEL_9;
  }
  if (+[SCNView _isMetalSupported](SCNView, "_isMetalSupported"))
  {
    renderingAPI = self->_renderingAPI;
    if (!renderingAPI)
    {
      C3DNotifyMetalIsUsed();
      renderingAPI = self->_renderingAPI;
    }
  }
  else
  {
    renderingAPI = 1;
    self->_renderingAPI = 1;
  }
LABEL_9:
  gTmpRenderingAPI = renderingAPI;
}

+ (unint64_t)renderingAPIForOptions:(id)a3
{
  unint64_t v4;
  unsigned int v5;
  void *v6;
  NSObject *v8;
  uint8_t v9[16];

  if (C3DPreferencesGetBool(0) || !C3DMetalIsSupported())
    return 1;
  if (C3DPreferencesGetBool(1))
    return 0;
  v5 = C3DWasLinkedBeforeMajorOSYear2015();
  v6 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("SCNPreferredRenderingAPIKey"));
  if (C3DGetInfoPlistFlagIsSet((uint64_t)CFSTR("PrefersOpenGL"), 0))
  {
    if (v6 && !objc_msgSend(v6, "integerValue"))
    {
      v8 = scn_default_log();
      v4 = 1;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v9 = 0;
        v4 = 1;
        _os_log_impl(&dword_1DCCB8000, v8, OS_LOG_TYPE_INFO, "Info: PrefersOpenGL key is set in the plist but Metal is requested programmatically. GL will be used", v9, 2u);
      }
      return v4;
    }
    return 1;
  }
  if (!v6)
    return v5;
  return objc_msgSend(v6, "integerValue");
}

id __37__SCNView__createDisplayLinkIfNeeded__block_invoke_2(uint64_t a1)
{
  id result;
  double v3;
  void *v4;

  result = objc_loadWeak((id *)(a1 + 40));
  if (result)
  {
    v4 = result;
    *(float *)&v3 = (float)*((uint64_t *)result + 64);
    objc_msgSend(*(id *)(a1 + 32), "setPreferredFrameRate:", v3);
    objc_msgSend(v4, "setDisplayLink:", *(_QWORD *)(a1 + 32));
    return (id)objc_msgSend(v4, "_setNeedsDisplay");
  }
  return result;
}

- (void)setDisplayLink:(id)a3
{
  SCNDisplayLink *displayLink;

  displayLink = self->_displayLink;
  if (displayLink != a3)
  {

    self->_displayLink = (SCNDisplayLink *)a3;
  }
}

- (void)_createDisplayLinkIfNeeded
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id location;

  if (!self->_displayLink && !self->_displayLinkCreationRequested)
  {
    if (self->_renderer)
    {
      self->_displayLinkCreationRequested = 1;
      objc_initWeak(&location, self);
      v3 = objc_msgSend((id)-[SCNView window](self, "window"), "screen");
      v4 = objc_msgSend((id)objc_opt_class(), "displayLinkPolicy");
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __37__SCNView__createDisplayLinkIfNeeded__block_invoke;
      v5[3] = &unk_1EA5A3518;
      objc_copyWeak(&v6, &location);
      -[SCNView _initializeDisplayLinkWithScreen:policy:completionHandler:](self, "_initializeDisplayLinkWithScreen:policy:completionHandler:", v3, v4, v5);
      objc_destroyWeak(&v6);
      objc_destroyWeak(&location);
    }
  }
}

- (void)_initializeDisplayLinkWithScreen:(id)a3 policy:(unint64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  int v16;
  void *v17;
  dispatch_time_t v18;
  sched_param v19;
  _QWORD aBlock[4];
  id v21;
  id v22;
  id v23[2];
  id location;
  _QWORD block[4];
  pthread_attr_t v26;
  void *v27;
  pthread_attr_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  objc_initWeak(&location, self);
  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __85__SCNView_SCNDisplayLink___initializeDisplayLinkWithScreen_policy_completionHandler___block_invoke;
  aBlock[3] = &unk_1EA5A0BE0;
  objc_copyWeak(v23, &location);
  v11 = v8;
  v21 = v11;
  v23[1] = (id)a4;
  v12 = v9;
  v22 = v12;
  v13 = _Block_copy(aBlock);
  -[SCNView _renderThreadPriority](self, "_renderThreadPriority");
  v15 = v14;
  memset(&v28, 0, sizeof(v28));
  pthread_attr_init(&v28);
  pthread_attr_setschedpolicy(&v28, 2);
  v16 = (int)v15;
  if (v15 == 0.0)
    v16 = 45;
  v19.sched_priority = v16;
  *(_DWORD *)v19.__opaque = 0;
  pthread_attr_setschedparam(&v28, &v19);
  v17 = _Block_copy(v13);
  v18 = dispatch_time(0, 0);
  block[0] = v10;
  block[1] = 3221225472;
  block[2] = __85__SCNView_SCNDisplayLink___initializeDisplayLinkWithScreen_policy_completionHandler___block_invoke_2;
  block[3] = &__block_descriptor_104_e5_v8__0l;
  v26 = v28;
  v27 = v17;
  dispatch_after(v18, MEMORY[0x1E0C80D38], block);
  pthread_attr_destroy(&v28);

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);

}

- (double)_renderThreadPriority
{
  return 0.0;
}

+ (BOOL)displayLinkCallbackShouldReturnImmediately
{
  return C3DWasLinkedBeforeMajorOSYear2022() ^ 1;
}

uint64_t __85__SCNView_SCNDisplayLink___initializeDisplayLinkWithScreen_policy_completionHandler___block_invoke_2(uint64_t a1)
{
  pthread_t v2;

  v2 = 0;
  return pthread_create(&v2, (const pthread_attr_t *)(a1 + 32), (void *(__cdecl *)(void *))__SCNRenderThread_start__, *(void **)(a1 + 96));
}

- (BOOL)prepareObject:(id)a3 shouldAbortBlock:(id)a4
{
  -[SCNRenderer setContext:](self->_renderer, "setContext:", -[SCNView context](self, "context"));
  return -[SCNRenderer prepareObject:shouldAbortBlock:](self->_renderer, "prepareObject:shouldAbortBlock:", a3, a4);
}

- (void)context
{
  if (self->_renderingAPI)
    return -[SCNRenderer context](self->_renderer, "context");
  else
    return 0;
}

- (void)_enterForeground:(id)a3
{
  int v4;
  id AudioEngine;

  *((_BYTE *)self + 464) &= ~0x40u;
  v4 = *((char *)self + 464);
  if (v4 < 0)
  {
    *((_BYTE *)self + 464) = v4 & 0x7F;
    -[SCNScene setPaused:](-[SCNView scene](self, "scene", a3), "setPaused:", 0);
  }
  AudioEngine = C3DAudioManagerGetAudioEngine(0);
  if (AudioEngine)
    objc_msgSend(AudioEngine, "startAndReturnError:", 0);
  if ((*((_BYTE *)self + 464) & 0x10) == 0)
    -[SCNView resumeDisplayLink](self, "resumeDisplayLink");
}

- (BOOL)_canJitter
{
  __C3DEngineContext *RendererContextGL;
  uint64_t v3;
  __n128 Viewport;

  RendererContextGL = -[SCNRenderer _engineContext](self->_renderer, "_engineContext");
  if (RendererContextGL)
  {
    v3 = (uint64_t)RendererContextGL;
    Viewport = C3DEngineContextGetViewport((__n128 *)RendererContextGL);
    Viewport.n128_u64[0] = (unint64_t)vclez_f32((float32x2_t)vrev64_s32((int32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)Viewport, (int8x16_t)Viewport, 8uLL)));
    if (((Viewport.n128_u32[1] | Viewport.n128_u32[0]) & 1) != 0)
    {
      LOBYTE(RendererContextGL) = 0;
    }
    else if (C3DEngineContextGetRenderContext(v3))
    {
      LOBYTE(RendererContextGL) = 1;
    }
    else
    {
      RendererContextGL = (__C3DEngineContext *)C3DEngineContextGetRendererContextGL(v3);
      if (RendererContextGL)
        LOBYTE(RendererContextGL) = C3DRendererContextGetGLContext((uint64_t)RendererContextGL) != 0;
    }
  }
  return (char)RendererContextGL;
}

+ (id)deviceForOptions:(id)a3
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = MTLCreateSystemDefaultDevice();
  if (!v3 && (deviceForOptions__done & 1) == 0)
  {
    deviceForOptions__done = 1;
    v4 = scn_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      +[SCNView deviceForOptions:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
  }
  return v3;
}

- (SCNView)init
{
  return -[SCNView initWithFrame:options:](self, "initWithFrame:options:", 0, 0.0, 0.0, 1.0, 1.0);
}

- (SCNView)initWithCoder:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  SCNView *v10;
  SCNView *v11;
  CGSize *p_boundsSize;
  objc_class *v13;
  CGFloat v14;
  uint64_t v15;
  __CFString *v16;
  void *v17;
  uint64_t v18;
  const __CFString *v19;
  uint64_t v20;
  SCNScene *v21;
  objc_super v23;
  _QWORD v24[2];
  _QWORD v25[2];
  const __CFString *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "containsValueForKey:", CFSTR("ibPreferredRenderingAPI")))
  {
    v5 = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("ibPreferredRenderingAPI"));
    v6 = v5;
    if (v5 == 2)
    {
      v7 = 1;
LABEL_10:
      if (C3DWasLinkedBeforeMajorOSYear2015())
        v8 = 1;
      else
        v8 = v7;
      goto LABEL_13;
    }
    if (v5 == 1)
    {
      v7 = 0;
      goto LABEL_10;
    }
  }
  else
  {
    v6 = 0;
  }
  if (!C3DWasLinkedBeforeMajorOSYear2015())
  {
    v9 = 0;
    goto LABEL_14;
  }
  v8 = 1;
LABEL_13:
  v26 = CFSTR("SCNPreferredRenderingAPIKey");
  v27[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8);
  v9 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
LABEL_14:
  -[SCNView _selectRenderingAPIWithOptions:](self, "_selectRenderingAPIWithOptions:", v9);
  v23.receiver = self;
  v23.super_class = (Class)SCNView;
  v10 = -[SCNView initWithCoder:](&v23, sel_initWithCoder_, a3);
  v11 = v10;
  if (v10)
  {
    p_boundsSize = &v10->_boundsSize;
    -[SCNView bounds](v10, "bounds");
    *(_QWORD *)&p_boundsSize->width = v13;
    v11->_boundsSize.height = v14;
    -[SCNView set_ibPreferredRenderingAPI:](v11, "set_ibPreferredRenderingAPI:", v6);
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("ibWantsMultisampling")))
      v15 = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("ibWantsMultisampling"));
    else
      v15 = 0;
    -[SCNView set_ibWantsMultisampling:](v11, "set_ibWantsMultisampling:", v15);
    -[SCNView _commonInit:](v11, "_commonInit:", v9);
    if (-[SCNView _ibWantsMultisampling](v11, "_ibWantsMultisampling"))
      -[SCNView setAntialiasingMode:](v11, "setAntialiasingMode:", 2);
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("loops")))
      -[SCNView setLoops:](v11, "setLoops:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("loops")));
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("playing")))
      -[SCNView setPlaying:](v11, "setPlaying:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("playing")));
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("autoenablesDefaultLighting")))
      -[SCNView setAutoenablesDefaultLighting:](v11, "setAutoenablesDefaultLighting:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("autoenablesDefaultLighting")));
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("jitteringEnabled")))
      -[SCNView setJitteringEnabled:](v11, "setJitteringEnabled:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("jitteringEnabled")));
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("temporalAntialiasingEnabled")))
      -[SCNView setTemporalAntialiasingEnabled:](v11, "setTemporalAntialiasingEnabled:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("temporalAntialiasingEnabled")));
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("allowsCameraControl")))
      -[SCNView setAllowsCameraControl:](v11, "setAllowsCameraControl:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("allowsCameraControl")));
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("backgroundColor")))
      -[SCNView setBackgroundColor:](v11, "setBackgroundColor:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("backgroundColor")));
    -[SCNView set_ibSceneName:](v11, "set_ibSceneName:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ibSceneName")));
    if (-[NSString length](v11->__ibSceneName, "length"))
    {
      v16 = -[NSString pathExtension](v11->__ibSceneName, "pathExtension");
      v17 = (void *)SCNGetResourceBundle();
      v18 = -[NSString stringByDeletingPathExtension](v11->__ibSceneName, "stringByDeletingPathExtension");
      if (-[__CFString isEqualToString:](v16, "isEqualToString:", &stru_1EA5A6480))
        v19 = CFSTR("dae");
      else
        v19 = v16;
      v20 = objc_msgSend(v17, "URLForResource:withExtension:", v18, v19);
      if (v20)
      {
        v24[0] = CFSTR("kSceneSourceCreateCameraIfAbsent");
        v24[1] = CFSTR("kSceneSourceCreateNormalsIfAbsent");
        v25[0] = MEMORY[0x1E0C9AAB0];
        v25[1] = MEMORY[0x1E0C9AAB0];
        v21 = +[SCNScene sceneWithURL:options:error:](SCNScene, "sceneWithURL:options:error:", v20, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 2), 0);
        if (v21)
          -[SCNView setScene:](v11, "setScene:", v21);
      }
    }
  }
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SCNView;
  -[SCNView encodeWithCoder:](&v5, sel_encodeWithCoder_);
  objc_msgSend(a3, "encodeBool:forKey:", -[SCNView loops](self, "loops"), CFSTR("loops"));
  objc_msgSend(a3, "encodeBool:forKey:", -[SCNView isPlaying](self, "isPlaying"), CFSTR("playing"));
  objc_msgSend(a3, "encodeBool:forKey:", -[SCNView autoenablesDefaultLighting](self, "autoenablesDefaultLighting"), CFSTR("autoenablesDefaultLighting"));
  objc_msgSend(a3, "encodeBool:forKey:", -[SCNView isJitteringEnabled](self, "isJitteringEnabled"), CFSTR("jitteringEnabled"));
  objc_msgSend(a3, "encodeBool:forKey:", -[SCNView isTemporalAntialiasingEnabled](self, "isTemporalAntialiasingEnabled"), CFSTR("temporalAntialiasingEnabled"));
  objc_msgSend(a3, "encodeBool:forKey:", -[SCNView allowsCameraControl](self, "allowsCameraControl"), CFSTR("allowsCameraControl"));
  objc_msgSend(a3, "encodeObject:forKey:", -[SCNView backgroundColor](self, "backgroundColor"), CFSTR("backgroundColor"));
  objc_msgSend(a3, "encodeObject:forKey:", -[SCNView _ibSceneName](self, "_ibSceneName"), CFSTR("ibSceneName"));
  objc_msgSend(a3, "encodeBool:forKey:", -[SCNView _ibWantsMultisampling](self, "_ibWantsMultisampling"), CFSTR("ibWantsMultisampling"));
  objc_msgSend(a3, "encodeInteger:forKey:", -[SCNView _ibPreferredRenderingAPI](self, "_ibPreferredRenderingAPI"), CFSTR("ibPreferredRenderingAPI"));
}

- (void)dealloc
{
  objc_super v3;

  *((_BYTE *)self + 464) |= 0x10u;
  *((_BYTE *)self + 464) |= 0x40u;
  -[SCNView _flushDisplayLink](self, "_flushDisplayLink");
  -[SCNView scn_setGestureRecognizers:](self, "scn_setGestureRecognizers:", 0);
  if ((SCNView *)gCurrentSCNViewFocusEnvironment == self)
    gCurrentSCNViewFocusEnvironment = 0;
  -[SCNDisplayLink invalidate](self->_displayLink, "invalidate");

  self->_displayLink = 0;
  -[SCNJitterer delegateWillDie](self->_jitterer, "delegateWillDie");

  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:", self);
  -[SCNEventHandler sceneWillChange](self->_navigationCameraController, "sceneWillChange");
  -[SCNEventHandler setDelegate:](self->_navigationCameraController, "setDelegate:", 0);

  -[SCNScene removeObserver:forKeyPath:](self->_scene, "removeObserver:forKeyPath:", self, CFSTR("background.contents"));
  v3.receiver = self;
  v3.super_class = (Class)SCNView;
  -[SCNView dealloc](&v3, sel_dealloc);
}

- (void)setHidden:(BOOL)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SCNView;
  -[SCNView setHidden:](&v5, sel_setHidden_);
  self->_isHidden = a3;
}

- (void)presentScene:(id)a3 withTransition:(id)a4 incomingPointOfView:(id)a5 completionHandler:(id)a6
{
  SCNScene *v11;
  SCNNode *v12;

  v11 = self->_scene;
  v12 = -[SCNView pointOfView](self, "pointOfView");
  -[SCNView lock](self, "lock");
  +[SCNTransaction begin](SCNTransaction, "begin");
  +[SCNTransaction setAnimationDuration:](SCNTransaction, "setAnimationDuration:", 0.0);
  +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", 1);
  -[SCNView setScene:](self, "setScene:", a3);
  -[SCNView setPointOfView:](self, "setPointOfView:", a5);
  if (a4)
    -[SCNRenderer _prepareForTransition:outgoingScene:outgoingPointOfView:completionHandler:](self->_renderer, "_prepareForTransition:outgoingScene:outgoingPointOfView:completionHandler:", a4, v11, v12, a6);
  +[SCNTransaction commit](SCNTransaction, "commit");
  -[SCNView unlock](self, "unlock");

}

- (BOOL)skipFramesIfNoDrawableAvailable
{
  return self->_skipFramesIfNoDrawableAvailable;
}

- (void)setSkipFramesIfNoDrawableAvailable:(BOOL)a3
{
  self->_skipFramesIfNoDrawableAvailable = a3;
}

- (void)set_superSamplingFactor:(double)a3
{
  -[SCNRenderer set_superSamplingFactor:](self->_renderer, "set_superSamplingFactor:", a3);
}

- (double)_superSamplingFactor
{
  double result;

  -[SCNRenderer _superSamplingFactor](self->_renderer, "_superSamplingFactor");
  return result;
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
  -[SCNRenderer set_screenTransform:](self->_renderer, "set_screenTransform:", v5);
}

- (SCNMatrix4)_screenTransform
{
  SCNMatrix4 *result;

  result = (SCNMatrix4 *)self->_renderer;
  if (result)
    return (SCNMatrix4 *)-[SCNMatrix4 _screenTransform](result, "_screenTransform");
  *(_OWORD *)&retstr->m31 = 0u;
  *(_OWORD *)&retstr->m41 = 0u;
  *(_OWORD *)&retstr->m11 = 0u;
  *(_OWORD *)&retstr->m21 = 0u;
  return result;
}

- (void)set_renderOptions:(unint64_t)a3
{
  int v3;
  __C3DEngineContext *v5;
  uint64_t v6;
  CFNumberRef v7;
  int valuePtr;

  v3 = a3;
  valuePtr = a3;
  v5 = -[SCNRenderer _engineContext](self->_renderer, "_engineContext");
  v6 = (uint64_t)v5;
  if (v3)
  {
    v7 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberSInt32Type, &valuePtr);
    C3DEngineContextSetRenderingOptionForKey(v6, CFSTR("debugRendering"), v7);
    CFRelease(v7);
  }
  else
  {
    C3DEngineContextSetRenderingOptionForKey((uint64_t)v5, CFSTR("debugRendering"), 0);
  }
  -[SCNView _setNeedsDisplay](self, "_setNeedsDisplay");
}

- (unint64_t)_renderOptions
{
  unint64_t result;
  int valuePtr;

  result = (unint64_t)C3DEngineContextGetRenderingOptionForKey((uint64_t)-[SCNRenderer _engineContext](self->_renderer, "_engineContext"), CFSTR("debugRendering"));
  if (result)
  {
    valuePtr = 0;
    CFNumberGetValue((CFNumberRef)result, kCFNumberSInt32Type, &valuePtr);
    return valuePtr;
  }
  return result;
}

- (BOOL)isJitteringEnabled
{
  return -[SCNJitterer isEnabled](self->_jitterer, "isEnabled");
}

- (BOOL)isTemporalAntialiasingEnabled
{
  return -[SCNRenderer isTemporalAntialiasingEnabled](self->_renderer, "isTemporalAntialiasingEnabled");
}

- (void)setTemporalAntialiasingEnabled:(BOOL)a3
{
  -[SCNRenderer setTemporalAntialiasingEnabled:](self->_renderer, "setTemporalAntialiasingEnabled:", a3);
}

- (void)_jitterRedisplay
{
  -[SCNRenderer _presentFramebuffer](self->_renderer, "_presentFramebuffer");
}

- (BOOL)_supportsJitteringSyncRedraw
{
  return -[SCNView layer](self, "layer") == 0;
}

- (BOOL)drawableResizesAsynchronously
{
  return 0;
}

- (BOOL)scn_inLiveResize
{
  return 0;
}

- (id)_renderingQueue
{
  return -[SCNRenderer _renderingQueue](self->_renderer, "_renderingQueue");
}

- (void)updateAtTime:(double)a3
{
  -[SCNRenderer updateAtTime:](self->_renderer, "updateAtTime:", a3);
}

- (void)_updateContentsScaleFactor
{
  -[SCNView contentScaleFactor](self, "contentScaleFactor");
  -[SCNRenderer _setContentsScaleFactor:](self->_renderer, "_setContentsScaleFactor:");
}

- (CGSize)backingSizeForBoundSize:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[SCNView contentScaleFactor](self, "contentScaleFactor");
  v7 = width * v6;
  -[SCNView contentScaleFactor](self, "contentScaleFactor");
  v9 = height * v8;
  v10 = v7;
  result.height = v9;
  result.width = v10;
  return result;
}

- (CGSize)_updateBackingSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGSize result;

  -[SCNView lock](self, "lock");
  -[SCNView _updateContentsScaleFactor](self, "_updateContentsScaleFactor");
  -[SCNView bounds](self, "bounds");
  self->_boundsSize.width = v3;
  self->_boundsSize.height = v4;
  -[SCNView backingSizeForBoundSize:](self, "backingSizeForBoundSize:", v3, v4);
  v6 = v5;
  v8 = v7;
  -[SCNRenderer _setBackingSize:](self->_renderer, "_setBackingSize:");
  *(float *)&v9 = v6;
  *(float *)&v10 = v8;
  LODWORD(v11) = 0;
  LODWORD(v12) = 0;
  -[SCNRenderer set_viewport:](self->_renderer, "set_viewport:", v11, v12, v9, v10);
  -[SCNView unlock](self, "unlock");
  v13 = v6;
  v14 = v8;
  result.height = v14;
  result.width = v13;
  return result;
}

- (void)_drawAtTime:(double)a3
{
  double v5;
  double v6;
  void *v7;
  CFTimeInterval currentSystemTime;
  double v9;
  double v10;
  double v11;
  double v12;

  if ((*((_BYTE *)self + 464) & 0x40) != 0 || (*((_BYTE *)self + 464) & 0x10) != 0)
  {
    if ((*((_BYTE *)self + 464) & 0x20) == 0)
      return;
    *((_BYTE *)self + 464) &= ~0x20u;
  }
  if (-[SCNRenderer _installContext](self->_renderer, "_installContext")
    && (self->_renderingAPI
     || !self->_skipFramesIfNoDrawableAvailable && !objc_msgSend((id)objc_opt_class(), "lowLatency")
     || -[CALayer isDrawableAvailable](self->_backingLayer, "isDrawableAvailable")))
  {
    self->_didTriggerRedrawWhileRendering = 0;
    -[SCNJitterer stopIfNeeded](self->_jitterer, "stopIfNeeded");
    -[SCNRenderer _displayLinkStatsTick](self->_renderer, "_displayLinkStatsTick");
    -[SCNView lock](self, "lock");
    -[SCNRenderer _backingSize](self->_renderer, "_backingSize");
    if (v6 == 0.0 || v5 == 0.0)
    {
      -[SCNView unlock](self, "unlock");
    }
    else
    {
      -[SCNEventHandler viewWillDrawAtTime:](self->_navigationCameraController, "viewWillDrawAtTime:", CACurrentMediaTime());
      v7 = (void *)MEMORY[0x1DF0D4CF4](-[SCNRenderer lock](self->_renderer, "lock"));
      -[SCNRenderer _beginFrame](self->_renderer, "_beginFrame");
      -[SCNRenderer _getFrameIndex](self->_renderer, "_getFrameIndex");
      kdebug_trace();
      +[SCNTransaction lock](SCNTransaction, "lock");
      currentSystemTime = CACurrentMediaTime();
      if (a3 != 0.0)
        currentSystemTime = a3;
      self->_currentSystemTime = currentSystemTime;
      if (self->_renderingAPI)
      {
        glPushGroupMarkerEXT(0, "SceneKit - SCNView Draw");
        currentSystemTime = self->_currentSystemTime;
      }
      -[SCNRenderer _drawAtTime:](self->_renderer, "_drawAtTime:", currentSystemTime);
      if (self->_renderingAPI)
        glPopGroupMarkerEXT();
      -[SCNRenderer _presentFramebuffer](self->_renderer, "_presentFramebuffer");
      objc_autoreleasePoolPop(v7);
      +[SCNTransaction unlock](SCNTransaction, "unlock");
      -[SCNRenderer _nextFrameTime](self->_renderer, "_nextFrameTime");
      v10 = v9;
      v11 = CACurrentMediaTime();
      -[SCNRenderer unlock](self->_renderer, "unlock");
      kdebug_trace();
      -[SCNEventHandler viewDidDrawAtTime:](self->_navigationCameraController, "viewDidDrawAtTime:", self->_currentSystemTime);
      if (-[SCNView _checkAndUpdateDisplayLinkStateIfNeeded](self, "_checkAndUpdateDisplayLinkStateIfNeeded")
        && !-[SCNView isPlaying](self, "isPlaying"))
      {
        v12 = v10 - v11;
        if (v10 - v11 > 2.0)
          -[SCNJitterer restart](self->_jitterer, "restart", v12);
      }
      -[SCNView unlock](self, "unlock", v12);
      -[SCNRenderer _displayLinkStatsTack](self->_renderer, "_displayLinkStatsTack");
    }
  }
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SCNView;
  -[SCNView layoutSubviews](&v3, sel_layoutSubviews);
  -[SCNView _updateBackingSize](self, "_updateBackingSize");
  -[SCNView _setNeedsDisplay](self, "_setNeedsDisplay");
}

- (void)setPointOfView:(id)a3 animate:(BOOL)a4
{
  _BOOL4 v4;
  double v7;

  v4 = a4;
  +[SCNTransaction begin](SCNTransaction, "begin");
  v7 = 0.0;
  if (v4)
    v7 = 0.75;
  +[SCNTransaction setAnimationDuration:](SCNTransaction, "setAnimationDuration:", v7);
  -[SCNView setPointOfView:](self, "setPointOfView:", a3);
  +[SCNTransaction commit](SCNTransaction, "commit");
}

- (CGRect)currentViewport
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[SCNRenderer currentViewport](self->_renderer, "currentViewport");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setPointOfCulling:(id)a3
{
  if (-[SCNView pointOfCulling](self, "pointOfCulling") != a3)
    -[SCNRenderer setPointOfCulling:](self->_renderer, "setPointOfCulling:", a3);
}

- (id)pointOfCulling
{
  return -[SCNRenderer pointOfCulling](self->_renderer, "pointOfCulling");
}

- (AVAudioEngine)audioEngine
{
  return -[SCNRenderer audioEngine](self->_renderer, "audioEngine");
}

- (AVAudioEnvironmentNode)audioEnvironmentNode
{
  return -[SCNRenderer audioEnvironmentNode](self->_renderer, "audioEnvironmentNode");
}

- (SCNNode)audioListener
{
  return -[SCNRenderer audioListener](self->_renderer, "audioListener");
}

- (void)setAudioListener:(id)a3
{
  -[SCNRenderer setAudioListener:](self->_renderer, "setAudioListener:", a3);
}

- (void)setTechnique:(id)a3
{
  -[SCNRenderer setTechnique:](self->_renderer, "setTechnique:", a3);
}

- (SCNTechnique)technique
{
  return -[SCNRenderer technique](self->_renderer, "technique");
}

- (void)setAllowsCameraControl:(BOOL)allowsCameraControl
{
  uint64_t v4;

  v4 = C3DPreferencesGetBool(3) | allowsCameraControl;
  if ((_DWORD)v4 != -[SCNEventHandler enabled](self->_navigationCameraController, "enabled"))
    -[SCNEventHandler setEnabled:](self->_navigationCameraController, "setEnabled:", v4);
}

- (BOOL)allowsCameraControl
{
  return -[SCNEventHandler enabled](self->_navigationCameraController, "enabled");
}

- (SCNCameraController)defaultCameraController
{
  return (SCNCameraController *)objc_msgSend(-[SCNView navigationCameraController](self, "navigationCameraController"), "cameraController");
}

- (BOOL)loops
{
  return -[SCNRenderer loops](self->_renderer, "loops");
}

- (void)setLoops:(BOOL)a3
{
  -[SCNRenderer setLoops:](self->_renderer, "setLoops:", a3);
}

- (BOOL)isPlaying
{
  return -[SCNRenderer isPlaying](self->_renderer, "isPlaying");
}

- (void)setPlaying:(BOOL)a3
{
  _BOOL8 v3;
  double v5;

  v3 = a3;
  if (-[SCNView isPlaying](self, "isPlaying") != a3)
  {
    -[SCNRenderer setPlaying:](self->_renderer, "setPlaying:", v3);
    if (v3)
    {
      objc_msgSend(-[SCNView displayLink](self, "displayLink"), "setPaused:", 0);
    }
    else
    {
      -[SCNRenderer _nextFrameTime](self->_renderer, "_nextFrameTime");
      if (v5 - CACurrentMediaTime() > 2.0 && (*((_BYTE *)self + 464) & 2) == 0)
        -[SCNJitterer restart](self->_jitterer, "restart");
    }
  }
}

- (BOOL)rendersContinuously
{
  return (*((unsigned __int8 *)self + 464) >> 1) & 1;
}

- (void)setRendersContinuously:(BOOL)rendersContinuously
{
  char v3;
  char v5;
  double v6;

  v3 = *((_BYTE *)self + 464);
  if (((((v3 & 2) == 0) ^ rendersContinuously) & 1) == 0)
  {
    if (rendersContinuously)
      v5 = 2;
    else
      v5 = 0;
    *((_BYTE *)self + 464) = v3 & 0xFD | v5;
    -[SCNRenderer setRendersContinuously:](self->_renderer, "setRendersContinuously:");
    if ((*((_BYTE *)self + 464) & 2) != 0)
    {
      objc_msgSend(-[SCNView displayLink](self, "displayLink"), "setPaused:", 0);
    }
    else
    {
      -[SCNRenderer _nextFrameTime](self->_renderer, "_nextFrameTime");
      if (v6 - CACurrentMediaTime() > 2.0 && !-[SCNView isPlaying](self, "isPlaying"))
        -[SCNJitterer restart](self->_jitterer, "restart");
    }
  }
}

- (void)play:(id)sender
{
  -[SCNView setPlaying:](self, "setPlaying:", 1);
}

- (void)pause:(id)sender
{
  -[SCNView setPlaying:](self, "setPlaying:", 0);
}

- (void)stop:(id)sender
{
  -[SCNView setPlaying:](self, "setPlaying:", 0);
  -[SCNRenderer _stop](self->_renderer, "_stop");
  -[SCNView _setNeedsDisplay](self, "_setNeedsDisplay");
}

- (double)_flipY:(double)a3
{
  return self->_boundsSize.height - a3;
}

- (SCNVector4)_viewport
{
  float width;
  float height;
  float v4;
  float v5;
  SCNVector4 result;

  width = self->_boundsSize.width;
  height = self->_boundsSize.height;
  v4 = 0.0;
  v5 = 0.0;
  result.w = height;
  result.z = width;
  result.y = v5;
  result.x = v4;
  return result;
}

- (id)hitTest:(CGPoint)a3 options:(id)a4
{
  double x;
  double v7;

  x = a3.x;
  -[SCNView _flipY:](self, "_flipY:", a3.y);
  return -[SCNRenderer _hitTest:viewport:options:](self->_renderer, "_hitTest:viewport:options:", a4, x, v7, self->_boundsSize.width, self->_boundsSize.height);
}

- (id)hitTestWithSegmentFromPoint:(SCNVector3)a3 toPoint:(SCNVector3)a4 options:(id)a5
{
  return -[SCNRenderer hitTestWithSegmentFromPoint:toPoint:options:](self->_renderer, "hitTestWithSegmentFromPoint:toPoint:options:", a5, *(double *)&a3.x, *(double *)&a3.y, *(double *)&a3.z, *(double *)&a4.x, *(double *)&a4.y, *(double *)&a4.z);
}

- (BOOL)isNodeInsideFrustum:(id)a3 withPointOfView:(id)a4
{
  SCNRenderer *renderer;

  renderer = self->_renderer;
  -[SCNView _viewport](self, "_viewport");
  return -[SCNRenderer _isNodeInsideFrustum:withPointOfView:viewport:](renderer, "_isNodeInsideFrustum:withPointOfView:viewport:", a3, a4);
}

- (id)nodesInsideFrustumWithPointOfView:(id)a3
{
  SCNRenderer *renderer;

  renderer = self->_renderer;
  -[SCNView _viewport](self, "_viewport");
  return -[SCNRenderer _nodesInsideFrustumWithPointOfView:viewport:](renderer, "_nodesInsideFrustumWithPointOfView:viewport:", a3);
}

- (SCNVector3)projectPoint:(SCNVector3)a3
{
  float z;
  float y;
  float x;
  SCNRenderer *renderer;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  double v28;
  float v29;
  float v30;
  float v31;
  SCNVector3 result;

  z = a3.z;
  y = a3.y;
  x = a3.x;
  renderer = self->_renderer;
  -[SCNView _viewport](self, "_viewport");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  *(float *)&v16 = x;
  *(float *)&v17 = y;
  *(float *)&v18 = z;
  LODWORD(v19) = v9;
  LODWORD(v20) = v11;
  LODWORD(v21) = v13;
  LODWORD(v22) = v15;
  -[SCNRenderer _projectPoint:viewport:](renderer, "_projectPoint:viewport:", v16, v17, v18, v19, v20, v21, v22);
  v24 = v23;
  v26 = v25;
  -[SCNView _flipY:](self, "_flipY:", v27);
  v29 = v28;
  v30 = v24;
  v31 = v26;
  result.z = v31;
  result.y = v29;
  result.x = v30;
  return result;
}

- (SCNVector3)unprojectPoint:(SCNVector3)a3
{
  float z;
  float x;
  double v6;
  float v7;
  SCNRenderer *renderer;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  float v24;
  float v25;
  float v26;
  SCNVector3 result;

  z = a3.z;
  x = a3.x;
  -[SCNView _flipY:](self, "_flipY:", a3.y);
  v7 = v6;
  renderer = self->_renderer;
  -[SCNView _viewport](self, "_viewport");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  *(float *)&v17 = x;
  *(float *)&v18 = v7;
  *(float *)&v19 = z;
  LODWORD(v20) = v10;
  LODWORD(v21) = v12;
  LODWORD(v22) = v14;
  LODWORD(v23) = v16;
  -[SCNRenderer _unprojectPoint:viewport:](renderer, "_unprojectPoint:viewport:", v17, v18, v19, v20, v21, v22, v23);
  result.z = v26;
  result.y = v25;
  result.x = v24;
  return result;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  objc_super v7;

  if (a6 == CFSTR("kSCNViewObservingContext"))
  {
    if (objc_msgSend(a3, "isEqualToString:", CFSTR("background.contents"), a4, a5))
      -[SCNView _updateOpacity](self, "_updateOpacity");
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SCNView;
    -[SCNView observeValueForKeyPath:ofObject:change:context:](&v7, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

+ (id)_kvoKeysForwardedToRenderer
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("pointOfView"), CFSTR("sceneTime"), CFSTR("playing"), CFSTR("loops"), CFSTR("autoenablesDefaultLighting"), CFSTR("jitteringEnabled"), CFSTR("temporalAntialiasingEnabled"), CFSTR("technique"), 0);
}

+ (id)keyPathsForValuesAffectingValueForKey:(id)a3
{
  id v5;
  objc_super v7;

  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___SCNView;
  v5 = objc_msgSendSuper2(&v7, sel_keyPathsForValuesAffectingValueForKey_);
  if (objc_msgSend((id)objc_msgSend(a1, "_kvoKeysForwardedToRenderer"), "containsObject:", a3))
    return (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("renderer.%@"), a3)), "setByAddingObjectsFromSet:", v5);
  return v5;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  objc_super v6;

  if ((objc_msgSend((id)objc_msgSend(a1, "_kvoKeysForwardedToRenderer"), "containsObject:", a3) & 1) != 0)
    return 0;
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___SCNView;
  return objc_msgSendSuper2(&v6, sel_automaticallyNotifiesObserversForKey_, a3);
}

- (void)setDelegate:(id)a3
{
  -[SCNRenderer setDelegate:](self->_renderer, "setDelegate:", a3);
}

- (SCNSceneRendererDelegate)delegate
{
  return -[SCNRenderer delegate](self->_renderer, "delegate");
}

- (void)setEventHandler:(id)a3
{
  -[SCNView setNavigationCameraController:](self, "setNavigationCameraController:");
  objc_msgSend(a3, "setView:", self);
  -[SCNView setAllowsCameraControl:](self, "setAllowsCameraControl:", 1);
}

- (id)eventHandler
{
  return self->_navigationCameraController;
}

- (void)eventHandlerWantsRedraw
{
  objc_msgSend(-[SCNView displayLink](self, "displayLink"), "setPaused:", 0);
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v5;
  _QWORD v6[6];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SCNView;
  -[SCNView traitCollectionDidChange:](&v7, sel_traitCollectionDidChange_);
  v5 = (void *)-[SCNView traitCollection](self, "traitCollection");
  if (objc_msgSend(v5, "hasDifferentColorAppearanceComparedToTraitCollection:", a3))
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __36__SCNView_traitCollectionDidChange___block_invoke;
    v6[3] = &unk_1EA59F740;
    v6[4] = v5;
    v6[5] = self;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", 0, self, v6);
  }
}

uint64_t __36__SCNView_traitCollectionDidChange___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __36__SCNView_traitCollectionDidChange___block_invoke_2;
  v4[3] = &unk_1EA59E288;
  v2 = *(void **)(a1 + 32);
  v4[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v2, "performAsCurrentTraitCollection:", v4);
  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 464) |= 0x20u;
  return objc_msgSend(*(id *)(a1 + 40), "_setNeedsDisplay");
}

uint64_t __36__SCNView_traitCollectionDidChange___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 480), "resolvedBackgroundColorDidChange");
}

- (double)sceneTime
{
  double result;

  -[SCNRenderer sceneTime](self->_renderer, "sceneTime");
  return result;
}

- (void)setSceneTime:(double)a3
{
  -[SCNRenderer setSceneTime:](self->_renderer, "setSceneTime:", a3);
  -[SCNView _setNeedsDisplay](self, "_setNeedsDisplay");
}

- (BOOL)autoenablesDefaultLighting
{
  return -[SCNRenderer autoenablesDefaultLighting](self->_renderer, "autoenablesDefaultLighting");
}

- (void)setAutoenablesDefaultLighting:(BOOL)a3
{
  -[SCNRenderer setAutoenablesDefaultLighting:](self->_renderer, "setAutoenablesDefaultLighting:", a3);
  -[SCNView _setNeedsDisplay](self, "_setNeedsDisplay");
}

- (MTLRenderPassDescriptor)currentRenderPassDescriptor
{
  return -[SCNRenderer currentRenderPassDescriptor](self->_renderer, "currentRenderPassDescriptor");
}

- (MTLRenderCommandEncoder)currentRenderCommandEncoder
{
  return -[SCNRenderer currentRenderCommandEncoder](self->_renderer, "currentRenderCommandEncoder");
}

- (MTLDevice)device
{
  return -[SCNRenderer device](self->_renderer, "device");
}

- (MTLCommandQueue)commandQueue
{
  return -[SCNRenderer commandQueue](self->_renderer, "commandQueue");
}

- (unint64_t)colorPixelFormat
{
  return -[SCNRenderer colorPixelFormat](self->_renderer, "colorPixelFormat");
}

- (unint64_t)depthPixelFormat
{
  return -[SCNRenderer depthPixelFormat](self->_renderer, "depthPixelFormat");
}

- (unint64_t)stencilPixelFormat
{
  return -[SCNRenderer stencilPixelFormat](self->_renderer, "stencilPixelFormat");
}

- (void)prepareObjects:(id)a3 withCompletionHandler:(id)a4
{
  -[SCNRenderer setContext:](self->_renderer, "setContext:", -[SCNView context](self, "context"));
  -[SCNRenderer prepareObjects:withCompletionHandler:](self->_renderer, "prepareObjects:withCompletionHandler:", a3, a4);
}

- (SKScene)overlaySKScene
{
  return -[SCNRenderer overlaySKScene](self->_renderer, "overlaySKScene");
}

- (void)setOverlaySKScene:(id)a3
{
  SCNSpriteKitEventHandler *spriteKitEventHandler;
  SCNSpriteKitEventHandler *v6;

  -[SKScene willMoveFromView:](-[SCNView overlaySKScene](self, "overlaySKScene"), "willMoveFromView:", self);
  -[SCNRenderer setOverlaySKScene:](self->_renderer, "setOverlaySKScene:", a3);
  if (a3)
  {
    objc_msgSend(a3, "_didMoveToView:", self);
    spriteKitEventHandler = self->_spriteKitEventHandler;
    if (!spriteKitEventHandler)
    {
      spriteKitEventHandler = objc_alloc_init(SCNSpriteKitEventHandler);
      self->_spriteKitEventHandler = spriteKitEventHandler;
    }
    -[SCNSpriteKitEventHandler setScene:](spriteKitEventHandler, "setScene:", a3);
  }
  else
  {
    v6 = self->_spriteKitEventHandler;
    if (v6)
    {

      self->_spriteKitEventHandler = 0;
    }
  }
  -[SCNView _setNeedsDisplay](self, "_setNeedsDisplay");
}

- (BOOL)_wantsSceneRendererDelegationMessages
{
  return -[SCNRenderer _shouldForwardSceneRendererDelegationMessagesToPrivateRendererOwner](self->_renderer, "_shouldForwardSceneRendererDelegationMessagesToPrivateRendererOwner");
}

- (void)set_wantsSceneRendererDelegationMessages:(BOOL)a3
{
  -[SCNRenderer set_shouldForwardSceneRendererDelegationMessagesToPrivateRendererOwner:](self->_renderer, "set_shouldForwardSceneRendererDelegationMessagesToPrivateRendererOwner:", a3);
}

- (id)_resourceManagerMonitor
{
  return -[SCNRenderer _resourceManagerMonitor](self->_renderer, "_resourceManagerMonitor");
}

- (void)set_resourceManagerMonitor:(id)a3
{
  -[SCNRenderer set_resourceManagerMonitor:](self->_renderer, "set_resourceManagerMonitor:", a3);
}

- (id)_commandBufferStatusMonitor
{
  return -[SCNRenderer _commandBufferStatusMonitor](self->_renderer, "_commandBufferStatusMonitor");
}

- (void)set_commandBufferStatusMonitor:(id)a3
{
  -[SCNRenderer set_commandBufferStatusMonitor:](self->_renderer, "set_commandBufferStatusMonitor:", a3);
}

- (id)displayLink
{
  return self->_displayLink;
}

- (BOOL)_checkAndUpdateDisplayLinkStateIfNeeded
{
  uint64_t v3;
  SCNDisplayLink *displayLink;

  if (!self->_displayLink)
    return 0;
  if ((*((_BYTE *)self + 464) & 2) != 0
    || -[SCNView isPlaying](self, "isPlaying")
    || self->_didTriggerRedrawWhileRendering)
  {
    v3 = 0;
  }
  else
  {
    v3 = objc_msgSend(-[SCNView eventHandler](self, "eventHandler"), "wantsRedraw") ^ 1;
  }
  displayLink = self->_displayLink;
  -[SCNRenderer _nextFrameTime](self->_renderer, "_nextFrameTime");
  return -[SCNDisplayLink setPaused:nextFrameTimeHint:lastUpdate:](displayLink, "setPaused:nextFrameTimeHint:lastUpdate:", v3);
}

- (NSInteger)preferredFramesPerSecond
{
  id v3;
  float v4;

  v3 = -[SCNView displayLink](self, "displayLink");
  if (v3)
    objc_msgSend(v3, "preferredFrameRate");
  else
    return (uint64_t)(float)self->_preferredFramePerSeconds;
  return (uint64_t)v4;
}

- (void)setPreferredFramesPerSecond:(NSInteger)preferredFramesPerSecond
{
  id v5;
  double v6;

  v5 = -[SCNView displayLink](self, "displayLink");
  if (v5)
  {
    *(float *)&v6 = (float)preferredFramesPerSecond;
    objc_msgSend(v5, "setPreferredFrameRate:", v6);
  }
  self->_preferredFramePerSeconds = preferredFramesPerSecond;
  -[SCNMTLRenderContext setPreferredFramesPerSecond:](objc_msgSend(-[SCNView renderer](self, "renderer"), "_renderContextMetal"), preferredFramesPerSecond);
}

uint64_t __27__SCNView__setNeedsDisplay__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "isPaused");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "setNeedsDisplay");
  return result;
}

- (BOOL)usesReverseZ
{
  return -[SCNRenderer usesReverseZ](self->_renderer, "usesReverseZ");
}

- (void)setUsesReverseZ:(BOOL)a3
{
  -[SCNRenderer setUsesReverseZ:](self->_renderer, "setUsesReverseZ:", a3);
}

- (void)_systemTimeAnimationStarted:(id)a3
{
  objc_msgSend(-[SCNView displayLink](self, "displayLink", a3), "setPaused:", 0);
}

- (void)setShowsStatistics:(BOOL)a3
{
  -[SCNRenderer setShowsStatistics:](self->_renderer, "setShowsStatistics:", C3DPreferencesGetBool(2) | a3);
  -[SCNView _setNeedsDisplay](self, "_setNeedsDisplay");
}

- (BOOL)showsStatistics
{
  return -[SCNRenderer showsStatistics](self->_renderer, "showsStatistics");
}

- (UIImage)snapshot
{
  double width;
  double height;
  double v5;
  double v6;
  double v7;
  double v8;
  SCNRenderer *renderer;
  double v10;

  width = self->_boundsSize.width;
  height = self->_boundsSize.height;
  -[SCNView contentScaleFactor](self, "contentScaleFactor");
  v6 = width * v5;
  -[SCNView contentScaleFactor](self, "contentScaleFactor");
  v8 = height * v7;
  renderer = self->_renderer;
  -[SCNRenderer _systemTime](renderer, "_systemTime");
  return -[SCNRenderer snapshotAtTime:withSize:antialiasingMode:](renderer, "snapshotAtTime:withSize:antialiasingMode:", -[SCNView antialiasingMode](self, "antialiasingMode"), v10, v6, v8);
}

- (NSString)description
{
  NSString *v3;
  void *v4;
  objc_class *v5;
  NSString *v6;
  SCNScene *v7;
  uint64_t v8;
  CGRect v10;

  -[SCNView frame](self, "frame");
  v3 = NSStringFromCGRect(v10);
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  v7 = -[SCNView scene](self, "scene");
  -[SCNView sceneTime](self, "sceneTime");
  return (NSString *)objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p | scene=%@ sceneTime=%f frame=%@ pointOfView=%@>"), v6, self, v7, v8, v3, -[SCNView pointOfView](self, "pointOfView"));
}

- (BOOL)_isEditor
{
  return 0;
}

- (void)switchToCameraNamed:(id)a3
{
  SCNNode *v5;
  NSObject *v6;

  v5 = -[SCNNode childNodeWithName:recursively:](-[SCNScene rootNode](-[SCNView scene](self, "scene"), "rootNode"), "childNodeWithName:recursively:", a3, 1);
  if (v5)
  {
    -[SCNView setPointOfView:animate:](self, "setPointOfView:animate:", v5, 1);
  }
  else
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNView switchToCameraNamed:].cold.1((uint64_t)a3, v6);
  }
}

- (void)switchToNextCamera
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = -[SCNNode childNodesPassingTest:](-[SCNScene rootNode](-[SCNView scene](self, "scene"), "rootNode"), "childNodesPassingTest:", &__block_literal_global_99);
  if (-[NSArray count](v3, "count"))
  {
    v4 = -[NSArray indexOfObject:](v3, "indexOfObject:", -[SCNRenderer pointOfView](self->_renderer, "pointOfView"));
    if (v4 == 0x7FFFFFFFFFFFFFFFLL)
      v5 = -[NSArray firstObject](v3, "firstObject");
    else
      v5 = -[NSArray objectAtIndex:](v3, "objectAtIndex:", (v4 + 1) % -[NSArray count](v3, "count"));
    -[SCNView setPointOfView:animate:](self, "setPointOfView:animate:", v5, 1);
  }
}

BOOL __29__SCNView_switchToNextCamera__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "camera") != 0;
}

- (BOOL)_disableLinearRendering
{
  return (*((unsigned __int8 *)self + 465) >> 1) & 1;
}

- (void)set_disableLinearRendering:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *((_BYTE *)self + 465) = *((_BYTE *)self + 465) & 0xFD | v3;
  -[SCNView _adjustBackingLayerPixelFormat](self, "_adjustBackingLayerPixelFormat");
}

- (BOOL)_enableARMode
{
  return -[SCNRenderer _enableARMode](self->_renderer, "_enableARMode");
}

- (void)set_enableARMode:(BOOL)a3
{
  -[SCNRenderer set_enableARMode:](self->_renderer, "set_enableARMode:", a3);
}

- (BOOL)_shouldDelegateARCompositing
{
  return -[SCNRenderer _enableARMode](self->_renderer, "_enableARMode");
}

- (void)set_shouldDelegateARCompositing:(BOOL)a3
{
  -[SCNRenderer set_shouldDelegateARCompositing:](self->_renderer, "set_shouldDelegateARCompositing:", a3);
}

- (void)_updateProbes:(id)a3 withProgress:(id)a4
{
  -[SCNRenderer _updateProbes:withProgress:](self->_renderer, "_updateProbes:withProgress:", a3, a4);
}

- (void)setDebugOptions:(unint64_t)a3
{
  -[SCNRenderer setDebugOptions:](self->_renderer, "setDebugOptions:", a3);
  -[SCNView _setNeedsDisplay](self, "_setNeedsDisplay");
}

- (unint64_t)debugOptions
{
  return -[SCNRenderer debugOptions](self->_renderer, "debugOptions");
}

- (BOOL)_showsAuthoringEnvironment
{
  return -[SCNRenderer _showsAuthoringEnvironment](self->_renderer, "_showsAuthoringEnvironment");
}

- (void)set_showsAuthoringEnvironment:(BOOL)a3
{
  -[SCNRenderer set_showsAuthoringEnvironment:](self->_renderer, "set_showsAuthoringEnvironment:", a3);
}

- (id)_authoringEnvironment
{
  return -[SCNRenderer _authoringEnvironment](self->_renderer, "_authoringEnvironment");
}

- (SCNAntialiasingMode)antialiasingMode
{
  return -[SCNRenderer _antialiasingMode](self->_renderer, "_antialiasingMode");
}

- (id)_ibSceneName
{
  return self->__ibSceneName;
}

- (void)set_ibSceneName:(id)a3
{
  NSString *v5;

  v5 = self->__ibSceneName;
  self->__ibSceneName = (NSString *)objc_msgSend(a3, "copy");
}

- (BOOL)_ibWantsMultisampling
{
  return !C3DPreferencesGetBool(5) && (*((_BYTE *)self + 448) & 1) == 0;
}

- (void)set_ibWantsMultisampling:(BOOL)a3
{
  *((_BYTE *)self + 448) = *((_BYTE *)self + 448) & 0xFE | !a3;
}

- (int)_ibPreferredRenderingAPI
{
  return self->__ibPreferredRenderingAPI;
}

- (void)set_ibPreferredRenderingAPI:(int)a3
{
  self->__ibPreferredRenderingAPI = a3;
}

- (unint64_t)renderingAPI
{
  return self->_renderingAPI;
}

- (CGColorSpace)workingColorSpace
{
  return -[SCNRenderer workingColorSpace](self->_renderer, "workingColorSpace");
}

- (double)_runFPSTestWithDuration:(double)a3
{
  NSObject *v5;
  double v6;
  _QWORD block[7];
  uint64_t v9;
  float *v10;
  uint64_t v11;
  int v12;

  v9 = 0;
  v10 = (float *)&v9;
  v11 = 0x2020000000;
  v12 = 0;
  if (self->_renderingAPI)
    -[SCNView context](self, "context");
  v5 = -[SCNRenderer _renderingQueue](self->_renderer, "_renderingQueue");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__SCNView__runFPSTestWithDuration___block_invoke;
  block[3] = &unk_1EA5A3540;
  *(double *)&block[6] = a3;
  block[4] = self;
  block[5] = &v9;
  dispatch_sync(v5, block);
  v6 = v10[6];
  _Block_object_dispose(&v9, 8);
  return v6;
}

float __35__SCNView__runFPSTestWithDuration___block_invoke(uint64_t a1)
{
  double Current;
  double v3;
  double v4;
  int v5;
  void *v6;
  float result;

  Current = CFAbsoluteTimeGetCurrent();
  v3 = Current - Current;
  v4 = 0.0;
  if (Current - Current < *(double *)(a1 + 48))
  {
    v5 = 0;
    do
    {
      v6 = (void *)MEMORY[0x1DF0D4CF4]();
      objc_msgSend(*(id *)(a1 + 32), "_drawAtTime:", 0.0);
      objc_autoreleasePoolPop(v6);
      ++v5;
      v3 = CFAbsoluteTimeGetCurrent() - Current;
    }
    while (v3 < *(double *)(a1 + 48));
    v4 = (double)v5;
  }
  result = v4 / v3;
  *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)_addGPUFrameScheduledHandler:(id)a3
{
  -[SCNRenderer _addGPUFrameScheduledHandler:](self->_renderer, "_addGPUFrameScheduledHandler:", a3);
}

- (void)_addGPUFrameCompletedHandler:(id)a3
{
  -[SCNRenderer _addGPUFrameCompletedHandler:](self->_renderer, "_addGPUFrameCompletedHandler:", a3);
}

- (void)_addGPUFramePresentedHandler:(id)a3
{
  -[SCNRenderer _addGPUFramePresentedHandler:](self->_renderer, "_addGPUFramePresentedHandler:", a3);
}

- (void)_discardPendingGPUFrameScheduledHandlers
{
  -[SCNRenderer _discardPendingGPUFrameScheduledHandlers](self->_renderer, "_discardPendingGPUFrameScheduledHandlers");
}

- (void)_discardPendingGPUFrameCompletedHandlers
{
  -[SCNRenderer _discardPendingGPUFrameCompletedHandlers](self->_renderer, "_discardPendingGPUFrameCompletedHandlers");
}

- (void)_discardPendingGPUFramePresentedHandlers
{
  -[SCNRenderer _discardPendingGPUFramePresentedHandlers](self->_renderer, "_discardPendingGPUFramePresentedHandlers");
}

- (void)_allowGPUBackgroundExecution
{
  -[SCNRenderer _allowGPUBackgroundExecution](self->_renderer, "_allowGPUBackgroundExecution");
}

- (EAGLContext)eaglContext
{
  return (EAGLContext *)-[SCNRenderer context](self->_renderer, "context");
}

- (void)setEaglContext:(EAGLContext *)eaglContext
{
  -[SCNRenderer setContext:](self->_renderer, "setContext:", eaglContext);
}

- (void)displayLayer:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  if (self->_renderingAPI)
  {
    v4 = -[SCNRenderer _renderingQueue](self->_renderer, "_renderingQueue", a3);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __24__SCNView_displayLayer___block_invoke;
    block[3] = &unk_1EA59E288;
    block[4] = self;
    dispatch_sync(v4, block);
  }
}

uint64_t __24__SCNView_displayLayer___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_drawAtTime:", 0.0);
}

- (void)drawRect:(CGRect)a3
{
  NSObject *v4;
  _QWORD block[5];

  if (self->_renderingAPI || (*((_BYTE *)self + 464) & 4) == 0)
  {
    v4 = -[SCNRenderer _renderingQueue](self->_renderer, "_renderingQueue", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __20__SCNView_drawRect___block_invoke;
    block[3] = &unk_1EA59E288;
    block[4] = self;
    dispatch_sync(v4, block);
  }
}

uint64_t __20__SCNView_drawRect___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 464) |= 4u;
  return objc_msgSend(*(id *)(a1 + 32), "_drawAtTime:", 0.0);
}

- (BOOL)_controlsOwnScaleFactor
{
  return 1;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  y = a3.y;
  x = a3.x;
  v23 = *MEMORY[0x1E0C80C00];
  if (SCNContainsUIKitViews())
  {
    v8 = -[SCNView hitTest:options:](self, "hitTest:options:", 0, x, y);
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          v14 = (void *)objc_msgSend((id)objc_msgSend(v13, "node"), "geometry");
          v15 = (void *)objc_msgSend((id)objc_msgSend(v14, "materials"), "count");
          if (v15)
            v15 = (void *)objc_msgSend((id)objc_msgSend(v14, "materials"), "objectAtIndexedSubscript:", objc_msgSend(v13, "geometryIndex")% (unint64_t)objc_msgSend((id)objc_msgSend(v14, "materials"), "count"));
          objc_msgSend((id)objc_msgSend(v15, "diffuse"), "contents");
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            SCNUIKitSourceSetCurrentViewEvent(self);
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v10);
    }
  }
  v17.receiver = self;
  v17.super_class = (Class)SCNView;
  return -[SCNView hitTest:withEvent:](&v17, sel_hitTest_withEvent_, a4, x, y);
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;

  if (!-[SCNView showsStatistics](self, "showsStatistics")
    || (objc_msgSend((id)objc_msgSend(a3, "anyObject"), "locationInView:", self),
        v8 = v7,
        v10 = v9,
        -[SCNView bounds](self, "bounds"),
        (objc_msgSend(-[SCNView _authoringEnvironment](self, "_authoringEnvironment"), "didTapAtPoint:", v8, v11 - v10) & 1) == 0))
  {
    if (!-[SCNSpriteKitEventHandler touchesBegan:withEvent:](self->_spriteKitEventHandler, "touchesBegan:withEvent:", a3, a4))
    {
      v12.receiver = self;
      v12.super_class = (Class)SCNView;
      -[SCNView touchesBegan:withEvent:](&v12, sel_touchesBegan_withEvent_, a3, a4);
    }
  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  objc_super v7;

  if (!-[SCNSpriteKitEventHandler touchesMoved:withEvent:](self->_spriteKitEventHandler, "touchesMoved:withEvent:"))
  {
    v7.receiver = self;
    v7.super_class = (Class)SCNView;
    -[SCNView touchesMoved:withEvent:](&v7, sel_touchesMoved_withEvent_, a3, a4);
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  objc_super v7;

  if (!-[SCNSpriteKitEventHandler touchesEnded:withEvent:](self->_spriteKitEventHandler, "touchesEnded:withEvent:"))
  {
    v7.receiver = self;
    v7.super_class = (Class)SCNView;
    -[SCNView touchesEnded:withEvent:](&v7, sel_touchesEnded_withEvent_, a3, a4);
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  objc_super v7;

  if (!-[SCNSpriteKitEventHandler touchesCancelled:withEvent:](self->_spriteKitEventHandler, "touchesCancelled:withEvent:"))
  {
    v7.receiver = self;
    v7.super_class = (Class)SCNView;
    -[SCNView touchesCancelled:withEvent:](&v7, sel_touchesCancelled_withEvent_, a3, a4);
  }
}

- (void)pauseDisplayLink
{
  -[SCNJitterer stopIfNeeded](self->_jitterer, "stopIfNeeded");
  objc_msgSend(-[SCNView displayLink](self, "displayLink"), "setPaused:", 1);
}

- (void)resumeDisplayLink
{
  id v3;
  uint64_t v4;

  -[SCNView _createDisplayLinkIfNeeded](self, "_createDisplayLinkIfNeeded");
  v3 = -[SCNView displayLink](self, "displayLink");
  if ((*((_BYTE *)self + 464) & 2) != 0)
    v4 = 0;
  else
    v4 = -[SCNView isPlaying](self, "isPlaying") ^ 1;
  -[SCNRenderer _nextFrameTime](self->_renderer, "_nextFrameTime");
  objc_msgSend(v3, "setPaused:nextFrameTimeHint:lastUpdate:", v4);
}

- (void)didMoveToWindow
{
  objc_super v3;

  if (-[SCNView window](self, "window"))
  {
    gCurrentSCNViewFocusEnvironment = (uint64_t)self;
    *((_BYTE *)self + 464) &= ~0x10u;
    -[SCNView resumeDisplayLink](self, "resumeDisplayLink");
    -[SCNView _setNeedsDisplay](self, "_setNeedsDisplay");
  }
  v3.receiver = self;
  v3.super_class = (Class)SCNView;
  -[SCNView didMoveToWindow](&v3, sel_didMoveToWindow);
  -[SCNView _adjustBackingLayerPixelFormat](self, "_adjustBackingLayerPixelFormat");
  -[SCNView _updateBackingSize](self, "_updateBackingSize");
  -[SCNRenderer _interfaceOrientationDidChange](self->_renderer, "_interfaceOrientationDidChange");
}

- (void)willMoveToWindow:(id)a3
{
  objc_super v5;

  if (!a3)
  {
    SCNUIKitSourceNotifyViewWasRemoved(self);
    -[SCNView pauseDisplayLink](self, "pauseDisplayLink");
    *((_BYTE *)self + 464) |= 0x10u;
  }
  v5.receiver = self;
  v5.super_class = (Class)SCNView;
  -[SCNView willMoveToWindow:](&v5, sel_willMoveToWindow_, a3);
}

- (void)_flushDisplayLink
{
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, a1, a3, "Error: display link thread seems stuck", a5, a6, a7, a8, 0);
}

- (void)_enterBackground:(id)a3
{
  id AudioEngine;

  *((_BYTE *)self + 464) |= 0x40u;
  if (!-[SCNScene isPaused](-[SCNView scene](self, "scene", a3), "isPaused"))
  {
    *((_BYTE *)self + 464) |= 0x80u;
    -[SCNScene setPaused:](-[SCNView scene](self, "scene"), "setPaused:", 1);
  }
  -[SCNView pauseDisplayLink](self, "pauseDisplayLink");
  AudioEngine = C3DAudioManagerGetAudioEngine(0);
  if (AudioEngine)
    objc_msgSend(AudioEngine, "pause");
  -[SCNView _flushDisplayLink](self, "_flushDisplayLink");
}

- (void)safeAreaInsetsDidChange
{
  float64_t v3;
  float64x2_t v4;
  float64_t v5;
  float64x2_t v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SCNView;
  -[SCNView safeAreaInsetsDidChange](&v7, sel_safeAreaInsetsDidChange);
  -[SCNView safeAreaInsets](self, "safeAreaInsets");
  v4.f64[1] = v3;
  v6.f64[1] = v5;
  -[SCNRenderer set_drawableSafeAreaInsets:](self->_renderer, "set_drawableSafeAreaInsets:", *(double *)vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v6), v4).i64);
  -[SCNRenderer _interfaceOrientationDidChange](self->_renderer, "_interfaceOrientationDidChange");
}

+ (id)_currentSCNViewFocusEnvironment
{
  return (id)gCurrentSCNViewFocusEnvironment;
}

- (id)focusItemsInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id v8;
  id v9;
  void *v10;
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v12.receiver = self;
  v12.super_class = (Class)SCNView;
  v8 = -[SCNView focusItemsInRect:](&v12, sel_focusItemsInRect_);
  if (objc_msgSend(v8, "count"))
    v9 = (id)objc_msgSend(v8, "mutableCopy");
  else
    v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v10 = v9;
  -[SCNNode _appendFocusableNodesInRect:ofView:toFocusItems:](-[SCNScene rootNode](-[SCNView scene](self, "scene"), "rootNode"), "_appendFocusableNodesInRect:ofView:toFocusItems:", self, v9, x, y, width, height);
  return v10;
}

- (int64_t)_preferredFocusMovementStyle
{
  return 2;
}

void __85__SCNView_SCNDisplayLink___initializeDisplayLinkWithScreen_policy_completionHandler___block_invoke_cold_1()
{
  __assert_rtn("-[SCNView(SCNDisplayLink) _initializeDisplayLinkWithScreen:policy:completionHandler:]_block_invoke", "SCNDisplayLink_ARC.m", 96, "wg != NULL");
}

void __85__SCNView_SCNDisplayLink___initializeDisplayLinkWithScreen_policy_completionHandler___block_invoke_cold_2()
{
  __assert_rtn("-[SCNView(SCNDisplayLink) _initializeDisplayLinkWithScreen:policy:completionHandler:]_block_invoke", "SCNDisplayLink_ARC.m", 99, "ret == 0");
}

void __85__SCNView_SCNDisplayLink___initializeDisplayLinkWithScreen_policy_completionHandler___block_invoke_cold_3()
{
  __assert_rtn("-[SCNView(SCNDisplayLink) _initializeDisplayLinkWithScreen:policy:completionHandler:]_block_invoke", "SCNDisplayLink_ARC.m", 93, "ret == 0");
}

+ (void)deviceForOptions:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, a1, a3, "Error: Failed to create default Metal device.", a5, a6, a7, a8, 0);
}

- (void)switchToCameraNamed:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1DCCB8000, a2, OS_LOG_TYPE_ERROR, "Error: switchToCameraNamed: no camera named %@", (uint8_t *)&v2, 0xCu);
}

@end
