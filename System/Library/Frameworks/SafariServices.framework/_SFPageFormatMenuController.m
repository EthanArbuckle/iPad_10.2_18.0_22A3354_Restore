@implementation _SFPageFormatMenuController

- (_SFPageFormatMenuController)initWithBrowserContentController:(id)a3
{
  id v4;
  _SFPageFormatMenuController *v5;
  _SFPageFormatMenuController *v6;
  WBUFeatureManager *v7;
  WBUFeatureManager *featureManager;
  void *v9;
  _SFPageFormatMenuController *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_SFPageFormatMenuController;
  v5 = -[_SFPageFormatMenuController init](&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_browserContentController, v4);
    v7 = (WBUFeatureManager *)objc_alloc_init(MEMORY[0x1E0DD9900]);
    featureManager = v6->_featureManager;
    v6->_featureManager = v7;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v6, sel__readerAvailabilityDidChange_, CFSTR("readerAvailabilityDidChange"), 0);
    objc_msgSend(v9, "addObserver:selector:name:object:", v6, sel__translationAvailabilityDidChange_, *MEMORY[0x1E0D8B6B8], 0);
    objc_msgSend(v9, "addObserver:selector:name:object:", v6, sel__totalProgressDidChange_, CFSTR("_SFDownloadManagerTotalProgressDidChangeNotification"), 0);
    objc_msgSend(v9, "addObserver:selector:name:object:", v6, sel__didFinishLastDownload_, CFSTR("_SFDownloadManagerDidFinishLastDownloadNotification"), 0);
    objc_msgSend(v9, "addObserver:selector:name:object:", v6, sel__hasUnviewedDownloadsDidChange_, CFSTR("_SFDownloadManagerHasUnviewedDownloadsDidChangeNotification"), 0);
    v10 = v6;

  }
  return v6;
}

- (id)_webExtensionsController
{
  id WeakRetained;
  void *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  objc_msgSend(WeakRetained, "activeDocument");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "webExtensionsController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_contentBlockerManager
{
  id WeakRetained;
  void *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  objc_msgSend(WeakRetained, "activeDocument");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentBlockerManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)_presentBrowsingAssistantFromViewController:(id)a3 withSourceInfo:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  _SFPopoverPresentationDelegate *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  _SFPopoverPresentationDelegate *v24;
  id v25;
  id *p_viewController;
  _SFPageFormatMenuController *v27;
  _QWORD v28[4];
  id v29;
  id location[5];
  id v31;
  id v32;
  _QWORD v33[3];

  v33[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  p_viewController = (id *)&self->_viewController;
  v27 = self;
  WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  objc_msgSend(WeakRetained, "presentingViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    if (objc_msgSend(WeakRetained, "stepperFocused"))
      objc_msgSend(WeakRetained, "setStepperFocused:", 0);
    else
      objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 1, 0);
  }
  else
  {
    -[_SFPageFormatMenuController _clearCachedItems](self, "_clearCachedItems");
    v10 = objc_alloc_init(MEMORY[0x1E0D4EBF0]);
    objc_msgSend(v10, "setDataSource:", self);
    objc_msgSend(v10, "setDelegate:", self);
    objc_msgSend(v10, "setModalPresentationStyle:", 7);
    objc_msgSend(v10, "popoverPresentationController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v12 = objc_msgSend(v7, "permittedArrowDirections");
    else
      v12 = 1;
    objc_msgSend(v11, "setPermittedArrowDirections:", v12);
    v13 = -[_SFPopoverPresentationDelegate initWithSourceInfo:]([_SFPopoverPresentationDelegate alloc], "initWithSourceInfo:", v7);
    -[_SFPopoverPresentationDelegate setNestsAdaptiveSheetPresentationInNavigationController:](v13, "setNestsAdaptiveSheetPresentationInNavigationController:", 0);
    v24 = v13;
    -[_SFPopoverPresentationDelegate attachToPopoverPresentationController:](v13, "attachToPopoverPresentationController:", v11);
    objc_msgSend(v6, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "window");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "windowScene");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    _SFContextInfoWithComment();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    location[1] = (id)MEMORY[0x1E0C809B0];
    location[2] = (id)3221225472;
    location[3] = __90___SFPageFormatMenuController__presentBrowsingAssistantFromViewController_withSourceInfo___block_invoke;
    location[4] = &unk_1E4AC4EB0;
    v31 = v7;
    v25 = v11;
    v32 = v25;
    _SFPopoverSourceInfoUnwrap();

    objc_msgSend(v25, "adaptiveSheetPresentationController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(location, v10);
    v19 = (void *)MEMORY[0x1E0DC3C78];
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __90___SFPageFormatMenuController__presentBrowsingAssistantFromViewController_withSourceInfo___block_invoke_4;
    v28[3] = &unk_1E4AC4F38;
    objc_copyWeak(&v29, location);
    objc_msgSend(v19, "customDetentWithIdentifier:resolver:", 0, v28);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setDetents:", v21);

    objc_msgSend(v18, "setPrefersGrabberVisible:", 1);
    objc_storeWeak(p_viewController, v10);
    objc_msgSend(v6, "presentViewController:animated:completion:", v10, 1, 0);
    v22 = objc_loadWeakRetained((id *)&v27->_browserContentController);
    objc_msgSend(v22, "clearBadgeOnPageFormatMenu");

    *(_WORD *)&v27->_didDonateVisualPresentationSummaryToBiome = 0;
    objc_destroyWeak(&v29);
    objc_destroyWeak(location);

  }
  return v9 == 0;
}

- (BOOL)presentMenuFromViewController:(id)a3 withSourceInfo:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  id WeakRetained;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _SFPopoverPresentationDelegate *v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  id *location;
  void *v31;
  _SFPopoverPresentationDelegate *v32;
  void *v33;
  id v34;
  void *v35;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(MEMORY[0x1E0D8A8F8], "isBrowsingAssistantEnabled"))
  {
    v8 = -[_SFPageFormatMenuController _presentBrowsingAssistantFromViewController:withSourceInfo:](self, "_presentBrowsingAssistantFromViewController:withSourceInfo:", v6, v7);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
    objc_msgSend(WeakRetained, "presentingViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = objc_loadWeakRetained((id *)&self->_viewController);
      objc_msgSend(v11, "focusedItem");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
        objc_msgSend(v11, "setFocusedItem:", 0);
      else
        objc_msgSend(v11, "dismissViewControllerAnimated:completion:", 1, 0);

      v8 = 0;
    }
    else
    {
      objc_msgSend(v6, "view");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "window");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "windowScene");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPageFormatMenuController menuForOrientation:sourceInfo:](self, "menuForOrientation:sourceInfo:", objc_msgSend(v15, "interfaceOrientation"), v7);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "setUsesReverseOrder:", objc_msgSend(v7, "permittedArrowDirections") == 2);
      objc_msgSend(v16, "setProvenance:", objc_msgSend(v7, "provenance"));
      objc_msgSend(v16, "setModalPresentationStyle:", 7);
      objc_msgSend(v16, "view");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setAccessibilityIdentifier:", CFSTR("PageFormatMenu"));

      v18 = -[_SFPopoverPresentationDelegate initWithSourceInfo:]([_SFPopoverPresentationDelegate alloc], "initWithSourceInfo:", v7);
      -[_SFPopoverPresentationDelegate setPopoverUsesAdaptivePresentationInCompact:](v18, "setPopoverUsesAdaptivePresentationInCompact:", 0);
      objc_msgSend(v16, "popoverPresentationController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v18;
      -[_SFPopoverPresentationDelegate attachToPopoverPresentationController:](v18, "attachToPopoverPresentationController:", v19);
      objc_msgSend(v19, "_setShouldHideArrow:", objc_msgSend(v7, "shouldHideArrow"));
      if (objc_msgSend(v7, "shouldPassthroughSuperview"))
        objc_msgSend(v19, "_setPreferredHorizontalAlignment:", 1);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v20 = objc_msgSend(v7, "permittedArrowDirections");
      else
        v20 = 1;
      objc_msgSend(v19, "setPermittedArrowDirections:", v20);
      v21 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend(v6, "view");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "window");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "windowScene");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      _SFContextInfoWithComment();
      v31 = v19;
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v21;
      location = (id *)&self->_viewController;
      v34 = v7;
      v35 = v16;
      v26 = v16;
      v27 = v21;
      _SFPopoverSourceInfoUnwrap();

      v8 = 1;
      objc_msgSend(v6, "presentViewController:animated:completion:", v26, 1, 0);
      v28 = objc_loadWeakRetained((id *)&self->_browserContentController);
      objc_msgSend(v28, "clearBadgeOnPageFormatMenu");

      objc_storeWeak(location, v26);
    }
  }

  return v8;
}

- (id)menuForOrientation:(int64_t)a3 sourceInfo:(id)a4
{
  _SFSettingsAlertController *v6;

  v6 = objc_alloc_init(_SFSettingsAlertController);
  -[_SFPageFormatMenuController _constructMenuForAlert:orientation:](self, "_constructMenuForAlert:orientation:", v6, a3);
  return v6;
}

- (void)_constructMenuForAlert:(id)a3 orientation:(int64_t)a4
{
  id v6;
  id WeakRetained;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _SFSettingsAlertItem *v17;
  _SFSettingsAlertItem *readerAlertItem;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  int64_t v23;
  _SFSettingsAlertItem *v24;
  _SFSettingsAlertItem *downloadsAlertItem;
  void *v26;
  NSArray *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  _SFPageFormatMenuPrivacyReportController *v42;
  void *v43;
  _SFPageFormatMenuPrivacyReportController *v44;
  void *v45;
  _BOOL4 v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t j;
  void *v52;
  void *v53;
  int v54;
  void *v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _BYTE v64[128];
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  objc_msgSend(WeakRetained, "activeDocument");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(WeakRetained, "isShowingReader");
  if (objc_msgSend(WeakRetained, "shouldShowListeningControls"))
  {
    -[_SFPageFormatMenuController _endListeningToSiriReaderAlertItem](self, "_endListeningToSiriReaderAlertItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addItem:", v10);

    if (!-[_SFPageFormatMenuController _isActiveTabPausedOrPlaying](self, "_isActiveTabPausedOrPlaying"))
    {
      -[_SFPageFormatMenuController _siriReaderAlertItem](self, "_siriReaderAlertItem");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addItem:", v11);

    }
    objc_msgSend(v6, "addDivider");
    -[_SFPageFormatMenuController _playbackStateAndPositionAlertItem](self, "_playbackStateAndPositionAlertItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addItem:", v12);

    -[_SFPageFormatMenuController _playbackRateAlertItem](self, "_playbackRateAlertItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addItem:", v13);

    objc_msgSend(v6, "addDivider");
    -[_SFPageFormatMenuController _moreControlsAlertItem](self, "_moreControlsAlertItem");
    v14 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (v9)
    -[_SFPageFormatMenuController _readerTextSizeAlertItem](self, "_readerTextSizeAlertItem");
  else
    -[_SFPageFormatMenuController _pageZoomAlertItem](self, "_pageZoomAlertItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addItem:", v16);

  -[_SFPageFormatMenuController _readerAlertItem](self, "_readerAlertItem");
  v17 = (_SFSettingsAlertItem *)objc_claimAutoreleasedReturnValue();
  readerAlertItem = self->_readerAlertItem;
  self->_readerAlertItem = v17;

  if ((v9 & 1) != 0)
  {
    v19 = 1;
  }
  else
  {
    objc_msgSend(v8, "readerContext");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v20, "isReaderAvailable");

  }
  -[_SFSettingsAlertItem setEnabled:](self->_readerAlertItem, "setEnabled:", v19);
  objc_msgSend(v6, "addItem:", self->_readerAlertItem);
  if (objc_msgSend(MEMORY[0x1E0D8A8F8], "isSiriReadThisEnabled")
    && objc_msgSend(WeakRetained, "supportsSiriReadThis"))
  {
    if (-[_SFPageFormatMenuController _isSiriReaderCurrentlyActive](self, "_isSiriReaderCurrentlyActive"))
      -[_SFPageFormatMenuController _listeningControlsAlertItem](self, "_listeningControlsAlertItem");
    else
      -[_SFPageFormatMenuController _siriReaderAlertItem](self, "_siriReaderAlertItem");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addItem:", v21);

  }
  if ((v9 & 1) == 0)
  {
    if ((objc_msgSend(WeakRetained, "hasDedicatedMediaStateButton") & 1) == 0 && objc_msgSend(v8, "mediaStateIcon"))
    {
      objc_msgSend(v6, "addDivider");
      -[_SFPageFormatMenuController _mediaStateAlertItem](self, "_mediaStateAlertItem");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addItem:", v22);

    }
    v55 = v8;
    v23 = a4;
    if ((objc_msgSend(WeakRetained, "hasDedicatedDownloadsToolbarItem") & 1) == 0
      && -[_SFPageFormatMenuController _shouldEnableDownloadsAlert](self, "_shouldEnableDownloadsAlert"))
    {
      objc_msgSend(v6, "addDivider");
      -[_SFPageFormatMenuController _downloadsAlertItem](self, "_downloadsAlertItem");
      v24 = (_SFSettingsAlertItem *)objc_claimAutoreleasedReturnValue();
      downloadsAlertItem = self->_downloadsAlertItem;
      self->_downloadsAlertItem = v24;

      objc_msgSend(v6, "addItem:", self->_downloadsAlertItem);
    }
    objc_msgSend(v6, "addDivider");
    objc_msgSend(v6, "safari_popoverSourceInfo");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFPageFormatMenuController _buildTranslationAlertItemsWithSourceInfo:](self, "_buildTranslationAlertItemsWithSourceInfo:", v26);

    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    v27 = self->_translationAlertItems;
    v28 = -[NSArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v60, v65, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v61;
      do
      {
        for (i = 0; i != v29; ++i)
        {
          if (*(_QWORD *)v61 != v30)
            objc_enumerationMutation(v27);
          objc_msgSend(v6, "addItem:", *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * i));
        }
        v29 = -[NSArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v60, v65, 16);
      }
      while (v29);
    }

    a4 = v23;
    v8 = v55;
  }
  if (-[_SFPageFormatMenuController _canShowWebsiteSettings](self, "_canShowWebsiteSettings")
    && objc_msgSend(MEMORY[0x1E0D8A8F8], "isInternalInstall"))
  {
    objc_msgSend(v6, "addDivider");
    -[_SFPageFormatMenuController _userFeedbackAutofillAlertItem](self, "_userFeedbackAutofillAlertItem");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addItem:", v32);

  }
  objc_msgSend(v6, "addDivider");
  if ((v19 & 1) == 0)
  {
    objc_msgSend(v8, "readerContext");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "checkReaderAvailability");

  }
  if (v9)
  {
    -[_SFPageFormatMenuController _readerFontAlertItem](self, "_readerFontAlertItem");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addItem:", v34);

    -[_SFPageFormatMenuController _readerThemeAlertItem](self, "_readerThemeAlertItem");
    v35 = objc_claimAutoreleasedReturnValue();
LABEL_50:
    v40 = (void *)v35;
    objc_msgSend(v6, "addItem:", v35);

    goto LABEL_51;
  }
  if (-[_SFPageFormatMenuController _canHideToolbar](self, "_canHideToolbar"))
  {
    -[_SFPageFormatMenuController _fullScreenAlertItem](self, "_fullScreenAlertItem");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addItem:", v36);

  }
  if (-[_SFPageFormatMenuController _canToggleBetweenDesktopAndMobileSite](self, "_canToggleBetweenDesktopAndMobileSite"))
  {
    -[_SFPageFormatMenuController _desktopMobileToggleAlertItemWithOrientation:](self, "_desktopMobileToggleAlertItemWithOrientation:", a4);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addItem:", v37);

  }
  if (-[_SFPageFormatMenuController _canToggleContentBlockers](self, "_canToggleContentBlockers"))
  {
    -[_SFPageFormatMenuController _contentBlockersToggleAlertItem](self, "_contentBlockersToggleAlertItem");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addItem:", v38);

  }
  if (-[_SFPageFormatMenuController _canToggleAdvancedPrivateBrowsingPrivacyProtections](self, "_canToggleAdvancedPrivateBrowsingPrivacyProtections"))
  {
    -[_SFPageFormatMenuController _advancedPrivateBrowsingPrivacyProtectionsAlertItem](self, "_advancedPrivateBrowsingPrivacyProtectionsAlertItem");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addItem:", v39);

  }
  if (-[_SFPageFormatMenuController _canTogglePrivateRelay](self, "_canTogglePrivateRelay"))
  {
    -[_SFPageFormatMenuController _privateRelayToggleAlertItem](self, "_privateRelayToggleAlertItem");
    v35 = objc_claimAutoreleasedReturnValue();
    goto LABEL_50;
  }
LABEL_51:
  objc_msgSend(v6, "addDivider");
  if (-[_SFPageFormatMenuController _canShowWebsiteSettings](self, "_canShowWebsiteSettings"))
  {
    -[_SFPageFormatMenuController _websiteSettingsAlertItem](self, "_websiteSettingsAlertItem");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addItem:", v41);

  }
  if (((objc_msgSend(WeakRetained, "supportsPrivacyReport") ^ 1 | v9) & 1) == 0)
  {
    v42 = [_SFPageFormatMenuPrivacyReportController alloc];
    objc_msgSend(WeakRetained, "activeDocument");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = -[_SFPageFormatMenuPrivacyReportController initWithDocument:](v42, "initWithDocument:", v43);

    -[_SFPageFormatMenuPrivacyReportController setDelegate:](v44, "setDelegate:", self);
    -[_SFPageFormatMenuPrivacyReportController alertItem](v44, "alertItem");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addItem:", v45);

  }
  if ((v9 & 1) == 0)
  {
    if ((objc_msgSend(WeakRetained, "hasDedicatedExtensionsButton") & 1) == 0)
    {
      v46 = -[_SFPageFormatMenuController _hasExtensionsAvailableToShowInManageExtensionsView](self, "_hasExtensionsAvailableToShowInManageExtensionsView");
      if (v46)
        objc_msgSend(v6, "addDivider");
      v58 = 0u;
      v59 = 0u;
      v56 = 0u;
      v57 = 0u;
      -[_SFPageFormatMenuController _extensionItems](self, "_extensionItems");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
      if (v48)
      {
        v49 = v48;
        v50 = *(_QWORD *)v57;
        do
        {
          for (j = 0; j != v49; ++j)
          {
            if (*(_QWORD *)v57 != v50)
              objc_enumerationMutation(v47);
            objc_msgSend(v6, "addItem:", *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * j));
          }
          v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
        }
        while (v49);
      }

      if (v46)
      {
        -[_SFPageFormatMenuController _manageExtensionsAlertItem](self, "_manageExtensionsAlertItem");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addItem:", v52);

      }
    }
    if (WBSAXShouldShowAnimatedImageControls()
      && objc_msgSend(MEMORY[0x1E0CEF630], "instancesRespondToSelector:", sel__pauseAllAnimationsWithCompletionHandler_))
    {
      objc_msgSend(v6, "addDivider");
      objc_msgSend(v8, "activeWebView");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = objc_msgSend(v53, "_allowsAnyAnimationToPlay");

      if (v54)
        -[_SFPageFormatMenuController _pauseAllAnimationsAlertItem](self, "_pauseAllAnimationsAlertItem");
      else
        -[_SFPageFormatMenuController _playAllAnimationsAlertItem](self, "_playAllAnimationsAlertItem");
      v14 = objc_claimAutoreleasedReturnValue();
LABEL_5:
      v15 = (void *)v14;
      objc_msgSend(v6, "addItem:", v14);

    }
  }

}

- (BOOL)_hasExtensionsAvailableToShowInManageExtensionsView
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;

  -[_SFPageFormatMenuController _webExtensionsController](self, "_webExtensionsController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "loadEnabledExtensionsWasCalled"))
  {
    -[_SFPageFormatMenuController _contentBlockerManager](self, "_contentBlockerManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "extensions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {
      v6 = 1;
    }
    else
    {
      objc_msgSend(v4, "extensions");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v7, "count") != 0;

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_extensionItems
{
  id WeakRetained;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  -[_SFPageFormatMenuController _webExtensionsController](self, "_webExtensionsController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "activeDocument");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isPrivateBrowsingEnabled");

  objc_msgSend(v4, "enabledExtensionsWithPrivateBrowsingEnabled:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "activeTabForExtensions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __46___SFPageFormatMenuController__extensionItems__block_invoke;
  v13[3] = &unk_1E4AC4FC8;
  v14 = v4;
  v15 = v8;
  v9 = v8;
  v10 = v4;
  objc_msgSend(v7, "safari_mapAndFilterObjectsUsingBlock:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_siriReaderAlertItem
{
  id WeakRetained;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _SFSettingsAlertItem *v16;
  _SFSettingsAlertItem *cachedSiriReaderAlertItem;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _SFSettingsAlertItem *v24;
  void *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id v31;
  id location;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  objc_msgSend(WeakRetained, "activeDocument");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "readerContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D4ED58], "sharedVoiceUtilities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activeSiriReaderSessionIdentifier");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v10 = v4;

    goto LABEL_5;
  }
  v7 = (void *)v6;
  objc_msgSend(MEMORY[0x1E0D4ED58], "sharedVoiceUtilities");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "activeSiriReaderSessionURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v4;
  objc_msgSend(v4, "readerURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v9, "isEqual:", v11);

  if ((v12 & 1) == 0)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "UUIDString");
    v14 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0D4ED58], "sharedVoiceUtilities");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "activeSiriReaderSessionIdentifier");
  v14 = objc_claimAutoreleasedReturnValue();
LABEL_6:
  v15 = (void *)v14;

  -[_SFPageFormatMenuController _siriReaderAlertItemWithState:identifier:](self, "_siriReaderAlertItemWithState:identifier:", 0, v15);
  v16 = (_SFSettingsAlertItem *)objc_claimAutoreleasedReturnValue();
  cachedSiriReaderAlertItem = self->_cachedSiriReaderAlertItem;
  self->_cachedSiriReaderAlertItem = v16;

  -[_SFSettingsAlertItem setEnabled:](self->_cachedSiriReaderAlertItem, "setEnabled:", 0);
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0D4ED50], "sharedPlaybackController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = MEMORY[0x1E0C80D38];
  v20 = MEMORY[0x1E0C80D38];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __51___SFPageFormatMenuController__siriReaderAlertItem__block_invoke;
  v27[3] = &unk_1E4AC4FF0;
  v21 = WeakRetained;
  v28 = v21;
  objc_copyWeak(&v31, &location);
  v22 = v10;
  v29 = v22;
  v23 = v26;
  v30 = v23;
  objc_msgSend(v18, "updateContentIdentifierOnQueue:completion:", v19, v27);

  v24 = self->_cachedSiriReaderAlertItem;
  objc_destroyWeak(&v31);

  objc_destroyWeak(&location);
  return v24;
}

- (id)_endListeningToSiriReaderAlertItem
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *);
  void *v11;
  id v12;
  id location;

  _WBSLocalizedString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("xmark"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v5 = *MEMORY[0x1E0DC4A88];
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __65___SFPageFormatMenuController__endListeningToSiriReaderAlertItem__block_invoke;
  v11 = &unk_1E4AC5018;
  objc_copyWeak(&v12, &location);
  +[_SFSettingsAlertItem buttonWithTitle:textStyle:icon:action:handler:](_SFSettingsAlertItem, "buttonWithTitle:textStyle:icon:action:handler:", v3, v5, v4, 33, &v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityIdentifier:", CFSTR("EndListening"), v8, v9, v10, v11);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  return v6;
}

- (id)_moreControlsAlertItem
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v8[5];

  _WBSLocalizedString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("textformat.size"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0DC4A88];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __53___SFPageFormatMenuController__moreControlsAlertItem__block_invoke;
  v8[3] = &unk_1E4AC05B8;
  v8[4] = self;
  +[_SFSettingsAlertItem buttonWithTitle:textStyle:icon:action:handler:](_SFSettingsAlertItem, "buttonWithTitle:textStyle:icon:action:handler:", v3, v5, v4, 35, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityIdentifier:", CFSTR("MoreControls"));
  objc_msgSend(v6, "setKeepsMenuPresented:", 1);

  return v6;
}

- (id)_listeningControlsAlertItem
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id WeakRetained;
  void *v8;
  _QWORD v10[5];

  _WBSLocalizedString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:", CFSTR("speaker.wave.2.bubble.left"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0DC4A88];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __58___SFPageFormatMenuController__listeningControlsAlertItem__block_invoke;
  v10[3] = &unk_1E4AC05B8;
  v10[4] = self;
  +[_SFSettingsAlertItem buttonWithTitle:textStyle:icon:action:handler:](_SFSettingsAlertItem, "buttonWithTitle:textStyle:icon:action:handler:", v3, v5, v4, 34, v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityIdentifier:", CFSTR("ListeningControls"));
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  objc_msgSend(WeakRetained, "activeDocument");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEnabled:", objc_msgSend(v8, "isBlockedByScreenTime") ^ 1);

  objc_msgSend(v6, "setKeepsMenuPresented:", 1);
  return v6;
}

- (id)_playbackRateAlertItem
{
  void *v2;
  _SFSiriReaderPlaybackRateController *v3;
  void *v4;

  _WBSLocalizedString();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(_SFSiriReaderPlaybackRateController);
  +[_SFSettingsAlertItem optionsGroupWithTitle:action:subItemAction:controller:](_SFSettingsAlertItem, "optionsGroupWithTitle:action:subItemAction:controller:", v2, 36, 37, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setAccessibilityIdentifier:", CFSTR("PlaybackRate"));
  return v4;
}

- (id)_playbackStateAndPositionAlertItem
{
  _SFSiriReaderPlaybackPositionAndStateController *v3;
  void *v4;
  id WeakRetained;
  void *v6;

  v3 = objc_alloc_init(_SFSiriReaderPlaybackPositionAndStateController);
  +[_SFSettingsAlertItem stepperWithController:action:handler:](_SFSettingsAlertItem, "stepperWithController:action:handler:", v3, 38, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setAccessibilityIdentifier:", CFSTR("PlaybackStateAndPosition"));
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  objc_msgSend(WeakRetained, "activeDocument");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", objc_msgSend(v6, "isBlockedByScreenTime") ^ 1);

  return v4;
}

- (void)reloadAlert
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  objc_msgSend(WeakRetained, "presentingViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(WeakRetained, "removeAllItems");
    objc_msgSend(WeakRetained, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "windowScene");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFPageFormatMenuController _constructMenuForAlert:orientation:](self, "_constructMenuForAlert:orientation:", WeakRetained, objc_msgSend(v6, "interfaceOrientation"));

    objc_msgSend(WeakRetained, "resizeMenu");
  }

}

- (void)dismissMenu
{
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  objc_msgSend(WeakRetained, "presentingViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(WeakRetained, "presentingViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

  }
}

- (void)_readerAvailabilityDidChange:(id)a3
{
  void *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;

  v12 = a3;
  objc_msgSend(v12, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  objc_msgSend(WeakRetained, "activeDocument");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "readerContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v12;
  if (v4 == v7)
  {
    objc_msgSend(v12, "userInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("isAvailable"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "BOOLValue");

    if (v11)
      -[_SFSettingsAlertItem setEnabled:](self->_readerAlertItem, "setEnabled:", 1);

    v8 = v12;
  }

}

- (_SFSettingsAlertItem)readerAlertItem
{
  return self->_readerAlertItem;
}

- (id)_readerAlertItem
{
  id WeakRetained;
  int v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  id v14;
  id location;

  objc_initWeak(&location, self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  v4 = objc_msgSend(WeakRetained, "isShowingReader");

  _WBSLocalizedString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("safari"));
  else
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("doc.plaintext"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0DC4A88];
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __47___SFPageFormatMenuController__readerAlertItem__block_invoke;
  v13 = &unk_1E4AC5018;
  objc_copyWeak(&v14, &location);
  +[_SFSettingsAlertItem buttonWithTitle:textStyle:icon:action:handler:](_SFSettingsAlertItem, "buttonWithTitle:textStyle:icon:action:handler:", v5, v7, v6, 5, &v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAccessibilityIdentifier:", CFSTR("HideReaderViewButton"), v10, v11, v12, v13);
  objc_destroyWeak(&v14);

  objc_destroyWeak(&location);
  return v8;
}

- (BOOL)_isActiveTabPausedOrPlaying
{
  id WeakRetained;
  uint64_t v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  v3 = objc_msgSend(WeakRetained, "siriReaderPlaybackStateForActiveTab");

  return (unint64_t)(v3 - 1) < 2;
}

- (BOOL)_isSiriReaderCurrentlyActive
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  v3 = objc_msgSend(WeakRetained, "siriReaderPlaybackStateForActiveTab");

  objc_msgSend(MEMORY[0x1E0D4ED50], "sharedPlaybackController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "currentPlaybackState");

  return (unint64_t)(v5 - 1) < 2 && v3 != 3;
}

- (void)updateShouldShowListeningControls:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL4 v5;
  uint64_t v6;
  id WeakRetained;

  v3 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  if (-[_SFPageFormatMenuController _isActiveTabPausedOrPlaying](self, "_isActiveTabPausedOrPlaying"))
  {
    if (!v3)
      goto LABEL_8;
  }
  else
  {
    v5 = -[_SFPageFormatMenuController _isSiriReaderCurrentlyActive](self, "_isSiriReaderCurrentlyActive");
    v6 = 0;
    if (!v5 || !v3)
      goto LABEL_9;
  }
  if (!objc_msgSend(MEMORY[0x1E0D8A8F8], "isSiriReadThisEnabled"))
  {
LABEL_8:
    v6 = 0;
    goto LABEL_9;
  }
  v6 = objc_msgSend(WeakRetained, "supportsSiriReadThis");
LABEL_9:
  objc_msgSend(WeakRetained, "setShouldShowListeningControls:", v6);

}

- (id)_titleForPlaybackState:(int64_t)a3
{
  void *v3;

  if ((unint64_t)(a3 - 2) >= 2 && a3 != 1)
  {
    objc_msgSend(MEMORY[0x1E0D4ED50], "sharedPlaybackController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "currentPlaybackState");

  }
  _WBSLocalizedString();
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_siriReaderAlertItemWithState:(int64_t)a3 identifier:(id)a4
{
  id WeakRetained;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  -[_SFPageFormatMenuController _titleForPlaybackState:](self, "_titleForPlaybackState:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:", CFSTR("speaker.wave.2.bubble.left"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0DC4A88];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __72___SFPageFormatMenuController__siriReaderAlertItemWithState_identifier___block_invoke;
  v13[3] = &unk_1E4AC05B8;
  v14 = WeakRetained;
  v10 = WeakRetained;
  +[_SFSettingsAlertItem buttonWithTitle:textStyle:icon:action:handler:](_SFSettingsAlertItem, "buttonWithTitle:textStyle:icon:action:handler:", v7, v9, v8, 32, v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAccessibilityIdentifier:", CFSTR("ActivateSiriReader"));

  return v11;
}

- (id)_mediaStateAlertItem
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  id location;

  objc_initWeak(&location, self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  objc_msgSend(WeakRetained, "activeDocument");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mediaStateIcon");

  SFTitleForTogglingMediaStateIcon();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0DC3870];
  SFSystemImageNameForTogglingMediaStateIcon();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "systemImageNamed:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = *MEMORY[0x1E0DC4A88];
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __51___SFPageFormatMenuController__mediaStateAlertItem__block_invoke;
  v16 = &unk_1E4AC5018;
  objc_copyWeak(&v17, &location);
  +[_SFSettingsAlertItem buttonWithTitle:textStyle:icon:action:handler:](_SFSettingsAlertItem, "buttonWithTitle:textStyle:icon:action:handler:", v5, v9, v8, 9, &v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor", v13, v14, v15, v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTintColor:", v11);

  objc_msgSend(v10, "setAccessibilityIdentifier:", CFSTR("ToggleMediaState"));
  objc_destroyWeak(&v17);

  objc_destroyWeak(&location);
  return v10;
}

- (id)_downloadsAlertItem
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  id v13;
  id location;

  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("arrow.down.circle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _WBSLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0DC4A88];
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __50___SFPageFormatMenuController__downloadsAlertItem__block_invoke;
  v12 = &unk_1E4AC5018;
  objc_copyWeak(&v13, &location);
  +[_SFSettingsAlertItem buttonWithTitle:textStyle:icon:action:handler:](_SFSettingsAlertItem, "buttonWithTitle:textStyle:icon:action:handler:", v4, v5, v3, 10, &v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setAccessibilityIdentifier:", CFSTR("ShowDownloads"), v9, v10, v11, v12);
  -[_SFPageFormatMenuController _updateDownloadsAlertItem:](self, "_updateDownloadsAlertItem:", v6);
  +[_SFPageFormatMenuBadgeView defaultComponentsArrangement](_SFPageFormatMenuBadgeView, "defaultComponentsArrangement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setComponentsArrangement:", v7);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
  return v6;
}

- (void)_updateDownloadsAlertItem:(id)a3
{
  int v4;
  int v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  _SFPageFormatMenuBadgeView *v12;
  void *v13;
  _SFPageFormatMenuBadgeView *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  id v19;

  v19 = a3;
  v4 = objc_msgSend(v19, "isEnabled");
  v5 = objc_msgSend(v19, "showsIndicatorDot");
  objc_msgSend(v19, "badgeText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[_SFDownloadManager sharedManager](_SFDownloadManager, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "runningDownloadsCount");

  if (v8)
  {
    objc_msgSend(v19, "badgeView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v19, "badgeView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPageFormatMenuController _localizedStringOfRunningDownloads](self, "_localizedStringOfRunningDownloads");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setBadgeText:", v11);

    }
    else
    {
      v12 = [_SFPageFormatMenuBadgeView alloc];
      -[_SFPageFormatMenuController _localizedStringOfRunningDownloads](self, "_localizedStringOfRunningDownloads");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[_SFPageFormatMenuBadgeView initWithText:](v12, "initWithText:", v13);
      objc_msgSend(v19, "setBadgeView:", v14);

    }
  }
  else
  {
    objc_msgSend(v19, "setShowsIndicatorDot:", -[_SFPageFormatMenuController _shouldShowUnviewedFinishedDownloadsIndicator](self, "_shouldShowUnviewedFinishedDownloadsIndicator"));
    objc_msgSend(v19, "setBadgeView:", 0);
  }
  objc_msgSend(v19, "setEnabled:", -[_SFPageFormatMenuController _shouldEnableDownloadsAlert](self, "_shouldEnableDownloadsAlert"));
  +[_SFDownloadManager sharedManager](_SFDownloadManager, "sharedManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "runningDownloadsCount"))
  {
    -[_SFPageFormatMenuController _localizedStringOfRunningDownloads](self, "_localizedStringOfRunningDownloads");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setBadgeText:", v16);

  }
  else
  {
    objc_msgSend(v19, "setBadgeText:", 0);
  }

  if (v4 != objc_msgSend(v19, "isEnabled")
    || v5 != objc_msgSend(v19, "showsIndicatorDot")
    || (objc_msgSend(v19, "badgeText"),
        v17 = (void *)objc_claimAutoreleasedReturnValue(),
        v18 = WBSIsEqual(),
        v17,
        (v18 & 1) == 0))
  {
    objc_msgSend(v19, "notifyObserversItemDidUpdate");
  }

}

- (id)_localizedStringOfRunningDownloads
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  +[_SFDownloadManager sharedManager](_SFDownloadManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringWithFormat:", CFSTR("%zu"), objc_msgSend(v3, "runningDownloadsCount"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)_shouldEnableDownloadsAlert
{
  id WeakRetained;
  BOOL v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  v3 = objc_msgSend(WeakRetained, "downloadsCount") != 0;

  return v3;
}

- (BOOL)_shouldShowUnviewedFinishedDownloadsIndicator
{
  void *v3;
  char v4;
  id WeakRetained;

  +[_SFDownloadManager sharedManager](_SFDownloadManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "runningDownloadsCount"))
  {
    v4 = 0;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
    v4 = objc_msgSend(WeakRetained, "hasUnviewedDownloads");

  }
  return v4;
}

- (void)_totalProgressDidChange:(id)a3
{
  -[_SFPageFormatMenuController _updateDownloadsAlertItem:](self, "_updateDownloadsAlertItem:", self->_downloadsAlertItem);
}

- (void)_didFinishLastDownload:(id)a3
{
  -[_SFPageFormatMenuController _updateDownloadsAlertItem:](self, "_updateDownloadsAlertItem:", self->_downloadsAlertItem);
}

- (void)_hasUnviewedDownloadsDidChange:(id)a3
{
  -[_SFPageFormatMenuController _updateDownloadsAlertItem:](self, "_updateDownloadsAlertItem:", self->_downloadsAlertItem);
}

- (id)_desktopMobileToggleAlertItemWithOrientation:(int64_t)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __CFString *v11;
  const __CFString *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, void *);
  void *v21;
  id v22;
  char v23;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  objc_msgSend(WeakRetained, "activeDocument");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "reloadOptionsController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "webView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSupportsAdvancedPrivacyProtections:", objc_msgSend(v5, "supportsAdvancedPrivacyProtectionsForURL:", v8));

  v9 = objc_msgSend(v6, "loadedUsingDesktopUserAgent");
  _WBSLocalizedString();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "safari_currentDeviceImageNameForOrientation:", a3);
  v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v9)
    v12 = v11;
  else
    v12 = CFSTR("desktopcomputer");
  objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *MEMORY[0x1E0DC4A88];
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __76___SFPageFormatMenuController__desktopMobileToggleAlertItemWithOrientation___block_invoke;
  v21 = &unk_1E4AC5040;
  v23 = v9;
  v22 = v6;
  v15 = v6;
  +[_SFSettingsAlertItem buttonWithTitle:textStyle:icon:action:handler:](_SFSettingsAlertItem, "buttonWithTitle:textStyle:icon:action:handler:", v10, v14, v13, 18, &v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setAccessibilityIdentifier:", CFSTR("ToggleDesktopMobileWebsite"), v18, v19, v20, v21);

  return v16;
}

- (id)_pauseAllAnimationsAlertItem
{
  void *v3;
  void *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  _WBSLocalizedString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("pause.circle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  objc_msgSend(WeakRetained, "activeDocument");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "activeWebView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = *MEMORY[0x1E0DC4A88];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __59___SFPageFormatMenuController__pauseAllAnimationsAlertItem__block_invoke;
  v12[3] = &unk_1E4AC05B8;
  v13 = v7;
  v9 = v7;
  +[_SFSettingsAlertItem buttonWithTitle:textStyle:icon:action:handler:](_SFSettingsAlertItem, "buttonWithTitle:textStyle:icon:action:handler:", v3, v8, v4, 30, v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAccessibilityIdentifier:", CFSTR("PauseAllAnimationsAlertItem"));

  return v10;
}

- (id)_playAllAnimationsAlertItem
{
  void *v3;
  void *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  _WBSLocalizedString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("play.circle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  objc_msgSend(WeakRetained, "activeDocument");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "activeWebView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = *MEMORY[0x1E0DC4A88];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __58___SFPageFormatMenuController__playAllAnimationsAlertItem__block_invoke;
  v12[3] = &unk_1E4AC05B8;
  v13 = v7;
  v9 = v7;
  +[_SFSettingsAlertItem buttonWithTitle:textStyle:icon:action:handler:](_SFSettingsAlertItem, "buttonWithTitle:textStyle:icon:action:handler:", v3, v8, v4, 31, v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAccessibilityIdentifier:", CFSTR("PlayAllAnimationsAlertItem"));

  return v10;
}

- (id)_fullScreenAlertItem
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  _WBSLocalizedString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0DC4A88];
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("arrow.up.left.and.arrow.down.right"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51___SFPageFormatMenuController__fullScreenAlertItem__block_invoke;
  v8[3] = &unk_1E4AC05B8;
  v8[4] = self;
  +[_SFSettingsAlertItem buttonWithTitle:textStyle:icon:action:handler:](_SFSettingsAlertItem, "buttonWithTitle:textStyle:icon:action:handler:", v3, v4, v5, 17, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setAccessibilityIdentifier:", CFSTR("HideToolbar"));
  return v6;
}

- (void)_anchorInWindowCoordinatesForAlert:(id)a3
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
  id v13;

  objc_msgSend(a3, "popoverPresentationController");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sourceView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sourceRect");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(v3, "window");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setSourceView:", v12);
  objc_msgSend(v12, "convertRect:fromView:", v3, v5, v7, v9, v11);
  objc_msgSend(v13, "setSourceRect:");

}

- (void)_buildTranslationAlertItemsWithSourceInfo:(id)a3
{
  id v4;
  NSArray *translationAlertItems;
  NSArray **p_translationAlertItems;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id WeakRetained;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id from;
  _QWORD v27[4];
  id v28;
  id v29;
  id location[2];

  v4 = a3;
  p_translationAlertItems = &self->_translationAlertItems;
  translationAlertItems = self->_translationAlertItems;
  self->_translationAlertItems = 0;

  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[_SFPageFormatMenuController _userFeedbackTranslationAlertItem](self, "_userFeedbackTranslationAlertItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v8);
  if (-[_SFPageFormatMenuController _hasStartedTranslation](self, "_hasStartedTranslation"))
  {
    -[_SFPageFormatMenuController _exitTranslationAlertItem](self, "_exitTranslationAlertItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "insertObject:atIndex:", v9, 0);

    -[_SFPageFormatMenuController _internalTapToRadarTranslationAlertItem](self, "_internalTapToRadarTranslationAlertItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "safari_addObjectUnlessNil:", v10);

    objc_storeStrong((id *)&self->_translationAlertItems, v7);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
    objc_msgSend(WeakRetained, "activeDocument");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "translationContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "availableTargetLocaleIdentifiers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "count"))
    {
      objc_msgSend(v8, "setEnabled:", 0);
      if (objc_msgSend(v14, "count") == 1)
      {
        objc_msgSend(v14, "firstObject");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[_SFPageFormatMenuController _translateAlertItemForLocaleIdentifier:](self, "_translateAlertItemForLocaleIdentifier:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "insertObject:atIndex:", v16, 0);

        objc_storeStrong((id *)p_translationAlertItems, v7);
      }
      else if ((unint64_t)objc_msgSend(v14, "count") >= 2)
      {
        _WBSLocalizedString();
        v17 = objc_claimAutoreleasedReturnValue();
        objc_initWeak(location, v4);
        objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:", CFSTR("translate"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = *MEMORY[0x1E0DC4A88];
        v27[0] = MEMORY[0x1E0C809B0];
        v27[1] = 3221225472;
        v27[2] = __73___SFPageFormatMenuController__buildTranslationAlertItemsWithSourceInfo___block_invoke;
        v27[3] = &unk_1E4AC5088;
        objc_copyWeak(&v29, location);
        v19 = v13;
        v28 = v19;
        v22 = (void *)v17;
        +[_SFSettingsAlertItem buttonWithTitle:textStyle:icon:action:handler:](_SFSettingsAlertItem, "buttonWithTitle:textStyle:icon:action:handler:", v17, v21, v18, 11, v27);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        objc_initWeak(&from, self);
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __73___SFPageFormatMenuController__buildTranslationAlertItemsWithSourceInfo___block_invoke_4;
        v23[3] = &unk_1E4AC50B0;
        objc_copyWeak(&v25, &from);
        v24 = v19;
        objc_msgSend(v20, "setSelectionHandler:", v23);
        objc_msgSend(v20, "setAccessibilityIdentifier:", CFSTR("Translate Website"));
        objc_msgSend(v7, "insertObject:atIndex:", v20, 0);
        objc_storeStrong((id *)p_translationAlertItems, v7);

        objc_destroyWeak(&v25);
        objc_destroyWeak(&from);

        objc_destroyWeak(&v29);
        objc_destroyWeak(location);

      }
    }

  }
}

- (id)_translateAlertItemForLocaleIdentifier:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  objc_msgSend(WeakRetained, "activeDocument");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "translationContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DC8], "safari_displayNameForLocaleIdentifier:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB3940];
  _WBSLocalizedString();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", v10, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = *MEMORY[0x1E0DC4A88];
  objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:", CFSTR("translate"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __70___SFPageFormatMenuController__translateAlertItemForLocaleIdentifier___block_invoke;
  v23[3] = &unk_1E4AC4B88;
  v24 = v7;
  v25 = v4;
  v15 = v4;
  v16 = v7;
  +[_SFSettingsAlertItem buttonWithTitle:textStyle:icon:action:handler:](_SFSettingsAlertItem, "buttonWithTitle:textStyle:icon:action:handler:", v11, v12, v13, 12, v23);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "setEnabled:", 0);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Translate-%@"), v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setAccessibilityIdentifier:", v18);

  v21[0] = v14;
  v21[1] = 3221225472;
  v21[2] = __70___SFPageFormatMenuController__translateAlertItemForLocaleIdentifier___block_invoke_2;
  v21[3] = &unk_1E4AC05E0;
  v19 = v17;
  v22 = v19;
  objc_msgSend(v16, "validateTargetLocale:completionHandler:", v15, v21);

  return v19;
}

- (id)_exitTranslationAlertItem
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  objc_msgSend(WeakRetained, "activeDocument");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "translationContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  _WBSLocalizedString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0DC4A88];
  objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:", CFSTR("translate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __56___SFPageFormatMenuController__exitTranslationAlertItem__block_invoke;
  v11[3] = &unk_1E4AC05B8;
  v12 = v4;
  v8 = v4;
  +[_SFSettingsAlertItem buttonWithTitle:textStyle:icon:action:handler:](_SFSettingsAlertItem, "buttonWithTitle:textStyle:icon:action:handler:", v5, v6, v7, 14, v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setAccessibilityIdentifier:", CFSTR("ReloadTranslatedWebpage"));
  return v9;
}

- (id)_internalTapToRadarTranslationAlertItem
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *);
  void *v20;
  id v21;
  id v22;

  if (!showInternalTranslationActions())
    return 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  objc_msgSend(WeakRetained, "activeDocument");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "translationContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "activeDocument");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "activeWebView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "window");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "windowScene");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  _WBSLocalizedString();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x1E0DC4A88];
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("ant"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __70___SFPageFormatMenuController__internalTapToRadarTranslationAlertItem__block_invoke;
  v20 = &unk_1E4AC4B88;
  v21 = v5;
  v22 = v9;
  v13 = v9;
  v14 = v5;
  +[_SFSettingsAlertItem buttonWithTitle:textStyle:icon:action:handler:](_SFSettingsAlertItem, "buttonWithTitle:textStyle:icon:action:handler:", v10, v11, v12, 16, &v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setAccessibilityIdentifier:", CFSTR("TranslationTapToRadar"), v17, v18, v19, v20);
  return v15;
}

- (id)_userFeedbackTranslationAlertItem
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  _WBSLocalizedString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0DC4A88];
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("exclamationmark.bubble"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __64___SFPageFormatMenuController__userFeedbackTranslationAlertItem__block_invoke;
  v8[3] = &unk_1E4AC05B8;
  v8[4] = self;
  +[_SFSettingsAlertItem buttonWithTitle:textStyle:icon:action:handler:](_SFSettingsAlertItem, "buttonWithTitle:textStyle:icon:action:handler:", v3, v4, v5, 15, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setAccessibilityIdentifier:", CFSTR("ReportTranslationIssue"));
  return v6;
}

- (void)_translationAvailabilityDidChange:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __65___SFPageFormatMenuController__translationAvailabilityDidChange___block_invoke;
  v6[3] = &unk_1E4ABFB20;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

- (id)_userFeedbackAutofillAlertItem
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  objc_msgSend(MEMORY[0x1E0D8A780], "titleText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0DC4A88];
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("exclamationmark.bubble"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __61___SFPageFormatMenuController__userFeedbackAutofillAlertItem__block_invoke;
  v8[3] = &unk_1E4AC05B8;
  v8[4] = self;
  +[_SFSettingsAlertItem buttonWithTitle:textStyle:icon:action:handler:](_SFSettingsAlertItem, "buttonWithTitle:textStyle:icon:action:handler:", v3, v4, v5, 29, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_pageZoomAlertItem
{
  id WeakRetained;
  SFPageZoomStepperController *v3;
  void *v4;
  void *v5;
  SFPageZoomStepperController *v6;
  void *v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  v3 = [SFPageZoomStepperController alloc];
  objc_msgSend(WeakRetained, "activeDocument");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "pageZoomManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SFPageZoomStepperController initWithDocument:preferenceManager:](v3, "initWithDocument:preferenceManager:", v4, v5);
  +[_SFSettingsAlertItem stepperWithController:action:handler:](_SFSettingsAlertItem, "stepperWithController:action:handler:", v6, 3, &__block_literal_global_207);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_readerTextSizeAlertItem
{
  SFReaderTextSizeStepperController *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  SFReaderTextSizeStepperController *v7;
  void *v8;

  v3 = [SFReaderTextSizeStepperController alloc];
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  objc_msgSend(WeakRetained, "activeDocument");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "readerContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SFReaderTextSizeStepperController initWithReaderContext:](v3, "initWithReaderContext:", v6);
  +[_SFSettingsAlertItem stepperWithController:action:handler:](_SFSettingsAlertItem, "stepperWithController:action:handler:", v7, 4, &__block_literal_global_209);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_readerThemeAlertItem
{
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  uint64_t v18;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  objc_msgSend(WeakRetained, "activeDocument");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "readerContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_loadWeakRetained((id *)&self->_viewController);
  v7 = objc_msgSend(v6, "provenance");

  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __52___SFPageFormatMenuController__readerThemeAlertItem__block_invoke;
  v16 = &unk_1E4AC5190;
  v17 = v5;
  v18 = v7;
  v8 = v5;
  +[SFReaderAppearanceThemeSelector themeSelectorWithBlock:](SFReaderAppearanceThemeSelector, "themeSelectorWithBlock:", &v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "configurationManager", v13, v14, v15, v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSelectedTheme:", objc_msgSend(v10, "themeForAppearance:", objc_msgSend(v8, "currentAppearance")));

  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  +[_SFSettingsAlertItem paletteWithAction:controller:](_SFSettingsAlertItem, "paletteWithAction:controller:", 0, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAccessibilityIdentifier:", CFSTR("ThemeSelector"));

  return v11;
}

- (id)_readerFontAlertItem
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  _SFReaderFontOptionsGroupController *v6;
  void *v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  objc_msgSend(WeakRetained, "activeDocument");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "readerContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  _WBSLocalizedString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[_SFReaderFontOptionsGroupController initWithReaderContext:]([_SFReaderFontOptionsGroupController alloc], "initWithReaderContext:", v4);
  +[_SFSettingsAlertItem optionsGroupWithTitle:action:subItemAction:controller:](_SFSettingsAlertItem, "optionsGroupWithTitle:action:subItemAction:controller:", v5, 6, 7, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setAccessibilityIdentifier:", CFSTR("ReaderFont"));
  return v7;
}

- (BOOL)_canToggleContentBlockers
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  char v7;
  void *v8;
  void *v9;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  if ((objc_msgSend(WeakRetained, "isShowingReader") & 1) != 0)
    goto LABEL_3;
  objc_msgSend(WeakRetained, "activeDocument");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "webView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "safari_isSafariWebExtensionURL");

  if ((v6 & 1) != 0)
  {
LABEL_3:
    v7 = 0;
  }
  else
  {
    objc_msgSend(WeakRetained, "perSitePreferencesVendor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "contentBlockersPreferenceManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v9, "hasEnabledContentBlockers");

  }
  return v7;
}

- (BOOL)_canHideToolbar
{
  id WeakRetained;
  void *v3;
  int v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  objc_msgSend(WeakRetained, "activeDocument");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "canHideToolbar"))
    v4 = objc_msgSend(WeakRetained, "isShowingReader") ^ 1;
  else
    LOBYTE(v4) = 0;

  return v4;
}

- (BOOL)_canToggleBetweenDesktopAndMobileSite
{
  id WeakRetained;
  int v3;
  void *v4;
  void *v5;
  void *v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  if ((objc_msgSend(WeakRetained, "isShowingReader") & 1) != 0)
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    objc_msgSend(WeakRetained, "activeDocument");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "webView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "URL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v6, "sf_isOfflineReadingListURL") & 1) != 0)
      LOBYTE(v3) = 0;
    else
      v3 = objc_msgSend(v6, "safari_isSafariWebExtensionURL") ^ 1;

  }
  return v3;
}

- (BOOL)_canShowWebsiteSettings
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  char v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  objc_msgSend(WeakRetained, "activeDocument");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "webView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "safari_isSafariWebExtensionURL") ^ 1;

  return v6;
}

- (BOOL)_canShowScribble
{
  id WeakRetained;
  char v3;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  if ((objc_msgSend(WeakRetained, "isShowingReader") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(WeakRetained, "activeDocument");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sfScribbleController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v5, "canEnableScribble");

  }
  return v3;
}

- (BOOL)_canTogglePrivateRelay
{
  id WeakRetained;
  char v3;
  void *v4;
  void *v5;
  void *v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  if ((objc_msgSend(WeakRetained, "isShowingReader") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(WeakRetained, "activeDocument");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isNavigatingViaReloadWithoutPrivateRelay") & 1) != 0)
    {
      v3 = 1;
    }
    else
    {
      objc_msgSend(v4, "webView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v4, "webView");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v3 = objc_msgSend(v6, "_wasPrivateRelayed");

      }
      else
      {
        v3 = 0;
      }

    }
  }

  return v3;
}

- (id)_privateRelayToggleAlertItem
{
  id WeakRetained;
  void *v3;
  char v4;
  const __CFString *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  id v16;
  char v17;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  objc_msgSend(WeakRetained, "activeDocument");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "wasLoadedWithPrivateRelay");
  if ((v4 & 1) != 0)
  {
    v5 = CFSTR("pin.point.of.interest.to.line.below");
    v6 = 20;
  }
  else
  {
    v5 = CFSTR("pin.point.of.interest.to.line.below.slash");
    v6 = 21;
  }
  _WBSLocalizedString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0DC4A88];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __59___SFPageFormatMenuController__privateRelayToggleAlertItem__block_invoke;
  v14[3] = &unk_1E4AC51E0;
  v17 = v4;
  v15 = v3;
  v16 = WeakRetained;
  v10 = WeakRetained;
  v11 = v3;
  +[_SFSettingsAlertItem buttonWithTitle:textStyle:icon:action:handler:](_SFSettingsAlertItem, "buttonWithTitle:textStyle:icon:action:handler:", v7, v9, v8, v6, v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAccessibilityIdentifier:", CFSTR("TogglePrivateRelay"));

  return v12;
}

- (BOOL)_hasStartedTranslation
{
  id WeakRetained;
  void *v3;
  void *v4;
  char v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  objc_msgSend(WeakRetained, "activeDocument");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "translationContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasStartedTranslating");

  return v5;
}

- (id)_contentBlockersToggleAlertItem
{
  id WeakRetained;
  void *v3;
  char v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  char v17;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  objc_msgSend(WeakRetained, "activeDocument");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "wasLoadedWithContentBlockersEnabled");
  if ((v4 & 1) != 0)
    v5 = CFSTR("shield.slash");
  else
    v5 = CFSTR("checkmark.shield");
  _WBSLocalizedString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0DC4A88];
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __62___SFPageFormatMenuController__contentBlockersToggleAlertItem__block_invoke;
  v15 = &unk_1E4AC5040;
  v16 = v3;
  v17 = v4;
  v9 = v3;
  +[_SFSettingsAlertItem buttonWithTitle:textStyle:icon:action:handler:](_SFSettingsAlertItem, "buttonWithTitle:textStyle:icon:action:handler:", v6, v8, v7, 19, &v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAccessibilityIdentifier:", CFSTR("ToggleContentBlockers"), v12, v13, v14, v15);

  return v10;
}

- (BOOL)_canToggleAdvancedPrivateBrowsingPrivacyProtections
{
  id WeakRetained;
  char v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  uint64_t v8;
  void *v9;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  if ((objc_msgSend(WeakRetained, "isShowingReader") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(WeakRetained, "activeDocument");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "webView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "URL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "safari_isSafariWebExtensionURL");

    if ((v7 & 1) != 0)
    {
      v3 = 0;
    }
    else
    {
      v8 = objc_msgSend(v4, "isPrivateBrowsingEnabled");
      objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v9, "safari_enableAdvancedPrivacyProtections:", v8);

    }
  }

  return v3;
}

- (id)_advancedPrivateBrowsingPrivacyProtectionsAlertItem
{
  id WeakRetained;
  void *v4;
  int v5;
  char v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, void *);
  void *v17;
  id v18;
  char v19;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  objc_msgSend(WeakRetained, "activeDocument");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "wasLoadedWithAdvancedPrivateBrowsingPrivacyProtections");
  v6 = v5;
  if (v5)
  {
    _WBSLocalizedString();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[_SFPageFormatMenuController _canTogglePrivateRelay](self, "_canTogglePrivateRelay"))
    {
      v8 = 23;
      goto LABEL_9;
    }
    v8 = 23;
  }
  else
  {
    _WBSLocalizedString();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[_SFPageFormatMenuController _canTogglePrivateRelay](self, "_canTogglePrivateRelay"))
    {
      v8 = 22;
      goto LABEL_9;
    }
    v8 = 22;
  }
  _WBSLocalizedString();
  v9 = objc_claimAutoreleasedReturnValue();

  v7 = (void *)v9;
LABEL_9:
  v10 = *MEMORY[0x1E0DC4A88];
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __82___SFPageFormatMenuController__advancedPrivateBrowsingPrivacyProtectionsAlertItem__block_invoke;
  v17 = &unk_1E4AC5040;
  v18 = v4;
  v19 = v6;
  v11 = v4;
  +[_SFSettingsAlertItem buttonWithTitle:textStyle:icon:action:handler:](_SFSettingsAlertItem, "buttonWithTitle:textStyle:icon:action:handler:", v7, v10, 0, v8, &v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAccessibilityIdentifier:", CFSTR("ToggleAdvancedPrivateBrowsingPrivacyProtections"), v14, v15, v16, v17);

  return v12;
}

- (id)_websiteSettingsAlertItem
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  _WBSLocalizedString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0DC4A88];
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("gear"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56___SFPageFormatMenuController__websiteSettingsAlertItem__block_invoke;
  v8[3] = &unk_1E4AC05B8;
  v8[4] = self;
  +[_SFSettingsAlertItem buttonWithTitle:textStyle:icon:action:handler:](_SFSettingsAlertItem, "buttonWithTitle:textStyle:icon:action:handler:", v3, v4, v5, 24, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setAccessibilityIdentifier:", CFSTR("WebsiteSettings"));
  return v6;
}

- (id)_scribbleAlertItem
{
  id WeakRetained;
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  objc_msgSend(WeakRetained, "activeDocument");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "sfScribbleController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInitiatedScribblingDisabled");

  if ((v5 & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    _WBSLocalizedString();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *MEMORY[0x1E0DC4A88];
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("eye.slash.fill"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __49___SFPageFormatMenuController__scribbleAlertItem__block_invoke;
    v11[3] = &unk_1E4AC05B8;
    v12 = v3;
    +[_SFSettingsAlertItem buttonWithTitle:textStyle:icon:action:handler:](_SFSettingsAlertItem, "buttonWithTitle:textStyle:icon:action:handler:", v7, v8, v9, 46, v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setAccessibilityIdentifier:", CFSTR("Scribble"));
  }

  return v6;
}

- (id)_clearEditsAlertItem
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  objc_msgSend(WeakRetained, "activeDocument");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  _WBSLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0DC4A88];
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("arrow.uturn.backward"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __51___SFPageFormatMenuController__clearEditsAlertItem__block_invoke;
  v10[3] = &unk_1E4AC05B8;
  v11 = v3;
  v7 = v3;
  +[_SFSettingsAlertItem buttonWithTitle:textStyle:icon:action:handler:](_SFSettingsAlertItem, "buttonWithTitle:textStyle:icon:action:handler:", v4, v5, v6, 47, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setAccessibilityIdentifier:", CFSTR("ClearEdits"));
  return v8;
}

- (id)_reportScribbleIssueItem
{
  id WeakRetained;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  _SFPageFormatMenuController *v16;
  id v17;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  objc_msgSend(WeakRetained, "activeDocument");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "sfScribbleController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInitiatedScribblingDisabled");

  if ((v6 & 1) != 0
    || !-[WBUFeatureManager isSafariSyncEnabled](self->_featureManager, "isSafariSyncEnabled"))
  {
    v10 = 0;
  }
  else
  {
    _WBSLocalizedString();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *MEMORY[0x1E0DC4A88];
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("exclamationmark.bubble"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __55___SFPageFormatMenuController__reportScribbleIssueItem__block_invoke;
    v15 = &unk_1E4AC4B88;
    v16 = self;
    v17 = v4;
    +[_SFSettingsAlertItem buttonWithTitle:textStyle:icon:action:handler:](_SFSettingsAlertItem, "buttonWithTitle:textStyle:icon:action:handler:", v7, v8, v9, 48, &v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setAccessibilityIdentifier:", CFSTR("ReportScribbleIssue"), v12, v13, v14, v15, v16);
  }

  return v10;
}

- (id)_manageExtensionsAlertItem
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id WeakRetained;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  _QWORD v19[5];

  _WBSLocalizedString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0DC4A88];
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("puzzlepiece.extension"));
  v5 = objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __57___SFPageFormatMenuController__manageExtensionsAlertItem__block_invoke;
  v19[3] = &unk_1E4AC05B8;
  v19[4] = self;
  +[_SFSettingsAlertItem buttonWithTitle:textStyle:icon:action:handler:](_SFSettingsAlertItem, "buttonWithTitle:textStyle:icon:action:handler:", v3, v4, v5, 27, v19);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setAccessibilityIdentifier:", CFSTR("ManageExtensions"));
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  objc_msgSend(WeakRetained, "activeDocument");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v8, "isPrivateBrowsingEnabled");

  if ((v5 & 1) != 0)
    goto LABEL_4;
  -[_SFPageFormatMenuController _webExtensionsController](self, "_webExtensionsController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "recentlyInstalledExtensionCount");
  -[_SFPageFormatMenuController _contentBlockerManager](self, "_contentBlockerManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "recentlyInstalledExtensionCount") + v10;

  if (!v12)
  {
LABEL_4:
    v15 = &stru_1E4AC8470;
  }
  else
  {
    v13 = (void *)MEMORY[0x1E0CB37F0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringFromNumber:numberStyle:", v14, 1);
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  +[SFWebExtensionPageMenuController badgeViewForText:](SFWebExtensionPageMenuController, "badgeViewForText:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBadgeView:", v16);

  objc_msgSend(v6, "setBadgeText:", v15);
  +[_SFPageFormatMenuBadgeView defaultComponentsArrangement](_SFPageFormatMenuBadgeView, "defaultComponentsArrangement");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setComponentsArrangement:", v17);

  return v6;
}

- (void)reloadBrowsingAssistantIfNeeded
{
  void *v3;
  id WeakRetained;

  if (objc_msgSend(MEMORY[0x1E0D8A8F8], "isBrowsingAssistantEnabled"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
    objc_msgSend(WeakRetained, "presentingViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
      objc_msgSend(WeakRetained, "reloadData");

  }
}

- (void)_clearCachedItems
{
  NSMutableDictionary *cachedMenuItems;
  _SFSettingsAlertItem *downloadsAlertItem;
  NSArray *translationAlertItems;
  SFBrowsingAssistantMenuSection *extensionsSection;
  SFBrowsingAssistantMenuSection *settingsSection;

  cachedMenuItems = self->_cachedMenuItems;
  self->_cachedMenuItems = 0;

  downloadsAlertItem = self->_downloadsAlertItem;
  self->_downloadsAlertItem = 0;

  translationAlertItems = self->_translationAlertItems;
  self->_translationAlertItems = 0;

  extensionsSection = self->_extensionsSection;
  self->_extensionsSection = 0;

  settingsSection = self->_settingsSection;
  self->_settingsSection = 0;

  -[_SFPageFormatMenuController _clearCachedCardItems](self, "_clearCachedCardItems");
}

- (void)_clearCachedCardItems
{
  SFBrowsingAssistantCardItem *cachedConsentCard;
  SFBrowsingAssistantCardItem *cachedListenToPageCard;
  SFBrowsingAssistantCardItem *cachedReaderCard;
  SFBrowsingAssistantCardItem *cachedReaderOptionsCard;
  NSMutableDictionary *cachedEntityCards;

  cachedConsentCard = self->_cachedConsentCard;
  self->_cachedConsentCard = 0;

  cachedListenToPageCard = self->_cachedListenToPageCard;
  self->_cachedListenToPageCard = 0;

  cachedReaderCard = self->_cachedReaderCard;
  self->_cachedReaderCard = 0;

  cachedReaderOptionsCard = self->_cachedReaderOptionsCard;
  self->_cachedReaderOptionsCard = 0;

  cachedEntityCards = self->_cachedEntityCards;
  self->_cachedEntityCards = 0;

}

- (id)_entityItems
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  NSMutableDictionary *cachedEntityCards;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSMutableDictionary *v19;
  NSMutableDictionary *v20;
  NSMutableDictionary *v21;
  void *v22;
  id WeakRetained;
  void *v25;
  id obj;
  uint64_t v27;
  _QWORD v28[4];
  id v29;
  id location;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  if ((objc_msgSend(WeakRetained, "isShowingReader") & 1) != 0
    || !objc_msgSend(MEMORY[0x1E0D8A7F8], "hasUserConsent"))
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(WeakRetained, "activeDocument");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    objc_msgSend(v25, "assistantController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "result");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "entityResults");
    obj = (id)objc_claimAutoreleasedReturnValue();

    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v6)
    {
      v27 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v32 != v27)
            objc_enumerationMutation(obj);
          v8 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          cachedEntityCards = self->_cachedEntityCards;
          objc_msgSend(v8, "identifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKeyedSubscript:](cachedEntityCards, "objectForKeyedSubscript:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (v11)
          {
            objc_msgSend(v3, "addObject:", v11);
          }
          else
          {
            objc_msgSend(v25, "assistantController");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "webpageIdentifier");
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v3, "count") + 3);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_initWeak(&location, self);
            v15 = (void *)MEMORY[0x1E0D4EBF8];
            v28[0] = MEMORY[0x1E0C809B0];
            v28[1] = 3221225472;
            v28[2] = __43___SFPageFormatMenuController__entityItems__block_invoke;
            v28[3] = &unk_1E4AC5208;
            objc_copyWeak(&v29, &location);
            objc_msgSend(v15, "entityCardWithSearchResult:webpageIdentifier:componentIdentifier:actionHandler:", v8, v13, v14, v28);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if (!self->_didDonateVisualPresentationEntityToBiome)
            {
              objc_msgSend(MEMORY[0x1E0D8A758], "sharedLogger");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "didShowEntityCardSBA");

              objc_msgSend(MEMORY[0x1E0D8A7C0], "sharedManager");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "donateBrowsingAssistantVisualComponentPresentationStartedWithWebPageID:componentType:componentIdentifier:summaryText:tableOfContentsArrayLength:", v13, objc_msgSend(MEMORY[0x1E0D8A7C0], "entityComponentTypeFromResult:", v8), v14, 0, 0);

            }
            v19 = self->_cachedEntityCards;
            if (!v19)
            {
              objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
              v20 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
              v21 = self->_cachedEntityCards;
              self->_cachedEntityCards = v20;

              v19 = self->_cachedEntityCards;
            }
            objc_msgSend(v8, "identifier");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKeyedSubscript:](v19, "setObject:forKeyedSubscript:", v16, v22);

            objc_msgSend(v3, "addObject:", v16);
            objc_destroyWeak(&v29);
            objc_destroyWeak(&location);

          }
        }
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      }
      while (v6);
    }

    if (objc_msgSend(v3, "count"))
      self->_didDonateVisualPresentationEntityToBiome = 1;

  }
  return v3;
}

- (BOOL)_shouldShowItemForAction:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  char v7;
  int v8;
  void *v10;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  objc_msgSend(WeakRetained, "activeDocument");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D4EFE8]))
    goto LABEL_5;
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D4F058]))
  {
    v7 = objc_msgSend(WeakRetained, "canTogglePinningTab");
    goto LABEL_6;
  }
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D4EFE0]))
  {
LABEL_5:
    v7 = objc_msgSend(WeakRetained, "canAddToBookmarks");
    goto LABEL_6;
  }
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D4EFF8]))
  {
    v7 = objc_msgSend(WeakRetained, "canAddToReadingList");
  }
  else if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D4EFF0]))
  {
    v7 = objc_msgSend(WeakRetained, "canAddToQuickNote");
  }
  else if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D4F008]))
  {
    v7 = objc_msgSend(WeakRetained, "canMoveToTabGroup");
  }
  else if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D4F018]))
  {
    v7 = objc_msgSend(WeakRetained, "supportsPrivacyReport");
  }
  else if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D4F010]))
  {
    v7 = objc_msgSend(WeakRetained, "canPrintCurrentTab");
  }
  else if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D4F030]))
  {
    v7 = -[_SFPageFormatMenuController _canShowScribble](self, "_canShowScribble");
  }
  else if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D4F000]))
  {
    v7 = -[_SFPageFormatMenuController _canHideToolbar](self, "_canHideToolbar");
  }
  else if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D4F028]))
  {
    v7 = -[_SFPageFormatMenuController _canToggleBetweenDesktopAndMobileSite](self, "_canToggleBetweenDesktopAndMobileSite");
  }
  else if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D4F048]))
  {
    v7 = -[_SFPageFormatMenuController _canToggleContentBlockers](self, "_canToggleContentBlockers");
  }
  else if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D4F038]))
  {
    v7 = -[_SFPageFormatMenuController _canToggleAdvancedPrivateBrowsingPrivacyProtections](self, "_canToggleAdvancedPrivateBrowsingPrivacyProtections");
  }
  else
  {
    if (!objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D4F060]))
    {
      if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D4F020]))
      {
        if (-[_SFPageFormatMenuController _canShowWebsiteSettings](self, "_canShowWebsiteSettings")
          && objc_msgSend(MEMORY[0x1E0D8A8F8], "isInternalInstall"))
        {
          objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v8) = objc_msgSend(v10, "BOOLForKey:", *MEMORY[0x1E0D8AE68]);

          goto LABEL_7;
        }
      }
      else if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D4F050]))
      {
        if ((objc_msgSend(WeakRetained, "hasDedicatedMediaStateButton") & 1) == 0 && objc_msgSend(v6, "mediaStateIcon"))
        {
          v8 = objc_msgSend(WeakRetained, "isShowingReader") ^ 1;
          goto LABEL_7;
        }
      }
      else if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D4F040])
             && WBSAXShouldShowAnimatedImageControls())
      {
        v7 = objc_msgSend(MEMORY[0x1E0CEF630], "instancesRespondToSelector:", sel__pauseAllAnimationsWithCompletionHandler_);
        goto LABEL_6;
      }
      LOBYTE(v8) = 0;
      goto LABEL_7;
    }
    v7 = -[_SFPageFormatMenuController _canTogglePrivateRelay](self, "_canTogglePrivateRelay");
  }
LABEL_6:
  LOBYTE(v8) = v7;
LABEL_7:

  return v8;
}

- (id)_itemForAction:(id)a3
{
  id v4;
  NSMutableDictionary *cachedMenuItems;
  NSMutableDictionary *v6;
  NSMutableDictionary *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  cachedMenuItems = self->_cachedMenuItems;
  if (!cachedMenuItems)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v7 = self->_cachedMenuItems;
    self->_cachedMenuItems = v6;

    cachedMenuItems = self->_cachedMenuItems;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](cachedMenuItems, "objectForKeyedSubscript:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    -[_SFPageFormatMenuController _makeItemForAction:](self, "_makeItemForAction:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cachedMenuItems, "setObject:forKeyedSubscript:", v9, v4);

  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_cachedMenuItems, "objectForKeyedSubscript:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_makeItemForAction:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  _SFPageFormatMenuPrivacyReportController *v21;
  void *v22;
  _SFPageFormatMenuPrivacyReportController *v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  id location;
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  id v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  id v40;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  objc_msgSend(WeakRetained, "activeDocument");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D4EFE8]))
  {
    if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D4F058]))
    {
      if (objc_msgSend(WeakRetained, "currentTabIsPinned"))
        v12 = CFSTR("pin.slash");
      else
        v12 = CFSTR("pin");
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", v12);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      _WBSLocalizedString();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *MEMORY[0x1E0DC4A88];
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __50___SFPageFormatMenuController__makeItemForAction___block_invoke_2;
      v37[3] = &unk_1E4AC05B8;
      v38 = WeakRetained;
      +[_SFSettingsAlertItem buttonWithTitle:textStyle:icon:action:handler:](_SFSettingsAlertItem, "buttonWithTitle:textStyle:icon:action:handler:", v8, v14, v7, 45, v37);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v38;
      goto LABEL_10;
    }
    if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D4EFE0]))
    {
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("book"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      _WBSLocalizedString();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *MEMORY[0x1E0DC4A88];
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __50___SFPageFormatMenuController__makeItemForAction___block_invoke_3;
      v35[3] = &unk_1E4AC05B8;
      v36 = WeakRetained;
      +[_SFSettingsAlertItem buttonWithTitle:textStyle:icon:action:handler:](_SFSettingsAlertItem, "buttonWithTitle:textStyle:icon:action:handler:", v8, v13, v7, 40, v35);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v36;
      goto LABEL_10;
    }
    if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D4EFF8]))
    {
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("eyeglasses"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      _WBSLocalizedString();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = *MEMORY[0x1E0DC4A88];
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __50___SFPageFormatMenuController__makeItemForAction___block_invoke_4;
      v33[3] = &unk_1E4AC05B8;
      v34 = WeakRetained;
      +[_SFSettingsAlertItem buttonWithTitle:textStyle:icon:action:handler:](_SFSettingsAlertItem, "buttonWithTitle:textStyle:icon:action:handler:", v8, v16, v7, 42, v33);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v34;
      goto LABEL_10;
    }
    if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D4EFF0]))
    {
      objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:", CFSTR("quicknote"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      _WBSLocalizedString();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = *MEMORY[0x1E0DC4A88];
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __50___SFPageFormatMenuController__makeItemForAction___block_invoke_5;
      v31[3] = &unk_1E4AC05B8;
      v32 = WeakRetained;
      +[_SFSettingsAlertItem buttonWithTitle:textStyle:icon:action:handler:](_SFSettingsAlertItem, "buttonWithTitle:textStyle:icon:action:handler:", v8, v17, v7, 41, v31);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v32;
      goto LABEL_10;
    }
    if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D4F008]))
    {
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("arrow.up.forward.app"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      _WBSLocalizedString();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      +[_SFSettingsAlertItem buttonWithTitle:textStyle:icon:action:handler:](_SFSettingsAlertItem, "buttonWithTitle:textStyle:icon:action:handler:", v19, *MEMORY[0x1E0DC4A88], v18, 43, &__block_literal_global_343);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_initWeak(&location, self);
        v28[0] = MEMORY[0x1E0C809B0];
        v28[1] = 3221225472;
        v28[2] = __50___SFPageFormatMenuController__makeItemForAction___block_invoke_8;
        v28[3] = &unk_1E4ABFF20;
        objc_copyWeak(&v29, &location);
        objc_msgSend(WeakRetained, "moveMenuOnPageMenuWithDismissHandler:", v28);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setPopUpMenu:", v20);

        objc_destroyWeak(&v29);
        objc_destroyWeak(&location);
      }
LABEL_19:

      goto LABEL_11;
    }
    if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D4F018]))
    {
      v21 = [_SFPageFormatMenuPrivacyReportController alloc];
      objc_msgSend(WeakRetained, "activeDocument");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[_SFPageFormatMenuPrivacyReportController initWithDocument:](v21, "initWithDocument:", v22);

      -[_SFPageFormatMenuPrivacyReportController setDelegate:](v23, "setDelegate:", self);
      -[_SFPageFormatMenuPrivacyReportController alertItem](v23, "alertItem");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_11;
    }
    if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D4F010]))
    {
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("printer"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      _WBSLocalizedString();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = *MEMORY[0x1E0DC4A88];
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __50___SFPageFormatMenuController__makeItemForAction___block_invoke_9;
      v26[3] = &unk_1E4AC05B8;
      v27 = WeakRetained;
      +[_SFSettingsAlertItem buttonWithTitle:textStyle:icon:action:handler:](_SFSettingsAlertItem, "buttonWithTitle:textStyle:icon:action:handler:", v8, v24, v7, 44, v26);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v27;
      goto LABEL_10;
    }
    if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D4F030]))
    {
      -[_SFPageFormatMenuController _scribbleAlertItem](self, "_scribbleAlertItem");
      v25 = objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D4F000]))
    {
      -[_SFPageFormatMenuController _fullScreenAlertItem](self, "_fullScreenAlertItem");
      v25 = objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D4F028]))
    {
      -[_SFPageFormatMenuController _desktopMobileToggleAlertItemWithOrientation:](self, "_desktopMobileToggleAlertItemWithOrientation:", -[_SFPageFormatMenuController _deviceOrientation](self, "_deviceOrientation"));
      v25 = objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D4F048]))
    {
      -[_SFPageFormatMenuController _contentBlockersToggleAlertItem](self, "_contentBlockersToggleAlertItem");
      v25 = objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D4F038]))
    {
      -[_SFPageFormatMenuController _advancedPrivateBrowsingPrivacyProtectionsAlertItem](self, "_advancedPrivateBrowsingPrivacyProtectionsAlertItem");
      v25 = objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D4F060]))
    {
      -[_SFPageFormatMenuController _privateRelayToggleAlertItem](self, "_privateRelayToggleAlertItem");
      v25 = objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D4F020]))
    {
      -[_SFPageFormatMenuController _userFeedbackAutofillAlertItem](self, "_userFeedbackAutofillAlertItem");
      v25 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D4F050]))
      {
        if (!objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D4F040]))
        {
          v10 = 0;
          goto LABEL_11;
        }
        objc_msgSend(v6, "activeWebView");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v18, "_allowsAnyAnimationToPlay") & 1) != 0)
          -[_SFPageFormatMenuController _pauseAllAnimationsAlertItem](self, "_pauseAllAnimationsAlertItem");
        else
          -[_SFPageFormatMenuController _playAllAnimationsAlertItem](self, "_playAllAnimationsAlertItem");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_19;
      }
      -[_SFPageFormatMenuController _mediaStateAlertItem](self, "_mediaStateAlertItem");
      v25 = objc_claimAutoreleasedReturnValue();
    }
    v10 = (void *)v25;
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("star"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _WBSLocalizedString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0DC4A88];
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __50___SFPageFormatMenuController__makeItemForAction___block_invoke;
  v39[3] = &unk_1E4AC05B8;
  v40 = WeakRetained;
  +[_SFSettingsAlertItem buttonWithTitle:textStyle:icon:action:handler:](_SFSettingsAlertItem, "buttonWithTitle:textStyle:icon:action:handler:", v8, v9, v7, 39, v39);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v40;
LABEL_10:

LABEL_11:
  return v10;
}

- (BOOL)_shouldShowScribbleFeedbackButton
{
  return 1;
}

- (BOOL)_shouldLaunchFeedbackAppForScribble
{
  return 0;
}

- (id)primaryMenuSectionsForEditMode:(BOOL)a3 inFirstLevelMenu:(BOOL)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  uint64_t v29;
  void *v30;
  NSArray *translationAlertItems;
  NSArray *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *k;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  _BOOL4 v50;
  id WeakRetained;
  void *v52;
  uint64_t v53;
  void *v54;
  BOOL v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _BYTE v72[128];
  _BYTE v73[128];
  _BYTE v74[128];
  uint64_t v75;

  v50 = a4;
  v75 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  objc_msgSend(MEMORY[0x1E0D4EC00], "favoritesSection");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "browsingAssistant_favoritedMenuActions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v68, v74, 16);
  v52 = v6;
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v69;
    v58 = *MEMORY[0x1E0D4F030];
    v53 = *MEMORY[0x1E0D4F078];
    v55 = a3;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v69 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * i);
        if (-[_SFPageFormatMenuController _shouldShowItemForAction:](self, "_shouldShowItemForAction:", v14))
        {
          if (a3 || !objc_msgSend(v14, "isEqualToString:", v58))
          {
            -[_SFPageFormatMenuController _itemForAction:](self, "_itemForAction:", v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "safari_addObjectUnlessNil:", v15);
          }
          else
          {
            -[_SFPageFormatMenuController _effectiveScribbleItems](self, "_effectiveScribbleItems");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            if ((unint64_t)objc_msgSend(v15, "count") > 1)
            {
              v17 = v7;
              if (objc_msgSend(v7, "count"))
              {
                v18 = v57;
                objc_msgSend(v57, "setItems:", v17);
                objc_msgSend(v6, "addObject:", v57);
                v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4EC00]), "initWithIdentifier:", v53);
                objc_msgSend(v19, "setItems:", v15);
                objc_msgSend(v6, "addObject:", v19);

              }
              else
              {
                v18 = v57;
                objc_msgSend(v57, "setItems:", v15);
                objc_msgSend(v6, "addObject:", v57);
              }
              v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0D4EC00]), "initWithIdentifier:", CFSTR("otherFavorites"));

              objc_msgSend(MEMORY[0x1E0C99DE8], "array");
              v7 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = v17;
              v57 = (void *)v20;
              v6 = v52;
              a3 = v55;
            }
            else
            {
              objc_msgSend(v15, "firstObject");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "safari_addObjectUnlessNil:", v16);
            }

          }
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v68, v74, 16);
    }
    while (v11);
  }

  v21 = WeakRetained;
  if (v50 && !objc_msgSend(WeakRetained, "isShowingReader"))
  {
    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    SFUnconfigurableMenuAcitons();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v64, v73, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v65;
      do
      {
        for (j = 0; j != v26; ++j)
        {
          if (*(_QWORD *)v65 != v27)
            objc_enumerationMutation(v24);
          v29 = *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * j);
          if (-[_SFPageFormatMenuController _shouldShowItemForAction:](self, "_shouldShowItemForAction:", v29))
          {
            -[_SFPageFormatMenuController _itemForAction:](self, "_itemForAction:", v29);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "safari_addObjectUnlessNil:", v30);

          }
        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v64, v73, 16);
      }
      while (v26);
    }

    translationAlertItems = self->_translationAlertItems;
    if (!translationAlertItems)
    {
      -[_SFPageFormatMenuController _buildTranslationAlertItemsWithSourceInfo:](self, "_buildTranslationAlertItemsWithSourceInfo:", 0);
      translationAlertItems = self->_translationAlertItems;
    }
    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    v32 = translationAlertItems;
    v33 = (void *)-[NSArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v60, v72, 16);
    if (v33)
    {
      v34 = 0;
      v54 = 0;
      v56 = 0;
      v59 = 0;
      v35 = *(_QWORD *)v61;
      do
      {
        for (k = 0; k != v33; k = (char *)k + 1)
        {
          if (*(_QWORD *)v61 != v35)
            objc_enumerationMutation(v32);
          v37 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * (_QWORD)k);
          v38 = v34;
          v39 = v37;
          switch(objc_msgSend(v37, "actionType"))
          {
            case 11:
            case 12:
              goto LABEL_43;
            case 14:
              v38 = v54;
              v39 = v34;
              v54 = v37;
              goto LABEL_43;
            case 15:
              v38 = v59;
              v39 = v34;
              v59 = v37;
              goto LABEL_43;
            case 16:
              v38 = v56;
              v39 = v34;
              v56 = v37;
LABEL_43:
              v40 = v37;

              v34 = v39;
              break;
            default:
              continue;
          }
        }
        v33 = (void *)-[NSArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v60, v72, 16);
      }
      while (v33);

      if (v34)
      {
        objc_msgSend(v7, "addObject:", v34);
        v22 = v57;
        objc_msgSend(v57, "setItems:", v7);
        v41 = v52;
        objc_msgSend(v52, "addObject:", v57);
        v21 = WeakRetained;
        v42 = v59;
        v43 = v54;
        v33 = v56;
LABEL_53:
        -[_SFPageFormatMenuController _downloadsSection](self, "_downloadsSection");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "safari_addObjectUnlessNil:", v47);

        -[_SFPageFormatMenuController _extensionsSection](self, "_extensionsSection");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "safari_addObjectUnlessNil:", v48);

        v23 = (void *)objc_msgSend(v41, "copy");
        v6 = v41;
        goto LABEL_54;
      }
      v21 = WeakRetained;
      v41 = v52;
      v22 = v57;
      v42 = v59;
      v33 = v56;
      if (v54)
      {
        objc_msgSend(v57, "setItems:", v7);
        objc_msgSend(v52, "addObject:", v57);
        v44 = objc_alloc(MEMORY[0x1E0D4EC00]);
        v45 = (void *)objc_msgSend(v44, "initWithIdentifier:", *MEMORY[0x1E0D4F080]);
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "safari_addObjectUnlessNil:", v54);
        objc_msgSend(v46, "safari_addObjectUnlessNil:", v59);
        objc_msgSend(v46, "safari_addObjectUnlessNil:", v56);
        objc_msgSend(v45, "setItems:", v46);
        objc_msgSend(v52, "addObject:", v45);

        v43 = v54;
        goto LABEL_52;
      }
    }
    else
    {

      v42 = 0;
      v41 = v52;
      v22 = v57;
    }
    objc_msgSend(v22, "setItems:", v7);
    objc_msgSend(v41, "addObject:", v22);
    v43 = 0;
LABEL_52:
    v34 = 0;
    goto LABEL_53;
  }
  v22 = v57;
  objc_msgSend(v57, "setItems:", v7);
  objc_msgSend(v6, "addObject:", v57);
  v23 = (void *)objc_msgSend(v6, "copy");
LABEL_54:

  return v23;
}

- (id)_extensionsSection
{
  id WeakRetained;
  BOOL v4;
  SFBrowsingAssistantMenuSection *extensionsSection;
  SFBrowsingAssistantMenuSection **p_extensionsSection;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  UIViewController **p_viewController;
  uint64_t v19;
  void *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  if ((objc_msgSend(WeakRetained, "hasDedicatedExtensionsButton") & 1) != 0)
  {

LABEL_6:
    v8 = 0;
    return v8;
  }
  v4 = -[_SFPageFormatMenuController _hasExtensionsAvailableToShowInManageExtensionsView](self, "_hasExtensionsAvailableToShowInManageExtensionsView");

  if (!v4)
    goto LABEL_6;
  p_extensionsSection = &self->_extensionsSection;
  extensionsSection = self->_extensionsSection;
  if (extensionsSection)
    return extensionsSection;
  v9 = objc_alloc(MEMORY[0x1E0D4EC00]);
  v8 = (void *)objc_msgSend(v9, "initWithIdentifier:", *MEMORY[0x1E0D4F070]);
  -[_SFPageFormatMenuController _manageExtensionsAlertItem](self, "_manageExtensionsAlertItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFPageFormatMenuController _extensionItems](self, "_extensionItems");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "arrayByAddingObjectsFromArray:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setItems:", v13);

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(v8, "items", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v23;
    p_viewController = &self->_viewController;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v23 != v17)
          objc_enumerationMutation(v14);
        v20 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v19);
        v21 = objc_loadWeakRetained((id *)p_viewController);
        objc_msgSend(v20, "setUpSelectionHandlerIfNeededWithViewController:", v21);

        ++v19;
      }
      while (v16 != v19);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v16);
  }

  objc_storeStrong((id *)p_extensionsSection, v8);
  return v8;
}

- (id)_downloadsSection
{
  id WeakRetained;
  BOOL v4;
  void *v5;
  _SFSettingsAlertItem *downloadsAlertItem;
  _SFSettingsAlertItem *v7;
  _SFSettingsAlertItem *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  if ((objc_msgSend(WeakRetained, "hasDedicatedDownloadsToolbarItem") & 1) != 0)
  {

LABEL_7:
    v5 = 0;
    return v5;
  }
  v4 = -[_SFPageFormatMenuController _shouldEnableDownloadsAlert](self, "_shouldEnableDownloadsAlert");

  if (!v4)
    goto LABEL_7;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4EC00]), "initWithIdentifier:", CFSTR("downloads"));
  downloadsAlertItem = self->_downloadsAlertItem;
  if (!downloadsAlertItem)
  {
    -[_SFPageFormatMenuController _downloadsAlertItem](self, "_downloadsAlertItem");
    v7 = (_SFSettingsAlertItem *)objc_claimAutoreleasedReturnValue();
    v8 = self->_downloadsAlertItem;
    self->_downloadsAlertItem = v7;

    downloadsAlertItem = self->_downloadsAlertItem;
  }
  v11[0] = downloadsAlertItem;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setItems:", v9);

  return v5;
}

- (id)moreMenuSectionsForEditMode:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t i;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id obj;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  BOOL v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "browsingAssistant_favoritedMenuActions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  SFMorePageMenuSections();
  obj = (id)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
  if (v31)
  {
    v30 = *(_QWORD *)v44;
    v37 = *MEMORY[0x1E0D4F030];
    v33 = *MEMORY[0x1E0D4F078];
    v9 = 0x1E0D4E000uLL;
    v34 = a3;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v44 != v30)
          objc_enumerationMutation(obj);
        v32 = v10;
        v11 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * v10);
        v38 = (void *)objc_msgSend(objc_alloc(*(Class *)(v9 + 3072)), "initWithIdentifier:", v11);
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v12 = objc_claimAutoreleasedReturnValue();
        v39 = 0u;
        v40 = 0u;
        v41 = 0u;
        v42 = 0u;
        SFSectionToConfigurableMenuActions();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v40;
          v18 = (void *)v12;
          do
          {
            for (i = 0; i != v16; ++i)
            {
              if (*(_QWORD *)v40 != v17)
                objc_enumerationMutation(v14);
              v20 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
              if (-[_SFPageFormatMenuController _shouldShowItemForAction:](self, "_shouldShowItemForAction:", v20)
                && (objc_msgSend(v8, "containsObject:", v20) & 1) == 0)
              {
                if (a3 || !objc_msgSend(v20, "isEqualToString:", v37))
                {
                  -[_SFPageFormatMenuController _itemForAction:](self, "_itemForAction:", v20);
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v18, "safari_addObjectUnlessNil:", v21);
                }
                else
                {
                  -[_SFPageFormatMenuController _effectiveScribbleItems](self, "_effectiveScribbleItems");
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  if ((unint64_t)objc_msgSend(v21, "count") > 1)
                  {
                    if (objc_msgSend(v18, "count"))
                    {
                      objc_msgSend(v38, "setItems:", v18);
                      objc_msgSend(v35, "addObject:", v38);
                      v36 = v18;
                      v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4EC00]), "initWithIdentifier:", v33);
                      objc_msgSend(v25, "setItems:", v21);
                      objc_msgSend(v35, "addObject:", v25);

                      v18 = v36;
                    }
                    else
                    {
                      objc_msgSend(v38, "setItems:", v21);
                      objc_msgSend(v35, "addObject:", v38);
                    }
                    v26 = objc_msgSend(objc_alloc(MEMORY[0x1E0D4EC00]), "initWithIdentifier:", CFSTR("otherAdvancedActions"));

                    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                    v24 = objc_claimAutoreleasedReturnValue();
                    v38 = (void *)v26;
                    a3 = v34;
                  }
                  else
                  {
                    objc_msgSend(v21, "firstObject");
                    v22 = objc_claimAutoreleasedReturnValue();
                    v23 = v18;
                    v18 = (void *)v22;
                    v24 = (uint64_t)v23;
                    objc_msgSend(v23, "safari_addObjectUnlessNil:", v22);
                  }

                  v18 = (void *)v24;
                }

              }
            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
          }
          while (v16);
        }
        else
        {
          v18 = (void *)v12;
        }

        objc_msgSend(v38, "setItems:", v18);
        objc_msgSend(v35, "addObject:", v38);

        v10 = v32 + 1;
        v9 = 0x1E0D4E000;
      }
      while (v32 + 1 != v31);
      v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
    }
    while (v31);
  }

  v27 = (void *)objc_msgSend(v35, "copy");
  return v27;
}

- (id)_effectiveScribbleItems
{
  void *v3;
  void *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  -[_SFPageFormatMenuController _itemForAction:](self, "_itemForAction:", *MEMORY[0x1E0D4F030]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safari_addObjectUnlessNil:", v3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  objc_msgSend(WeakRetained, "activeDocument");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "sfScribbleController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hiddenElementCount");

  if (v8)
  {
    -[_SFPageFormatMenuController _clearEditsAlertItem](self, "_clearEditsAlertItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safari_addObjectUnlessNil:", v9);

  }
  else if (!objc_msgSend(v6, "hasEnteredScribbleMode"))
  {
    goto LABEL_6;
  }
  if (-[_SFPageFormatMenuController _shouldShowScribbleFeedbackButton](self, "_shouldShowScribbleFeedbackButton"))
  {
    -[_SFPageFormatMenuController _reportScribbleIssueItem](self, "_reportScribbleIssueItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safari_addObjectUnlessNil:", v10);

  }
LABEL_6:
  v11 = (void *)objc_msgSend(v4, "copy");

  return v11;
}

- (int64_t)_deviceOrientation
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  objc_msgSend(WeakRetained, "presentingViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "windowScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "interfaceOrientation");

  return v7;
}

- (SFBrowsingAssistantMenuSection)settingsSection
{
  SFBrowsingAssistantMenuSection *settingsSection;
  id WeakRetained;
  void *v5;
  _SFPerSitePreferencesPopoverViewController *v6;
  void *v7;
  _SFPerSitePreferencesPopoverViewController *v8;
  SFBrowsingAssistantMenuSection *v9;
  SFBrowsingAssistantMenuSection *v10;
  SFBrowsingAssistantMenuSection *v11;

  if (-[_SFPageFormatMenuController _canShowWebsiteSettings](self, "_canShowWebsiteSettings"))
  {
    settingsSection = self->_settingsSection;
    if (!settingsSection)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
      objc_msgSend(WeakRetained, "activeDocument");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = [_SFPerSitePreferencesPopoverViewController alloc];
      objc_msgSend(v5, "perSitePreferencesVendor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[_SFPerSitePreferencesPopoverViewController initWithBrowserDocument:perSitePreferencesVendor:](v6, "initWithBrowserDocument:perSitePreferencesVendor:", v5, v7);

      -[_SFPerSitePreferencesPopoverViewController pageMenuSection](v8, "pageMenuSection");
      v9 = (SFBrowsingAssistantMenuSection *)objc_claimAutoreleasedReturnValue();
      v10 = self->_settingsSection;
      self->_settingsSection = v9;

      settingsSection = self->_settingsSection;
    }
    v11 = settingsSection;
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (unint64_t)_listenToPageActionStateForActiveTab
{
  id WeakRetained;
  void *v3;
  void *v4;
  unint64_t v5;
  uint64_t v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  if (objc_msgSend(WeakRetained, "supportsSiriReadThis"))
  {
    objc_msgSend(WeakRetained, "activeDocument");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "readerContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(WeakRetained, "canReadActiveLanguage")
      && objc_msgSend(v4, "isReaderAvailable")
      && (objc_msgSend(v3, "isBlockedByScreenTime") & 1) == 0)
    {
      v7 = objc_msgSend(WeakRetained, "siriReaderPlaybackStateForActiveTab");
      if ((unint64_t)(v7 - 1) > 2)
        v5 = 1;
      else
        v5 = qword_1A3CB11E8[v7 - 1];
    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NSArray)cardItems
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFPageFormatMenuController _listenToPageCard](self, "_listenToPageCard");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safari_addObjectUnlessNil:", v4);

  -[_SFPageFormatMenuController _readerCard](self, "_readerCard");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safari_addObjectUnlessNil:", v5);

  -[_SFPageFormatMenuController _readerOptionsCard](self, "_readerOptionsCard");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safari_addObjectUnlessNil:", v6);

  -[_SFPageFormatMenuController _consentCard](self, "_consentCard");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safari_addObjectUnlessNil:", v7);

  -[_SFPageFormatMenuController _entityItems](self, "_entityItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safari_addObjectsFromArrayUnlessNil:", v8);

  v9 = (void *)objc_msgSend(v3, "copy");
  return (NSArray *)v9;
}

- (void)_enableListenToPageButtonForCard:(id)a3
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "secondaryAction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "attributes");

  if ((v4 & 1) != 0)
  {
    objc_msgSend(v7, "secondaryAction");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");

    objc_msgSend(v6, "setAttributes:", objc_msgSend(v6, "attributes") & 0xFFFFFFFFFFFFFFFELL);
    objc_msgSend(v7, "setSecondaryAction:", v6);
    objc_msgSend(v7, "notifyObserverCardDidUpdate");

  }
}

- (id)_readerOptionsCard
{
  id WeakRetained;
  SFBrowsingAssistantCardItem *cachedReaderOptionsCard;
  SFBrowsingAssistantCardItem *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  SFBrowsingAssistantCardItem *v11;
  SFBrowsingAssistantCardItem *v12;
  void *v13;
  uint64_t v14;
  id v15;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  id location;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  if (objc_msgSend(WeakRetained, "isShowingReader"))
  {
    cachedReaderOptionsCard = self->_cachedReaderOptionsCard;
    if (cachedReaderOptionsCard)
    {
      v5 = cachedReaderOptionsCard;
    }
    else
    {
      objc_initWeak(&location, self);
      objc_msgSend(WeakRetained, "activeDocument");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "readerContext");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = -[_SFPageFormatMenuController _listenToPageActionStateForActiveTab](self, "_listenToPageActionStateForActiveTab");
      v9 = (void *)MEMORY[0x1E0D4EBF8];
      v10 = MEMORY[0x1E0C809B0];
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __49___SFPageFormatMenuController__readerOptionsCard__block_invoke;
      v21[3] = &unk_1E4ABFF20;
      objc_copyWeak(&v22, &location);
      v19[0] = v10;
      v19[1] = 3221225472;
      v19[2] = __49___SFPageFormatMenuController__readerOptionsCard__block_invoke_2;
      v19[3] = &unk_1E4ABFF20;
      objc_copyWeak(&v20, &location);
      objc_msgSend(v9, "readerOptionsCardWithReaderContext:dismissReaderHandler:listenToPageHandler:listenToPageActionState:", v7, v21, v19, v8);
      v11 = (SFBrowsingAssistantCardItem *)objc_claimAutoreleasedReturnValue();
      v12 = self->_cachedReaderOptionsCard;
      self->_cachedReaderOptionsCard = v11;

      if (v8)
      {
        objc_msgSend(MEMORY[0x1E0D4ED50], "sharedPlaybackController");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = MEMORY[0x1E0C80D38];
        v15 = MEMORY[0x1E0C80D38];
        v17[0] = v10;
        v17[1] = 3221225472;
        v17[2] = __49___SFPageFormatMenuController__readerOptionsCard__block_invoke_3;
        v17[3] = &unk_1E4AC5250;
        objc_copyWeak(&v18, &location);
        objc_msgSend(v13, "updateContentIdentifierOnQueue:completion:", v14, v17);

        objc_destroyWeak(&v18);
      }
      v5 = self->_cachedReaderOptionsCard;
      objc_destroyWeak(&v20);
      objc_destroyWeak(&v22);

      objc_destroyWeak(&location);
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_donateSummaryPresentationStartedIfNeeded
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  objc_msgSend(WeakRetained, "activeDocument");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assistantController");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "summary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length") && !self->_didDonateVisualPresentationSummaryToBiome)
  {
    objc_msgSend(MEMORY[0x1E0D8A758], "sharedLogger");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "didShowSummaryCardSBA");

    objc_msgSend(MEMORY[0x1E0D8A7C0], "sharedManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "webpageIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "donateBrowsingAssistantVisualComponentPresentationStartedWithWebPageID:componentType:componentIdentifier:summaryText:tableOfContentsArrayLength:", v8, 2, &unk_1E4B25D50, v5, 0);

    self->_didDonateVisualPresentationSummaryToBiome = 1;
  }

}

- (id)_readerCard
{
  id WeakRetained;
  SFBrowsingAssistantCardItem *v4;
  SFBrowsingAssistantCardItem *cachedReaderCard;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  SFBrowsingAssistantCardItem *v21;
  SFBrowsingAssistantCardItem *v22;
  int v23;
  void *v24;
  uint64_t v25;
  id v26;
  void *v27;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  id v40;
  id v41;
  _QWORD v42[4];
  id v43;
  id v44;
  id v45;
  id location[2];

  objc_initWeak(location, self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  if ((objc_msgSend(WeakRetained, "isShowingReader") & 1) == 0)
  {
    cachedReaderCard = self->_cachedReaderCard;
    if (cachedReaderCard)
    {
      v4 = cachedReaderCard;
      goto LABEL_22;
    }
    objc_msgSend(WeakRetained, "activeDocument");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "readerContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isReaderAvailable");
    objc_msgSend(v6, "assistantController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(MEMORY[0x1E0D8A7F8], "hasUserConsent")
      && objc_msgSend(v9, "isSummaryAvailable"))
    {
      objc_msgSend(v9, "summary");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC36C0]), "initWithDelegate:", self);
      -[_SFPageFormatMenuController _donateSummaryPresentationStartedIfNeeded](self, "_donateSummaryPresentationStartedIfNeeded");
    }
    else
    {
      v10 = 0;
      v32 = 0;
      v4 = 0;
      if (!v8)
      {
LABEL_21:

        goto LABEL_22;
      }
    }
    objc_msgSend(v9, "cachedReaderArticleTitle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v29 = v6;
    if (v11)
    {
      v31 = v11;
    }
    else
    {
      objc_msgSend(v6, "webView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "title");
      v31 = (id)objc_claimAutoreleasedReturnValue();

    }
    v14 = -[_SFPageFormatMenuController _listenToPageActionStateForActiveTab](self, "_listenToPageActionStateForActiveTab");
    v30 = v7;
    objc_msgSend(v9, "result");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "disclaimerText");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (void *)MEMORY[0x1E0D4EBF8];
    v18 = MEMORY[0x1E0C809B0];
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __42___SFPageFormatMenuController__readerCard__block_invoke;
    v42[3] = &unk_1E4AC07A8;
    objc_copyWeak(&v45, location);
    v19 = v10;
    v43 = v19;
    v20 = v9;
    v44 = v20;
    v39[0] = v18;
    v39[1] = 3221225472;
    v39[2] = __42___SFPageFormatMenuController__readerCard__block_invoke_2;
    v39[3] = &unk_1E4ABFF70;
    objc_copyWeak(&v41, location);
    v40 = WeakRetained;
    v7 = v30;
    objc_msgSend(v17, "readerCardWithReaderContext:title:summary:disclaimer:contextMenuInteraction:showReaderHandler:listenToPageHandler:listenToPageActionState:", v30, v31, v19, v16, v32, v42, v39, v14);
    v21 = (SFBrowsingAssistantCardItem *)objc_claimAutoreleasedReturnValue();
    v22 = self->_cachedReaderCard;
    self->_cachedReaderCard = v21;

    if (v14)
      v23 = v8;
    else
      v23 = 0;
    if (v23 == 1)
    {
      objc_msgSend(MEMORY[0x1E0D4ED50], "sharedPlaybackController");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = MEMORY[0x1E0C80D38];
      v26 = MEMORY[0x1E0C80D38];
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __42___SFPageFormatMenuController__readerCard__block_invoke_3;
      v37[3] = &unk_1E4AC5250;
      objc_copyWeak(&v38, location);
      objc_msgSend(v24, "updateContentIdentifierOnQueue:completion:", v25, v37);

      objc_destroyWeak(&v38);
      v7 = v30;
    }
    v6 = v29;
    if (v8)
    {
      objc_msgSend(v20, "cachedReaderArticleTitle");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v27)
      {
        v33[0] = MEMORY[0x1E0C809B0];
        v33[1] = 3221225472;
        v33[2] = __42___SFPageFormatMenuController__readerCard__block_invoke_4;
        v33[3] = &unk_1E4AC5278;
        objc_copyWeak(&v36, location);
        v34 = v20;
        v35 = v31;
        objc_msgSend(v7, "getReaderArticleTitleWithCompletion:", v33);

        objc_destroyWeak(&v36);
      }
    }
    v4 = self->_cachedReaderCard;

    objc_destroyWeak(&v41);
    objc_destroyWeak(&v45);

    goto LABEL_21;
  }
  v4 = 0;
LABEL_22:

  objc_destroyWeak(location);
  return v4;
}

- (void)updateReaderCardWithSummaryIfNeeded
{
  id WeakRetained;
  void *v4;
  int v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  objc_msgSend(WeakRetained, "activeDocument");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assistantController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(MEMORY[0x1E0D8A7F8], "hasUserConsent");
  v6 = v12;
  if (v5)
  {
    v7 = objc_msgSend(v12, "isSummaryAvailable");
    v6 = v12;
    if (v7)
    {
      if (self->_cachedReaderCard)
      {
        objc_msgSend(v12, "summary");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC36C0]), "initWithDelegate:", self);
        -[SFBrowsingAssistantCardItem bodyText](self->_cachedReaderCard, "bodyText");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v8, "isEqualToString:", v10);

        if ((v11 & 1) == 0)
        {
          -[SFBrowsingAssistantCardItem setBodyText:](self->_cachedReaderCard, "setBodyText:", v8);
          -[SFBrowsingAssistantCardItem setContextMenuInteraction:](self->_cachedReaderCard, "setContextMenuInteraction:", v9);
          -[SFBrowsingAssistantCardItem notifyObserverCardDidUpdate](self->_cachedReaderCard, "notifyObserverCardDidUpdate");
          -[_SFPageFormatMenuController _donateSummaryPresentationStartedIfNeeded](self, "_donateSummaryPresentationStartedIfNeeded");
        }

        v6 = v12;
      }
    }
  }

}

- (id)_listenToPageCard
{
  id WeakRetained;
  void *v4;
  uint64_t v5;
  BOOL v6;
  SFBrowsingAssistantCardItem *v7;
  uint64_t v9;
  BOOL v10;
  SFBrowsingAssistantCardItem *cachedListenToPageCard;
  SFBrowsingAssistantCardItem *v12;
  SFBrowsingAssistantCardItem *v13;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  if (objc_msgSend(WeakRetained, "supportsSiriReadThis")
    && ((objc_msgSend(MEMORY[0x1E0D4ED50], "sharedPlaybackController"),
         v4 = (void *)objc_claimAutoreleasedReturnValue(),
         v5 = objc_msgSend(v4, "currentPlaybackState"),
         v4,
         v5)
      ? (v6 = v5 == 3)
      : (v6 = 1),
        !v6
     && (v9 = objc_msgSend(WeakRetained, "siriReaderPlaybackStateForActiveTab"),
         v5 != 1 ? (v10 = v9 == v5) : (v10 = 1),
         v10)))
  {
    cachedListenToPageCard = self->_cachedListenToPageCard;
    if (!cachedListenToPageCard)
    {
      objc_msgSend(MEMORY[0x1E0D4EBF8], "listenToPageCard");
      v12 = (SFBrowsingAssistantCardItem *)objc_claimAutoreleasedReturnValue();
      v13 = self->_cachedListenToPageCard;
      self->_cachedListenToPageCard = v12;

      cachedListenToPageCard = self->_cachedListenToPageCard;
    }
    v7 = cachedListenToPageCard;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_consentCard
{
  id WeakRetained;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  SFBrowsingAssistantCardItem *cachedConsentCard;
  SFBrowsingAssistantCardItem *v11;
  void *v13;
  uint64_t v14;
  SFBrowsingAssistantCardItem *v15;
  SFBrowsingAssistantCardItem *v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  id location;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  if ((objc_msgSend(WeakRetained, "isShowingReader") & 1) != 0)
    goto LABEL_7;
  if (!objc_msgSend(MEMORY[0x1E0D8A7F8], "shouldShowConsentCard"))
    goto LABEL_7;
  objc_msgSend(WeakRetained, "activeDocument");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isPrivateBrowsingEnabled");

  if ((v5 & 1) != 0)
    goto LABEL_7;
  v6 = (void *)MEMORY[0x1E0D8A7F0];
  objc_msgSend(WeakRetained, "activeDocument");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "translationContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "webpageLocale");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v6, "assistantEnabledForLocale:", v9);

  if (!(_DWORD)v6)
  {
LABEL_7:
    v11 = 0;
  }
  else
  {
    cachedConsentCard = self->_cachedConsentCard;
    if (cachedConsentCard)
    {
      v11 = cachedConsentCard;
    }
    else
    {
      objc_initWeak(&location, self);
      v13 = (void *)MEMORY[0x1E0D4EBF8];
      v14 = MEMORY[0x1E0C809B0];
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __43___SFPageFormatMenuController__consentCard__block_invoke;
      v19[3] = &unk_1E4ABFF20;
      objc_copyWeak(&v20, &location);
      v17[0] = v14;
      v17[1] = 3221225472;
      v17[2] = __43___SFPageFormatMenuController__consentCard__block_invoke_2;
      v17[3] = &unk_1E4ABFF20;
      objc_copyWeak(&v18, &location);
      objc_msgSend(v13, "consentCardWithNotNowHandler:continueHandler:", v19, v17);
      v15 = (SFBrowsingAssistantCardItem *)objc_claimAutoreleasedReturnValue();
      v16 = self->_cachedConsentCard;
      self->_cachedConsentCard = v15;

      v11 = self->_cachedConsentCard;
      objc_destroyWeak(&v18);
      objc_destroyWeak(&v20);
      objc_destroyWeak(&location);
    }
  }

  return v11;
}

- (void)configureMainHeaderFooter:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  SFReaderTextSizeStepperController *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  SFPageZoomStepperController *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id from;
  id location[2];

  v4 = a3;
  objc_initWeak(location, self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  objc_msgSend(WeakRetained, "activeDocument");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(WeakRetained, "isShowingReader"))
  {
    v7 = [SFReaderTextSizeStepperController alloc];
    objc_msgSend(WeakRetained, "activeDocument");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "readerContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[SFReaderTextSizeStepperController initWithReaderContext:](v7, "initWithReaderContext:", v9);
  }
  else
  {
    v11 = [SFPageZoomStepperController alloc];
    objc_msgSend(WeakRetained, "activeDocument");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "pageZoomManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[SFPageZoomStepperController initWithDocument:preferenceManager:](v11, "initWithDocument:preferenceManager:", v8, v9);
  }
  v12 = (void *)v10;

  v13 = MEMORY[0x1E0C809B0];
  if (v12)
  {
    objc_msgSend(v4, "stepper");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      v15 = objc_alloc_init(MEMORY[0x1E0D4ED68]);
      objc_msgSend(v4, "setStepper:", v15);

    }
    objc_msgSend(v4, "stepper");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "prepareStepper:", v16);
    objc_initWeak(&from, v16);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v30[0] = v13;
      v30[1] = 3221225472;
      v30[2] = __57___SFPageFormatMenuController_configureMainHeaderFooter___block_invoke;
      v30[3] = &unk_1E4AC52A0;
      objc_copyWeak(&v31, &from);
      objc_msgSend(v12, "setDidSetValueHandler:", v30);
      objc_destroyWeak(&v31);
    }
    v26[0] = v13;
    v26[1] = 3221225472;
    v26[2] = __57___SFPageFormatMenuController_configureMainHeaderFooter___block_invoke_2;
    v26[3] = &unk_1E4AC52C8;
    objc_copyWeak(&v28, &from);
    v17 = v12;
    v27 = v17;
    objc_copyWeak(&v29, location);
    objc_msgSend(v16, "setDecrementButtonActionHandler:", v26);
    v22[0] = v13;
    v22[1] = 3221225472;
    v22[2] = __57___SFPageFormatMenuController_configureMainHeaderFooter___block_invoke_3;
    v22[3] = &unk_1E4AC52C8;
    objc_copyWeak(&v24, &from);
    v23 = v17;
    objc_copyWeak(&v25, location);
    objc_msgSend(v16, "setIncrementButtonActionHandler:", v22);
    objc_destroyWeak(&v25);

    objc_destroyWeak(&v24);
    objc_destroyWeak(&v29);

    objc_destroyWeak(&v28);
    objc_destroyWeak(&from);

    v13 = MEMORY[0x1E0C809B0];
  }
  objc_msgSend(v4, "setLeadingButtonEnabled:", objc_msgSend(WeakRetained, "canFindOnPage"));
  v19[0] = v13;
  v19[1] = 3221225472;
  v19[2] = __57___SFPageFormatMenuController_configureMainHeaderFooter___block_invoke_4;
  v19[3] = &unk_1E4ABFF70;
  objc_copyWeak(&v21, location);
  v18 = v6;
  v20 = v18;
  objc_msgSend(v4, "setLeadingButtonActionHandler:", v19);

  objc_destroyWeak(&v21);
  objc_destroyWeak(location);

}

- (void)_didTapButtonInStepper:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  objc_msgSend(WeakRetained, "setStepperFocused:", 1);
  if ((objc_msgSend(WeakRetained, "_isInPopoverPresentation") & 1) == 0
    && (objc_msgSend(WeakRetained, "isBeingDismissed") & 1) == 0)
  {
    objc_msgSend(WeakRetained, "presentingViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "pulse");
      objc_msgSend(WeakRetained, "popoverPresentationController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "adaptiveSheetPresentationController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "containerView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = objc_alloc_init(MEMORY[0x1E0D4ED70]);
      objc_msgSend(v9, "bounds");
      objc_msgSend(v10, "setFrame:");
      objc_msgSend(v9, "addSubview:", v10);
      objc_msgSend(v10, "setStepper:", v4);
      v11 = objc_loadWeakRetained((id *)&self->_browserContentController);
      self->_stepperIsInTransitionView = 1;
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __54___SFPageFormatMenuController__didTapButtonInStepper___block_invoke;
      v14[3] = &unk_1E4ABFC38;
      v14[4] = self;
      v15 = v11;
      v16 = v10;
      v12 = v10;
      v13 = v11;
      objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 1, v14);

    }
  }

}

- (void)browsingAssistantWillAppear:(id)a3
{
  id WeakRetained;

  if ((objc_msgSend(a3, "_isInPopoverPresentation") & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
    objc_msgSend(WeakRetained, "willPresentBrowsingAssistantInSheet");

  }
}

- (void)browsingAssistantWillDisappear:(id)a3
{
  id WeakRetained;

  if ((objc_msgSend(a3, "_isInPopoverPresentation") & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
    objc_msgSend(WeakRetained, "willDismissBrowsingAssistantInSheet");

  }
}

- (id)viewControllerForPresentationForItemController:(id)a3
{
  id WeakRetained;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  objc_msgSend(WeakRetained, "viewControllerToPresentFrom");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)presentModalViewController:(id)a3 completion:(id)a4
{
  _SFBrowserContentController **p_browserContentController;
  id v6;
  id v7;
  id WeakRetained;

  p_browserContentController = &self->_browserContentController;
  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_browserContentController);
  objc_msgSend(WeakRetained, "presentModalViewController:completion:", v7, v6);

}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  objc_msgSend(WeakRetained, "activeDocument");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "assistantController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "result");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "summaryResult");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0;
  v20 = &v19;
  v21 = 0x2050000000;
  v11 = (void *)getSearchUIClass_softClass;
  v22 = getSearchUIClass_softClass;
  if (!getSearchUIClass_softClass)
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __getSearchUIClass_block_invoke;
    v18[3] = &unk_1E4ABFC78;
    v18[4] = &v19;
    __getSearchUIClass_block_invoke((uint64_t)v18);
    v11 = (void *)v20[3];
  }
  v12 = objc_retainAutorelease(v11);
  _Block_object_dispose(&v19, 8);
  objc_msgSend(v12, "rowViewForResult:style:feedbackDelegate:", v10, 0, self);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v15 = (void *)MEMORY[0x1E0DC36B8];
    objc_msgSend(v13, "contextMenuActionProvider");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "configurationWithIdentifier:previewProvider:actionProvider:", 0, 0, v16);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v14;
}

- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 highlightPreviewForItemWithIdentifier:(id)a5
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = (objc_class *)MEMORY[0x1E0DC3B78];
  v6 = a3;
  v7 = objc_alloc_init(v5);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v8);

  objc_msgSend(v6, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "bounds");
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRoundedRect:cornerRadius:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setVisiblePath:", v10);

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D90]), "initWithView:parameters:", v9, v7);
  return v11;
}

- (void)didReportUserResponseFeedback:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0D8A7F0];
  v4 = a3;
  objc_msgSend(v3, "sharedPARSession");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didReportUserResponseFeedback:", v4);

}

- (_SFBrowserContentController)browserContentController
{
  return (_SFBrowserContentController *)objc_loadWeakRetained((id *)&self->_browserContentController);
}

- (UIViewController)viewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_viewController);
}

- (_SFPageFormatMenuUIMenuBuilder)uiMenuBuilder
{
  return self->_uiMenuBuilder;
}

- (BOOL)stepperIsInTransitionView
{
  return self->_stepperIsInTransitionView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uiMenuBuilder, 0);
  objc_destroyWeak((id *)&self->_viewController);
  objc_destroyWeak((id *)&self->_browserContentController);
  objc_storeStrong((id *)&self->_featureManager, 0);
  objc_storeStrong((id *)&self->_cachedEntityCards, 0);
  objc_storeStrong((id *)&self->_cachedReaderOptionsCard, 0);
  objc_storeStrong((id *)&self->_cachedReaderCard, 0);
  objc_storeStrong((id *)&self->_cachedListenToPageCard, 0);
  objc_storeStrong((id *)&self->_cachedConsentCard, 0);
  objc_storeStrong((id *)&self->_settingsSection, 0);
  objc_storeStrong((id *)&self->_extensionsSection, 0);
  objc_storeStrong((id *)&self->_cachedMenuItems, 0);
  objc_storeStrong((id *)&self->_cachedSiriReaderAlertItem, 0);
  objc_storeStrong((id *)&self->_translationAlertItems, 0);
  objc_storeStrong((id *)&self->_downloadsAlertItem, 0);
  objc_storeStrong((id *)&self->_readerAlertItem, 0);
}

@end
