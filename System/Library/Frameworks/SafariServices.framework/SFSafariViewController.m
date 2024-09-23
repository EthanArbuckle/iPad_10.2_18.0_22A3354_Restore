@implementation SFSafariViewController

- (SFSafariViewController)initWithURL:(NSURL *)URL configuration:(SFSafariViewControllerConfiguration *)configuration
{
  NSURL *v6;
  SFSafariViewControllerConfiguration *v7;
  SFSafariViewController *v8;
  SFSafariViewController *v9;
  SFSafariViewController *v10;
  objc_super v12;

  v6 = URL;
  v7 = configuration;
  if ((-[NSURL safari_isHTTPFamilyURL](v6, "safari_isHTTPFamilyURL") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The specified URL has an unsupported scheme. Only HTTP and HTTPS URLs are supported."));
  v12.receiver = self;
  v12.super_class = (Class)SFSafariViewController;
  v8 = -[SFSafariViewController initWithNibName:bundle:](&v12, sel_initWithNibName_bundle_, 0, 0);
  v9 = v8;
  if (v8)
  {
    -[SFSafariViewController _setUpWithURL:configuration:]((uint64_t)v8, v6, v7);
    v10 = v9;
  }

  return v9;
}

- (void)_setUpWithURL:(void *)a3 configuration:
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  SFInteractiveDismissController *v11;
  void *v12;
  uint64_t v13;
  SFQueueingServiceViewControllerProxy *v14;
  void *v15;
  void *v16;
  id v17;
  objc_super v18;

  v6 = a2;
  if (a1)
  {
    v7 = objc_msgSend(a3, "copy");
    v8 = *(void **)(a1 + 976);
    *(_QWORD *)(a1 + 976) = v7;

    objc_storeStrong((id *)(a1 + 1240), a2);
    objc_msgSend(v6, "absoluteString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(a1 + 1000) = objc_msgSend(v9, "safari_looksLikeWillRedirectToURLStringAfterAuthentication:", 0);

    if (objc_msgSend((id)objc_opt_class(), "_eligibleForPlatformConventions"))
    {
      if (*(_BYTE *)(a1 + 1001))
        v10 = 2;
      else
        v10 = 5;
      objc_msgSend((id)a1, "setModalPresentationStyle:", v10);
    }
    else if (__UIApplicationLinkedOnOrAfter())
    {
      objc_msgSend((id)a1, "setModalPresentationStyle:", 0);
      v11 = objc_alloc_init(SFInteractiveDismissController);
      v12 = *(void **)(a1 + 1072);
      *(_QWORD *)(a1 + 1072) = v11;

      objc_msgSend(*(id *)(a1 + 1072), "setViewControllerToBeDismissed:", a1);
      v13 = *(_QWORD *)(a1 + 1072);
      v18.receiver = (id)a1;
      v18.super_class = (Class)SFSafariViewController;
      objc_msgSendSuper2(&v18, sel_setTransitioningDelegate_, v13);
      objc_msgSend(*(id *)(a1 + 1072), "setDelegate:", a1);
    }
    *(_OWORD *)(a1 + 1096) = invalidScrollViewInsets;
    *(_OWORD *)(a1 + 1112) = unk_1A3CB1288;
    *(_OWORD *)(a1 + 1128) = invalidScrollViewInsets;
    *(_OWORD *)(a1 + 1144) = unk_1A3CB1288;
    v14 = -[SFQueueingServiceViewControllerProxy initWithProtocol:]([SFQueueingServiceViewControllerProxy alloc], "initWithProtocol:", &unk_1EE756350);
    v15 = *(void **)(a1 + 1024);
    *(_QWORD *)(a1 + 1024) = v14;

    objc_msgSend(*(id *)(a1 + 1024), "setDelegate:", a1);
    if (objc_msgSend(*(id *)(a1 + 976), "_isPerformingAccountSecurityUpgrade"))
      objc_msgSend((id)a1, "setModalInPresentation:", 1);
    objc_msgSend(*(id *)(a1 + 1024), "setConfiguration:", *(_QWORD *)(a1 + 976));
    objc_msgSend(MEMORY[0x1E0DC3E88], "systemTraitsAffectingColorAppearance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (id)objc_msgSend((id)a1, "registerForTraitChanges:withTarget:action:", v16, a1, sel__notifyServiceOfUpdatedTintColors);

  }
}

- (SFSafariViewController)initWithURL:(NSURL *)URL entersReaderIfAvailable:(BOOL)entersReaderIfAvailable
{
  _BOOL8 v4;
  NSURL *v6;
  SFSafariViewController *v7;
  SFSafariViewControllerConfiguration *v8;
  SFSafariViewController *v9;
  objc_super v11;

  v4 = entersReaderIfAvailable;
  v6 = URL;
  if ((-[NSURL safari_isHTTPFamilyURL](v6, "safari_isHTTPFamilyURL") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The specified URL has an unsupported scheme. Only HTTP and HTTPS URLs are supported."));
  v11.receiver = self;
  v11.super_class = (Class)SFSafariViewController;
  v7 = -[SFSafariViewController initWithNibName:bundle:](&v11, sel_initWithNibName_bundle_, 0, 0);
  if (v7)
  {
    v8 = objc_alloc_init(SFSafariViewControllerConfiguration);
    -[SFSafariViewControllerConfiguration setEntersReaderIfAvailable:](v8, "setEntersReaderIfAvailable:", v4);
    -[SFSafariViewController _setUpWithURL:configuration:]((uint64_t)v7, v6, v8);
    v9 = v7;

  }
  return v7;
}

- (SFSafariViewController)initWithURL:(NSURL *)URL
{
  NSURL *v4;
  SFSafariViewControllerConfiguration *v5;
  SFSafariViewController *v6;

  v4 = URL;
  v5 = objc_alloc_init(SFSafariViewControllerConfiguration);
  v6 = -[SFSafariViewController initWithURL:configuration:](self, "initWithURL:configuration:", v4, v5);

  return v6;
}

- (SFSafariViewController)initWithCoder:(NSCoder *)aDecoder
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("Misuse of SFSafariViewController interface. Use -initWithURL: or -initWithURL:configuration: instead."));

  return 0;
}

- (SFSafariViewController)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("Misuse of SFSafariViewController interface. Use -initWithURL: or -initWithURL:configuration: instead."));

  return 0;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[SFSafariViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_removeBoundingPathChangeObserver:", self);

  -[SFSafariViewController removeChildViewController:](self, "removeChildViewController:", self->_remoteViewController);
  v4.receiver = self;
  v4.super_class = (Class)SFSafariViewController;
  -[SFSafariViewController dealloc](&v4, sel_dealloc);
}

- (void)_initializeViewService
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;

  if (a1 && !*(_BYTE *)(a1 + 1160))
  {
    *(_BYTE *)(a1 + 1160) = 1;
    +[_SFSafariViewControllerPrewarmingSession sharedSessionIfExists](_SFSafariViewControllerPrewarmingSession, "sharedSessionIfExists");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend((id)objc_opt_class(), "_supportsPrewarming")
      && (objc_msgSend(*(id *)(a1 + 976), "_isEphemeral") & 1) == 0
      && (objc_msgSend(v5, "remoteViewController"),
          v2 = (void *)objc_claimAutoreleasedReturnValue(),
          v2,
          v2))
    {
      objc_msgSend(v5, "remoteViewController");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFSafariViewController _didLoadRemoteViewController:](a1, v3);

      v4 = objc_msgSend(v5, "restart");
    }
    else
    {
      -[SFSafariViewController _connectToService](a1);
    }
    MEMORY[0x1A8597E9C](v4);

  }
}

- (void)_didLoadRemoteViewController:(uint64_t)a1
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  v4 = a2;
  if (a1)
  {
    objc_storeStrong((id *)(a1 + 1008), a2);
    objc_msgSend(v4, "serviceViewControllerProxy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 1024), "setTarget:", v5);

    objc_msgSend(v4, "setDelegate:", a1);
    v6 = *(void **)(a1 + 1024);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __55__SFSafariViewController__didLoadRemoteViewController___block_invoke;
    v7[3] = &unk_1E4ABFE00;
    v7[4] = a1;
    objc_msgSend(v6, "prepareForDisplayWithCompletionHandler:", v7);
  }

}

- (void)_connectToService
{
  id v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[5];

  if (a1)
  {
    v2 = (id)objc_msgSend(*(id *)(a1 + 1016), "invoke");
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __43__SFSafariViewController__connectToService__block_invoke;
    v5[3] = &unk_1E4AC3A80;
    v5[4] = a1;
    +[SFBrowserRemoteViewController requestViewControllerWithConnectionHandler:](SFBrowserRemoteViewController, "requestViewControllerWithConnectionHandler:", v5);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(void **)(a1 + 1016);
    *(_QWORD *)(a1 + 1016) = v3;

  }
}

+ (BOOL)_preventsAppearanceProxyCustomization
{
  return 1;
}

- (void)loadView
{
  SFSafariView *v3;

  v3 = objc_alloc_init(SFSafariView);
  -[SFSafariView _addBoundingPathChangeObserver:](v3, "_addBoundingPathChangeObserver:", self);
  -[SFSafariViewController setView:](self, "setView:", v3);
  if (performViewWillAppearInLoadView())
  {
    -[SFSafariViewController viewWillAppearImpl]((uint64_t)self);
    if (self)
      -[SFSafariViewController _handleURLExternallyIfApplicableBypassingVisibilityCheck:]((uint64_t)self, 0);
  }
  -[SFSafariViewController setHidesBottomBarWhenPushed:](self, "setHidesBottomBarWhenPushed:", 1);

}

- (void)viewWillAppearImpl
{
  void *v2;
  char v3;

  if (a1)
  {
    -[SFSafariViewController _determinePlatformConventions](a1);
    if (objc_msgSend(*(id *)(a1 + 968), "BOOLValue"))
    {
      if (!*(_BYTE *)(a1 + 1001))
        goto LABEL_8;
      -[SFSafariViewController _removeRemoteViewController](a1);
    }
    else if (*(_QWORD *)(a1 + 1008))
    {
      objc_msgSend((id)a1, "_addRemoteViewControllerIfNeeded");
      goto LABEL_8;
    }
    -[SFSafariViewController _addLaunchPlaceholderView](a1);
LABEL_8:
    if ((objc_msgSend(*(id *)(a1 + 968), "BOOLValue") & 1) != 0)
    {
LABEL_17:
      *(_BYTE *)(a1 + 985) = 1;
      return;
    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObserver:selector:name:object:", a1, sel__forwardNotificationToViewService_, *MEMORY[0x1E0DC4868], 0);
    objc_msgSend(v2, "addObserver:selector:name:object:", a1, sel__forwardNotificationToViewService_, *MEMORY[0x1E0DC4750], 0);
    if (((objc_msgSend((id)a1, "isBeingPresented") & 1) != 0
       || objc_msgSend((id)a1, "isMovingToParentViewController"))
      && SFViewControllerViewEmbeddedByPreviewController((void *)a1))
    {
      objc_msgSend((id)a1, "_setShowingLinkPreview:", 1);
      v3 = _SFShouldShowLinkPreviews();
    }
    else
    {
      if (!*(_QWORD *)(a1 + 1168))
      {
LABEL_16:
        -[SFSafariViewController _updateScrollViewIndicatorInsets](a1);

        goto LABEL_17;
      }
      v3 = 0;
    }
    -[SFSafariViewController _updatePreviewViewControllerWithLinkPreviewEnabled:animated:](a1, v3, 0);
    goto LABEL_16;
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SFSafariViewController;
  -[SFSafariViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  if ((performViewWillAppearInLoadView() & 1) == 0)
    -[SFSafariViewController viewWillAppearImpl]((uint64_t)self);
}

- (void)_determinePlatformConventions
{
  int v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  if (a1)
  {
    if ((objc_msgSend((id)a1, "_showingLinkPreview") & 1) != 0
      || (objc_msgSend((id)a1, "_showingLinkPreviewWithMinimalUI") & 1) != 0
      || SFViewControllerViewEmbeddedByPreviewController((void *)a1))
    {
      v2 = 0;
      *(_BYTE *)(a1 + 1001) = 0;
    }
    else
    {
      v2 = 1;
    }
    v3 = v2 & objc_msgSend((id)objc_opt_class(), "_eligibleForPlatformConventions");
    v4 = *(void **)(a1 + 968);
    if (!v4 || (objc_msgSend(v4, "BOOLValue") & 1) == 0 && ((v3 ^ 1) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = *(void **)(a1 + 968);
      *(_QWORD *)(a1 + 968) = v5;

    }
    if ((objc_msgSend(*(id *)(a1 + 968), "BOOLValue") & 1) == 0)
      -[SFSafariViewController _initializeViewService](a1);
  }
}

- (uint64_t)_removeRemoteViewController
{
  uint64_t v1;
  void *v2;

  if (result)
  {
    v1 = result;
    if (*(_BYTE *)(result + 1032))
    {
      objc_msgSend((id)result, "removeChildViewController:", *(_QWORD *)(result + 1008));
      objc_msgSend(*(id *)(v1 + 1008), "view");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "removeFromSuperview");

      result = objc_msgSend(*(id *)(v1 + 1008), "didMoveToParentViewController:", 0);
      *(_BYTE *)(v1 + 1032) = 0;
    }
  }
  return result;
}

- (void)_addLaunchPlaceholderView
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id location;

  if (a1)
  {
    v2 = *(void **)(a1 + 992);
    if (v2)
    {
      objc_msgSend(v2, "removeFromSuperview");
      v3 = *(void **)(a1 + 992);
      *(_QWORD *)(a1 + 992) = 0;

    }
    objc_msgSend((id)a1, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(*(id *)(a1 + 968), "BOOLValue") && *(_BYTE *)(a1 + 1001))
    {
      objc_initWeak(&location, (id)a1);
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "safari_localizedDisplayName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1 + 1240);
      v8 = *(unsigned __int8 *)(a1 + 1000);
      v9 = MEMORY[0x1E0C809B0];
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __51__SFSafariViewController__addLaunchPlaceholderView__block_invoke;
      v16[3] = &unk_1E4ABFF20;
      objc_copyWeak(&v17, &location);
      v14[0] = v9;
      v14[1] = 3221225472;
      v14[2] = __51__SFSafariViewController__addLaunchPlaceholderView__block_invoke_2;
      v14[3] = &unk_1E4ABFF20;
      objc_copyWeak(&v15, &location);
      +[SFSafariLaunchPlaceholderView compatibilityPlaceholderWithAppName:destinationURL:forAuthentication:dismissalHandler:openHandler:](SFSafariLaunchPlaceholderView, "compatibilityPlaceholderWithAppName:destinationURL:forAuthentication:dismissalHandler:openHandler:", v6, v7, v8, v16, v14);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = *(void **)(a1 + 992);
      *(_QWORD *)(a1 + 992) = v10;

      objc_msgSend(*(id *)(a1 + 992), "setClipsToBounds:", 1);
      if (eligibleForSlideInPresentation())
        objc_msgSend(v4, "setUserInteractionEnabled:", 1);
      objc_destroyWeak(&v15);
      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
    }
    else
    {
      +[SFSafariLaunchPlaceholderView blankPlaceholder](SFSafariLaunchPlaceholderView, "blankPlaceholder");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = *(void **)(a1 + 992);
      *(_QWORD *)(a1 + 992) = v12;

      if ((objc_msgSend((id)a1, "_showingLinkPreview") & 1) != 0
        || (objc_msgSend((id)a1, "_showingLinkPreviewWithMinimalUI") & 1) != 0
        || objc_msgSend(*(id *)(a1 + 968), "BOOLValue") && !*(_BYTE *)(a1 + 1001))
      {
        objc_msgSend(*(id *)(a1 + 992), "setHidden:", 1);
      }
    }
    objc_msgSend(*(id *)(a1 + 992), "setAutoresizingMask:", 18);
    objc_msgSend(v4, "bounds");
    objc_msgSend(*(id *)(a1 + 992), "setFrame:");
    objc_msgSend(*(id *)(a1 + 992), "updateBarTintColor:", *(_QWORD *)(a1 + 1216));
    objc_msgSend(*(id *)(a1 + 992), "updateControlTintColor:", *(_QWORD *)(a1 + 1224));
    objc_msgSend(*(id *)(a1 + 992), "updateDismissButtonStyle:", *(_QWORD *)(a1 + 1232));
    objc_msgSend(v4, "addSubview:", *(_QWORD *)(a1 + 992));

  }
}

- (uint64_t)_updatePreviewViewControllerWithLinkPreviewEnabled:(int)a3 animated:
{
  uint64_t v5;
  void *v6;
  void *v7;
  _SFURLTextPreviewViewController *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[5];

  if (result)
  {
    v5 = result;
    result = objc_msgSend((id)result, "_showingLinkPreview");
    if ((result & 1) != 0 || *(_QWORD *)(v5 + 1168))
    {
      if ((a2 & 1) != 0)
      {
        result = *(_QWORD *)(v5 + 1168);
        if (!result)
          return result;
        objc_msgSend((id)result, "removeFromParentViewController");
        objc_msgSend(*(id *)(v5 + 1168), "view");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "removeFromSuperview");

        objc_msgSend(*(id *)(v5 + 1168), "didMoveToParentViewController:", 0);
        v7 = *(void **)(v5 + 1168);
        *(_QWORD *)(v5 + 1168) = 0;

        if (*(_QWORD *)(v5 + 1008))
        {
          objc_msgSend((id)v5, "_addRemoteViewControllerIfNeeded");
          objc_msgSend(*(id *)(v5 + 1024), "loadURL:", *(_QWORD *)(v5 + 1240));
        }
        if (a3)
          goto LABEL_9;
      }
      else
      {
        -[SFSafariViewController _removeRemoteViewController](v5);
        v8 = -[_SFURLTextPreviewViewController initWithURL:]([_SFURLTextPreviewViewController alloc], "initWithURL:", *(_QWORD *)(v5 + 1240));
        v9 = *(void **)(v5 + 1168);
        *(_QWORD *)(v5 + 1168) = v8;

        objc_msgSend((id)v5, "view");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v5 + 1168), "view");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addSubview:", v11);

        objc_msgSend((id)v5, "view");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "bounds");
        v14 = v13;
        v16 = v15;
        v18 = v17;
        v20 = v19;
        objc_msgSend(*(id *)(v5 + 1168), "view");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setFrame:", v14, v16, v18, v20);

        objc_msgSend((id)v5, "addChildViewController:", *(_QWORD *)(v5 + 1168));
        objc_msgSend(*(id *)(v5 + 1168), "didMoveToParentViewController:", v5);
        objc_msgSend(*(id *)(v5 + 1168), "view");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "layoutIfNeeded");

        objc_msgSend(*(id *)(v5 + 1168), "_previewHeader");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setDelegate:", v5);

        if (a3)
        {
LABEL_9:
          v24[0] = MEMORY[0x1E0C809B0];
          v24[1] = 3221225472;
          v24[2] = __86__SFSafariViewController__updatePreviewViewControllerWithLinkPreviewEnabled_animated___block_invoke;
          v24[3] = &unk_1E4ABFE00;
          v24[4] = v5;
          return objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v24, 0.25);
        }
      }
      objc_msgSend(*(id *)(v5 + 1168), "preferredContentSize");
      return objc_msgSend((id)v5, "setPreferredContentSize:");
    }
  }
  return result;
}

- (void)_updateScrollViewIndicatorInsets
{
  double v2;
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
  double *v14;
  BOOL v17;
  BOOL v18;
  BOOL v19;
  BOOL v20;
  id v21;

  if (a1)
  {
    objc_msgSend((id)a1, "view");
    v21 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3C28], "_sf_baseInsetsForVerticalScrollIndicatorInScrollViewContainerView:", v21);
    v3 = v2;
    v5 = v4;
    v7 = v6;
    v9 = v8;
    objc_msgSend(MEMORY[0x1E0DC3C28], "_sf_baseInsetsForHorizontalScrollIndicatorInScrollViewContainerView:", v21);
    v14 = (double *)(a1 + 1096);
    v17 = v5 == *(double *)(a1 + 1104)
       && v3 == *(double *)(a1 + 1096)
       && v9 == *(double *)(a1 + 1120)
       && v7 == *(double *)(a1 + 1112);
    if (!v17
      || (v11 == *(double *)(a1 + 1136) ? (v18 = v10 == *(double *)(a1 + 1128)) : (v18 = 0),
          v18 ? (v19 = v13 == *(double *)(a1 + 1152)) : (v19 = 0),
          v19 ? (v20 = v12 == *(double *)(a1 + 1144)) : (v20 = 0),
          !v20))
    {
      *v14 = v3;
      *(double *)(a1 + 1104) = v5;
      *(double *)(a1 + 1112) = v7;
      *(double *)(a1 + 1120) = v9;
      *(double *)(a1 + 1128) = v10;
      *(double *)(a1 + 1136) = v11;
      *(double *)(a1 + 1144) = v12;
      *(double *)(a1 + 1152) = v13;
      objc_msgSend(*(id *)(a1 + 1024), "updateScrollViewIndicatorVerticalInsets:horizontalInsets:", *v14, *(double *)(a1 + 1104), *(double *)(a1 + 1112), *(double *)(a1 + 1120));
    }

  }
}

- (void)viewDidAppear:(BOOL)a3
{
  id WeakRetained;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SFSafariViewController;
  -[SFSafariViewController viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  if (self)
    -[SFSafariViewController _handleURLExternallyIfApplicableBypassingVisibilityCheck:]((uint64_t)self, 0);
  if (!self->_didHandlerURLExternally)
    -[SFSafariLaunchPlaceholderView setShowContinueButton:](self->_launchPlaceholderView, "setShowContinueButton:", 1);
  if (-[NSNumber BOOLValue](self->_adoptsPlatformConventions, "BOOLValue") && !self->_usesCompatibilityPlaceholder)
  {
    -[SFSafariViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 0, 0);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "safariViewControllerDidFinish:", self);

  }
}

- (void)_dismiss
{
  id WeakRetained;

  if (a1)
  {
    objc_msgSend(a1, "dismissViewControllerAnimated:completion:", 1, 0);
    WeakRetained = objc_loadWeakRetained(a1 + 151);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "safariViewControllerDidFinish:", a1);

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SFSafariViewController;
  -[SFSafariViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  if (((-[SFSafariViewController isBeingDismissed](self, "isBeingDismissed") & 1) != 0
     || -[SFSafariViewController isMovingFromParentViewController](self, "isMovingFromParentViewController"))&& SFViewControllerViewEmbeddedByPreviewController(self))
  {
    if (self->_textPreviewViewController)
      -[SFSafariViewController _updatePreviewViewControllerWithLinkPreviewEnabled:animated:]((uint64_t)self, 1, 0);
    -[SFSafariViewController _setShowingLinkPreview:](self, "_setShowingLinkPreview:", 0);
  }
}

- (void)setModalPresentationStyle:(int64_t)a3
{
  SFInteractiveDismissController *v5;
  SFInteractiveDismissController *interactiveDismissController;
  SFInteractiveDismissController *v7;
  objc_super v8;

  if (a3)
  {
    -[SFSafariViewController transitioningDelegate](self, "transitioningDelegate");
    v5 = (SFInteractiveDismissController *)objc_claimAutoreleasedReturnValue();
    interactiveDismissController = self->_interactiveDismissController;

    if (v5 == interactiveDismissController)
    {
      -[SFSafariViewController setTransitioningDelegate:](self, "setTransitioningDelegate:", 0);
      v7 = self->_interactiveDismissController;
      self->_interactiveDismissController = 0;

    }
  }
  -[SFServiceViewControllerProtocol setHostAppModalPresentationStyle:](self->_serviceProxy, "setHostAppModalPresentationStyle:", a3);
  v8.receiver = self;
  v8.super_class = (Class)SFSafariViewController;
  -[SFSafariViewController setModalPresentationStyle:](&v8, sel_setModalPresentationStyle_, a3);
}

- (void)setTransitioningDelegate:(id)a3
{
  SFInteractiveDismissController *interactiveDismissController;
  objc_super v5;

  if (a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)SFSafariViewController;
    -[SFSafariViewController setTransitioningDelegate:](&v5, sel_setTransitioningDelegate_);
    interactiveDismissController = self->_interactiveDismissController;
    self->_interactiveDismissController = 0;

  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[5];
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)SFSafariViewController;
  v7 = a4;
  -[SFSafariViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  self->_viewSizeIsTransitioning = 1;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __77__SFSafariViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v8[3] = &unk_1E4ABFE50;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", &__block_literal_global_44, v8);

}

void __77__SFSafariViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1088) = 0;
  -[SFSafariViewController _updateScrollViewIndicatorInsets](*(_QWORD *)(a1 + 32));
}

- (void)_notifyServiceOfUpdatedTintColors
{
  void *v3;
  void *v4;
  id v5;

  -[SFSafariViewController traitCollection](self, "traitCollection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[UIColor resolvedColorWithTraitCollection:](self->_preferredBarTintColor, "resolvedColorWithTraitCollection:", v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIColor resolvedColorWithTraitCollection:](self->_preferredControlTintColor, "resolvedColorWithTraitCollection:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFServiceViewControllerProtocol setPreferredBarTintColor:controlTintColor:](self->_serviceProxy, "setPreferredBarTintColor:controlTintColor:", v3, v4);

}

- (id)childViewControllerForHomeIndicatorAutoHidden
{
  return self->_remoteViewController;
}

- (id)childViewControllerForStatusBarStyle
{
  return self->_remoteViewController;
}

- (void)_addRemoteView
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (a1 && *(_QWORD *)(a1 + 1008) && !*(_BYTE *)(a1 + 1032))
  {
    if ((__UIApplicationLinkedOnOrAfter() & 1) == 0)
    {
      v2 = *(void **)(a1 + 1024);
      objc_msgSend((id)a1, "view");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "tintColor");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setPreferredControlTintColor:", v4);

    }
    objc_msgSend(*(id *)(a1 + 1008), "view");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 1176);
    objc_msgSend((id)a1, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v5)
      objc_msgSend(v6, "insertSubview:belowSubview:", v9, *(_QWORD *)(a1 + 1176));
    else
      objc_msgSend(v6, "addSubview:", v9);

    objc_msgSend((id)a1, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bounds");
    objc_msgSend(v9, "setFrame:");

    objc_msgSend(v9, "setAutoresizingMask:", 18);
    *(_BYTE *)(a1 + 1032) = 1;

  }
}

- (void)_setEdgeSwipeDismissalEnabled:(id *)a1
{
  id v3;
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
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD v23[5];

  v23[4] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v3 = a1[134];
    if (v3)
    {
      objc_msgSend(v3, "edgeSwipeView");
      v22 = (id)objc_claimAutoreleasedReturnValue();
      if ((a2 & 1) != 0)
      {
        if (!v22)
        {
          v22 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
          objc_msgSend(v22, "layer");
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setHitTestsAsOpaque:", 1);

          objc_msgSend(a1[134], "setEdgeSwipeView:", v22);
        }
        objc_msgSend(a1, "view");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[126], "view");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "insertSubview:aboveSubview:", v22, v7);

        objc_msgSend(v22, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        v21 = (void *)MEMORY[0x1E0CB3718];
        if (objc_msgSend(v6, "_sf_usesLeftToRightLayout"))
        {
          objc_msgSend(v22, "leftAnchor");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "leftAnchor");
        }
        else
        {
          objc_msgSend(v22, "rightAnchor");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "rightAnchor");
        }
        v19 = v8;
        objc_msgSend(v8, "constraintEqualToAnchor:", objc_claimAutoreleasedReturnValue());
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v23[0] = v20;
        objc_msgSend(v22, "topAnchor");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "topAnchor");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "constraintEqualToAnchor:constant:", v10, 64.0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v23[1] = v11;
        objc_msgSend(v22, "bottomAnchor");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "bottomAnchor");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "constraintEqualToAnchor:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v23[2] = v14;
        objc_msgSend(v22, "widthAnchor");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "constraintEqualToConstant:", 24.0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v23[3] = v16;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 4);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "activateConstraints:", v17);

      }
      else
      {
        objc_msgSend(v22, "removeFromSuperview");

      }
    }
  }
}

void __43__SFSafariViewController__connectToService__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 1016);
  *(_QWORD *)(v7 + 1016) = 0;

  if (v5)
  {
    -[SFSafariViewController _didLoadRemoteViewController:](*(_QWORD *)(a1 + 32), v5);
  }
  else
  {
    v9 = WBS_LOG_CHANNEL_PREFIXViewService();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __61___SFSafariViewControllerPrewarmingSession__connectToService__block_invoke_cold_1(v9, v6);
  }

}

- (SFServiceViewControllerProtocol)serviceProxy
{
  -[SFSafariViewController _initializeViewService]((uint64_t)self);
  return self->_serviceProxy;
}

uint64_t __55__SFSafariViewController__didLoadRemoteViewController___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addRemoteViewControllerIfNeeded");
}

- (void)_addRemoteViewControllerIfNeeded
{
  _SFURLTextPreviewViewController *textPreviewViewController;
  NSNumber *adoptsPlatformConventions;
  char v5;
  char v7;

  textPreviewViewController = self->_textPreviewViewController;
  adoptsPlatformConventions = self->_adoptsPlatformConventions;
  if (adoptsPlatformConventions)
    v5 = -[NSNumber BOOLValue](adoptsPlatformConventions, "BOOLValue");
  else
    v5 = 1;
  if (self->_remoteViewController
    && !-[SFSafariViewController defersAddingRemoteViewController](self, "defersAddingRemoteViewController"))
  {
    if (!self->_remoteViewControllerHasBeenAdded && textPreviewViewController == 0)
      v7 = v5;
    else
      v7 = 1;
    if ((v7 & 1) == 0)
    {
      -[SFSafariViewController addChildViewController:](self, "addChildViewController:", self->_remoteViewController);
      -[SFSafariViewController _addRemoteView]((uint64_t)self);
      -[SFSafariViewController _removeLaunchPlaceholderView]((uint64_t)self);
      -[SFBrowserRemoteViewController didMoveToParentViewController:](self->_remoteViewController, "didMoveToParentViewController:", self);
    }
  }
}

- (void)_removeLaunchPlaceholderView
{
  void *v2;

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 992), "removeFromSuperview");
    v2 = *(void **)(a1 + 992);
    *(_QWORD *)(a1 + 992) = 0;

  }
}

void __51__SFSafariViewController__addLaunchPlaceholderView__block_invoke(uint64_t a1)
{
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  -[SFSafariViewController _dismiss](WeakRetained);

}

void __51__SFSafariViewController__addLaunchPlaceholderView__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[SFSafariViewController _handleURLExternallyIfApplicableBypassingVisibilityCheck:]((uint64_t)WeakRetained, 1);

}

- (void)_handleURLExternallyIfApplicableBypassingVisibilityCheck:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[5];

  if (a1 && !*(_BYTE *)(a1 + 984) && objc_msgSend(*(id *)(a1 + 968), "BOOLValue"))
  {
    objc_msgSend((id)a1, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "windowScene");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      objc_msgSend((id)a1, "presentingViewController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "window");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "windowScene");
      v8 = (id)objc_claimAutoreleasedReturnValue();

    }
    if (v8)
    {
      if ((a2 & 1) != 0
        || (performViewWillAppearInLoadView() & 1) != 0
        || (eligibleForSlideInPresentation() & 1) != 0
        || SFViewControllerViewIsVisible((void *)a1, 0))
      {
        *(_BYTE *)(a1 + 984) = 1;
        v12 = *(_QWORD *)(a1 + 1240);
        v29[0] = MEMORY[0x1E0C809B0];
        v29[1] = 3221225472;
        v29[2] = __83__SFSafariViewController__handleURLExternallyIfApplicableBypassingVisibilityCheck___block_invoke;
        v29[3] = &unk_1E4AC05E0;
        v29[4] = a1;
        objc_msgSend(v8, "openURL:options:completionHandler:", v12, 0, v29);
      }
      else
      {
        v21 = WBS_LOG_CHANNEL_PREFIXViewService();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          -[SFSafariViewController _handleURLExternallyIfApplicableBypassingVisibilityCheck:].cold.2(v21, v22, v23, v24, v25, v26, v27, v28);
      }
    }
    else
    {
      v13 = WBS_LOG_CHANNEL_PREFIXViewService();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[SFSafariViewController _handleURLExternallyIfApplicableBypassingVisibilityCheck:].cold.1(v13, v14, v15, v16, v17, v18, v19, v20);
    }

  }
}

- (SFSafariViewControllerConfiguration)configuration
{
  return (SFSafariViewControllerConfiguration *)(id)-[SFSafariViewControllerConfiguration copy](self->_configuration, "copy");
}

- (void)setPreferredBarTintColor:(UIColor *)preferredBarTintColor
{
  UIColor *v5;
  UIColor *v6;
  char v7;
  void *v8;
  SFServiceViewControllerProtocol *serviceProxy;
  void *v10;
  UIColor *v11;

  v5 = preferredBarTintColor;
  v6 = self->_preferredBarTintColor;
  if (v6 != v5)
  {
    v11 = v5;
    v7 = -[UIColor isEqual:](v6, "isEqual:", v5);
    v5 = v11;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_preferredBarTintColor, preferredBarTintColor);
      v5 = v11;
      if (!self->_hasBeenDisplayedAtLeastOnce)
      {
        -[SFSafariViewController traitCollection](self, "traitCollection");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        serviceProxy = self->_serviceProxy;
        -[UIColor resolvedColorWithTraitCollection:](v11, "resolvedColorWithTraitCollection:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFServiceViewControllerProtocol setPreferredBarTintColor:](serviceProxy, "setPreferredBarTintColor:", v10);

        -[SFSafariLaunchPlaceholderView updateBarTintColor:](self->_launchPlaceholderView, "updateBarTintColor:", v11);
        v5 = v11;
      }
    }
  }

}

- (void)setPreferredControlTintColor:(UIColor *)preferredControlTintColor
{
  UIColor *v5;
  UIColor *v6;
  char v7;
  SFServiceViewControllerProtocol *serviceProxy;
  void *v9;
  void *v10;
  UIColor *v11;

  v5 = preferredControlTintColor;
  v6 = self->_preferredControlTintColor;
  if (v6 != v5)
  {
    v11 = v5;
    v7 = -[UIColor isEqual:](v6, "isEqual:", v5);
    v5 = v11;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_preferredControlTintColor, preferredControlTintColor);
      v5 = v11;
      if (!self->_hasBeenDisplayedAtLeastOnce)
      {
        serviceProxy = self->_serviceProxy;
        -[SFSafariViewController traitCollection](self, "traitCollection");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIColor resolvedColorWithTraitCollection:](v11, "resolvedColorWithTraitCollection:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFServiceViewControllerProtocol setPreferredControlTintColor:](serviceProxy, "setPreferredControlTintColor:", v10);

        v5 = v11;
      }
    }
  }

}

- (void)setDismissButtonStyle:(SFSafariViewControllerDismissButtonStyle)dismissButtonStyle
{
  if (self->_dismissButtonStyle != dismissButtonStyle)
  {
    self->_dismissButtonStyle = dismissButtonStyle;
    -[SFServiceViewControllerProtocol setDismissButtonStyle:](self->_serviceProxy, "setDismissButtonStyle:");
  }
}

+ (BOOL)_supportsPrewarming
{
  return 1;
}

+ (SFSafariViewControllerPrewarmingToken)prewarmConnectionsToURLs:(NSArray *)URLs
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = URLs;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    v7 = *MEMORY[0x1E0C99778];
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "safari_isHTTPFamilyURL") & 1) == 0)
          objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v7, CFSTR("The specified URL has an unsupported scheme. Only HTTP and HTTPS URLs are supported."));
        ++v8;
      }
      while (v5 != v8);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }
  +[_SFSafariViewControllerPrewarmingSession sharedSession](_SFSafariViewControllerPrewarmingSession, "sharedSession");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "prewarmConnectionsToURLs:", v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (SFSafariViewControllerPrewarmingToken *)v10;
}

+ (BOOL)_eligibleForPlatformConventions
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  if (!os_variant_has_internal_ui())
    return 0;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("DebugSafariViewControllerAdoptsPlatformConventions"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLForKey:", CFSTR("DebugSafariViewControllerAdoptsPlatformConventions"));

  return v5;
}

void __83__SFSafariViewController__handleURLExternallyIfApplicableBypassingVisibilityCheck___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id WeakRetained;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 1001))
  {
    WeakRetained = objc_loadWeakRetained((id *)(v2 + 1208));
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "safariViewController:didCompleteInitialLoad:", *(_QWORD *)(a1 + 32), a2);

  }
}

- (BOOL)_showingLinkPreview
{
  return self->_displayMode == 1;
}

- (void)_setShowingLinkPreview:(BOOL)a3
{
  _BOOL8 v3;

  if (self->_displayMode != a3)
  {
    v3 = a3;
    self->_displayMode = a3;
    -[SFServiceViewControllerProtocol setDisplayMode:](self->_serviceProxy, "setDisplayMode:");
    -[SFSafariLaunchPlaceholderView setHidden:](self->_launchPlaceholderView, "setHidden:", v3);
    -[SFSafariViewController _updateLinkPreviewHitTestView]((id *)&self->super.super.super.isa);
  }
}

- (void)_updateLinkPreviewHitTestView
{
  int v2;
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;

  if (a1)
  {
    v2 = objc_msgSend(a1, "_showingLinkPreview");
    v3 = a1[147];
    if (v2)
    {
      if (!v3)
      {
        v4 = objc_alloc(MEMORY[0x1E0DC3F10]);
        objc_msgSend(a1, "view");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "bounds");
        UIRectInset();
        v6 = objc_msgSend(v4, "initWithFrame:");
        v7 = a1[147];
        a1[147] = (id)v6;

        objc_msgSend(a1[147], "layer");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setHitTestsAsOpaque:", 1);

        objc_msgSend(a1, "view");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addSubview:", a1[147]);

      }
    }
    else if (v3)
    {
      objc_msgSend(v3, "removeFromSuperview");
      v9 = a1[147];
      a1[147] = 0;

    }
  }
}

- (BOOL)_showingLinkPreviewWithMinimalUI
{
  return self->_displayMode == 4;
}

- (void)_setShowingLinkPreviewWithMinimalUI:(BOOL)a3
{
  _BOOL8 v3;
  int64_t v4;

  v3 = a3;
  if (a3)
    v4 = 4;
  else
    v4 = 0;
  if (self->_displayMode != v4)
  {
    self->_displayMode = v4;
    -[SFServiceViewControllerProtocol setDisplayMode:](self->_serviceProxy, "setDisplayMode:");
    -[SFSafariLaunchPlaceholderView setHidden:](self->_launchPlaceholderView, "setHidden:", v3);
  }
}

- (BOOL)_allowsUserInteractionWhenPreviewedInContextMenu
{
  return 1;
}

uint64_t __86__SFSafariViewController__updatePreviewViewControllerWithLinkPreviewEnabled_animated___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1168), "preferredContentSize");
  return objc_msgSend(*(id *)(a1 + 32), "setPreferredContentSize:");
}

- (id)previewActionItems
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSArray *obj;
  _QWORD v15[6];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (-[NSArray count](self->_previewActions, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    obj = self->_previewActions;
    v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v17 != v6)
            objc_enumerationMutation(obj);
          v8 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          v9 = (void *)MEMORY[0x1E0DC3B68];
          objc_msgSend(v8, "title");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v15[0] = MEMORY[0x1E0C809B0];
          v15[1] = 3221225472;
          v15[2] = __44__SFSafariViewController_previewActionItems__block_invoke;
          v15[3] = &unk_1E4AC5628;
          v15[4] = v8;
          v15[5] = self;
          objc_msgSend(v9, "actionWithTitle:style:handler:", v10, 0, v15);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(MEMORY[0x1E0CEF6B0], "imageForElementActionType:", objc_msgSend(v8, "type"));
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "setImage:", v12);

          }
          objc_msgSend(v3, "addObject:", v11);

        }
        v5 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v5);
    }

  }
  else
  {
    -[SFSafariViewController _defaultPreviewActionItems]((uint64_t)self);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)_defaultPreviewActionItems
{
  void *v2;
  void *v3;
  uint64_t v4;
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
  _QWORD v17[5];
  _QWORD v18[5];
  _QWORD v19[5];
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = (void *)MEMORY[0x1E0DC3B68];
    _WBSLocalizedString();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __52__SFSafariViewController__defaultPreviewActionItems__block_invoke;
    v19[3] = &unk_1E4AC5650;
    v19[4] = a1;
    objc_msgSend(v2, "actionWithTitle:style:handler:", v3, 0, v19);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CEF6B0], "imageForElementActionType:", 4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setImage:", v6);

    }
    v7 = (void *)MEMORY[0x1E0DC3B68];
    _WBSLocalizedString();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v4;
    v18[1] = 3221225472;
    v18[2] = __52__SFSafariViewController__defaultPreviewActionItems__block_invoke_2;
    v18[3] = &unk_1E4AC5650;
    v18[4] = a1;
    objc_msgSend(v7, "actionWithTitle:style:handler:", v8, 0, v18);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CEF6B0], "imageForElementActionType:", 2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setImage:", v10);

    }
    v11 = (void *)MEMORY[0x1E0DC3B68];
    _WBSLocalizedString();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v4;
    v17[1] = 3221225472;
    v17[2] = __52__SFSafariViewController__defaultPreviewActionItems__block_invoke_3;
    v17[3] = &unk_1E4AC5650;
    v17[4] = a1;
    objc_msgSend(v11, "actionWithTitle:style:handler:", v12, 0, v17);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CEF6B0], "imageForElementActionType:", 5);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setImage:", v14);

    }
    v20[0] = v5;
    v20[1] = v9;
    v20[2] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }
  return v15;
}

uint64_t __44__SFSafariViewController_previewActionItems__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "runActionWithElementInfo:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1192));
}

void __52__SFSafariViewController__defaultPreviewActionItems__block_invoke(uint64_t a1)
{
  id v2;

  +[SSReadingList defaultReadingList](SSReadingList, "defaultReadingList");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addReadingListItemWithURL:title:previewText:error:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1240), 0, 0, 0);

}

void __52__SFSafariViewController__defaultPreviewActionItems__block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setURL:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1240));

}

uint64_t __52__SFSafariViewController__defaultPreviewActionItems__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1024), "openCurrentURLInSafariFromPreviewAction");
}

- (void)_boundingPathMayHaveChangedForView:(id)a3 relativeToBoundsOriginOnly:(BOOL)a4
{
  id v6;
  id v7;

  v6 = a3;
  if (!a4)
  {
    *(_OWORD *)&self->_verticalScrollIndicatorBaseInsets.top = invalidScrollViewInsets;
    *(_OWORD *)&self->_verticalScrollIndicatorBaseInsets.bottom = unk_1A3CB1288;
    *(_OWORD *)&self->_horizontalScrollIndicatorBaseInsets.top = invalidScrollViewInsets;
    *(_OWORD *)&self->_horizontalScrollIndicatorBaseInsets.bottom = unk_1A3CB1288;
    if (!self->_viewSizeIsTransitioning)
    {
      v7 = v6;
      -[SFSafariViewController _updateScrollViewIndicatorInsets]((uint64_t)self);
      v6 = v7;
    }
  }

}

- (_UIRemoteViewController)_containedRemoteViewController
{
  return (_UIRemoteViewController *)self->_remoteViewController;
}

- (void)linkPreviewHeader:(id)a3 didEnableLinkPreview:(BOOL)a4
{
  -[SFServiceViewControllerProtocol didRequestShowLinkPreviews:](self->_serviceProxy, "didRequestShowLinkPreviews:", a4);
}

- (void)remoteViewControllerDidLoadWebView:(id)a3
{
  void *v4;
  id v5;

  -[SFServiceViewControllerProtocol loadURL:](self->_serviceProxy, "loadURL:", self->_initialURL);
  -[SFSafariViewControllerConfiguration eventAttribution](self->_configuration, "eventAttribution");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "toUISClickAttribution");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && -[NSURL safari_isHTTPSURL](self->_initialURL, "safari_isHTTPSURL"))
    -[SFServiceViewControllerProtocol addClickAttribution:](self->_serviceProxy, "addClickAttribution:", v4);

}

- (void)remoteViewControllerWillDismiss:(id)a3
{
  id WeakRetained;

  -[SFSafariViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "safariViewControllerDidFinish:", self);

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SFSafariViewController;
  -[SFSafariViewController viewWillLayoutSubviews](&v4, sel_viewWillLayoutSubviews);
  -[SFSafariViewController topLayoutGuide](self, "topLayoutGuide");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "length");
  -[SFSafariLaunchPlaceholderView setTopLayoutGuideInset:](self->_launchPlaceholderView, "setTopLayoutGuideInset:");

}

- (void)_restartServiceViewController
{
  void *v3;
  UIColor *preferredBarTintColor;
  void *v5;
  void *v6;
  UIColor *preferredControlTintColor;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  self->_hasRestartedViewService = 1;
  -[SFSafariViewController serviceProxy](self, "serviceProxy");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[SFSafariViewController initialURL](self, "initialURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "loadURL:", v3);

  objc_msgSend(v11, "setConfiguration:", self->_configuration);
  objc_msgSend(v11, "setHostAppModalPresentationStyle:", -[SFSafariViewController modalPresentationStyle](self, "modalPresentationStyle"));
  preferredBarTintColor = self->_preferredBarTintColor;
  if (preferredBarTintColor)
  {
    -[SFSafariViewController traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIColor resolvedColorWithTraitCollection:](preferredBarTintColor, "resolvedColorWithTraitCollection:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setPreferredBarTintColor:", v6);

  }
  preferredControlTintColor = self->_preferredControlTintColor;
  if (preferredControlTintColor)
  {
    -[SFSafariViewController traitCollection](self, "traitCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIColor resolvedColorWithTraitCollection:](preferredControlTintColor, "resolvedColorWithTraitCollection:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setPreferredControlTintColor:", v9);

  }
  v10 = v11;
  if (self->_dismissButtonStyle)
  {
    objc_msgSend(v11, "setDismissButtonStyle:");
    v10 = v11;
  }

}

- (void)remoteViewController:(id)a3 viewServiceDidTerminateWithError:(id)a4
{
  id v6;
  id v7;
  SFBrowserRemoteViewController *remoteViewController;
  dispatch_time_t v9;
  _QWORD v10[4];
  id v11;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[SFServiceViewControllerProtocol setTarget:](self->_serviceProxy, "setTarget:", 0);
  -[SFSafariViewController _removeRemoteViewController]((uint64_t)self);
  remoteViewController = self->_remoteViewController;
  self->_remoteViewController = 0;

  -[SFSafariViewController _addLaunchPlaceholderView]((uint64_t)self);
  v9 = dispatch_time(0, 1500000000);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __80__SFSafariViewController_remoteViewController_viewServiceDidTerminateWithError___block_invoke;
  v10[3] = &unk_1E4ABFF20;
  objc_copyWeak(&v11, &location);
  dispatch_after(v9, MEMORY[0x1E0C80D38], v10);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __80__SFSafariViewController_remoteViewController_viewServiceDidTerminateWithError___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_restartServiceViewController");

}

- (void)remoteViewController:(id)a3 fetchActivityViewControllerInfoForURL:(id)a4 title:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;

  v7 = a5;
  v8 = a4;
  -[SFSafariViewController _fetchCustomActivitiesForURL:title:]((uint64_t)self, v8, v7);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[SFSafariViewController _fetchExcludedActivityTypesForURL:title:](self, "_fetchExcludedActivityTypesForURL:title:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SFServiceViewControllerProtocol didFetchCustomActivities:excludedActivityTypes:](self->_serviceProxy, "didFetchCustomActivities:excludedActivityTypes:", v10, v9);
}

- (id)_fetchCustomActivitiesForURL:(void *)a3 title:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id WeakRetained;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  uint64_t v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v7 = *(void **)(a1 + 1048);
    *(_QWORD *)(a1 + 1048) = 0;

    v8 = *(void **)(a1 + 1056);
    *(_QWORD *)(a1 + 1056) = 0;

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 1208));
    v10 = 0;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(WeakRetained, "safariViewController:activityItemsForURL:title:", a1, v5, v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = v5;
      v25[1] = v6;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __61__SFSafariViewController__fetchCustomActivitiesForURL_title___block_invoke;
      v23[3] = &unk_1E4AC5678;
      v13 = v12;
      v24 = v13;
      objc_msgSend(v11, "indexesOfObjectsPassingTest:", v23);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectsAtIndexes:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_storeStrong((id *)(a1 + 1056), v12);
      if (objc_msgSend(v15, "count"))
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = *(void **)(a1 + 1048);
        *(_QWORD *)(a1 + 1048) = v16;

        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v15, "count"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v20[0] = MEMORY[0x1E0C809B0];
        v20[1] = 3221225472;
        v20[2] = __61__SFSafariViewController__fetchCustomActivitiesForURL_title___block_invoke_2;
        v20[3] = &unk_1E4AC56A0;
        v10 = v18;
        v21 = v10;
        v22 = a1;
        objc_msgSend(v15, "enumerateObjectsUsingBlock:", v20);

      }
      else
      {
        v10 = 0;
      }

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

uint64_t __61__SFSafariViewController__fetchCustomActivitiesForURL_title___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "canPerformWithActivityItems:", *(_QWORD *)(a1 + 32));
}

void __61__SFSafariViewController__fetchCustomActivitiesForURL_title___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  SFCustomActivityProxy *v6;

  v3 = a2;
  v6 = -[SFCustomActivityProxy initWithActivity:]([SFCustomActivityProxy alloc], "initWithActivity:", v3);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);
  v4 = *(void **)(*(_QWORD *)(a1 + 40) + 1048);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[SFCustomActivityProxy activityProxyID](v6, "activityProxyID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v3, v5);

}

- (id)_fetchExcludedActivityTypesForURL:(id)a3 title:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "safariViewController:excludedActivityTypesForURL:title:", self, v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)remoteViewController:(id)a3 didFinishInitialLoad:(BOOL)a4
{
  _BOOL8 v4;
  id WeakRetained;

  if (!self->_hasNotifiedDelegateAboutInitialLoadCompleted)
  {
    v4 = a4;
    self->_hasNotifiedDelegateAboutInitialLoadCompleted = 1;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "safariViewController:didCompleteInitialLoad:", self, v4);

  }
}

- (void)remoteViewController:(id)a3 executeCustomActivityProxyID:(id)a4
{
  void *v5;
  id v6;

  -[NSMutableDictionary objectForKey:](self->_activitiesMap, "objectForKey:", a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "prepareWithActivityItems:", self->_activityItemsForCustomActivities);
  objc_msgSend(v6, "activityViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    -[SFSafariViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, 0);
  else
    objc_msgSend(v6, "performActivity");

}

- (void)remoteViewController:(id)a3 setSwipeGestureEnabled:(BOOL)a4
{
  -[SFSafariViewController _setEdgeSwipeDismissalEnabled:]((id *)&self->super.super.super.isa, a4);
}

- (void)remoteViewController:(id)a3 hostApplicationOpenURL:(id)a4
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  const __CFString *v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "_appAdoptsUISceneLifecycle");

  if (v7)
  {
    -[SFSafariViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "window");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "windowScene");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *MEMORY[0x1E0DC47C8];
    v19[0] = CFSTR("com.apple.SafariViewService");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(MEMORY[0x1E0DC3BE8], "_optionsFromPayload:sourceProcessHandle:", v12, 0);
      else
        objc_msgSend(MEMORY[0x1E0DC3BE8], "_optionsFromDictionary:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A80]), "initWithURL:options:", v5, v13);
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "scene:openURLContexts:", v10, v15);

    }
  }
  else
  {
    v16 = *MEMORY[0x1E0DC47C8];
    v17 = CFSTR("com.apple.SafariViewService");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A78]), "initWithURL:", v5);
    objc_msgSend((id)*MEMORY[0x1E0DC4730], "_applicationOpenURLAction:payload:origin:", v11, v10, 0);
  }

}

- (void)remoteViewController:(id)a3 initialLoadDidRedirectToURL:(id)a4
{
  id v5;
  id WeakRetained;
  id v7;

  v5 = a4;
  if (!self->_hasRestartedViewService)
  {
    v7 = v5;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "safariViewController:initialLoadDidRedirectToURL:", self, v7);

    v5 = v7;
  }

}

- (void)remoteViewController:(id)a3 didDecideShouldShowLinkPreviews:(BOOL)a4
{
  -[SFSafariViewController _updatePreviewViewControllerWithLinkPreviewEnabled:animated:]((uint64_t)self, a4, 1);
}

- (void)remoteViewControllerWillOpenCurrentPageInBrowser:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "safariViewControllerWillOpenInBrowser:", self);

}

- (void)_forwardNotificationToViewService:(id)a3
{
  SFServiceViewControllerProtocol *serviceProxy;
  id v4;

  serviceProxy = self->_serviceProxy;
  objc_msgSend(a3, "name");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SFServiceViewControllerProtocol repostNotificationInViewService:](serviceProxy, "repostNotificationInViewService:", v4);

}

- (void)interactiveDismissControllerDidBegin:(id)a3
{
  -[SFServiceViewControllerProtocol setIsRunningTransitionAnimation:](self->_serviceProxy, "setIsRunningTransitionAnimation:", 1);
}

- (void)interactiveDismissControllerDidEnd:(id)a3
{
  id WeakRetained;

  -[SFServiceViewControllerProtocol setIsRunningTransitionAnimation:](self->_serviceProxy, "setIsRunningTransitionAnimation:", 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "safariViewControllerDidFinish:", self);

}

- (void)interactiveDismissControllerDidCancel:(id)a3
{
  -[SFServiceViewControllerProtocol setIsRunningTransitionAnimation:](self->_serviceProxy, "setIsRunningTransitionAnimation:", 0);
}

- (void)serviceProxyWillQueueInvocation:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (!self->_cancelViewServiceRequest && self->_adoptsPlatformConventions)
  {
    v5 = v4;
    -[SFSafariViewController _connectToService]((uint64_t)self);
    v4 = v5;
  }

}

- (_WKActivatedElementInfo)_activatedElementInfo
{
  return self->_activatedElementInfo;
}

- (void)_setActivatedElementInfo:(id)a3
{
  objc_storeStrong((id *)&self->_activatedElementInfo, a3);
}

- (NSArray)_previewActions
{
  return self->_previewActions;
}

- (void)_setPreviewActions:(id)a3
{
  objc_storeStrong((id *)&self->_previewActions, a3);
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)delegate
{
  objc_storeWeak((id *)&self->_delegate, delegate);
}

- (UIColor)preferredBarTintColor
{
  return self->_preferredBarTintColor;
}

- (UIColor)preferredControlTintColor
{
  return self->_preferredControlTintColor;
}

- (SFSafariViewControllerDismissButtonStyle)dismissButtonStyle
{
  return self->_dismissButtonStyle;
}

- (NSURL)initialURL
{
  return self->_initialURL;
}

- (BOOL)defersAddingRemoteViewController
{
  return self->_defersAddingRemoteViewController;
}

- (void)setDefersAddingRemoteViewController:(BOOL)a3
{
  self->_defersAddingRemoteViewController = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialURL, 0);
  objc_storeStrong((id *)&self->_preferredControlTintColor, 0);
  objc_storeStrong((id *)&self->_preferredBarTintColor, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_previewActions, 0);
  objc_storeStrong((id *)&self->_activatedElementInfo, 0);
  objc_storeStrong((id *)&self->_linkPreviewHitTestView, 0);
  objc_storeStrong((id *)&self->_textPreviewViewController, 0);
  objc_storeStrong((id *)&self->_interactiveDismissController, 0);
  objc_storeStrong((id *)&self->_activityItemsForCustomActivities, 0);
  objc_storeStrong((id *)&self->_activitiesMap, 0);
  objc_storeStrong((id *)&self->_customActivities, 0);
  objc_storeStrong((id *)&self->_serviceProxy, 0);
  objc_storeStrong((id *)&self->_cancelViewServiceRequest, 0);
  objc_storeStrong((id *)&self->_remoteViewController, 0);
  objc_storeStrong((id *)&self->_launchPlaceholderView, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_adoptsPlatformConventions, 0);
}

- (void)_handleURLExternallyIfApplicableBypassingVisibilityCheck:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A3B2D000, a1, a3, "Ignoring call to handle URL externally because there was no window to present from.", a5, a6, a7, a8, 0);
}

- (void)_handleURLExternallyIfApplicableBypassingVisibilityCheck:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A3B2D000, a1, a3, "Ignoring call to handle URL externally because SFSafariViewController is not visible.", a5, a6, a7, a8, 0);
}

@end
