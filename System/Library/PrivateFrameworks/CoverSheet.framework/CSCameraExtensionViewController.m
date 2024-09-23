@implementation CSCameraExtensionViewController

- (CSCameraExtensionViewController)initWithCaptureApplication:(id)a3
{
  id v5;
  CSCameraExtensionViewController *v6;
  CSCameraExtensionViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CSCameraExtensionViewController;
  v6 = -[CSCameraExtensionViewController init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_captureApplication, a3);

  return v7;
}

- (void)dealloc
{
  SESecureCaptureSceneViewController *hostViewController;
  objc_super v4;

  -[SESecureCaptureSceneViewController invalidate](self->_hostViewController, "invalidate");
  hostViewController = self->_hostViewController;
  self->_hostViewController = 0;

  v4.receiver = self;
  v4.super_class = (Class)CSCameraExtensionViewController;
  -[CSCoverSheetViewControllerBase dealloc](&v4, sel_dealloc);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CSCameraExtensionViewController;
  -[CSCoverSheetViewControllerBase viewWillLayoutSubviews](&v13, sel_viewWillLayoutSubviews);
  -[CSCameraExtensionViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[SESecureCaptureSceneViewController view](self->_hostViewController, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CSCameraExtensionViewController;
  -[CSCoverSheetViewControllerBase viewDidLoad](&v5, sel_viewDidLoad);
  -[CSCameraExtensionViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CSCameraExtensionViewController;
  -[CSCoverSheetViewControllerBase viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  if (!self->_hostViewController)
    -[CSCameraExtensionViewController _createHostViewController](self, "_createHostViewController");
  -[CSCameraExtensionViewController _applyHostableEntityContentMode](self, "_applyHostableEntityContentMode");
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CSCameraExtensionViewController;
  -[CSCoverSheetViewControllerBase viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[CSCameraExtensionViewController _applyHostableEntityContentMode](self, "_applyHostableEntityContentMode");
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __79__CSCameraExtensionViewController_viewDidMoveToWindow_shouldAppearOrDisappear___block_invoke;
  v7[3] = &unk_1E8E2DB10;
  v8 = v5;
  v6 = v5;
  -[CSCoverSheetViewControllerBase updateDisplayLayoutElementWithBuilder:](self, "updateDisplayLayoutElementWithBuilder:", v7);

}

void __79__CSCameraExtensionViewController_viewDidMoveToWindow_shouldAppearOrDisappear___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  double v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v2, "level");
  objc_msgSend(v4, "setLevel:", (uint64_t)v3);

}

- (void)secureCaptureSceneViewController:(id)a3 didSetIdleTimerDisabled:(BOOL)a4
{
  id v5;

  +[CSAction actionWithType:](CSAction, "actionWithType:", 3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CSCoverSheetViewControllerBase sendAction:](self, "sendAction:", v5);

}

- (void)secureCaptureSceneViewController:(id)a3 requestsLaunchWithAction:(id)a4 completion:(id)a5
{
  CSCameraExtensionViewControllerDelegate **p_delegate;
  id v8;
  id v9;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v8 = a5;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "cameraExtensionViewController:requestsLaunchWithAction:completion:", self, v9, v8);

}

- (void)secureCaptureSceneViewController:(id)a3 requestsLaunchAfterTransitionCompletionWithAction:(id)a4 completion:(id)a5
{
  CSCameraExtensionViewControllerDelegate **p_delegate;
  id v8;
  id v9;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v8 = a5;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "cameraExtensionViewController:requestsLaunchAfterTransitionCompletionWithAction:completion:", self, v9, v8);

}

- (void)secureCaptureSceneViewController:(id)a3 didCreateScene:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[CSCameraExtensionViewController delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cameraExtensionViewController:didCreateScene:", self, v5);

}

- (void)secureCaptureSceneViewController:(id)a3 didDestroyScene:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[CSCameraExtensionViewController delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cameraExtensionViewController:didDestroyScene:", self, v5);

}

- (void)invalidate
{
  SESecureCaptureSceneViewController *hostViewController;

  -[SESecureCaptureSceneViewController invalidate](self->_hostViewController, "invalidate");
  -[CSCameraExtensionViewController bs_removeChildViewController:](self, "bs_removeChildViewController:", self->_hostViewController);
  hostViewController = self->_hostViewController;
  self->_hostViewController = 0;

}

- (id)_newDisplayLayoutElement
{
  void *v2;
  void *v3;
  void *v4;

  -[LCSCaptureApplicationDescribing extension](self->_captureApplication, "extension");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAAE30]), "initWithIdentifier:", v3);
    objc_msgSend(v4, "setFillsDisplayBounds:", 1);
    objc_msgSend(v4, "setLayoutRole:", 6);
    objc_msgSend(v4, "setBundleIdentifier:", v3);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_updateDisplayLayoutElementForActivation:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CSCameraExtensionViewController;
  v4 = a3;
  -[CSCoverSheetViewControllerBase _updateDisplayLayoutElementForActivation:](&v5, sel__updateDisplayLayoutElementForActivation_, v4);
  objc_msgSend(v4, "sb_setTransitioning:", (-[CSCameraExtensionViewController _appearState](self, "_appearState", v5.receiver, v5.super_class) & 0xFFFFFFFD) == 1);

}

- (void)dismiss
{
  id WeakRetained;
  void *v4;
  objc_super v5;
  _QWORD v6[4];
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_modalPresenter);
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __42__CSCameraExtensionViewController_dismiss__block_invoke;
    v6[3] = &unk_1E8E2DB38;
    v7 = WeakRetained;
    objc_msgSend(v7, "dismissContentViewController:animated:completion:", self, 1, v6);

  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)CSCameraExtensionViewController;
    -[CSCoverSheetViewControllerBase dismiss](&v5, sel_dismiss);
  }

}

uint64_t __42__CSCameraExtensionViewController_dismiss__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismiss");
}

- (void)aggregateAppearance:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)CSCameraExtensionViewController;
  v3 = a3;
  -[CSCoverSheetViewControllerBase aggregateAppearance:](&v17, sel_aggregateAppearance_, v3);
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "priority:", 40, v17.receiver, v17.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fakeStatusBar:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fakeStatusBarLevel:", &unk_1E8E8A210);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addComponent:", v7);

  +[CSComponent homeAffordance](CSComponent, "homeAffordance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "priority:", 40);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hidden:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addComponent:", v10);

  v11 = (void *)objc_opt_new();
  objc_msgSend(v11, "priority:", 40);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "hidden:", 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addComponent:", v13);

  +[CSComponent dateView](CSComponent, "dateView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "priority:", 40);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "hidden:", 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addComponent:", v16);

}

- (void)aggregateBehavior:(id)a3
{
  id v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CSCameraExtensionViewController;
  v4 = a3;
  -[CSCoverSheetViewControllerBase aggregateBehavior:](&v9, sel_aggregateBehavior_, v4);
  v5 = -[SESecureCaptureSceneViewController requestsIdleTimerDisabled](self->_hostViewController, "requestsIdleTimerDisabled", v9.receiver, v9.super_class);
  if (v5)
    v6 = 3;
  else
    v6 = 1;
  if (v5)
    v7 = 14;
  else
    v7 = 13;
  if (v5)
    v8 = 1;
  else
    v8 = 2;
  objc_msgSend(v4, "setIdleTimerMode:", v6);
  objc_msgSend(v4, "setIdleTimerDuration:", v7);
  objc_msgSend(v4, "setIdleWarnMode:", v8);

}

- (BOOL)handleEvent:(id)a3
{
  id v4;
  char v5;
  uint64_t v6;
  CSCameraExtensionViewController *v7;
  uint64_t v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CSCameraExtensionViewController;
  if (!-[CSCoverSheetViewControllerBase handleEvent:](&v10, sel_handleEvent_, v4)
    || (objc_msgSend(v4, "isConsumable") & 1) == 0)
  {
    v6 = objc_msgSend(v4, "type");
    if (v6 == 10)
    {
      v7 = self;
      v8 = 3;
    }
    else
    {
      if (v6 != 11)
      {
        if (v6 == 25)
          -[CSCameraExtensionViewController dismiss](self, "dismiss");
        goto LABEL_11;
      }
      v7 = self;
      v8 = 2;
    }
    -[CSCameraExtensionViewController setHostableEntityContentMode:](v7, "setHostableEntityContentMode:", v8);
LABEL_11:
    v5 = 0;
    goto LABEL_12;
  }
  v5 = objc_msgSend(v4, "isConsumable");
LABEL_12:

  return v5;
}

- (void)setHostableEntityContentMode:(int64_t)a3
{
  if (self->_hostableEntityContentMode != a3)
  {
    self->_hostableEntityContentMode = a3;
    -[CSCameraExtensionViewController _applyHostableEntityContentMode](self, "_applyHostableEntityContentMode");
  }
}

- (void)setActionsToDeliverToHostableEntity:(id)a3
{
  NSSet *v4;
  NSSet *actionsToDeliverToHostableEntity;
  id v6;

  v6 = a3;
  if ((BSEqualSets() & 1) == 0)
  {
    -[CSCameraExtensionViewController bs_removeChildViewController:](self, "bs_removeChildViewController:", self->_hostViewController);
    -[SESecureCaptureSceneViewController invalidate](self->_hostViewController, "invalidate");
    v4 = (NSSet *)objc_msgSend(v6, "copy");
    actionsToDeliverToHostableEntity = self->_actionsToDeliverToHostableEntity;
    self->_actionsToDeliverToHostableEntity = v4;

    if (!-[CSCoverSheetViewControllerBase isDisappeared](self, "isDisappeared"))
      -[CSCameraExtensionViewController _createHostViewController](self, "_createHostViewController");
  }

}

- (FBScene)sceneForTraitsParticipant
{
  return (FBScene *)-[SESecureCaptureSceneViewController _scene](self->_hostViewController, "_scene");
}

- (int64_t)hostableEntityOrientation
{
  return -[SESecureCaptureSceneViewController interfaceOrientation](self->_hostViewController, "interfaceOrientation");
}

- (int64_t)_effectiveContentMode
{
  _BOOL4 v3;
  int64_t hostableEntityContentMode;

  v3 = -[CSCoverSheetViewControllerBase isDisappeared](self, "isDisappeared");
  if (self->_hostableEntityContentMode <= 1)
    hostableEntityContentMode = 1;
  else
    hostableEntityContentMode = self->_hostableEntityContentMode;
  if (v3)
    return hostableEntityContentMode;
  else
    return self->_hostableEntityContentMode;
}

- (void)_applyHostableEntityContentMode
{
  int64_t v3;
  uint64_t v4;
  void *v5;
  id WeakRetained;

  v3 = -[CSCameraExtensionViewController _effectiveContentMode](self, "_effectiveContentMode");
  if (v3 == 2)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "cameraExtensionViewControllerWillPresent:", self);
    -[SESecureCaptureSceneViewController setPresentationMode:](self->_hostViewController, "setPresentationMode:", 1);
    if (!-[CSCameraExtensionViewController isLayoutElementSet](self, "isLayoutElementSet"))
    {
      -[CSCoverSheetViewControllerBase _setDisplayLayoutElementActive:immediately:](self, "_setDisplayLayoutElementActive:immediately:", 1, 1);
      self->_layoutElementSet = 1;
    }
    if (self->_hostViewController
      && !-[CSCameraExtensionViewController isLaunchMonitoringRequested](self, "isLaunchMonitoringRequested")
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      -[SESecureCaptureSceneViewController _scene](self->_hostViewController, "_scene");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "cameraExtensionViewController:requestsLaunchMonitoringForScene:", self, v5);

      self->_launchMonitoringRequested = 1;
    }
  }
  else
  {
    if (v3 == 3)
      v4 = 2;
    else
      v4 = 0;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    -[SESecureCaptureSceneViewController setPresentationMode:](self->_hostViewController, "setPresentationMode:", v4);
  }

}

- (id)_launchActions
{
  NSSet *actionsToDeliverToHostableEntity;
  void *v4;
  void *v5;
  void *v6;

  actionsToDeliverToHostableEntity = self->_actionsToDeliverToHostableEntity;
  v4 = actionsToDeliverToHostableEntity;
  if (!actionsToDeliverToHostableEntity)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[LCSCaptureApplicationDescribing launchActions](self->_captureApplication, "launchActions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setByAddingObjectsFromSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!actionsToDeliverToHostableEntity)
  return v6;
}

- (void)_createHostViewController
{
  id v3;
  void *v4;
  void *v5;
  SESecureCaptureSceneViewController *v6;
  SESecureCaptureSceneViewController *hostViewController;
  NSSet *actionsToDeliverToHostableEntity;

  v3 = objc_alloc(MEMORY[0x1E0D8C920]);
  -[LCSCaptureApplicationDescribing extension](self->_captureApplication, "extension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSCameraExtensionViewController _launchActions](self, "_launchActions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (SESecureCaptureSceneViewController *)objc_msgSend(v3, "initWithProvider:launchActions:", v4, v5);
  hostViewController = self->_hostViewController;
  self->_hostViewController = v6;

  actionsToDeliverToHostableEntity = self->_actionsToDeliverToHostableEntity;
  self->_actionsToDeliverToHostableEntity = 0;

  -[SESecureCaptureSceneViewController setDelegate:](self->_hostViewController, "setDelegate:", self);
  -[CSCameraExtensionViewController bs_addChildViewController:](self, "bs_addChildViewController:", self->_hostViewController);
  -[CSCameraExtensionViewController _applyHostableEntityContentMode](self, "_applyHostableEntityContentMode");
}

- (void)prepareForApplicationLaunchTransition
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  SBLogDashBoard();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[LCSCaptureApplicationDescribing bundleIdentifier](self->_captureApplication, "bundleIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_1D0337000, v3, OS_LOG_TYPE_DEFAULT, "Prepare for application launch transition to %@", (uint8_t *)&v5, 0xCu);

  }
  -[CSCameraExtensionViewController setHostableEntityContentMode:](self, "setHostableEntityContentMode:", 3);
}

- (void)applicationLaunchTransitionDidCompleteWithError:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogDashBoard();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[CSCameraExtensionViewController applicationLaunchTransitionDidCompleteWithError:].cold.1((uint64_t)self, v4, v6);

    -[CSCameraExtensionViewController setHostableEntityContentMode:](self, "setHostableEntityContentMode:", 2);
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      -[LCSCaptureApplicationDescribing bundleIdentifier](self->_captureApplication, "bundleIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412290;
      v9 = v7;
      _os_log_impl(&dword_1D0337000, v6, OS_LOG_TYPE_DEFAULT, "Capture application launch transition to %@ completed successfully", (uint8_t *)&v8, 0xCu);

    }
  }

}

- (CSHostableEntityPresenterDelegate)entityPresenterDelegate
{
  return (CSHostableEntityPresenterDelegate *)objc_loadWeakRetained((id *)&self->_entityPresenterDelegate);
}

- (void)setEntityPresenterDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_entityPresenterDelegate, a3);
}

- (int64_t)hostableEntityContentMode
{
  return self->_hostableEntityContentMode;
}

- (NSSet)actionsToDeliverToHostableEntity
{
  return self->_actionsToDeliverToHostableEntity;
}

- (LCSCaptureApplicationDescribing)captureApplication
{
  return self->_captureApplication;
}

- (void)setCaptureApplication:(id)a3
{
  objc_storeStrong((id *)&self->_captureApplication, a3);
}

- (CSCameraExtensionViewControllerDelegate)delegate
{
  return (CSCameraExtensionViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CSDismissableModalViewController)modalPresenter
{
  return (CSDismissableModalViewController *)objc_loadWeakRetained((id *)&self->_modalPresenter);
}

- (void)setModalPresenter:(id)a3
{
  objc_storeWeak((id *)&self->_modalPresenter, a3);
}

- (SESecureCaptureSceneViewController)hostViewController
{
  return self->_hostViewController;
}

- (void)setHostViewController:(id)a3
{
  objc_storeStrong((id *)&self->_hostViewController, a3);
}

- (BOOL)isLaunchMonitoringRequested
{
  return self->_launchMonitoringRequested;
}

- (void)setLaunchMonitoringRequested:(BOOL)a3
{
  self->_launchMonitoringRequested = a3;
}

- (BOOL)isLayoutElementSet
{
  return self->_layoutElementSet;
}

- (void)setLayoutElementSet:(BOOL)a3
{
  self->_layoutElementSet = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostViewController, 0);
  objc_destroyWeak((id *)&self->_modalPresenter);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_captureApplication, 0);
  objc_storeStrong((id *)&self->_actionsToDeliverToHostableEntity, 0);
  objc_destroyWeak((id *)&self->_entityPresenterDelegate);
}

- (void)applicationLaunchTransitionDidCompleteWithError:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 1072), "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "debugDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v5;
  v9 = 2112;
  v10 = v6;
  _os_log_error_impl(&dword_1D0337000, a3, OS_LOG_TYPE_ERROR, "Capture application launch transition to %@ completed with error: %@", (uint8_t *)&v7, 0x16u);

}

@end
