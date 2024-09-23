@implementation CKBrowserViewController

- (void)_updateContentOverlayInsetsForSelfAndChildren
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CKBrowserViewController;
  -[CKBrowserViewController _updateContentOverlayInsetsForSelfAndChildren](&v2, sel__updateContentOverlayInsetsForSelfAndChildren);
}

- (CKBrowserViewController)initWithBalloonPlugin:(id)a3 dataSource:(id)a4 pluginPayloads:(id)a5
{
  id v9;
  id v10;
  id v11;
  CKBrowserViewController *v12;
  CKBrowserViewController *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  _QWORD v19[4];
  id v20;
  id location;
  objc_super v22;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)CKBrowserViewController;
  v12 = -[CKBrowserViewController init](&v22, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_balloonPlugin, a3);
    objc_storeStrong((id *)&v13->_balloonPluginDataSource, a4);
    v13->_isPrimaryViewController = 1;
    location = 0;
    objc_initWeak(&location, v13);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *MEMORY[0x1E0D35540];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __75__CKBrowserViewController_initWithBalloonPlugin_dataSource_pluginPayloads___block_invoke;
    v19[3] = &unk_1E2755FF0;
    objc_copyWeak(&v20, &location);
    v17 = (id)objc_msgSend(v14, "addObserverForName:object:queue:usingBlock:", v16, 0, v15, v19);

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

  return v13;
}

void __75__CKBrowserViewController_initWithBalloonPlugin_dataSource_pluginPayloads___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "tearDownRemoteViewIfNeeded");

}

- (CKBrowserViewController)initWithBalloonPlugin:(id)a3 pluginPayloads:(id)a4
{
  return -[CKBrowserViewController initWithBalloonPlugin:dataSource:pluginPayloads:](self, "initWithBalloonPlugin:dataSource:pluginPayloads:", a3, 0, a4);
}

- (CKBrowserViewController)initWithBalloonPlugin:(id)a3 dataSource:(id)a4
{
  return -[CKBrowserViewController initWithBalloonPlugin:dataSource:pluginPayloads:](self, "initWithBalloonPlugin:dataSource:pluginPayloads:", a3, a4, 0);
}

- (CKBrowserViewController)initWithBalloonPlugin:(id)a3
{
  return -[CKBrowserViewController initWithBalloonPlugin:dataSource:pluginPayloads:](self, "initWithBalloonPlugin:dataSource:pluginPayloads:", a3, 0, 0);
}

+ (BOOL)supportsMessagesAppExtendedLaunchTest
{
  return 0;
}

+ (id)currentPPTTestName
{
  return (id)__CurrentTestName;
}

- (void)tearDownRemoteViewIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  id v8;
  id v9;

  -[CKBrowserViewController balloonPlugin](self, "balloonPlugin");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v9;
  if (v9)
  {
    IMSharedDowntimeController();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "allowedToShowAppExtensionWithBundleIdentifier:", v9);

    v5 = v9;
    if ((v7 & 1) == 0)
    {
      if (_IMWillLog())
      {
        v8 = v9;
        _IMAlwaysLog();
      }
      -[CKBrowserViewController forceTearDownRemoteView](self, "forceTearDownRemoteView", v8);
      v5 = v9;
    }
  }

}

- (void)finishedPPTTestNamed:(id)a3
{
  -[CKBrowserViewController finishedPPTTestNamed:isCKLaunchTest:](self, "finishedPPTTestNamed:isCKLaunchTest:", a3, 0);
}

- (void)startPPTTestNamed:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0CEA2F8];
  v4 = a3;
  objc_msgSend(v3, "sharedApplication");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startedTest:", v4);

}

- (void)finishedPPTTestNamed:(id)a3 isCKLaunchTest:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  int v14;
  id v15;

  v4 = a4;
  v15 = a3;
  objc_msgSend((id)objc_opt_class(), "currentPPTTestName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (v7)
  {
    -[CKBrowserViewController balloonPlugin](self, "balloonPlugin");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v9, "containsString:", *MEMORY[0x1E0D375D0]) & 1) != 0)
    {
LABEL_11:

      goto LABEL_12;
    }
    objc_msgSend((id)objc_opt_class(), "currentPPTTestName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "rangeOfString:", CFSTR("ExtensionLaunch")) == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      v13 = v15;
    }
    else
    {
      v14 = objc_msgSend((id)objc_opt_class(), "supportsMessagesAppExtendedLaunchTest");
      objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v14 && v4)
      {
        objc_msgSend(v11, "finishedSubTest:forTest:", CFSTR("PluginLaunchSubtest"), v10);
LABEL_10:

        goto LABEL_11;
      }
      v13 = v10;
    }
    objc_msgSend(v11, "finishedTest:waitForCommit:extraResults:withTeardownBlock:", v13, 1, 0, 0);
    goto LABEL_10;
  }
LABEL_12:

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKBrowserViewController;
  -[CKBrowserViewController viewWillAppear:](&v3, sel_viewWillAppear_, a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKBrowserViewController;
  -[CKBrowserViewController viewWillDisappear:](&v8, sel_viewWillDisappear_, a3);
  -[CKBrowserViewController balloonPlugin](self, "balloonPlugin");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D37588]);

  if (v6)
  {
    -[CKBrowserViewController sendDelegate](self, "sendDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setLocalUserIsTyping:", 0);

  }
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKBrowserViewController;
  -[CKBrowserViewController viewDidAppear:](&v8, sel_viewDidAppear_, a3);
  -[CKBrowserViewController balloonPlugin](self, "balloonPlugin");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D37588]);

  if (v6)
  {
    -[CKBrowserViewController sendDelegate](self, "sendDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setLocalUserIsTyping:", 1);

  }
  -[CKBrowserViewController finishedPPTTestNamed:isCKLaunchTest:](self, "finishedPPTTestNamed:isCKLaunchTest:", CFSTR("ExtensionLaunch"), 1);
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKBrowserViewController;
  -[CKBrowserViewController viewDidDisappear:](&v3, sel_viewDidDisappear_, a3);
}

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id WeakRetained;
  void *v9;
  CKBrowserDragManager *v10;
  id v11;
  CKBrowserDragManager *v12;
  CKBrowserDragManager *browserDragManager;
  CKBrowserDragManager *v14;
  void *v15;
  void *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)CKBrowserViewController;
  -[CKBrowserViewController loadView](&v17, sel_loadView);
  -[CKBrowserViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setOpaque:", 0);

  -[CKBrowserViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "theme");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "browserBackgroundColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v7);

  if (-[CKBrowserViewController conformsToProtocol:](self, "conformsToProtocol:", &unk_1EE255098))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_dragTargetView);

    if (!WeakRetained)
    {
      -[CKBrowserViewController view](self, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeWeak((id *)&self->_dragTargetView, v9);

    }
    v10 = [CKBrowserDragManager alloc];
    v11 = objc_loadWeakRetained((id *)&self->_dragTargetView);
    v12 = -[CKBrowserDragManager initWithTargetView:](v10, "initWithTargetView:", v11);
    browserDragManager = self->_browserDragManager;
    self->_browserDragManager = v12;

    -[CKBrowserDragManager setDelegate:](self->_browserDragManager, "setDelegate:", self);
    v14 = self->_browserDragManager;
    -[CKBrowserViewController sendDelegate](self, "sendDelegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "dragControllerTranscriptDelegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBrowserDragManager setTranscriptDelegate:](v14, "setTranscriptDelegate:", v16);

  }
}

- (void)setDragTargetView:(id)a3
{
  id WeakRetained;
  void *v5;
  int v6;
  CKBrowserDragManager *v7;
  id v8;
  CKBrowserDragManager *v9;
  CKBrowserDragManager *browserDragManager;
  CKBrowserDragManager *v11;
  void *v12;
  void *v13;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dragTargetView);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_dragTargetView, obj);
    v6 = -[CKBrowserViewController conformsToProtocol:](self, "conformsToProtocol:", &unk_1EE255098);
    v5 = obj;
    if (v6)
    {
      v7 = [CKBrowserDragManager alloc];
      v8 = objc_loadWeakRetained((id *)&self->_dragTargetView);
      v9 = -[CKBrowserDragManager initWithTargetView:](v7, "initWithTargetView:", v8);
      browserDragManager = self->_browserDragManager;
      self->_browserDragManager = v9;

      -[CKBrowserDragManager setDelegate:](self->_browserDragManager, "setDelegate:", self);
      v11 = self->_browserDragManager;
      -[CKBrowserViewController sendDelegate](self, "sendDelegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "dragControllerTranscriptDelegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKBrowserDragManager setTranscriptDelegate:](v11, "setTranscriptDelegate:", v13);

      v5 = obj;
    }
  }

}

- (void)setSendDelegate:(id)a3
{
  CKBrowserDragManager *browserDragManager;
  void *v5;
  id v6;

  objc_storeWeak((id *)&self->_sendDelegate, a3);
  browserDragManager = self->_browserDragManager;
  -[CKBrowserViewController sendDelegate](self, "sendDelegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dragControllerTranscriptDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKBrowserDragManager setTranscriptDelegate:](browserDragManager, "setTranscriptDelegate:", v5);

}

- (int64_t)browserPresentationStyle
{
  if ((objc_opt_respondsToSelector() & 1) == 0)
    return 0;
  if (-[CKBrowserViewController shouldPresentModally](self, "shouldPresentModally"))
    return 2;
  return 0;
}

- (UIEdgeInsets)_edgeInsetsForChildViewController:(id)a3 insetsAreAbsolute:(BOOL *)a4
{
  double v5;
  double v6;
  double v7;
  double v8;
  int v9;
  char v10;
  void *v11;
  int v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  UIEdgeInsets result;

  if (a4)
    *a4 = 0;
  v5 = *MEMORY[0x1E0CEB4B0];
  v6 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
  v8 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
  v7 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
  v9 = CKIsRunningInMacCatalyst();
  v10 = CKIsSendMenuEnabled();
  -[CKBrowserViewController balloonPlugin](self, "balloonPlugin");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "shouldHideAppSwitcher");

  if ((v10 & 1) == 0
    && !v9
    && ((!-[CKBrowserViewController inCompactPresentation](self, "inCompactPresentation") | v12) & 1) == 0)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "browserSwitcherExpandThreshold");
    v8 = v8 + v14;

    -[CKBrowserViewController view](self, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "safeAreaInsets");
    v17 = v16;

    if (v17 == 0.0)
    {
      -[CKBrowserViewController view](self, "view");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "window");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "safeAreaInsets");
      v8 = v8 + v20;

    }
  }
  v21 = v5;
  v22 = v6;
  v23 = v8;
  v24 = v7;
  result.right = v24;
  result.bottom = v23;
  result.left = v22;
  result.top = v21;
  return result;
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  objc_super v12;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  if (-[CKBrowserViewController browserPresentationStyle](self, "browserPresentationStyle")
    || CKIsRunningInMacCatalyst())
  {
    v12.receiver = self;
    v12.super_class = (Class)CKBrowserViewController;
    -[CKBrowserViewController presentViewController:animated:completion:](&v12, sel_presentViewController_animated_completion_, v8, v6, v9);
  }
  else
  {
    -[CKBrowserViewController presentationViewController](self, "presentationViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[CKBrowserViewController presentationViewController](self, "presentationViewController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "presentViewController:animated:completion:", v8, v6, v9);

    }
    else if (_IMWillLog())
    {
      _IMAlwaysLog();
    }
  }

}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  objc_super v9;
  objc_super v10;

  v4 = a3;
  v6 = a4;
  if (-[CKBrowserViewController browserPresentationStyle](self, "browserPresentationStyle"))
  {
    -[CKBrowserViewController dismissViewControllerAnimated:completion:](&v9, sel_dismissViewControllerAnimated_completion_, v4, v6, self, CKBrowserViewController, v10.receiver, v10.super_class);
  }
  else
  {
    -[CKBrowserViewController presentationViewController](self, "presentationViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[CKBrowserViewController presentationViewController](self, "presentationViewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "dismissViewControllerAnimated:completion:", v4, v6);

    }
    else
    {
      if (_IMWillLog())
        _IMAlwaysLog();
      -[CKBrowserViewController dismissViewControllerAnimated:completion:](&v10, sel_dismissViewControllerAnimated_completion_, v4, v6, v9.receiver, v9.super_class, self, CKBrowserViewController);
    }
  }

}

- (void)dismiss
{
  id v2;

  -[CKBrowserViewController sendDelegate](self, "sendDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startEditingPayload:", 0);

}

- (BOOL)isLoaded
{
  return 1;
}

- (BOOL)inCompactPresentation
{
  return (objc_opt_respondsToSelector() & 1) != 0
      && -[CKBrowserViewController currentBrowserConsumer](self, "currentBrowserConsumer") == 1;
}

- (BOOL)inExpandedPresentation
{
  return (objc_opt_respondsToSelector() & 1) != 0
      && -[CKBrowserViewController currentBrowserConsumer](self, "currentBrowserConsumer") == 2;
}

- (BOOL)inFullScreenModalPresentation
{
  return (objc_opt_respondsToSelector() & 1) != 0
      && -[CKBrowserViewController currentBrowserConsumer](self, "currentBrowserConsumer") == 3;
}

- (BOOL)wasExpandedPresentation
{
  return self->_previousConsumer == 2;
}

- (void)setCurrentBrowserConsumer:(int64_t)a3
{
  if (self->_currentBrowserConsumer != a3)
  {
    if ((unint64_t)(a3 - 1) <= 1)
      self->_previousConsumer = a3;
    self->_currentBrowserConsumer = a3;
  }
}

- (void)viewWillTransitionToExpandedPresentation
{
  -[CKBrowserViewController setIsTransitioningToExpandedPresentation:](self, "setIsTransitioningToExpandedPresentation:", 1);
}

- (void)viewDidTransitionToExpandedPresentation
{
  -[CKBrowserViewController setIsTransitioningToExpandedPresentation:](self, "setIsTransitioningToExpandedPresentation:", 0);
}

- (BOOL)wantsOpaqueUI
{
  return 0;
}

- (BOOL)wantsDarkUI
{
  return 0;
}

- (BOOL)isDismissing
{
  return 0;
}

- (BOOL)shouldShowChatChrome
{
  return 0;
}

- (BOOL)supportsQuickView
{
  return 0;
}

- (BOOL)shouldSuppressEntryView
{
  return 0;
}

- (BOOL)shouldDisableInsetsForGrabber
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  if (shouldDisableInsetsForGrabber_onceToken != -1)
    dispatch_once(&shouldDisableInsetsForGrabber_onceToken, &__block_literal_global_141);
  if (shouldDisableInsetsForGrabber_override)
  {
    LOBYTE(self) = 1;
  }
  else
  {
    -[CKBrowserViewController balloonPlugin](self, "balloonPlugin");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      objc_msgSend(v3, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D375D0]);

      if ((v7 & 1) != 0)
      {
        v5 = 0;
      }
      else
      {
        objc_msgSend(v3, "identifier");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    if (objc_msgSend(v5, "hasPrefix:", CFSTR("com.apple.")))
      LOBYTE(self) = -[CKBrowserViewController _BOOLForApplePlistKey:](self, "_BOOLForApplePlistKey:", CFSTR("MSMessagesOverlayAppearanceDisableInsetsForGrabber"));
    else
      LODWORD(self) = !-[CKBrowserViewController linkedBeforeDawn](self, "linkedBeforeDawn");

  }
  return (char)self;
}

uint64_t __56__CKBrowserViewController_shouldDisableInsetsForGrabber__block_invoke()
{
  uint64_t result;

  result = IMGetDomainBoolForKey();
  shouldDisableInsetsForGrabber_override = result;
  return result;
}

- (BOOL)_BOOLForApplePlistKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;

  v4 = a3;
  -[CKBrowserViewController balloonPlugin](self, "balloonPlugin");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_msgSend(v5, "proxy"), v6 = (void *)objc_claimAutoreleasedReturnValue(), v6, v6))
  {
    objc_msgSend(v5, "proxy");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForInfoDictionaryKey:ofClass:inScope:", v4, objc_opt_class(), 2);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[CKBrowserViewController balloonPlugin](self, "balloonPlugin");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "appBundle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v7 = v10;
    }
    else
    {
      -[CKBrowserViewController balloonPlugin](self, "balloonPlugin");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "pluginBundle");
      v7 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v7, "objectForInfoDictionaryKey:", v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = v13;
    else
      v14 = 0;
    v8 = v14;

  }
  if (v8)
    v15 = objc_msgSend(v8, "BOOLValue");
  else
    v15 = 0;

  return v15;
}

- (BOOL)linkedBeforeDawn
{
  void *v2;
  char v3;

  -[CKBrowserViewController balloonPlugin](self, "balloonPlugin");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "linkedBeforeSDKVersion:", CFSTR("17.0"));

  return v3;
}

- (BOOL)linkedBeforeYukon
{
  void *v2;
  char v3;

  -[CKBrowserViewController balloonPlugin](self, "balloonPlugin");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "linkedBeforeSDKVersion:", CFSTR("13.0"));

  return v3;
}

- (unint64_t)sheetDetentStyle
{
  void *v2;
  unint64_t v3;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "browserViewControllerSheetDetentStyle");

  return v3;
}

- (BOOL)mayBeKeptInViewHierarchy
{
  return 1;
}

- (CKBrowserViewControllerSendDelegate)sendDelegate
{
  return (CKBrowserViewControllerSendDelegate *)objc_loadWeakRetained((id *)&self->_sendDelegate);
}

- (IMBalloonPlugin)balloonPlugin
{
  return self->_balloonPlugin;
}

- (BOOL)isiMessage
{
  return self->_isiMessage;
}

- (void)setIsiMessage:(BOOL)a3
{
  self->_isiMessage = a3;
}

- (BOOL)isBusiness
{
  return self->_isBusiness;
}

- (void)setIsBusiness:(BOOL)a3
{
  self->_isBusiness = a3;
}

- (NSString)conversationID
{
  return self->_conversationID;
}

- (void)setConversationID:(id)a3
{
  self->_conversationID = (NSString *)a3;
}

- (IMBalloonPluginDataSource)balloonPluginDataSource
{
  return self->_balloonPluginDataSource;
}

- (void)setBalloonPluginDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_balloonPluginDataSource, a3);
}

- (UIViewController)presentationViewController
{
  return self->_presentationViewController;
}

- (void)setPresentationViewController:(id)a3
{
  objc_storeStrong((id *)&self->_presentationViewController, a3);
}

- (int64_t)currentBrowserConsumer
{
  return self->_currentBrowserConsumer;
}

- (BOOL)isPrimaryViewController
{
  return self->_isPrimaryViewController;
}

- (void)setIsPrimaryViewController:(BOOL)a3
{
  self->_isPrimaryViewController = a3;
}

- (BOOL)shouldDisableSnapshotView
{
  return self->_shouldDisableSnapshotView;
}

- (void)setShouldDisableSnapshotView:(BOOL)a3
{
  self->_shouldDisableSnapshotView = a3;
}

- (UIView)dragTargetView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_dragTargetView);
}

- (CKBrowserDragManager)browserDragManager
{
  return self->_browserDragManager;
}

- (void)setBrowserDragManager:(id)a3
{
  objc_storeStrong((id *)&self->_browserDragManager, a3);
}

- (BOOL)isTransitioningToExpandedPresentation
{
  return self->_isTransitioningToExpandedPresentation;
}

- (void)setIsTransitioningToExpandedPresentation:(BOOL)a3
{
  self->_isTransitioningToExpandedPresentation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_browserDragManager, 0);
  objc_destroyWeak((id *)&self->_dragTargetView);
  objc_storeStrong((id *)&self->_presentationViewController, 0);
  objc_storeStrong((id *)&self->_balloonPluginDataSource, 0);
  objc_storeStrong((id *)&self->_balloonPlugin, 0);
  objc_destroyWeak((id *)&self->_sendDelegate);
}

- (id)photoBrowserSendDelegate
{
  void *v3;
  int v4;
  void *v5;

  -[CKBrowserViewController sendDelegate](self, "sendDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "conformsToProtocol:", &unk_1EE263FA8);

  if (v4)
  {
    -[CKBrowserViewController sendDelegate](self, "sendDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

@end
