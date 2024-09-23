@implementation SFOverlayProvider

- (SFOverlayProvider)initWithURL:(id)a3 bundleIdentifier:(id)a4
{
  id v6;
  id v7;
  SFOverlayProvider *v8;
  uint64_t v9;
  NSURL *url;
  SFOverlayProvider *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SFOverlayProvider;
  v8 = -[SFOverlayProvider init](&v13, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    url = v8->_url;
    v8->_url = (NSURL *)v9;

    objc_storeStrong((id *)&v8->_bundleIdentifier, a4);
    v11 = v8;
  }

  return v8;
}

+ (BOOL)alwaysShowOverlayForDebug
{
  if (alwaysShowOverlayForDebug_onceToken != -1)
    dispatch_once(&alwaysShowOverlayForDebug_onceToken, &__block_literal_global_45);
  return alwaysShowOverlayForDebug_alwaysShowOverlay;
}

void __46__SFOverlayProvider_alwaysShowOverlayForDebug__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  alwaysShowOverlayForDebug_alwaysShowOverlay = objc_msgSend(v0, "BOOLForKey:", CFSTR("DebugAlwaysShowAppclipOverlay"));

}

- (UIViewController)overlayViewController
{
  return (UIViewController *)self->_cardViewController;
}

- (void)showOverlayInScrollView:(id)a3 viewController:(id)a4
{
  id v6;
  id v7;
  CPSInlineCardViewController *cardViewController;
  uint64_t v9;
  void *v10;
  objc_class *v11;
  CPSInlineCardViewController *v12;
  CPSInlineCardViewController *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[5];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;

  v6 = a3;
  v7 = a4;
  if (self->_available)
  {
    cardViewController = self->_cardViewController;
    v9 = MEMORY[0x1E0C809B0];
    if (!cardViewController)
    {
      v23 = 0;
      v24 = &v23;
      v25 = 0x2050000000;
      v10 = (void *)getCPSInlineCardViewControllerClass_softClass;
      v26 = getCPSInlineCardViewControllerClass_softClass;
      if (!getCPSInlineCardViewControllerClass_softClass)
      {
        v22[0] = MEMORY[0x1E0C809B0];
        v22[1] = 3221225472;
        v22[2] = __getCPSInlineCardViewControllerClass_block_invoke;
        v22[3] = &unk_1E21E3330;
        v22[4] = &v23;
        __getCPSInlineCardViewControllerClass_block_invoke((uint64_t)v22);
        v10 = (void *)v24[3];
      }
      v11 = objc_retainAutorelease(v10);
      _Block_object_dispose(&v23, 8);
      v12 = (CPSInlineCardViewController *)objc_msgSend([v11 alloc], "initWithURL:", self->_url);
      v13 = self->_cardViewController;
      self->_cardViewController = v12;

      cardViewController = self->_cardViewController;
    }
    -[CPSInlineCardViewController view](cardViewController, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", v14);

    objc_msgSend(v7, "addChildViewController:", self->_cardViewController);
    -[CPSInlineCardViewController didMoveToParentViewController:](self->_cardViewController, "didMoveToParentViewController:", v7);
    -[CPSInlineCardViewController view](self->_cardViewController, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setAlpha:", 0.0);
    v16 = (void *)MEMORY[0x1E0DC3F10];
    v20[0] = v9;
    v20[1] = 3221225472;
    v20[2] = __60__SFOverlayProvider_showOverlayInScrollView_viewController___block_invoke;
    v20[3] = &unk_1E21E2050;
    v21 = v15;
    v18[0] = v9;
    v18[1] = 3221225472;
    v18[2] = __60__SFOverlayProvider_showOverlayInScrollView_viewController___block_invoke_2;
    v18[3] = &unk_1E21E2190;
    v19 = v6;
    v17 = v15;
    objc_msgSend(v16, "_animateUsingDefaultTimingWithOptions:animations:completion:", 2, v20, v18);
    -[CPSInlineCardViewController setDelegate:](self->_cardViewController, "setDelegate:", self);

  }
}

uint64_t __60__SFOverlayProvider_showOverlayInScrollView_viewController___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

uint64_t __60__SFOverlayProvider_showOverlayInScrollView_viewController___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setScrollEnabled:", 0);
}

- (void)hideOverlayAnimated:(BOOL)a3
{
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD aBlock[4];
  id v16;
  SFOverlayProvider *v17;

  -[CPSInlineCardViewController setDelegate:](self->_cardViewController, "setDelegate:", 0);
  -[CPSInlineCardViewController view](self->_cardViewController, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __41__SFOverlayProvider_hideOverlayAnimated___block_invoke;
  aBlock[3] = &unk_1E21E2258;
  v7 = v5;
  v16 = v7;
  v17 = self;
  v8 = _Block_copy(aBlock);
  v9 = v8;
  if (a3)
  {
    v10 = (void *)MEMORY[0x1E0DC3F10];
    v13[0] = v6;
    v13[1] = 3221225472;
    v13[2] = __41__SFOverlayProvider_hideOverlayAnimated___block_invoke_2;
    v13[3] = &unk_1E21E2050;
    v14 = v7;
    v11[0] = v6;
    v11[1] = 3221225472;
    v11[2] = __41__SFOverlayProvider_hideOverlayAnimated___block_invoke_3;
    v11[3] = &unk_1E21E2608;
    v12 = v9;
    objc_msgSend(v10, "animateWithDuration:animations:completion:", v13, v11, 0.2);

  }
  else
  {
    (*((void (**)(void *))v8 + 2))(v8);
  }

}

void __41__SFOverlayProvider_hideOverlayAnimated___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "superview");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "parentViewController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "removeChildViewController:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8));

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "didMoveToParentViewController:", 0);
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 48));
    objc_msgSend(WeakRetained, "overlayDidHide:", *(_QWORD *)(a1 + 40));

    objc_msgSend(v4, "setScrollEnabled:", 1);
  }

}

uint64_t __41__SFOverlayProvider_hideOverlayAnimated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __41__SFOverlayProvider_hideOverlayAnimated___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)webViewBackforwardGestureNavigationWillBegin
{
  UIViewController *v3;
  UIViewController *cachedOwningViewController;

  -[CPSInlineCardViewController parentViewController](self->_cardViewController, "parentViewController");
  v3 = (UIViewController *)objc_claimAutoreleasedReturnValue();
  cachedOwningViewController = self->_cachedOwningViewController;
  self->_cachedOwningViewController = v3;

  -[UIViewController removeChildViewController:](self->_cachedOwningViewController, "removeChildViewController:", self->_cardViewController);
  -[CPSInlineCardViewController didMoveToParentViewController:](self->_cardViewController, "didMoveToParentViewController:", 0);
}

- (void)webViewBackforwardGestureNavigationDidEnd
{
  UIViewController *cachedOwningViewController;

  -[UIViewController addChildViewController:](self->_cachedOwningViewController, "addChildViewController:", self->_cardViewController);
  -[CPSInlineCardViewController didMoveToParentViewController:](self->_cardViewController, "didMoveToParentViewController:", self->_cachedOwningViewController);
  cachedOwningViewController = self->_cachedOwningViewController;
  self->_cachedOwningViewController = 0;

}

- (void)cardViewControllerDidDisappear:(id)a3 clipDidOpen:(BOOL)a4 persistUserSettings:(BOOL)a5
{
  _BOOL4 v5;
  CPSInlineCardViewController *v8;
  NSObject *v9;
  NSObject *v10;
  uint8_t v11[16];

  v5 = a5;
  v8 = (CPSInlineCardViewController *)a3;
  if (self->_cardViewController == v8)
  {
    self->_available = 0;
    if (v5 && !a4)
    {
      v10 = WBS_LOG_CHANNEL_PREFIXBanners();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_18B7B2000, v10, OS_LOG_TYPE_INFO, "User cancelled app clip card by tapping the close button", v11, 2u);
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
        -[SFOverlayProvider _updateAppClipOverlayPreferenceHook](self, "_updateAppClipOverlayPreferenceHook");
    }
    -[SFOverlayProvider hideOverlayAnimated:](self, "hideOverlayAnimated:", 1);
  }
  else
  {
    v9 = WBS_LOG_CHANNEL_PREFIXBanners();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[SFOverlayProvider cardViewControllerDidDisappear:clipDidOpen:persistUserSettings:].cold.1(v9);
  }

}

- (NSURL)url
{
  return self->_url;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (SFOverlayProviderDelegate)delegate
{
  return (SFOverlayProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isAvailable
{
  return self->_available;
}

- (void)setAvailable:(BOOL)a3
{
  self->_available = a3;
}

- (_SFPerSitePreferencesVendor)_preferencesVendor
{
  return (_SFPerSitePreferencesVendor *)objc_loadWeakRetained((id *)&self->__preferencesVendor);
}

- (void)_setPreferencesVendor:(id)a3
{
  objc_storeWeak((id *)&self->__preferencesVendor, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->__preferencesVendor);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_cachedOwningViewController, 0);
  objc_storeStrong((id *)&self->_cardViewController, 0);
}

- (void)cardViewControllerDidDisappear:(os_log_t)log clipDidOpen:persistUserSettings:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18B7B2000, log, OS_LOG_TYPE_ERROR, "Try to hide an overlay view controller that is not in heirarchy.", v1, 2u);
}

@end
