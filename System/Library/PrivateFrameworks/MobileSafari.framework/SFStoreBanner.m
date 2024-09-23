@implementation SFStoreBanner

+ (BOOL)omitsBottomSeparator
{
  return 1;
}

- (SFStoreBanner)initWithProductID:(id)a3 mainDocumentURL:(id)a4 affiliateData:(id)a5 applicationLaunchArgument:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  SFStoreBanner *v15;
  SFStoreBanner *v16;
  SFStoreBanner *v17;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = -[SFStoreBanner init](self, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_productID, a3);
    objc_storeStrong((id *)&v16->_affiliateData, a5);
    objc_storeStrong((id *)&v16->_mainDocumentURL, a4);
    objc_storeStrong((id *)&v16->_argument, a6);
    -[SFStoreBanner setClipsToBounds:](v16, "setClipsToBounds:", 1);
    -[SFStoreBanner _setUpAppStoreLockUpView](v16, "_setUpAppStoreLockUpView");
    v17 = v16;
  }

  return v16;
}

- (void)_setUpStoreKitProductView
{
  void *v3;
  uint64_t v4;
  objc_class *v5;
  SKProductPageViewController *v6;
  SKProductPageViewController *productViewController;
  void *v8;
  void *v9;
  _QWORD v10[5];
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2050000000;
  v3 = (void *)getSKProductPageViewControllerClass_softClass;
  v15 = getSKProductPageViewControllerClass_softClass;
  v4 = MEMORY[0x1E0C809B0];
  if (!getSKProductPageViewControllerClass_softClass)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __getSKProductPageViewControllerClass_block_invoke;
    v11[3] = &unk_1E21E3330;
    v11[4] = &v12;
    __getSKProductPageViewControllerClass_block_invoke((uint64_t)v11);
    v3 = (void *)v13[3];
  }
  v5 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v12, 8);
  v6 = (SKProductPageViewController *)objc_msgSend([v5 alloc], "initWithProductPageStyle:", 1);
  productViewController = self->_productViewController;
  self->_productViewController = v6;

  if (self->_mainDocumentURL && (objc_opt_respondsToSelector() & 1) != 0)
    -[SKProductPageViewController setMainDocumentURL:](self->_productViewController, "setMainDocumentURL:", self->_mainDocumentURL);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", self->_argument, CFSTR("applicationLaunchArgument"));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", self->_affiliateData, CFSTR("affiliateData"));
  if (objc_msgSend(v8, "count"))
    -[SKProductPageViewController setScriptContextDictionary:](self->_productViewController, "setScriptContextDictionary:", v8);
  -[SKProductPageViewController setDelegate:](self->_productViewController, "setDelegate:", self);
  -[SKProductPageViewController view](self->_productViewController, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFStoreBanner insertSubview:atIndex:](self, "insertSubview:atIndex:", v9, 0);

  v10[0] = v4;
  v10[1] = 3221225472;
  v10[2] = __42__SFStoreBanner__setUpStoreKitProductView__block_invoke;
  v10[3] = &unk_1E21E2050;
  v10[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], v10);

}

void __42__SFStoreBanner__setUpStoreKitProductView__block_invoke(uint64_t a1)
{
  void *v2;
  id *v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 464);
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v3 = (id *)getSKStoreProductParameterITunesItemIdentifierSymbolLoc_ptr;
  v11 = getSKStoreProductParameterITunesItemIdentifierSymbolLoc_ptr;
  if (!getSKStoreProductParameterITunesItemIdentifierSymbolLoc_ptr)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __getSKStoreProductParameterITunesItemIdentifierSymbolLoc_block_invoke;
    v7[3] = &unk_1E21E3330;
    v7[4] = &v8;
    __getSKStoreProductParameterITunesItemIdentifierSymbolLoc_block_invoke((uint64_t)v7);
    v3 = (id *)v9[3];
  }
  _Block_object_dispose(&v8, 8);
  if (!v3)
  {
    -[SFScreenTimeOverlayViewController showBlockingViewControllerForURL:withPolicy:animated:].cold.1();
    __break(1u);
  }
  v12 = *v3;
  v13[0] = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 504);
  v4 = (void *)MEMORY[0x1E0C99D80];
  v5 = v12;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "loadProductWithParameters:", v6);

}

- (void)_setUpAppStoreLockUpView
{
  void *v3;
  objc_class *v4;
  id v5;
  ASCLockupView *v6;
  ASCLockupView *lockupView;
  void *v8;
  void *v9;
  objc_class *v10;
  id v11;
  void *v12;
  objc_class *v13;
  void *v14;
  id *v15;
  void *v16;
  id v17;
  id *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  UIButton *v27;
  UIButton *closeButton;
  SFThemeColorEffectView *v29;
  void *v30;
  SFThemeColorEffectView *v31;
  SFThemeColorEffectView *backdrop;
  UIView *v33;
  UIView *separator;
  void *v35;
  _Unwind_Exception *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;

  v42 = 0;
  v43 = &v42;
  v44 = 0x2050000000;
  v3 = (void *)getASCLockupViewClass_softClass;
  v45 = getASCLockupViewClass_softClass;
  if (!getASCLockupViewClass_softClass)
  {
    v37 = MEMORY[0x1E0C809B0];
    v38 = 3221225472;
    v39 = (uint64_t)__getASCLockupViewClass_block_invoke;
    v40 = &unk_1E21E3330;
    v41 = &v42;
    __getASCLockupViewClass_block_invoke((uint64_t)&v37);
    v3 = (void *)v43[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v42, 8);
  v5 = [v4 alloc];
  v6 = (ASCLockupView *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  lockupView = self->_lockupView;
  self->_lockupView = v6;

  -[ASCLockupView setLayoutMargins:](self->_lockupView, "setLayoutMargins:", 0.0, 0.0, 0.0, 14.0);
  objc_msgSend(getASCOfferThemeClass(), "blueTheme");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCLockupView setOfferTheme:](self->_lockupView, "setOfferTheme:", v8);

  v42 = 0;
  v43 = &v42;
  v44 = 0x2050000000;
  v9 = (void *)getASCLockupRequestClass_softClass;
  v45 = getASCLockupRequestClass_softClass;
  if (!getASCLockupRequestClass_softClass)
  {
    v37 = MEMORY[0x1E0C809B0];
    v38 = 3221225472;
    v39 = (uint64_t)__getASCLockupRequestClass_block_invoke;
    v40 = &unk_1E21E3330;
    v41 = &v42;
    __getASCLockupRequestClass_block_invoke((uint64_t)&v37);
    v9 = (void *)v43[3];
  }
  v10 = objc_retainAutorelease(v9);
  _Block_object_dispose(&v42, 8);
  v11 = [v10 alloc];
  v42 = 0;
  v43 = &v42;
  v44 = 0x2050000000;
  v12 = (void *)getASCAdamIDClass_softClass;
  v45 = getASCAdamIDClass_softClass;
  if (!getASCAdamIDClass_softClass)
  {
    v37 = MEMORY[0x1E0C809B0];
    v38 = 3221225472;
    v39 = (uint64_t)__getASCAdamIDClass_block_invoke;
    v40 = &unk_1E21E3330;
    v41 = &v42;
    __getASCAdamIDClass_block_invoke((uint64_t)&v37);
    v12 = (void *)v43[3];
  }
  v13 = objc_retainAutorelease(v12);
  _Block_object_dispose(&v42, 8);
  v14 = (void *)objc_msgSend([v13 alloc], "initWithNumberValue:", self->_productID);
  v37 = 0;
  v38 = (uint64_t)&v37;
  v39 = 0x2020000000;
  v15 = (id *)getASCLockupKindAppSymbolLoc_ptr;
  v40 = (void *)getASCLockupKindAppSymbolLoc_ptr;
  if (!getASCLockupKindAppSymbolLoc_ptr)
  {
    v16 = (void *)AppStoreComponentsLibrary();
    v15 = (id *)dlsym(v16, "ASCLockupKindApp");
    *(_QWORD *)(v38 + 24) = v15;
    getASCLockupKindAppSymbolLoc_ptr = (uint64_t)v15;
  }
  _Block_object_dispose(&v37, 8);
  if (!v15)
  {
    -[SFScreenTimeOverlayViewController showBlockingViewControllerForURL:withPolicy:animated:].cold.1();
    goto LABEL_18;
  }
  v17 = *v15;
  v37 = 0;
  v38 = (uint64_t)&v37;
  v39 = 0x2020000000;
  v18 = (id *)getASCLockupContextStandardSymbolLoc_ptr;
  v40 = (void *)getASCLockupContextStandardSymbolLoc_ptr;
  if (!getASCLockupContextStandardSymbolLoc_ptr)
  {
    v19 = (void *)AppStoreComponentsLibrary();
    v18 = (id *)dlsym(v19, "ASCLockupContextStandard");
    *(_QWORD *)(v38 + 24) = v18;
    getASCLockupContextStandardSymbolLoc_ptr = (uint64_t)v18;
  }
  _Block_object_dispose(&v37, 8);
  if (!v18)
  {
LABEL_18:
    v36 = (_Unwind_Exception *)-[SFScreenTimeOverlayViewController showBlockingViewControllerForURL:withPolicy:animated:].cold.1();
    _Block_object_dispose(&v42, 8);
    _Unwind_Resume(v36);
  }
  v20 = *v18;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v21 = objc_msgSend(v11, "_initWithID:kind:context:clientID:enableAppDistribution:", v14, v17, v20, CFSTR("SmartAppBanner"), 1);
  else
    v21 = objc_msgSend(v11, "_initWithID:kind:context:clientID:", v14, v17, v20, CFSTR("SmartAppBanner"));
  v22 = (void *)v21;
  -[ASCLockupView setRequest:](self->_lockupView, "setRequest:", v21);

  -[ASCLockupView setDelegate:](self->_lockupView, "setDelegate:", self);
  -[SFStoreBanner addSubview:](self, "addSubview:", self->_lockupView);
  objc_msgSend(MEMORY[0x1E0DC3520], "plainButtonConfiguration");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setBaseForegroundColor:", v24);

  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("xmark"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setImage:", v25);

  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithTextStyle:scale:", *MEMORY[0x1E0DC4AA0], -1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setPreferredSymbolConfigurationForImage:", v26);

  v27 = (UIButton *)objc_alloc_init(MEMORY[0x1E0DC3518]);
  closeButton = self->_closeButton;
  self->_closeButton = v27;

  -[UIButton setConfiguration:](self->_closeButton, "setConfiguration:", v23);
  -[UIButton addTarget:action:forControlEvents:](self->_closeButton, "addTarget:action:forControlEvents:", self, sel__setBlockedByUser, 64);
  -[UIButton sizeToFit](self->_closeButton, "sizeToFit");
  -[SFStoreBanner addSubview:](self, "addSubview:", self->_closeButton);
  v29 = [SFThemeColorEffectView alloc];
  objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 10);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = -[SFThemeColorEffectView initWithEffect:](v29, "initWithEffect:", v30);
  backdrop = self->_backdrop;
  self->_backdrop = v31;

  -[SFStoreBanner bounds](self, "bounds");
  -[SFThemeColorEffectView setFrame:](self->_backdrop, "setFrame:");
  -[SFThemeColorEffectView setAutoresizingMask:](self->_backdrop, "setAutoresizingMask:", 18);
  -[SFStoreBanner addSubview:](self, "addSubview:", self->_backdrop);
  -[SFStoreBanner sendSubviewToBack:](self, "sendSubviewToBack:", self->_backdrop);
  v33 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
  separator = self->_separator;
  self->_separator = v33;

  objc_msgSend(MEMORY[0x1E0DC3658], "sf_barHairlineOutlineColor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](self->_separator, "setBackgroundColor:", v35);

  -[SFStoreBanner addSubview:](self, "addSubview:", self->_separator);
}

- (void)_removeAppStoreLockUpView
{
  ASCLockupView *lockupView;
  UIButton *closeButton;
  UIView *separator;
  SFThemeColorEffectView *backdrop;

  -[ASCLockupView setDelegate:](self->_lockupView, "setDelegate:", 0);
  -[ASCLockupView removeFromSuperview](self->_lockupView, "removeFromSuperview");
  -[UIButton removeFromSuperview](self->_closeButton, "removeFromSuperview");
  -[UIView removeFromSuperview](self->_separator, "removeFromSuperview");
  -[SFThemeColorEffectView removeFromSuperview](self->_backdrop, "removeFromSuperview");
  lockupView = self->_lockupView;
  self->_lockupView = 0;

  closeButton = self->_closeButton;
  self->_closeButton = 0;

  separator = self->_separator;
  self->_separator = 0;

  backdrop = self->_backdrop;
  self->_backdrop = 0;

}

- (void)themeDidChange
{
  void *v3;
  objc_class *ASCOfferThemeClass;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[SFPinnableBanner theme](self, "theme");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[SFThemeColorEffectView setTheme:](self->_backdrop, "setTheme:", v11);
  objc_msgSend(v11, "overrideTintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setHidden:](self->_separator, "setHidden:", v3 != 0);
  ASCOfferThemeClass = (objc_class *)getASCOfferThemeClass();
  if (v3)
  {
    v5 = [ASCOfferThemeClass alloc];
    objc_msgSend(v11, "themeColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "themeColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "colorWithAlphaComponent:", 0.3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "themeColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v5, "initWithTitleBackgroundColor:titleTextColor:titleTextDisabledColor:subtitleTextColor:iconTintColor:progressColor:", v3, v6, v8, v9, v3, v3);
    -[ASCLockupView setOfferTheme:](self->_lockupView, "setOfferTheme:", v10);

  }
  else
  {
    -[objc_class blueTheme](ASCOfferThemeClass, "blueTheme");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCLockupView setOfferTheme:](self->_lockupView, "setOfferTheme:", v6);
  }

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double Width;
  double Height;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGFloat v20;
  double v21;
  objc_super v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;

  v22.receiver = self;
  v22.super_class = (Class)SFStoreBanner;
  -[SFStoreBanner layoutSubviews](&v22, sel_layoutSubviews);
  -[SFStoreBanner bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SKProductPageViewController view](self->_productViewController, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  if (self->_lockupView)
  {
    v23.origin.x = v4;
    v23.origin.y = v6;
    v23.size.width = v8;
    v23.size.height = v10;
    Width = CGRectGetWidth(v23);
    v24.origin.x = v4;
    v24.origin.y = v6;
    v24.size.width = v8;
    v24.size.height = v10;
    Height = CGRectGetHeight(v24);
    -[SFStoreBanner safeAreaInsets](self, "safeAreaInsets");
    v15 = v14;
    v17 = v16;
    -[UIButton sizeToFit](self->_closeButton, "sizeToFit");
    -[UIButton bounds](self->_closeButton, "bounds");
    -[UIButton setFrame:](self->_closeButton, "setFrame:", fmax(v15, 4.0), (Height - fmax(CGRectGetHeight(v25), 44.0)) * 0.5);
    -[UIButton frame](self->_closeButton, "frame");
    v19 = v18;
    -[UIButton frame](self->_closeButton, "frame");
    v20 = CGRectGetWidth(v26);
    -[ASCLockupView setFrame:](self->_lockupView, "setFrame:", v19 + v20, 0.0, Width - v17 - (v19 + v20), Height);
    v21 = _SFOnePixel();
    -[UIView setFrame:](self->_separator, "setFrame:", 0.0, Height - v21, Width, v21);
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  ASCLockupView *lockupView;
  double v5;
  double v6;
  int IsPad;
  double v8;
  CGSize result;

  width = a3.width;
  lockupView = self->_lockupView;
  if (lockupView)
  {
    -[ASCLockupView sizeThatFits:](lockupView, "sizeThatFits:", a3.width, 1.79769313e308);
    v6 = v5 + 28.0;
  }
  else
  {
    IsPad = _SFDeviceIsPad();
    v6 = 95.0;
    if (!IsPad)
      v6 = 84.0;
  }
  v8 = width;
  result.height = v6;
  result.width = v8;
  return result;
}

- (void)_setBlockedByUser
{
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "dismissAppSuggestionBanner:", self);
  if (objc_msgSend(WeakRetained, "shouldBlockAppSuggestionBanner:", self))
  {
    +[SFStoreBannerTracker sharedTracker](SFStoreBannerTracker, "sharedTracker");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "blockProductBanner:", self->_productID);

  }
}

- (void)dealloc
{
  objc_super v3;

  -[ASCLockupView setDelegate:](self->_lockupView, "setDelegate:", 0);
  -[SKProductPageViewController setDelegate:](self->_productViewController, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SFStoreBanner;
  -[SFStoreBanner dealloc](&v3, sel_dealloc);
}

- (void)productPage:(id)a3 didFinishWithResult:(int64_t)a4
{
  id v6;
  id WeakRetained;
  id v8;

  v6 = a3;
  if (a4 == 1)
  {
    v8 = v6;
    -[SFStoreBanner _setBlockedByUser](self, "_setBlockedByUser");
    goto LABEL_5;
  }
  if (a4 == 2)
  {
    v8 = v6;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "setAppSuggestionBanner:isPinned:", self, 0);

LABEL_5:
    v6 = v8;
  }

}

- (void)productPage:(id)a3 didFailLoadWithError:(id)a4
{
  id v5;
  NSObject *v6;
  id WeakRetained;

  v5 = a4;
  v6 = WBS_LOG_CHANNEL_PREFIXBanners();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[SFStoreBanner productPage:didFailLoadWithError:].cold.1(v6, v5);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "dismissAppSuggestionBanner:", self);

}

- (void)productPage:(id)a3 willMakePurchases:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = v5;
  if (self->_affiliateData)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "setAffiliateIdentifier:", self->_affiliateData);
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }
  }

}

- (void)productPage:(id)a3 didFinishPurchase:(id)a4 withError:(id)a5
{
  id WeakRetained;

  if (!a5)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "setAppSuggestionBanner:isPinned:", self, 1);

  }
}

- (id)presentingViewControllerForLockupView:(id)a3
{
  return 0;
}

- (void)lockupView:(id)a3 didFailRequestWithError:(id)a4
{
  -[SFStoreBanner _removeAppStoreLockUpView](self, "_removeAppStoreLockUpView", a3, a4);
  -[SFStoreBanner _setUpStoreKitProductView](self, "_setUpStoreKitProductView");
}

- (void)lockupView:(id)a3 appStateDidChange:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  id *v9;
  void *v10;
  id v11;
  uint64_t v12;
  _QWORD *v13;
  void *v14;
  _QWORD *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  objc_class *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  _Unwind_Exception *v28;
  _QWORD v29[4];
  id v30;
  id location;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v32 = 0;
  v33 = (uint64_t)&v32;
  v34 = 0x2020000000;
  v9 = (id *)getASCAppStateWaitingSymbolLoc_ptr;
  v35 = (void *)getASCAppStateWaitingSymbolLoc_ptr;
  if (!getASCAppStateWaitingSymbolLoc_ptr)
  {
    v10 = (void *)AppStoreComponentsLibrary();
    v9 = (id *)dlsym(v10, "ASCAppStateWaiting");
    *(_QWORD *)(v33 + 24) = v9;
    getASCAppStateWaitingSymbolLoc_ptr = (uint64_t)v9;
  }
  _Block_object_dispose(&v32, 8);
  if (!v9)
  {
    -[SFScreenTimeOverlayViewController showBlockingViewControllerForURL:withPolicy:animated:].cold.1();
    goto LABEL_22;
  }
  v11 = *v9;
  if ((objc_msgSend(v7, "isEqualToString:", v11) & 1) != 0)
  {
    v12 = 1;
  }
  else
  {
    v32 = 0;
    v33 = (uint64_t)&v32;
    v34 = 0x2020000000;
    v13 = (_QWORD *)getASCAppStateInstallingSymbolLoc_ptr;
    v35 = (void *)getASCAppStateInstallingSymbolLoc_ptr;
    if (!getASCAppStateInstallingSymbolLoc_ptr)
    {
      v14 = (void *)AppStoreComponentsLibrary();
      v13 = dlsym(v14, "ASCAppStateInstalling");
      *(_QWORD *)(v33 + 24) = v13;
      getASCAppStateInstallingSymbolLoc_ptr = (uint64_t)v13;
    }
    _Block_object_dispose(&v32, 8);
    if (!v13)
    {
LABEL_23:
      v28 = (_Unwind_Exception *)-[SFScreenTimeOverlayViewController showBlockingViewControllerForURL:withPolicy:animated:].cold.1();
      _Block_object_dispose(&v37, 8);
      objc_destroyWeak(&location);
      _Unwind_Resume(v28);
    }
    v12 = objc_msgSend(v7, "isEqualToString:", *v13);
  }

  objc_msgSend(WeakRetained, "setAppSuggestionBanner:isPinned:", self, v12);
  if (!self->_argument)
    goto LABEL_20;
  v32 = 0;
  v33 = (uint64_t)&v32;
  v34 = 0x2020000000;
  v15 = (_QWORD *)getASCAppStateOpenableSymbolLoc_ptr;
  v35 = (void *)getASCAppStateOpenableSymbolLoc_ptr;
  if (!getASCAppStateOpenableSymbolLoc_ptr)
  {
    v16 = (void *)AppStoreComponentsLibrary();
    v15 = dlsym(v16, "ASCAppStateOpenable");
    *(_QWORD *)(v33 + 24) = v15;
    getASCAppStateOpenableSymbolLoc_ptr = (uint64_t)v15;
  }
  _Block_object_dispose(&v32, 8);
  if (!v15)
  {
LABEL_22:
    -[SFScreenTimeOverlayViewController showBlockingViewControllerForURL:withPolicy:animated:].cold.1();
    goto LABEL_23;
  }
  if (objc_msgSend(v7, "isEqualToString:", *v15))
  {
    v37 = 0;
    v38 = &v37;
    v39 = 0x2050000000;
    v17 = (void *)getASCOfferMetadataClass_softClass;
    v40 = getASCOfferMetadataClass_softClass;
    v18 = MEMORY[0x1E0C809B0];
    if (!getASCOfferMetadataClass_softClass)
    {
      v32 = MEMORY[0x1E0C809B0];
      v33 = 3221225472;
      v34 = (uint64_t)__getASCOfferMetadataClass_block_invoke;
      v35 = &unk_1E21E3330;
      v36 = &v37;
      __getASCOfferMetadataClass_block_invoke((uint64_t)&v32);
      v17 = (void *)v38[3];
    }
    v19 = objc_retainAutorelease(v17);
    _Block_object_dispose(&v37, 8);
    _WBSLocalizedString();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "textMetadataWithTitle:subtitle:", v20, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak(&location, self);
    v37 = 0;
    v38 = &v37;
    v39 = 0x2050000000;
    v22 = (void *)getASCLocalOfferClass_softClass;
    v40 = getASCLocalOfferClass_softClass;
    if (!getASCLocalOfferClass_softClass)
    {
      v32 = v18;
      v33 = 3221225472;
      v34 = (uint64_t)__getASCLocalOfferClass_block_invoke;
      v35 = &unk_1E21E3330;
      v36 = &v37;
      __getASCLocalOfferClass_block_invoke((uint64_t)&v32);
      v22 = (void *)v38[3];
    }
    v23 = objc_retainAutorelease(v22);
    _Block_object_dispose(&v37, 8);
    v24 = [v23 alloc];
    v29[0] = v18;
    v29[1] = 3221225472;
    v29[2] = __46__SFStoreBanner_lockupView_appStateDidChange___block_invoke;
    v29[3] = &unk_1E21E2AE8;
    objc_copyWeak(&v30, &location);
    v25 = (void *)objc_msgSend(v24, "initWithMetadata:action:", v21, v29);
    objc_msgSend(v6, "lockup");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "lockupWithOffer:", v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setLockup:", v27);

    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);

  }
LABEL_20:

}

void __46__SFStoreBanner_lockupView_appStateDidChange___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_openApp");

}

- (void)_openApp
{
  void *v3;
  void *v4;
  uint64_t v5;
  objc_class *v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id location[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", self->_argument);
  v14 = 0;
  v15 = &v14;
  v16 = 0x2050000000;
  v4 = (void *)getSSSoftwareLibraryClass_softClass;
  v17 = getSSSoftwareLibraryClass_softClass;
  v5 = MEMORY[0x1E0C809B0];
  if (!getSSSoftwareLibraryClass_softClass)
  {
    location[0] = (id)MEMORY[0x1E0C809B0];
    location[1] = (id)3221225472;
    location[2] = __getSSSoftwareLibraryClass_block_invoke;
    location[3] = &unk_1E21E3330;
    location[4] = &v14;
    __getSSSoftwareLibraryClass_block_invoke((uint64_t)location);
    v4 = (void *)v15[3];
  }
  v6 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v14, 8);
  v7 = objc_alloc_init(v6);
  objc_initWeak(location, self);
  v18[0] = self->_productID;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __25__SFStoreBanner__openApp__block_invoke;
  v10[3] = &unk_1E21E5D20;
  objc_copyWeak(&v12, location);
  v9 = v3;
  v11 = v9;
  objc_msgSend(v7, "getLibraryItemsForITunesStoreItemIdentifiers:completionBlock:", v8, v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(location);

}

void __25__SFStoreBanner__openApp__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id *WeakRetained;
  id *v17;
  _Unwind_Exception *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  void *v22;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v8 = (_QWORD *)getSSSoftwareLibraryItemBundleIdentifierSymbolLoc_ptr;
  v22 = (void *)getSSSoftwareLibraryItemBundleIdentifierSymbolLoc_ptr;
  if (!getSSSoftwareLibraryItemBundleIdentifierSymbolLoc_ptr)
  {
    v9 = (void *)StoreServicesLibrary();
    v8 = dlsym(v9, "SSSoftwareLibraryItemBundleIdentifier");
    v20[3] = (uint64_t)v8;
    getSSSoftwareLibraryItemBundleIdentifierSymbolLoc_ptr = (uint64_t)v8;
  }
  _Block_object_dispose(&v19, 8);
  if (!v8)
  {
    -[SFScreenTimeOverlayViewController showBlockingViewControllerForURL:withPolicy:animated:].cold.1();
    goto LABEL_18;
  }
  objc_msgSend(v7, "valueForProperty:", *v8, v19);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = v10;
    v12 = *(void **)(a1 + 32);
    if (v12)
      v13 = v12;
    v19 = 0;
    v20 = &v19;
    v21 = 0x2020000000;
    v14 = getSKUIMetricsLaunchApplicationWithIdentifierAndURLAndLaunchOptionsSymbolLoc_ptr;
    v22 = getSKUIMetricsLaunchApplicationWithIdentifierAndURLAndLaunchOptionsSymbolLoc_ptr;
    if (!getSKUIMetricsLaunchApplicationWithIdentifierAndURLAndLaunchOptionsSymbolLoc_ptr)
    {
      v15 = (void *)StoreKitUILibrary();
      v14 = dlsym(v15, "SKUIMetricsLaunchApplicationWithIdentifierAndURLAndLaunchOptions");
      v20[3] = (uint64_t)v14;
      getSKUIMetricsLaunchApplicationWithIdentifierAndURLAndLaunchOptionsSymbolLoc_ptr = v14;
    }
    _Block_object_dispose(&v19, 8);
    if (v14)
    {
      ((void (*)(id, void *, _QWORD, _QWORD, _QWORD))v14)(v11, v12, 0, 0, 0);
      if (v12)
        CFRelease(v12);
      CFRelease(v11);
      goto LABEL_16;
    }
LABEL_18:
    v18 = (_Unwind_Exception *)-[SFScreenTimeOverlayViewController showBlockingViewControllerForURL:withPolicy:animated:].cold.1();
    _Block_object_dispose(&v19, 8);
    _Unwind_Resume(v18);
  }
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v17 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained[60], "presentProductDetailsViewController");

LABEL_16:
}

- (SFAppSuggestionBannerDelegate)delegate
{
  return (SFAppSuggestionBannerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_argument, 0);
  objc_storeStrong((id *)&self->_mainDocumentURL, 0);
  objc_storeStrong((id *)&self->_affiliateData, 0);
  objc_storeStrong((id *)&self->_productID, 0);
  objc_storeStrong((id *)&self->_separator, 0);
  objc_storeStrong((id *)&self->_closeButton, 0);
  objc_storeStrong((id *)&self->_lockupView, 0);
  objc_storeStrong((id *)&self->_backdrop, 0);
  objc_storeStrong((id *)&self->_productViewController, 0);
}

- (void)productPage:(void *)a1 didFailLoadWithError:(void *)a2 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_error_impl(&dword_18B7B2000, v3, OS_LOG_TYPE_ERROR, "App Store Banner failed to load and will be dismissed: %{public}@", (uint8_t *)&v5, 0xCu);

}

@end
