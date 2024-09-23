@implementation CHUISWidgetHostViewController

- (CHUISWidgetHostViewController)initWithWidget:(id)a3 metrics:(id)a4 widgetConfigurationIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  CHUISWidgetHostViewController *v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (CHUISSharedExtensionProvider___once != -1)
    dispatch_once(&CHUISSharedExtensionProvider___once, &__block_literal_global_787);
  v11 = (id)CHUISSharedExtensionProvider___instance;
  CHUISSceneWorkspace();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D10100], "sharedManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[CHUISPreferences sharedInstance](CHUISPreferences, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[CHUISKeybag sharedInstance](CHUISKeybag, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[CHUISWidgetHostViewController initWithWidget:metrics:widgetConfigurationIdentifier:extensionProvider:sceneWorkspace:screenshotManager:preferences:keybag:](self, "initWithWidget:metrics:widgetConfigurationIdentifier:extensionProvider:sceneWorkspace:screenshotManager:preferences:keybag:", v8, v9, v10, v11, v12, v13, v14, v15);

  return v16;
}

- (CHUISWidgetHostViewController)initWithWidget:(id)a3 metrics:(id)a4 widgetConfigurationIdentifier:(id)a5 extensionProvider:(id)a6 sceneWorkspace:(id)a7 screenshotManager:(id)a8 preferences:(id)a9 keybag:(id)a10
{
  id v16;
  id v17;
  CHUISWidgetHostViewController *v18;
  CHUISWidgetHostViewController *v19;
  uint64_t v20;
  CHSWidget *widget;
  uint64_t v22;
  CHSWidgetMetrics *metrics;
  NSObject *v24;
  uint64_t v25;
  NSMutableArray *detachedSceneTimerEvaluationReasons;
  CHSWidgetTintParameters *tintParameters;
  uint64_t v28;
  CHSWidgetRenderScheme *renderScheme;
  id v30;
  void *v31;
  uint64_t v32;
  BSInvalidatable *stateCaptureAssertion;
  NSObject *v34;
  void *v35;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id location;
  objc_super v45;

  v16 = a3;
  v17 = a4;
  v42 = a5;
  v41 = a6;
  v40 = a7;
  v39 = a8;
  v38 = a9;
  v37 = a10;
  v45.receiver = self;
  v45.super_class = (Class)CHUISWidgetHostViewController;
  v18 = -[CHUISWidgetHostViewController initWithNibName:bundle:](&v45, sel_initWithNibName_bundle_, 0, 0);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_sceneWorkspace, a7);
    objc_storeStrong((id *)&v19->_preferences, a9);
    v20 = objc_msgSend(v16, "copy");
    widget = v19->_widget;
    v19->_widget = (CHSWidget *)v20;

    v22 = objc_msgSend(v17, "copy");
    metrics = v19->_metrics;
    v19->_metrics = (CHSWidgetMetrics *)v22;

    objc_storeStrong((id *)&v19->_widgetConfigurationIdentifier, a5);
    v19->_contentType = 0;
    v19->_colorScheme = 0;
    v19->_requestedPresentationMode = 1;
    v19->_visibleEntryShouldSnapshot = 1;
    v19->_animationsPaused = 0;
    v19->_contentPaused = 0;
    CHUISLogViewController();
    v24 = objc_claimAutoreleasedReturnValue();
    v19->_signpostID = os_signpost_id_generate(v24);

    objc_storeStrong((id *)&v19->_screenshotManager, a8);
    v19->_drawSystemBackgroundMaterialIfNecessary = 1;
    objc_storeStrong((id *)&v19->_extensionProvider, a6);
    v19->_detachedSceneTimerInterval = 30.0;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v25 = objc_claimAutoreleasedReturnValue();
    detachedSceneTimerEvaluationReasons = v19->_detachedSceneTimerEvaluationReasons;
    v19->_detachedSceneTimerEvaluationReasons = (NSMutableArray *)v25;

    objc_storeStrong((id *)&v19->_keybag, a10);
    v19->_inSecureEnvironmentTriState = 0;
    tintParameters = v19->_tintParameters;
    v19->_tintParameters = 0;

    v19->_metricsDefineSize = 1;
    v19->_widgetPriority = 0;
    v19->_prefersUnredactedContentInLowLuminanceEnvironment = 0;
    objc_msgSend(v16, "family");
    v19->_clipBehavior = CHSWidgetFamilyIsAccessory();
    objc_msgSend(v16, "family");
    v28 = objc_msgSend(objc_alloc(MEMORY[0x1E0D10250]), "initWithRenderingMode:backgroundViewPolicy:", 0, CHSWidgetFamilyIsAccessory());
    renderScheme = v19->_renderScheme;
    v19->_renderScheme = (CHSWidgetRenderScheme *)v28;

    -[CHUISWidgetHostViewController _resetLogDigests](v19, "_resetLogDigests");
    objc_initWeak(&location, v19);
    v30 = MEMORY[0x1E0C80D38];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CHUISWidgetHostViewController - %p"), v19);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_copyWeak(&v43, &location);
    BSLogAddStateCaptureBlockWithTitle();
    v32 = objc_claimAutoreleasedReturnValue();
    stateCaptureAssertion = v19->_stateCaptureAssertion;
    v19->_stateCaptureAssertion = (BSInvalidatable *)v32;

    CHUISLogViewController();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
      -[CHUISWidgetHostViewController initWithWidget:metrics:widgetConfigurationIdentifier:extensionProvider:sceneWorkspace:screenshotManager:preferences:keybag:].cold.1();

    -[CHUISWidgetHostViewController _updateDescriptorIfNecessary](v19, "_updateDescriptorIfNecessary");
    -[CHUISWidgetHostViewController _evaluateEffectivePresentationMode](v19, "_evaluateEffectivePresentationMode");
    -[CHUISWidgetHostViewController _updateBackgroundMaterialAndColor](v19, "_updateBackgroundMaterialAndColor");
    -[CHUISWidgetHostViewController _setCanAppearInSecureEnvironment:force:](v19, "_setCanAppearInSecureEnvironment:force:", v19->_canAppearInSecureEnvironment, 1);
    -[CHSWidgetExtensionProvider registerObserver:](v19->_extensionProvider, "registerObserver:", v19);
    +[_CHUISWidgetHostViewControllerCollection sharedInstance](_CHUISWidgetHostViewControllerCollection, "sharedInstance");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "noteCreated:", v19);

    objc_destroyWeak(&v43);
    objc_destroyWeak(&location);
  }

  return v19;
}

id __156__CHUISWidgetHostViewController_initWithWidget_metrics_widgetConfigurationIdentifier_extensionProvider_sceneWorkspace_screenshotManager_preferences_keybag___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_stateDumpDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)dealloc
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3(&dword_1B711E000, v0, v1, "[%p-%{public}@] Destroyed.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

+ (NSArray)viewControllers
{
  void *v2;
  void *v3;

  +[_CHUISWidgetHostViewControllerCollection sharedInstance](_CHUISWidgetHostViewControllerCollection, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewControllers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)prewarmContent
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_1B711E000, v0, v1, "Unable to prewarm content on an invalidated widget view controller.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)requestLaunch
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_1B711E000, v0, v1, "Unable to select an invalidated widget view controller.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (id)userInfo
{
  BSDispatchQueueAssertMain();
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  id v4;
  id userInfo;

  v4 = a3;
  BSDispatchQueueAssertMain();
  userInfo = self->_userInfo;
  self->_userInfo = v4;

}

- (CHSWidget)widget
{
  BSDispatchQueueAssertMain();
  return self->_widget;
}

- (void)setWidget:(id)a3
{
  id v4;
  NSObject *v5;
  CHSWidget *v6;
  CHSWidget *widget;
  NSObject *v8;
  NSString *cachedSceneLogDigest;
  uint64_t v10;
  NSObject *v11;
  FBScene *scene;
  CHSWidget *v13;
  NSObject *v14;
  unint64_t effectivePresentationMode;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  CHUISWidgetHostViewController *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  CHSWidget *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  BSDispatchQueueAssertMain();
  if (self->_invalidated)
  {
    CHUISLogViewController();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[CHUISWidgetHostViewController setWidget:].cold.1();
  }
  else
  {
    -[CHUISWidgetHostViewController widget](self, "widget");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (CHSWidget *)objc_msgSend(v4, "copy");
    widget = self->_widget;
    self->_widget = v6;

    -[CHUISWidgetHostViewController _resetLogDigests](self, "_resetLogDigests");
    CHUISLogViewController();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      cachedSceneLogDigest = self->_cachedSceneLogDigest;
      *(_DWORD *)buf = 134218242;
      v19 = self;
      v20 = 2114;
      v21 = cachedSceneLogDigest;
      _os_log_impl(&dword_1B711E000, v8, OS_LOG_TYPE_DEFAULT, "[%p] New widget set: %{public}@", buf, 0x16u);
    }

    -[CHUISWidgetHostViewController _updateDescriptorIfNecessary](self, "_updateDescriptorIfNecessary");
    if (-[NSObject matchesPersonality:](v5, "matchesPersonality:", v4)
      && (v10 = -[NSObject family](v5, "family"), v10 == objc_msgSend(v4, "family")))
    {
      if (self->_scene)
      {
        CHUISLogViewController();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          scene = self->_scene;
          v13 = self->_widget;
          *(_DWORD *)buf = 134218498;
          v19 = self;
          v20 = 2048;
          v21 = scene;
          v22 = 2114;
          v23 = v13;
          _os_log_impl(&dword_1B711E000, v11, OS_LOG_TYPE_DEFAULT, "[%p] Updating scene settings on scene (%p) with new widget: %{public}@", buf, 0x20u);
        }

        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __43__CHUISWidgetHostViewController_setWidget___block_invoke;
        v16[3] = &unk_1E6B84C28;
        v17 = v4;
        -[CHUISWidgetHostViewController modifySceneSettings:](self, "modifySceneSettings:", v16);

      }
    }
    else
    {
      CHUISLogViewController();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v19 = self;
        _os_log_impl(&dword_1B711E000, v14, OS_LOG_TYPE_DEFAULT, "[%p] Tearing down scene for new widget set, and re-activating", buf, 0xCu);
      }

      effectivePresentationMode = self->_effectivePresentationMode;
      -[CHUISWidgetHostViewController _tearDownScene](self, "_tearDownScene");
      -[CHUISWidgetHostViewController _setEffectivePresentationMode:](self, "_setEffectivePresentationMode:", 0);
      -[CHUISWidgetHostViewController _setEffectivePresentationMode:](self, "_setEffectivePresentationMode:", effectivePresentationMode);
    }
  }

}

uint64_t __43__CHUISWidgetHostViewController_setWidget___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "setWidget:", *(_QWORD *)(a1 + 32));
  return 0;
}

- (unint64_t)presentationMode
{
  BSDispatchQueueAssertMain();
  return self->_requestedPresentationMode;
}

- (unint64_t)contentType
{
  BSDispatchQueueAssertMain();
  return self->_contentType;
}

- (void)setContentType:(unint64_t)a3
{
  NSObject *v5;
  NSString *cachedSceneLogDigest;
  __CFString *v7;
  __CFString *v8;
  _QWORD v9[5];
  uint8_t buf[4];
  CHUISWidgetHostViewController *v11;
  __int16 v12;
  NSString *v13;
  __int16 v14;
  __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  BSDispatchQueueAssertMain();
  if (self->_contentType != a3)
  {
    self->_contentType = a3;
    CHUISLogViewController();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      cachedSceneLogDigest = self->_cachedSceneLogDigest;
      v7 = CFSTR("preview");
      if (!a3)
        v7 = CFSTR("timeline");
      v8 = v7;
      *(_DWORD *)buf = 134218498;
      v11 = self;
      v12 = 2114;
      v13 = cachedSceneLogDigest;
      v14 = 2114;
      v15 = v8;
      _os_log_impl(&dword_1B711E000, v5, OS_LOG_TYPE_DEFAULT, "[%p-%{public}@] Content type changed to %{public}@", buf, 0x20u);

    }
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __48__CHUISWidgetHostViewController_setContentType___block_invoke;
    v9[3] = &__block_descriptor_40_e78___UIApplicationSceneTransitionContext_16__0__CHUISMutableWidgetSceneSettings_8l;
    v9[4] = a3;
    -[CHUISWidgetHostViewController modifySceneSettings:](self, "modifySceneSettings:", v9);
  }
}

uint64_t __48__CHUISWidgetHostViewController_setContentType___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "setContentType:", *(_QWORD *)(a1 + 32));
  return 0;
}

- (unint64_t)colorScheme
{
  BSDispatchQueueAssertMain();
  return self->_colorScheme;
}

- (void)setColorScheme:(unint64_t)a3
{
  UIVisualEffectView *materialView;
  void *v6;
  NSObject *v7;
  NSString *cachedSceneLogDigest;
  void *v9;
  _QWORD v10[5];
  uint8_t buf[4];
  CHUISWidgetHostViewController *v12;
  __int16 v13;
  NSString *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  BSDispatchQueueAssertMain();
  if (self->_colorScheme != a3)
  {
    self->_colorScheme = a3;
    materialView = self->_materialView;
    -[CHUISWidgetHostViewController _effectiveBackgroundColor](self, "_effectiveBackgroundColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView setBackgroundColor:](materialView, "setBackgroundColor:", v6);

    CHUISLogViewController();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      cachedSceneLogDigest = self->_cachedSceneLogDigest;
      NSStringFromCHSColorScheme();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v12 = self;
      v13 = 2114;
      v14 = cachedSceneLogDigest;
      v15 = 2114;
      v16 = v9;
      _os_log_impl(&dword_1B711E000, v7, OS_LOG_TYPE_DEFAULT, "[%p-%{public}@] Color scheme changed to %{public}@", buf, 0x20u);

    }
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __48__CHUISWidgetHostViewController_setColorScheme___block_invoke;
    v10[3] = &__block_descriptor_40_e78___UIApplicationSceneTransitionContext_16__0__CHUISMutableWidgetSceneSettings_8l;
    v10[4] = a3;
    -[CHUISWidgetHostViewController modifySceneSettings:](self, "modifySceneSettings:", v10);
  }
}

uint64_t __48__CHUISWidgetHostViewController_setColorScheme___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "setColorScheme:", *(_QWORD *)(a1 + 32));
  return 0;
}

- (BOOL)canAppearInSecureEnvironment
{
  BSDispatchQueueAssertMain();
  return self->_canAppearInSecureEnvironment;
}

- (void)setCanAppearInSecureEnvironment:(BOOL)a3
{
  -[CHUISWidgetHostViewController _setCanAppearInSecureEnvironment:force:](self, "_setCanAppearInSecureEnvironment:force:", a3, 0);
}

- (BOOL)prefersUnredactedContentInLowLuminanceEnvironment
{
  BSDispatchQueueAssertMain();
  return self->_prefersUnredactedContentInLowLuminanceEnvironment;
}

- (void)setPrefersUnredactedContentInLowLuminanceEnvironment:(BOOL)a3
{
  _QWORD v5[4];
  BOOL v6;

  BSDispatchQueueAssertMain();
  if ((BSEqualBools() & 1) == 0)
  {
    self->_prefersUnredactedContentInLowLuminanceEnvironment = a3;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __86__CHUISWidgetHostViewController_setPrefersUnredactedContentInLowLuminanceEnvironment___block_invoke;
    v5[3] = &__block_descriptor_33_e78___UIApplicationSceneTransitionContext_16__0__CHUISMutableWidgetSceneSettings_8l;
    v6 = a3;
    -[CHUISWidgetHostViewController modifySceneSettings:](self, "modifySceneSettings:", v5);
  }
}

uint64_t __86__CHUISWidgetHostViewController_setPrefersUnredactedContentInLowLuminanceEnvironment___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "setPrefersUnredactedContentInLowLuminanceEnvironment:", *(unsigned __int8 *)(a1 + 32));
  return 0;
}

- (BOOL)supportsLowLuminance
{
  BSDispatchQueueAssertMain();
  return self->_supportsLowLuminance;
}

- (void)setSupportsLowLuminance:(BOOL)a3
{
  _QWORD v5[4];
  BOOL v6;

  BSDispatchQueueAssertMain();
  if ((BSEqualBools() & 1) == 0)
  {
    self->_supportsLowLuminance = a3;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __57__CHUISWidgetHostViewController_setSupportsLowLuminance___block_invoke;
    v5[3] = &__block_descriptor_33_e78___UIApplicationSceneTransitionContext_16__0__CHUISMutableWidgetSceneSettings_8l;
    v6 = a3;
    -[CHUISWidgetHostViewController modifySceneSettings:](self, "modifySceneSettings:", v5);
  }
}

uint64_t __57__CHUISWidgetHostViewController_setSupportsLowLuminance___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "setSupportsLowLuminance:", *(unsigned __int8 *)(a1 + 32));
  return 0;
}

- (void)setPresentationMode:(unint64_t)a3
{
  NSObject *v5;
  NSString *cachedSceneLogDigest;
  unint64_t v7;
  const __CFString *v8;
  NSObject *v9;
  int v10;
  CHUISWidgetHostViewController *v11;
  __int16 v12;
  NSString *v13;
  __int16 v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  BSDispatchQueueAssertMain();
  if (self->_invalidated)
  {
    CHUISLogViewController();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[CHUISWidgetHostViewController setPresentationMode:].cold.1();

  }
  else if (self->_requestedPresentationMode != a3)
  {
    self->_requestedPresentationMode = a3;
    CHUISLogViewController();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      cachedSceneLogDigest = self->_cachedSceneLogDigest;
      v7 = self->_requestedPresentationMode - 1;
      if (v7 > 2)
        v8 = CFSTR("none");
      else
        v8 = off_1E6B852E0[v7];
      v10 = 134218498;
      v11 = self;
      v12 = 2114;
      v13 = cachedSceneLogDigest;
      v14 = 2114;
      v15 = v8;
      _os_log_impl(&dword_1B711E000, v5, OS_LOG_TYPE_DEFAULT, "[%p-%{public}@] Requested mode changed to %{public}@.", (uint8_t *)&v10, 0x20u);
    }

    -[CHUISWidgetHostViewController _evaluateEffectivePresentationMode](self, "_evaluateEffectivePresentationMode");
  }
}

- (unint64_t)visibility
{
  unint64_t result;

  BSDispatchQueueAssertMain();
  result = (unint64_t)self->_visibilitySettings;
  if (result)
  {
    if (objc_msgSend((id)result, "isSettled"))
      return 2;
    else
      return 1;
  }
  return result;
}

- (void)setVisibility:(unint64_t)a3
{
  NSObject *v5;
  CHUISMutableWidgetVisibilitySettings *v6;
  _QWORD v7[4];
  BOOL v8;

  BSDispatchQueueAssertMain();
  if (self->_invalidated)
  {
    CHUISLogViewController();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[CHUISWidgetHostViewController setVisibility:].cold.1();

  }
  else if (a3 - 1 >= 2)
  {
    if (!a3)
      -[CHUISWidgetHostViewController _setVisibilitySettings:](self, "_setVisibilitySettings:", 0);
  }
  else if (self->_visibilitySettings)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __47__CHUISWidgetHostViewController_setVisibility___block_invoke;
    v7[3] = &__block_descriptor_33_e46_v16__0__CHUISMutableWidgetVisibilitySettings_8l;
    v8 = a3 == 2;
    -[CHUISWidgetHostViewController _modifyVisibilitySettings:](self, "_modifyVisibilitySettings:", v7);
  }
  else
  {
    v6 = objc_alloc_init(CHUISMutableWidgetVisibilitySettings);
    -[CHUISMutableWidgetVisibilitySettings setSettled:](v6, "setSettled:", a3 == 2);
    -[CHUISMutableWidgetVisibilitySettings setVisibleBounds:](v6, "setVisibleBounds:", *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
    -[CHUISWidgetHostViewController _setVisibilitySettings:](self, "_setVisibilitySettings:", v6);

  }
}

uint64_t __47__CHUISWidgetHostViewController_setVisibility___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSettled:", *(unsigned __int8 *)(a1 + 32));
}

- (CGRect)visibleBounds
{
  CHUISWidgetVisibilitySettings *visibilitySettings;
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  BSDispatchQueueAssertMain();
  visibilitySettings = self->_visibilitySettings;
  if (visibilitySettings)
  {
    -[CHUISWidgetVisibilitySettings visibleBounds](visibilitySettings, "visibleBounds");
  }
  else
  {
    v4 = *MEMORY[0x1E0C9D628];
    v5 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v6 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v7 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (void)setVisibleBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  NSObject *v8;
  _QWORD v9[8];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  BSDispatchQueueAssertMain();
  if (self->_invalidated)
  {
    CHUISLogViewController();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[CHUISWidgetHostViewController setVisibleBounds:].cold.1();

  }
  else
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __50__CHUISWidgetHostViewController_setVisibleBounds___block_invoke;
    v9[3] = &__block_descriptor_64_e46_v16__0__CHUISMutableWidgetVisibilitySettings_8l;
    *(CGFloat *)&v9[4] = x;
    *(CGFloat *)&v9[5] = y;
    *(CGFloat *)&v9[6] = width;
    *(CGFloat *)&v9[7] = height;
    -[CHUISWidgetHostViewController _modifyVisibilitySettings:](self, "_modifyVisibilitySettings:", v9);
  }
}

uint64_t __50__CHUISWidgetHostViewController_setVisibleBounds___block_invoke(double *a1, void *a2)
{
  return objc_msgSend(a2, "setVisibleBounds:", a1[4], a1[5], a1[6], a1[7]);
}

- (BOOL)areAnimationsPaused
{
  BSDispatchQueueAssertMain();
  return self->_animationsPaused;
}

- (void)setAnimationsPaused:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  NSObject *v6;
  _QWORD v7[4];
  BOOL v8;

  v3 = a3;
  BSDispatchQueueAssertMain();
  if (self->_invalidated)
  {
    CHUISLogViewController();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[CHUISWidgetHostViewController setAnimationsPaused:].cold.2();

  }
  else if (self->_animationsPaused != v3)
  {
    self->_animationsPaused = v3;
    if (self->_scene)
    {
      CHUISLogViewController();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        -[CHUISWidgetHostViewController setAnimationsPaused:].cold.1();

      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __53__CHUISWidgetHostViewController_setAnimationsPaused___block_invoke;
      v7[3] = &__block_descriptor_33_e78___UIApplicationSceneTransitionContext_16__0__CHUISMutableWidgetSceneSettings_8l;
      v8 = v3;
      -[CHUISWidgetHostViewController modifySceneSettings:](self, "modifySceneSettings:", v7);
    }
  }
}

uint64_t __53__CHUISWidgetHostViewController_setAnimationsPaused___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "setAnimationsPaused:", *(unsigned __int8 *)(a1 + 32));
  return 0;
}

- (BOOL)isContentPaused
{
  BSDispatchQueueAssertMain();
  return self->_contentPaused;
}

- (void)setContentPaused:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  NSObject *v6;
  _QWORD v7[4];
  BOOL v8;

  v3 = a3;
  BSDispatchQueueAssertMain();
  if (self->_invalidated)
  {
    CHUISLogViewController();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[CHUISWidgetHostViewController setContentPaused:].cold.2();

  }
  else if (self->_contentPaused != v3)
  {
    self->_contentPaused = v3;
    if (self->_scene)
    {
      CHUISLogViewController();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        -[CHUISWidgetHostViewController setContentPaused:].cold.1();

      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __50__CHUISWidgetHostViewController_setContentPaused___block_invoke;
      v7[3] = &__block_descriptor_33_e78___UIApplicationSceneTransitionContext_16__0__CHUISMutableWidgetSceneSettings_8l;
      v8 = v3;
      -[CHUISWidgetHostViewController modifySceneSettings:](self, "modifySceneSettings:", v7);
    }
  }
}

uint64_t __50__CHUISWidgetHostViewController_setContentPaused___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "setContentPaused:", *(unsigned __int8 *)(a1 + 32));
  return 0;
}

- (CHSWidgetTintParameters)tintParameters
{
  BSDispatchQueueAssertMain();
  return self->_tintParameters;
}

- (void)setTintParameters:(id)a3
{
  -[CHUISWidgetHostViewController setTintParameters:fencingAnimations:](self, "setTintParameters:fencingAnimations:", a3, 0);
}

- (void)setTintParameters:(id)a3 fencingAnimations:(BOOL)a4
{
  id v6;
  CHSWidgetTintParameters *v7;
  CHSWidgetTintParameters *tintParameters;
  void *v9;
  CHSWidgetTintParameters *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  _QWORD v15[5];
  BOOL v16;

  v6 = a3;
  BSDispatchQueueAssertMain();
  if (self->_invalidated)
  {
    CHUISLogViewController();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      -[CHUISWidgetHostViewController setTintParameters:fencingAnimations:].cold.3();

  }
  else if ((BSEqualObjects() & 1) == 0)
  {
    v7 = (CHSWidgetTintParameters *)objc_msgSend(v6, "copy");
    tintParameters = self->_tintParameters;
    self->_tintParameters = v7;

    if (!self->_didSetRenderSchemeExplicitly)
    {
      v9 = (void *)-[CHSWidgetRenderScheme mutableCopy](self->_renderScheme, "mutableCopy");
      v10 = self->_tintParameters;
      if (v10)
        v11 = -[CHSWidgetTintParameters effectiveRenderingMode](v10, "effectiveRenderingMode");
      else
        v11 = 0;
      objc_msgSend(v9, "setRenderingMode:", v11);
      -[CHUISWidgetHostViewController _implicitSetRenderScheme:](self, "_implicitSetRenderScheme:", v9);

    }
    if (self->_scene)
    {
      CHUISLogViewController();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        -[CHUISWidgetHostViewController setTintParameters:fencingAnimations:].cold.2();

      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __69__CHUISWidgetHostViewController_setTintParameters_fencingAnimations___block_invoke;
      v15[3] = &unk_1E6B84E20;
      v15[4] = self;
      v16 = a4;
      -[CHUISWidgetHostViewController modifySceneSettings:](self, "modifySceneSettings:", v15);
    }
    else
    {
      CHUISLogViewController();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        -[CHUISWidgetHostViewController setTintParameters:fencingAnimations:].cold.1();

    }
    -[CHUISWidgetHostViewController _updateVibrancyEffectView](self, "_updateVibrancyEffectView");
    -[CHUISWidgetHostViewController _updatePersistedSnapshotContentIfNecessary](self, "_updatePersistedSnapshotContentIfNecessary");
  }

}

id __69__CHUISWidgetHostViewController_setTintParameters_fencingAnimations___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  objc_msgSend(a2, "setTintParameters:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1336));
  if (*(_BYTE *)(a1 + 40))
  {
    v3 = objc_alloc_init(MEMORY[0x1E0DC3490]);
    objc_msgSend(MEMORY[0x1E0DC3BC0], "_synchronizedDrawingFence");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAnimationFence:", v4);

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)setVibrancyConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_vibrancyConfiguration, a3);
  -[CHUISWidgetHostViewController _updateVibrancyEffectView](self, "_updateVibrancyEffectView");
}

- (CHSInlineTextParameters)inlineTextParameters
{
  BSDispatchQueueAssertMain();
  return (CHSInlineTextParameters *)(id)-[CHSInlineTextParameters copy](self->_inlineTextParameters, "copy");
}

- (void)setInlineTextParameters:(id)a3
{
  id v4;
  CHSInlineTextParameters *v5;
  CHSInlineTextParameters *inlineTextParameters;
  NSObject *v7;
  NSObject *v8;
  _QWORD v9[5];

  v4 = a3;
  BSDispatchQueueAssertMain();
  if (self->_invalidated)
  {
    CHUISLogViewController();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[CHUISWidgetHostViewController setInlineTextParameters:].cold.2();

  }
  else if ((BSEqualObjects() & 1) == 0)
  {
    v5 = (CHSInlineTextParameters *)objc_msgSend(v4, "copy");
    inlineTextParameters = self->_inlineTextParameters;
    self->_inlineTextParameters = v5;

    if (self->_scene)
    {
      CHUISLogViewController();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        -[CHUISWidgetHostViewController setInlineTextParameters:].cold.1();

      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __57__CHUISWidgetHostViewController_setInlineTextParameters___block_invoke;
      v9[3] = &unk_1E6B84C28;
      v9[4] = self;
      -[CHUISWidgetHostViewController modifySceneSettings:](self, "modifySceneSettings:", v9);
    }
  }

}

uint64_t __57__CHUISWidgetHostViewController_setInlineTextParameters___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "setInlineTextParameters:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1344));
  return 0;
}

- (BOOL)showsWidgetLabel
{
  BSDispatchQueueAssertMain();
  return self->_showsWidgetLabel;
}

- (void)setShowsWidgetLabel:(BOOL)a3
{
  _QWORD v5[5];

  BSDispatchQueueAssertMain();
  if ((BSEqualBools() & 1) == 0)
  {
    self->_showsWidgetLabel = a3;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __53__CHUISWidgetHostViewController_setShowsWidgetLabel___block_invoke;
    v5[3] = &unk_1E6B84C28;
    v5[4] = self;
    -[CHUISWidgetHostViewController modifySceneSettings:](self, "modifySceneSettings:", v5);
  }
}

uint64_t __53__CHUISWidgetHostViewController_setShowsWidgetLabel___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "setShowsWidgetLabel:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 1352));
  return 0;
}

- (BOOL)isInteractionDisabled
{
  BSDispatchQueueAssertMain();
  return self->_interactionDisabled;
}

- (void)setInteractionDisabled:(BOOL)a3
{
  _QWORD v5[5];

  BSDispatchQueueAssertMain();
  if ((BSEqualBools() & 1) == 0)
  {
    self->_interactionDisabled = a3;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __56__CHUISWidgetHostViewController_setInteractionDisabled___block_invoke;
    v5[3] = &unk_1E6B84C28;
    v5[4] = self;
    -[CHUISWidgetHostViewController modifySceneSettings:](self, "modifySceneSettings:", v5);
  }
}

uint64_t __56__CHUISWidgetHostViewController_setInteractionDisabled___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "setInteractionDisabled:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 1353));
  return 0;
}

- (BOOL)shouldVisibleEntrySnapshot
{
  BSDispatchQueueAssertMain();
  return self->_visibleEntryShouldSnapshot;
}

- (void)setVisibleEntryShouldSnapshot:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  NSObject *v6;
  _QWORD v7[5];

  v3 = a3;
  BSDispatchQueueAssertMain();
  if (self->_invalidated)
  {
    CHUISLogViewController();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[CHUISWidgetHostViewController setVisibleEntryShouldSnapshot:].cold.2();

  }
  else if (self->_visibleEntryShouldSnapshot != v3)
  {
    self->_visibleEntryShouldSnapshot = v3;
    if (self->_scene)
    {
      CHUISLogViewController();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        -[CHUISWidgetHostViewController setVisibleEntryShouldSnapshot:].cold.1();

      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __63__CHUISWidgetHostViewController_setVisibleEntryShouldSnapshot___block_invoke;
      v7[3] = &unk_1E6B84C28;
      v7[4] = self;
      -[CHUISWidgetHostViewController modifySceneSettings:](self, "modifySceneSettings:", v7);
    }
  }
}

uint64_t __63__CHUISWidgetHostViewController_setVisibleEntryShouldSnapshot___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "setVisibleEntryShouldSnapshot:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 1210));
  return 0;
}

- (void)setShouldShareTouchesWithHost:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v6;

  v3 = a3;
  BSDispatchQueueAssertMain();
  if (!self->_invalidated || !v3)
  {
    if (self->_shouldShareTouchesWithHost != v3)
    {
      self->_shouldShareTouchesWithHost = v3;
      if (v3)
        -[CHUISWidgetHostViewController _updateTouchDeliveryPolicies](self, "_updateTouchDeliveryPolicies");
      else
        -[CHUISWidgetHostViewController _clearTouchDeliveryPolicies](self, "_clearTouchDeliveryPolicies");
    }
  }
  else
  {
    CHUISLogViewController();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[CHUISWidgetHostViewController setShouldShareTouchesWithHost:].cold.1();

  }
}

- (id)cancelTouchesForCurrentEventInHostedContent
{
  void *v3;
  id *v4;
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  CHUISWidgetHostCancelTouchesAssertion *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSString *cachedSceneLogDigest;
  CHUISWidgetHostCancelTouchesAssertion *v19;
  NSObject *v20;
  NSString *v21;
  NSObject *v22;
  NSString *v23;
  NSObject *v25;
  void *v26;
  id *v27;
  void *v28;
  void *v29;
  CHUISWidgetHostViewController *v30;
  NSObject *obj;
  id v32;
  CHUISWidgetHostCancelTouchesAssertion *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;
  uint64_t v39;
  void (*v40)(uint64_t, void *);
  void *v41;
  id v42;
  id location;
  uint8_t buf[4];
  CHUISWidgetHostViewController *v45;
  __int16 v46;
  NSString *v47;
  __int16 v48;
  CHUISWidgetHostCancelTouchesAssertion *v49;
  __int16 v50;
  _BYTE v51[14];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  BSDispatchQueueAssertMain();
  if (!self->_invalidated)
  {
    v30 = self;
    objc_initWeak(&location, self);
    v38 = MEMORY[0x1E0C809B0];
    v39 = 3221225472;
    v40 = __76__CHUISWidgetHostViewController_cancelTouchesForCurrentEventInHostedContent__block_invoke;
    v41 = &unk_1E6B84E48;
    v27 = &v42;
    objc_copyWeak(&v42, &location);
    BKSTouchDeliveryPolicyServerGetProxyWithErrorHandler();
    v33 = (CHUISWidgetHostCancelTouchesAssertion *)objc_claimAutoreleasedReturnValue();
    -[CHUISWidgetHostViewController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_window");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = (id *)MEMORY[0x1E0DC4730];
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(*v4, "_touchesEventForWindow:", v29);
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = (void *)v5;
      if (v33 && v5)
      {
        v28 = (void *)v5;
        v7 = 0.0;
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v6, "_initialTouchTimestampForWindow:", v29);
          v7 = v8;
        }
        -[FBScene layerManager](v30->_scene, "layerManager");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "layers");
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        v32 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v36 = 0u;
        v37 = 0u;
        v34 = 0u;
        v35 = 0u;
        obj = v26;
        v10 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v34, v52, 16);
        if (v10)
        {
          v11 = *(_QWORD *)v35;
          do
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v35 != v11)
                objc_enumerationMutation(obj);
              v13 = objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * i), "contextID", v26, v27, v28);
              v14 = (CHUISWidgetHostCancelTouchesAssertion *)objc_alloc_init(MEMORY[0x1E0D00E10]);
              objc_msgSend(MEMORY[0x1E0D00E08], "policyCancelingTouchesDeliveredToContextId:withInitialTouchTimestamp:", v13, v7);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              -[CHUISWidgetHostCancelTouchesAssertion endpoint](v14, "endpoint");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "setAssertionEndpoint:", v16);

              -[CHUISWidgetHostCancelTouchesAssertion ipc_addPolicy:](v33, "ipc_addPolicy:", v15);
              CHUISLogViewControllerTouch();
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
              {
                cachedSceneLogDigest = v30->_cachedSceneLogDigest;
                *(_DWORD *)buf = 134219010;
                v45 = v30;
                v46 = 2114;
                v47 = cachedSceneLogDigest;
                v48 = 2114;
                v49 = v14;
                v50 = 1024;
                *(_DWORD *)v51 = v13;
                *(_WORD *)&v51[4] = 2114;
                *(_QWORD *)&v51[6] = v15;
                _os_log_impl(&dword_1B711E000, v17, OS_LOG_TYPE_DEFAULT, "[%p-%{public}@] Acquired cancel touches assertion: %{public}@ (context id: %i, policy: %{public}@)", buf, 0x30u);
              }

              objc_msgSend(v32, "addObject:", v14);
            }
            v10 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v34, v52, 16);
          }
          while (v10);
        }

        v19 = -[CHUISWidgetHostCancelTouchesAssertion initWithAssertions:]([CHUISWidgetHostCancelTouchesAssertion alloc], "initWithAssertions:", v32);
        CHUISLogViewControllerTouch();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          v21 = v30->_cachedSceneLogDigest;
          *(_DWORD *)buf = 134218498;
          v45 = v30;
          v46 = 2114;
          v47 = v21;
          v48 = 2114;
          v49 = v19;
          _os_log_impl(&dword_1B711E000, v20, OS_LOG_TYPE_DEFAULT, "[%p-%{public}@] Made cancel touches group assertion: %{public}@", buf, 0x20u);
        }

        v22 = obj;
LABEL_23:

        objc_destroyWeak(v27);
        objc_destroyWeak(&location);
        return v19;
      }
    }
    else
    {
      v6 = 0;
    }
    v28 = v6;
    CHUISLogViewControllerTouch();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = v30->_cachedSceneLogDigest;
      *(_DWORD *)buf = 134218754;
      v45 = v30;
      v46 = 2114;
      v47 = v23;
      v48 = 2112;
      v49 = v33;
      v50 = 2114;
      *(_QWORD *)v51 = v6;
      _os_log_impl(&dword_1B711E000, v22, OS_LOG_TYPE_DEFAULT, "[%p-%{public}@] Did not make cancel touches group assertion because of server: %@, or touchesEvent: %{public}@", buf, 0x2Au);
    }
    v19 = 0;
    goto LABEL_23;
  }
  CHUISLogViewController();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
    -[CHUISWidgetHostViewController cancelTouchesForCurrentEventInHostedContent].cold.1();

  v19 = 0;
  return v19;
}

void __76__CHUISWidgetHostViewController_cancelTouchesForCurrentEventInHostedContent__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  NSObject *v5;
  uint64_t v6;
  int v7;
  _QWORD *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    CHUISLogViewControllerTouch();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = WeakRetained[138];
      v7 = 134218498;
      v8 = WeakRetained;
      v9 = 2114;
      v10 = v6;
      v11 = 2114;
      v12 = v3;
      _os_log_impl(&dword_1B711E000, v5, OS_LOG_TYPE_DEFAULT, "[%p-%{public}@] Sending cancellation touch delivery policy failed with error: %{public}@", (uint8_t *)&v7, 0x20u);
    }

  }
}

- (BOOL)drawSystemBackgroundMaterialIfNecessary
{
  BSDispatchQueueAssertMain();
  return self->_drawSystemBackgroundMaterialIfNecessary;
}

- (void)setDrawSystemBackgroundMaterialIfNecessary:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;

  v3 = a3;
  BSDispatchQueueAssertMain();
  if (self->_invalidated)
  {
    CHUISLogViewController();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[CHUISWidgetHostViewController setDrawSystemBackgroundMaterialIfNecessary:].cold.1();

  }
  else if (self->_drawSystemBackgroundMaterialIfNecessary != v3)
  {
    self->_drawSystemBackgroundMaterialIfNecessary = v3;
    -[CHUISWidgetHostViewController _updateBackgroundMaterialAndColor](self, "_updateBackgroundMaterialAndColor");
  }
}

- (BOOL)usesSystemBackgroundMaterial
{
  int v3;

  BSDispatchQueueAssertMain();
  v3 = -[CHSWidgetDescriptor wantsMaterialBackgroundForFamily:](self->_descriptor, "wantsMaterialBackgroundForFamily:", -[CHSWidget family](self->_widget, "family"));
  if (v3)
    LOBYTE(v3) = -[CHSWidgetRenderScheme backgroundViewPolicy](self->_renderScheme, "backgroundViewPolicy") == 0;
  return v3;
}

- (UIView)snapshotView
{
  return (UIView *)-[CHUISWidgetHostViewController _snapshotViewIgnoringVibrancyEffect:](self, "_snapshotViewIgnoringVibrancyEffect:", 0);
}

- (id)_snapshotViewIgnoringVibrancyEffect:(BOOL)a3
{
  FBScene *v5;
  FBScene *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v19;

  BSDispatchQueueAssertMain();
  if (self->_invalidated)
  {
    CHUISLogViewController();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      -[CHUISWidgetHostViewController _snapshotViewIgnoringVibrancyEffect:].cold.1();

    v11 = 0;
  }
  else
  {
    v5 = self->_scene;
    v6 = v5;
    if (v5 && -[FBScene contentState](v5, "contentState") == 2 && CHUISHasGlobalCaptureEntitlement())
    {
      v7 = (id)-[UIScenePresenter newSnapshotPresentationView](self->_scenePresenter, "newSnapshotPresentationView");
    }
    else
    {
      v7 = -[CHUISWidgetHostViewController _newPersistedSnapshotView](self, "_newPersistedSnapshotView");
      if (v7)
      {
        -[CHUISWidgetHostViewController view](self, "view");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "bounds");
        objc_msgSend(v7, "setFrame:");

        v9 = v7;
      }

    }
    -[CHUISWidgetHostViewController _effectiveViewCornerRadius](self, "_effectiveViewCornerRadius");
    objc_msgSend(v7, "_setContinuousCornerRadius:");
    objc_msgSend(v7, "setClipsToBounds:", 0);
    v10 = v7;
    v11 = v10;
    if (-[CHUISWidgetHostViewController _isVibrancyEffectEnabled](self, "_isVibrancyEffectEnabled"))
    {
      v11 = v10;
      if (!a3)
      {
        v12 = objc_alloc(MEMORY[0x1E0D01960]);
        -[CHUISWidgetHostViewController view](self, "view");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "bounds");
        v11 = (void *)objc_msgSend(v12, "initWithFrame:");

        -[CHUISWidgetHostViewController vibrancyConfiguration](self, "vibrancyConfiguration");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)objc_msgSend(v14, "copyWithGroupName:", 0);
        objc_msgSend(v11, "setConfiguration:", v15);

        objc_msgSend(v10, "setAutoresizingMask:", 18);
        objc_msgSend(v11, "contentView");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addSubview:", v10);

      }
    }
    objc_msgSend(v11, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CHUISWidgetHostViewController _applySecurityPolicyToLayer:](self, "_applySecurityPolicyToLayer:", v17);

  }
  return v11;
}

- (CHSWidgetRenderScheme)renderScheme
{
  BSDispatchQueueAssertMain();
  return self->_renderScheme;
}

- (void)setRenderScheme:(id)a3
{
  id v4;

  v4 = a3;
  BSDispatchQueueAssertMain();
  self->_didSetRenderSchemeExplicitly = 1;
  -[CHUISWidgetHostViewController _implicitSetRenderScheme:](self, "_implicitSetRenderScheme:", v4);

}

- (void)_implicitSetRenderScheme:(id)a3
{
  id v4;
  CHSWidgetRenderScheme **p_renderScheme;
  _BOOL4 v6;
  uint64_t v7;
  CHSWidgetRenderScheme *v8;
  NSObject *v9;
  id WeakRetained;
  char v11;
  id v12;
  _QWORD v13[5];

  v4 = a3;
  p_renderScheme = &self->_renderScheme;
  if ((-[CHSWidgetRenderScheme isEqual:](self->_renderScheme, "isEqual:", v4) & 1) == 0)
  {
    v6 = -[CHUISWidgetHostViewController usesSystemBackgroundMaterial](self, "usesSystemBackgroundMaterial");
    v7 = objc_msgSend(v4, "copy");
    v8 = *p_renderScheme;
    *p_renderScheme = (CHSWidgetRenderScheme *)v7;

    CHUISLogViewController();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[CHUISWidgetHostViewController _implicitSetRenderScheme:].cold.1();

    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __58__CHUISWidgetHostViewController__implicitSetRenderScheme___block_invoke;
    v13[3] = &unk_1E6B84C28;
    v13[4] = self;
    -[CHUISWidgetHostViewController modifySceneSettings:](self, "modifySceneSettings:", v13);
    if (v6 != -[CHUISWidgetHostViewController usesSystemBackgroundMaterial](self, "usesSystemBackgroundMaterial"))
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v11 = objc_opt_respondsToSelector();

      if ((v11 & 1) != 0)
      {
        v12 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v12, "widgetHostViewControllerUsesSystemBackgroundMaterialDidChange:", self);

      }
    }
  }

}

uint64_t __58__CHUISWidgetHostViewController__implicitSetRenderScheme___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "setRenderScheme:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1320));
  return 0;
}

- (unint64_t)backgroundViewPolicy
{
  BSDispatchQueueAssertMain();
  return -[CHSWidgetRenderScheme backgroundViewPolicy](self->_renderScheme, "backgroundViewPolicy");
}

- (void)setBackgroundViewPolicy:(unint64_t)a3
{
  id v5;

  BSDispatchQueueAssertMain();
  if (-[CHUISWidgetHostViewController backgroundViewPolicy](self, "backgroundViewPolicy") != a3)
  {
    v5 = (id)-[CHSWidgetRenderScheme mutableCopy](self->_renderScheme, "mutableCopy");
    objc_msgSend(v5, "setBackgroundViewPolicy:", a3);
    -[CHUISWidgetHostViewController _implicitSetRenderScheme:](self, "_implicitSetRenderScheme:", v5);

  }
}

- (void)setUsesOpaqueContent:(BOOL)a3
{
  -[CHUISWidgetHostViewController setBackgroundViewPolicy:](self, "setBackgroundViewPolicy:", !a3);
}

- (BOOL)containsInteractiveControls
{
  void *v2;
  char v3;

  -[CHUISWidgetHostViewController clientSettings](self, "clientSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsInteractiveControls");

  return v3;
}

- (void)setWantsBaseContentTouchEvents:(BOOL)a3
{
  _QWORD v3[5];

  if (self->_wantsBaseContentTouchEvents != a3)
  {
    self->_wantsBaseContentTouchEvents = a3;
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __64__CHUISWidgetHostViewController_setWantsBaseContentTouchEvents___block_invoke;
    v3[3] = &unk_1E6B84C28;
    v3[4] = self;
    -[CHUISWidgetHostViewController modifySceneSettings:](self, "modifySceneSettings:", v3);
  }
}

uint64_t __64__CHUISWidgetHostViewController_setWantsBaseContentTouchEvents___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "setWantsBaseContentTouchEvents:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 1357));
  return 0;
}

- (BOOL)_canShowWhileLocked
{
  return 0;
}

- (double)_currentDisplayScale
{
  void *v3;
  double v4;
  double v5;

  BSDispatchQueueAssertMain();
  -[CHUISWidgetHostViewController traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayScale");
  v5 = v4;

  return v5;
}

- (void)loadView
{
  CHUISWidgetHostViewControllerView *v3;
  CHUISWidgetHostViewControllerView *v4;

  v3 = [CHUISWidgetHostViewControllerView alloc];
  v4 = -[CHUISWidgetHostViewControllerView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[CHUISWidgetHostViewControllerView setParentController:](v4, "setParentController:", self);
  -[CHUISWidgetHostViewController setView:](self, "setView:", v4);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  BSUIVibrancyEffectView *v8;
  BSUIVibrancyEffectView *vibrancyEffectView;
  void *v10;
  objc_super v11;

  BSDispatchQueueAssertMain();
  v11.receiver = self;
  v11.super_class = (Class)CHUISWidgetHostViewController;
  -[CHUISWidgetHostViewController viewDidLoad](&v11, sel_viewDidLoad);
  -[CHUISWidgetHostViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CHUISWidgetHostViewController metrics](self, "metrics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_metricsDefineSize)
  {
    -[CHUISWidgetHostViewController _currentDisplayScale](self, "_currentDisplayScale");
    objc_msgSend(v4, "_effectiveSizePixelAlignedForDisplayScale:");
    BSRectWithSize();
    objc_msgSend(v3, "setFrame:");
  }
  objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithUserInterfaceLevel:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setLocalOverrideTraitCollection:", v5);

  objc_msgSend(v3, "setClipsToBounds:", 0);
  objc_msgSend(v3, "setBackgroundColor:", 0);
  if (_os_feature_enabled_impl())
  {
    v6 = objc_alloc(MEMORY[0x1E0D01960]);
    -[CHUISWidgetHostViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bounds");
    v8 = (BSUIVibrancyEffectView *)objc_msgSend(v6, "initWithFrame:");
    vibrancyEffectView = self->_vibrancyEffectView;
    self->_vibrancyEffectView = v8;

    -[BSUIVibrancyEffectView setAutoresizingMask:](self->_vibrancyEffectView, "setAutoresizingMask:", 18);
    -[CHUISWidgetHostViewController view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", self->_vibrancyEffectView);

    -[CHUISWidgetHostViewController _updateVibrancyEffectView](self, "_updateVibrancyEffectView");
  }
  -[CHUISWidgetHostViewController _createWidgetSnapshotViews](self, "_createWidgetSnapshotViews");

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  BSDispatchQueueAssertMain();
  v5.receiver = self;
  v5.super_class = (Class)CHUISWidgetHostViewController;
  -[CHUISWidgetHostViewController viewWillAppear:](&v5, sel_viewWillAppear_, v3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  BSDispatchQueueAssertMain();
  self->_isInViewDidDisappear = 1;
  v5.receiver = self;
  v5.super_class = (Class)CHUISWidgetHostViewController;
  -[CHUISWidgetHostViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, v3);
  self->_isInViewDidDisappear = 0;
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  char v15;
  int64_t keybagLockPolicy;
  BOOL v17;
  char v18;
  NSObject *v19;
  NSString *cachedSceneLogDigest;
  unint64_t effectivePresentationMode;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, void *);
  void *v25;
  id v26;
  uint64_t v27;
  objc_super v28;
  uint8_t buf[4];
  CHUISWidgetHostViewController *v30;
  __int16 v31;
  NSString *v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v4 = a4;
  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  BSDispatchQueueAssertMain();
  v28.receiver = self;
  v28.super_class = (Class)CHUISWidgetHostViewController;
  -[CHUISWidgetHostViewController viewDidMoveToWindow:shouldAppearOrDisappear:](&v28, sel_viewDidMoveToWindow_shouldAppearOrDisappear_, v6, v4);
  if (v6)
  {
    -[FBScene settings](self->_scene, "settings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "displayConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "windowScene");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_FBSScene");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "settings");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "displayConfiguration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      objc_msgSend(MEMORY[0x1E0D228F8], "mainConfiguration");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v11, "displayIdentity");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isContinuityDisplay");

    v15 = objc_msgSend(v12, "isEqual:", v8);
    keybagLockPolicy = self->_keybagLockPolicy;
    v17 = keybagLockPolicy == v14;
    if (keybagLockPolicy == v14)
      v18 = v15;
    else
      v18 = 0;
    if ((v18 & 1) == 0)
    {
      if (!v17)
      {
        self->_keybagLockPolicy = v14;
        CHUISLogViewController();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          cachedSceneLogDigest = self->_cachedSceneLogDigest;
          *(_DWORD *)buf = 134218498;
          v30 = self;
          v31 = 2114;
          v32 = cachedSceneLogDigest;
          v33 = 2050;
          v34 = v14;
          _os_log_impl(&dword_1B711E000, v19, OS_LOG_TYPE_DEFAULT, "[%p-%{public}@] Keybag Lock Policy changed to %{public}ld", buf, 0x20u);
        }

      }
      v22 = MEMORY[0x1E0C809B0];
      v23 = 3221225472;
      v24 = __77__CHUISWidgetHostViewController_viewDidMoveToWindow_shouldAppearOrDisappear___block_invoke;
      v25 = &unk_1E6B84E70;
      v26 = v12;
      v27 = v14;
      -[CHUISWidgetHostViewController modifySceneSettings:](self, "modifySceneSettings:", &v22);

    }
    -[CHUISWidgetHostViewController _evaluateEffectiveInSecureEnvironmentForReason:](self, "_evaluateEffectiveInSecureEnvironmentForReason:", CFSTR("viewDidMoveToWindow"), v22, v23, v24, v25);
    effectivePresentationMode = self->_effectivePresentationMode;
    if (effectivePresentationMode == 1
      || effectivePresentationMode == 3
      || effectivePresentationMode == 2
      && (-[CHUISWidgetHostViewController _updateSceneToForeground:](self, "_updateSceneToForeground:", 1),
          -[FBScene contentState](self->_scene, "contentState") != 2))
    {
      -[CHUISWidgetHostViewController _ensureAndEvaluateSnapshotView](self, "_ensureAndEvaluateSnapshotView");
    }

    if (self->_shouldShareTouchesWithHost)
      -[CHUISWidgetHostViewController _updateTouchDeliveryPolicies](self, "_updateTouchDeliveryPolicies");
  }
  else if (self->_shouldShareTouchesWithHost)
  {
    -[CHUISWidgetHostViewController _clearTouchDeliveryPolicies](self, "_clearTouchDeliveryPolicies");
  }
  -[CHUISWidgetHostViewController _scheduleEvaluationOfDetachedSceneTimerForReason:](self, "_scheduleEvaluationOfDetachedSceneTimerForReason:", CFSTR("Window modified"));

}

uint64_t __77__CHUISWidgetHostViewController_viewDidMoveToWindow_shouldAppearOrDisappear___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setDisplayConfiguration:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "setKeybagLockPolicy:", *(_QWORD *)(a1 + 40));

  return 0;
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  objc_super v4;

  BSDispatchQueueAssertMain();
  v4.receiver = self;
  v4.super_class = (Class)CHUISWidgetHostViewController;
  -[CHUISWidgetHostViewController viewWillLayoutSubviews](&v4, sel_viewWillLayoutSubviews);
  -[CHUISWidgetHostViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sendSubviewToBack:", self->_materialView);

}

- (void)setMetricsDefineSize:(BOOL)a3
{
  if ((BSEqualBools() & 1) == 0)
  {
    self->_metricsDefineSize = a3;
    -[CHUISWidgetHostViewController _updateViewsCornerRadius](self, "_updateViewsCornerRadius");
  }
}

- (void)setClipBehavior:(unint64_t)a3
{
  _QWORD v4[5];

  if (self->_clipBehavior != a3)
  {
    self->_clipBehavior = a3;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __49__CHUISWidgetHostViewController_setClipBehavior___block_invoke;
    v4[3] = &__block_descriptor_40_e78___UIApplicationSceneTransitionContext_16__0__CHUISMutableWidgetSceneSettings_8l;
    v4[4] = a3;
    -[CHUISWidgetHostViewController modifySceneSettings:](self, "modifySceneSettings:", v4);
    -[CHUISWidgetHostViewController _updateViewsCornerRadius](self, "_updateViewsCornerRadius");
  }
}

uint64_t __49__CHUISWidgetHostViewController_setClipBehavior___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "setClipBehavior:", *(_QWORD *)(a1 + 32));
  return 0;
}

- (void)setWidgetPriority:(unint64_t)a3
{
  NSObject *v4;
  NSString *cachedSceneLogDigest;
  void *v6;
  _QWORD v7[5];
  uint8_t buf[4];
  CHUISWidgetHostViewController *v9;
  __int16 v10;
  NSString *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (self->_widgetPriority != a3)
  {
    self->_widgetPriority = a3;
    CHUISLogViewController();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      cachedSceneLogDigest = self->_cachedSceneLogDigest;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_widgetPriority);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v9 = self;
      v10 = 2114;
      v11 = cachedSceneLogDigest;
      v12 = 2112;
      v13 = v6;
      _os_log_impl(&dword_1B711E000, v4, OS_LOG_TYPE_DEFAULT, "[%p-%{public}@] Widget priority changed to %@", buf, 0x20u);

    }
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __51__CHUISWidgetHostViewController_setWidgetPriority___block_invoke;
    v7[3] = &unk_1E6B84C28;
    v7[4] = self;
    -[CHUISWidgetHostViewController modifySceneSettings:](self, "modifySceneSettings:", v7);
  }
}

uint64_t __51__CHUISWidgetHostViewController_setWidgetPriority___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "setWidgetPriority:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1312));
  return 0;
}

- (BLSHBacklightSceneHostEnvironment)backlightHostEnvironment
{
  return self->_sceneBacklightEnvironment;
}

- (void)logDebug:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  NSString *cachedSceneLogDigest;
  void *v9;
  uint8_t buf[4];
  CHUISWidgetHostViewController *v11;
  __int16 v12;
  NSString *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  CHUISLogViewController();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);

  if (v6)
  {
    CHUISLogViewController();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      cachedSceneLogDigest = self->_cachedSceneLogDigest;
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:arguments:", v4, &v17);
      *(_DWORD *)buf = 134218498;
      v11 = self;
      v12 = 2114;
      v13 = cachedSceneLogDigest;
      v14 = 2114;
      v15 = v9;
      _os_log_debug_impl(&dword_1B711E000, v7, OS_LOG_TYPE_DEBUG, "[%p-%{public}@] %{public}@", buf, 0x20u);

    }
  }

}

- (void)log:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  NSString *cachedSceneLogDigest;
  void *v9;
  uint8_t buf[4];
  CHUISWidgetHostViewController *v11;
  __int16 v12;
  NSString *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  CHUISLogViewController();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    CHUISLogViewController();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      cachedSceneLogDigest = self->_cachedSceneLogDigest;
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:arguments:", v4, &v17);
      *(_DWORD *)buf = 134218498;
      v11 = self;
      v12 = 2114;
      v13 = cachedSceneLogDigest;
      v14 = 2114;
      v15 = v9;
      _os_log_impl(&dword_1B711E000, v7, OS_LOG_TYPE_DEFAULT, "[%p-%{public}@] %{public}@", buf, 0x20u);

    }
  }

}

- (id)sceneSpecification
{
  return (id)objc_opt_new();
}

- (void)modifySceneSettings:(id)a3
{
  id v4;
  FBScene *scene;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  scene = self->_scene;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__CHUISWidgetHostViewController_modifySceneSettings___block_invoke;
  v7[3] = &unk_1E6B84E98;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[FBScene updateSettingsWithTransitionBlock:](scene, "updateSettingsWithTransitionBlock:", v7);

}

id __53__CHUISWidgetHostViewController_modifySceneSettings___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "willModifySceneSettings:", v3);

  return v4;
}

- (id)additionalSnapshotPresentationContext
{
  return 0;
}

- (void)sceneDidUpdateClientSettingsWithDiff:(id)a3 oldClientSettings:(id)a4 newClientSettings:(id)a5 transitionContext:(id)a6
{
  id v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  CHUISTouchEvent *v13;
  id v14;

  v14 = a4;
  v8 = a5;
  v9 = objc_msgSend(v14, "containsInteractiveControls");
  if (v9 != objc_msgSend(v8, "containsInteractiveControls"))
  {
    -[CHUISWidgetHostViewController delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v10, "widgetHostViewControllerContainsInteractiveControlsDidChange:", self);

  }
  v11 = objc_msgSend(v14, "baseContentTouchedDown");
  if (v11 != objc_msgSend(v8, "baseContentTouchedDown") && self->_wantsBaseContentTouchEvents)
  {
    -[CHUISWidgetHostViewController delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v13 = -[CHUISTouchEvent initWithBaseContentTouchedDown:]([CHUISTouchEvent alloc], "initWithBaseContentTouchedDown:", objc_msgSend(v8, "baseContentTouchedDown"));
      objc_msgSend(v12, "widgetHostViewController:receivedTouchEvent:", self, v13);

    }
  }

}

- (CHUISWidgetSceneClientSettings)clientSettings
{
  return (CHUISWidgetSceneClientSettings *)-[FBScene clientSettings](self->_scene, "clientSettings");
}

- (id)handleActions:(id)a3
{
  return a3;
}

- (CHUISWidgetVisibilitySettings)_visibilitySettings
{
  BSDispatchQueueAssertMain();
  return self->_visibilitySettings;
}

- (void)_setVisibilitySettings:(id)a3
{
  CHUISWidgetVisibilitySettings *v4;
  CHUISWidgetVisibilitySettings *visibilitySettings;
  id v6;
  _QWORD v7[5];

  v6 = a3;
  BSDispatchQueueAssertMain();
  if (!-[CHUISWidgetVisibilitySettings isEqual:](self->_visibilitySettings, "isEqual:", v6))
  {
    v4 = (CHUISWidgetVisibilitySettings *)objc_msgSend(v6, "copy");
    visibilitySettings = self->_visibilitySettings;
    self->_visibilitySettings = v4;

    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __56__CHUISWidgetHostViewController__setVisibilitySettings___block_invoke;
    v7[3] = &unk_1E6B84C28;
    v7[4] = self;
    -[CHUISWidgetHostViewController modifySceneSettings:](self, "modifySceneSettings:", v7);
  }

}

uint64_t __56__CHUISWidgetHostViewController__setVisibilitySettings___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "setVisibility:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1096));
  return 0;
}

- (BOOL)_hasScene
{
  return self->_scene != 0;
}

- (UIView)_liveSceneView
{
  return (UIView *)-[UIScenePresenter presentationView](self->_scenePresenter, "presentationView");
}

- (id)_liveSnapshotView
{
  return self->_liveSceneSnapshotView;
}

- (UIView)_staticImageSnapshotView
{
  return (UIView *)self->_persistedWidgetSnapshotImageView;
}

- (UIView)_staticCAARSnapshotView
{
  return (UIView *)self->_persistedWidgetSnapshotCaarView;
}

- (UIView)_staticSnapshotContainerView
{
  return self->_persistedWidgetSnapshotViewContainer;
}

- (UIView)_liveSceneSnapshotView
{
  return self->_liveSceneSnapshotView;
}

- (id)_persistedWidgetSnapshotViewContainer
{
  return self->_persistedWidgetSnapshotViewContainer;
}

- (id)_stateDumpDescription
{
  void *v3;
  uint64_t v4;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  CHUISWidgetHostViewController *v16;
  _QWORD v17[4];
  id v18;
  CHUISWidgetHostViewController *v19;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __54__CHUISWidgetHostViewController__stateDumpDescription__block_invoke;
  v17[3] = &unk_1E6B84B40;
  v5 = v3;
  v18 = v5;
  v19 = self;
  v6 = (id)objc_msgSend(v5, "modifyProem:", v17);
  v11 = v4;
  v12 = 3221225472;
  v13 = __54__CHUISWidgetHostViewController__stateDumpDescription__block_invoke_2;
  v14 = &unk_1E6B84B40;
  v7 = v5;
  v15 = v7;
  v16 = self;
  v8 = (id)objc_msgSend(v7, "modifyBody:", &v11);
  objc_msgSend(v7, "build", v11, v12, v13, v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void __54__CHUISWidgetHostViewController__stateDumpDescription__block_invoke(uint64_t a1)
{
  void *v2;
  const __CFString *v3;
  unint64_t v4;
  const __CFString *v5;
  unint64_t v6;
  const __CFString *v7;
  id v8;
  void *v9;
  id v10;
  id v11;

  v2 = *(void **)(a1 + 32);
  if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 1296))
    v3 = CFSTR("preview");
  else
    v3 = CFSTR("timeline");
  objc_msgSend(v2, "appendString:withName:", v3, CFSTR("type"));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1272) - 1;
  if (v4 > 2)
    v5 = CFSTR("none");
  else
    v5 = off_1E6B852E0[v4];
  objc_msgSend(*(id *)(a1 + 32), "appendString:withName:", v5, CFSTR("requestedMode"));
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1280) - 1;
  if (v6 > 2)
    v7 = CFSTR("none");
  else
    v7 = off_1E6B852E0[v6];
  objc_msgSend(*(id *)(a1 + 32), "appendString:withName:", v7, CFSTR("effectiveMode"));
  v8 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 992) != 0, CFSTR("hasScene"));
  v9 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 992), "settings");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v9, "appendBool:withName:", objc_msgSend(v11, "isForeground"), CFSTR("isSceneForeground"));

}

void __54__CHUISWidgetHostViewController__stateDumpDescription__block_invoke_2(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  const __CFString *v14;
  const __CFString *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  id v31;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1192), CFSTR("widget"));
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1376), CFSTR("metrics"));
  v4 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1384), CFSTR("configID"));
  v5 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "_isAppearingOrAppeared"), CFSTR("isAppearedOrAppearing"));
  v6 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1096), CFSTR("visibility"));
  v7 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:ifEqualTo:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 1208), CFSTR("animationsPaused"), 1);
  v8 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:ifEqualTo:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 1209), CFSTR("contentPaused"), 1);
  v9 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:ifEqualTo:", objc_msgSend(*(id *)(a1 + 40), "shouldVisibleEntrySnapshot"), CFSTR("visibleEntryShouldSnapshot"), 1);
  v10 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:ifEqualTo:", objc_msgSend(*(id *)(a1 + 40), "usesSystemBackgroundMaterial"), CFSTR("usesSystemBackgroundMaterial"), 1);
  v11 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:ifEqualTo:", objc_msgSend(*(id *)(a1 + 40), "drawSystemBackgroundMaterialIfNecessary"), CFSTR("drawSystemBackgroundMaterialIfNecessary"), 1);
  v12 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:ifEqualTo:", objc_msgSend(*(id *)(a1 + 40), "shouldShareTouchesWithHost"), CFSTR("sharesTouchesWithHost"), 1);
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1184);
  v14 = CFSTR("NotSet");
  if (v13 == 2)
    v14 = CFSTR("No");
  if (v13 == 1)
    v15 = CFSTR("Yes");
  else
    v15 = v14;
  objc_msgSend(*(id *)(a1 + 32), "appendString:withName:", v15, CFSTR("inSecureEnvironment"));
  v16 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:ifEqualTo:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 1176), CFSTR("canAppearInSecureEnvironment"), 1);
  v17 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:ifEqualTo:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 1264), CFSTR("supportsLowLuminance"), 1);
  v18 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:ifEqualTo:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 1352), CFSTR("showsWidgetLabel"), 1);
  v19 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:ifEqualTo:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 1353), CFSTR("interactionDisabled"), 1);
  v20 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:ifEqualTo:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 1212), CFSTR("metricsDefineSize"), 1);
  v21 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "userInfo");
  v29 = (id)objc_claimAutoreleasedReturnValue();
  v22 = (id)objc_msgSend(v21, "appendObject:withName:");

  v23 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "view");
  v30 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "window");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (id)objc_msgSend(v23, "appendObject:withName:", v24, CFSTR("window"));

  v26 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "view");
  v31 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "superview");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (id)objc_msgSend(v26, "appendObject:withName:", v27, CFSTR("superview"));

}

- (void)ensureContentWithTimeout:(double)a3 completion:(id)a4
{
  id v7;
  NSObject *v8;
  NSString *cachedSceneLogDigest;
  CHUISContentConfirmationAction *v10;
  uint64_t v11;
  id v12;
  CHUISContentConfirmationAction *v13;
  FBScene *scene;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  SEL v21;
  uint8_t buf[4];
  CHUISWidgetHostViewController *v23;
  __int16 v24;
  NSString *v25;
  __int16 v26;
  double v27;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  BSDispatchQueueAssertMain();
  if (self->_scene)
  {
    CHUISLogViewController();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      cachedSceneLogDigest = self->_cachedSceneLogDigest;
      *(_DWORD *)buf = 134218498;
      v23 = self;
      v24 = 2114;
      v25 = cachedSceneLogDigest;
      v26 = 2048;
      v27 = a3;
      _os_log_impl(&dword_1B711E000, v8, OS_LOG_TYPE_DEFAULT, "[%p-%{public}@] Sending content confirmation action: timeout=%f)", buf, 0x20u);
    }

    v10 = [CHUISContentConfirmationAction alloc];
    v11 = MEMORY[0x1E0C80D38];
    v12 = MEMORY[0x1E0C80D38];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __69__CHUISWidgetHostViewController_ensureContentWithTimeout_completion___block_invoke;
    v19[3] = &unk_1E6B84F10;
    v19[4] = self;
    v20 = v7;
    v21 = a2;
    v13 = -[CHUISContentConfirmationAction initWithTimeout:queue:completion:](v10, "initWithTimeout:queue:completion:", v11, v19, a3);

    scene = self->_scene;
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBScene sendActions:](scene, "sendActions:", v15);

  }
  else
  {
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v28 = *MEMORY[0x1E0CB2D50];
    v29[0] = CFSTR("Missing scene");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("com.apple.chrono.widgethost"), 888, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v7 + 2))(v7, v18);

  }
}

void __69__CHUISWidgetHostViewController_ensureContentWithTimeout_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t (*v3)(uint64_t, uint64_t);
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;
  void *v32;
  _QWORD aBlock[4];
  id v34;
  _QWORD v35[4];
  id v36;
  _QWORD v37[5];
  id v38;
  _BYTE *v39;
  uint64_t v40;
  _BYTE buf[24];
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    CHUISLogViewController();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(_QWORD *)(v5 + 1104);
      *(_DWORD *)buf = 134218498;
      *(_QWORD *)&buf[4] = v5;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v6;
      *(_WORD *)&buf[22] = 2112;
      v42 = v3;
      _os_log_impl(&dword_1B711E000, v4, OS_LOG_TYPE_DEFAULT, "[%p-%{public}@] Received content confirmation action error: %@", buf, 0x20u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 992), "contentState") == 2)
  {
    CHUISLogViewController();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(_QWORD *)(v8 + 1104);
      *(_DWORD *)buf = 134218242;
      *(_QWORD *)&buf[4] = v8;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v9;
      _os_log_impl(&dword_1B711E000, v7, OS_LOG_TYPE_DEFAULT, "[%p-%{public}@] Received content confirmation action success!", buf, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_hideSnapshotViewsAnimated:forceCompleteTeardown:", 0, 1);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    CHUISLogViewController();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(_QWORD *)(a1 + 32);
      v12 = *(_QWORD *)(v11 + 1104);
      *(_DWORD *)buf = 134218242;
      *(_QWORD *)&buf[4] = v11;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v12;
      _os_log_impl(&dword_1B711E000, v10, OS_LOG_TYPE_DEFAULT, "[%p-%{public}@] Received content confirmation action response, but raced with content ready response.  Waiting for content to be ready.", buf, 0x16u);
    }

    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v42 = __Block_byref_object_copy__0;
    v43 = __Block_byref_object_dispose__0;
    v13 = objc_alloc(MEMORY[0x1E0D01720]);
    v14 = (void *)MEMORY[0x1E0CB3940];
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1104);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "UUIDString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("<WaitForContentReadyTimer-%@-%@>"), v15, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = (id)objc_msgSend(v13, "initWithIdentifier:", v18);

    v19 = (void *)MEMORY[0x1E0D016E8];
    v20 = MEMORY[0x1E0C809B0];
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __69__CHUISWidgetHostViewController_ensureContentWithTimeout_completion___block_invoke_133;
    v37[3] = &unk_1E6B84EC0;
    v21 = *(void **)(a1 + 40);
    v37[4] = *(_QWORD *)(a1 + 32);
    v22 = v21;
    v23 = *(_QWORD *)(a1 + 48);
    v38 = v22;
    v39 = buf;
    v40 = v23;
    objc_msgSend(v19, "sentinelWithQueue:signalHandler:", MEMORY[0x1E0C80D38], v37);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = *(void **)(*(_QWORD *)&buf[8] + 40);
    v35[0] = v20;
    v35[1] = 3221225472;
    v35[2] = __69__CHUISWidgetHostViewController_ensureContentWithTimeout_completion___block_invoke_140;
    v35[3] = &unk_1E6B84EE8;
    v26 = v24;
    v36 = v26;
    objc_msgSend(v25, "scheduleWithFireInterval:leewayInterval:queue:handler:", MEMORY[0x1E0C80D38], v35, 3.0, 0.0);

    v27 = *(void **)(*(_QWORD *)(a1 + 32) + 1240);
    if (!v27)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = *(_QWORD *)(a1 + 32);
      v30 = *(void **)(v29 + 1240);
      *(_QWORD *)(v29 + 1240) = v28;

      v27 = *(void **)(*(_QWORD *)(a1 + 32) + 1240);
    }
    aBlock[0] = v20;
    aBlock[1] = 3221225472;
    aBlock[2] = __69__CHUISWidgetHostViewController_ensureContentWithTimeout_completion___block_invoke_2;
    aBlock[3] = &unk_1E6B84AF0;
    v31 = v26;
    v34 = v31;
    v32 = _Block_copy(aBlock);
    objc_msgSend(v27, "addObject:", v32);

    _Block_object_dispose(buf, 8);
  }

}

void __69__CHUISWidgetHostViewController_ensureContentWithTimeout_completion___block_invoke_133(uint64_t a1, void *a2)
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    CHUISLogViewController();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(_QWORD *)(v5 + 1104);
      v13 = 134218242;
      v14 = v5;
      v15 = 2114;
      v16 = v6;
      _os_log_impl(&dword_1B711E000, v4, OS_LOG_TYPE_DEFAULT, "[%p-%{public}@] Timed out waiting for content ready for content confirmation action.", (uint8_t *)&v13, 0x16u);
    }

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("CHUISWidgetHostViewController.m"), 1393, CFSTR("Context must be an error"));

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    CHUISLogViewController();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(_QWORD *)(v8 + 1104);
      v13 = 134218242;
      v14 = v8;
      v15 = 2114;
      v16 = v9;
      _os_log_impl(&dword_1B711E000, v7, OS_LOG_TYPE_DEFAULT, "[%p-%{public}@] Received content ready response for content confirmation action. Success!", (uint8_t *)&v13, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_hideSnapshotViewsAnimated:forceCompleteTeardown:", 0, 1);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "invalidate");
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = 0;

}

void __69__CHUISWidgetHostViewController_ensureContentWithTimeout_completion___block_invoke_140(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v1 = *(void **)(a1 + 32);
  v2 = (void *)MEMORY[0x1E0CB35C8];
  v5 = *MEMORY[0x1E0CB2D50];
  v6[0] = CFSTR("Timed out waiting for content to be ready.");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", CFSTR("com.apple.chrono.widgethost"), 777, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "signalWithContext:", v4);

}

uint64_t __69__CHUISWidgetHostViewController_ensureContentWithTimeout_completion___block_invoke_2(uint64_t a1)
{
  BSDispatchQueueAssertMain();
  return objc_msgSend(*(id *)(a1 + 32), "signal");
}

- (void)snapshotContentWithTimeout:(double)a3 queue:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v8 = a4;
  v9 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __77__CHUISWidgetHostViewController_snapshotContentWithTimeout_queue_completion___block_invoke;
  v12[3] = &unk_1E6B84F88;
  v12[4] = self;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  -[CHUISWidgetHostViewController ensureContentWithTimeout:completion:](self, "ensureContentWithTimeout:completion:", v12, a3);

}

void __77__CHUISWidgetHostViewController_snapshotContentWithTimeout_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t v16;

  v3 = a2;
  BSDispatchQueueAssertMain();
  if (v3)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __77__CHUISWidgetHostViewController_snapshotContentWithTimeout_queue_completion___block_invoke_3;
    block[3] = &unk_1E6B84F60;
    v4 = *(NSObject **)(a1 + 40);
    v12 = *(id *)(a1 + 48);
    v11 = v3;
    dispatch_async(v4, block);

    v5 = v12;
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 992), "snapshotContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setOpaque:", objc_msgSend(*(id *)(a1 + 32), "_actualBackgroundViewMode") == 1);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 992), "createSnapshotWithContext:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_currentDisplayScale");
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __77__CHUISWidgetHostViewController_snapshotContentWithTimeout_queue_completion___block_invoke_2;
    v13[3] = &unk_1E6B84F38;
    v14 = v6;
    v16 = v7;
    v8 = *(NSObject **)(a1 + 40);
    v15 = *(id *)(a1 + 48);
    v9 = v6;
    dispatch_async(v8, v13);

  }
}

void __77__CHUISWidgetHostViewController_snapshotContentWithTimeout_queue_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "capture"))
  {
    v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3870]), "initWithCGImage:scale:orientation:", objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "CGImage"), 0, *(double *)(a1 + 48));
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  else
  {
    v2 = *(_QWORD *)(a1 + 40);
    v3 = (void *)MEMORY[0x1E0CB35C8];
    v7 = *MEMORY[0x1E0CB2D50];
    v8[0] = CFSTR("Unable to snapshot scene.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "errorWithDomain:code:userInfo:", CFSTR("com.apple.chrono.widgethost"), 555, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v2 + 16))(v2, 0, v5);

  }
}

uint64_t __77__CHUISWidgetHostViewController_snapshotContentWithTimeout_queue_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[CHUISWidgetHostViewController succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;
  id v5;
  const __CFString *v6;
  id v7;
  unint64_t v8;
  const __CFString *v9;
  id v10;
  unint64_t v11;
  const __CFString *v12;
  id v13;
  id v14;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", self->_widget, CFSTR("widget"));
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", self->_metrics, CFSTR("metrics"));
  if (self->_contentType)
    v6 = CFSTR("preview");
  else
    v6 = CFSTR("timeline");
  v7 = (id)objc_msgSend(v3, "appendObject:withName:", v6, CFSTR("contentType"));
  v8 = self->_requestedPresentationMode - 1;
  if (v8 > 2)
    v9 = CFSTR("none");
  else
    v9 = off_1E6B852E0[v8];
  v10 = (id)objc_msgSend(v3, "appendObject:withName:", v9, CFSTR("requestedMode"));
  v11 = self->_effectivePresentationMode - 1;
  if (v11 > 2)
    v12 = CFSTR("none");
  else
    v12 = off_1E6B852E0[v11];
  v13 = (id)objc_msgSend(v3, "appendObject:withName:", v12, CFSTR("effectiveMode"));
  v14 = (id)objc_msgSend(v3, "appendBool:withName:", self->_invalidated, CFSTR("invalidated"));
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[CHUISWidgetHostViewController descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  -[CHUISWidgetHostViewController succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)invalidate
{
  CHUISWidgetVisibilitySettings *visibilitySettings;
  NSObject *v4;
  NSString *cachedSceneLogDigest;
  int v6;
  CHUISWidgetHostViewController *v7;
  __int16 v8;
  NSString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  BSDispatchQueueAssertMain();
  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    visibilitySettings = self->_visibilitySettings;
    self->_visibilitySettings = 0;

    objc_storeWeak((id *)&self->_delegate, 0);
    -[CHSWidgetExtensionProvider unregisterObserver:](self->_extensionProvider, "unregisterObserver:", self);
    CHUISLogViewController();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      cachedSceneLogDigest = self->_cachedSceneLogDigest;
      v6 = 134218242;
      v7 = self;
      v8 = 2114;
      v9 = cachedSceneLogDigest;
      _os_log_impl(&dword_1B711E000, v4, OS_LOG_TYPE_DEFAULT, "[%p-%{public}@] Invalidated", (uint8_t *)&v6, 0x16u);
    }

    -[CHUISWidgetHostViewController _tearDownScene](self, "_tearDownScene");
  }
}

- (void)keybagStateDidChange:(id)a3
{
  BSDispatchMain();
}

uint64_t __54__CHUISWidgetHostViewController_keybagStateDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_evaluateEffectiveInSecureEnvironmentForReason:", CFSTR("keybagUpdate"));
}

- (void)extensionsDidChangeForExtensionProvider:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__CHUISWidgetHostViewController_extensionsDidChangeForExtensionProvider___block_invoke;
  block[3] = &unk_1E6B84AF0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __73__CHUISWidgetHostViewController_extensionsDidChangeForExtensionProvider___block_invoke(uint64_t a1)
{
  NSObject *v2;

  CHUISLogViewControllerTouch();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __73__CHUISWidgetHostViewController_extensionsDidChangeForExtensionProvider___block_invoke_cold_1();

  return objc_msgSend(*(id *)(a1 + 32), "_updateDescriptorIfNecessary");
}

- (void)scene:(id)a3 didReceiveActions:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSString *cachedSceneLogDigest;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  id v18;
  void *v19;
  id WeakRetained;
  unsigned __int8 v21;
  id v22;
  void *v23;
  id v24;
  char v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t v34[128];
  uint8_t buf[4];
  CHUISWidgetHostViewController *v36;
  __int16 v37;
  NSString *v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  BSDispatchQueueAssertMain();
  CHUISLogViewController();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    cachedSceneLogDigest = self->_cachedSceneLogDigest;
    *(_DWORD *)buf = 134218498;
    v36 = self;
    v37 = 2114;
    v38 = cachedSceneLogDigest;
    v39 = 2114;
    v40 = v7;
    _os_log_impl(&dword_1B711E000, v8, OS_LOG_TYPE_DEFAULT, "[%p-%{public}@] Received actions: %{public}@", buf, 0x20u);
  }

  if (!self->_invalidated)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v11 = v7;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (!v12)
      goto LABEL_12;
    v13 = *(_QWORD *)v31;
LABEL_6:
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v31 != v13)
        objc_enumerationMutation(v11);
      v15 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v14);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      if (v12 == ++v14)
      {
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
        if (v12)
          goto LABEL_6;
LABEL_12:
        v16 = 0;
LABEL_25:

        goto LABEL_26;
      }
    }
    v17 = objc_opt_class();
    v18 = v15;
    if (v17)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v19 = v18;
      else
        v19 = 0;
    }
    else
    {
      v19 = 0;
    }
    v16 = v19;

    objc_msgSend(v10, "removeObject:", v18, (_QWORD)v30);
    if (v16)
    {
      objc_msgSend(v16, "launchRequest");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v21 = objc_opt_respondsToSelector();

      if (((v11 != 0) & v21) == 1)
      {
        v22 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v22, "widgetHostViewController:requestsLaunch:", self, v11);
      }
      else
      {
        objc_msgSend(v11, "launchAction");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v23)
          goto LABEL_25;
        v24 = objc_loadWeakRetained((id *)&self->_delegate);
        v25 = objc_opt_respondsToSelector();

        if ((v25 & 1) == 0)
          goto LABEL_25;
        v22 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v11, "launchAction");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "widgetHostViewController:requestsLaunchWithAction:", self, v26);

      }
      goto LABEL_25;
    }
LABEL_26:
    -[CHUISWidgetHostViewController handleActions:](self, "handleActions:", v10, (_QWORD)v30);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)objc_msgSend(v27, "mutableCopy");

    if (objc_msgSend(v28, "count"))
      v29 = (id)-[BLSHBacklightFBSceneEnvironmentActionHandler respondToActions:forFBScene:](self->_sceneBacklightActionHandler, "respondToActions:forFBScene:", v28, v6);

  }
}

- (void)sceneDidDeactivate:(id)a3 withError:(id)a4
{
  FBScene *v6;
  id v7;
  NSObject *v8;
  NSString *cachedSceneLogDigest;
  void *v10;
  int v11;
  NSObject *v12;
  NSString *v13;
  NSObject *v14;
  NSString *v15;
  FBScene *scene;
  int v17;
  CHUISWidgetHostViewController *v18;
  __int16 v19;
  NSString *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = (FBScene *)a3;
  v7 = a4;
  BSDispatchQueueAssertMain();
  if (self->_scene == v6)
  {
    CHUISLogViewController();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      cachedSceneLogDigest = self->_cachedSceneLogDigest;
      v17 = 134218498;
      v18 = self;
      v19 = 2114;
      v20 = cachedSceneLogDigest;
      v21 = 2114;
      v22 = v7;
    }

    -[FBScene settings](v6, "settings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isForeground");

    if (!self->_invalidated)
    {
      if (v11)
      {
        CHUISLogViewController();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          v13 = self->_cachedSceneLogDigest;
          v17 = 134218242;
          v18 = self;
          v19 = 2114;
          v20 = v13;
          _os_log_impl(&dword_1B711E000, v12, OS_LOG_TYPE_DEFAULT, "[%p-%{public}@] Scene deactivated but was foreground - reactivating.", (uint8_t *)&v17, 0x16u);
        }

        -[FBScene activateWithTransitionContext:](v6, "activateWithTransitionContext:", 0);
      }
      else
      {
        CHUISLogViewController();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          v15 = self->_cachedSceneLogDigest;
          v17 = 134218242;
          v18 = self;
          v19 = 2114;
          v20 = v15;
          _os_log_impl(&dword_1B711E000, v14, OS_LOG_TYPE_DEFAULT, "[%p-%{public}@] Scene deactivated but was background - invalidating.", (uint8_t *)&v17, 0x16u);
        }

        -[FBScene invalidate](self->_scene, "invalidate");
        scene = self->_scene;
        self->_scene = 0;

      }
    }
  }

}

- (void)sceneContentStateDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  NSString *cachedSceneLogDigest;
  void *v7;
  unint64_t effectivePresentationMode;
  _QWORD block[5];
  uint8_t buf[4];
  CHUISWidgetHostViewController *v11;
  __int16 v12;
  NSString *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  BSDispatchQueueAssertMain();
  CHUISLogViewController();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    cachedSceneLogDigest = self->_cachedSceneLogDigest;
    objc_msgSend(v4, "contentState");
    NSStringFromFBSceneContentState();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v11 = self;
    v12 = 2114;
    v13 = cachedSceneLogDigest;
    v14 = 2114;
    v15 = v7;
    _os_log_impl(&dword_1B711E000, v5, OS_LOG_TYPE_INFO, "[%p-%{public}@] Content state did change to %{public}@", buf, 0x20u);

  }
  if (objc_msgSend(v4, "contentState") == 2)
  {
    -[CHUISWidgetHostViewController _executeSceneContentReadyOperations](self, "_executeSceneContentReadyOperations");
    effectivePresentationMode = self->_effectivePresentationMode;
    if (effectivePresentationMode == 2)
    {
      -[CHUISWidgetHostViewController _hideSnapshotViewsAnimated:](self, "_hideSnapshotViewsAnimated:", 1);
      effectivePresentationMode = self->_effectivePresentationMode;
    }
    if (effectivePresentationMode == 3)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __60__CHUISWidgetHostViewController_sceneContentStateDidChange___block_invoke;
      block[3] = &unk_1E6B84AF0;
      block[4] = self;
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }
  }
  -[CHUISWidgetHostViewController _updateBackgroundMaterialAndColor](self, "_updateBackgroundMaterialAndColor");

}

_QWORD *__60__CHUISWidgetHostViewController_sceneContentStateDidChange___block_invoke(uint64_t a1)
{
  _QWORD *result;

  result = *(_QWORD **)(a1 + 32);
  if (result[160] == 3)
  {
    objc_msgSend(result, "_ensureAndEvaluateSnapshotView");
    return (_QWORD *)objc_msgSend(*(id *)(a1 + 32), "_updateSceneToForeground:", 0);
  }
  return result;
}

- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  id v18;

  v18 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  BSDispatchQueueAssertMain();
  if (v12)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CHUISWidgetHostViewController.m"), 1611, CFSTR("Invalidtype of client settings received: %@"), v17);

    }
  }
  objc_msgSend(v18, "clientSettings");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CHUISWidgetHostViewController sceneDidUpdateClientSettingsWithDiff:oldClientSettings:newClientSettings:transitionContext:](self, "sceneDidUpdateClientSettingsWithDiff:oldClientSettings:newClientSettings:transitionContext:", v11, v12, v14, v13);

}

- (id)_persistedSnapshotContext
{
  void *v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t colorScheme;
  _BOOL8 v7;
  id v8;
  FBScene *scene;
  void *v10;
  void *v11;
  FBScene *v12;
  void *v13;
  void *v14;
  void *v15;

  -[CHUISWidgetHostViewController traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceStyle");

  if (v4 <= 1)
    v5 = 1;
  else
    v5 = v4;
  colorScheme = self->_colorScheme;
  if (colorScheme == 2)
    v5 = 2;
  if (colorScheme == 1)
    v5 = 1;
  v7 = v5 < 2;
  v8 = objc_alloc_init(MEMORY[0x1E0D100A0]);
  objc_msgSend(v8, "setColorScheme:", v7);
  scene = self->_scene;
  if (scene)
  {
    -[FBScene settings](self->_scene, "settings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "tintParameters");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[CHUISWidgetHostViewController tintParameters](self, "tintParameters");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v11;
  }
  objc_msgSend(v8, "setTintParameters:", v11);
  if (scene)

  objc_msgSend(v8, "setAllowsPrivacySensitiveContent:", -[CHUISWidgetHostViewController _shouldBeEffectivelyLocked](self, "_shouldBeEffectivelyLocked") ^ 1);
  objc_msgSend(v8, "setUserWantsWidgetDataWhenPasscodeLocked:", -[CHUISPreferences userWantsWidgetDataWhenPasscodeLocked](self->_preferences, "userWantsWidgetDataWhenPasscodeLocked"));
  v12 = self->_scene;
  if (v12)
  {
    -[FBScene settings](self->_scene, "settings");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "additionalSnapshotPresentationContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[CHUISWidgetHostViewController additionalSnapshotPresentationContext](self, "additionalSnapshotPresentationContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v14;
  }
  objc_msgSend(v8, "setAdditionalSettingsContext:", v14);
  if (v12)

  -[CHSScreenshotManager snapshotContextForWidget:metrics:attributes:](self->_screenshotManager, "snapshotContextForWidget:metrics:attributes:", self->_widget, self->_metrics, v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)_newPersistedSnapshotView
{
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t signpostID;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  os_signpost_id_t v14;
  NSString *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  os_signpost_id_t v20;
  NSString *v21;
  void *v22;
  void *v23;
  NSString *cachedSceneLogDigest;
  void *v26;
  int v27;
  NSString *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  CHUISLogViewController();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  signpostID = self->_signpostID;
  if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    LOWORD(v27) = 0;
    _os_signpost_emit_with_name_impl(&dword_1B711E000, v4, OS_SIGNPOST_INTERVAL_BEGIN, signpostID, "FetchPersistedSnapshot", ", (uint8_t *)&v27, 2u);
  }

  -[CHUISWidgetHostViewController _persistedSnapshotContext](self, "_persistedSnapshotContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    if (objc_msgSend(v6, "needsCAPackage"))
    {
      v8 = objc_alloc(MEMORY[0x1E0DC4060]);
      objc_msgSend(v7, "url");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v8, "initWithContentsOfURL:publishedObjectViewClassMap:", v9, 0);

      CHUISLogViewController();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        cachedSceneLogDigest = self->_cachedSceneLogDigest;
        objc_msgSend(v7, "url");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 138412802;
        v28 = cachedSceneLogDigest;
        v29 = 2114;
        v30 = v10;
        v31 = 2114;
        v32 = v26;
        _os_log_debug_impl(&dword_1B711E000, v11, OS_LOG_TYPE_DEBUG, "Read caar snapshot for %@! view: %{public}@ - url: %{public}@", (uint8_t *)&v27, 0x20u);

      }
      CHUISLogViewController();
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = v12;
      v14 = self->_signpostID;
      if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
      {
        objc_msgSend(v7, "url");
        v15 = (NSString *)objc_claimAutoreleasedReturnValue();
        v27 = 138412290;
        v28 = v15;
        _os_signpost_emit_with_name_impl(&dword_1B711E000, v13, OS_SIGNPOST_INTERVAL_END, v14, "FetchPersistedSnapshot", "caar - <url>=%@", (uint8_t *)&v27, 0xCu);

      }
    }
    else
    {
      objc_msgSend(v7, "url");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[CHUISWidgetHostViewController _snapshotImageFromURL:](self, "_snapshotImageFromURL:", v16);
      v13 = objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v13);
        CHUISLogViewController();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          -[CHUISWidgetHostViewController _newPersistedSnapshotView].cold.1((uint64_t)self, v17);

      }
      else
      {
        v10 = 0;
      }
      CHUISLogViewController();
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = v18;
      v20 = self->_signpostID;
      if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
      {
        objc_msgSend(v7, "url");
        v21 = (NSString *)objc_claimAutoreleasedReturnValue();
        v27 = 138412290;
        v28 = v21;
        _os_signpost_emit_with_name_impl(&dword_1B711E000, v19, OS_SIGNPOST_INTERVAL_END, v20, "FetchPersistedSnapshot", "image - <url>=%@", (uint8_t *)&v27, 0xCu);

      }
    }

    objc_msgSend(v10, "layer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "attributes");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[CHUISWidgetHostViewController _applySecurityPolicyToLayer:allowsPrivacySensitiveContent:](self, "_applySecurityPolicyToLayer:allowsPrivacySensitiveContent:", v22, objc_msgSend(v23, "allowsPrivacySensitiveContent"));

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)_setCanAppearInSecureEnvironment:(BOOL)a3 force:(BOOL)a4
{
  _BOOL8 v5;
  NSObject *v7;
  NSString *cachedSceneLogDigest;
  void *v9;
  CHUISKeybag *keybag;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  uint8_t buf[4];
  CHUISWidgetHostViewController *v17;
  __int16 v18;
  NSString *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v5 = a3;
  v22 = *MEMORY[0x1E0C80C00];
  BSDispatchQueueAssertMain();
  if (a4 || (BSEqualBools() & 1) == 0)
  {
    self->_canAppearInSecureEnvironment = v5;
    CHUISLogViewController();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      cachedSceneLogDigest = self->_cachedSceneLogDigest;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v17 = self;
      v18 = 2114;
      v19 = cachedSceneLogDigest;
      v20 = 2114;
      v21 = v9;
      _os_log_impl(&dword_1B711E000, v7, OS_LOG_TYPE_DEFAULT, "[%p-%{public}@] Can appear in secure environment changed to %{public}@", buf, 0x20u);

    }
    keybag = self->_keybag;
    if (self->_canAppearInSecureEnvironment)
    {
      -[CHUISKeybag addObserver:](keybag, "addObserver:", self);
      -[CHUISWidgetHostViewController view](self, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "layer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setSecurityMode:", *MEMORY[0x1E0CD2FF8]);

      -[CHUISWidgetHostViewController _evaluateEffectiveInSecureEnvironmentForReason:](self, "_evaluateEffectiveInSecureEnvironmentForReason:", CFSTR("Can appear in secure environment"));
    }
    else
    {
      -[CHUISKeybag removeObserver:](keybag, "removeObserver:", self);
      -[CHUISWidgetHostViewController view](self, "view");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "layer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setSecurityMode:", *MEMORY[0x1E0CD2FF0]);

      -[CHUISWidgetHostViewController _setInSecureEnvironment:forReason:](self, "_setInSecureEnvironment:forReason:", 0, CFSTR("Not eligible for showing in a secure environment"));
    }
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __72__CHUISWidgetHostViewController__setCanAppearInSecureEnvironment_force___block_invoke;
    v15[3] = &unk_1E6B84C28;
    v15[4] = self;
    -[CHUISWidgetHostViewController modifySceneSettings:](self, "modifySceneSettings:", v15);
  }
}

uint64_t __72__CHUISWidgetHostViewController__setCanAppearInSecureEnvironment_force___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "setCanAppearInSecureEnvironment:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 1176));
  return 0;
}

- (void)_applySecurityPolicyToLayer:(id)a3
{
  id v4;

  v4 = a3;
  -[CHUISWidgetHostViewController _applySecurityPolicyToLayer:allowsPrivacySensitiveContent:](self, "_applySecurityPolicyToLayer:allowsPrivacySensitiveContent:", v4, -[CHUISWidgetHostViewController _shouldBeEffectivelyLocked](self, "_shouldBeEffectivelyLocked") ^ 1);

}

- (void)_applySecurityPolicyToLayer:(id)a3 allowsPrivacySensitiveContent:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  NSObject *v6;
  uint64_t v7;

  v4 = a4;
  v5 = a3;
  if (v4)
  {
    CHUISLogViewController();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[CHUISWidgetHostViewController _applySecurityPolicyToLayer:allowsPrivacySensitiveContent:].cold.1();
    v7 = 64;
  }
  else
  {
    CHUISLogViewController();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[CHUISWidgetHostViewController _applySecurityPolicyToLayer:allowsPrivacySensitiveContent:].cold.2();
    v7 = 0;
  }

  objc_msgSend(v5, "setDisableUpdateMask:", v7);
}

- (id)_snapshotImageFromURL:(id)a3
{
  id v3;
  void *v4;
  const __CFDictionary *v5;
  void *v6;
  CGImageSource *v7;
  CGImage *ImageAtIndex;
  void *v9;
  void *values[3];
  void *keys[4];

  keys[3] = *(void **)MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    keys[0] = CFSTR("kCGImageSourceSkipCRC");
    keys[1] = CFSTR("kCGImageSourceSkipMetadata");
    keys[2] = *(void **)MEMORY[0x1E0CBD2A8];
    v4 = (void *)*MEMORY[0x1E0C9AE50];
    values[0] = *(void **)MEMORY[0x1E0C9AE40];
    values[1] = v4;
    values[2] = CFSTR("com.apple.atx");
    v5 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, 3, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    objc_msgSend(v3, "path");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (CGImageSource *)CGImageSourceCreateWithFile();

    if (v7 && (ImageAtIndex = CGImageSourceCreateImageAtIndex(v7, 0, v5), CFRelease(v7), ImageAtIndex))
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3870]), "initWithCGImage:", ImageAtIndex);
      CGImageRelease(ImageAtIndex);
    }
    else
    {
      v9 = 0;
    }
    CFRelease(v5);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)_createWidgetSnapshotViews
{
  UIView *v3;
  UIView *persistedWidgetSnapshotViewContainer;
  UIView *v5;
  void *v6;
  UIImageView *v7;
  UIImageView *persistedWidgetSnapshotImageView;
  UIImageView *v9;
  void *v10;
  UIView *v11;
  UIView *liveSceneSnapshotView;
  void *v13;
  UIView *v14;
  CHUISTouchPassThroughView *v15;
  UIView *v16;
  UIView *snapshotDebugView;
  UIView *v18;
  void *v19;
  void *v20;
  UIView *v21;
  void *v22;
  void *v23;
  void *v24;
  UILabel *v25;
  UILabel *snapshotDebugLabel;
  UILabel *v27;
  void *v28;
  UILabel *v29;
  void *v30;
  UILabel *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;

  -[CHUISWidgetHostViewController _containerView](self, "_containerView");
  v35 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
  persistedWidgetSnapshotViewContainer = self->_persistedWidgetSnapshotViewContainer;
  self->_persistedWidgetSnapshotViewContainer = v3;

  v5 = self->_persistedWidgetSnapshotViewContainer;
  objc_msgSend(v35, "bounds");
  -[UIView setFrame:](v5, "setFrame:");
  -[UIView setAutoresizingMask:](self->_persistedWidgetSnapshotViewContainer, "setAutoresizingMask:", 18);
  -[UIView layer](self->_persistedWidgetSnapshotViewContainer, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setName:", CFSTR("Snapshot Container"));

  -[UIView setClipsToBounds:](self->_persistedWidgetSnapshotViewContainer, "setClipsToBounds:", 1);
  -[UIView setHidden:](self->_persistedWidgetSnapshotViewContainer, "setHidden:", 1);
  -[UIView setAlpha:](self->_persistedWidgetSnapshotViewContainer, "setAlpha:", 0.0);
  objc_msgSend(v35, "addSubview:", self->_persistedWidgetSnapshotViewContainer);
  v7 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", 0);
  persistedWidgetSnapshotImageView = self->_persistedWidgetSnapshotImageView;
  self->_persistedWidgetSnapshotImageView = v7;

  v9 = self->_persistedWidgetSnapshotImageView;
  objc_msgSend(v35, "bounds");
  -[UIImageView setFrame:](v9, "setFrame:");
  -[UIImageView layer](self->_persistedWidgetSnapshotImageView, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setName:", CFSTR("Persistent Image View"));

  -[UIImageView setAutoresizingMask:](self->_persistedWidgetSnapshotImageView, "setAutoresizingMask:", 18);
  -[UIImageView setClipsToBounds:](self->_persistedWidgetSnapshotImageView, "setClipsToBounds:", 1);
  -[UIImageView setHidden:](self->_persistedWidgetSnapshotImageView, "setHidden:", 1);
  -[UIImageView setAlpha:](self->_persistedWidgetSnapshotImageView, "setAlpha:", 0.0);
  -[UIView addSubview:](self->_persistedWidgetSnapshotViewContainer, "addSubview:", self->_persistedWidgetSnapshotImageView);
  v11 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
  liveSceneSnapshotView = self->_liveSceneSnapshotView;
  self->_liveSceneSnapshotView = v11;

  -[UIView layer](self->_liveSceneSnapshotView, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setName:", CFSTR("Live Scene Snapshot View"));

  v14 = self->_liveSceneSnapshotView;
  objc_msgSend(v35, "bounds");
  -[UIView setFrame:](v14, "setFrame:");
  -[UIView setClipsToBounds:](self->_liveSceneSnapshotView, "setClipsToBounds:", 1);
  -[UIView setHidden:](self->_liveSceneSnapshotView, "setHidden:", 1);
  -[UIView setAlpha:](self->_liveSceneSnapshotView, "setAlpha:", 0.0);
  -[UIView setAutoresizingMask:](self->_liveSceneSnapshotView, "setAutoresizingMask:", 18);
  objc_msgSend(v35, "addSubview:", self->_liveSceneSnapshotView);
  if (-[CHUISPreferences debugSnapshotViewColoring](self->_preferences, "debugSnapshotViewColoring"))
  {
    v15 = [CHUISTouchPassThroughView alloc];
    v16 = -[CHUISTouchPassThroughView initWithFrame:](v15, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    snapshotDebugView = self->_snapshotDebugView;
    self->_snapshotDebugView = v16;

    v18 = self->_snapshotDebugView;
    objc_msgSend(MEMORY[0x1E0DC3658], "yellowColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "colorWithAlphaComponent:", 0.7);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v18, "setBackgroundColor:", v20);

    v21 = self->_snapshotDebugView;
    -[CHUISWidgetHostViewController view](self, "view");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "bounds");
    -[UIView setFrame:](v21, "setFrame:");

    -[UIView layer](self->_snapshotDebugView, "layer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setName:", CFSTR("Snapshot Debug View"));

    -[UIView setClipsToBounds:](self->_snapshotDebugView, "setClipsToBounds:", 1);
    -[UIView setHidden:](self->_snapshotDebugView, "setHidden:", 1);
    -[UIView setAlpha:](self->_snapshotDebugView, "setAlpha:", 0.0);
    -[UIView setAutoresizingMask:](self->_snapshotDebugView, "setAutoresizingMask:", 18);
    -[CHUISWidgetHostViewController view](self, "view");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addSubview:", self->_snapshotDebugView);

  }
  if (-[CHUISPreferences debugViewLabels](self->_preferences, "debugViewLabels"))
  {
    v25 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    snapshotDebugLabel = self->_snapshotDebugLabel;
    self->_snapshotDebugLabel = v25;

    v27 = self->_snapshotDebugLabel;
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 16.0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v27, "setFont:", v28);

    -[UILabel setTextAlignment:](self->_snapshotDebugLabel, "setTextAlignment:", 1);
    v29 = self->_snapshotDebugLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.75);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v29, "setTextColor:", v30);

    v31 = self->_snapshotDebugLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.9, 0.75);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v31, "setBackgroundColor:", v32);

    -[UILabel layer](self->_snapshotDebugLabel, "layer");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setName:", CFSTR("Snapshot Debug Label"));

    -[UILabel setHidden:](self->_snapshotDebugLabel, "setHidden:", 1);
    -[UILabel setAlpha:](self->_snapshotDebugLabel, "setAlpha:", 0.0);
    -[UILabel setAutoresizingMask:](self->_snapshotDebugLabel, "setAutoresizingMask:", 45);
    -[CHUISWidgetHostViewController view](self, "view");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addSubview:", self->_snapshotDebugLabel);

  }
  -[CHUISWidgetHostViewController _updateViewsCornerRadius](self, "_updateViewsCornerRadius");

}

- (void)_updateViewsCornerRadius
{
  double v3;
  double v4;
  double v5;
  double v6;
  id v7;
  id v8;

  -[CHUISWidgetHostViewController _effectiveViewCornerRadius](self, "_effectiveViewCornerRadius");
  v4 = v3;
  -[UIView _setContinuousCornerRadius:](self->_persistedWidgetSnapshotViewContainer, "_setContinuousCornerRadius:");
  -[UIImageView _setContinuousCornerRadius:](self->_persistedWidgetSnapshotImageView, "_setContinuousCornerRadius:", v4);
  -[UIView _setContinuousCornerRadius:](self->_liveSceneSnapshotView, "_setContinuousCornerRadius:", v4);
  -[UIScenePresenter presentationView](self->_scenePresenter, "presentationView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_setContinuousCornerRadius:", v4);

  -[CHUISWidgetHostViewController _effectiveCornerRadius](self, "_effectiveCornerRadius");
  v6 = v5;
  -[UIView _setContinuousCornerRadius:](self->_snapshotDebugView, "_setContinuousCornerRadius:");
  -[UILabel _setContinuousCornerRadius:](self->_snapshotDebugLabel, "_setContinuousCornerRadius:", v6);
  -[UIVisualEffectView _setContinuousCornerRadius:](self->_materialView, "_setContinuousCornerRadius:", v6);
  -[UIVisualEffectView layer](self->_materialView, "layer");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCornerRadius:", v6);

}

- (void)_updateSnapshotDebugLabelText:(id)a3
{
  UILabel *snapshotDebugLabel;
  UILabel *v5;
  void *v6;
  id v7;
  CGRect v8;
  CGRect v9;

  v7 = a3;
  -[UILabel setText:](self->_snapshotDebugLabel, "setText:");
  -[UILabel sizeToFit](self->_snapshotDebugLabel, "sizeToFit");
  snapshotDebugLabel = self->_snapshotDebugLabel;
  -[UILabel bounds](snapshotDebugLabel, "bounds");
  v9 = CGRectInset(v8, -4.0, -4.0);
  -[UILabel setBounds:](snapshotDebugLabel, "setBounds:", v9.origin.x, v9.origin.y, v9.size.width, v9.size.height);
  v5 = self->_snapshotDebugLabel;
  -[CHUISWidgetHostViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  UIRectGetCenter();
  -[UILabel setCenter:](v5, "setCenter:");

}

- (BOOL)_canLiveSnapshot
{
  void *v3;
  char v4;

  -[CHSWidget extensionBundleIdentifier](self->_widget, "extensionBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.mobiletimer.WorldClockWidget"));

  if ((v4 & 1) != 0)
    return 0;
  else
    return !-[CHUISPreferences debugPrefersStaticSnapshots](self->_preferences, "debugPrefersStaticSnapshots");
}

- (void)_applyLiveSnapshotContentsFromSnapshot:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "IOSurface");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(objc_retainAutorelease(v6), "CGImage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[UIView layer](self->_liveSceneSnapshotView, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContents:", v4);

  -[UIView setClipsToBounds:](self->_liveSceneSnapshotView, "setClipsToBounds:", 1);
}

- (void)_ensureAndEvaluateSnapshotView
{
  unint64_t effectivePresentationMode;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSString *cachedSceneLogDigest;
  void *v10;
  void *v11;
  UIView *snapshotDebugView;
  void *v13;
  void *v14;
  UILabel *snapshotDebugLabel;
  UIView *v16;
  UIView **p_snapshotDebugView;
  void *v18;
  int v19;
  CHUISWidgetHostViewController *v20;
  __int16 v21;
  NSString *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  effectivePresentationMode = self->_effectivePresentationMode;
  if (!effectivePresentationMode)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    effectivePresentationMode = self->_effectivePresentationMode;
  }
  if (effectivePresentationMode == 2 && -[FBScene contentState](self->_scene, "contentState") == 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CHUISWidgetHostViewController.m"), 1874, CFSTR("Live mode can only show a snapshot when the scene does not have content."));

  }
  if (-[CHUISWidgetHostViewController canAppearInSecureEnvironment](self, "canAppearInSecureEnvironment")
    && -[CHUISWidgetHostViewController _inSecureEnvironmentTriState](self, "_inSecureEnvironmentTriState") == 1
    || (self->_effectivePresentationMode & 0xFFFFFFFFFFFFFFFELL) != 2
    || !CHUISHasGlobalCaptureEntitlement())
  {
    goto LABEL_15;
  }
  -[UIView layer](self->_liveSceneSnapshotView, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    goto LABEL_17;
  if (-[FBScene contentState](self->_scene, "contentState") == 2)
  {
    -[CHUISWidgetHostViewController _hideSnapshotViewsAnimated:](self, "_hideSnapshotViewsAnimated:", 0);
    CHUISLogViewController();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      cachedSceneLogDigest = self->_cachedSceneLogDigest;
      v19 = 134218242;
      v20 = self;
      v21 = 2114;
      v22 = cachedSceneLogDigest;
      _os_log_impl(&dword_1B711E000, v8, OS_LOG_TYPE_DEFAULT, "[%p-%{public}@] Create live scene snapshot view.", (uint8_t *)&v19, 0x16u);
    }

    v10 = (void *)-[UIScenePresenter newSnapshot](self->_scenePresenter, "newSnapshot");
    -[CHUISWidgetHostViewController _applyLiveSnapshotContentsFromSnapshot:](self, "_applyLiveSnapshotContentsFromSnapshot:", v10);

    -[UIView layer](self->_liveSceneSnapshotView, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CHUISWidgetHostViewController _applySecurityPolicyToLayer:](self, "_applySecurityPolicyToLayer:", v11);

    -[UIView setHidden:](self->_liveSceneSnapshotView, "setHidden:", 0);
    -[UIView setAlpha:](self->_liveSceneSnapshotView, "setAlpha:", 1.0);
    snapshotDebugView = self->_snapshotDebugView;
    objc_msgSend(MEMORY[0x1E0DC3658], "orangeColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "colorWithAlphaComponent:", 0.7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](snapshotDebugView, "setBackgroundColor:", v14);

    -[CHUISWidgetHostViewController _updateSnapshotDebugLabelText:](self, "_updateSnapshotDebugLabelText:", CFSTR("LIVE SNAPSHOT"));
  }
  else
  {
LABEL_15:
    if (!-[CHUISWidgetHostViewController _isPersistedSnapshotContentVisible](self, "_isPersistedSnapshotContentVisible"))
    {
      -[CHUISWidgetHostViewController _hideSnapshotViewsAnimated:](self, "_hideSnapshotViewsAnimated:", 0);
      -[CHUISWidgetHostViewController _updatePersistedSnapshotContent](self, "_updatePersistedSnapshotContent");
    }
  }
LABEL_17:
  snapshotDebugLabel = self->_snapshotDebugLabel;
  if (snapshotDebugLabel && -[UILabel isHidden](snapshotDebugLabel, "isHidden"))
  {
    -[UILabel setHidden:](self->_snapshotDebugLabel, "setHidden:", 0);
    -[UILabel setAlpha:](self->_snapshotDebugLabel, "setAlpha:", 1.0);
  }
  v16 = self->_snapshotDebugView;
  if (v16)
  {
    if (-[UIView isHidden](v16, "isHidden"))
    {
      p_snapshotDebugView = &self->_snapshotDebugView;
      -[UIView setHidden:](*p_snapshotDebugView, "setHidden:", 0);
      -[UIView setAlpha:](*p_snapshotDebugView, "setAlpha:", 1.0);
    }
  }
}

- (BOOL)_isPersistedSnapshotContentVisible
{
  char v3;
  void *v4;
  BOOL v5;

  -[UIView alpha](self->_persistedWidgetSnapshotViewContainer, "alpha");
  v3 = BSFloatEqualToFloat();
  -[UIImageView image](self->_persistedWidgetSnapshotImageView, "image");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = 1;
  else
    v5 = self->_persistedWidgetSnapshotCaarView != 0;

  return v5 & ~v3;
}

- (void)_updatePersistedSnapshotContentIfNecessary
{
  if ((self->_effectivePresentationMode | 2) == 3)
  {
    if (-[CHUISWidgetHostViewController _isPersistedSnapshotContentVisible](self, "_isPersistedSnapshotContentVisible"))
      -[CHUISWidgetHostViewController _updatePersistedSnapshotContent](self, "_updatePersistedSnapshotContent");
  }
}

- (void)_updatePersistedSnapshotContent
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3(&dword_1B711E000, v0, v1, "[%p-%{public}@] Create image snapshot view.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)_hideSnapshotViewsAnimated:(BOOL)a3
{
  -[CHUISWidgetHostViewController _hideSnapshotViewsAnimated:forceCompleteTeardown:](self, "_hideSnapshotViewsAnimated:forceCompleteTeardown:", a3, 0);
}

- (void)_hideSnapshotViewsAnimated:(BOOL)a3 forceCompleteTeardown:(BOOL)a4
{
  _BOOL4 v4;
  unint64_t v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t signpostID;
  NSObject *v10;
  uint64_t v11;
  void (**v12)(_QWORD);
  void *v13;
  void *v14;
  _QWORD v15[4];
  void (**v16)(_QWORD);
  _QWORD v17[5];
  _QWORD aBlock[6];
  BOOL v19;
  uint8_t buf[16];

  v4 = a3;
  if (a4
    || !-[UIView isHidden](self->_liveSceneSnapshotView, "isHidden")
    || !-[UIView isHidden](self->_persistedWidgetSnapshotViewContainer, "isHidden"))
  {
    v6 = self->_snapshotHidingSequence + 1;
    self->_snapshotHidingSequence = v6;
    CHUISLogViewController();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    signpostID = self->_signpostID;
    if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B711E000, v8, OS_SIGNPOST_EVENT, signpostID, "TeardownSnapshotView", ", buf, 2u);
    }

    CHUISLogViewController();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[CHUISWidgetHostViewController _hideSnapshotViewsAnimated:forceCompleteTeardown:].cold.1();

    v11 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __82__CHUISWidgetHostViewController__hideSnapshotViewsAnimated_forceCompleteTeardown___block_invoke;
    aBlock[3] = &unk_1E6B84FB0;
    v19 = v4;
    aBlock[4] = self;
    aBlock[5] = v6;
    v12 = (void (**)(_QWORD))_Block_copy(aBlock);
    v13 = v12;
    if (v4 && !self->_disableViewTransitionAnimations)
    {
      v14 = (void *)MEMORY[0x1E0DC3F10];
      v17[0] = v11;
      v17[1] = 3221225472;
      v17[2] = __82__CHUISWidgetHostViewController__hideSnapshotViewsAnimated_forceCompleteTeardown___block_invoke_201;
      v17[3] = &unk_1E6B84AF0;
      v17[4] = self;
      v15[0] = v11;
      v15[1] = 3221225472;
      v15[2] = __82__CHUISWidgetHostViewController__hideSnapshotViewsAnimated_forceCompleteTeardown___block_invoke_2;
      v15[3] = &unk_1E6B84FD8;
      v16 = v12;
      objc_msgSend(v14, "animateWithDuration:animations:completion:", v17, v15, 0.4);

    }
    else
    {
      v12[2](v12);
    }

  }
}

uint64_t __82__CHUISWidgetHostViewController__hideSnapshotViewsAnimated_forceCompleteTeardown___block_invoke(uint64_t result)
{
  uint64_t v1;
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v1 = result;
  if (!*(_BYTE *)(result + 48) || *(_QWORD *)(result + 40) == *(_QWORD *)(*(_QWORD *)(result + 32) + 1216))
  {
    CHUISLogViewController();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      __82__CHUISWidgetHostViewController__hideSnapshotViewsAnimated_forceCompleteTeardown___block_invoke_cold_1();

    objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 1032), "removeFromSuperview");
    v3 = *(_QWORD *)(v1 + 32);
    v4 = *(void **)(v3 + 1032);
    *(_QWORD *)(v3 + 1032) = 0;

    objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 1040), "setImage:", 0);
    objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 1024), "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setContents:", 0);

    objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 1024), "setHidden:", 1);
    objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 1048), "setHidden:", 1);
    objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 1056), "setHidden:", 1);
    objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 1064), "setHidden:", 1);
    objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 1024), "setAlpha:", 0.0);
    objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 1048), "setAlpha:", 0.0);
    objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 1056), "setAlpha:", 0.0);
    return objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 1064), "setAlpha:", 0.0);
  }
  return result;
}

uint64_t __82__CHUISWidgetHostViewController__hideSnapshotViewsAnimated_forceCompleteTeardown___block_invoke_201(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1024), "setAlpha:", 0.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1048), "setAlpha:", 0.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1056), "setAlpha:", 0.0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1064), "setAlpha:", 0.0);
}

uint64_t __82__CHUISWidgetHostViewController__hideSnapshotViewsAnimated_forceCompleteTeardown___block_invoke_2(uint64_t a1)
{
  BSDispatchQueueAssertMain();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_executeSceneContentReadyOperations
{
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSMutableArray **p_waitForSceneContentReadyBlocks;
  NSMutableArray *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (-[FBScene contentState](self->_scene, "contentState") != 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CHUISWidgetHostViewController.m"), 2073, CFSTR("Scene content state was not ready"));

  }
  if (-[NSMutableArray count](self->_waitForSceneContentReadyBlocks, "count"))
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v4 = self->_waitForSceneContentReadyBlocks;
    v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v12;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v12 != v6)
            objc_enumerationMutation(v4);
          (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v7) + 16))(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v7));
          ++v7;
        }
        while (v5 != v7);
        v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v5);
    }

    p_waitForSceneContentReadyBlocks = &self->_waitForSceneContentReadyBlocks;
    -[NSMutableArray removeAllObjects](*p_waitForSceneContentReadyBlocks, "removeAllObjects", (_QWORD)v11);
    v9 = *p_waitForSceneContentReadyBlocks;
    *p_waitForSceneContentReadyBlocks = 0;

  }
}

- (id)_containerView
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[BSUIVibrancyEffectView contentView](self->_vibrancyEffectView, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[CHUISWidgetHostViewController view](self, "view");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (double)_effectiveCornerRadius
{
  double result;

  if (!self->_metricsDefineSize)
    return 0.0;
  -[CHSWidgetMetrics _effectiveCornerRadius](self->_metrics, "_effectiveCornerRadius");
  return result;
}

- (double)_effectiveViewCornerRadius
{
  double result;

  if (self->_clipBehavior)
    return 0.0;
  -[CHUISWidgetHostViewController _effectiveCornerRadius](self, "_effectiveCornerRadius");
  return result;
}

- (unint64_t)_inSecureEnvironmentTriState
{
  return self->_inSecureEnvironmentTriState;
}

- (void)_setInSecureEnvironment:(unint64_t)a3 forReason:(id)a4
{
  id v6;
  NSObject *v7;
  NSString *cachedSceneLogDigest;
  __CFString *v9;
  __CFString *v10;
  int v11;
  CHUISWidgetHostViewController *v12;
  __int16 v13;
  NSString *v14;
  __int16 v15;
  __CFString *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  BSDispatchQueueAssertMain();
  if (self->_inSecureEnvironmentTriState != a3)
  {
    self->_inSecureEnvironmentTriState = a3;
    CHUISLogViewController();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      cachedSceneLogDigest = self->_cachedSceneLogDigest;
      v9 = CFSTR("NotSet");
      if (a3 == 2)
        v9 = CFSTR("No");
      if (a3 == 1)
        v9 = CFSTR("Yes");
      v10 = v9;
      v11 = 134218754;
      v12 = self;
      v13 = 2114;
      v14 = cachedSceneLogDigest;
      v15 = 2114;
      v16 = v10;
      v17 = 2114;
      v18 = v6;
      _os_log_impl(&dword_1B711E000, v7, OS_LOG_TYPE_DEFAULT, "[%p-%{public}@] Secure environment changed to %{public}@ for reason: %{public}@", (uint8_t *)&v11, 0x2Au);

    }
    -[CHUISWidgetHostViewController _hideSnapshotViewsAnimated:forceCompleteTeardown:](self, "_hideSnapshotViewsAnimated:forceCompleteTeardown:", 0, 1);
    -[CHUISWidgetHostViewController _setEffectivePresentationMode:forceExistingRebuild:](self, "_setEffectivePresentationMode:forceExistingRebuild:", self->_effectivePresentationMode, 1);
  }

}

- (void)_evaluateEffectiveInSecureEnvironmentForReason:(id)a3
{
  uint64_t v4;
  id v5;

  v5 = a3;
  if (-[CHUISWidgetHostViewController _shouldBeEffectivelyLocked](self, "_shouldBeEffectivelyLocked"))
    v4 = 1;
  else
    v4 = 2;
  -[CHUISWidgetHostViewController _setInSecureEnvironment:forReason:](self, "_setInSecureEnvironment:forReason:", v4, v5);

}

- (BOOL)_shouldBeEffectivelyLocked
{
  return -[CHUISKeybag isEffectivelyLocked:](self->_keybag, "isEffectivelyLocked:", self->_keybagLockPolicy);
}

- (void)_invalidateDetachedSceneTimerForReason:(id)a3
{
  -[CHUISWidgetHostViewController _invalidateDetachedSceneTimerForReason:ignoreLogging:](self, "_invalidateDetachedSceneTimerForReason:ignoreLogging:", a3, 0);
}

- (void)_invalidateDetachedSceneTimerForReason:(id)a3 ignoreLogging:(BOOL)a4
{
  id v6;
  BSContinuousMachTimer *detachedSceneTimer;
  NSObject *v8;
  NSString *cachedSceneLogDigest;
  BSContinuousMachTimer *v10;
  int v11;
  CHUISWidgetHostViewController *v12;
  __int16 v13;
  NSString *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  detachedSceneTimer = self->_detachedSceneTimer;
  if (detachedSceneTimer)
  {
    if (!a4)
    {
      CHUISLogViewController();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        cachedSceneLogDigest = self->_cachedSceneLogDigest;
        v11 = 134218498;
        v12 = self;
        v13 = 2114;
        v14 = cachedSceneLogDigest;
        v15 = 2114;
        v16 = v6;
        _os_log_impl(&dword_1B711E000, v8, OS_LOG_TYPE_DEFAULT, "[%p-%{public}@] Invalidating detached scene timer for reason: %{public}@", (uint8_t *)&v11, 0x20u);
      }

      detachedSceneTimer = self->_detachedSceneTimer;
    }
    -[BSContinuousMachTimer invalidate](detachedSceneTimer, "invalidate");
    v10 = self->_detachedSceneTimer;
    self->_detachedSceneTimer = 0;

  }
}

- (void)_scheduleEvaluationOfDetachedSceneTimerForReason:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id location;

  v4 = a3;
  BSDispatchQueueAssertMain();
  -[NSMutableArray addObject:](self->_detachedSceneTimerEvaluationReasons, "addObject:", v4);
  CHUISLogViewController();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[CHUISWidgetHostViewController _scheduleEvaluationOfDetachedSceneTimerForReason:].cold.1();

  if (-[NSMutableArray count](self->_detachedSceneTimerEvaluationReasons, "count") == 1)
  {
    objc_initWeak(&location, self);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __82__CHUISWidgetHostViewController__scheduleEvaluationOfDetachedSceneTimerForReason___block_invoke;
    v6[3] = &unk_1E6B85000;
    objc_copyWeak(&v7, &location);
    dispatch_async(MEMORY[0x1E0C80D38], v6);
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }

}

void __82__CHUISWidgetHostViewController__scheduleEvaluationOfDetachedSceneTimerForReason___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  void *v3;
  NSObject *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[146], "componentsJoinedByString:", CFSTR(", "));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    CHUISLogViewController();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __82__CHUISWidgetHostViewController__scheduleEvaluationOfDetachedSceneTimerForReason___block_invoke_cold_1();

    objc_msgSend(v2[146], "removeAllObjects");
    objc_msgSend(v2, "__evaluateDetachedSceneTimerForReason:", v3);

  }
}

- (void)__evaluateDetachedSceneTimerForReason:(id)a3
{
  void *v4;
  uint64_t v5;
  BSContinuousMachTimer *detachedSceneTimer;
  BOOL v7;
  FBScene *scene;
  void *v9;
  int v10;
  NSObject *v11;
  NSString *cachedSceneLogDigest;
  id v13;
  void *v14;
  BSContinuousMachTimer *v15;
  BSContinuousMachTimer *v16;
  BSContinuousMachTimer *v17;
  double detachedSceneTimerInterval;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  CHUISWidgetHostViewController *v22;
  __int16 v23;
  NSString *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[CHUISWidgetHostViewController view](self, "view", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = objc_claimAutoreleasedReturnValue();

  detachedSceneTimer = self->_detachedSceneTimer;
  if ((unint64_t)detachedSceneTimer | v5)
  {
    if (detachedSceneTimer)
      v7 = v5 == 0;
    else
      v7 = 1;
    if (!v7)
      -[CHUISWidgetHostViewController _invalidateDetachedSceneTimerForReason:](self, "_invalidateDetachedSceneTimerForReason:", CFSTR("Window exists"));
  }
  else
  {
    scene = self->_scene;
    if (scene)
    {
      -[FBScene settings](scene, "settings");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isForeground");

      if (v10)
      {
        CHUISLogViewController();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          cachedSceneLogDigest = self->_cachedSceneLogDigest;
          *(_DWORD *)buf = 134218242;
          v22 = self;
          v23 = 2114;
          v24 = cachedSceneLogDigest;
          _os_log_impl(&dword_1B711E000, v11, OS_LOG_TYPE_DEFAULT, "[%p-%{public}@] Detached scene detected. Starting idle timer...", buf, 0x16u);
        }

        -[CHUISWidgetHostViewController _invalidateDetachedSceneTimerForReason:ignoreLogging:](self, "_invalidateDetachedSceneTimerForReason:ignoreLogging:", CFSTR("New timer"), 1);
        objc_initWeak((id *)buf, self);
        v13 = objc_alloc(MEMORY[0x1E0D01720]);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<DetachedLiveSceneTimer-%@>"), self->_cachedSceneLogDigest);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (BSContinuousMachTimer *)objc_msgSend(v13, "initWithIdentifier:", v14);
        v16 = self->_detachedSceneTimer;
        self->_detachedSceneTimer = v15;

        v17 = self->_detachedSceneTimer;
        detachedSceneTimerInterval = self->_detachedSceneTimerInterval;
        v19[0] = MEMORY[0x1E0C809B0];
        v19[1] = 3221225472;
        v19[2] = __71__CHUISWidgetHostViewController___evaluateDetachedSceneTimerForReason___block_invoke;
        v19[3] = &unk_1E6B85028;
        objc_copyWeak(&v20, (id *)buf);
        -[BSContinuousMachTimer scheduleWithFireInterval:leewayInterval:queue:handler:](v17, "scheduleWithFireInterval:leewayInterval:queue:handler:", MEMORY[0x1E0C80D38], v19, detachedSceneTimerInterval, 1.0);
        objc_destroyWeak(&v20);
        objc_destroyWeak((id *)buf);
      }
    }
  }

}

void __71__CHUISWidgetHostViewController___evaluateDetachedSceneTimerForReason___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4 || !v2[124])
    {

    }
    else
    {
      objc_msgSend(v2[124], "settings");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "isForeground");

      if (v6)
      {
        CHUISLogViewController();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          __71__CHUISWidgetHostViewController___evaluateDetachedSceneTimerForReason___block_invoke_cold_1();

        objc_msgSend(v2, "_tearDownScene");
      }
    }
    objc_msgSend(v2, "_invalidateDetachedSceneTimerForReason:", CFSTR("Timer fired (no longer foreground)"));
  }

}

+ (id)_compatibilityMetrics
{
  if (_compatibilityMetrics_onceToken[0] != -1)
    dispatch_once(_compatibilityMetrics_onceToken, &__block_literal_global_215);
  return (id)_compatibilityMetrics___compatibilityMetrics;
}

void __54__CHUISWidgetHostViewController__compatibilityMetrics__block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;

  v0 = objc_alloc(MEMORY[0x1E0D101F0]);
  v1 = objc_msgSend(v0, "initWithSize:cornerRadius:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8), 0.0);
  v2 = (void *)_compatibilityMetrics___compatibilityMetrics;
  _compatibilityMetrics___compatibilityMetrics = v1;

}

- (int)_actualBackgroundViewMode
{
  int v3;
  void *v4;

  if ((-[UIVisualEffectView isHidden](self->_materialView, "isHidden") & 1) != 0)
    return 0;
  -[UIVisualEffectView effect](self->_materialView, "effect");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v3 = 2;
  else
    v3 = 1;

  return v3;
}

- (int)_expectedBackgroundViewMode
{
  uint64_t v4;
  FBScene *scene;

  if (-[CHSWidgetRenderScheme backgroundViewPolicy](self->_renderScheme, "backgroundViewPolicy"))
    return 0;
  v4 = -[CHSWidgetDescriptor preferredBackgroundStyle](self->_descriptor, "preferredBackgroundStyle");
  if (v4 == 2)
    return 2 * self->_drawSystemBackgroundMaterialIfNecessary;
  if (v4)
    return 0;
  scene = self->_scene;
  if (scene)
  {
    if (-[FBScene contentState](scene, "contentState") == 2)
      return 0;
  }
  return 1;
}

- (id)_effectiveBackgroundColor
{
  unint64_t colorScheme;

  colorScheme = self->_colorScheme;
  switch(colorScheme)
  {
    case 2uLL:
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
      self = (CHUISWidgetHostViewController *)objc_claimAutoreleasedReturnValue();
      break;
    case 1uLL:
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      self = (CHUISWidgetHostViewController *)objc_claimAutoreleasedReturnValue();
      break;
    case 0uLL:
      objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
      self = (CHUISWidgetHostViewController *)objc_claimAutoreleasedReturnValue();
      break;
  }
  return self;
}

- (void)_setBackgroundViewMode:(int)a3
{
  UIVisualEffectView *v5;
  UIVisualEffectView *materialView;
  UIVisualEffectView *v7;
  UIVisualEffectView *v8;
  UIVisualEffectView *v9;
  UIVisualEffectView *v10;
  UIVisualEffectView *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;

  if (self->_materialView)
  {
    if (-[CHUISWidgetHostViewController _actualBackgroundViewMode](self, "_actualBackgroundViewMode") == a3)
      return;
  }
  else
  {
    v5 = (UIVisualEffectView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F58]), "initWithEffect:", 0);
    materialView = self->_materialView;
    self->_materialView = v5;

    v7 = self->_materialView;
    -[CHUISWidgetHostViewController view](self, "view");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bounds");
    -[UIVisualEffectView setFrame:](v7, "setFrame:");

    v8 = self->_materialView;
    -[CHUISWidgetHostViewController _effectiveBackgroundColor](self, "_effectiveBackgroundColor");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView setBackgroundColor:](v8, "setBackgroundColor:");

    -[UIVisualEffectView setAutoresizingMask:](self->_materialView, "setAutoresizingMask:", 18);
    -[CHUISWidgetHostViewController view](self, "view");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "insertSubview:atIndex:", self->_materialView, 0);

    -[UIVisualEffectView layer](self->_materialView, "layer");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setName:", CFSTR("Material View"));

    -[CHUISWidgetHostViewController view](self, "view");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setNeedsLayout");

  }
  switch(a3)
  {
    case 2:
      -[UIVisualEffectView setHidden:](self->_materialView, "setHidden:", 0);
      objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 7);
      v20 = (id)objc_claimAutoreleasedReturnValue();
      -[UIVisualEffectView setEffect:](self->_materialView, "setEffect:");
      -[UIVisualEffectView setBackgroundColor:](self->_materialView, "setBackgroundColor:", 0);
      v11 = self->_materialView;
      -[CHUISWidgetHostViewController _effectiveCornerRadius](self, "_effectiveCornerRadius");
      -[UIVisualEffectView _setContinuousCornerRadius:](v11, "_setContinuousCornerRadius:");
      goto LABEL_12;
    case 1:
      -[UIVisualEffectView setHidden:](self->_materialView, "setHidden:", 0);
      -[UIVisualEffectView setEffect:](self->_materialView, "setEffect:", 0);
      -[UIVisualEffectView layer](self->_materialView, "layer");
      v18 = (id)objc_claimAutoreleasedReturnValue();
      -[CHUISWidgetHostViewController _effectiveCornerRadius](self, "_effectiveCornerRadius");
      objc_msgSend(v18, "setCornerRadius:");

      -[UIVisualEffectView layer](self->_materialView, "layer");
      v19 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setCornerCurve:", *MEMORY[0x1E0CD2A68]);

      v10 = self->_materialView;
      -[CHUISWidgetHostViewController _effectiveBackgroundColor](self, "_effectiveBackgroundColor");
      v20 = (id)objc_claimAutoreleasedReturnValue();
      -[UIVisualEffectView setBackgroundColor:](v10, "setBackgroundColor:");
LABEL_12:

      return;
    case 0:
      -[UIVisualEffectView setHidden:](self->_materialView, "setHidden:", 1);
      -[UIVisualEffectView layer](self->_materialView, "layer");
      v17 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setCornerRadius:", 0.0);

      v9 = self->_materialView;
      -[CHUISWidgetHostViewController _effectiveCornerRadius](self, "_effectiveCornerRadius");
      -[UIVisualEffectView _setContinuousCornerRadius:](v9, "_setContinuousCornerRadius:");
      break;
  }
}

- (void)_updateBackgroundMaterialAndColor
{
  -[CHUISWidgetHostViewController _setBackgroundViewMode:](self, "_setBackgroundViewMode:", -[CHUISWidgetHostViewController _expectedBackgroundViewMode](self, "_expectedBackgroundViewMode"));
}

- (BOOL)_isVibrancyEffectEnabled
{
  return -[CHSWidgetRenderScheme renderingMode](self->_renderScheme, "renderingMode") == 1
      && self->_vibrancyConfiguration != 0;
}

- (void)_updateVibrancyEffectView
{
  -[BSUIVibrancyEffectView setIsEnabled:](self->_vibrancyEffectView, "setIsEnabled:", -[CHUISWidgetHostViewController _isVibrancyEffectEnabled](self, "_isVibrancyEffectEnabled"));
  -[BSUIVibrancyEffectView setConfiguration:](self->_vibrancyEffectView, "setConfiguration:", self->_vibrancyConfiguration);
}

- (void)_updateDescriptorIfNecessary
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_2(&dword_1B711E000, v0, v1, "[%p-%{public}@] Descriptor is now: %{public}@");
  OUTLINED_FUNCTION_8();
}

- (void)_evaluateEffectivePresentationMode
{
  unint64_t requestedPresentationMode;
  NSObject *v4;
  NSString *cachedSceneLogDigest;
  const char *v6;
  NSString *v7;
  _BYTE v8[24];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  requestedPresentationMode = self->_requestedPresentationMode;
  if (requestedPresentationMode)
  {
    if (-[CHUISPreferences debugPrefersStaticSnapshots](self->_preferences, "debugPrefersStaticSnapshots"))
    {
      CHUISLogViewController();
      v4 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
LABEL_6:

        requestedPresentationMode = 1;
        goto LABEL_10;
      }
      cachedSceneLogDigest = self->_cachedSceneLogDigest;
      *(_DWORD *)v8 = 134218242;
      *(_QWORD *)&v8[4] = self;
      *(_WORD *)&v8[12] = 2114;
      *(_QWORD *)&v8[14] = cachedSceneLogDigest;
      v6 = "[%p-%{public}@] Effective mode overridden to \"static\" due to user default.";
    }
    else
    {
      if (requestedPresentationMode != 3)
        goto LABEL_10;
      if (-[CHUISWidgetHostViewController _canLiveSnapshot](self, "_canLiveSnapshot"))
      {
        requestedPresentationMode = 3;
        goto LABEL_10;
      }
      CHUISLogViewController();
      v4 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        goto LABEL_6;
      v7 = self->_cachedSceneLogDigest;
      *(_DWORD *)v8 = 134218242;
      *(_QWORD *)&v8[4] = self;
      *(_WORD *)&v8[12] = 2114;
      *(_QWORD *)&v8[14] = v7;
      v6 = "[%p-%{public}@] Effective mode overridden to \"static\" due to live snapshot being unsupported.";
    }
    _os_log_impl(&dword_1B711E000, v4, OS_LOG_TYPE_DEFAULT, v6, v8, 0x16u);
    goto LABEL_6;
  }
LABEL_10:
  -[CHUISWidgetHostViewController _setEffectivePresentationMode:](self, "_setEffectivePresentationMode:", requestedPresentationMode, *(_OWORD *)v8, *(_QWORD *)&v8[16], v9);
}

- (void)_setEffectivePresentationMode:(unint64_t)a3
{
  -[CHUISWidgetHostViewController _setEffectivePresentationMode:forceExistingRebuild:](self, "_setEffectivePresentationMode:forceExistingRebuild:", a3, 0);
}

- (void)_setEffectivePresentationMode:(unint64_t)a3 forceExistingRebuild:(BOOL)a4
{
  _BOOL4 v4;
  void *v8;
  void *v9;
  void (**v10)(_QWORD);
  void *v11;
  void *v12;
  _QWORD aBlock[5];

  v4 = a4;
  BSDispatchQueueAssertMain();
  if (self->_effectivePresentationMode != a3 || v4)
  {
    self->_effectivePresentationMode = a3;
    switch(a3)
    {
      case 0uLL:
        -[CHUISWidgetHostViewController _hideSnapshotViewsAnimated:](self, "_hideSnapshotViewsAnimated:", 0);
        goto LABEL_9;
      case 1uLL:
        -[CHUISWidgetHostViewController view](self, "view");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "window");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
          -[CHUISWidgetHostViewController _ensureAndEvaluateSnapshotView](self, "_ensureAndEvaluateSnapshotView");
LABEL_9:
        -[CHUISWidgetHostViewController _updateSceneToForeground:](self, "_updateSceneToForeground:", 0);
        break;
      case 2uLL:
        -[CHUISWidgetHostViewController _updateSceneToForeground:](self, "_updateSceneToForeground:", 1);
        if (-[FBScene contentState](self->_scene, "contentState") == 2)
        {
          -[CHUISWidgetHostViewController _hideSnapshotViewsAnimated:](self, "_hideSnapshotViewsAnimated:", 1);
        }
        else
        {
          -[CHUISWidgetHostViewController view](self, "view");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "window");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
            -[CHUISWidgetHostViewController _ensureAndEvaluateSnapshotView](self, "_ensureAndEvaluateSnapshotView");
        }
        break;
      case 3uLL:
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __84__CHUISWidgetHostViewController__setEffectivePresentationMode_forceExistingRebuild___block_invoke;
        aBlock[3] = &unk_1E6B84AF0;
        aBlock[4] = self;
        v10 = (void (**)(_QWORD))_Block_copy(aBlock);
        if (-[FBScene contentState](self->_scene, "contentState") == 2)
        {
          v10[2](v10);
          -[CHUISWidgetHostViewController _updateSceneToForeground:](self, "_updateSceneToForeground:", 0);
        }
        else
        {
          -[CHUISWidgetHostViewController _updateSceneToForeground:](self, "_updateSceneToForeground:", 1);
          v10[2](v10);
        }

        break;
      default:
        return;
    }
  }
}

void __84__CHUISWidgetHostViewController__setEffectivePresentationMode_forceExistingRebuild___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "_ensureAndEvaluateSnapshotView");
}

- (void)_updateSceneToForeground:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  NSObject *v7;
  NSString *cachedSceneLogDigest;
  const __CFString *v9;
  uint64_t v10;
  void (**v11)(_QWORD);
  void *v12;
  void *v13;
  void *v14;
  char v15;
  NSObject *v16;
  NSString *v17;
  const __CFString *v18;
  FBSceneWorkspace *sceneWorkspace;
  uint64_t v20;
  FBScene *v21;
  FBScene *scene;
  void *v23;
  FBScene *v24;
  void *v25;
  UIScenePresenter *v26;
  UIScenePresenter *scenePresenter;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  objc_class *v33;
  BLSHBacklightFBSceneEnvironmentActionHandler *v34;
  BLSHBacklightFBSceneEnvironmentActionHandler *sceneBacklightActionHandler;
  BLSHBacklightSceneHostEnvironment *v36;
  BLSHBacklightSceneHostEnvironment *sceneBacklightEnvironment;
  void *v38;
  NSObject *v39;
  _QWORD v40[5];
  BOOL v41;
  _QWORD v42[9];
  void (**v43)(_QWORD);
  _QWORD aBlock[5];
  BOOL v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;
  _BYTE buf[24];
  const __CFString *v51;
  uint64_t *v52;
  uint64_t v53;

  v3 = a3;
  v53 = *MEMORY[0x1E0C80C00];
  BSDispatchQueueAssertMain();
  if (!self->_invalidated && (BSEqualBools() & 1) == 0)
  {
    if (v3)
    {
      -[CHUISWidgetHostViewController view](self, "view");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setClipsToBounds:", 0);

      -[CHUISWidgetHostViewController view](self, "view");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setBackgroundColor:", 0);

    }
    self->_sceneForeground = v3;
    if (self->_scene)
    {
      CHUISLogViewController();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        cachedSceneLogDigest = self->_cachedSceneLogDigest;
        v9 = CFSTR("Background");
        *(_DWORD *)buf = 134218498;
        if (v3)
          v9 = CFSTR("Foreground");
        *(_QWORD *)&buf[4] = self;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = cachedSceneLogDigest;
        *(_WORD *)&buf[22] = 2114;
        v51 = v9;
        _os_log_impl(&dword_1B711E000, v7, OS_LOG_TYPE_DEFAULT, "[%p-%{public}@] Updating - %{public}@", buf, 0x20u);
      }

      v10 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __58__CHUISWidgetHostViewController__updateSceneToForeground___block_invoke;
      aBlock[3] = &unk_1E6B85090;
      aBlock[4] = self;
      v45 = v3;
      v11 = (void (**)(_QWORD))_Block_copy(aBlock);
      v12 = v11;
      if (v3 || (self->_effectivePresentationMode | 2) != 3)
      {
        v11[2](v11);
      }
      else
      {
        v42[5] = v10;
        v42[6] = 3221225472;
        v42[7] = __58__CHUISWidgetHostViewController__updateSceneToForeground___block_invoke_3;
        v42[8] = &unk_1E6B850B8;
        v43 = v11;
        BSRunLoopPerformAfterCACommit();

      }
LABEL_24:
      -[CHUISWidgetHostViewController _scheduleEvaluationOfDetachedSceneTimerForReason:](self, "_scheduleEvaluationOfDetachedSceneTimerForReason:", CFSTR("scene modified"));
      return;
    }
    if (!-[CHUISPreferences enableMemoryStressTestingWithGaspar](self->_preferences, "enableMemoryStressTestingWithGaspar")|| (objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle"), v13 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(v13, "bundleIdentifier"), v14 = (void *)objc_claimAutoreleasedReturnValue(), v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("com.apple.Gaspar")), v14, v13, (v15 & 1) != 0))
    {
      CHUISLogViewController();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = self->_cachedSceneLogDigest;
        v18 = CFSTR("Background");
        *(_DWORD *)buf = 134218498;
        if (v3)
          v18 = CFSTR("Foreground");
        *(_QWORD *)&buf[4] = self;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v17;
        *(_WORD *)&buf[22] = 2114;
        v51 = v18;
        _os_log_impl(&dword_1B711E000, v16, OS_LOG_TYPE_DEFAULT, "[%p-%{public}@] Creating - %{public}@", buf, 0x20u);
      }

      sceneWorkspace = self->_sceneWorkspace;
      v20 = MEMORY[0x1E0C809B0];
      v42[0] = MEMORY[0x1E0C809B0];
      v42[1] = 3221225472;
      v42[2] = __58__CHUISWidgetHostViewController__updateSceneToForeground___block_invoke_230;
      v42[3] = &unk_1E6B850E0;
      v42[4] = self;
      -[FBSceneWorkspace createScene:](sceneWorkspace, "createScene:", v42);
      v21 = (FBScene *)objc_claimAutoreleasedReturnValue();
      scene = self->_scene;
      self->_scene = v21;

      -[FBScene setDelegate:](self->_scene, "setDelegate:", self);
      -[FBScene layerManager](self->_scene, "layerManager");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "addObserver:", self);

      v24 = self->_scene;
      v40[0] = v20;
      v40[1] = 3221225472;
      v40[2] = __58__CHUISWidgetHostViewController__updateSceneToForeground___block_invoke_2_236;
      v40[3] = &unk_1E6B85158;
      v40[4] = self;
      v41 = v3;
      -[FBScene configureParameters:](v24, "configureParameters:", v40);
      -[FBScene uiPresentationManager](self->_scene, "uiPresentationManager");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "createPresenterWithIdentifier:", CFSTR("default"));
      v26 = (UIScenePresenter *)objc_claimAutoreleasedReturnValue();
      scenePresenter = self->_scenePresenter;
      self->_scenePresenter = v26;

      -[UIScenePresenter modifyPresentationContext:](self->_scenePresenter, "modifyPresentationContext:", &__block_literal_global_244);
      -[UIScenePresenter activate](self->_scenePresenter, "activate");
      -[UIScenePresenter presentationView](self->_scenePresenter, "presentationView");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[CHUISWidgetHostViewController _containerView](self, "_containerView");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "insertSubview:atIndex:", v28, 0);

      -[CHUISWidgetHostViewController view](self, "view");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setNeedsLayout");

      objc_msgSend(v28, "setClipsToBounds:", 1);
      objc_msgSend(v28, "layer");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setName:", CFSTR("Scene View"));

      -[CHUISWidgetHostViewController _effectiveViewCornerRadius](self, "_effectiveViewCornerRadius");
      objc_msgSend(v28, "_setContinuousCornerRadius:");
      v46 = 0;
      v47 = &v46;
      v48 = 0x2050000000;
      v32 = (void *)getBLSHBacklightFBSceneEnvironmentActionHandlerClass_softClass;
      v49 = getBLSHBacklightFBSceneEnvironmentActionHandlerClass_softClass;
      if (!getBLSHBacklightFBSceneEnvironmentActionHandlerClass_softClass)
      {
        *(_QWORD *)buf = v20;
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __getBLSHBacklightFBSceneEnvironmentActionHandlerClass_block_invoke;
        v51 = (const __CFString *)&unk_1E6B852A8;
        v52 = &v46;
        __getBLSHBacklightFBSceneEnvironmentActionHandlerClass_block_invoke((uint64_t)buf);
        v32 = (void *)v47[3];
      }
      v33 = objc_retainAutorelease(v32);
      _Block_object_dispose(&v46, 8);
      v34 = (BLSHBacklightFBSceneEnvironmentActionHandler *)objc_alloc_init(v33);
      sceneBacklightActionHandler = self->_sceneBacklightActionHandler;
      self->_sceneBacklightActionHandler = v34;

      -[FBScene backlightSceneHostEnvironment](self->_scene, "backlightSceneHostEnvironment");
      v36 = (BLSHBacklightSceneHostEnvironment *)objc_claimAutoreleasedReturnValue();
      sceneBacklightEnvironment = self->_sceneBacklightEnvironment;
      self->_sceneBacklightEnvironment = v36;

      -[BLSHBacklightSceneHostEnvironment setAlwaysOnEnabledForEnvironment:](self->_sceneBacklightEnvironment, "setAlwaysOnEnabledForEnvironment:", 1);
      -[FBScene activateWithTransitionContext:](self->_scene, "activateWithTransitionContext:", 0);
      -[FBScene identifier](self->_scene, "identifier");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[CHUISWidgetHostViewController sceneDidUpdateToSceneIdentifier:](self, "sceneDidUpdateToSceneIdentifier:", v38);

      goto LABEL_24;
    }
    CHUISLogViewController();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B711E000, v39, OS_LOG_TYPE_DEFAULT, "Ignoring scene create due to stress testing mode with Gaspar enabled.", buf, 2u);
    }

  }
}

uint64_t __58__CHUISWidgetHostViewController__updateSceneToForeground___block_invoke(uint64_t a1)
{
  uint64_t result;
  void *v3;
  _QWORD v4[4];
  char v5;

  result = BSEqualBools();
  if ((_DWORD)result)
  {
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 992);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __58__CHUISWidgetHostViewController__updateSceneToForeground___block_invoke_2;
    v4[3] = &__block_descriptor_33_e73_v24__0__FBSMutableSceneSettings_8__UIApplicationSceneTransitionContext_16l;
    v5 = *(_BYTE *)(a1 + 40);
    objc_msgSend(v3, "performUpdate:", v4);
    result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 992), "isActive");
    if ((result & 1) == 0)
      return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 992), "activateWithTransitionContext:", 0);
  }
  return result;
}

uint64_t __58__CHUISWidgetHostViewController__updateSceneToForeground___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setForeground:", *(unsigned __int8 *)(a1 + 32));
}

uint64_t __58__CHUISWidgetHostViewController__updateSceneToForeground___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __58__CHUISWidgetHostViewController__updateSceneToForeground___block_invoke_230(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("scene::%@::%p"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1384), *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setIdentifier:", v3);

  objc_msgSend(*(id *)(a1 + 32), "sceneSpecification");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setSpecification:", v4);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1224), "widgetRenderer");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = (void *)__defaultWidgetRendererBundleID;
  if (v5)
    v7 = (void *)v5;
  v8 = v7;

  v9 = (void *)MEMORY[0x1E0D231C0];
  objc_msgSend(MEMORY[0x1E0D87D80], "identityForApplicationJobLabel:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identityForProcessIdentity:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setClientIdentity:", v11);
}

void __58__CHUISWidgetHostViewController__updateSceneToForeground___block_invoke_2_236(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD v6[5];
  _QWORD v7[5];
  char v8;

  v3 = a2;
  v4 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__CHUISWidgetHostViewController__updateSceneToForeground___block_invoke_3_237;
  v7[3] = &unk_1E6B85108;
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = *(_BYTE *)(a1 + 40);
  v5 = v3;
  objc_msgSend(v3, "updateSettingsWithBlock:", v7);
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __58__CHUISWidgetHostViewController__updateSceneToForeground___block_invoke_4;
  v6[3] = &unk_1E6B85130;
  v6[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v5, "updateClientSettingsWithBlock:", v6);

}

void __58__CHUISWidgetHostViewController__updateSceneToForeground___block_invoke_3_237(uint64_t a1, void *a2)
{
  void *v3;
  _BYTE *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;

  v31 = a2;
  objc_msgSend(*(id *)(a1 + 32), "metrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_BYTE **)(a1 + 32);
  if (v4[1212])
  {
    objc_msgSend(v4, "_currentDisplayScale");
    objc_msgSend(v3, "_effectiveSizePixelAlignedForDisplayScale:");
    BSRectWithSize();
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
  }
  else
  {
    objc_msgSend(v4, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bounds");
    v6 = v14;
    v8 = v15;
    v10 = v16;
    v12 = v17;

  }
  objc_msgSend(v31, "setFrame:", v6, v8, v10, v12);
  objc_msgSend(v31, "setInterfaceOrientation:", 1);
  objc_msgSend(*(id *)(a1 + 32), "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "window");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend(*(id *)(a1 + 32), "view");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "window");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "windowScene");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "_FBSScene");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "settings");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "displayConfiguration");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (v25)
    {
      v27 = v25;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D228F8], "mainConfiguration");
      v27 = (id)objc_claimAutoreleasedReturnValue();
    }
    v28 = v27;

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D228F8], "mainConfiguration");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v31, "setDisplayConfiguration:", v28);
  objc_msgSend(v31, "setForeground:", *(unsigned __int8 *)(a1 + 40));
  objc_msgSend(v31, "setWidgetConfigurationIdentifier:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1384));
  objc_msgSend(*(id *)(a1 + 32), "widget");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setWidget:", v29);

  objc_msgSend(v31, "setMetrics:", v3);
  objc_msgSend(v31, "setVisibility:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1096));
  objc_msgSend(v31, "setContentType:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1296));
  objc_msgSend(v31, "setColorScheme:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1304));
  objc_msgSend(v31, "setWidgetPriority:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1312));
  objc_msgSend(v31, "setAnimationsPaused:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 1208));
  objc_msgSend(v31, "setContentPaused:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 1209));
  objc_msgSend(v31, "setKeybagLockPolicy:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1288));
  objc_msgSend(v31, "setCanAppearInSecureEnvironment:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 1176));
  objc_msgSend(*(id *)(a1 + 32), "additionalSnapshotPresentationContext");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setAdditionalSnapshotPresentationContext:", v30);

  objc_msgSend(v31, "setTintParameters:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1336));
  objc_msgSend(v31, "setInlineTextParameters:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1344));
  objc_msgSend(v31, "setSupportsLowLuminance:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 1264));
  objc_msgSend(v31, "setPrefersUnredactedContentInLowLuminanceEnvironment:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 1265));
  objc_msgSend(v31, "setShowsWidgetLabel:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 1352));
  objc_msgSend(v31, "setInteractionDisabled:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 1353));
  objc_msgSend(v31, "setRenderScheme:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1320));
  objc_msgSend(v31, "setClipBehavior:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1360));
  objc_msgSend(v31, "setWantsBaseContentTouchEvents:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 1357));
  objc_msgSend(*(id *)(a1 + 32), "willModifySceneSettings:", v31);

}

void __58__CHUISWidgetHostViewController__updateSceneToForeground___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setPreferredInterfaceOrientation:", 1);
  objc_msgSend(*(id *)(a1 + 32), "willModifySceneClientSettings:", v3);

}

void __58__CHUISWidgetHostViewController__updateSceneToForeground___block_invoke_5(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setPresentedLayerTypes:", 26);
  objc_msgSend(v2, "setAppearanceStyle:", 2);
  objc_msgSend(v2, "setBackgroundColorWhileHosting:", 0);
  objc_msgSend(v2, "setBackgroundColorWhileNotHosting:", 0);

}

- (void)_tearDownScene
{
  UIScenePresenter *scenePresenter;
  BLSHBacklightFBSceneEnvironmentActionHandler *sceneBacklightActionHandler;
  BLSHBacklightSceneHostEnvironment *sceneBacklightEnvironment;
  void *v6;
  FBScene *scene;

  -[UIScenePresenter invalidate](self->_scenePresenter, "invalidate");
  scenePresenter = self->_scenePresenter;
  self->_scenePresenter = 0;

  self->_sceneForeground = 0;
  sceneBacklightActionHandler = self->_sceneBacklightActionHandler;
  self->_sceneBacklightActionHandler = 0;

  sceneBacklightEnvironment = self->_sceneBacklightEnvironment;
  self->_sceneBacklightEnvironment = 0;

  -[FBScene layerManager](self->_scene, "layerManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:", self);

  -[FBScene setDelegate:](self->_scene, "setDelegate:", 0);
  -[FBScene invalidate](self->_scene, "invalidate");
  scene = self->_scene;
  self->_scene = 0;

  -[CHUISWidgetHostViewController _invalidateDetachedSceneTimerForReason:](self, "_invalidateDetachedSceneTimerForReason:", CFSTR("scene invalidated"));
}

- (void)_modifyVisibilitySettings:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(id, void *);

  v6 = (void (**)(id, void *))a3;
  v4 = (void *)-[CHUISWidgetVisibilitySettings mutableCopy](self->_visibilitySettings, "mutableCopy");
  v6[2](v6, v4);
  v5 = (void *)objc_msgSend(v4, "copy");
  -[CHUISWidgetHostViewController _setVisibilitySettings:](self, "_setVisibilitySettings:", v5);

}

- (void)_updateTouchDeliveryPolicies
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_1B711E000, v0, v1, "Cannot acquire touch assertion for an invalidated widget view controller.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __61__CHUISWidgetHostViewController__updateTouchDeliveryPolicies__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  _QWORD *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    CHUISLogViewControllerTouch();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = WeakRetained[138];
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 134218754;
      v9 = WeakRetained;
      v10 = 2114;
      v11 = v6;
      v12 = 2114;
      v13 = v7;
      v14 = 2114;
      v15 = v3;
      _os_log_impl(&dword_1B711E000, v5, OS_LOG_TYPE_DEFAULT, "[%p-%{public}@] Sending touch delivery policy %{public}@ failed with error: %{public}@", (uint8_t *)&v8, 0x2Au);
    }

  }
}

- (void)_clearTouchDeliveryPolicies
{
  NSObject *v3;
  NSString *cachedSceneLogDigest;
  int v5;
  CHUISWidgetHostViewController *v6;
  __int16 v7;
  NSString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  CHUISLogViewControllerTouch();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    cachedSceneLogDigest = self->_cachedSceneLogDigest;
    v5 = 134218242;
    v6 = self;
    v7 = 2114;
    v8 = cachedSceneLogDigest;
    _os_log_impl(&dword_1B711E000, v3, OS_LOG_TYPE_DEFAULT, "[%p-%{public}@] Clearing any touch delivery policies", (uint8_t *)&v5, 0x16u);
  }

  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_touchDeliveryPolicyAssertions, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_253);
  -[NSMutableDictionary removeAllObjects](self->_touchDeliveryPolicyAssertions, "removeAllObjects");
}

uint64_t __60__CHUISWidgetHostViewController__clearTouchDeliveryPolicies__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "invalidate");
}

- (BOOL)_isAppearingOrAppeared
{
  return -[CHUISWidgetHostViewController _appearState](self, "_appearState") - 1 < 2;
}

- (void)_resetLogDigests
{
  NSString *v3;
  NSString *cachedSceneLogDigest;

  -[CHUISWidgetHostViewController _logDigest](self, "_logDigest");
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  cachedSceneLogDigest = self->_cachedSceneLogDigest;
  self->_cachedSceneLogDigest = v3;

}

- (id)_cachedSceneLogDigest
{
  return self->_cachedSceneLogDigest;
}

- (id)_logDigest
{
  const __CFString *v2;

  if (self->_contentType)
    v2 = CFSTR("preview");
  else
    v2 = CFSTR("timeline");
  -[CHSWidget _loggingIdentifierWithMetrics:prefix:](self->_widget, "_loggingIdentifierWithMetrics:prefix:", self->_metrics, v2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)metricsDefineSize
{
  return self->_metricsDefineSize;
}

- (unint64_t)clipBehavior
{
  return self->_clipBehavior;
}

- (unint64_t)widgetPriority
{
  return self->_widgetPriority;
}

- (CHSScreenshotManager)_screenshotManager
{
  return self->_screenshotManager;
}

- (void)_setScreenshotManager:(id)a3
{
  objc_storeStrong((id *)&self->_screenshotManager, a3);
}

- (BOOL)disableViewTransitionAnimations
{
  return self->_disableViewTransitionAnimations;
}

- (void)setDisableViewTransitionAnimations:(BOOL)a3
{
  self->_disableViewTransitionAnimations = a3;
}

- (FBScene)_scene
{
  return self->_scene;
}

- (void)_setScene:(id)a3
{
  objc_storeStrong((id *)&self->_scene, a3);
}

- (UIScenePresenter)_scenePresenter
{
  return self->_scenePresenter;
}

- (void)_setScenePresenter:(id)a3
{
  objc_storeStrong((id *)&self->_scenePresenter, a3);
}

- (double)_detachedSceneTimerInterval
{
  return self->_detachedSceneTimerInterval;
}

- (void)_setDetachedSceneTimerInterval:(double)a3
{
  self->_detachedSceneTimerInterval = a3;
}

- (CHUISWidgetHostViewControllerDelegate)delegate
{
  return (CHUISWidgetHostViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CHSWidgetMetrics)metrics
{
  return self->_metrics;
}

- (NSString)widgetConfigurationIdentifier
{
  return self->_widgetConfigurationIdentifier;
}

- (BSUIVibrancyConfiguration)vibrancyConfiguration
{
  return self->_vibrancyConfiguration;
}

- (BOOL)shouldShareTouchesWithHost
{
  return self->_shouldShareTouchesWithHost;
}

- (BOOL)wantsBaseContentTouchEvents
{
  return self->_wantsBaseContentTouchEvents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vibrancyConfiguration, 0);
  objc_storeStrong((id *)&self->_widgetConfigurationIdentifier, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_inlineTextParameters, 0);
  objc_storeStrong((id *)&self->_tintParameters, 0);
  objc_storeStrong((id *)&self->_renderScheme, 0);
  objc_storeStrong((id *)&self->_sceneBacklightActionHandler, 0);
  objc_storeStrong((id *)&self->_sceneBacklightEnvironment, 0);
  objc_storeStrong((id *)&self->_waitForSceneContentReadyBlocks, 0);
  objc_storeStrong((id *)&self->_extensionProvider, 0);
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong((id *)&self->_widgetMetrics, 0);
  objc_storeStrong((id *)&self->_widget, 0);
  objc_storeStrong((id *)&self->_detachedSceneTimerEvaluationReasons, 0);
  objc_storeStrong((id *)&self->_detachedSceneTimer, 0);
  objc_storeStrong((id *)&self->_stateCaptureAssertion, 0);
  objc_storeStrong(&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_vibrancyEffectView, 0);
  objc_storeStrong((id *)&self->_materialView, 0);
  objc_storeStrong((id *)&self->_descriptor, 0);
  objc_storeStrong((id *)&self->_cachedSceneLogDigest, 0);
  objc_storeStrong((id *)&self->_visibilitySettings, 0);
  objc_storeStrong((id *)&self->_screenshotManager, 0);
  objc_storeStrong((id *)&self->_snapshotDebugView, 0);
  objc_storeStrong((id *)&self->_snapshotDebugLabel, 0);
  objc_storeStrong((id *)&self->_persistedWidgetSnapshotViewContainer, 0);
  objc_storeStrong((id *)&self->_persistedWidgetSnapshotImageView, 0);
  objc_storeStrong((id *)&self->_persistedWidgetSnapshotCaarView, 0);
  objc_storeStrong((id *)&self->_liveSceneSnapshotView, 0);
  objc_storeStrong((id *)&self->_touchDeliveryPolicyAssertions, 0);
  objc_storeStrong((id *)&self->_scene, 0);
  objc_storeStrong((id *)&self->_scenePresenter, 0);
  objc_storeStrong((id *)&self->_sceneWorkspace, 0);
  objc_storeStrong((id *)&self->_keybag, 0);
}

- (void)initWithWidget:metrics:widgetConfigurationIdentifier:extensionProvider:sceneWorkspace:screenshotManager:preferences:keybag:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3(&dword_1B711E000, v0, v1, "[%p-%{public}@] Created.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)setWidget:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_1B711E000, v0, v1, "Unable to set a new widget on an invalidated widget view controller.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)setPresentationMode:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_1B711E000, v0, v1, "Unable to set a new presentation mode on an invalidated widget view controller.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)setVisibility:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_1B711E000, v0, v1, "Unable to set visibility on an invalidated widget view controller.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)setVisibleBounds:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_1B711E000, v0, v1, "Unable to set visible bounds on an invalidated widget view controller.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)setAnimationsPaused:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_2(&dword_1B711E000, v0, v1, "[%p-%{public}@] Animations paused: %{public}@");
  OUTLINED_FUNCTION_8();
}

- (void)setAnimationsPaused:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_1B711E000, v0, v1, "Unable to set animations paused on an invalidated widget view controller.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)setContentPaused:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_2(&dword_1B711E000, v0, v1, "[%p-%{public}@] Content paused: %{public}@");
  OUTLINED_FUNCTION_8();
}

- (void)setContentPaused:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_1B711E000, v0, v1, "Unable to set content paused on an invalidated widget view controller.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)setTintParameters:fencingAnimations:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3(&dword_1B711E000, v0, v1, "[%p-%{public}@] Tinting parameters change deferred", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)setTintParameters:fencingAnimations:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3(&dword_1B711E000, v0, v1, "[%p-%{public}@] Tinting parameters changed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)setTintParameters:fencingAnimations:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_1B711E000, v0, v1, "Unable to set tint parameters on an invalidated widget view controller.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)setInlineTextParameters:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3(&dword_1B711E000, v0, v1, "[%p-%{public}@] Inline text settings changed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)setInlineTextParameters:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_1B711E000, v0, v1, "Unable to set inline text settings on an invalidated widget view controller.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)setVisibleEntryShouldSnapshot:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_2(&dword_1B711E000, v0, v1, "[%p-%{public}@] Should Visible entry snapshotting changed to %{public}@");
  OUTLINED_FUNCTION_8();
}

- (void)setVisibleEntryShouldSnapshot:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_1B711E000, v0, v1, "Unable to set snapshotability on an invalidated widget view controller.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)setShouldShareTouchesWithHost:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_1B711E000, v0, v1, "Unable to tag a widget view controller as visibly settled after invalidation.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)cancelTouchesForCurrentEventInHostedContent
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_1B711E000, v0, v1, "Cannot acquire cancel touch assertion for an invalidated widget view controller.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)setDrawSystemBackgroundMaterialIfNecessary:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_1B711E000, v0, v1, "Unable to set draw system background material on an invalidated widget view controller.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_snapshotViewIgnoringVibrancyEffect:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_1B711E000, v0, v1, "Cannot acquire a scene snapshot on an invalidated widget view controller.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_implicitSetRenderScheme:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_2(&dword_1B711E000, v0, v1, "[%p-%{public}@] Render scheme changed to: %{public}@");
  OUTLINED_FUNCTION_8();
}

void __73__CHUISWidgetHostViewController_extensionsDidChangeForExtensionProvider___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_3(&dword_1B711E000, v0, v1, "[%p-%{public}@] Descriptors did change", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)_newPersistedSnapshotView
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 1104);
  v3 = 138543362;
  v4 = v2;
  _os_log_debug_impl(&dword_1B711E000, a2, OS_LOG_TYPE_DEBUG, "Read astc snapshot for %{public}@!", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_6();
}

- (void)_applySecurityPolicyToLayer:allowsPrivacySensitiveContent:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_12(&dword_1B711E000, v0, v1, "Snapshot layer will be disabled when locked", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_applySecurityPolicyToLayer:allowsPrivacySensitiveContent:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_12(&dword_1B711E000, v0, v1, "Snapshot layer will be enabled when locked", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_hideSnapshotViewsAnimated:forceCompleteTeardown:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_2(&dword_1B711E000, v0, v1, "[%p-%{public}@] Destroy snapshot views (animated: %{public}@)");
  OUTLINED_FUNCTION_8();
}

void __82__CHUISWidgetHostViewController__hideSnapshotViewsAnimated_forceCompleteTeardown___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_3(&dword_1B711E000, v0, v1, "[%p-%{public}@] Finish hiding snapshots", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)_scheduleEvaluationOfDetachedSceneTimerForReason:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_2(&dword_1B711E000, v0, v1, "[%p-%{public}@] Scheduling detached scene timer evaluation for reason: %@");
  OUTLINED_FUNCTION_8();
}

void __82__CHUISWidgetHostViewController__scheduleEvaluationOfDetachedSceneTimerForReason___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_2(&dword_1B711E000, v0, v1, "[%p-%{public}@] Running detached scene timer evaluation for reason(s): %@");
  OUTLINED_FUNCTION_8();
}

void __71__CHUISWidgetHostViewController___evaluateDetachedSceneTimerForReason___block_invoke_cold_1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_1B711E000, v0, OS_LOG_TYPE_ERROR, "[%p-%{public}@] Detached scene idle timer fired. Invalidating scene.", v1, 0x16u);
  OUTLINED_FUNCTION_6();
}

@end
