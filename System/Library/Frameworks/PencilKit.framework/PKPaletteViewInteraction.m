@implementation PKPaletteViewInteraction

+ (id)paletteViewInteractionForCanvas:(id)a3
{
  return 0;
}

+ (id)existingPaletteViewInteractionForWindowScene:(id)a3
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  if (v3)
  {
    v4 = (id)_perCanvasInteractions;
    objc_sync_enter(v4);
    objc_msgSend((id)_perCanvasInteractions, "objectForKey:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_exit(v4);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)paletteViewInteractionForWindow:(id)a3 windowScene:(id)a4
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  PKPaletteViewInteraction *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  char v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  objc_class *v23;
  void *v24;
  char v25;
  NSObject *v26;
  id v27;
  NSObject *v28;
  PKPaletteViewInteraction *v29;
  double v30;
  double v31;
  void *v32;
  void *v34;
  NSObject *log;
  id obj;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t v41[128];
  uint8_t buf[4];
  id v43;
  __int16 v44;
  NSObject *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  v8 = 0;
  if (v5 && v6)
  {
    obj = (id)_perCanvasInteractions;
    objc_sync_enter(obj);
    v9 = (void *)_perCanvasInteractions;
    if (!_perCanvasInteractions)
    {
      objc_msgSend(MEMORY[0x1E0CB3748], "weakToWeakObjectsMapTable");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)_perCanvasInteractions;
      _perCanvasInteractions = v10;

      v9 = (void *)_perCanvasInteractions;
    }
    objc_msgSend(v9, "objectForKey:", v7);
    v8 = (PKPaletteViewInteraction *)objc_claimAutoreleasedReturnValue();
    if (v8)
      goto LABEL_38;
    v12 = os_log_create("com.apple.pencilkit", "Interaction");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v43 = v5;
      v44 = 2112;
      v45 = v7;
      _os_log_impl(&dword_1BE213000, v12, OS_LOG_TYPE_INFO, "Create new palette view interaction for window: %@, windowScene: %@", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0DC3DB0], "sharedTextEffectsWindowForWindowScene:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    NSClassFromString(CFSTR("_UISecureHostedWindow"));
    v34 = v13;
    if ((objc_opt_isKindOfClass() & 1) != 0
      && !+[PKPaletteViewInteraction isHostedWindow:](PKPaletteViewInteraction, "isHostedWindow:", v13))
    {
      log = os_log_create("com.apple.pencilkit", ");
      if (os_log_type_enabled(log, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1BE213000, log, OS_LOG_TYPE_FAULT, "Got a UITextEffectsWindow for an extension when we should have gotten a UITextEffectsWindowHosted", buf, 2u);
      }
    }
    else
    {
      objc_msgSend(v13, "rootViewController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "view");
      log = objc_claimAutoreleasedReturnValue();

      if (log)
      {
        v15 = (objc_class *)objc_opt_class();
        NSStringFromClass(v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("UIInputSetContainerView"));

        if ((v17 & 1) != 0)
        {
          v39 = 0u;
          v40 = 0u;
          v37 = 0u;
          v38 = 0u;
          -[NSObject subviews](log, "subviews");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
          if (v19)
          {
            v20 = *(_QWORD *)v38;
LABEL_14:
            v21 = 0;
            while (1)
            {
              if (*(_QWORD *)v38 != v20)
                objc_enumerationMutation(v18);
              v22 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v21);
              v23 = (objc_class *)objc_opt_class();
              NSStringFromClass(v23);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = objc_msgSend(v24, "isEqualToString:", CFSTR("UIEditingOverlayGestureView"));

              if ((v25 & 1) != 0)
                break;
              if (v19 == ++v21)
              {
                v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
                if (v19)
                  goto LABEL_14;
                goto LABEL_20;
              }
            }
            v27 = v22;

            if (v27)
              goto LABEL_31;
          }
          else
          {
LABEL_20:

          }
          v28 = os_log_create("com.apple.pencilkit", ");
          if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_fault_impl(&dword_1BE213000, v28, OS_LOG_TYPE_FAULT, "Can't find UIEditingOverlayGestureView on UITextEffectsWindow", buf, 2u);
          }

          v27 = 0;
LABEL_31:
          v29 = [PKPaletteViewInteraction alloc];
          objc_msgSend(v5, "bounds");
          v8 = -[PKPaletteViewInteraction initWithWindowSize:](v29, "initWithWindowSize:", v30, v31);
          -[PKPaletteViewInteraction setWindowScene:](v8, "setWindowScene:", v7);
          objc_msgSend((id)_perCanvasInteractions, "setObject:forKey:", v8, v7);
          -[NSObject _registerSceneComponent:forKey:](v7, "_registerSceneComponent:forKey:", v8, CFSTR("PKPaletteViewInteractionSceneComponentKey"));
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            -[NSObject keyboardSceneDelegate](v7, "keyboardSceneDelegate");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v32 = 0;
          }
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v32, "addVisibilityObserver:", v8);
          objc_msgSend(v27, "addInteraction:", v8);

          goto LABEL_37;
        }
      }
      v26 = os_log_create("com.apple.pencilkit", ");
      if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412546;
        v43 = v13;
        v44 = 2112;
        v45 = log;
        _os_log_fault_impl(&dword_1BE213000, v26, OS_LOG_TYPE_FAULT, "UITextEffectsWindow is uninitialized: textEffectsWindow: %@ inputSetContainerView: %@", buf, 0x16u);
      }

    }
    v8 = 0;
LABEL_37:

LABEL_38:
    objc_sync_exit(obj);

  }
  return v8;
}

- (PKPaletteViewInteraction)initWithScene:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  PKPaletteViewInteraction *v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "coordinateSpace");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    v7 = v6;
    v9 = v8;

  }
  else
  {
    v7 = *MEMORY[0x1E0C9D820];
    v9 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  v10 = -[PKPaletteViewInteraction initWithWindowSize:](self, "initWithWindowSize:", v7, v9);

  return v10;
}

- (UIScene)_scene
{
  return (UIScene *)objc_loadWeakRetained((id *)&self->_scene);
}

- (void)_setScene:(id)a3
{
  objc_storeWeak((id *)&self->_scene, a3);
}

- (void)_sceneWillInvalidate:(id)a3
{
  -[PKPaletteViewInteraction willMoveToView:](self, "willMoveToView:", 0);
  -[PKPaletteViewInteraction didMoveToView:](self, "didMoveToView:", 0);
}

- (PKPaletteViewInteraction)initWithWindowSize:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  PKPaletteViewInteraction *v5;
  PKPaletteViewInteraction *v6;
  PKPaletteHostView *paletteHostView;
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)PKPaletteViewInteraction;
  v5 = -[PKPaletteViewInteraction init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_view, 0);
    paletteHostView = v6->_paletteHostView;
    v6->_paletteHostView = 0;

    v6->_sceneBounds.origin.x = 0.0;
    v6->_sceneBounds.origin.y = 0.0;
    v6->_sceneBounds.size.width = width;
    v6->_sceneBounds.size.height = height;
  }
  return v6;
}

- (void)willMoveToView:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  if (!a3)
  {
    -[PKPaletteViewInteraction paletteHostView](self, "paletteHostView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeFromSuperview");

    -[PKPaletteViewInteraction setPaletteHostView:](self, "setPaletteHostView:", 0);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObserver:name:object:", self, *MEMORY[0x1E0DC54C0], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObserver:name:object:", self, *MEMORY[0x1E0DC54B8], 0);

  }
}

- (void)didMoveToView:(id)a3
{
  void *v5;
  PKDrawingPaletteView *v6;
  PKPaletteTapToRadarCommand *v7;
  void *v8;
  PKPaletteHostView *v9;
  void *v10;
  PKPaletteHostView *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSLayoutConstraint *v19;
  NSLayoutConstraint *paletteHostViewTopConstraint;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSLayoutConstraint *v25;
  NSLayoutConstraint *paletteHostViewLeftConstraint;
  void *v27;
  void *v28;
  double v29;
  NSLayoutConstraint *v30;
  NSLayoutConstraint *paletteHostViewWidthConstraint;
  void *v32;
  void *v33;
  double v34;
  NSLayoutConstraint *v35;
  NSLayoutConstraint *paletteHostViewHeightConstraint;
  void *v37;
  NSLayoutConstraint *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id WeakRetained;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  __int128 v51;
  NSLayoutConstraint *v52;
  NSLayoutConstraint *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  -[PKPaletteViewInteraction setView:](self, "setView:");
  if (a3)
  {
    -[PKPaletteViewInteraction paletteHostView](self, "paletteHostView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      v6 = objc_alloc_init(PKDrawingPaletteView);
      -[PKPaletteViewInteraction setPaletteView:](self, "setPaletteView:", v6);

      v7 = -[PKPaletteTapToRadarCommand initWithDelegate:]([PKPaletteTapToRadarCommand alloc], "initWithDelegate:", self);
      -[PKPaletteViewInteraction paletteView](self, "paletteView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setTapToRadarCommand:", v7);

      v9 = [PKPaletteHostView alloc];
      -[PKPaletteViewInteraction paletteView](self, "paletteView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[PKPaletteHostView initWithPaletteView:](v9, "initWithPaletteView:", v10);
      -[PKPaletteViewInteraction setPaletteHostView:](self, "setPaletteHostView:", v11);

      -[PKPaletteViewInteraction paletteHostView](self, "paletteHostView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      -[PKPaletteViewInteraction view](self, "view");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaletteViewInteraction paletteHostView](self, "paletteHostView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addSubview:", v14);

      -[PKPaletteViewInteraction paletteHostView](self, "paletteHostView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "topAnchor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaletteViewInteraction view](self, "view");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "topAnchor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "constraintEqualToAnchor:", v18);
      v19 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
      paletteHostViewTopConstraint = self->_paletteHostViewTopConstraint;
      self->_paletteHostViewTopConstraint = v19;

      -[PKPaletteViewInteraction paletteHostView](self, "paletteHostView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "leftAnchor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaletteViewInteraction view](self, "view");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "leftAnchor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "constraintEqualToAnchor:", v24);
      v25 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
      paletteHostViewLeftConstraint = self->_paletteHostViewLeftConstraint;
      self->_paletteHostViewLeftConstraint = v25;

      -[PKPaletteViewInteraction paletteHostView](self, "paletteHostView");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "widthAnchor");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaletteViewInteraction sceneBounds](self, "sceneBounds");
      objc_msgSend(v28, "constraintEqualToConstant:", v29);
      v30 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
      paletteHostViewWidthConstraint = self->_paletteHostViewWidthConstraint;
      self->_paletteHostViewWidthConstraint = v30;

      -[PKPaletteViewInteraction paletteHostView](self, "paletteHostView");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "heightAnchor");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaletteViewInteraction sceneBounds](self, "sceneBounds");
      objc_msgSend(v33, "constraintEqualToConstant:", v34);
      v35 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
      paletteHostViewHeightConstraint = self->_paletteHostViewHeightConstraint;
      self->_paletteHostViewHeightConstraint = v35;

      v37 = (void *)MEMORY[0x1E0CB3718];
      v51 = *(_OWORD *)&self->_paletteHostViewTopConstraint;
      v38 = self->_paletteHostViewHeightConstraint;
      v52 = self->_paletteHostViewWidthConstraint;
      v53 = v38;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v51, 4);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "activateConstraints:", v39);

      -[PKPaletteViewInteraction _updateSceneBounds](self, "_updateSceneBounds");
      -[PKPaletteViewInteraction paletteView](self, "paletteView");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "paletteHostingWindowSceneDidChangeBounds:", self);

      -[PKPaletteViewInteraction _viewControllerForPalette](self, "_viewControllerForPalette");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaletteViewInteraction paletteView](self, "paletteView");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "setPalettePopoverPresentingController:", v41);

      -[PKPaletteViewInteraction paletteHostView](self, "paletteHostView");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "setNeedsLayout");

      -[PKPaletteViewInteraction paletteHostView](self, "paletteHostView");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "layoutIfNeeded");

      WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
      if (WeakRetained)
      {
        v46 = (void *)MEMORY[0x1E0DC3DB0];
        v47 = objc_loadWeakRetained((id *)&self->_windowScene);
        objc_msgSend(v46, "sharedTextEffectsWindowForWindowScene:", v47);
        v48 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "addObserver:selector:name:object:", self, sel__updateForWillRotate_, *MEMORY[0x1E0DC54C0], 0);

        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "addObserver:selector:name:object:", self, sel__updateForRotation_, *MEMORY[0x1E0DC54B8], v48);

      }
    }
  }
}

- (void)setWindowScene:(id)a3
{
  id WeakRetained;
  id v5;
  uint64_t *v6;
  uint64_t *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  uint64_t v20;
  id v21;
  id v22;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);

  if (WeakRetained != obj)
  {
    v5 = objc_loadWeakRetained((id *)&self->_windowScene);

    v6 = (uint64_t *)MEMORY[0x1E0DC5308];
    v7 = (uint64_t *)MEMORY[0x1E0DC5338];
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *v6;
      v10 = objc_loadWeakRetained((id *)&self->_windowScene);
      objc_msgSend(v8, "removeObserver:name:object:", self, v9, v10);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *v7;
      v13 = objc_loadWeakRetained((id *)&self->_windowScene);
      objc_msgSend(v11, "removeObserver:name:object:", self, v12, v13);

      v14 = objc_loadWeakRetained((id *)&self->_windowScene);
      objc_msgSend(v14, "_unregisterSceneComponentForKey:", CFSTR("PKPaletteViewInteractionSceneComponentKey"));

    }
    v15 = objc_storeWeak((id *)&self->_windowScene, obj);

    if (obj)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = *v6;
      v18 = objc_loadWeakRetained((id *)&self->_windowScene);
      objc_msgSend(v16, "addObserver:selector:name:object:", self, sel__sceneDidActivateNotification_, v17, v18);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = *v7;
      v21 = objc_loadWeakRetained((id *)&self->_windowScene);
      objc_msgSend(v19, "addObserver:selector:name:object:", self, sel__sceneWillEnterForegroundNotification_, v20, v21);

      v22 = objc_loadWeakRetained((id *)&self->_windowScene);
      objc_msgSend(v22, "_registerSceneComponent:forKey:", self, CFSTR("PKPaletteViewInteractionSceneComponentKey"));

    }
  }

}

- (BOOL)isActive
{
  void *v3;
  void *v4;
  char v5;
  BOOL v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.ScreenshotServicesService"));

  if ((v5 & 1) != 0 || (_UIApplicationIsExtension() & 1) != 0)
    return 1;
  -[PKPaletteViewInteraction windowScene](self, "windowScene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[PKPaletteViewInteraction windowScene](self, "windowScene");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v8, "activationState") == 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isPaletteVisible
{
  void *v2;
  char v3;

  -[PKPaletteViewInteraction paletteHostView](self, "paletteHostView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPaletteVisible");

  return v3;
}

- (void)showPaletteViewAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  v9 = a4;
  -[PKPaletteViewInteraction view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[PKPaletteViewInteraction paletteHostView](self, "paletteHostView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHidden:", 0);

    objc_msgSend(v6, "window");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bounds");
    -[PKPaletteViewInteraction setTextEffectsWindowFrame:](self, "setTextEffectsWindowFrame:");

    -[PKPaletteViewInteraction _updateSceneBounds](self, "_updateSceneBounds");
    -[PKPaletteViewInteraction _setPaletteVisible:animated:completion:](self, "_setPaletteVisible:animated:completion:", 1, v4, v9);
  }

}

- (void)_setPaletteVisible:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(_QWORD);
  _QWORD aBlock[5];
  id v12;
  BOOL v13;
  BOOL v14;

  v8 = a5;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__PKPaletteViewInteraction__setPaletteVisible_animated_completion___block_invoke;
  aBlock[3] = &unk_1E777B050;
  v13 = a3;
  v14 = a4;
  aBlock[4] = self;
  v12 = v8;
  v9 = v8;
  v10 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (-[PKPaletteViewInteraction _shouldDeferPaletteVisibilityUpdate](self, "_shouldDeferPaletteVisibilityUpdate"))
    dispatch_async(MEMORY[0x1E0C80D38], v10);
  else
    v10[2](v10);

}

void __67__PKPaletteViewInteraction__setPaletteVisible_animated_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "paletteHostView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(unsigned __int8 *)(a1 + 48);
  v4 = *(unsigned __int8 *)(a1 + 49);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __67__PKPaletteViewInteraction__setPaletteVisible_animated_completion___block_invoke_2;
  v5[3] = &unk_1E7778CD8;
  objc_copyWeak(&v7, &location);
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v2, "setPaletteVisible:animated:completion:", v3, v4, v5);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __67__PKPaletteViewInteraction__setPaletteVisible_animated_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "paletteView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pencilInteraction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEnabled:", 0);

  objc_msgSend(WeakRetained, "paletteView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pencilInteraction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", 1);

  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(void))(v6 + 16))();

}

- (void)hidePaletteViewAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;

  v4 = a3;
  v7 = a4;
  -[PKPaletteViewInteraction paletteView](self, "paletteView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dismissPalettePopoverWithCompletion:", 0);

  -[PKPaletteViewInteraction _setPaletteVisible:animated:completion:](self, "_setPaletteVisible:animated:completion:", 0, v4, v7);
}

- (BOOL)_shouldDeferPaletteVisibilityUpdate
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  BOOL v9;

  -[PKPaletteViewInteraction _traitCollectionForHostingWindow](self, "_traitCollectionForHostingWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteViewInteraction paletteHostView](self, "paletteHostView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v3, "horizontalSizeClass");
  if (v6 == objc_msgSend(v5, "horizontalSizeClass"))
  {
    v7 = objc_msgSend(v3, "verticalSizeClass");
    v8 = v7 != objc_msgSend(v5, "verticalSizeClass");
  }
  else
  {
    v8 = 1;
  }
  v9 = -[PKPaletteViewInteraction _isCompactHostedWindow](self, "_isCompactHostedWindow") || v8;

  return v9;
}

- (void)keyboardSceneDelegate:(id)a3 inputViewSetVisibilityDidChange:(BOOL)a4 includedReset:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  id v9;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  -[PKPaletteViewInteraction delegate](self, "delegate");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "keyboardSceneDelegate:inputViewSetVisibilityDidChange:includedReset:", v8, v6, v5);

}

- (void)_sceneDidActivateNotification:(id)a3
{
  id v4;

  -[PKPaletteViewInteraction _updateSceneBounds](self, "_updateSceneBounds", a3);
  -[PKPaletteViewInteraction delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "paletteViewInteractionDidActivate:", self);

}

- (void)_sceneWillEnterForegroundNotification:(id)a3
{
  id v4;

  -[PKPaletteViewInteraction delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "paletteViewInteractionWillEnterForeground:", self);

}

- (void)_updateForWillRotate:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  dispatch_time_t v20;
  _QWORD block[5];
  CGRect v22;
  CGRect v23;

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "windowScene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteViewInteraction view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "window");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "windowScene");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 == v10)
  {
    -[PKPaletteViewInteraction paletteView](self, "paletteView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dismissPalettePopoverWithCompletion:", 0);

    objc_msgSend(v6, "frame");
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;
    -[PKPaletteViewInteraction textEffectsWindowFrame](self, "textEffectsWindowFrame");
    v23.origin.x = v13;
    v23.origin.y = v15;
    v23.size.width = v17;
    v23.size.height = v19;
    if (!CGRectEqualToRect(v22, v23))
    {
      -[PKPaletteViewInteraction setTextEffectsWindowFrame:](self, "setTextEffectsWindowFrame:", v13, v15, v17, v19);
      if (!-[PKPaletteHostView isPaletteVisible](self->_paletteHostView, "isPaletteVisible"))
      {
        -[PKPaletteHostView setHidden:](self->_paletteHostView, "setHidden:", 1);
        v20 = dispatch_time(0, 1000000000);
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __49__PKPaletteViewInteraction__updateForWillRotate___block_invoke;
        block[3] = &unk_1E7778020;
        block[4] = self;
        dispatch_after(v20, MEMORY[0x1E0C80D38], block);
      }
      -[PKPaletteViewInteraction _updateSceneBounds](self, "_updateSceneBounds");
    }
  }

}

uint64_t __49__PKPaletteViewInteraction__updateForWillRotate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setHidden:", 0);
}

- (void)_updateForRotation:(id)a3
{
  id v4;
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
  double v18;
  double v19;
  double v20;
  double v21;
  char v22;
  CGRect v23;
  CGRect v24;

  v22 = 0;
  v4 = a3;
  -[PKPaletteViewInteraction _sceneBoundsForUpdateWithFollowsHostingWindowOut:](self, "_sceneBoundsForUpdateWithFollowsHostingWindowOut:", &v22);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend(v4, "object");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "frame");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  if (v22
    || (-[PKPaletteViewInteraction textEffectsWindowFrame](self, "textEffectsWindowFrame"),
        v24.origin.x = v15,
        v24.origin.y = v17,
        v24.size.width = v19,
        v24.size.height = v21,
        !CGRectEqualToRect(v23, v24)))
  {
    -[PKPaletteViewInteraction setTextEffectsWindowFrame:](self, "setTextEffectsWindowFrame:", v15, v17, v19, v21);
    -[PKPaletteViewInteraction _updateUIWithSceneBounds:](self, "_updateUIWithSceneBounds:", v6, v8, v10, v12);
  }
}

+ (BOOL)isHostedWindow:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  NSClassFromString(CFSTR("UITextEffectsWindowHosted"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)_viewControllerForPalette
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PKPaletteViewInteraction paletteHostView](self, "paletteHostView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rootViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "childViewControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (CGRect)_sceneBoundsForUpdateWithFollowsHostingWindowOut:(BOOL *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  BOOL v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  CGRect result;

  -[PKPaletteViewInteraction view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.ScreenshotServicesService"));

  if (v9)
  {
    -[PKPaletteViewInteraction view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "window");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bounds");
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;

    v20 = 0;
    if (!a3)
      goto LABEL_9;
    goto LABEL_8;
  }
  -[PKPaletteViewInteraction view](self, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "window");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = +[PKPaletteViewInteraction isHostedWindow:](PKPaletteViewInteraction, "isHostedWindow:", v22);

  if (v23)
  {
    objc_msgSend(v6, "hostedViewSize");
    v17 = v24;
    objc_msgSend(v6, "hostedViewSize");
    v19 = v25;
    v20 = 0;
    v13 = 0.0;
    v15 = 0.0;
    if (!a3)
      goto LABEL_9;
    goto LABEL_8;
  }
  -[PKPaletteViewInteraction hostingWindow](self, "hostingWindow");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "bounds");
  v13 = v27;
  v15 = v28;
  v17 = v29;
  v19 = v30;

  v20 = 1;
  if (a3)
LABEL_8:
    *a3 = v20;
LABEL_9:

  v31 = v13;
  v32 = v15;
  v33 = v17;
  v34 = v19;
  result.size.height = v34;
  result.size.width = v33;
  result.origin.y = v32;
  result.origin.x = v31;
  return result;
}

- (void)_updateSceneBounds
{
  -[PKPaletteViewInteraction _sceneBoundsForUpdateWithFollowsHostingWindowOut:](self, "_sceneBoundsForUpdateWithFollowsHostingWindowOut:", 0);
  -[PKPaletteViewInteraction _updateUIWithSceneBounds:](self, "_updateUIWithSceneBounds:");
}

- (void)_updateUIWithSceneBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  uint64_t v8;
  void (**v9)(_QWORD, double, double);
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  _QWORD v25[5];
  void (**v26)(_QWORD, double, double);
  _QWORD aBlock[5];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!CGRectEqualToRect(self->_sceneBounds, a3))
  {
    self->_sceneBounds.origin.x = x;
    self->_sceneBounds.origin.y = y;
    v8 = MEMORY[0x1E0C809B0];
    self->_sceneBounds.size.width = width;
    self->_sceneBounds.size.height = height;
    aBlock[0] = v8;
    aBlock[1] = 3221225472;
    aBlock[2] = __53__PKPaletteViewInteraction__updateUIWithSceneBounds___block_invoke;
    aBlock[3] = &unk_1E777B078;
    aBlock[4] = self;
    v9 = (void (**)(_QWORD, double, double))_Block_copy(aBlock);
    if (-[PKPaletteViewInteraction isPaletteVisible](self, "isPaletteVisible")
      || !objc_msgSend(MEMORY[0x1E0DC3F10], "_isInAnimationBlock"))
    {
      -[PKPaletteViewInteraction sceneBounds](self, "sceneBounds");
      v9[2](v9, v11, v12);
    }
    else
    {
      v10 = (void *)MEMORY[0x1E0DC3F10];
      v25[0] = v8;
      v25[1] = 3221225472;
      v25[2] = __53__PKPaletteViewInteraction__updateUIWithSceneBounds___block_invoke_2;
      v25[3] = &unk_1E7778858;
      v25[4] = self;
      v26 = v9;
      objc_msgSend(v10, "_performWithoutRetargetingAnimations:", v25);

    }
    -[PKPaletteViewInteraction paletteView](self, "paletteView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "paletteHostingWindowSceneDidChangeBounds:", self);

  }
  -[PKPaletteViewInteraction _traitCollectionForHostingWindow](self, "_traitCollectionForHostingWindow");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteViewInteraction _updatePaletteTraitCollection:](self, "_updatePaletteTraitCollection:", v14);
  v15 = (void *)objc_opt_class();
  -[PKPaletteViewInteraction view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "window");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v15) = objc_msgSend(v15, "isHostedWindow:", v17);

  if ((_DWORD)v15)
  {
    -[PKPaletteViewInteraction view](self, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "window");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "frame");
    v21 = v20;
    -[PKPaletteViewInteraction sceneBounds](self, "sceneBounds");
    v23 = v21 - v22 + 10.0;

    -[PKPaletteViewInteraction paletteView](self, "paletteView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setPalettePopoverLayoutSceneMargins:", 10.0, 10.0, 10.0, v23);

  }
}

void __53__PKPaletteViewInteraction__updateUIWithSceneBounds___block_invoke(uint64_t a1, double a2, double a3)
{
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "paletteHostViewWidthConstraint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setConstant:", a2);

  objc_msgSend(*(id *)(a1 + 32), "paletteHostViewHeightConstraint");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setConstant:", a3);

}

void __53__PKPaletteViewInteraction__updateUIWithSceneBounds___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  double v3;
  double v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "sceneBounds");
  (*(void (**)(uint64_t, double, double))(v2 + 16))(v2, v3, v4);
  objc_msgSend(*(id *)(a1 + 32), "view");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layoutIfNeeded");

}

- (void)_updatePaletteUserInterfaceStyle:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithUserInterfaceStyle:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteViewInteraction paletteHostView](self, "paletteHostView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_localOverrideTraitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0DC3E88];
    v11[0] = v6;
    v11[1] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "traitCollectionWithTraitsFromCollections:", v8);
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = v4;
  }
  -[PKPaletteViewInteraction paletteHostView](self, "paletteHostView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_setLocalOverrideTraitCollection:", v9);

}

- (void)_updatePaletteTraitCollection:(id)a3
{
  id v4;
  _QWORD v5[5];
  id v6;
  CGRect v7;

  v4 = a3;
  -[PKPaletteViewInteraction textEffectsWindowFrame](self, "textEffectsWindowFrame");
  if (CGRectEqualToRect(v7, *MEMORY[0x1E0C9D648]))
  {
    -[PKPaletteViewInteraction _updatePaletteUserInterfaceStyle:](self, "_updatePaletteUserInterfaceStyle:", objc_msgSend(v4, "userInterfaceStyle"));
  }
  else
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __58__PKPaletteViewInteraction__updatePaletteTraitCollection___block_invoke;
    v5[3] = &unk_1E7777C20;
    v5[4] = self;
    v6 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], v5);

  }
}

void __58__PKPaletteViewInteraction__updatePaletteTraitCollection___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "paletteHostView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setLocalOverrideTraitCollection:", *(_QWORD *)(a1 + 40));

}

- (BOOL)_isCompactHostedWindow
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  BOOL v9;
  void *v10;
  void *v11;

  -[PKPaletteViewInteraction hostingWindow](self, "hostingWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "horizontalSizeClass");

  -[PKPaletteViewInteraction view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = +[PKPaletteViewInteraction isHostedWindow:](PKPaletteViewInteraction, "isHostedWindow:", v7);

  v9 = 0;
  if (v8 && v5 != 1)
  {
    -[PKPaletteViewInteraction view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "window");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "hostedViewSize");
    v9 = _UIUserInterfaceSizeClassForWidth() == 1;

  }
  return v9;
}

- (id)_traitCollectionForHostingWindow
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  -[PKPaletteViewInteraction hostingWindow](self, "hostingWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaletteViewInteraction hostingWindow](self, "hostingWindow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceIdiom");

  if (v7 == 1 && -[PKPaletteViewInteraction _isCompactHostedWindow](self, "_isCompactHostedWindow"))
  {
    -[PKPaletteViewInteraction view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "window");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "hostedViewSize");
    objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithHorizontalSizeClass:", _UIUserInterfaceSizeClassForWidth());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x1E0DC3E88];
    v15[0] = v4;
    v15[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "traitCollectionWithTraitsFromCollections:", v12);
    v13 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v13;
  }
  return v4;
}

- (id)hostingWindow
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  void *v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  -[PKPaletteViewInteraction view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!+[PKPaletteViewInteraction isHostedWindow:](PKPaletteViewInteraction, "isHostedWindow:", v4))
  {

    goto LABEL_15;
  }
  -[PKPaletteViewInteraction windowScene](self, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) == 0)
  {
LABEL_15:
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    -[PKPaletteViewInteraction windowScene](self, "windowScene", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "windows");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v28;
LABEL_17:
      v22 = 0;
      while (1)
      {
        if (*(_QWORD *)v28 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v22);
        if (!objc_msgSend(v23, "_isTextEffectsWindow"))
          break;
        if (v20 == ++v22)
        {
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
          if (v20)
            goto LABEL_17;
          goto LABEL_23;
        }
      }
      v12 = v23;

      if (v12)
        return v12;
    }
    else
    {
LABEL_23:

    }
    v9 = os_log_create("com.apple.pencilkit", ");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      -[PKPaletteViewInteraction windowScene](self, "windowScene");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v36 = v26;
      _os_log_fault_impl(&dword_1BE213000, v9, OS_LOG_TYPE_FAULT, "Unable to find application window in windowScene: %@", buf, 0xCu);

    }
    v12 = 0;
    goto LABEL_32;
  }
  -[PKPaletteViewInteraction windowScene](self, "windowScene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "performSelector:", sel__visibleWindows);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v9 = v8;
  v10 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v32 != v13)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        if (objc_msgSend(v15, "isKeyWindow"))
        {
          v16 = v15;

          v12 = v16;
        }
      }
      v11 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
    }
    while (v11);

    if (v12)
      goto LABEL_32;
  }
  else
  {

  }
  v24 = os_log_create("com.apple.pencilkit", "Sketching");
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1BE213000, v24, OS_LOG_TYPE_DEBUG, "No window in _visibleWindows was key, just take the last window object", buf, 2u);
  }

  -[NSObject lastObject](v9, "lastObject");
  v12 = (id)objc_claimAutoreleasedReturnValue();
LABEL_32:

  return v12;
}

- (id)paletteTapToRadarCommandConfiguration:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  PKTextInputDebugSharpenerLog *v9;
  void *v10;
  PKPaletteTapToRadarConfiguration *v11;
  void *v12;
  void *v13;

  -[PKPaletteViewInteraction view](self, "view", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKToolPicker activeToolPickerForWindow:](PKToolPicker, "activeToolPickerForWindow:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "_isHandwritingToolSelected"))
  {
    -[PKPaletteViewInteraction windowScene](self, "windowScene");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKTextInputInteraction interactionForScene:](PKTextInputInteraction, "interactionForScene:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "debugLogController");
    v9 = (PKTextInputDebugSharpenerLog *)objc_claimAutoreleasedReturnValue();
    -[PKTextInputDebugLogController sharpenerLogWithCurrentContent](v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_alloc_init(PKPaletteTapToRadarConfiguration);
    if (objc_msgSend(v10, "hasContent"))
      v12 = v10;
    else
      v12 = 0;
    -[PKPaletteTapToRadarConfiguration setDebugSharpenerLog:](v11, "setDebugSharpenerLog:", v12);
    -[PKPaletteViewInteraction _viewControllerForPalette](self, "_viewControllerForPalette");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteTapToRadarConfiguration setPresentationViewController:](v11, "setPresentationViewController:", v13);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (PKPaletteViewInteractionDelegate)delegate
{
  return (PKPaletteViewInteractionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PKPaletteHostView)paletteHostView
{
  return self->_paletteHostView;
}

- (void)setPaletteHostView:(id)a3
{
  objc_storeStrong((id *)&self->_paletteHostView, a3);
}

- (PKDrawingPaletteView)paletteView
{
  return self->_paletteView;
}

- (void)setPaletteView:(id)a3
{
  objc_storeStrong((id *)&self->_paletteView, a3);
}

- (UIWindowScene)windowScene
{
  return (UIWindowScene *)objc_loadWeakRetained((id *)&self->_windowScene);
}

- (UIView)view
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_view);
}

- (void)setView:(id)a3
{
  objc_storeWeak((id *)&self->_view, a3);
}

- (CGRect)sceneBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_sceneBounds.origin.x;
  y = self->_sceneBounds.origin.y;
  width = self->_sceneBounds.size.width;
  height = self->_sceneBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setSceneBounds:(CGRect)a3
{
  self->_sceneBounds = a3;
}

- (NSLayoutConstraint)paletteHostViewWidthConstraint
{
  return self->_paletteHostViewWidthConstraint;
}

- (void)setPaletteHostViewWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_paletteHostViewWidthConstraint, a3);
}

- (NSLayoutConstraint)paletteHostViewHeightConstraint
{
  return self->_paletteHostViewHeightConstraint;
}

- (void)setPaletteHostViewHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_paletteHostViewHeightConstraint, a3);
}

- (NSLayoutConstraint)paletteHostViewTopConstraint
{
  return self->_paletteHostViewTopConstraint;
}

- (void)setPaletteHostViewTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_paletteHostViewTopConstraint, a3);
}

- (NSLayoutConstraint)paletteHostViewLeftConstraint
{
  return self->_paletteHostViewLeftConstraint;
}

- (void)setPaletteHostViewLeftConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_paletteHostViewLeftConstraint, a3);
}

- (CGRect)textEffectsWindowFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_textEffectsWindowFrame.origin.x;
  y = self->_textEffectsWindowFrame.origin.y;
  width = self->_textEffectsWindowFrame.size.width;
  height = self->_textEffectsWindowFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setTextEffectsWindowFrame:(CGRect)a3
{
  self->_textEffectsWindowFrame = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paletteHostViewLeftConstraint, 0);
  objc_storeStrong((id *)&self->_paletteHostViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_paletteHostViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_paletteHostViewWidthConstraint, 0);
  objc_destroyWeak((id *)&self->_view);
  objc_destroyWeak((id *)&self->_windowScene);
  objc_storeStrong((id *)&self->_paletteView, 0);
  objc_storeStrong((id *)&self->_paletteHostView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_scene);
}

@end
