@implementation PhotosWindowSceneDelegate

- (PhotosWindowSceneDelegate)init
{
  PhotosWindowSceneDelegate *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PhotosWindowSceneDelegate;
  v2 = -[PhotosWindowSceneDelegate init](&v5, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[PUTabbedLibrarySettings sharedInstance](PUTabbedLibrarySettings, "sharedInstance"));
    objc_msgSend(v3, "addDeferredKeyObserver:", v2);

  }
  return v2;
}

- (BOOL)_canProceedWithPhotoLibraryInGoodState
{
  id v3;
  void *v4;
  unsigned __int8 v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  dispatch_time_t v13;
  UIViewController *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v19;
  NSObject *v20;
  id v21;
  uint8_t buf[4];
  id v23;

  v3 = -[PhotosApplication px_photoLibrary]_0();
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v21 = 0;
  v5 = objc_msgSend(v4, "shouldMobileSlideShowLaunchWithError:", &v21);
  v6 = v21;
  if ((v5 & 1) == 0)
  {
    if (!+[PLModelMigrator shouldPromptUserForLibrarySchemaMismatch](PLModelMigrator, "shouldPromptUserForLibrarySchemaMismatch"))
    {
      v19 = PLUIGetLog();
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v6;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Photos library open failed with error %@", buf, 0xCu);
      }

      exit(0);
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userInfo"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", NSDebugDescriptionErrorKey));
    v9 = v8;
    if (v8)
      v10 = v8;
    else
      v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "debugDescription"));
    v11 = v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", CFSTR("Photos library open failed"), v11, 0));
    v13 = dispatch_time(0, 10000000000);
    dispatch_after(v13, (dispatch_queue_t)&_dispatch_main_q, &stru_10006AB20);
    v14 = objc_opt_new(UIViewController);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosWindowSceneDelegate mainWindow](self, "mainWindow"));
    objc_msgSend(v15, "setRootViewController:", v14);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosWindowSceneDelegate mainWindow](self, "mainWindow"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "rootViewController"));
    objc_msgSend(v17, "presentViewController:animated:completion:", v12, 1, 0);

  }
  return v5;
}

- (id)shortcutURLForShortcutItem:(id)a3
{
  id v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "type"));
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.photos.shortcuts.recentphoto")))
  {
    v5 = CFSTR("photos://lastasset");
LABEL_14:
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v5));
    goto LABEL_15;
  }
  if (!objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.photos.shortcuts.bulletin")))
  {
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.photos.shortcuts.search")))
    {
      v5 = CFSTR("photos://contentmode?id=search");
    }
    else if (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.photos.shortcuts.oneyearago")))
    {
      v5 = CFSTR("photos://oneyearago");
    }
    else
    {
      if (!objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.photos.shortcuts.favorites")))
      {
        v8 = 0;
        goto LABEL_15;
      }
      v5 = CFSTR("photos://album?name=favorites");
    }
    goto LABEL_14;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userInfo"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", kNotificationKeyDefaultURL));
  if (v7)
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v7));
  else
    v8 = 0;

LABEL_15:
  return v8;
}

- (void)_executePendingRequestsIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = (id)objc_claimAutoreleasedReturnValue(-[PhotosWindowSceneDelegate pendingURLToOpen](self, "pendingURLToOpen"));
  if (v8)
  {
    -[PhotosWindowSceneDelegate setPendingURLToOpen:](self, "setPendingURLToOpen:", 0);
    -[PhotosWindowSceneDelegate openRoutingURL:](self, "openRoutingURL:", v8);
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosWindowSceneDelegate pendingUserActivity](self, "pendingUserActivity"));
  if (v3)
  {
    -[PhotosWindowSceneDelegate setPendingUserActivity:](self, "setPendingUserActivity:", 0);
    -[PhotosWindowSceneDelegate openUserActivity:](self, "openUserActivity:", v3);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosWindowSceneDelegate pendingProgrammaticNavigationRequestToOpen](self, "pendingProgrammaticNavigationRequestToOpen"));
  if (v4)
  {
    -[PhotosWindowSceneDelegate setPendingProgrammaticNavigationRequestToOpen:](self, "setPendingProgrammaticNavigationRequestToOpen:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosWindowSceneDelegate tabbedLibraryViewController](self, "tabbedLibraryViewController"));
    if (v5)
    {
      PXProgrammaticNavigationRequestExecute(v4, v5);
    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosWindowSceneDelegate rootViewController](self, "rootViewController"));
      PXProgrammaticNavigationRequestExecute(v4, v6);

    }
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosWindowSceneDelegate pendingCloudKitShareURLToOpen](self, "pendingCloudKitShareURLToOpen"));
  if (v7)
  {
    -[PhotosWindowSceneDelegate setPendingCloudKitShareURLToOpen:](self, "setPendingCloudKitShareURLToOpen:", 0);
    -[PhotosWindowSceneDelegate openCloudKitShareWithURL:](self, "openCloudKitShareWithURL:", v7);
  }

}

+ (void)_showContactsPromptIfNecessary
{
  uint64_t Log;
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  uint8_t v10[16];
  uint8_t buf[16];

  Log = PLWindowSceneDelegateGetLog(a1, a2);
  v3 = objc_claimAutoreleasedReturnValue(Log);
  v4 = os_signpost_id_generate(v3);
  v5 = v3;
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "ShowContactsPromptIfNecessary", ", buf, 2u);
  }

  if (PLIsChinaSKU())
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[PXPeopleUtilities sharedContactStore](PXPeopleUtilities, "sharedContactStore"));
    objc_msgSend(v7, "requestAccessForEntityType:completionHandler:", 0, &stru_10006AB40);

  }
  v8 = v6;
  v9 = v8;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)v10 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_END, v4, "ShowContactsPromptIfNecessary", ", v10, 2u);
  }

}

- (void)showNetworkPromptIfNecessary
{
  uint64_t Log;
  NSObject *v4;
  os_signpost_id_t v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint8_t buf[8];
  uint8_t *v20;
  uint64_t v21;
  void *v22;

  Log = PLWindowSceneDelegateGetLog(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(Log);
  v5 = os_signpost_id_generate(v4);
  v6 = v4;
  v7 = v6;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "ShowNetworkPromptIfNecessary", ", buf, 2u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosWindowSceneDelegate tabbedLibraryViewController](self, "tabbedLibraryViewController"));
  v9 = objc_msgSend(v8, "selectedContentMode");

  if (v9 != 1)
    goto LABEL_12;
  *(_QWORD *)buf = 0;
  v20 = buf;
  v21 = 0x2020000000;
  v10 = off_10007C0C0;
  v22 = off_10007C0C0;
  if (!off_10007C0C0)
  {
    v11 = sub_10001CAA4();
    v10 = dlsym(v11, "SBSSpringBoardServerPort");
    *((_QWORD *)v20 + 3) = v10;
    off_10007C0C0 = v10;
  }
  _Block_object_dispose(buf, 8);
  if (!v10)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "mach_port_t softlink_SBSSpringBoardServerPort(void)"));
    objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, CFSTR("PhotosWindowSceneDelegate.m"), 89, CFSTR("%s"), dlerror());
LABEL_18:

    __break(1u);
    return;
  }
  v12 = ((uint64_t (*)(void))v10)();
  *(_QWORD *)buf = 0;
  v20 = buf;
  v21 = 0x2020000000;
  v13 = off_10007C0B0;
  v22 = off_10007C0B0;
  if (!off_10007C0B0)
  {
    v14 = sub_10001CAA4();
    v13 = dlsym(v14, "SBShowNetworkPromptsIfNecessary");
    *((_QWORD *)v20 + 3) = v13;
    off_10007C0B0 = v13;
  }
  _Block_object_dispose(buf, 8);
  if (!v13)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "kern_return_t softlink_SBShowNetworkPromptsIfNecessary(mach_port_t, uint8_t)"));
    objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, CFSTR("PhotosWindowSceneDelegate.m"), 90, CFSTR("%s"), dlerror());
    goto LABEL_18;
  }
  ((void (*)(uint64_t, _QWORD))v13)(v12, 0);
LABEL_12:
  v15 = v7;
  v16 = v15;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_INTERVAL_END, v5, "ShowNetworkPromptIfNecessary", ", buf, 2u);
  }

}

- (void)sceneDidBecomeActive:(id)a3
{
  uint64_t Log;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint8_t v14[16];

  Log = PLUserStatusGetLog(self, a2, a3);
  v5 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Resetting activation options", v14, 2u);
  }

  -[PhotosWindowSceneDelegate setActivationOptions:](self, "setActivationOptions:", 0);
  if (-[PhotosWindowSceneDelegate didRecieveSpotlightSearchActivity](self, "didRecieveSpotlightSearchActivity"))
  {
    -[PhotosWindowSceneDelegate setDidRecieveSpotlightSearchActivity:](self, "setDidRecieveSpotlightSearchActivity:", 0);
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosWindowSceneDelegate tabbedLibraryViewController](self, "tabbedLibraryViewController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "selectedNavigationController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "topViewController"));

    v9 = objc_opt_class(PUSearchHomeViewController);
    if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
    {
      v10 = v8;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[PXSearchParsecAnalyticsSession sharedSession](PXSearchParsecAnalyticsSession, "sharedSession"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "searchControllerSearchText"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "searchControllerSearchTokens"));

      objc_msgSend(v11, "reportPhotosAppLaunchedOrEnteredForegroundWithPreviousSearchText:previousSearchTokens:", v12, v13);
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[PXSearchParsecAnalyticsSession sharedSession](PXSearchParsecAnalyticsSession, "sharedSession"));
      objc_msgSend(v11, "reportPhotosAppLaunchedOrEnteredForegroundWithPreviousSearchText:previousSearchTokens:", 0, 0);
    }

  }
}

- (void)sceneWillEnterForeground:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t Log;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  uint8_t v23[16];
  uint8_t buf[16];

  v4 = a3;
  Log = PLWindowSceneDelegateGetLog(v4, v5);
  v7 = objc_claimAutoreleasedReturnValue(Log);
  v8 = os_signpost_id_generate(v7);
  v9 = v7;
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "SceneWillEnterForeground", ", buf, 2u);
  }

  if (-[PhotosWindowSceneDelegate _canProceedWithPhotoLibraryInGoodState](self, "_canProceedWithPhotoLibraryInGoodState"))
  {
    -[PhotosWindowSceneDelegate setupAppUI](self, "setupAppUI");
    if (_os_feature_enabled_impl("Photos", "Lemonade"))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[PXLemonadeSettings sharedInstance](PXLemonadeSettings, "sharedInstance"));
      objc_msgSend(v11, "addDeferredKeyObserver:", self);

    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    objc_msgSend(v12, "noteSceneWillEnterForeground:", v4);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosWindowSceneDelegate lastDidEnterBackgroundDate](self, "lastDidEnterBackgroundDate"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[PXKitSettings sharedInstance](PXKitSettings, "sharedInstance"));
  objc_msgSend(v14, "viewResetTimeoutDuration");
  v16 = v15;

  if (v13)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    objc_msgSend(v17, "timeIntervalSinceDate:", v13);
    v19 = v18;

    if (v19 > v16)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v20, "postNotificationName:object:", PXPhotosResetViewNotificationName, self);

    }
  }
  v21 = v10;
  v22 = v21;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    *(_WORD *)v23 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v22, OS_SIGNPOST_INTERVAL_END, v8, "SceneWillEnterForeground", ", v23, 2u);
  }

}

- (void)_ensureSplitViewControllerExistsIfNeeded
{
  uint64_t Log;
  NSObject *v4;
  os_signpost_id_t v5;
  NSObject *v6;
  NSObject *v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  PhotosWindowSceneDelegate *v14;
  PhotosWindowSceneDelegate *v15;
  void *v16;
  char v17;
  PhotosWindowSceneDelegate *v18;
  PhotosWindowSceneDelegate *v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  unsigned int v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  NSObject *v39;
  NSObject *v40;
  unsigned int v41;
  unint64_t v42;
  os_signpost_id_t v43;
  void *v44;
  PhotosWindowSceneDelegate *v45;
  PhotosWindowSceneDelegate *v46;
  uint8_t v47[16];
  uint8_t buf[16];

  Log = PLWindowSceneDelegateGetLog(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(Log);
  v5 = os_signpost_id_generate(v4);
  v6 = v4;
  v7 = v6;
  v8 = v5 - 1;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "CreateSidebarViewController", ", buf, 2u);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[PUTabbedLibrarySettings sharedInstance](PUTabbedLibrarySettings, "sharedInstance"));
  v10 = (unint64_t)objc_msgSend(v9, "isSidebarEnabled");

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosWindowSceneDelegate splitViewController](self, "splitViewController"));
  if (v11 || !(_DWORD)v10)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosWindowSceneDelegate splitViewController](self, "splitViewController"));
    if (v16)
      v17 = v10;
    else
      v17 = 1;

    if ((v17 & 1) != 0)
      goto LABEL_22;
    v18 = (PhotosWindowSceneDelegate *)objc_alloc_init((Class)UIViewController);
    v19 = (PhotosWindowSceneDelegate *)objc_claimAutoreleasedReturnValue(-[PhotosWindowSceneDelegate splitViewController](self, "splitViewController"));
    -[PhotosWindowSceneDelegate setViewController:forColumn:](v19, "setViewController:forColumn:", v18, 2);
    -[PhotosWindowSceneDelegate setViewController:forColumn:](v19, "setViewController:forColumn:", v18, 3);
    -[PhotosWindowSceneDelegate setSplitViewController:](self, "setSplitViewController:", 0);
  }
  else
  {
    v12 = -[PhotosApplication px_photoLibrary]_0();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    v43 = v5;
    if (+[PXLemonadeSettings isLemonadeUIEnabled](PXLemonadeSettings, "isLemonadeUIEnabled"))
    {
      v14 = (PhotosWindowSceneDelegate *)objc_claimAutoreleasedReturnValue(-[PhotosWindowSceneDelegate lemonadeRootViewController](self, "lemonadeRootViewController"));
      v45 = 0;
      v46 = v14;
      v15 = self;
    }
    else
    {
      v14 = (PhotosWindowSceneDelegate *)objc_claimAutoreleasedReturnValue(-[PhotosWindowSceneDelegate tabbedLibraryViewController](self, "tabbedLibraryViewController"));
      v45 = v14;
      v46 = 0;
      v15 = v14;
    }
    v19 = v14;
    v18 = v15;
    v20 = objc_msgSend(objc_alloc((Class)PUSidebarViewController), "initWithNavigationRoot:photoLibrary:libraryFilterState:", v18, v13, self->_libraryFilterState);
    v42 = v8;
    v41 = v10;
    v44 = (void *)v13;
    if (+[PXLemonadeSettings isLemonadeUIEnabled](PXLemonadeSettings, "isLemonadeUIEnabled"))
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "navigationItem"));
      objc_msgSend(v21, "setLargeTitleDisplayMode:", 2);

      objc_msgSend(v20, "setActionProviderDelegate:", self);
    }
    else
    {
      v22 = PXLocalizedString(CFSTR("PXOutlineTitlePhotos"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
      objc_msgSend(v20, "setTitle:", v23);

    }
    objc_storeStrong((id *)&self->_collectionActionReceiver, v20);
    -[PhotosWindowSceneDelegate setSidebarViewController:](v45, "setSidebarViewController:", v20);
    v24 = objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", v20);
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "navigationBar"));
    objc_msgSend(v25, "setPrefersLargeTitles:", 1);
    v26 = objc_msgSend(objc_alloc((Class)PXSplitViewController), "initWithSidebarNavigationController:contentViewController:compactViewController:", v24, v19, v46);
    -[PhotosWindowSceneDelegate setSplitViewController:](self, "setSplitViewController:", v26);

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosWindowSceneDelegate splitViewController](self, "splitViewController"));
    objc_msgSend(v27, "registerChangeObserver:", v20);

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosWindowSceneDelegate splitViewController](self, "splitViewController"));
    objc_msgSend(v28, "px_enableExtendedTraitCollection");

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosWindowSceneDelegate splitViewController](self, "splitViewController"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "traitCollection"));
    v31 = objc_msgSend(v30, "horizontalSizeClass");

    if (v31 != (id)1)
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosWindowSceneDelegate tabbedLibraryViewController](self, "tabbedLibraryViewController"));
      v33 = objc_msgSend(v32, "selectedContentMode");

      if (v33 == 13)
      {
        v34 = objc_alloc((Class)PXProgrammaticNavigationDestination);
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "px_virtualCollections"));
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "allAlbumsCollection"));
        v37 = objc_msgSend(v34, "initWithObject:revealMode:", v36, 0);

        objc_msgSend(v20, "navigateToFallbackForDestination:", v37);
      }
    }

    v8 = v42;
    v5 = v43;
    v10 = v41;
  }

LABEL_22:
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosWindowSceneDelegate tabbedLibraryViewController](self, "tabbedLibraryViewController"));
  objc_msgSend(v38, "px_setHidesTabBarForRegularHorizontalSizeClass:", v10);

  v39 = v7;
  v40 = v39;
  if (v8 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v39))
  {
    *(_WORD *)v47 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v40, OS_SIGNPOST_INTERVAL_END, v5, "CreateSidebarViewController", ", v47, 2u);
  }

}

- (PXSplitViewController)splitViewController
{
  return self->_splitViewController;
}

- (void)setupAppUI
{
  char v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t Log;
  NSObject *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint8_t v21[16];
  uint8_t buf[16];

  if (PFProcessIsLaunchedToExecuteTests(self, a2))
    PXPhotosApplicationStartedLaunchingForTesting();
  if (+[PXLemonadeSettings isLemonadeUIEnabled](PXLemonadeSettings, "isLemonadeUIEnabled")
    && +[PXLemonadeSettings isLemonadeUIEnabled](PXLemonadeSettings, "isLemonadeUIEnabled"))
  {
    -[PhotosWindowSceneDelegate _ensurelemonadeRootViewControllerExists](self, "_ensurelemonadeRootViewControllerExists");
    v3 = 1;
  }
  else
  {
    -[PhotosWindowSceneDelegate _ensureTabbedLibraryViewControllerExists](self, "_ensureTabbedLibraryViewControllerExists");
    v3 = 0;
  }
  -[PhotosWindowSceneDelegate _ensureSplitViewControllerExistsIfNeeded](self, "_ensureSplitViewControllerExistsIfNeeded");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosWindowSceneDelegate splitViewController](self, "splitViewController"));
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else if ((v3 & 1) != 0)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[PhotosWindowSceneDelegate lemonadeRootViewController](self, "lemonadeRootViewController"));
  }
  else
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[PhotosWindowSceneDelegate tabbedLibraryViewController](self, "tabbedLibraryViewController"));
  }
  v7 = v6;

  Log = PLWindowSceneDelegateGetLog(v8, v9);
  v11 = objc_claimAutoreleasedReturnValue(Log);
  v12 = os_signpost_id_generate(v11);
  v13 = v11;
  v14 = v13;
  if (v12 - 1 > 0xFFFFFFFFFFFFFFFDLL)
  {

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosWindowSceneDelegate mainWindow](self, "mainWindow"));
    objc_msgSend(v17, "setRootViewController:", v7);

    v18 = v14;
  }
  else
  {
    if (os_signpost_enabled(v13))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "AddLibraryViewControllerToWindow", ", buf, 2u);
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosWindowSceneDelegate mainWindow](self, "mainWindow"));
    objc_msgSend(v15, "setRootViewController:", v7);

    v16 = v14;
    if (os_signpost_enabled(v16))
    {
      *(_WORD *)v21 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_INTERVAL_END, v12, "AddLibraryViewControllerToWindow", ", v21, 2u);
    }
  }

  -[PhotosWindowSceneDelegate showNetworkPromptIfNecessary](self, "showNetworkPromptIfNecessary");
  -[PhotosWindowSceneDelegate _executePendingRequestsIfNeeded](self, "_executePendingRequestsIfNeeded");
  +[PhotosWindowSceneDelegate _showContactsPromptIfNecessary](PhotosWindowSceneDelegate, "_showContactsPromptIfNecessary");
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[PXDiagnosticsController sharedController](PXDiagnosticsController, "sharedController"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosWindowSceneDelegate mainWindow](self, "mainWindow"));
  objc_msgSend(v19, "setupOnInternalDevicesWithWindow:", v20);

}

- (UIWindow)mainWindow
{
  return self->_mainWindow;
}

- (void)_ensureTabbedLibraryViewControllerExists
{
  uint64_t Log;
  NSObject *v4;
  os_signpost_id_t v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  PXLibraryFilterState *v12;
  PXLibraryFilterState *libraryFilterState;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  NSObject *v28;
  _DWORD v29[2];

  Log = PLWindowSceneDelegateGetLog(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(Log);
  v5 = os_signpost_id_generate(v4);
  v6 = v4;
  v7 = v6;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    LOWORD(v29[0]) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "CreateMainTabbedLibraryViewController", ", (uint8_t *)v29, 2u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosWindowSceneDelegate tabbedLibraryViewController](self, "tabbedLibraryViewController"));
  if (!v8)
  {
    v9 = -[PhotosApplication px_photoLibrary]_0();
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[PXSharedLibraryStatusProvider sharedLibraryStatusProviderWithPhotoLibrary:](PXSharedLibraryStatusProvider, "sharedLibraryStatusProviderWithPhotoLibrary:", v10));
    v12 = (PXLibraryFilterState *)objc_msgSend(objc_alloc((Class)PXLibraryFilterState), "initWithSharedLibraryStatusProvider:", v11);
    libraryFilterState = self->_libraryFilterState;
    self->_libraryFilterState = v12;

    v14 = objc_alloc((Class)PUTabbedLibraryViewController);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosWindowSceneDelegate spec](self, "spec"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "libraryContentControllerSpec"));
    v17 = objc_msgSend(v14, "initWithSpec:photoLibrary:libraryFilterState:", v16, v10, self->_libraryFilterState);
    -[PhotosWindowSceneDelegate setTabbedLibraryViewController:](self, "setTabbedLibraryViewController:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosWindowSceneDelegate tabbedLibraryViewController](self, "tabbedLibraryViewController"));
    objc_msgSend(v18, "setDelegate:", self);

    if (+[PXPLLibraryContentModeSelection hasPersistedLibraryContentModeSelection](PXPLLibraryContentModeSelection, "hasPersistedLibraryContentModeSelection"))v19 = (uint64_t)+[PXPLLibraryContentModeSelection getPersistedLibraryContentModeSelection](PXPLLibraryContentModeSelection, "getPersistedLibraryContentModeSelection");
    else
      v19 = 0xFFFFFFFFLL;
    v20 = PLUIGetLog();
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      v29[0] = 67109120;
      v29[1] = v19;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "[ForegroundState] lastSelectedTabMode=%i", (uint8_t *)v29, 8u);
    }

    if ((_DWORD)v19 != -1)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosWindowSceneDelegate tabbedLibraryViewController](self, "tabbedLibraryViewController"));
      objc_msgSend(v22, "setSelectedContentMode:", v19);

    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosWindowSceneDelegate tabbedLibraryViewController](self, "tabbedLibraryViewController"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "selectedNavigationController"));

    if (v24)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosWindowSceneDelegate tabbedLibraryViewController](self, "tabbedLibraryViewController"));
      objc_msgSend(v25, "navigateToInitialLocationInNavigationController:", v24);

    }
    v26 = PLSAggregateDictionaryKeyForPhotosTabContentMode(v19);
    if (v26)
      PLSAggregateDictionaryAddValueForScalarKey(v26, 1);

  }
  v27 = v7;
  v28 = v27;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
  {
    LOWORD(v29[0]) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v28, OS_SIGNPOST_INTERVAL_END, v5, "CreateMainTabbedLibraryViewController", ", (uint8_t *)v29, 2u);
  }

}

- (PUTabbedLibraryViewController)tabbedLibraryViewController
{
  return self->_tabbedLibraryViewController;
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t Log;
  NSObject *v13;
  os_signpost_id_t v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  PhotosWindowSceneDelegate *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  uint64_t v35;
  id v36;
  void *v37;
  NSObject *v38;
  NSObject *v39;
  void *v40;
  objc_class *v41;
  NSString *v42;
  objc_class *v43;
  NSString *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  os_signpost_id_t spid;
  unint64_t v52;
  id v53;
  uint8_t v54[16];
  uint8_t buf[16];

  v8 = a3;
  v9 = a5;
  v10 = a4;
  Log = PLWindowSceneDelegateGetLog(v10, v11);
  v13 = objc_claimAutoreleasedReturnValue(Log);
  v14 = os_signpost_id_generate(v13);
  v15 = v13;
  v16 = v15;
  v52 = v14 - 1;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "SceneWillConnectToSession", ", buf, 2u);
  }
  spid = v14;

  -[PhotosWindowSceneDelegate setActivationOptions:](self, "setActivationOptions:", PXCloudQuotaUpsellSheetManagerActivationOptionsForSceneConnectionOptions(v9));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "userActivities"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "anyObject"));

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "URLContexts"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "anyObject"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "URL"));
  v22 = v21;
  if (v21)
  {
    v53 = v21;
  }
  else
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "shortcutItem"));
    v53 = (id)objc_claimAutoreleasedReturnValue(-[PhotosWindowSceneDelegate shortcutURLForShortcutItem:](self, "shortcutURLForShortcutItem:", v23));

  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_itemProviderCollections"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "cloudKitShareMetadata"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stateRestorationActivity"));

  if (v18)
  {
    v27 = self;
    v28 = v18;
LABEL_9:
    -[PhotosWindowSceneDelegate openUserActivity:](v27, "openUserActivity:", v28);
    goto LABEL_16;
  }
  if (objc_msgSend(v24, "count"))
  {
    -[PhotosWindowSceneDelegate _openItemProviderCollections:](self, "_openItemProviderCollections:", v24);
  }
  else if (v53)
  {
    -[PhotosWindowSceneDelegate openRoutingURL:](self, "openRoutingURL:");
  }
  else if (v25)
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "share"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "URL"));
    -[PhotosWindowSceneDelegate openCloudKitShareWithURL:](self, "openCloudKitShareWithURL:", v30);

  }
  else if (v26)
  {
    v27 = self;
    v28 = v26;
    goto LABEL_9;
  }
LABEL_16:
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[PhotosAppSpec specForIdiom:](PhotosAppSpec, "specForIdiom:", objc_msgSend(v31, "userInterfaceIdiom")));
  -[PhotosWindowSceneDelegate setSpec:](self, "setSpec:", v32);

  v33 = objc_alloc((Class)UIWindow);
  v34 = v8;
  if (!v34)
  {
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v41 = (objc_class *)objc_opt_class(UIWindowScene);
    v42 = NSStringFromClass(v41);
    v49 = (void *)objc_claimAutoreleasedReturnValue(v42);
    objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PhotosWindowSceneDelegate.m"), 182, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("scene"), v49);
LABEL_26:

    goto LABEL_18;
  }
  v35 = objc_opt_class(UIWindowScene);
  if ((objc_opt_isKindOfClass(v34, v35) & 1) == 0)
  {
    v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v43 = (objc_class *)objc_opt_class(UIWindowScene);
    v44 = NSStringFromClass(v43);
    v45 = objc_claimAutoreleasedReturnValue(v44);
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "px_descriptionForAssertionMessage"));
    v49 = (void *)v45;
    v46 = v45;
    v40 = v48;
    objc_msgSend(v48, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PhotosWindowSceneDelegate.m"), 182, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("scene"), v46, v47);

    goto LABEL_26;
  }
LABEL_18:
  v36 = objc_msgSend(v33, "initWithWindowScene:", v34);
  -[PhotosWindowSceneDelegate setMainWindow:](self, "setMainWindow:", v36);

  v37 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosWindowSceneDelegate mainWindow](self, "mainWindow"));
  objc_msgSend(v37, "makeKeyAndVisible");

  v38 = v16;
  v39 = v38;
  if (v52 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v38))
  {
    *(_WORD *)v54 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v39, OS_SIGNPOST_INTERVAL_END, spid, "SceneWillConnectToSession", ", v54, 2u);
  }

}

- (PhotosAppSpec)spec
{
  return self->_spec;
}

- (void)setTabbedLibraryViewController:(id)a3
{
  objc_storeStrong((id *)&self->_tabbedLibraryViewController, a3);
}

- (void)setSpec:(id)a3
{
  objc_storeStrong((id *)&self->_spec, a3);
}

- (void)setMainWindow:(id)a3
{
  objc_storeStrong((id *)&self->_mainWindow, a3);
}

- (void)setActivationOptions:(int64_t)a3
{
  self->_activationOptions = a3;
}

- (NSUserActivity)pendingUserActivity
{
  return self->_pendingUserActivity;
}

- (NSURL)pendingURLToOpen
{
  return self->_pendingURLToOpen;
}

- (PXProgrammaticNavigationRequest)pendingProgrammaticNavigationRequestToOpen
{
  return self->_pendingProgrammaticNavigationRequestToOpen;
}

- (NSURL)pendingCloudKitShareURLToOpen
{
  return self->_pendingCloudKitShareURLToOpen;
}

- (NSDate)lastDidEnterBackgroundDate
{
  return self->_lastDidEnterBackgroundDate;
}

- (BOOL)didRecieveSpotlightSearchActivity
{
  return self->_didRecieveSpotlightSearchActivity;
}

- (int64_t)activationOptions
{
  return self->_activationOptions;
}

- (UIViewController)rootViewController
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosWindowSceneDelegate mainWindow](self, "mainWindow"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "rootViewController"));

  return (UIViewController *)v3;
}

- (double)screenScale
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  double v7;
  double v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosWindowSceneDelegate mainWindow](self, "mainWindow"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "screen"));
  v4 = v3;
  if (v3)
    v5 = v3;
  else
    v5 = (id)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  v6 = v5;

  objc_msgSend(v6, "scale");
  if (v7 == 0.0)
    v8 = 1.0;
  else
    v8 = v7;

  return v8;
}

- (void)sceneDidDisconnect:(id)a3
{
  uint64_t Log;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  uint8_t v13[16];
  uint8_t buf[16];

  Log = PLWindowSceneDelegateGetLog(self, a2);
  v5 = objc_claimAutoreleasedReturnValue(Log);
  v6 = os_signpost_id_generate(v5);
  v7 = v5;
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "SceneDidDisconnect", ", buf, 2u);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[PXSearchParsecAnalyticsSession sharedSession](PXSearchParsecAnalyticsSession, "sharedSession"));
  objc_msgSend(v9, "reportPhotosAppQuit");

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosWindowSceneDelegate mainWindow](self, "mainWindow"));
  objc_msgSend(v10, "setHidden:", 1);

  -[PhotosWindowSceneDelegate setMainWindow:](self, "setMainWindow:", 0);
  v11 = v8;
  v12 = v11;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)v13 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_END, v6, "SceneDidDisconnect", ", v13, 2u);
  }

}

- (void)sceneDidEnterBackground:(id)a3
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date", a3));
  -[PhotosWindowSceneDelegate setLastDidEnterBackgroundDate:](self, "setLastDidEnterBackgroundDate:", v4);

  v5 = (id)objc_claimAutoreleasedReturnValue(+[PXSearchParsecAnalyticsSession sharedSession](PXSearchParsecAnalyticsSession, "sharedSession"));
  objc_msgSend(v5, "reportPhotosAppEnteredBackground");

}

- (void)scene:(id)a3 openURLContexts:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t Log;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  int v14;
  id v15;

  v5 = a4;
  Log = PLUserStatusGetLog(v5, v6, v7);
  v9 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v14) = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Noting some activation options: URL contexts", (uint8_t *)&v14, 2u);
  }

  -[PhotosWindowSceneDelegate setActivationOptions:](self, "setActivationOptions:", 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "anyObject"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "URL"));

  if (v11)
  {
    -[PhotosWindowSceneDelegate openRoutingURL:](self, "openRoutingURL:", v11);
  }
  else
  {
    v12 = PLUIGetLog();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138412290;
      v15 = v5;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Unable to open URL contexts (can't convert to URL): %@", (uint8_t *)&v14, 0xCu);
    }

  }
}

- (void)_scene:(id)a3 openItemProviders:(id)a4
{
  -[PhotosWindowSceneDelegate _openItemProviderCollections:](self, "_openItemProviderCollections:", a4);
}

- (void)windowScene:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5
{
  id v7;
  void (**v8)(id, BOOL);
  uint64_t v9;
  uint64_t v10;
  uint64_t Log;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  int v16;
  id v17;

  v7 = a4;
  v8 = (void (**)(id, BOOL))a5;
  Log = PLUserStatusGetLog(v8, v9, v10);
  v12 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v16) = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Noting some activation options: shortcut item", (uint8_t *)&v16, 2u);
  }

  -[PhotosWindowSceneDelegate setActivationOptions:](self, "setActivationOptions:", 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosWindowSceneDelegate shortcutURLForShortcutItem:](self, "shortcutURLForShortcutItem:", v7));
  if (v13)
  {
    -[PhotosWindowSceneDelegate openRoutingURL:](self, "openRoutingURL:", v13);
  }
  else
  {
    v14 = PLUIGetLog();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138412290;
      v17 = v7;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Unable to open shortcut (can't convert to URL): %@", (uint8_t *)&v16, 0xCu);
    }

  }
  v8[2](v8, v13 != 0);

}

- (id)stateRestorationActivityForScene:(id)a3
{
  return _objc_msgSend(a3, "userActivity");
}

- (void)scene:(id)a3 continueUserActivity:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t Log;
  NSObject *v9;
  uint8_t v10[16];

  v5 = a4;
  Log = PLUserStatusGetLog(v5, v6, v7);
  v9 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Noting some activation options: user activity", v10, 2u);
  }

  -[PhotosWindowSceneDelegate setActivationOptions:](self, "setActivationOptions:", 2);
  -[PhotosWindowSceneDelegate openUserActivity:](self, "openUserActivity:", v5);

}

- (void)windowScene:(id)a3 userDidAcceptCloudKitShareWithMetadata:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t Log;
  NSObject *v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;

  v5 = a4;
  Log = PLUserStatusGetLog(v5, v6, v7);
  v9 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v14) = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Noting some activation options: cloud kit share metadata", (uint8_t *)&v14, 2u);
  }

  v10 = -[PhotosWindowSceneDelegate setActivationOptions:](self, "setActivationOptions:", 2);
  if (v5)
  {
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "share"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject URL](v11, "URL"));
    -[PhotosWindowSceneDelegate openCloudKitShareWithURL:](self, "openCloudKitShareWithURL:", v12);

  }
  else
  {
    v13 = PLUIGetLog(v10);
    v11 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138412290;
      v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Unable to open : Cloud Kit Share Metadata %@", (uint8_t *)&v14, 0xCu);
    }
  }

}

- (void)windowScene:(id)a3 didUpdateCoordinateSpace:(id)a4 interfaceOrientation:(int64_t)a5 traitCollection:(id)a6
{
  id v6;
  id v7;

  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v7, "postNotificationName:object:", PXLemonadeWindowSceneDidUpdateNotification, v6);

}

- (void)openUserActivity:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  _BOOL4 v10;
  uint64_t v11;
  NSObject *v12;
  _BOOL4 v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  int v17;
  id v18;

  v4 = a3;
  v5 = PLUIGetLog(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 138412290;
    v18 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "PhotosWindowSceneDelegate: received user activity: %@", (uint8_t *)&v17, 0xCu);
  }

  -[PhotosWindowSceneDelegate setPendingUserActivity:](self, "setPendingUserActivity:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "activityType"));
  if (objc_msgSend(v7, "isEqualToString:", CSQueryContinuationActionType))
  {
    -[PhotosWindowSceneDelegate _openSpotlightSearchActivity:](self, "_openSpotlightSearchActivity:", v4);
  }
  else if (objc_msgSend(v7, "isEqualToString:", NSUserActivityTypeBrowsingWeb))
  {
    -[PhotosWindowSceneDelegate _openUniversalLinkActivity:](self, "_openUniversalLinkActivity:", v4);
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosWindowSceneDelegate userActivityURLForUserActivity:](self, "userActivityURLForUserActivity:", v4));
    if (v8)
    {
      v9 = -[PhotosWindowSceneDelegate _isUserActivityExpired:](self, "_isUserActivityExpired:", v4);
      v10 = v9;
      v11 = PLUIGetLog(v9);
      v12 = objc_claimAutoreleasedReturnValue(v11);
      v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
      if (v10)
      {
        if (v13)
        {
          LOWORD(v17) = 0;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "User activity expired, skipping navigation", (uint8_t *)&v17, 2u);
        }

      }
      else
      {
        if (v13)
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "absoluteString"));
          v17 = 138412290;
          v18 = v16;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "PhotosWindowSceneDelegate: will navigate to URL: %@", (uint8_t *)&v17, 0xCu);

        }
        -[PhotosWindowSceneDelegate openRoutingURL:](self, "openRoutingURL:", v8);
      }
    }
    else
    {
      v14 = PLUIGetLog(0);
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v17 = 138412290;
        v18 = v4;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Unable to open user activity (can't convert to URL): %@", (uint8_t *)&v17, 0xCu);
      }

    }
  }

}

- (BOOL)_isUserActivityExpired:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  BOOL v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("timestamp")));

  v8 = 0;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    objc_msgSend(v5, "timeIntervalSinceDate:", v4);
    v7 = v6;

    if (v7 > 480.0)
      v8 = 1;
  }

  return v8;
}

- (void)_openUniversalLinkActivity:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  uint64_t v10;
  uint64_t Log;
  NSObject *v12;
  dispatch_time_t v13;
  uint64_t v14;
  NSObject *v15;
  int v16;
  id v17;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosWindowSceneDelegate rootViewController](self, "rootViewController"));
  v6 = PLUIGetLog(v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v8)
    {
      v16 = 138412290;
      v17 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "PhotosWindowSceneDelegate: Handling NSUserActivityTypeBrowsingWeb: %@", (uint8_t *)&v16, 0xCu);
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "webpageURL"));
    v10 = PXIsRetailExperienceManagerURL();
    if ((_DWORD)v10)
    {
      Log = PLAppIntentsGetLog();
      v12 = objc_claimAutoreleasedReturnValue(Log);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v16) = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Will present PXRetailExperienceManager, deferring to workaround rdar://117412505", (uint8_t *)&v16, 2u);
      }

      v13 = dispatch_time(0, 1000000000);
      dispatch_after(v13, (dispatch_queue_t)&_dispatch_main_q, &stru_10006AA10);
    }
    else
    {
      v14 = PLUIGetLog(v10);
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = 138412290;
        v17 = v9;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "PhotosWindowSceneDelegate: Ignoring unknown URL: \"%@\", (uint8_t *)&v16, 0xCu);
      }

    }
  }
  else
  {
    if (v8)
    {
      v16 = 138412290;
      v17 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "PhotosWindowSceneDelegate: Deferring handling of NSUserActivityTypeBrowsingWeb: %@", (uint8_t *)&v16, 0xCu);
    }

    -[PhotosWindowSceneDelegate setPendingUserActivity:](self, "setPendingUserActivity:", v4);
  }

}

- (void)_openSpotlightSearchActivity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t Log;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  uint8_t buf[4];
  id v25;

  v4 = a3;
  -[PhotosWindowSceneDelegate setDidRecieveSpotlightSearchActivity:](self, "setDidRecieveSpotlightSearchActivity:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[PXSearchParsecAnalyticsSession sharedSession](PXSearchParsecAnalyticsSession, "sharedSession"));
  objc_msgSend(v5, "reportPhotosAppLaunchedOrEnteredForegroundWithSpotlightSearchActivity");

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CSSearchQueryString));

  Log = PLPhotosSearchGetLog();
  v9 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v25 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Spotlight Search: Continuing Spotlight search query: %@", buf, 0xCu);
  }

  if (v7 && objc_msgSend(v7, "length"))
  {
    v10 = objc_claimAutoreleasedReturnValue(-[PhotosWindowSceneDelegate rootViewController](self, "rootViewController"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosWindowSceneDelegate tabbedLibraryViewController](self, "tabbedLibraryViewController"));
    v12 = objc_msgSend(objc_alloc((Class)PXProgrammaticNavigationDestination), "initWithSearchText:", v7);
    if ((-[NSObject routingOptionsForDestination:](v10, "routingOptionsForDestination:", v12) & 1) != 0)
    {
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_10001D3E4;
      v22[3] = &unk_10006AA38;
      v23 = v12;
      -[NSObject navigateToDestination:options:completionHandler:](v10, "navigateToDestination:options:completionHandler:", v23, 0, v22);
      v15 = v23;
    }
    else
    {
      if (!v11)
      {
        v17 = PLPhotosSearchGetLog();
        v18 = objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v25 = v4;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Spotlight Search: Setting pending user activity to open: %@", buf, 0xCu);
        }

        -[PhotosWindowSceneDelegate setPendingUserActivity:](self, "setPendingUserActivity:", v4);
        goto LABEL_14;
      }
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "viewControllers"));
      v14 = objc_msgSend(v13, "count");

      if (!v14)
        objc_msgSend(v11, "updateDisplayedTabsAnimated:", 0);
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_10001D4D0;
      v19[3] = &unk_10006CE50;
      v20 = v11;
      v21 = v7;
      objc_msgSend(v20, "navigateToContentMode:animated:completion:", 12, 0, v19);

      v15 = v20;
    }

LABEL_14:
    goto LABEL_15;
  }
  v16 = PXAssertGetLog();
  v10 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v25 = v4;
    _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Spotlight Search: Got unexpected empty string for Spotlight user activity: %@", buf, 0xCu);
  }
LABEL_15:

}

- (void)_retryProgrammaticNavigationToDestination:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosWindowSceneDelegate rootViewController](self, "rootViewController"));
  if ((objc_msgSend(v5, "routingOptionsForDestination:", v4) & 1) != 0)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10001D2A0;
    v6[3] = &unk_10006AA38;
    v7 = v4;
    objc_msgSend(v5, "navigateToDestination:options:completionHandler:", v7, 0, v6);

  }
}

- (void)openRoutingURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  PhotosURLRedirectRequest *v15;
  void *v16;
  PhotosURLNavigationRequest *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  PhotosURLNavigationRequest *v24;
  void *v25;
  _QWORD v26[5];
  _QWORD v27[5];
  _QWORD v28[4];
  id v29;
  id v30;
  PhotosWindowSceneDelegate *v31;
  uint8_t buf[4];
  void *v33;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosWindowSceneDelegate rootViewController](self, "rootViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosWindowSceneDelegate tabbedLibraryViewController](self, "tabbedLibraryViewController"));
  v7 = PLUIGetLog(v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "absoluteString"));
    *(_DWORD *)buf = 138412290;
    v33 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Open Routing URL: %@", buf, 0xCu);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "scheme"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bundleIdentifier"));
  v13 = objc_msgSend(v10, "caseInsensitiveCompare:", v12);

  if (!v13)
  {
    v14 = (id)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    objc_msgSend(v14, "handleOAuthRedirectURL:", v4);
    goto LABEL_20;
  }
  if (v5)
  {
    v14 = objc_msgSend(objc_alloc((Class)PXProgrammaticNavigationDestination), "initWithURL:", v4);
    if ((objc_msgSend(v5, "routingOptionsForDestination:", v14) & 1) != 0)
    {
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_10001D044;
      v28[3] = &unk_10006AA60;
      v29 = v4;
      v30 = v14;
      v31 = self;
      objc_msgSend(v5, "navigateToDestination:options:completionHandler:", v30, 0, v28);

    }
    else if (objc_msgSend(v10, "isEqualToString:", CFSTR("photos-redirect")) && v6)
    {
      v15 = -[PhotosURLRedirectRequest initWithDestinationURL:rootController:]([PhotosURLRedirectRequest alloc], "initWithDestinationURL:rootController:", v4, v6);
      -[PhotosURLRedirectRequest performRequest](v15, "performRequest");

    }
    else
    {
      if (objc_msgSend(v10, "isEqualToString:", CFSTR("photos-navigation")) && v6)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosWindowSceneDelegate inProgressURLNavigationRequest](self, "inProgressURLNavigationRequest"));
        objc_msgSend(v16, "cancelPendingNavigation");

        v17 = -[PhotosURLNavigationRequest initWithDestinationURL:rootController:]([PhotosURLNavigationRequest alloc], "initWithDestinationURL:rootController:", v4, v6);
        -[PhotosWindowSceneDelegate setInProgressURLNavigationRequest:](self, "setInProgressURLNavigationRequest:", v17);

        v18 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosWindowSceneDelegate inProgressURLNavigationRequest](self, "inProgressURLNavigationRequest"));
        v27[0] = _NSConcreteStackBlock;
        v27[1] = 3221225472;
        v27[2] = sub_10001D288;
        v27[3] = &unk_10006C038;
        v27[4] = self;
        objc_msgSend(v18, "navigateAllowingRetry:completion:", 1, v27);
      }
      else
      {
        if (!objc_msgSend(v10, "isEqualToString:", CFSTR("photos")))
        {
          +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "_retryProgrammaticNavigationToDestination:", v14);
          -[PhotosWindowSceneDelegate performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "_retryProgrammaticNavigationToDestination:", v14, 0.3);
          goto LABEL_20;
        }
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "resourceSpecifier"));
        if (objc_msgSend(v18, "containsString:", CFSTR("show-welcome-cpl")))
        {
          v19 = objc_msgSend(objc_alloc((Class)PXCloudPhotoWelcomeViewController), "initWithDefaultTitle");
          v20 = objc_msgSend(objc_alloc((Class)PXCloudPhotoWelcomeNavigationController), "initWithWelcomeController:", v19);
          objc_msgSend(v5, "presentViewController:animated:completion:", v20, 1, 0);

        }
        else if (objc_msgSend(v18, "containsString:", CFSTR("edit")))
        {
          PUPhotoEditHandleURLAction(v5, v4);
        }
        else if (v6)
        {
          if (objc_msgSend(v18, "containsString:", CFSTR("import")))
          {
            v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
            v22 = (void *)objc_claimAutoreleasedReturnValue(+[PHImportController sharedInstance](PHImportController, "sharedInstance"));
            objc_msgSend(v22, "enableDeviceImport");
            objc_msgSend(v22, "addImportControllerObserver:", v21);

          }
          v23 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosWindowSceneDelegate inProgressURLNavigationRequest](self, "inProgressURLNavigationRequest"));
          objc_msgSend(v23, "cancelPendingNavigation");

          v24 = -[PhotosURLNavigationRequest initWithDestinationURL:rootController:]([PhotosURLNavigationRequest alloc], "initWithDestinationURL:rootController:", v4, v6);
          -[PhotosWindowSceneDelegate setInProgressURLNavigationRequest:](self, "setInProgressURLNavigationRequest:", v24);

          v25 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosWindowSceneDelegate inProgressURLNavigationRequest](self, "inProgressURLNavigationRequest"));
          v26[0] = _NSConcreteStackBlock;
          v26[1] = 3221225472;
          v26[2] = sub_10001D294;
          v26[3] = &unk_10006C038;
          v26[4] = self;
          objc_msgSend(v25, "navigateAllowingRetry:completion:", 1, v26);

        }
      }

    }
LABEL_20:

    goto LABEL_21;
  }
  -[PhotosWindowSceneDelegate setPendingURLToOpen:](self, "setPendingURLToOpen:", v4);
LABEL_21:

}

- (void)openCloudKitShareWithURL:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t Log;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  uint8_t buf[4];
  void *v23;

  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    Log = PLSharingGetLog();
    v7 = objc_claimAutoreleasedReturnValue(Log);
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      goto LABEL_16;
    *(_WORD *)buf = 0;
    v16 = "Asked to open a *nil* cloud-kit share URL";
    v17 = v7;
    v18 = 2;
LABEL_14:
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, v16, buf, v18);
    goto LABEL_16;
  }
  v6 = PXIsSharedLibraryURL(v4);
  if ((v6 & 1) == 0 && (PXIsCMMURL(v5) & 1) == 0)
  {
    v19 = PLSharingGetLog();
    v7 = objc_claimAutoreleasedReturnValue(v19);
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      goto LABEL_16;
    *(_DWORD *)buf = 138412290;
    v23 = v5;
    v16 = "Asked to open an unknown type of cloud-kit share URL: %@";
    v17 = v7;
    v18 = 12;
    goto LABEL_14;
  }
  v7 = objc_claimAutoreleasedReturnValue(-[PhotosWindowSceneDelegate rootViewController](self, "rootViewController"));
  if (v7)
  {
    if (v6)
    {
      v8 = PLSharedLibraryGetLog();
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v5;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Will open Shared Library invitation with URL: %@", buf, 0xCu);
      }

      v10 = objc_alloc((Class)PXSharedLibrarySourceLibraryInfoPhotoKit);
      v11 = -[PhotosApplication px_photoLibrary]_0();
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      v13 = objc_msgSend(v10, "initWithPhotoLibrary:", v12);

      v14 = (void *)objc_claimAutoreleasedReturnValue(+[PXViewControllerPresenter defaultPresenterWithViewController:](PXViewControllerPresenter, "defaultPresenterWithViewController:", v7));
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_10001CF34;
      v20[3] = &unk_10006D1C0;
      v21 = v5;
      PXSharedLibraryHandleSharedLibraryURL(v13, v21, v14, v20);

    }
    else
    {
      -[PhotosWindowSceneDelegate _openMomentShareWithURL:](self, "_openMomentShareWithURL:", v5);
    }
  }
  else
  {
    -[PhotosWindowSceneDelegate setPendingCloudKitShareURLToOpen:](self, "setPendingCloudKitShareURLToOpen:", v5);
  }
LABEL_16:

}

- (void)_openMomentShareWithURL:(id)a3
{
  id v4;
  id inited;
  uint64_t Log;
  NSObject *v7;
  id v8;
  void **v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *, void *);
  void *v12;
  id v13;
  id v14;
  id location;
  uint8_t buf[4];
  id v17;

  v4 = a3;
  inited = objc_initWeak(&location, self);
  Log = PLSharingGetLog(inited);
  v7 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Will fetch moment share for URL: %@", buf, 0xCu);
  }

  v9 = _NSConcreteStackBlock;
  v10 = 3221225472;
  v11 = sub_10001CEC8;
  v12 = &unk_10006AA88;
  objc_copyWeak(&v14, &location);
  v8 = v4;
  v13 = v8;
  PXFetchMomentShareForURL();

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

- (void)_openItemProviderCollections:(id)a3
{
  id v4;
  void *v5;
  NSMutableArray *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  __CFString *v19;
  PhotosWindowSceneDelegate *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  NSMutableArray *v28;
  _BYTE v29[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("photos://album?name=camera-roll")));
  -[PhotosWindowSceneDelegate openRoutingURL:](self, "openRoutingURL:", v5);

  v6 = objc_opt_new(NSMutableArray);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v7);
        -[NSMutableArray addObjectsFromArray:](v6, "addObjectsFromArray:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v11));
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v9);
  }

  v13 = PLUIGetLog(v12);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = -[NSMutableArray count](v6, "count");
    *(_DWORD *)buf = 134218242;
    v26 = v15;
    v27 = 2112;
    v28 = v6;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "About to import %lu item providers (%@).", buf, 0x16u);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[PXImportManager defaultManager](PXImportManager, "defaultManager"));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10001CD1C;
  v18[3] = &unk_10006AAB0;
  v19 = CFSTR("photos://album?name=camera-roll");
  v20 = self;
  v17 = objc_msgSend(v16, "importItemProviders:completionHandler:", v6, v18);

}

- (void)_handleFetchedMomentShare:(id)a3 forURL:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t Log;
  NSObject *v14;
  id v15;
  uint64_t v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  uint8_t buf[4];
  void *v34;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v8)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "uuid"));
    Log = PLSharingGetLog(v12);
    v14 = objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v34 = v12;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Did fetch moment share: %{public}@", buf, 0xCu);
    }

    v15 = +[PXLemonadeSettings isLemonadeUIEnabled](PXLemonadeSettings, "isLemonadeUIEnabled");
    if ((_DWORD)v15)
    {
      v16 = PLSharingGetLog(v15);
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v34 = v12;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Will open iCloud Link with UUID: %{public}@", buf, 0xCu);
      }

      v18 = objc_msgSend(objc_alloc((Class)PXProgrammaticNavigationDestination), "initWithObject:revealMode:", v8, 1);
      v19 = objc_alloc((Class)PXProgrammaticNavigationRequest);
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_10001CBB8;
      v30[3] = &unk_10006AAD8;
      v31 = v12;
      v32 = v9;
      v20 = objc_msgSend(v19, "initWithDestination:options:completionHandler:", v18, 0, v30);
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosWindowSceneDelegate rootViewController](self, "rootViewController"));
      PXProgrammaticNavigationRequestExecute(v20, v21);

    }
    else
    {
      v18 = (id)objc_claimAutoreleasedReturnValue(-[PhotosWindowSceneDelegate tabbedLibraryViewController](self, "tabbedLibraryViewController"));
      objc_msgSend(v18, "navigateToInvitationCMMWithIdentifier:animated:", v12, 0);
    }

  }
  else
  {
    v22 = PLSharingGetLog(v10);
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v34 = v11;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Failed to fetch moment share with error: %@", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosWindowSceneDelegate tabbedLibraryViewController](self, "tabbedLibraryViewController"));
    v25 = v24;
    if (!v24)
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosWindowSceneDelegate rootViewController](self, "rootViewController"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[PXViewControllerPresenter defaultPresenterWithViewController:](PXViewControllerPresenter, "defaultPresenterWithViewController:", v25));
    if (!v24)

    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10001CCD8;
    v27[3] = &unk_10006AB00;
    objc_copyWeak(&v29, (id *)buf);
    v28 = v9;
    PXMomentSharePresentRetryAlertForFetchFailure(v11, v26, v27);

    objc_destroyWeak(&v29);
    objc_destroyWeak((id *)buf);
  }

}

- (id)userActivityURLForUserActivity:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  uint64_t Log;
  NSObject *v12;
  _BOOL4 v13;
  NSString *v14;
  const __CFString *v15;
  void *v16;
  int v17;
  __CFString *v18;
  const __CFString *v19;
  void *v20;
  unsigned int v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  unsigned int v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  unsigned int v36;
  void *v37;
  unsigned int v38;
  void *v39;
  unsigned int v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  NSString *v45;
  uint64_t v46;
  void *v47;
  const __CFString *v48;
  uint64_t v49;
  uint8_t buf[4];
  void *v51;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "userInfo"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("localIdentifier")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "activityType"));
  v9 = objc_msgSend(v8, "isEqualToString:", CSSearchableItemActionType);

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CSSearchableItemActivityIdentifier));
    Log = PLPhotosSearchGetLog();
    v12 = objc_claimAutoreleasedReturnValue(Log);
    v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v13)
      {
        *(_DWORD *)buf = 138412290;
        v51 = v10;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Photos Spotlight Search: will navigate to 1up for assetID: %@", buf, 0xCu);
      }

      v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("photos://contentmode?id=photos&assetuuid=%@&oneUp=1"), v10);
      goto LABEL_32;
    }
    if (v13)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Photos Spotlight Search: unexpectedly received CSSearchableItemActionType without an assetUUID, navigating to photolibrary tab", buf, 2u);
    }

    v15 = CFSTR("photos://contentmode?id=photos");
    goto LABEL_31;
  }
  if (v7)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[PHObject uuidFromLocalIdentifier:](PHObject, "uuidFromLocalIdentifier:", v7));
    if (v10)
    {
      v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("photos://asset?uuid=%@"), v10);
LABEL_32:
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue(v14);
      goto LABEL_33;
    }
    goto LABEL_52;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("contentMode")));
  v10 = v16;
  if (v16)
  {
    v17 = objc_msgSend(v16, "intValue");
    v18 = 0;
    if (v17 > 10)
    {
      if (v17 == 12)
      {
        v19 = CFSTR("search");
      }
      else
      {
        if (v17 != 11)
          goto LABEL_33;
        v19 = CFSTR("forYou");
      }
    }
    else if (v17 == 2)
    {
      v19 = CFSTR("albums");
    }
    else
    {
      if (v17 != 10)
        goto LABEL_33;
      v19 = CFSTR("photos");
    }
    v48 = v19;
    v15 = CFSTR("photos://contentmode?id=%@");
LABEL_31:
    v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v15, v48);
    goto LABEL_32;
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "activityType"));
  v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("com.apple.mobileslideshow.album"));

  if (v21)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("collectionSubtype")));
    v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("uuid")));
    v24 = (void *)v23;
    if (v23 && v22)
    {
      v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      objc_msgSend(v47, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PhotosWindowSceneDelegate.m"), 702, CFSTR("Conflicting parameters; prioritizing uuid"));

    }
    else if (!v23)
    {
      if (v22)
      {
        v34 = (void *)objc_claimAutoreleasedReturnValue(+[PHAssetCollection px_builtInAlbumNameForSubtype:](PHAssetCollection, "px_builtInAlbumNameForSubtype:", (int)objc_msgSend(v22, "intValue")));
        if (v34)
          v18 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("photos://album?name=%@"), v34));
        else
          v18 = 0;

      }
      else
      {
        v18 = 0;
      }
      goto LABEL_55;
    }
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("photos://album?uuid=%@"), v24));
LABEL_55:

    goto LABEL_56;
  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "activityType"));
  v26 = objc_msgSend(v25, "isEqualToString:", CFSTR("com.apple.mobileslideshow.people"));

  if (v26)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("identifier")));

    if (v27)
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("identifier")));
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("?identifier=%@"), v28));

      v18 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("photos://people"), "stringByAppendingString:", v29));
    }
    else
    {
      v18 = CFSTR("photos://people");
    }
    goto LABEL_33;
  }
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "activityType"));
  v33 = objc_msgSend(v32, "isEqualToString:", CFSTR("com.apple.mobileslideshow.places"));

  if ((v33 & 1) != 0)
  {
    v18 = CFSTR("photos://places");
    goto LABEL_33;
  }
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "activityType"));
  v36 = objc_msgSend(v35, "isEqualToString:", CFSTR("com.apple.mobileslideshow.memory"));

  if (v36)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("identifier")));
    if (objc_msgSend(v22, "length"))
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("photos://memory?identifier=%@"), v22));
    else
      v18 = 0;
  }
  else
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "activityType"));
    v38 = objc_msgSend(v37, "isEqualToString:", CFSTR("com.apple.mobileslideshow.oneUp"));

    if (!v38)
    {
LABEL_52:
      v18 = 0;
      goto LABEL_33;
    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("collectionType")));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("collectionSubtype")));
    v40 = objc_msgSend(v22, "intValue");
    v41 = (int)objc_msgSend(v39, "intValue");
    if (v40 == 1 && ((_DWORD)v41 == 101 || (_DWORD)v41 == 2))
    {
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("selectedUUIDs")));
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "objectAtIndexedSubscript:", 0));
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("albumUUID")));
      v45 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("photos://asset?uuid=%@&albumuuid=%@"), v43, v44);
    }
    else
    {
      v42 = (void *)objc_claimAutoreleasedReturnValue(+[PHAssetCollection px_builtInAlbumNameForSubtype:](PHAssetCollection, "px_builtInAlbumNameForSubtype:", v41));
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("selectedUUIDs")));
      v46 = objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "objectAtIndexedSubscript:", 0));
      v44 = (void *)v46;
      if (v42)
        v45 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("photos://asset?uuid=%@&albumname=%@"), v46, v42);
      else
        v45 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("photos://asset?uuid=%@"), v46, v49);
    }
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue(v45);

  }
LABEL_56:

LABEL_33:
  if (v18)
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v18));
  else
    v30 = 0;

  return v30;
}

- (void)_invalidateAppUI
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosWindowSceneDelegate mainWindow](self, "mainWindow"));
  objc_msgSend(v3, "setRootViewController:", 0);

  -[PhotosWindowSceneDelegate setTabbedLibraryViewController:](self, "setTabbedLibraryViewController:", 0);
  -[PhotosWindowSceneDelegate setSplitViewController:](self, "setSplitViewController:", 0);
  -[PhotosWindowSceneDelegate setLemonadeRootViewController:](self, "setLemonadeRootViewController:", 0);
  -[PhotosWindowSceneDelegate setupAppUI](self, "setupAppUI");
}

- (void)_ensurelemonadeRootViewControllerExists
{
  uint64_t Log;
  NSObject *v4;
  os_signpost_id_t v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  uint8_t v19[8];
  uint64_t v20;
  const __CFString *v21;

  Log = PLWindowSceneDelegateGetLog(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(Log);
  v5 = os_signpost_id_generate(v4);
  v6 = v4;
  v7 = v6;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)v19 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "CreateLemonadeRootViewController", ", v19, 2u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosWindowSceneDelegate lemonadeRootViewController](self, "lemonadeRootViewController"));
  if (!v8)
  {
    v9 = -[PhotosApplication px_photoLibrary]_0();
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = PXLemonadeViewControllerFactory();
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "viewControllerWithPhotoLibrary:", v10));
    -[PhotosWindowSceneDelegate setLemonadeRootViewController:](self, "setLemonadeRootViewController:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosWindowSceneDelegate lemonadeRootViewController](self, "lemonadeRootViewController"));
    objc_msgSend(v14, "setActionProviderDelegate:", self);

  }
  v15 = v7;
  v16 = v15;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)v19 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_INTERVAL_END, v5, "CreateLemonadeRootViewController", ", v19, 2u);
  }

  if (PLHasInternalUI())
  {
    v17 = CPAnalyticsEventTabIdentifierChanged;
    v20 = CPAnalyticsPayloadTabIdentifierDescriptionKey;
    v21 = CFSTR("Lemonade");
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1));
    +[CPAnalytics sendEvent:withPayload:](CPAnalytics, "sendEvent:withPayload:", v17, v18);

  }
}

- (BOOL)tabBarController:(id)a3 shouldSelectViewController:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  unsigned __int8 v8;

  v5 = a3;
  v6 = a4;
  v7 = objc_opt_class(PUTabbedLibraryViewController);
  if ((objc_opt_isKindOfClass(v5, v7) & 1) != 0)
    v8 = objc_msgSend(v5, "pu_shouldSelectViewController:", v6);
  else
    v8 = 1;

  return v8;
}

- (void)tabBarController:(id)a3 didSelectViewController:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;

  v15 = a4;
  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[PhotosWindowSceneDelegate tabbedLibraryViewController](self, "tabbedLibraryViewController"));

  if (v7 == v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosWindowSceneDelegate tabbedLibraryViewController](self, "tabbedLibraryViewController"));
    v9 = objc_msgSend(v8, "selectedContentMode");

    +[PXPLLibraryContentModeSelection setPersistedLibraryContentModeSelection:](PXPLLibraryContentModeSelection, "setPersistedLibraryContentModeSelection:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v9));
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, PLLibraryContentModeChangedNotificationKey);

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "px_navigationDestination"));
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, PLLibraryDestinationChangedNotificationKey);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v13, "postNotificationName:object:userInfo:", PLLibraryContentModeChangedNotification, 0, v10);

    v14 = PLSAggregateDictionaryKeyForPhotosTabContentMode(v9);
    if (v14)
      PLSAggregateDictionaryAddValueForScalarKey(v14, 1);
    -[PhotosWindowSceneDelegate showNetworkPromptIfNecessary](self, "showNetworkPromptIfNecessary");

  }
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  unsigned int v9;
  id v10;
  id v11;

  v11 = a3;
  v6 = a4;
  v7 = objc_claimAutoreleasedReturnValue(+[PUTabbedLibrarySettings sharedInstance](PUTabbedLibrarySettings, "sharedInstance"));
  if (v7)
  {
    v8 = (void *)v7;
    v9 = objc_msgSend(v6, "isEqualToString:", CFSTR("sidebarEnabled"));

    if (v9)
      -[PhotosWindowSceneDelegate setupAppUI](self, "setupAppUI");
  }
  if (_os_feature_enabled_impl("Photos", "Lemonade"))
  {
    v10 = (id)objc_claimAutoreleasedReturnValue(+[PXLemonadeSettings sharedInstance](PXLemonadeSettings, "sharedInstance"));

    if (v10 == v11)
    {
      if (qword_10007C0A8 != -1)
        dispatch_once(&qword_10007C0A8, &stru_10006AB60);
      if (objc_msgSend((id)qword_10007C0A0, "containsObject:", v6))
        -[PhotosWindowSceneDelegate _invalidateAppUI](self, "_invalidateAppUI");
    }
  }

}

- (id)actionMenuElementsForObjects:(id)a3 allowedActionTypes:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[PXActionManagerFactory actionManagerForObjects:](PXActionManagerFactory, "actionManagerForObjects:", a3));
  objc_msgSend(v7, "setAllowedActionTypes:", v6);

  objc_msgSend(v7, "setPerformerDelegate:", self);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10001C9B4;
  v11[3] = &unk_10006CB48;
  v12 = v7;
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "contextMenuElementsWithHandler:", v11));

  return v9;
}

- (void)performActionWithType:(id)a3 objects:(id)a4 parameters:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  int v15;
  id v16;
  __int16 v17;
  id v18;

  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[PXActionManagerFactory actionManagerForObjects:](PXActionManagerFactory, "actionManagerForObjects:", a4));
  objc_msgSend(v10, "setPerformerDelegate:", self);
  v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "actionTypeForGenericType:", v8));
  v12 = v11;
  if (v11
    && (v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "actionPerformerForActionType:parameters:", v11, v9))) != 0)
  {
    v13 = v11;
    -[NSObject performActionWithCompletionHandler:](v11, "performActionWithCompletionHandler:", 0);
  }
  else
  {
    v14 = PLUIGetLog(v11);
    v13 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v15 = 138412546;
      v16 = v8;
      v17 = 2112;
      v18 = v9;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "unable to get an action performer for type '%@' and parameters %@", (uint8_t *)&v15, 0x16u);
    }
  }

}

- (id)undoManagerForActionPerformer:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosWindowSceneDelegate rootViewController](self, "rootViewController", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "undoManager"));

  return v4;
}

- (id)presentationEnvironmentForActionPerformer:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosWindowSceneDelegate rootViewController](self, "rootViewController", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[PXViewControllerPresenter defaultPresenterWithViewController:](PXViewControllerPresenter, "defaultPresenterWithViewController:", v3));

  return v4;
}

- (unint64_t)routingOptionsForDestination:(id)a3
{
  return 1;
}

- (void)navigateToDestination:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;

  v12 = a3;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosWindowSceneDelegate nextExistingParticipantOnRouteToDestination:](self, "nextExistingParticipantOnRouteToDestination:", v12));
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "navigateToDestination:options:completionHandler:", v12, a4, v8);
  }
  else
  {
    v11 = objc_msgSend(objc_alloc((Class)PXProgrammaticNavigationRequest), "initWithDestination:options:completionHandler:", v12, a4, v8);
    -[PhotosWindowSceneDelegate setPendingProgrammaticNavigationRequestToOpen:](self, "setPendingProgrammaticNavigationRequestToOpen:", v11);

  }
}

- (id)nextExistingParticipantOnRouteToDestination:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  if (+[PXLemonadeSettings isLemonadeUIEnabled](PXLemonadeSettings, "isLemonadeUIEnabled", a3))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosWindowSceneDelegate splitViewController](self, "splitViewController"));
    v5 = v4;
    if (v4)
    {
      v6 = v4;
    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosWindowSceneDelegate lemonadeRootViewController](self, "lemonadeRootViewController"));
      v8 = v7;
      if (v7)
        v9 = v7;
      else
        v9 = (id)objc_claimAutoreleasedReturnValue(-[PhotosWindowSceneDelegate tabbedLibraryViewController](self, "tabbedLibraryViewController"));
      v6 = v9;

    }
  }
  else
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[PhotosWindowSceneDelegate tabbedLibraryViewController](self, "tabbedLibraryViewController"));
  }
  return v6;
}

- (PXProgrammaticNavigationDestination)px_navigationDestination
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosWindowSceneDelegate tabbedLibraryViewController](self, "tabbedLibraryViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "px_navigationDestination"));

  return (PXProgrammaticNavigationDestination *)v3;
}

- (PXImportViewControllerInstanceHost)importViewControllerInstanceHost
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosWindowSceneDelegate lemonadeRootViewController](self, "lemonadeRootViewController"));
  v4 = objc_msgSend(v3, "conformsToProtocol:", &OBJC_PROTOCOL___PXImportViewControllerInstanceHost);

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosWindowSceneDelegate lemonadeRootViewController](self, "lemonadeRootViewController"));
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosWindowSceneDelegate tabbedLibraryViewController](self, "tabbedLibraryViewController"));

    if (v6)
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosWindowSceneDelegate tabbedLibraryViewController](self, "tabbedLibraryViewController"));
    else
      v5 = 0;
  }
  return (PXImportViewControllerInstanceHost *)v5;
}

- (PXActionProvider)lemonadeRootViewController
{
  return self->_lemonadeRootViewController;
}

- (void)setLemonadeRootViewController:(id)a3
{
  objc_storeStrong((id *)&self->_lemonadeRootViewController, a3);
}

- (PXCollectionActionReceiver)collectionActionReceiver
{
  return self->_collectionActionReceiver;
}

- (void)setSplitViewController:(id)a3
{
  objc_storeStrong((id *)&self->_splitViewController, a3);
}

- (void)setLastDidEnterBackgroundDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastDidEnterBackgroundDate, a3);
}

- (void)setPendingUserActivity:(id)a3
{
  objc_storeStrong((id *)&self->_pendingUserActivity, a3);
}

- (void)setPendingProgrammaticNavigationRequestToOpen:(id)a3
{
  objc_storeStrong((id *)&self->_pendingProgrammaticNavigationRequestToOpen, a3);
}

- (void)setPendingURLToOpen:(id)a3
{
  objc_storeStrong((id *)&self->_pendingURLToOpen, a3);
}

- (void)setPendingCloudKitShareURLToOpen:(id)a3
{
  objc_storeStrong((id *)&self->_pendingCloudKitShareURLToOpen, a3);
}

- (PhotosURLNavigationRequest)inProgressURLNavigationRequest
{
  return self->_inProgressURLNavigationRequest;
}

- (void)setInProgressURLNavigationRequest:(id)a3
{
  objc_storeStrong((id *)&self->_inProgressURLNavigationRequest, a3);
}

- (void)setDidRecieveSpotlightSearchActivity:(BOOL)a3
{
  self->_didRecieveSpotlightSearchActivity = a3;
}

- (PXLibraryFilterState)libraryFilterState
{
  return self->_libraryFilterState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryFilterState, 0);
  objc_storeStrong((id *)&self->_inProgressURLNavigationRequest, 0);
  objc_storeStrong((id *)&self->_pendingCloudKitShareURLToOpen, 0);
  objc_storeStrong((id *)&self->_pendingURLToOpen, 0);
  objc_storeStrong((id *)&self->_pendingProgrammaticNavigationRequestToOpen, 0);
  objc_storeStrong((id *)&self->_pendingUserActivity, 0);
  objc_storeStrong((id *)&self->_lastDidEnterBackgroundDate, 0);
  objc_storeStrong((id *)&self->_splitViewController, 0);
  objc_storeStrong((id *)&self->_mainWindow, 0);
  objc_storeStrong((id *)&self->_collectionActionReceiver, 0);
  objc_storeStrong((id *)&self->_lemonadeRootViewController, 0);
  objc_storeStrong((id *)&self->_tabbedLibraryViewController, 0);
  objc_storeStrong((id *)&self->_spec, 0);
}

@end
