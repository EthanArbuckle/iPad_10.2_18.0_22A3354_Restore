@implementation SFBrowserContentViewController

id __58___SFBrowserContentViewController_initWithNibName_bundle___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && (SFDebugMenuEnabled() & 1) != 0)
  {
    v2 = (void *)MEMORY[0x1E0DC3428];
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("trash"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "actionWithTitle:image:identifier:handler:", CFSTR("Kill View Service"), v3, 0, &__block_literal_global_51);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setAttributes:", 2);
    v5 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("PID %d"), objc_msgSend(v6, "processIdentifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setSubtitle:", v7);

    v8 = (void *)MEMORY[0x1E0DC3428];
    objc_msgSend(WeakRetained, "webView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_sf_debugKillWebProcessActionForWebView:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v10;
    v13[1] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v11;
}

uint64_t __58___SFBrowserContentViewController_initWithNibName_bundle___block_invoke_2()
{
  return objc_msgSend((id)*MEMORY[0x1E0DC4730], "terminateWithSuccess");
}

void __82___SFBrowserContentViewController_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *MEMORY[0x1E0D4F530]))
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "_sf_safariDefaults");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1856), "setJavaScriptEnabled:", objc_msgSend(v6, "_sf_javaScriptEnabled"));
  }
  else
  {
    v2 = *MEMORY[0x1E0D4F398];
    if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *MEMORY[0x1E0D4F398]))
    {
      objc_msgSend(MEMORY[0x1E0C99EA0], "_sf_safariDefaults");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1856), "_setApplePayCapabilityDisclosureAllowed:", objc_msgSend(v6, "BOOLForKey:", v2));
    }
    else
    {
      if (!objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *MEMORY[0x1E0DD9958]))
        return;
      v3 = *(void **)(a1 + 40);
      objc_msgSend(v3, "webView");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "configuration");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "websiteDataStore");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "_setUpCookieStoragePolicyForDataStore:", v5);

    }
  }

}

uint64_t __50___SFBrowserContentViewController_setDisplayMode___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_setUpTopBarAndBottomBar");
  objc_msgSend(*(id *)(a1 + 32), "_updateUI");
  objc_msgSend(*(id *)(a1 + 32), "_layOutBrowserViewForSizeTransition");
  objc_msgSend(*(id *)(a1 + 32), "_didCompleteViewSizeTransition");
  return objc_msgSend(*(id *)(a1 + 32), "setNeedsStatusBarAppearanceUpdate");
}

uint64_t __50___SFBrowserContentViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setUpInterfaceIfNeeded");
}

uint64_t __93___SFBrowserContentViewController_decideDataSharingModeAndSetUpWebViewWithCompletionHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_setUpWebViewControllerIfNeeded");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __93___SFBrowserContentViewController_decideDataSharingModeAndSetUpWebViewWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1936) = a2;
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __58___SFBrowserContentViewController__setUpInterfaceIfNeeded__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setSuppressingPreviewProgressAnimation:", 0);
}

uint64_t __86___SFBrowserContentViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_layOutBrowserViewForSizeTransition");
}

uint64_t __86___SFBrowserContentViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  --*(_QWORD *)(*(_QWORD *)(a1 + 32) + 1680);
  return objc_msgSend(*(id *)(a1 + 32), "_didCompleteViewSizeTransition");
}

void __60___SFBrowserContentViewController__updateDynamicBarGeometry__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  double v7;
  double v8;
  _QWORD *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  _QWORD *v14;
  uint64_t v15;
  id v16;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1008), "navigationBar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 1120);
  v16 = v2;
  objc_msgSend(v2, "defaultHeight");
  objc_msgSend(v3, "setTopBarHeight:forState:", 1);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 1120);
  v6 = *(unsigned __int8 *)(v4 + 1193);
  if (*(_BYTE *)(v4 + 1193))
  {
    objc_msgSend((id)v4, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "safeAreaInsets");
    v8 = -v7;
  }
  else
  {
    objc_msgSend(v16, "minimumHeight");
  }
  objc_msgSend(v5, "setTopBarHeight:forState:", 0, v8);
  if (v6)

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1120), "setBottomBarOffset:forState:", 1, 0.0);
  v9 = *(_QWORD **)(a1 + 32);
  v10 = (void *)v9[140];
  objc_msgSend(v9, "_maximumHeightObscuredByBottomBar");
  v12 = v11;
  _SFOnePixel();
  objc_msgSend(v10, "setBottomBarOffset:forState:", 0, v12 + v13);
  v14 = *(_QWORD **)(a1 + 32);
  v15 = v14[140];
  objc_msgSend(v14, "_offsetForDynamicBarAnimator");
  objc_msgSend(v14, "dynamicBarAnimator:minimumTopBarHeightForOffset:", v15);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1120), "setMinimumTopBarHeight:");

}

void __79___SFBrowserContentViewController__setShowingReader_deactivationMode_animated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  int v13;
  float minimum;
  float maximum;
  float preferred;
  double v17;
  id v18;
  uint64_t v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  _QWORD v31[4];
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  uint64_t v36;
  CAFrameRateRange v37;

  objc_msgSend(*(id *)(a1 + 32), "setUserInteractionEnabled:", 1);
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 48), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 56), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 64), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 72));
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundColor:", v3);

  v4 = 0.300000012;
  if (*(_BYTE *)(*(_QWORD *)(a1 + 40) + 1024))
    v4 = 0.0;
  objc_msgSend(v2, "setAlpha:", v4);
  v5 = *(_QWORD *)(a1 + 40);
  if (*(_BYTE *)(v5 + 1024))
  {
    objc_msgSend(*(id *)(a1 + 48), "addSubview:", v2);
  }
  else
  {
    objc_msgSend(*(id *)(v5 + 1008), "contentContainerView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "insertSubview:belowSubview:", v2, *(_QWORD *)(a1 + 48));

  }
  v7 = (void *)MEMORY[0x1E0DC3F10];
  v8 = MEMORY[0x1E0C809B0];
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __79___SFBrowserContentViewController__setShowingReader_deactivationMode_animated___block_invoke_2;
  v34[3] = &unk_1E4AC0590;
  v9 = v2;
  v10 = *(_QWORD *)(a1 + 40);
  v35 = v9;
  v36 = v10;
  v31[0] = v8;
  v31[1] = 3221225472;
  v31[2] = __79___SFBrowserContentViewController__setShowingReader_deactivationMode_animated___block_invoke_3;
  v31[3] = &unk_1E4AC5E28;
  v11 = v9;
  v32 = v11;
  v33 = *(id *)(a1 + 48);
  objc_msgSend(v7, "animateWithDuration:delay:options:animations:completion:", 0, v34, v31, 0.3, 0.0);
  v12 = (void *)MEMORY[0x1E0DC3F10];
  v13 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 1024);
  v37 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  minimum = v37.minimum;
  maximum = v37.maximum;
  preferred = v37.preferred;
  if (v13)
    v17 = 0.15;
  else
    v17 = 0.0;
  v26[0] = v8;
  v26[1] = 3221225472;
  v26[2] = __79___SFBrowserContentViewController__setShowingReader_deactivationMode_animated___block_invoke_4;
  v26[3] = &unk_1E4AC5E50;
  v18 = *(id *)(a1 + 56);
  v30 = *(_QWORD *)(a1 + 64);
  v19 = *(_QWORD *)(a1 + 40);
  v20 = *(void **)(a1 + 48);
  v27 = v18;
  v28 = v19;
  v29 = v20;
  v24[0] = v8;
  v24[1] = 3221225472;
  v24[2] = __79___SFBrowserContentViewController__setShowingReader_deactivationMode_animated___block_invoke_5;
  v24[3] = &unk_1E4AC5E78;
  v25 = *(id *)(a1 + 48);
  *(float *)&v21 = minimum;
  *(float *)&v22 = maximum;
  *(float *)&v23 = preferred;
  objc_msgSend(v12, "sf_animateUsingDefaultDampedSpringWithDelay:initialSpringVelocity:options:preferredFrameRateRange:animations:completion:", 0, v26, v24, v17, 0.0, v21, v22, v23);

}

uint64_t __79___SFBrowserContentViewController__setShowingReader_deactivationMode_animated___block_invoke_2(uint64_t a1)
{
  double v1;

  v1 = 0.300000012;
  if (!*(_BYTE *)(*(_QWORD *)(a1 + 40) + 1024))
    v1 = 0.0;
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", v1);
}

void __79___SFBrowserContentViewController__setShowingReader_deactivationMode_animated___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "superview");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);

  if (v2 != v3)
    objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

uint64_t __79___SFBrowserContentViewController__setShowingReader_deactivationMode_animated___block_invoke_4(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;

  objc_msgSend(*(id *)(a1 + 32), "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v10 = *(double *)(v9 + 72);
  v11 = *(double *)(v9 + 56);
  if (*(_BYTE *)(*(_QWORD *)(a1 + 40) + 1024))
  {
    *(double *)(v9 + 56) = v10 + v11;
    v12 = v2 - v10;
  }
  else
  {
    *(double *)(v9 + 56) = v11 - v10;
    v12 = v2 + v10;
  }
  objc_msgSend(*(id *)(a1 + 48), "setFrame:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 48), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 56), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 64), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 72));
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", v4, v12, v6, v8);
}

uint64_t __79___SFBrowserContentViewController__setShowingReader_deactivationMode_animated___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

void __47___SFBrowserContentViewController_loadRequest___block_invoke(uint64_t a1, void *a2)
{
  _QWORD block[4];
  id v5;
  id v6[2];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47___SFBrowserContentViewController_loadRequest___block_invoke_2;
  block[3] = &unk_1E4AC5EC8;
  objc_copyWeak(v6, (id *)(a1 + 40));
  v6[1] = a2;
  v5 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(v6);
}

void __47___SFBrowserContentViewController_loadRequest___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v2 = *(_QWORD *)(a1 + 48);
    if ((unint64_t)(v2 - 1) < 2)
    {
      objc_msgSend(WeakRetained, "webView");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (id)objc_msgSend(v3, "loadRequest:", *(_QWORD *)(a1 + 32));
LABEL_6:

      goto LABEL_7;
    }
    if (!v2)
    {
      v5 = (void *)MEMORY[0x1E0C92C80];
      objc_msgSend(WeakRetained, "_fallbackURLForWellKnownChangePasswordURL:", WeakRetained[184]);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "safari_nonAppInitiatedRequestWithURL:", v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "loadRequest:", v6);

      goto LABEL_6;
    }
  }
LABEL_7:

}

void __50___SFBrowserContentViewController__updateBarItems__block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1096), "setBarItem:enabled:", 0, objc_msgSend(*(id *)(a1 + 40), "canGoBack"));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1096), "setBarItem:enabled:", 1, objc_msgSend(*(id *)(a1 + 40), "canGoForward"));
  objc_msgSend(*(id *)(a1 + 40), "URL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1096), "setBarItem:enabled:", 6, v2 != 0);
  v3 = *(_QWORD **)(a1 + 32);
  v4 = (void *)v3[137];
  if (v2)
    v5 = objc_msgSend(v3, "isSafariRestricted") ^ 1;
  else
    v5 = 0;
  objc_msgSend(v4, "setBarItem:enabled:", 9, v5);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1096), "setBarItem:hidden:", 10, *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 1544) == 0);
  v6 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v6 + 1544))
  {
    objc_msgSend(*(id *)(v6 + 1912), "activityButton");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "accessibilityLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = v7;
    }
    else
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1536), "activityTitle");
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v10 = v9;

    v11 = *(void **)(*(_QWORD *)(a1 + 32) + 1096);
    objc_msgSend(v13, "templateImage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setCustomActivityImage:accessibilityLabel:", v12, v10);

    v6 = *(_QWORD *)(a1 + 32);
  }
  objc_msgSend(*(id *)(v6 + 1152), "overlayConfiguration");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1096), "setAllBarItemsAreDisabled:", v14 != 0);

}

void __70___SFBrowserContentViewController__setShowingPinnableBanner_animated___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "_updateCurrentScrollViewInsets");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1008), "currentWebView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scrollView");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "contentOffset");
  v4 = v3;
  v6 = v5;
  objc_msgSend(v9, "adjustedContentInset");
  if (v6 <= -v7)
    v8 = -v7;
  else
    v8 = v6;
  objc_msgSend(v9, "setContentOffset:", v4, v8);

}

uint64_t __70___SFBrowserContentViewController__setShowingPinnableBanner_animated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1008), "setPinnableBanner:", 0);
}

void __61___SFBrowserContentViewController__showCrashBanner_animated___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "_currentWebView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scrollView");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "center");
  v4 = v3;
  objc_msgSend(*(id *)(a1 + 32), "_updateCrashBannerOffset");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1008), "layoutIfNeeded");
  objc_msgSend(v10, "contentOffset");
  v6 = v5;
  v8 = v7;
  objc_msgSend(*(id *)(a1 + 40), "center");
  objc_msgSend(v10, "setContentOffset:", v6, v8 - (v9 - v4));

}

uint64_t __61___SFBrowserContentViewController__showCrashBanner_animated___block_invoke_2(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v2 + 1224))
  {
    objc_msgSend(*(id *)(v2 + 1008), "setCrashBanner:", 0);
    v2 = *(_QWORD *)(a1 + 32);
  }
  return objc_msgSend((id)v2, "_updateCurrentScrollViewInsets");
}

void __64___SFBrowserContentViewController__updatePageZoomWithPreference__block_invoke(uint64_t a1, double a2)
{
  _QWORD v3[4];
  id v4[2];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __64___SFBrowserContentViewController__updatePageZoomWithPreference__block_invoke_2;
  v3[3] = &unk_1E4AC5EF0;
  objc_copyWeak(v4, (id *)(a1 + 32));
  v4[1] = *(id *)&a2;
  dispatch_async(MEMORY[0x1E0C80D38], v3);
  objc_destroyWeak(v4);
}

void __64___SFBrowserContentViewController__updatePageZoomWithPreference__block_invoke_2(uint64_t a1)
{
  double v1;
  void *v2;
  id WeakRetained;

  v1 = *(double *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "webView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setViewScale:", v1);

}

void __59___SFBrowserContentViewController__increasePageZoomSetting__block_invoke(uint64_t a1, int a2, double a3)
{
  void *v5;
  _QWORD v6[4];
  id v7[2];

  if (a2)
  {
    objc_msgSend(MEMORY[0x1E0D8A758], "sharedLogger");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "didModifyPerSitePreferencesWithPreferenceIdentifier:modificationLevel:type:method:", *MEMORY[0x1E0D8B790], 1, 0, 3);

    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __59___SFBrowserContentViewController__increasePageZoomSetting__block_invoke_2;
    v6[3] = &unk_1E4AC5EF0;
    objc_copyWeak(v7, (id *)(a1 + 32));
    v7[1] = *(id *)&a3;
    dispatch_async(MEMORY[0x1E0C80D38], v6);
    objc_destroyWeak(v7);
  }
}

void __59___SFBrowserContentViewController__increasePageZoomSetting__block_invoke_2(uint64_t a1)
{
  double v1;
  void *v2;
  id WeakRetained;

  v1 = *(double *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "webView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setViewScale:", v1);

}

void __59___SFBrowserContentViewController__decreasePageZoomSetting__block_invoke(uint64_t a1, int a2, double a3)
{
  void *v5;
  _QWORD v6[4];
  id v7[2];

  if (a2)
  {
    objc_msgSend(MEMORY[0x1E0D8A758], "sharedLogger");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "didModifyPerSitePreferencesWithPreferenceIdentifier:modificationLevel:type:method:", *MEMORY[0x1E0D8B790], 1, 0, 3);

    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __59___SFBrowserContentViewController__decreasePageZoomSetting__block_invoke_2;
    v6[3] = &unk_1E4AC5EF0;
    objc_copyWeak(v7, (id *)(a1 + 32));
    v7[1] = *(id *)&a3;
    dispatch_async(MEMORY[0x1E0C80D38], v6);
    objc_destroyWeak(v7);
  }
}

void __59___SFBrowserContentViewController__decreasePageZoomSetting__block_invoke_2(uint64_t a1)
{
  double v1;
  void *v2;
  id WeakRetained;

  v1 = *(double *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "webView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setViewScale:", v1);

}

void __56___SFBrowserContentViewController__resetPageZoomSetting__block_invoke(uint64_t a1, int a2, double a3)
{
  void *v5;
  _QWORD v6[4];
  id v7[2];

  if (a2)
  {
    objc_msgSend(MEMORY[0x1E0D8A758], "sharedLogger");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "didModifyPerSitePreferencesWithPreferenceIdentifier:modificationLevel:type:method:", *MEMORY[0x1E0D8B790], 1, 1, 3);

    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __56___SFBrowserContentViewController__resetPageZoomSetting__block_invoke_2;
    v6[3] = &unk_1E4AC5EF0;
    objc_copyWeak(v7, (id *)(a1 + 32));
    v7[1] = *(id *)&a3;
    dispatch_async(MEMORY[0x1E0C80D38], v6);
    objc_destroyWeak(v7);
  }
}

void __56___SFBrowserContentViewController__resetPageZoomSetting__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  id v11;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v11 = WeakRetained;
    objc_msgSend(WeakRetained, "webView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_setViewScale:", *(double *)(a1 + 40));
    objc_msgSend(v11, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_minimumEffectiveDeviceWidth");
    if (v5 == 0.0)
    {
      v9 = 1.0;
    }
    else
    {
      objc_msgSend(v4, "bounds");
      v7 = v6;
      objc_msgSend(v3, "_minimumEffectiveDeviceWidth");
      v9 = v7 / v8;
    }
    objc_msgSend(v3, "scrollView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setZoomScale:", v9);

    WeakRetained = v11;
  }

}

void __56___SFBrowserContentViewController__invokeCustomActivity__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  _QWORD *v5;
  _SFSafariSharingExtensionController *v6;
  uint64_t v7;
  void *v8;
  _BYTE *v9;
  void *v10;
  void *v11;
  _SFActivityViewController *v12;
  void *v13;
  _SFActivityViewController *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  _BYTE location[12];
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v24 = a2;
  objc_msgSend(*(id *)(a1 + 32), "webViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "webView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *(_QWORD **)(a1 + 32);
  if (!v5[161])
  {
    v6 = -[_SFSafariSharingExtensionController initWithWebView:]([_SFSafariSharingExtensionController alloc], "initWithWebView:", v4);
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 1288);
    *(_QWORD *)(v7 + 1288) = v6;

    v5 = *(_QWORD **)(a1 + 32);
  }
  objc_msgSend(v5, "_hostAppBundleId");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_BYTE **)(a1 + 32);
  if (v9[1544])
  {
    objc_msgSend(v4, "title");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_itemProviderCollectionForSharingURL:title:", v24, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = [_SFActivityViewController alloc];
    objc_msgSend(v4, "URL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[_SFActivityViewController initWithActivityItemProviderCollection:applicationActivities:sharingURL:sourceURL:](v12, "initWithActivityItemProviderCollection:applicationActivities:sharingURL:sourceURL:", v11, 0, v24, v13);

    -[_SFActivityViewController setSharingExtensionController:](v14, "setSharingExtensionController:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1288));
    objc_initWeak((id *)location, v14);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1912), "activityButton");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "extensionIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __56___SFBrowserContentViewController__invokeCustomActivity__block_invoke_235;
    v25[3] = &unk_1E4AC5F68;
    objc_copyWeak(&v27, (id *)location);
    v17 = v16;
    v26 = v17;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1536), "setCustomCompletionHandler:", v25);
    -[_SFActivityViewController prepareJavaScriptExtensionItemForActivity:](v14, "prepareJavaScriptExtensionItemForActivity:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1536));
    v18 = *(void **)(*(_QWORD *)(a1 + 32) + 1536);
    -[_SFActivityViewController activityItemProviders](v14, "activityItemProviders");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "prepareWithActivityItems:", v19);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1536), "_presentActivityOnViewController:animated:completion:");
    objc_destroyWeak(&v27);

    objc_destroyWeak((id *)location);
  }
  else
  {
    v20 = (id)WBS_LOG_CHANNEL_PREFIXExtensions();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1912), "activityButton");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "extensionIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 138543618;
      *(_QWORD *)&location[4] = v22;
      v29 = 2114;
      v30 = v23;
      _os_log_error_impl(&dword_1A3B2D000, v20, OS_LOG_TYPE_ERROR, "Can't run extension '%{public}@' because it isn't part of the app '%{public}@'", location, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 32), "_updateUI");
  }

}

void __56___SFBrowserContentViewController__invokeCustomActivity__block_invoke_235(uint64_t a1, unsigned int a2, void *a3, uint64_t a4)
{
  id *v7;
  id v8;
  id WeakRetained;
  uint64_t v10;
  id v11;

  v7 = (id *)(a1 + 40);
  v8 = a3;
  WeakRetained = objc_loadWeakRetained(v7);
  if (a4)
    v10 = 0;
  else
    v10 = a2;
  v11 = WeakRetained;
  objc_msgSend(WeakRetained, "activityDidComplete:withReturnedItems:success:", *(_QWORD *)(a1 + 32), v8, v10);

}

void __56___SFBrowserContentViewController__invokeCustomActivity__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = (id)WBS_LOG_CHANNEL_PREFIXExtensions();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1912), "activityButton");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "extensionIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138543362;
    v6 = v4;
    _os_log_impl(&dword_1A3B2D000, v2, OS_LOG_TYPE_INFO, "Presented extension '%{public}@' from a custom toolbar button", (uint8_t *)&v5, 0xCu);

  }
}

void __51___SFBrowserContentViewController__checkForAppLink__block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  id v11[2];
  char v12;

  objc_msgSend(*(id *)(a1 + 32), "synchronousTargetApplicationProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51___SFBrowserContentViewController__checkForAppLink__block_invoke_2;
  v7[3] = &unk_1E4AC5FE0;
  objc_copyWeak(v11, (id *)(a1 + 48));
  v5 = *(id *)(a1 + 40);
  v11[1] = a2;
  v8 = v5;
  v9 = v4;
  v10 = *(id *)(a1 + 32);
  v12 = *(_BYTE *)(a1 + 56);
  v6 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

  objc_destroyWeak(v11);
}

void __51___SFBrowserContentViewController__checkForAppLink__block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  unsigned __int8 v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *);
  void *v22;
  id v23;
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "backForwardList");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "currentItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)*((_QWORD *)WeakRetained + 204);

    if (v5 == v6)
    {
      objc_msgSend(*((id *)WeakRetained + 126), "pinnableBanner");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 64);
      v9 = atomic_load((unsigned __int8 *)&_ZGVZZZ51___SFBrowserContentViewController__checkForAppLink_EUb0_EUb1_E24systemServiceIdentifiers);
      if ((v9 & 1) == 0
        && __cxa_guard_acquire(&_ZGVZZZ51___SFBrowserContentViewController__checkForAppLink_EUb0_EUb1_E24systemServiceIdentifiers))
      {
        v18 = *MEMORY[0x1E0D8AEE0];
        v24[0] = *MEMORY[0x1E0D8AF20];
        v24[1] = v18;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
        _ZZZZ51___SFBrowserContentViewController__checkForAppLink_EUb0_EUb1_E24systemServiceIdentifiers = objc_claimAutoreleasedReturnValue();
        __cxa_guard_release(&_ZGVZZZ51___SFBrowserContentViewController__checkForAppLink_EUb0_EUb1_E24systemServiceIdentifiers);
      }
      if ((unint64_t)(v8 - 1) > 2
        || (v10 = _ZZZZ51___SFBrowserContentViewController__checkForAppLink_EUb0_EUb1_E24systemServiceIdentifiers,
            objc_msgSend(*(id *)(a1 + 40), "bundleIdentifier"),
            v11 = (void *)objc_claimAutoreleasedReturnValue(),
            LOBYTE(v10) = objc_msgSend((id)v10, "containsObject:", v11),
            v11,
            (v10 & 1) != 0))
      {
        v12 = v7;
      }
      else
      {
        v13 = objc_alloc(MEMORY[0x1E0D4EBB0]);
        v14 = *(_QWORD *)(a1 + 48);
        v19 = MEMORY[0x1E0C809B0];
        v20 = 3221225472;
        v21 = __51___SFBrowserContentViewController__checkForAppLink__block_invoke_3;
        v22 = &unk_1E4AC5FB8;
        objc_copyWeak(&v23, v2);
        v12 = (id)objc_msgSend(v13, "initWithAppLink:openActionHandler:", v14, &v19);
        objc_msgSend(v12, "setInitiallyBehindNavigationBar:", *(_BYTE *)(a1 + 72) == 0, v19, v20, v21, v22);
        objc_destroyWeak(&v23);
      }
      v15 = (void *)*((_QWORD *)WeakRetained + 204);
      *((_QWORD *)WeakRetained + 204) = 0;

      if (v12)
      {
        objc_msgSend(WeakRetained, "webViewController");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "didFirstPaint");

        if (v17)
          objc_msgSend(WeakRetained, "_setShowingPinnableBanner:animated:", v12, 0);
        else
          objc_storeStrong((id *)WeakRetained + 157, v12);
      }
      else
      {
        objc_msgSend(WeakRetained, "_setShowingPinnableBanner:animated:", 0, 0);
      }

    }
  }

}

void __51___SFBrowserContentViewController__checkForAppLink__block_invoke_3(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;
  void *v5;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0DAB530]);
    objc_msgSend(v6, "appLink");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "openExternallyWithWebBrowserState:referrerURL:completionHandler:", v4, 0, 0);

  }
}

void __81___SFBrowserContentViewController_webViewController_didFindAppBannerWithContent___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void (**v5)(_QWORD);
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  uint64_t v13;
  id v14;

  v3 = a2;
  objc_msgSend(v3, "setDelegate:", *(_QWORD *)(a1 + 32));
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __81___SFBrowserContentViewController_webViewController_didFindAppBannerWithContent___block_invoke_2;
  v12 = &unk_1E4AC0590;
  v13 = *(_QWORD *)(a1 + 32);
  v4 = v3;
  v14 = v4;
  v5 = (void (**)(_QWORD))MEMORY[0x1A8598C40](&v9);
  objc_msgSend(v4, "overlayProvider", v9, v10, v11, v12, v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v4, "overlayProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "perSitePreferencesVendor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "requestOverlayWithPreferencesVendor:completion:", v8, v5);

  }
  else
  {
    v5[2](v5);
  }

}

void __81___SFBrowserContentViewController_webViewController_didFindAppBannerWithContent___block_invoke_2(uint64_t a1)
{
  void *v2;
  int v3;

  objc_msgSend(*(id *)(a1 + 32), "webViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "didFirstPaint");

  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "_setShowingPinnableBanner:animated:", *(_QWORD *)(a1 + 40), 0);
  else
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1256), *(id *)(a1 + 40));
}

void __89___SFBrowserContentViewController_webViewControllerDidDetermineReaderAvailability_dueTo___block_invoke(uint64_t a1, char a2)
{
  _QWORD v3[4];
  id v4;
  char v5;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __89___SFBrowserContentViewController_webViewControllerDidDetermineReaderAvailability_dueTo___block_invoke_2;
  v3[3] = &unk_1E4AC6058;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  v5 = a2;
  dispatch_async(MEMORY[0x1E0C80D38], v3);
  objc_destroyWeak(&v4);
}

void __89___SFBrowserContentViewController_webViewControllerDidDetermineReaderAvailability_dueTo___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  void *v4;
  void *v5;
  int v6;
  char v7;
  id *v8;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v8 = WeakRetained;
    if (*(_BYTE *)(a1 + 40))
    {
      objc_msgSend(WeakRetained, "webViewController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "readerController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v5, "isReaderAvailable"))
      {

        goto LABEL_9;
      }
      v6 = *((unsigned __int8 *)v8 + 1024);

      v3 = v8;
      if (!v6)
      {
        objc_msgSend(v8[144], "setShowsReaderButton:showsAvailabilityText:", 1, 0);
        objc_msgSend(v8, "_showReaderAnimated:", v8[230] == 0);
        v7 = objc_msgSend(v8, "isBlockedByScreenTime");
        v3 = v8;
        if ((v7 & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0D8A758], "sharedLogger");
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "didActivateReaderWithTrigger:", 1);
LABEL_9:

          v3 = v8;
        }
      }
    }
    else
    {
      objc_msgSend(WeakRetained[144], "setShowsReaderButton:showsAvailabilityText:", 1, 1);
      v3 = v8;
    }
  }

}

void __89___SFBrowserContentViewController_webViewController_didExtractTextSamplesForTranslation___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __89___SFBrowserContentViewController_webViewController_didExtractTextSamplesForTranslation___block_invoke_2;
  block[3] = &unk_1E4AC23B0;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  v6 = v3;
  v7 = *(id *)(a1 + 32);
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v8);
}

void __89___SFBrowserContentViewController_webViewController_didExtractTextSamplesForTranslation___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*(_QWORD *)(a1 + 32))
    {
      v8 = WeakRetained;
      v4 = objc_msgSend(WeakRetained, "allowsBrowsingAssistant");
      v3 = v8;
      if (v4)
      {
        objc_msgSend(v8, "assistantController");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "webView");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "URL");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "checkForAssistantContentFromPegasusForURL:locale:", v7, *(_QWORD *)(a1 + 32));

        v3 = v8;
      }
    }
  }

}

void __140___SFBrowserContentViewController__queueAlertForRedirectToExternalNavigationResult_fromOriginalRequest_isMainFrame_promptPolicy_userAction___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v4 = *(void **)(a1 + 32);
    if (a2)
    {
      if (!objc_msgSend(v4, "appliesOneTimeUserInitiatedActionPolicy")
        || objc_msgSend(*(id *)(a1 + 32), "externalApplicationCategory") == 2)
      {
        WeakRetained[136] &= ~8uLL;
      }
      objc_msgSend(WeakRetained, "_completeRedirectToExternalNavigationResult:fromOriginalRequest:dialogResult:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), a2);
    }
    else
    {
      if (!objc_msgSend(v4, "appliesOneTimeUserInitiatedActionPolicy")
        || objc_msgSend(*(id *)(a1 + 32), "externalApplicationCategory") == 2)
      {
        WeakRetained[136] = 0;
      }
      objc_msgSend(WeakRetained, "_redirectToExternalNavigationResult:fromOriginalRequest:promptPolicy:isMainFrame:userAction:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 0, *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 48));
    }
    v5 = MEMORY[0x1A8598C40](WeakRetained[202]);
    v6 = (void *)v5;
    if (v5)
      (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, 1);

  }
}

void __127___SFBrowserContentViewController__redirectToExternalNavigationResult_fromOriginalRequest_promptPolicy_isMainFrame_userAction___block_invoke(uint64_t a1, char a2)
{
  _BYTE *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[5];
  id v10;
  id v11;

  v3 = *(_BYTE **)(a1 + 32);
  if ((a2 & 1) != 0)
  {
    objc_msgSend(v3, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "windowScene");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __127___SFBrowserContentViewController__redirectToExternalNavigationResult_fromOriginalRequest_promptPolicy_isMainFrame_userAction___block_invoke_2;
    v9[3] = &unk_1E4AC2EB0;
    v7 = *(_QWORD *)(a1 + 40);
    v9[4] = *(_QWORD *)(a1 + 32);
    v10 = *(id *)(a1 + 48);
    v11 = *(id *)(a1 + 56);
    objc_msgSend(v6, "_sf_openTelURL:completionHandler:", v7, v9);

  }
  else
  {
    v3[1312] = 0;
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1616);
    if (v8)
      (*(void (**)(uint64_t, uint64_t))(v8 + 16))(v8, 1);
  }
}

uint64_t __127___SFBrowserContentViewController__redirectToExternalNavigationResult_fromOriginalRequest_promptPolicy_isMainFrame_userAction___block_invoke_2(uint64_t a1, int a2)
{
  void *v3;
  uint64_t result;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1312) = 0;
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 1320);
  if (a2)
  {
    objc_msgSend(v3, "userAcceptedCallPrompt");
    objc_msgSend(*(id *)(a1 + 32), "_completeRedirectToExternalNavigationResult:fromOriginalRequest:dialogResult:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0);
  }
  else
  {
    objc_msgSend(v3, "userDeclinedCallPrompt");
  }
  result = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1616);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

uint64_t __127___SFBrowserContentViewController__redirectToExternalNavigationResult_fromOriginalRequest_promptPolicy_isMainFrame_userAction___block_invoke_3(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "_completeRedirectToExternalNavigationResult:fromOriginalRequest:dialogResult:", *(_QWORD *)(result + 40), *(_QWORD *)(result + 48), 0);
  return result;
}

uint64_t __101___SFBrowserContentViewController_resultOfLoadingRequest_inMainFrame_disallowRedirectToExternalApps___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "webView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_committedURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "_sf_shouldOverrideiCloudSharingURL:withAppRedirectURL:referrerURL:loadedUsingDesktopUserAgent:", v5, v3, v7, objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1848), "loadedUsingDesktopUserAgent"));

  return v8;
}

uint64_t __129___SFBrowserContentViewController__determineResultOfLoadingRequest_inMainFrame_disallowRedirectToExternalApps_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "_sf_shouldOverrideiCloudSharingURL:withAppRedirectURL:referrerURL:loadedUsingDesktopUserAgent:", v5, v3, *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));

  return v6;
}

void __108___SFBrowserContentViewController__redirectToNewsIfNeededForRequest_isMainFrame_userAction_decisionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;

  if ((unint64_t)(a2 + 1) <= 4)
  {
    if (((1 << (a2 + 1)) & 0xB) != 0)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
      v3 = *(void **)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "URL");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "_didResolveDestinationURL:pendingAppLinkCheck:");
    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
      v4 = *(void **)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 48), "url");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_didResolveDestinationURL:pendingAppLinkCheck:");

      v5 = *(void **)(a1 + 32);
      +[_SFNavigationResult resultWithAppLink:](_SFNavigationResult, "resultWithAppLink:", *(_QWORD *)(a1 + 48));
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_redirectToExternalNavigationResult:fromOriginalRequest:promptPolicy:isMainFrame:userAction:");
    }

  }
}

void __101___SFBrowserContentViewController_webViewController_decidePolicyForNavigationAction_decisionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  _QWORD *WeakRetained;
  NSObject *v7;
  uint64_t v8;
  int v9;
  _QWORD *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_didDecideNavigationPolicy:forNavigationAction:", a2, *(_QWORD *)(a1 + 32));
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if (WeakRetained)
  {
    if (*(_BYTE *)(a1 + 56))
    {
      --WeakRetained[200];
      v7 = WBS_LOG_CHANNEL_PREFIXPageLoading();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v8 = WeakRetained[200];
        v9 = 134218240;
        v10 = WeakRetained;
        v11 = 2048;
        v12 = v8;
        _os_log_impl(&dword_1A3B2D000, v7, OS_LOG_TYPE_INFO, "(%p) Concurrent navigation action policy decisions: %zd", (uint8_t *)&v9, 0x16u);
      }
    }
  }

}

void __110___SFBrowserContentViewController__internalWebViewController_decidePolicyForNavigationAction_decisionHandler___block_invoke(uint64_t a1, int a2)
{
  _QWORD *WeakRetained;
  void *v5;
  void *v6;
  int v7;
  _QWORD *v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    (id)MEMORY[0x1A8598C40](WeakRetained[202]);
    v5 = (void *)v8[202];
    v8[202] = 0;

    WeakRetained = v8;
  }
  if (a2
    && (objc_msgSend(WeakRetained, "webViewController"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "isLoading"),
        v6,
        !v7))
  {
    objc_msgSend(v8, "webViewController:decidePolicyForNavigationAction:decisionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __110___SFBrowserContentViewController__internalWebViewController_decidePolicyForNavigationAction_decisionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id *v4;
  id WeakRetained;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14[2];
  char v15;

  v4 = (id *)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (!WeakRetained || a2 && objc_msgSend(*(id *)(a1 + 32), "_sf_shouldPerformDownload"))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    objc_msgSend(WeakRetained, "_navigationUtilitiesManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 40);
    v8 = *(unsigned __int8 *)(a1 + 72);
    v9 = *(_QWORD *)(a1 + 64);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __110___SFBrowserContentViewController__internalWebViewController_decidePolicyForNavigationAction_decisionHandler___block_invoke_3;
    v11[3] = &unk_1E4AC61E8;
    objc_copyWeak(v14, v4);
    v13 = *(id *)(a1 + 48);
    v10 = *(id *)(a1 + 40);
    v15 = *(_BYTE *)(a1 + 72);
    v12 = v10;
    v14[1] = a2;
    objc_msgSend(v6, "websitePoliciesForURL:isForMainFrameNavigation:navigationType:completionHandler:", v7, v8, v9, v11);

    objc_destroyWeak(v14);
  }

}

void __110___SFBrowserContentViewController__internalWebViewController_decidePolicyForNavigationAction_decisionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id *WeakRetained;
  id *v4;
  _BOOL8 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  char v11;
  unsigned int v12;
  unsigned int v13;
  uint64_t v14;
  id *v15;
  unsigned int v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  id v24;
  uint64_t v25;
  int v26;
  int v27;
  id v28;
  uint64_t v29;
  id v30;

  v30 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (!WeakRetained)
    goto LABEL_39;
  v4 = WeakRetained + 170;
  if (objc_msgSend(*(id *)(a1 + 32), "isEqual:", WeakRetained[170]))
  {
    *((_BYTE *)WeakRetained + 1369) = *((_BYTE *)WeakRetained + 1368) ^ 1;
    v5 = *((_BYTE *)WeakRetained + 1368) == 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "host");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safari_highLevelDomainFromHost");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*v4, "host");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "safari_highLevelDomainFromHost");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "isEqualToString:", v9);

    if (!v10)
    {
      if (*(_BYTE *)(a1 + 64))
      {
        v17 = *v4;
        *v4 = 0;

        objc_msgSend(WeakRetained, "_navigationUtilitiesManager");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *((_BYTE *)WeakRetained + 1352) = objc_msgSend(v18, "isContentBlockersPerSiteSettingEnabled");

      }
      goto LABEL_8;
    }
    objc_storeStrong(WeakRetained + 170, *(id *)(a1 + 32));
    v5 = *((_BYTE *)WeakRetained + 1369) != 0;
  }
  objc_msgSend(v30, "_setContentBlockersEnabled:", v5);
LABEL_8:
  v11 = objc_msgSend(*(id *)(a1 + 32), "safari_isSafariWebExtensionURL");
  v12 = objc_msgSend(WeakRetained, "supportsAdvancedPrivacyProtectionsForURL:", *(_QWORD *)(a1 + 32));
  if ((v11 & 1) == 0)
  {
    v13 = v12;
    v14 = objc_msgSend(WeakRetained, "isPrivateBrowsingEnabled");
    v15 = WeakRetained + 214;
    if (objc_msgSend(*(id *)(a1 + 32), "isEqual:", WeakRetained[214]))
    {
      *((_BYTE *)WeakRetained + 1721) = *((_BYTE *)WeakRetained + 1720) ^ 1;
      v16 = *((_BYTE *)WeakRetained + 1720) == 0;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "host");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "safari_highLevelDomainFromHost");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*v15, "host");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "safari_highLevelDomainFromHost");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v20, "isEqualToString:", v22);

      if (v23)
      {
        objc_storeStrong(WeakRetained + 214, *(id *)(a1 + 32));
        v16 = *((_BYTE *)WeakRetained + 1721) != 0;
      }
      else
      {
        v16 = *(unsigned __int8 *)(a1 + 64);
        if (*(_BYTE *)(a1 + 64))
        {
          v24 = *v15;
          *v15 = 0;

          v16 = v13;
        }
      }
    }
    if (*((unsigned __int8 *)WeakRetained + 1722) == v13)
      v25 = v16;
    else
      v25 = v13;
    *((_BYTE *)WeakRetained + 1722) = v13;
    objc_msgSend(v30, "safari_setAdvancedPrivacyProtectionsEnabled:privateBrowsing:", v25, v14);
  }
  v26 = objc_opt_respondsToSelector();
  v27 = objc_msgSend(*(id *)(a1 + 32), "safari_hasSameSiteAsURL:", WeakRetained[172]);
  if ((!v27 || *((_BYTE *)WeakRetained + 1386))
    && *(_BYTE *)(a1 + 64)
    && (objc_msgSend(WeakRetained, "isShowingErrorPage") & 1) == 0)
  {
    v28 = WeakRetained[172];
    WeakRetained[172] = 0;

    *((_BYTE *)WeakRetained + 1801) = 0;
    *((_BYTE *)WeakRetained + 1386) = 0;
  }
  else if ((objc_msgSend(*(id *)(a1 + 32), "isEqual:", WeakRetained[172]) & v26) == 1)
  {
    objc_msgSend(v30, "_setAllowPrivacyProxy:", *((_BYTE *)WeakRetained + 1384) == 0);
    *((_BYTE *)WeakRetained + 1385) = *((_BYTE *)WeakRetained + 1384) ^ 1;
  }
  else if ((v27 & v26) == 1)
  {
    objc_msgSend(v30, "_setAllowPrivacyProxy:", *((unsigned __int8 *)WeakRetained + 1385));
  }
  if (*(_BYTE *)(a1 + 64))
  {
    if (objc_msgSend(WeakRetained, "supportsAdvancedPrivacyProtectionsForURL:", *(_QWORD *)(a1 + 32)))
      objc_msgSend(v30, "_setNetworkConnectionIntegrityPolicy:", objc_msgSend(v30, "_networkConnectionIntegrityPolicy") | 0x10);
    if (*(_BYTE *)(a1 + 64))
    {
      *((_BYTE *)WeakRetained + 1352) = objc_msgSend(v30, "_contentBlockersEnabled");
      if ((v26 & 1) != 0)
        *((_BYTE *)WeakRetained + 1800) = objc_msgSend(v30, "_allowPrivacyProxy");
      v29 = objc_msgSend(v30, "safari_areAdvancedPrivacyProtectionsEnabled");
      *((_BYTE *)WeakRetained + 1802) = v29;
      objc_msgSend(MEMORY[0x1E0D8A888], "determineContentRuleListStateForWebpagePreferences:wasLoadedWithContentBlockersEnabled:wasLoadedWithAdvancedPrivacyProtectionsEnabled:", v30, *((unsigned __int8 *)WeakRetained + 1352), v29);
      if (objc_msgSend(MEMORY[0x1E0D8AD68], "isLockdownModeEnabledForSafari")
        && (objc_opt_respondsToSelector() & 1) != 0)
      {
        *((_BYTE *)WeakRetained + 1689) = objc_msgSend(v30, "_captivePortalModeEnabled");
      }
    }
  }
LABEL_39:
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __110___SFBrowserContentViewController__internalWebViewController_decidePolicyForNavigationAction_decisionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_internalWebViewController:decidePolicyForNavigationAction:withResult:decisionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v5, *(_QWORD *)(a1 + 56));
  else
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

uint64_t __103___SFBrowserContentViewController_webViewController_decidePolicyForNavigationResponse_decisionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "_didDecideNavigationPolicy:forNavigationResponse:", a2, *(_QWORD *)(a1 + 40));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t __96___SFBrowserContentViewController__openNewWebViewIfNeededWithConfiguration_forNavigationAction___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEqual:", *(_QWORD *)(a1 + 32));
}

void __122___SFBrowserContentViewController_webViewController_createWebViewWithConfiguration_forNavigationAction_completionHandler___block_invoke(uint64_t a1, int a2)
{
  id v3;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_openNewWebViewIfNeededWithConfiguration:forNavigationAction:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
}

uint64_t __105___SFBrowserContentViewController_webViewController_didReceiveAuthenticationChallenge_completionHandler___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1280) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "_updateNavigationBar");
}

uint64_t __105___SFBrowserContentViewController_webViewController_didReceiveAuthenticationChallenge_completionHandler___block_invoke_2(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1280) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "_updateNavigationBar");
}

uint64_t __76___SFBrowserContentViewController_webViewControllerShouldFillStringForFind___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 1704) = 0;
  return result;
}

void __81___SFBrowserContentViewController__willCommitContextMenuForWebView_withAnimator___block_invoke(uint64_t a1)
{
  id v1;

  +[_SFLinkPreviewHelper linkPreviewHelperForWebView:](_SFLinkPreviewHelper, "linkPreviewHelperForWebView:", *(_QWORD *)(a1 + 32));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "commitPreviewViewController");

}

void __54___SFBrowserContentViewController__receivedTouchDown___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1768), "removeFromSuperview");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 1768);
  *(_QWORD *)(v2 + 1768) = 0;

}

uint64_t __74___SFBrowserContentViewController_navigationBarFormatMenuButtonWasTapped___block_invoke(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "reloadBrowsingAssistantIfNeeded");
  return result;
}

void __69___SFBrowserContentViewController__translationAvailabilityDidChange___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "object");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "translationContext");
  v2 = (id)objc_claimAutoreleasedReturnValue();

  v3 = v9;
  if (v9 == v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "userInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safari_numberForKey:", *MEMORY[0x1E0D8B6C0]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v5, "unsignedIntegerValue"))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1152), "setShowsTranslationButton:", 1);
      objc_msgSend(*(id *)(a1 + 40), "assistantController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "webViewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "url");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "didFindLocalContentWithOptions:forURL:", 64, v8);

    }
    v3 = v9;
  }

}

void __53___SFBrowserContentViewController_downloadDidFinish___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (a2 && WeakRetained)
    objc_msgSend(WeakRetained, "_showDownload:", *(_QWORD *)(a1 + 32));
  else
    objc_msgSend(*(id *)(a1 + 32), "removeFromDisk");

}

uint64_t __49___SFBrowserContentViewController__showDownload___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "safari_addObjectUnlessNil:", a2);
}

void __49___SFBrowserContentViewController__showDownload___block_invoke_308(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    v4 = (id)WBS_LOG_CHANNEL_PREFIXDownloads();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __49___SFBrowserContentViewController__showDownload___block_invoke_308_cold_1();
    }

    objc_msgSend(*(id *)(a1 + 32), "_showGenericDownloadAlert");
  }

}

void __49___SFBrowserContentViewController__showDownload___block_invoke_311(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  _QWORD block[9];

  block[8] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = (id)WBS_LOG_CHANNEL_PREFIXDownloads();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __49___SFBrowserContentViewController__showDownload___block_invoke_311_cold_1();
    }

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __49___SFBrowserContentViewController__showDownload___block_invoke_312;
    block[3] = &unk_1E4AC1080;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }

}

uint64_t __49___SFBrowserContentViewController__showDownload___block_invoke_312(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1200), "addInvalidProfileAlert");
}

void __97___SFBrowserContentViewController__showFinanceKitOrderPreviewControllerWithURL_dismissalHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  _QWORD block[4];
  id v8[5];

  v8[4] = *(id *)MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = (id)WBS_LOG_CHANNEL_PREFIXDownloads();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __97___SFBrowserContentViewController__showFinanceKitOrderPreviewControllerWithURL_dismissalHandler___block_invoke_cold_1();
    }

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __97___SFBrowserContentViewController__showFinanceKitOrderPreviewControllerWithURL_dismissalHandler___block_invoke_315;
    block[3] = &unk_1E4AC11B8;
    objc_copyWeak(v8, (id *)(a1 + 40));
    dispatch_async(MEMORY[0x1E0C80D38], block);
    objc_destroyWeak(v8);
  }
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(void))(v6 + 16))();

}

void __97___SFBrowserContentViewController__showFinanceKitOrderPreviewControllerWithURL_dismissalHandler___block_invoke_315(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  _QWORD *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v2 = (void *)WeakRetained[150];
    _WBSLocalizedString();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    _WBSLocalizedString();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addAlertWithTitle:bodyText:", v3, v4);

    WeakRetained = v5;
  }

}

void __73___SFBrowserContentViewController__fetchSharingURLWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  if (!v3)
    v3 = *(id *)(a1 + 32);
  v4 = v3;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __65___SFBrowserContentViewController__presentActivityViewController__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  id v11;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65___SFBrowserContentViewController__presentActivityViewController__block_invoke_2;
  v8[3] = &unk_1E4AC63A0;
  v6 = *(void **)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v3;
  v10 = v7;
  v11 = *(id *)(a1 + 48);
  objc_msgSend(v4, "_fetchActivityViewControllerInfoForURL:title:completion:", v7, v5, v8);

}

void __65___SFBrowserContentViewController__presentActivityViewController__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _SFSafariSharingExtensionController *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  _SFAddToHomeScreenActivity *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  _SFActivityViewController *v21;
  uint64_t v22;
  void *v23;
  _SFActivityViewController *v24;
  uint64_t v25;
  void *v26;
  _SFPopoverPresentationDelegate *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  _QWORD v31[5];

  v31[4] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 1288))
  {
    v7 = -[_SFSafariSharingExtensionController initWithWebView:]([_SFSafariSharingExtensionController alloc], "initWithWebView:", *(_QWORD *)(a1 + 40));
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 1288);
    *(_QWORD *)(v8 + 1288) = v7;

  }
  if (objc_msgSend(v6, "containsObject:", CFSTR("com.apple.UIKit.activity.AddToHomeScreen")))
  {
    objc_msgSend(v6, "arrayByAddingObject:", CFSTR("com.apple.mobilesafari.activity.addToHomeScreen"));
    v10 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v10;
  }
  v11 = (void *)MEMORY[0x1E0C9AA60];
  if (v5)
    v11 = v5;
  v12 = v11;

  v13 = -[_SFAddToHomeScreenActivity initWithWebView:]([_SFAddToHomeScreenActivity alloc], "initWithWebView:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v12, "arrayByAddingObject:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = *(_QWORD *)(a1 + 32);
  v16 = *(void **)(v15 + 1560);
  *(_QWORD *)(v15 + 1560) = 0;

  v17 = *(_QWORD *)(a1 + 48);
  v18 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "title");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "_itemProviderCollectionForSharingURL:title:", v17, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = [_SFActivityViewController alloc];
  v22 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "URL");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[_SFActivityViewController initWithActivityItemProviderCollection:applicationActivities:sharingURL:sourceURL:](v21, "initWithActivityItemProviderCollection:applicationActivities:sharingURL:sourceURL:", v20, v14, v22, v23);

  -[_SFActivityViewController setSharingExtensionController:](v24, "setSharingExtensionController:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1288));
  -[_SFActivityViewController setDelegate:](v24, "setDelegate:", *(_QWORD *)(a1 + 32));
  if (objc_msgSend(*(id *)(a1 + 32), "_isUsedForAuthentication"))
  {
    -[_SFActivityViewController setExcludedActivityCategories:](v24, "setExcludedActivityCategories:", 2);
    v25 = *MEMORY[0x1E0CEB1A8];
    v31[0] = *MEMORY[0x1E0CEB1C0];
    v31[1] = v25;
    v31[2] = *MEMORY[0x1E0CEB1B0];
    v31[3] = CFSTR("com.apple.mobilesafari.activity.addToHomeScreen");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 4);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFActivityViewController setExcludedActivityTypes:](v24, "setExcludedActivityTypes:", v26);

  }
  else
  {
    -[_SFActivityViewController setExcludedActivityTypes:](v24, "setExcludedActivityTypes:", v6);
  }
  -[_SFActivityViewController setModalPresentationStyle:](v24, "setModalPresentationStyle:", 7);
  v27 = -[_SFPopoverPresentationDelegate initWithSourceInfo:]([_SFPopoverPresentationDelegate alloc], "initWithSourceInfo:", *(_QWORD *)(a1 + 56));
  -[_SFActivityViewController popoverPresentationController](v24, "popoverPresentationController");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFPopoverPresentationDelegate attachToPopoverPresentationController:](v27, "attachToPopoverPresentationController:", v28);

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1560), v24);
  v29 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(v29 + 1560), "customizationController");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setDelegate:", v29);

  objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v24, 1, 0);
}

void __77___SFBrowserContentViewController__emailCurrentPageWithPreferredContentType___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[5];

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_mailContentProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __77___SFBrowserContentViewController__emailCurrentPageWithPreferredContentType___block_invoke_2;
  v6[3] = &unk_1E4AC6410;
  v5 = *(_QWORD *)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "getMailComposeViewControllerWithMailToURL:contentURL:preferredContentType:completionHandler:", 0, v3, v5, v6);

}

void __77___SFBrowserContentViewController__emailCurrentPageWithPreferredContentType___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v3, 1, 0);

}

void __88___SFBrowserContentViewController__perSiteAutomaticReaderActivationPreferenceDidChange___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  uint64_t v6;
  unsigned __int8 *v7;
  void *v8;
  id v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "webViewController");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "readerController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isReaderAvailable");

  if ((v3 & 1) != 0 && objc_msgSend(*(id *)(a1 + 32), "_shouldAllowAutomaticReader"))
  {
    objc_msgSend(*(id *)(a1 + 40), "userInfo");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "safari_stringForKey:", *MEMORY[0x1E0D8B018]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_committedDomainForPreferences");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isEqualToString:", v4) & 1) != 0)
    {
      v6 = objc_msgSend(v10, "safari_BOOLForKey:", *MEMORY[0x1E0D8B780]);
      v7 = *(unsigned __int8 **)(a1 + 32);
      if (v7[1024] != (_DWORD)v6)
      {
        objc_msgSend(v7, "_setShowingReader:deactivationMode:animated:", v6, 2, 1);
        if ((_DWORD)v6)
        {
          objc_msgSend(MEMORY[0x1E0D8A758], "sharedLogger");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "didActivateReaderWithTrigger:", 1);

        }
      }
    }

  }
}

void __71___SFBrowserContentViewController__perSitePageZoomPreferenceDidChange___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "safari_stringForKey:", *MEMORY[0x1E0D8B010]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "webView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safari_userVisibleHostWithoutWWWSubdomain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v5, "isEqualToString:", v2) & 1) != 0)
  {
    objc_msgSend(v9, "safari_numberForKey:", *MEMORY[0x1E0D8B1C0]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "doubleValue");
    v8 = v7;

    objc_msgSend(v3, "_setViewScale:", v8);
  }

}

void __75___SFBrowserContentViewController__perSiteLockdownModePreferenceDidChange___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safari_stringForKey:", *MEMORY[0x1E0D8B008]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "URLForPerSitePreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safari_userVisibleHostWithoutWWWSubdomain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v4, "isEqualToString:", v2) & 1) != 0)
    objc_msgSend(*(id *)(a1 + 40), "_reloadFromOrigin:", 0);

}

void __63___SFBrowserContentViewController__updateDigitalHealthTracking__block_invoke(uint64_t a1)
{
  id *v1;
  id *WeakRetained;
  id *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v1 = (id *)(a1 + 32);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "webViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "webView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "URL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v3, "_digitalHealthManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v3, "_personaShouldUseScreenTime"))
      {
        v8 = v3 + 123;
        if ((objc_msgSend(v6, "isEqual:", v3[123]) & 1) == 0)
        {
          objc_msgSend(v3, "_hostAppBundleId");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = *MEMORY[0x1E0D8AFB8];
          objc_msgSend(v7, "updateUsageTrackingForURL:withBundleIdentifier:profileIdentifier:toState:", *v8, v9, *MEMORY[0x1E0D8AFB8], 0);
          objc_storeStrong(v3 + 123, v6);
          objc_msgSend(v7, "updateUsageTrackingForURL:withBundleIdentifier:profileIdentifier:toState:", *v8, v9, v10, 2);

        }
      }
      v15[0] = v6;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __63___SFBrowserContentViewController__updateDigitalHealthTracking__block_invoke_2;
      v12[3] = &unk_1E4AC6460;
      objc_copyWeak(&v14, v1);
      v13 = v6;
      objc_msgSend(v7, "getOverlayStateForURLs:withCompletionHandler:", v11, v12);

      objc_destroyWeak(&v14);
    }

  }
}

void __63___SFBrowserContentViewController__updateDigitalHealthTracking__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63___SFBrowserContentViewController__updateDigitalHealthTracking__block_invoke_3;
  block[3] = &unk_1E4AC23B0;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  v6 = v3;
  v7 = *(id *)(a1 + 32);
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v8);
}

void __63___SFBrowserContentViewController__updateDigitalHealthTracking__block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v2 = *(void **)(a1 + 32);
    if (v2)
    {
      objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v3, "integerValue");

      if ((unint64_t)(v4 - 1) >= 5)
      {
        if (!v4)
          objc_msgSend(WeakRetained, "_hideDigitalHealthOverlay");
      }
      else
      {
        objc_msgSend(WeakRetained, "_showDigitalHealthOverlayWithPolicy:", v4);
      }
    }
  }

}

uint64_t __82___SFBrowserContentViewController_stopDigitalHealthTrackingWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __82___SFBrowserContentViewController_stopDigitalHealthTrackingWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __82___SFBrowserContentViewController_stopDigitalHealthTrackingWithCompletionHandler___block_invoke_3;
  v2[3] = &unk_1E4AC5DB0;
  v3 = *(id *)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x1E0C80D38], v2);

}

uint64_t __82___SFBrowserContentViewController_stopDigitalHealthTrackingWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "stopObservingWithCompletionHandler:", *(_QWORD *)(a1 + 40));
}

void __68___SFBrowserContentViewController__presentSaveWebpageViewController__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  _SFSaveToFilesOperation *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "_canSaveWebpageForURL:") & 1) != 0)
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "title");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_itemProviderCollectionForSharingURL:title:", v9, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = -[_SFSaveToFilesOperation initWithActivityItemProviderCollection:]([_SFSaveToFilesOperation alloc], "initWithActivityItemProviderCollection:", v5);
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 1552);
    *(_QWORD *)(v7 + 1552) = v6;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1552), "setDelegate:");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1552), "start");

  }
}

uint64_t __82___SFBrowserContentViewController_translationContextReloadPageInOriginalLanguage___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reloadFromOrigin:", 0);
}

void __93___SFBrowserContentViewController_translationContext_urlForCurrentPageWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "webView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v2);

}

void __97___SFBrowserContentViewController_translationContext_showTranslationErrorAlertWithTitle_message___block_invoke(uint64_t a1)
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0D4EC48]);
  objc_msgSend(v2, "setMessageType:", 1);
  objc_msgSend(v2, "setBannerText:manuallyWrappedBannerText:", *(_QWORD *)(a1 + 32), 0);
  objc_msgSend(*(id *)(a1 + 40), "_showCrashBanner:animated:", v2, 1);

}

uint64_t __89___SFBrowserContentViewController_translationContext_shouldReportProgressInUnifiedField___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 1625) = *(_BYTE *)(result + 40);
  return result;
}

void __69___SFBrowserContentViewController__translationContextStateDidChange___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "translationContext");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1152), "setShowsTranslationIcon:", objc_msgSend(v3, "hasStartedTranslating"));

  objc_msgSend(*(id *)(a1 + 32), "webViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1952), "webpageLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUpFormTelemetryDataMonitorWithWebpageLocale:", v2);

}

void __93___SFBrowserContentViewController__presentTranslationConsentAlertWithType_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t);
  void *v8;
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__358;
  v15 = __Block_byref_object_dispose__359;
  v16 = objc_alloc_init(MEMORY[0x1E0D8AD50]);
  objc_msgSend((id)v12[5], "setDelegate:", *(_QWORD *)(a1 + 32));
  v2 = (void *)v12[5];
  v5 = MEMORY[0x1E0C809B0];
  v6 = 3221225472;
  v7 = __93___SFBrowserContentViewController__presentTranslationConsentAlertWithType_completionHandler___block_invoke_361;
  v8 = &unk_1E4AC64D8;
  v3 = *(_QWORD *)(a1 + 48);
  v9 = *(id *)(a1 + 40);
  v10 = &v11;
  objc_msgSend(v2, "consentAlertForType:withCompletionHandler:", v3, &v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v4, 1, 0, v5, v6, v7, v8);

  _Block_object_dispose(&v11, 8);
}

void __93___SFBrowserContentViewController__presentTranslationConsentAlertWithType_completionHandler___block_invoke_361(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

void __93___SFBrowserContentViewController_browsingAssistantController_didUpdateContentOptionsForURL___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1760), "summary");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  _WBSLocalizedString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _WBSLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "absoluteString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR("https://"), CFSTR("safari-reader://"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1760), "tableOfContentsTitles");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1760), "tableOfContentsPaths");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1760), "tableOfContentsTrailingTexts");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setArticleSummary:withSummaryHeader:tableOfContentsHeader:readerURLString:titles:paths:trailingText:", v10, v3, v4, v6, v7, v8, v9);

}

void __49___SFBrowserContentViewController__showDownload___block_invoke_308_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_6_0(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_1_1(&dword_1A3B2D000, v3, v4, "Greenfield download failed: %{public}@", v5);

  OUTLINED_FUNCTION_3_0();
}

void __49___SFBrowserContentViewController__showDownload___block_invoke_311_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_6_0(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_1_1(&dword_1A3B2D000, v3, v4, "Profile failed to install: %{public}@", v5);

  OUTLINED_FUNCTION_3_0();
}

void __97___SFBrowserContentViewController__showFinanceKitOrderPreviewControllerWithURL_dismissalHandler___block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_6_0(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_1_1(&dword_1A3B2D000, v3, v4, "Failed to save Wallet Order: %{public}@", v5);

  OUTLINED_FUNCTION_3_0();
}

@end
