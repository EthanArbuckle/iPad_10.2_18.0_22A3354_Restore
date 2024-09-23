@implementation AFUISceneHostingViewController

- (AFUISceneHostingViewController)init
{
  AFUISceneHostingViewController *v2;
  AFUISceneHostingViewController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AFUISceneHostingViewController;
  v2 = -[AFUISceneHostingViewController init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[AFUISceneHostingViewController _commonInit](v2, "_commonInit");
  return v3;
}

- (AFUISceneHostingViewController)initWithCoder:(id)a3
{
  AFUISceneHostingViewController *v3;
  AFUISceneHostingViewController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AFUISceneHostingViewController;
  v3 = -[AFUISceneHostingViewController initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[AFUISceneHostingViewController _commonInit](v3, "_commonInit");
  return v4;
}

- (void)_commonInit
{
  AFUISceneController *v3;
  AFUISceneController *sceneController;

  v3 = objc_alloc_init(AFUISceneController);
  sceneController = self->_sceneController;
  self->_sceneController = v3;

  -[AFUISceneController setDelegate:](self->_sceneController, "setDelegate:", self);
  self->_deferralMode = 0;
  self->_pauseDeferrals = 1;
  -[AFUISceneHostingViewController _registerForAmbientPresentationTraitChange](self, "_registerForAmbientPresentationTraitChange");
}

- (void)_registerForAmbientPresentationTraitChange
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id location;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  -[AFUISceneHostingViewController _updateSceneSettingsForAmbient](self, "_updateSceneSettingsForAmbient");
  objc_initWeak(&location, self);
  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __76__AFUISceneHostingViewController__registerForAmbientPresentationTraitChange__block_invoke;
  v6[3] = &unk_24D7A1838;
  objc_copyWeak(&v7, &location);
  v5 = (id)-[AFUISceneHostingViewController registerForTraitChanges:withHandler:](self, "registerForTraitChanges:withHandler:", v4, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __76__AFUISceneHostingViewController__registerForAmbientPresentationTraitChange__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateSceneSettingsForAmbient");

}

- (void)_updateSceneSettingsForAmbient
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __64__AFUISceneHostingViewController__updateSceneSettingsForAmbient__block_invoke;
  v2[3] = &unk_24D7A1860;
  v2[4] = self;
  -[AFUISceneHostingViewController _updateSceneUIApplicationSceneSettingsWithBlock:](self, "_updateSceneUIApplicationSceneSettingsWithBlock:", v2);
}

void __64__AFUISceneHostingViewController__updateSceneSettingsForAmbient__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v5 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "traitCollection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isAmbientPresented");

    objc_msgSend(v5, "setAmbientPresented:", v4);
  }

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AFUISceneHostingViewController;
  -[AFUISceneHostingViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  if (!self->_currentOrientation)
  {
    objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    self->_currentOrientation = objc_msgSend(v4, "activeInterfaceOrientation");

  }
}

- (void)_updateSceneSettingsToSize:(CGSize)a3 interfaceOrientation:(int64_t)a4 withAnimationSettings:(id)a5 animationFence:(id)a6
{
  double height;
  double width;
  id v11;
  id v12;
  os_log_t *v13;
  NSObject *v14;
  double v15;
  void *v16;
  void *v17;
  char v18;
  os_log_t v19;
  CGFloat x;
  CGFloat y;
  CGFloat v22;
  CGFloat v23;
  NSObject *v24;
  void *v25;
  FBScene *scene;
  _QWORD v27[4];
  id v28;
  id v29;
  AFUISceneHostingViewController *v30;
  int64_t v31;
  char v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  int64_t v38;
  uint64_t v39;
  CGRect v40;
  CGRect v41;

  height = a3.height;
  width = a3.width;
  v39 = *MEMORY[0x24BDAC8D0];
  v11 = a5;
  v12 = a6;
  v13 = (os_log_t *)MEMORY[0x24BE08FB0];
  v14 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v34 = "-[AFUISceneHostingViewController _updateSceneSettingsToSize:interfaceOrientation:withAnimationSettings:animationFence:]";
    _os_log_impl(&dword_217514000, v14, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  if ((unint64_t)(a4 - 3) >= 2)
    v15 = width;
  else
    v15 = height;
  if ((unint64_t)(a4 - 3) < 2)
    height = width;
  -[AFUISceneHostingViewController scene](self, "scene");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "settings");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isForeground");

  if (self->_currentOrientation != a4
    || (v40.origin.x = 0.0,
        v40.origin.y = 0.0,
        v40.size.width = v15,
        v40.size.height = height,
        !CGRectEqualToRect(v40, self->_currentFrame)))
  {
    self->_currentOrientation = a4;
    self->_currentFrame.origin.x = 0.0;
    self->_currentFrame.origin.y = 0.0;
    self->_currentFrame.size.width = v15;
    self->_currentFrame.size.height = height;
    v19 = *v13;
    if (os_log_type_enabled(*v13, OS_LOG_TYPE_DEFAULT))
    {
      x = self->_currentFrame.origin.x;
      y = self->_currentFrame.origin.y;
      v22 = self->_currentFrame.size.width;
      v23 = self->_currentFrame.size.height;
      v24 = v19;
      v41.origin.x = x;
      v41.origin.y = y;
      v41.size.width = v22;
      v41.size.height = v23;
      NSStringFromCGRect(v41);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v34 = "-[AFUISceneHostingViewController _updateSceneSettingsToSize:interfaceOrientation:withAnimationSettings:animationFence:]";
      v35 = 2112;
      v36 = v25;
      v37 = 2048;
      v38 = a4;
      _os_log_impl(&dword_217514000, v24, OS_LOG_TYPE_DEFAULT, "%s Updating scene with frame: %@, interfaceOrientation: %zd", buf, 0x20u);

    }
    scene = self->_scene;
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __119__AFUISceneHostingViewController__updateSceneSettingsToSize_interfaceOrientation_withAnimationSettings_animationFence___block_invoke;
    v27[3] = &unk_24D7A1888;
    v32 = v18;
    v28 = v12;
    v30 = self;
    v31 = a4;
    v29 = v11;
    -[FBScene updateSettingsWithTransitionBlock:](scene, "updateSettingsWithTransitionBlock:", v27);
    -[AFUISceneHostingViewController updateRemoteSceneWithFrontMostAppInterfaceOrientation:](self, "updateRemoteSceneWithFrontMostAppInterfaceOrientation:", self->_currentOrientation);

  }
}

id __119__AFUISceneHostingViewController__updateSceneSettingsToSize_interfaceOrientation_withAnimationSettings_animationFence___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;

  v3 = a2;
  if (*(_BYTE *)(a1 + 64))
  {
    v4 = (void *)objc_opt_new();
    objc_msgSend(v4, "setAnimationFence:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v4, "setAnimationSettings:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    v4 = 0;
  }
  if (objc_msgSend(v3, "isUISubclass"))
  {
    v5 = *(_QWORD *)(a1 + 56);
    v6 = v3;
    objc_msgSend(v6, "setInterfaceOrientation:", v5);
    objc_msgSend(v6, "setFrame:", *(double *)(*(_QWORD *)(a1 + 48) + 1040), *(double *)(*(_QWORD *)(a1 + 48) + 1048), *(double *)(*(_QWORD *)(a1 + 48) + 1056), *(double *)(*(_QWORD *)(a1 + 48) + 1064));

  }
  return v4;
}

- (void)startHostingSceneForConfiguration:(id)a3 withCompletionBlock:(id)a4
{
  id v8;
  id v9;
  void *v10;
  int64_t v11;
  void *v12;
  AFUISceneController *sceneController;
  id v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AFUISceneHostingViewController.m"), 173, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("configuration"));

    if (v10)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AFUISceneHostingViewController.m"), 174, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionBlock"));

    goto LABEL_3;
  }
  if (!v9)
    goto LABEL_5;
LABEL_3:
  v11 = objc_msgSend(v8, "preferredDeferralMode");
  self->_deferralMode = v11;
  self->_pauseDeferrals = v11 != 1;
  -[AFUISceneHostingViewController traitCollection](self, "traitCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setUserInterfaceStyle:", objc_msgSend(v12, "userInterfaceStyle"));

  objc_storeStrong((id *)&self->_configuration, a3);
  objc_initWeak(&location, self);
  sceneController = self->_sceneController;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __88__AFUISceneHostingViewController_startHostingSceneForConfiguration_withCompletionBlock___block_invoke;
  v17[3] = &unk_24D7A18F0;
  objc_copyWeak(&v19, &location);
  v14 = v10;
  v18 = v14;
  -[AFUISceneController requestSceneViewWithConfiguration:completionBlock:](sceneController, "requestSceneViewWithConfiguration:completionBlock:", v8, v17);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

}

void __88__AFUISceneHostingViewController_startHostingSceneForConfiguration_withCompletionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  os_log_t *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id WeakRetained;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  os_log_t v20;
  NSObject *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (os_log_t *)MEMORY[0x24BE08FB0];
  if (v6)
  {
    v8 = (void *)*MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      v9 = v8;
      objc_msgSend(v6, "localizedDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v28 = "-[AFUISceneHostingViewController startHostingSceneForConfiguration:withCompletionBlock:]_block_invoke";
      v29 = 2112;
      v30 = v10;
      _os_log_impl(&dword_217514000, v9, OS_LOG_TYPE_DEFAULT, "%s #sceneHosting Error requesting scene: %@ ", buf, 0x16u);

    }
  }
  if (v5)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v12 = WeakRetained;
    if (WeakRetained)
    {
      objc_msgSend(WeakRetained, "scene");
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)v13;
      if ((id)v13 == v5)
      {
        objc_msgSend(v12, "presentation");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v13)
        {
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[AFUISceneHostingViewController startHostingSceneForConfiguration:withCompletionBlock:]_block_invoke");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", v26, CFSTR("AFUISceneHostingViewController.m"), 199, CFSTR("#sceneHosting scene mismatch : old=%@ new=%@"), v14, v5);

        }
        objc_msgSend(v12, "setScene:", v5);
        objc_msgSend(v12, "_updateSceneSettingsForAmbient");
        objc_msgSend(v5, "uiPresentationManager");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v5, "identifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "stringWithFormat:", CFSTR("PresentationManager-Scene%@"), v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "createPresenterWithIdentifier:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v19, "modifyPresentationContext:", &__block_literal_global);
        objc_msgSend(v12, "setPresentation:", v19);
      }
      objc_msgSend(v19, "activate");
      v20 = *v7;
      if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
      {
        v21 = v20;
        objc_msgSend(v5, "identifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315906;
        v28 = "-[AFUISceneHostingViewController startHostingSceneForConfiguration:withCompletionBlock:]_block_invoke";
        v29 = 2112;
        v30 = v19;
        v31 = 2112;
        v32 = v22;
        v33 = 2112;
        v34 = v5;
        _os_log_impl(&dword_217514000, v21, OS_LOG_TYPE_DEFAULT, "%s #sceneHosting Completed scene request with presenter %@ for scene (ID: %@) %@", buf, 0x2Au);

      }
      objc_msgSend(v19, "presentationView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "_transitionContentsWithView:forContentState:", v23, objc_msgSend(v5, "contentState"));

    }
  }
  v24 = *v7;
  if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v28 = "-[AFUISceneHostingViewController startHostingSceneForConfiguration:withCompletionBlock:]_block_invoke";
    _os_log_impl(&dword_217514000, v24, OS_LOG_TYPE_DEFAULT, "%s #sceneHosting calling completion block for startHostingSceneForConfiguration", buf, 0xCu);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __88__AFUISceneHostingViewController_startHostingSceneForConfiguration_withCompletionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setAppearanceStyle:", 2);
  objc_msgSend(v2, "setPresentedLayerTypes:", 26);

}

- (void)stopHostingScene
{
  -[AFUISceneHostingViewController _audioCategoriesDisablingVolumeHUDDidChangeTo:](self, "_audioCategoriesDisablingVolumeHUDDidChangeTo:", 0);
  -[AFUISceneHostingViewController _transitionContentsWithView:forContentState:](self, "_transitionContentsWithView:forContentState:", 0, 0);
  -[UIScenePresenter deactivate](self->_presentation, "deactivate");
}

- (void)invalidateSceneForReason:(unint64_t)a3 explanation:(id)a4
{
  id v6;
  UIScenePresenter *presentation;

  v6 = a4;
  -[AFUISceneHostingViewController stopHostingScene](self, "stopHostingScene");
  -[AFUISceneController invalidateSceneForReason:explanation:](self->_sceneController, "invalidateSceneForReason:explanation:", a3, v6);

  presentation = self->_presentation;
  self->_presentation = 0;

  -[AFUISceneHostingViewController setScene:](self, "setScene:", 0);
}

- (BOOL)isHostingScene
{
  UIView *windowSceneHostingView;
  void *v3;
  BOOL v4;

  windowSceneHostingView = self->_windowSceneHostingView;
  if (!windowSceneHostingView)
    return 0;
  -[UIView superview](windowSceneHostingView, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (BOOL)isDeferringHIDEvents
{
  return self->_predicateInvalidationHandler != 0;
}

- (void)startDeferringHIDEventsIfNeeded
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  self->_pauseDeferrals = 0;
  -[AFUISceneHostingViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315394;
    v9 = "-[AFUISceneHostingViewController startDeferringHIDEventsIfNeeded]";
    v10 = 2112;
    v11 = v4;
    _os_log_impl(&dword_217514000, v5, OS_LOG_TYPE_DEFAULT, "%s #siriHID Starting HID deferrals and resuming until asked to pause again: %@", (uint8_t *)&v8, 0x16u);
  }
  -[AFUISceneHostingViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFUISceneHostingViewController _updateDeferralChainWithWindow:](self, "_updateDeferralChainWithWindow:", v7);

}

- (void)invalidateAndPauseDeferringHIDEvents
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[AFUISceneHostingViewController invalidateAndPauseDeferringHIDEvents]";
    _os_log_impl(&dword_217514000, v3, OS_LOG_TYPE_DEFAULT, "%s #siriHID Invalidating HID deferrals and pausing until asked to start again", (uint8_t *)&v4, 0xCu);
  }
  -[BSInvalidatable invalidate](self->_predicateInvalidationHandler, "invalidate");
  self->_pauseDeferrals = 1;
}

- (void)updateSceneWithConfiguration:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_configuration, a3);
  v5 = a3;
  -[AFUISceneController updateSceneViewWithConfiguration:](self->_sceneController, "updateSceneViewWithConfiguration:", v5);

}

- (void)_transitionContentsWithView:(id)a3 forContentState:(int64_t)a4
{
  UIView **p_windowSceneHostingView;
  UIView *windowSceneHostingView;
  UIView *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  p_windowSceneHostingView = &self->_windowSceneHostingView;
  -[UIView removeFromSuperview](self->_windowSceneHostingView, "removeFromSuperview");
  windowSceneHostingView = self->_windowSceneHostingView;
  self->_windowSceneHostingView = 0;

  if (v13)
  {
    objc_storeStrong((id *)&self->_windowSceneHostingView, a3);
    v8 = *p_windowSceneHostingView;
    -[AFUISceneHostingViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bounds");
    -[UIView setFrame:](v8, "setFrame:");

    -[AFUISceneHostingViewController view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", *p_windowSceneHostingView);

    -[AFUISceneHostingViewController view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "window");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFUISceneHostingViewController _updateDeferralChainWithWindow:](self, "_updateDeferralChainWithWindow:", v12);

  }
}

- (void)setWindowSceneHostingView:(id)a3
{
  objc_storeStrong((id *)&self->_windowSceneHostingView, a3);
}

- (void)_updateSceneUIApplicationSceneSettingsWithBlock:(id)a3
{
  id v4;
  FBScene *scene;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  scene = self->_scene;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __82__AFUISceneHostingViewController__updateSceneUIApplicationSceneSettingsWithBlock___block_invoke;
  v7[3] = &unk_24D7A1918;
  v8 = v4;
  v6 = v4;
  -[FBScene updateSettingsWithBlock:](scene, "updateSettingsWithBlock:", v7);

}

void __82__AFUISceneHostingViewController__updateSceneUIApplicationSceneSettingsWithBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v4 = (void *)*MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
      __82__AFUISceneHostingViewController__updateSceneUIApplicationSceneSettingsWithBlock___block_invoke_cold_1(v4);
  }

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[5];
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AFUISceneHostingViewController;
  v4 = a3;
  -[AFUISceneHostingViewController traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  -[AFUISceneHostingViewController traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceStyle");

  v7 = objc_msgSend(v4, "userInterfaceStyle");
  if (v6 != v7)
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __59__AFUISceneHostingViewController_traitCollectionDidChange___block_invoke;
    v8[3] = &__block_descriptor_40_e43_v16__0__UIMutableApplicationSceneSettings_8l;
    v8[4] = v6;
    -[AFUISceneHostingViewController _updateSceneUIApplicationSceneSettingsWithBlock:](self, "_updateSceneUIApplicationSceneSettingsWithBlock:", v8);
  }
}

uint64_t __59__AFUISceneHostingViewController_traitCollectionDidChange___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setUserInterfaceStyle:", *(_QWORD *)(a1 + 32));
}

- (UIEdgeInsets)effectiveSafeAreaInsets
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  UIEdgeInsets result;

  if (-[AFUISceneHostingViewController safeAreaInsetsAreSuspended](self, "safeAreaInsetsAreSuspended"))
  {
    -[AFUISceneHostingViewController suspendedSafeAreaInsets](self, "suspendedSafeAreaInsets");
  }
  else
  {
    -[AFUISceneHostingViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "safeAreaInsets");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;

    v3 = v9;
    v4 = v11;
    v5 = v13;
    v6 = v15;
  }
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (void)viewSafeAreaInsetsDidChange
{
  _QWORD v3[5];
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AFUISceneHostingViewController;
  -[AFUISceneHostingViewController viewSafeAreaInsetsDidChange](&v4, sel_viewSafeAreaInsetsDidChange);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __61__AFUISceneHostingViewController_viewSafeAreaInsetsDidChange__block_invoke;
  v3[3] = &unk_24D7A1860;
  v3[4] = self;
  -[AFUISceneHostingViewController _updateSceneUIApplicationSceneSettingsWithBlock:](self, "_updateSceneUIApplicationSceneSettingsWithBlock:", v3);
}

void __61__AFUISceneHostingViewController_viewSafeAreaInsetsDidChange__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeAreaInsets");
  objc_msgSend(v4, "setSafeAreaInsetsPortrait:");

  objc_msgSend(*(id *)(a1 + 32), "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeAreaInsets");
  objc_msgSend(v4, "setSafeAreaInsetsLandscapeLeft:");

  objc_msgSend(*(id *)(a1 + 32), "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safeAreaInsets");
  objc_msgSend(v4, "setSafeAreaInsetsLandscapeRight:");

  objc_msgSend(*(id *)(a1 + 32), "view");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "safeAreaInsets");
  objc_msgSend(v4, "setSafeAreaInsetsPortraitUpsideDown:");

}

- (void)setSafeAreaInsetsAreSuspended:(BOOL)a3
{
  void *v5;

  if (self->_safeAreaInsetsAreSuspended != a3)
  {
    if (a3)
    {
      -[AFUISceneHostingViewController view](self, "view");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "safeAreaInsets");
      -[AFUISceneHostingViewController setSuspendedSafeAreaInsets:](self, "setSuspendedSafeAreaInsets:");

      self->_safeAreaInsetsAreSuspended = a3;
    }
    else
    {
      self->_safeAreaInsetsAreSuspended = 0;
      -[AFUISceneHostingViewController viewSafeAreaInsetsDidChange](self, "viewSafeAreaInsetsDidChange");
    }
  }
}

- (void)setInFluidDismissal:(BOOL)a3
{
  self->_inFluidDismissal = a3;
  -[AFUISceneHostingViewController setSafeAreaInsetsAreSuspended:](self, "setSafeAreaInsetsAreSuspended:");
}

- (void)setClippingDisabled:(BOOL)a3
{
  id v4;
  _QWORD v5[4];
  BOOL v6;

  if (self->_clippingDisabled != a3)
  {
    self->_clippingDisabled = a3;
    -[AFUISceneHostingViewController presentation](self, "presentation");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __54__AFUISceneHostingViewController_setClippingDisabled___block_invoke;
    v5[3] = &__block_descriptor_33_e43_v16__0__UIMutableScenePresentationContext_8l;
    v6 = a3;
    objc_msgSend(v4, "modifyPresentationContext:", v5);

  }
}

uint64_t __54__AFUISceneHostingViewController_setClippingDisabled___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setClippingDisabled:", *(unsigned __int8 *)(a1 + 32));
}

- (BOOL)isSceneActive
{
  void *v2;
  BOOL v3;

  -[AFUISceneHostingViewController configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "deactivationReasonMask") == 0;

  return v3;
}

- (void)reactivateScene
{
  if (!-[AFUISceneHostingViewController isSceneActive](self, "isSceneActive"))
    -[AFUISceneHostingViewController updateSceneDeactivationReasonMask:](self, "updateSceneDeactivationReasonMask:", 0);
}

- (void)deactivateScene
{
  if (-[AFUISceneHostingViewController isSceneActive](self, "isSceneActive"))
    -[AFUISceneHostingViewController updateSceneDeactivationReasonMask:](self, "updateSceneDeactivationReasonMask:", 16);
}

- (void)updateSceneDeactivationReasonMask:(unint64_t)a3
{
  void *v5;
  void *v6;
  id v7;

  -[AFUISceneHostingViewController configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v5, "copy");

  objc_msgSend(v7, "setDeactivationReasonMask:", a3);
  -[AFUISceneHostingViewController traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUserInterfaceStyle:", objc_msgSend(v6, "userInterfaceStyle"));

  -[AFUISceneHostingViewController updateSceneWithConfiguration:](self, "updateSceneWithConfiguration:", v7);
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  _BOOL4 v11;
  uint64_t v12;

  v4 = a4;
  v12 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315394;
    v9 = "-[AFUISceneHostingViewController viewDidMoveToWindow:shouldAppearOrDisappear:]";
    v10 = 1024;
    v11 = v4;
    _os_log_impl(&dword_217514000, v7, OS_LOG_TYPE_DEFAULT, "%s #siriHID viewDidMoveToWindow:shouldAppearOrDisappear: %d", (uint8_t *)&v8, 0x12u);
  }
  -[AFUISceneHostingViewController _updateDeferralChainWithWindow:](self, "_updateDeferralChainWithWindow:", v6);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[9];
  objc_super v18;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)AFUISceneHostingViewController;
  -[AFUISceneHostingViewController viewWillTransitionToSize:withTransitionCoordinator:](&v18, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  objc_msgSend(v7, "containerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v8;
  }
  else
  {
    objc_msgSend(v8, "window");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;
  SBFWindowForViewControllerTransition();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "_toWindowOrientation");

  v13 = (void *)MEMORY[0x24BE0BD98];
  objc_msgSend(v7, "transitionDuration");
  objc_msgSend(v13, "settingsWithDuration:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "windowScene");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "_synchronizedDrawingFence");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[AFUISceneHostingViewController _updateSceneSettingsToSize:interfaceOrientation:withAnimationSettings:animationFence:](self, "_updateSceneSettingsToSize:interfaceOrientation:withAnimationSettings:animationFence:", v12, v14, v16, width, height);
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __85__AFUISceneHostingViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v17[3] = &unk_24D7A1980;
  v17[5] = 0;
  v17[6] = 0;
  v17[4] = self;
  *(double *)&v17[7] = width;
  *(double *)&v17[8] = height;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v17, &__block_literal_global_40);

}

void __85__AFUISceneHostingViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));

}

- (void)viewWillLayoutSubviews
{
  UIView *windowSceneHostingView;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AFUISceneHostingViewController;
  -[AFUISceneHostingViewController viewWillLayoutSubviews](&v5, sel_viewWillLayoutSubviews);
  windowSceneHostingView = self->_windowSceneHostingView;
  -[AFUISceneHostingViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  -[UIView setFrame:](windowSceneHostingView, "setFrame:");

}

- (BOOL)_shouldDeferHIDEventsForMode
{
  return self->_deferralMode != 0;
}

- (void)_updateDeferralChainWithWindow:(id)a3
{
  id v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  NSObject *v9;
  int64_t deferralMode;
  NSObject *v11;
  FBScene *scene;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  int v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  BSInvalidatable *v27;
  BSInvalidatable *predicateInvalidationHandler;
  NSObject *v29;
  NSObject *v30;
  int v31;
  const char *v32;
  __int16 v33;
  _WORD v34[9];

  *(_QWORD *)&v34[5] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[AFUISceneHostingViewController _shouldDeferHIDEventsForMode](self, "_shouldDeferHIDEventsForMode"))
  {
    if (self->_pauseDeferrals)
    {
      v5 = *MEMORY[0x24BE08FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
      {
        v31 = 136315138;
        v32 = "-[AFUISceneHostingViewController _updateDeferralChainWithWindow:]";
        v6 = "%s #siriHID skipping deferral of HID events until un-paused";
        v7 = v5;
        v8 = 12;
LABEL_7:
        _os_log_impl(&dword_217514000, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v31, v8);
      }
    }
    else
    {
      if (self->_predicateInvalidationHandler)
      {
        v11 = *MEMORY[0x24BE08FB0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
        {
          v31 = 136315138;
          v32 = "-[AFUISceneHostingViewController _updateDeferralChainWithWindow:]";
          _os_log_impl(&dword_217514000, v11, OS_LOG_TYPE_DEFAULT, "%s #siriHID invalidating defer HID events assertion", (uint8_t *)&v31, 0xCu);
        }
        -[BSInvalidatable invalidate](self->_predicateInvalidationHandler, "invalidate");
      }
      scene = self->_scene;
      if (scene)
      {
        -[FBScene uiClientSettings](scene, "uiClientSettings");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[FBScene uiClientSettings](self->_scene, "uiClientSettings");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v14 = 0;
        }

        v15 = objc_msgSend(v4, "_contextId");
        v16 = objc_msgSend(v14, "clientWindowContextID");
        v17 = v16;
        if ((_DWORD)v15)
          v18 = (_DWORD)v16 == 0;
        else
          v18 = 1;
        v19 = v18;
        if (!v4 || (v19 & 1) != 0)
        {
          if (v19)
          {
            v30 = *MEMORY[0x24BE08FB0];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
            {
              v31 = 136315650;
              v32 = "-[AFUISceneHostingViewController _updateDeferralChainWithWindow:]";
              v33 = 1024;
              *(_DWORD *)v34 = v15;
              v34[2] = 1024;
              *(_DWORD *)&v34[3] = v17;
              _os_log_impl(&dword_217514000, v30, OS_LOG_TYPE_DEFAULT, "%s #siriHID Skipped defering HID events because of an invalid contextID (%u) or clientContextID (%u)", (uint8_t *)&v31, 0x18u);
            }
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x24BE0B698], "tokenForIdentifierOfCAContext:", v15);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_alloc_init(MEMORY[0x24BE0B6C8]);
          objc_msgSend(v21, "setDisplay:", 0);
          objc_msgSend(v21, "setToken:", v20);
          objc_msgSend(MEMORY[0x24BE0B690], "keyboardFocusEnvironment");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setEnvironment:", v22);

          objc_msgSend(MEMORY[0x24BE0B698], "tokenForIdentifierOfCAContext:", v17);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_alloc_init(MEMORY[0x24BE0B6D0]);
          -[FBScene clientProcess](self->_scene, "clientProcess");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "setPid:", objc_msgSend(v25, "pid"));

          objc_msgSend(v24, "setToken:", v23);
          objc_msgSend(MEMORY[0x24BE0B6A0], "sharedInstance");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "deferEventsMatchingPredicate:toTarget:withReason:", v21, v24, CFSTR("launching Siri.app"));
          v27 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
          predicateInvalidationHandler = self->_predicateInvalidationHandler;
          self->_predicateInvalidationHandler = v27;

          v29 = *MEMORY[0x24BE08FB0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
          {
            v31 = 136315138;
            v32 = "-[AFUISceneHostingViewController _updateDeferralChainWithWindow:]";
            _os_log_impl(&dword_217514000, v29, OS_LOG_TYPE_DEFAULT, "%s #siriHID Started defering HID events to Siri.app", (uint8_t *)&v31, 0xCu);
          }

        }
      }
    }
  }
  else
  {
    v9 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      deferralMode = self->_deferralMode;
      v31 = 136315394;
      v32 = "-[AFUISceneHostingViewController _updateDeferralChainWithWindow:]";
      v33 = 2048;
      *(_QWORD *)v34 = deferralMode;
      v6 = "%s #siriHID _shouldDeferHIDEventsForMode returned false for current deferral mode: %zd";
      v7 = v9;
      v8 = 22;
      goto LABEL_7;
    }
  }

}

- (id)sceneConfigurationForDelegate
{
  return self->_configuration;
}

- (void)sceneController:(id)a3 sceneContentStateDidChange:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  -[AFUISceneHostingViewController presentation](self, "presentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[AFUISceneHostingViewController presentation](self, "presentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "presentationView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFUISceneHostingViewController _transitionContentsWithView:forContentState:](self, "_transitionContentsWithView:forContentState:", v7, objc_msgSend(v9, "contentState"));

  }
  if (objc_msgSend(v9, "contentState") == 2 && objc_msgSend(v9, "isValid"))
  {
    objc_msgSend(v9, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFUISceneHostingViewController _handleSceneDidActivateWithIdentifier:](self, "_handleSceneDidActivateWithIdentifier:", v8);

  }
}

- (void)sceneController:(id)a3 sceneWasInvalidated:(id)a4 forReason:(unint64_t)a5
{
  id v7;
  NSObject *v8;
  void *v9;
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[AFUISceneHostingViewController sceneController:sceneWasInvalidated:forReason:]";
    _os_log_impl(&dword_217514000, v8, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  -[AFUISceneHostingViewController _updateDeferralChainWithWindow:](self, "_updateDeferralChainWithWindow:", 0);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Scene was invalidated - scene=%@"), v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFUISceneHostingViewController _handleInvalidationForReason:explanation:](self, "_handleInvalidationForReason:explanation:", a5, v9);

}

- (void)sceneController:(id)a3 sceneDidUpdateClientSettings:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315138;
    v11 = "-[AFUISceneHostingViewController sceneController:sceneDidUpdateClientSettings:]";
    _os_log_impl(&dword_217514000, v6, OS_LOG_TYPE_DEFAULT, "%s #siriHID sceneDidUpdateClientSettings", (uint8_t *)&v10, 0xCu);
  }
  -[AFUISceneHostingViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "window");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFUISceneHostingViewController _updateDeferralChainWithWindow:](self, "_updateDeferralChainWithWindow:", v8);

  objc_msgSend(v5, "audioCategoriesDisablingVolumeHUD");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFUISceneHostingViewController _audioCategoriesDisablingVolumeHUDDidChangeTo:](self, "_audioCategoriesDisablingVolumeHUDDidChangeTo:", v9);

}

- (BOOL)_hasScene
{
  return self->_scene != 0;
}

- (int64_t)deferralMode
{
  return self->_deferralMode;
}

- (AFUISceneConfiguration)configuration
{
  return self->_configuration;
}

- (BOOL)isInFluidDismissal
{
  return self->_inFluidDismissal;
}

- (BOOL)clippingDisabled
{
  return self->_clippingDisabled;
}

- (AFUISceneController)sceneController
{
  return self->_sceneController;
}

- (void)setSceneController:(id)a3
{
  objc_storeStrong((id *)&self->_sceneController, a3);
}

- (UIView)windowSceneHostingView
{
  return self->_windowSceneHostingView;
}

- (UIScenePresenter)presentation
{
  return self->_presentation;
}

- (void)setPresentation:(id)a3
{
  objc_storeStrong((id *)&self->_presentation, a3);
}

- (FBScene)scene
{
  return self->_scene;
}

- (void)setScene:(id)a3
{
  objc_storeStrong((id *)&self->_scene, a3);
}

- (BSInvalidatable)predicateInvalidationHandler
{
  return self->_predicateInvalidationHandler;
}

- (void)setPredicateInvalidationHandler:(id)a3
{
  objc_storeStrong((id *)&self->_predicateInvalidationHandler, a3);
}

- (BOOL)pauseDeferrals
{
  return self->_pauseDeferrals;
}

- (void)setPauseDeferrals:(BOOL)a3
{
  self->_pauseDeferrals = a3;
}

- (int64_t)currentOrientation
{
  return self->_currentOrientation;
}

- (void)setCurrentOrientation:(int64_t)a3
{
  self->_currentOrientation = a3;
}

- (CGRect)currentFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_currentFrame.origin.x;
  y = self->_currentFrame.origin.y;
  width = self->_currentFrame.size.width;
  height = self->_currentFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setCurrentFrame:(CGRect)a3
{
  self->_currentFrame = a3;
}

- (BOOL)safeAreaInsetsAreSuspended
{
  return self->_safeAreaInsetsAreSuspended;
}

- (void)setEffectiveSafeAreaInsets:(UIEdgeInsets)a3
{
  self->_effectiveSafeAreaInsets = a3;
}

- (UIEdgeInsets)suspendedSafeAreaInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_suspendedSafeAreaInsets.top;
  left = self->_suspendedSafeAreaInsets.left;
  bottom = self->_suspendedSafeAreaInsets.bottom;
  right = self->_suspendedSafeAreaInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setSuspendedSafeAreaInsets:(UIEdgeInsets)a3
{
  self->_suspendedSafeAreaInsets = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predicateInvalidationHandler, 0);
  objc_storeStrong((id *)&self->_scene, 0);
  objc_storeStrong((id *)&self->_presentation, 0);
  objc_storeStrong((id *)&self->_windowSceneHostingView, 0);
  objc_storeStrong((id *)&self->_sceneController, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

void __82__AFUISceneHostingViewController__updateSceneUIApplicationSceneSettingsWithBlock___block_invoke_cold_1(void *a1)
{
  NSObject *v1;
  id v2;
  int v3;
  const char *v4;
  __int16 v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v3 = 136315394;
  v4 = "-[AFUISceneHostingViewController _updateSceneUIApplicationSceneSettingsWithBlock:]_block_invoke";
  v5 = 2112;
  v6 = (id)objc_opt_class();
  v2 = v6;
  _os_log_error_impl(&dword_217514000, v1, OS_LOG_TYPE_ERROR, "%s #sceneHosting Expected scene's settings to be UIMutableApplicationSceneSettings, but they weren't {actualClass: %@}", (uint8_t *)&v3, 0x16u);

}

@end
