@implementation SFBrowserRemoteViewController

+ (id)requestViewControllerWithConnectionHandler:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "requestViewController:fromServiceWithBundleIdentifier:connectionHandler:", CFSTR("SFBrowserServiceViewController"), CFSTR("com.apple.SafariViewService"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (BOOL)shouldPropagateAppearanceCustomizations
{
  return 0;
}

+ (id)serviceViewControllerInterface
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE756350);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_requestPrewarmingWithTokens_, 0, 0);

  return v2;
}

+ (id)exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE769F40);
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SFBrowserRemoteViewController;
  -[_UIRemoteViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  self->_shouldDetermineVisibilityOnNextLayout = !self->_hasBeenDisplayedAtLeastOnce;
  self->_hasBeenDisplayedAtLeastOnce = 1;
}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFBrowserRemoteViewController;
  -[SFBrowserRemoteViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  if (self->_shouldDetermineVisibilityOnNextLayout)
    -[SFBrowserRemoteViewController _determineVisibilityIfNeeded](self, "_determineVisibilityIfNeeded");
}

- (void)willMoveToParentViewController:(id)a3
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SFBrowserRemoteViewController;
  -[SFBrowserRemoteViewController willMoveToParentViewController:](&v6, sel_willMoveToParentViewController_);
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CC2550], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addVolumeDisplay:", self);

  }
}

- (void)didMoveToParentViewController:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CC2550], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeVolumeDisplay:", self);

  }
  v6.receiver = self;
  v6.super_class = (Class)SFBrowserRemoteViewController;
  -[_UIRemoteViewController didMoveToParentViewController:](&v6, sel_didMoveToParentViewController_, v4);

}

- (void)didLoadWebView
{
  self->_didLoadWebView = 1;
  -[SFBrowserRemoteViewController _determineVisibilityIfNeeded](self, "_determineVisibilityIfNeeded");
}

- (void)_determineVisibilityIfNeeded
{
  id WeakRetained;
  void *v4;
  char v5;

  if (self->_didLoadWebView && self->_hasBeenDisplayedAtLeastOnce)
  {
    self->_shouldDetermineVisibilityOnNextLayout = 0;
    v5 = 0;
    if (SFViewControllerViewIsVisible(self, &v5))
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "remoteViewControllerDidLoadWebView:", self);

      if (!v5)
        return;
      -[_UIRemoteViewController serviceViewControllerProxy](self, "serviceViewControllerProxy");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "didDetectUserInteractionFromHostApp");
    }
    else
    {
      -[_UIRemoteViewController serviceViewControllerProxy](self, "serviceViewControllerProxy");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "didDetectRemoteViewControllerViewIsHidden");
    }

  }
}

- (void)willDismissServiceViewController
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A3B2D000, log, OS_LOG_TYPE_ERROR, "SFBrowserRemoteViewControllerDelegate is nil", v1, 2u);
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  SFBrowserRemoteViewControllerDelegate **p_delegate;
  id v5;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "remoteViewController:viewServiceDidTerminateWithError:", self, v5);

}

- (void)setRemoteSwipeGestureEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;

  v3 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "remoteViewController:setSwipeGestureEnabled:", self, v3);

}

- (void)didFinishInitialLoad:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;

  v3 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "remoteViewController:didFinishInitialLoad:", self, v3);

}

- (void)fetchActivityViewControllerInfoForURL:(id)a3 title:(id)a4
{
  SFBrowserRemoteViewControllerDelegate **p_delegate;
  id v7;
  id v8;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v7 = a4;
  v8 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "remoteViewController:fetchActivityViewControllerInfoForURL:title:", self, v8, v7);

}

- (void)executeCustomActivityProxyID:(id)a3
{
  SFBrowserRemoteViewControllerDelegate **p_delegate;
  id v5;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "remoteViewController:executeCustomActivityProxyID:", self, v5);

}

- (void)willOpenURLInHostApplication:(id)a3
{
  SFBrowserRemoteViewControllerDelegate **p_delegate;
  id v5;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "remoteViewController:hostApplicationOpenURL:", self, v5);

}

- (void)didDecideCookieSharingForURL:(id)a3 shouldCancel:(BOOL)a4 withError:(id)a5
{
  _BOOL8 v6;
  id v8;
  id WeakRetained;
  id v10;

  v6 = a4;
  v10 = a3;
  v8 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "remoteViewController:didDecideCookieSharingForURL:shouldCancel:withError:", self, v10, v6, v8);

}

- (void)initialLoadDidRedirectToURL:(id)a3
{
  SFBrowserRemoteViewControllerDelegate **p_delegate;
  id v5;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "remoteViewController:initialLoadDidRedirectToURL:", self, v5);

}

- (void)didChangeFullScreen:(BOOL)a3
{
  id v3;

  self->_isInFullScreen = a3;
  objc_msgSend(MEMORY[0x1E0CC2550], "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsUpdate");

}

- (void)didResolveRedirectionWithURL:(id)a3 appLink:(id)a4
{
  id v6;
  id WeakRetained;
  id v8;

  v8 = a3;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "remoteViewController:didResolveRedirectionWithURL:appLink:", self, v8, v6);

}

- (void)didDecideShouldShowLinkPreviews:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;

  v3 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "remoteViewController:didDecideShouldShowLinkPreviews:", self, v3);

}

- (void)willOpenCurrentPageInBrowser
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "remoteViewControllerWillOpenCurrentPageInBrowser:", self);

}

- (void)_sf_sceneWillEnterForeground:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[SFBrowserRemoteViewController viewIfLoaded](self, "viewIfLoaded");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "windowScene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "object");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 == v8)
  {
    -[_UIRemoteViewController serviceViewControllerProxy](self, "serviceViewControllerProxy");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "beginDigitalHealthTracking");

  }
}

- (void)_sf_sceneDidEnterBackground:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[SFBrowserRemoteViewController viewIfLoaded](self, "viewIfLoaded");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "windowScene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "object");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 == v8)
  {
    -[_UIRemoteViewController serviceViewControllerProxy](self, "serviceViewControllerProxy");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stopDigitalHealthTrackingWithCompletionHandler:", &__block_literal_global_36);

  }
}

- (void)suspendApplication
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3720]), "initWithInfo:responder:", 0, 0);
  -[SFBrowserRemoteViewController viewIfLoaded](self, "viewIfLoaded");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_FBSScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sendActions:", v7);

}

- (void)destroyScene
{
  void *v2;
  void *v3;
  id v4;

  -[SFBrowserRemoteViewController viewIfLoaded](self, "viewIfLoaded");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "windowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_sf_destroyScene");

}

- (BOOL)isOnScreenForVolumeDisplay
{
  void *v2;
  void *v3;
  BOOL v4;

  if (!self->_isInFullScreen)
    return 0;
  -[SFBrowserRemoteViewController viewIfLoaded](self, "viewIfLoaded");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (NSString)volumeAudioCategory
{
  return (NSString *)CFSTR("Audio/Video");
}

- (UIWindowScene)windowSceneForVolumeDisplay
{
  void *v2;
  void *v3;
  void *v4;

  -[SFBrowserRemoteViewController viewIfLoaded](self, "viewIfLoaded");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "windowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIWindowScene *)v4;
}

- (SFBrowserRemoteViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  SFBrowserRemoteViewController *v4;
  void *v5;
  SFBrowserRemoteViewController *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SFBrowserRemoteViewController;
  v4 = -[SFBrowserRemoteViewController initWithNibName:bundle:](&v8, sel_initWithNibName_bundle_, a3, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v4, sel__sf_sceneWillEnterForeground_, *MEMORY[0x1E0DC5338], 0);
    objc_msgSend(v5, "addObserver:selector:name:object:", v4, sel__sf_sceneDidEnterBackground_, *MEMORY[0x1E0DC5318], 0);
    v6 = v4;

  }
  return v4;
}

- (SFBrowserRemoteViewControllerDelegate)delegate
{
  return (SFBrowserRemoteViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
