@implementation MUOfficialAppSectionController

- (MUOfficialAppSectionController)initWithMapItem:(id)a3 usingCachedMediaResults:(id)a4
{
  id v7;
  MUOfficialAppSectionController *v8;
  NSObject *v9;
  NSObject *v10;
  uint8_t v12[16];
  objc_super v13;

  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MUOfficialAppSectionController;
  v8 = -[MUPlaceSectionController initWithMapItem:](&v13, sel_initWithMapItem_, a3);
  if (v8)
  {
    MUGetPlaceCardLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v9))
    {
      *(_WORD *)v12 = 0;
      _os_signpost_emit_with_name_impl(&dword_191DB8000, v9, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "MUOfficialAppSectionControllerInit", ", v12, 2u);
    }

    objc_storeStrong((id *)&v8->_cachedMediaResults, a4);
    -[MUOfficialAppSectionController _hydrateViewWithApp](v8, "_hydrateViewWithApp");
    MUGetPlaceCardLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v10))
    {
      *(_WORD *)v12 = 0;
      _os_signpost_emit_with_name_impl(&dword_191DB8000, v10, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "MUOfficialAppSectionControllerInit", ", v12, 2u);
    }

  }
  return v8;
}

- (void)_setupLockupView
{
  MUPlaceAppLockupView *v3;
  MUPlaceAppLockupView *v4;
  MUPlaceAppLockupView *officialAppView;
  MUPlaceSectionView *v6;
  void *v7;
  MUPlaceSectionView *v8;
  MUPlaceSectionView *sectionView;
  MUPlatterView *v10;

  v3 = [MUPlaceAppLockupView alloc];
  v4 = -[MUPlaceAppLockupView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  officialAppView = self->_officialAppView;
  self->_officialAppView = v4;

  -[MUPlaceAppLockupView setTranslatesAutoresizingMaskIntoConstraints:](self->_officialAppView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MUPlaceAppLockupView setDelegate:](self->_officialAppView, "setDelegate:", self);
  v10 = -[MUPlatterView initWithContentView:]([MUPlatterView alloc], "initWithContentView:", self->_officialAppView);
  v6 = [MUPlaceSectionView alloc];
  -[MUOfficialAppSectionController sectionHeaderViewModel](self, "sectionHeaderViewModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[MUPlaceSectionView initWithStyle:sectionHeaderViewModel:](v6, "initWithStyle:sectionHeaderViewModel:", 1, v7);
  sectionView = self->_sectionView;
  self->_sectionView = v8;

  -[MUPlaceSectionView attachViewToContentView:](self->_sectionView, "attachViewToContentView:", v10);
  -[MUPlaceSectionView configureWithSectionController:](self->_sectionView, "configureWithSectionController:", self);

}

- (void)_hydrateViewWithApp
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  _QWORD v21[4];
  id v22;
  void *v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  -[MUPlaceSectionController mapItem](self, "mapItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_preferedAppAdamID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[MUTimeExpirableLRUCache objectForKey:](self->_cachedMediaResults, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  MUGetPlaceCardLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (v8)
    {
      *(_DWORD *)buf = 138412290;
      v25 = v5;
      _os_log_impl(&dword_191DB8000, v7, OS_LOG_TYPE_INFO, "Have cached app store app for identifier %@.  Early return.", buf, 0xCu);
    }

    -[MUOfficialAppSectionController _updateViewWithMediaServicesResult:](self, "_updateViewWithMediaServicesResult:", v6);
  }
  else
  {
    if (v8)
    {
      *(_DWORD *)buf = 138412290;
      v25 = v5;
      _os_log_impl(&dword_191DB8000, v7, OS_LOG_TYPE_INFO, "Fetching app store app with identifier %@", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    objc_msgSend(MEMORY[0x1E0CC1760], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUPlaceSectionController mapItem](self, "mapItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_preferedAppAdamID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[MUPlaceAppLockupView appIconSize](MUPlaceAppLockupView, "appIconSize");
    v15 = v14;
    v17 = v16;
    objc_msgSend(MEMORY[0x1E0CC1970], "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "screenScale");
    v20 = v19;
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __53__MUOfficialAppSectionController__hydrateViewWithApp__block_invoke;
    v21[3] = &unk_1E2E01A88;
    objc_copyWeak(&v22, (id *)buf);
    objc_msgSend(v9, "appleMediaServicesResultsWithIdentifiers:artworkSize:screenScale:type:source:completion:", v13, 1, 4, v21, v15, v17, v20);

    objc_destroyWeak(&v22);
    objc_destroyWeak((id *)buf);
  }

}

void __53__MUOfficialAppSectionController__hydrateViewWithApp__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD *WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(v5, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v6 || !v8)
    {
      MUGetPlaceCardLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = 138412290;
        v15 = v6;
        _os_log_impl(&dword_191DB8000, v13, OS_LOG_TYPE_ERROR, "Failed to fetch app store app with error %@", (uint8_t *)&v14, 0xCu);
      }
    }
    else
    {
      v10 = (void *)WeakRetained[12];
      objc_msgSend(v8, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKey:", v9, v11);

      objc_msgSend(WeakRetained, "_updateViewWithMediaServicesResult:", v9);
      MUGetPlaceCardLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v14 = 138412290;
        v15 = v9;
        _os_log_impl(&dword_191DB8000, v12, OS_LOG_TYPE_INFO, "MUOfficialAppSectionController: Fetched app %@, will tell parent to update", (uint8_t *)&v14, 0xCu);
      }

      objc_msgSend(WeakRetained, "delegate");
      v13 = objc_claimAutoreleasedReturnValue();
      -[NSObject placeSectionControllerDidUpdateContent:](v13, "placeSectionControllerDidUpdateContent:", WeakRetained);
    }

  }
}

- (void)_updateViewWithMediaServicesResult:(id)a3
{
  GEOAppleMediaServicesResult **p_appStoreApp;
  id v6;

  p_appStoreApp = &self->_appStoreApp;
  objc_storeStrong((id *)&self->_appStoreApp, a3);
  v6 = a3;
  -[MUOfficialAppSectionController _setupLockupView](self, "_setupLockupView");
  -[MUPlaceAppLockupView setViewModel:](self->_officialAppView, "setViewModel:", *p_appStoreApp);

}

- (UIView)sectionView
{
  return (UIView *)self->_sectionView;
}

- (BOOL)hasContent
{
  return self->_appStoreApp != 0;
}

- (MUPlaceSectionHeaderViewModel)sectionHeaderViewModel
{
  MUPlaceSectionHeaderViewModel *v3;
  void *v4;
  MUPlaceSectionHeaderViewModel *v5;

  v3 = [MUPlaceSectionHeaderViewModel alloc];
  -[MUOfficialAppSectionController _sectionHeaderText](self, "_sectionHeaderText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MUPlaceSectionHeaderViewModel initWithTitleString:](v3, "initWithTitleString:", v4);

  return v5;
}

- (void)appLockupViewDidSelectPunchOutButton:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[MUPlaceSectionController mapItem](self, "mapItem", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_attribution");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "providerID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceSectionController captureInfoCardAction:eventValue:feedbackType:actionRichProviderId:](self, "captureInfoCardAction:eventValue:feedbackType:actionRichProviderId:", 6040, 0, 0, v6);

  if (-[GEOAppleMediaServicesResult isInstalled](self->_appStoreApp, "isInstalled"))
  {
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[GEOAppleMediaServicesResult iOSBundleIdentifier](self->_appStoreApp, "iOSBundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "openApplicationWithBundleID:", v7);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CC1970], "sharedInstance");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[GEOAppleMediaServicesResult url](self->_appStoreApp, "url");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "openURL:completionHandler:", v7, 0);
  }

}

- (id)_sectionHeaderText
{
  __CFString *v2;

  if (-[GEOAppleMediaServicesResult isInstalled](self->_appStoreApp, "isInstalled"))
    v2 = CFSTR("Open the App [Placecard]");
  else
    v2 = CFSTR("Get the App [Placecard]");
  _MULocalizedStringFromThisBundle(v2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)infoCardChildPossibleActions
{
  if (-[MUOfficialAppSectionController hasContent](self, "hasContent"))
    return &unk_1E2E55C18;
  else
    return (id)MEMORY[0x1E0C9AA60];
}

- (int)analyticsModuleType
{
  return 15;
}

- (BOOL)isImpressionable
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedMediaResults, 0);
  objc_storeStrong((id *)&self->_appStoreApp, 0);
  objc_storeStrong((id *)&self->_sectionView, 0);
  objc_storeStrong((id *)&self->_officialAppView, 0);
}

@end
