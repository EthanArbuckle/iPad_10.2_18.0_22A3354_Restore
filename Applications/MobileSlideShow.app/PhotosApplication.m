@implementation PhotosApplication

- (id)photosWindowSceneDelegate
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  uint8_t buf[4];
  id v17;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosApplication applicationScene](self, "applicationScene"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "delegate"));
  if (v5)
  {
    v6 = objc_opt_class(PhotosWindowSceneDelegate);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) == 0)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      v8 = (objc_class *)objc_opt_class(PhotosWindowSceneDelegate);
      v9 = NSStringFromClass(v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "px_descriptionForAssertionMessage"));
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PhotosApplication.m"), 894, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("scene.delegate"), v10, v11);

    }
  }
  else
  {
    v12 = PLUIGetLog();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosApplication connectedScenes](self, "connectedScenes"));
      *(_DWORD *)buf = 134217984;
      v17 = objc_msgSend(v14, "count");
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "photosWindowSceneDelegate is nil as no application scene with appropriate delegate was found out of %tu scene(s)", buf, 0xCu);

    }
  }

  return v5;
}

- (void)prepareForApplicationWillEnterForeground
{
  void *v3;
  id v4;
  dispatch_time_t v5;
  void *v6;
  void *v7;
  PUImportViewController *importViewController;
  void *v9;
  _QWORD v10[5];
  _QWORD block[6];
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PhotosApplication;
  -[PhotosApplication prepareForApplicationWillEnterForeground](&v12, "prepareForApplicationWillEnterForeground");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosApplication photosWindowSceneDelegate](self, "photosWindowSceneDelegate"));
  v4 = objc_msgSend(v3, "activationOptions");

  v5 = dispatch_time(0, 500000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000212EC;
  block[3] = &unk_10006AC68;
  block[4] = self;
  block[5] = v4;
  dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, block);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10002146C;
  v10[3] = &unk_10006D620;
  v10[4] = self;
  px_dispatch_on_main_queue_when_idle_after_delay(v10, 2.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PUImportViewController importSource](self->_importViewController, "importSource"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosApplication importViewControllerInstanceHost](self, "importViewControllerInstanceHost"));
    importViewController = self->_importViewController;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PUImportViewController importSource](importViewController, "importSource"));
    objc_msgSend(v7, "setImportViewController:forImportSource:", importViewController, v9);

  }
}

- (void)prepareForApplicationDidBecomeActive
{
  dispatch_queue_attr_t v3;
  NSObject *v4;
  NSObject *v5;
  dispatch_time_t v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PhotosApplication;
  -[PhotosApplication prepareForApplicationDidBecomeActive](&v7, "prepareForApplicationDidBecomeActive");
  if (!-[PhotosApplication hasReloadedWidgetWhenActive](self, "hasReloadedWidgetWhenActive"))
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = dispatch_queue_create("com.apple.photos.widgetTimelinesReloadOnActiveQueue", v4);

    v6 = dispatch_time(0, 8000000000);
    dispatch_after(v6, v5, &stru_10006ACD0);
    -[PhotosApplication setHasReloadedWidgetWhenActive:](self, "setHasReloadedWidgetWhenActive:", 1);

  }
}

- (UIScene)applicationScene
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  uint64_t v12;
  char isKindOfClass;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue(-[PhotosApplication connectedScenes](self, "connectedScenes"));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "session", (_QWORD)v16));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "role"));
        v10 = objc_msgSend(v9, "isEqualToString:", UIWindowSceneSessionRoleApplication);

        if (v10)
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "delegate"));
          v12 = objc_opt_class(PhotosWindowSceneDelegate);
          isKindOfClass = objc_opt_isKindOfClass(v11, v12);

          if ((isKindOfClass & 1) != 0)
          {
            v14 = v7;

            goto LABEL_12;
          }
        }

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v4)
        continue;
      break;
    }
  }
  v14 = 0;
LABEL_12:

  return (UIScene *)v14;
}

- (void)applicationDidFinishLaunching:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  PFStateCaptureHandler *v9;
  PFStateCaptureHandler *stateCaptureHandler;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[5];
  _QWORD v19[5];
  _QWORD v20[4];
  id v21;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)PhotosApplication;
  -[PhotosApplication applicationDidFinishLaunching:](&v22, "applicationDidFinishLaunching:", a3);
  if (_os_feature_enabled_impl("IntelligenceFlow", "IntelligenceFlow"))
  {
    PXAppIntentsAddPhotoLibraryProviderDependency(self);
    PXAppIntentsAddURLNavigationPerformerProviderDependency(self);
    PXAppIntentsAddPersonImageProviderDependency(self);
    PXAppIntentsAddPendingEditsRequestProviderDependency(self);
  }
  -[PhotosApplication ppt_prepareApplicationForTesting](self, "ppt_prepareApplicationForTesting");
  PXApplicationAudioSessionSetCategory(1, &stru_10006ABB8);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[PHImportController sharedInstance](PHImportController, "sharedInstance"));
  objc_msgSend(v4, "enableDeviceImport");
  objc_msgSend(v4, "addImportControllerObserver:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUbiquitousKeyValueStore defaultStore](NSUbiquitousKeyValueStore, "defaultStore"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[PXPreloadScheduler sharedScheduler](PXPreloadScheduler, "sharedScheduler"));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100021640;
  v20[3] = &unk_10006D620;
  v8 = v6;
  v21 = v8;
  objc_msgSend(v7, "scheduleTaskWithQoS:block:", 0, v20);

  objc_msgSend(v5, "addObserver:selector:name:object:", self, "_userDidTakeScreenshot:", UIApplicationUserDidTakeScreenshotNotification, 0);
  v9 = (PFStateCaptureHandler *)objc_msgSend(objc_alloc((Class)PFStateCaptureHandler), "initWithProvider:", self);
  stateCaptureHandler = self->_stateCaptureHandler;
  self->_stateCaptureHandler = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UNUserNotificationCenter currentNotificationCenter](UNUserNotificationCenter, "currentNotificationCenter"));
  objc_msgSend(v11, "setDelegate:", self);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  +[CPAnalytics setupWithConfigurationFilename:inBundle:](CPAnalytics, "setupWithConfigurationFilename:inBundle:", CFSTR("CPAnalyticsConfig-Photos"), v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosApplication px_photoLibrary](self, "px_photoLibrary"));
  +[CPAnalytics setupSystemPropertyProvidersForLibrary:](CPAnalytics, "setupSystemPropertyProvidersForLibrary:", v13);

  +[CPAnalytics startAppTracking](CPAnalytics, "startAppTracking");
  +[CPAnalytics startViewTracking](CPAnalytics, "startViewTracking");
  +[UIApplication pu_prepareCPAnalytics](UIApplication, "pu_prepareCPAnalytics");
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[PXPreloadScheduler sharedScheduler](PXPreloadScheduler, "sharedScheduler"));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100021650;
  v19[3] = &unk_10006D620;
  v19[4] = self;
  objc_msgSend(v14, "scheduleTaskWithQoS:block:", 0, v19);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[PXPreloadScheduler sharedScheduler](PXPreloadScheduler, "sharedScheduler"));
  objc_msgSend(v15, "scheduleDeferredTaskWithQoS:block:", 1, &stru_10006AC18);

  if (PFProcessIsLaunchedToExecuteTests(v16, v17))
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10002168C;
    v18[3] = &unk_10006D620;
    v18[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v18);
  }

}

- (id)px_photoLibrary
{
  void *v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t Log;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;

  os_unfair_lock_lock((os_unfair_lock_t)&unk_10007C0C8);
  v0 = (void *)qword_10007C0D0;
  if (!qword_10007C0D0)
  {
    v1 = (void *)objc_claimAutoreleasedReturnValue(+[PLPhotoLibraryPathManager systemLibraryURL](PLPhotoLibraryPathManager, "systemLibraryURL"));
    if (PLMobileSlideShowPhotoLibraryTestingMode() == 2)
    {
      v2 = objc_alloc_init((Class)PHPhotoLibraryManager);
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[PHPhotoLibraryCreationOptions creationOptionsForUserLibrary](PHPhotoLibraryCreationOptions, "creationOptionsForUserLibrary"));
      objc_msgSend(v3, "setInternalCreateOptions:", 211);
      v14 = 0;
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "createPhotoLibraryWithURL:options:error:", v1, v3, &v14));
      v5 = v14;
      if (v4)
      {
        Log = PLBackendGetLog();
        v7 = objc_claimAutoreleasedReturnValue(Log);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bundleIdentifier"));
          *(_DWORD *)buf = 138412546;
          v16 = v9;
          v17 = 2112;
          v18 = v1;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "created test photo library for %@ at %@", buf, 0x16u);

        }
      }
      else
      {
        +[NSException raise:format:](NSException, "raise:format:", NSInternalInconsistencyException, CFSTR("Unable to create test photo library: %@"), v5);
      }

    }
    v10 = objc_msgSend(objc_alloc((Class)PHPhotoLibrary), "initWithPhotoLibraryURL:", v1);
    v11 = (void *)qword_10007C0D0;
    qword_10007C0D0 = (uint64_t)v10;

    v0 = (void *)qword_10007C0D0;
  }
  v12 = v0;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_10007C0C8);
  return v12;
}

- (void)updateShowHiddenAlbumCachedValue
{
  uint64_t IsHiddenAlbumVisible;

  IsHiddenAlbumVisible = PXPreferencesIsHiddenAlbumVisible(self, a2);
  -[PhotosApplication setHiddenAlbumIsVisible:](self, "setHiddenAlbumIsVisible:", IsHiddenAlbumVisible);
}

- (void)setHiddenAlbumIsVisible:(BOOL)a3
{
  self->_hiddenAlbumIsVisible = a3;
}

- (void)setHasReloadedWidgetWhenActive:(BOOL)a3
{
  self->_hasReloadedWidgetWhenActive = a3;
}

- (BOOL)hasReloadedWidgetWhenActive
{
  return self->_hasReloadedWidgetWhenActive;
}

- (void)_displayAndRemovePhoneInvitationFailures
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100003B70;
  v2[3] = &unk_10006AD68;
  v2[4] = self;
  +[PLPhotoSharingHelper handlePhoneInvitationFailuresWithCompletionBlock:](PLPhotoSharingHelper, "handlePhoneInvitationFailuresWithCompletionBlock:", v2);
}

- (UIViewController)contentViewController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosApplication keyTabbedLibraryViewController](self, "keyTabbedLibraryViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "window"));

  if (!v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosApplication keyRootViewController](self, "keyRootViewController"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "window"));
    if (v8)
    {
      v3 = v6;
LABEL_4:

    }
    else
    {
      while (1)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "presentedViewController"));

        if (!v9)
          break;
        v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "presentedViewController"));

        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "view"));
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "window"));
        v6 = v3;
        if (v8)
          goto LABEL_4;
      }
      v3 = v6;
    }
  }
  return (UIViewController *)v3;
}

- (NSUndoManager)fallbackUndoManager
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosApplication contentViewController](self, "contentViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "undoManager"));

  return (NSUndoManager *)v3;
}

- (PXActionManager)assetActionManager
{
  void *v3;
  id WeakRetained;
  BOOL v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  PhotosApplication *v11;
  id v12;
  void *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosApplication contentViewController](self, "contentViewController"));
  WeakRetained = objc_loadWeakRetained((id *)&self->_actionManagerProvider);

  if (WeakRetained)
    v5 = 1;
  else
    v5 = v3 == 0;
  if (!v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "view"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "window"));
    v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_responderForKeyEvents"));

    if (v8)
    {
      while ((objc_opt_respondsToSelector(v8, "assetActionManager") & 1) == 0)
      {
        v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "nextResponder"));

        v8 = (id)v9;
        if (!v9)
          goto LABEL_10;
      }
      v8 = v8;
    }
LABEL_10:
    objc_storeWeak((id *)&self->_actionManagerProvider, v8);

  }
  v10 = objc_loadWeakRetained((id *)&self->_actionManagerProvider);
  if (v10)
  {
    v11 = (PhotosApplication *)objc_loadWeakRetained((id *)&self->_actionManagerProvider);
    if (v11 == self)
    {
      v13 = 0;
    }
    else
    {
      v12 = objc_loadWeakRetained((id *)&self->_actionManagerProvider);
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "assetActionManager"));

    }
  }
  else
  {
    v13 = 0;
  }

  return (PXActionManager *)v13;
}

- (void)invalidateActionManagerProvider
{
  objc_storeWeak((id *)&self->_actionManagerProvider, 0);
}

- (void)prepareForApplicationDidEnterBackground
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PhotosApplication;
  -[PhotosApplication prepareForApplicationDidEnterBackground](&v2, "prepareForApplicationDidEnterBackground");
  +[PhotosAppShortcutsProviderWrapper updateAppShortcutParameters](_TtC15MobileSlideShow33PhotosAppShortcutsProviderWrapper, "updateAppShortcutParameters");
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PhotosApplication;
  -[PhotosApplication pressesBegan:withEvent:](&v5, "pressesBegan:withEvent:", a3, a4);
  -[PhotosApplication invalidateActionManagerProvider](self, "invalidateActionManagerProvider");
}

- (void)_showUserNotificationsPromptIfNecessaryWithCompletion:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UNUserNotificationCenter currentNotificationCenter](UNUserNotificationCenter, "currentNotificationCenter"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100020D9C;
  v6[3] = &unk_10006B020;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "requestAuthorizationWithOptions:completionHandler:", 7, v6);

}

- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5
{
  id v7;
  void (**v8)(id, _QWORD);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  int v20;
  id v21;

  v7 = a4;
  v8 = (void (**)(id, _QWORD))a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "request"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "content"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "userInfo"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", kNotificationKeySuppresionContexts));

  if (objc_msgSend(v12, "count"))
    v13 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v12));
  else
    v13 = objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
  v14 = (void *)v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosApplication notificationSuppressionContexts](self, "notificationSuppressionContexts"));
  v16 = objc_msgSend(v15, "intersectsSet:", v14);

  if (v16)
  {
    v18 = PLUIGetLog(v17);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 138412290;
      v21 = v7;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Suppressing notification: %@", (uint8_t *)&v20, 0xCu);
    }

    v8[2](v8, 0);
  }
  else
  {
    v8[2](v8, 27);
  }

}

- (id)stateCaptureDictionary
{
  uint64_t v2;
  void *v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;
  const __CFString *v12;
  uint64_t v13;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_100020D18;
  v10 = sub_100020D28;
  v11 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100020D30;
  v5[3] = &unk_10006D288;
  v5[4] = &v6;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v5);
  v2 = v7[5];
  v12 = CFSTR("currentAssetUUID");
  v13 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1));
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)_userDidTakeScreenshot:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  id v10;

  if (!-[PhotosApplication applicationState](self, "applicationState", a3))
  {
    v10 = (id)objc_claimAutoreleasedReturnValue(+[UIApplication pu_debugCurrentAsset](UIApplication, "pu_debugCurrentAsset"));
    if (v10)
    {
      v4 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", 2);
      v5 = objc_opt_class(PHAsset);
      if ((objc_opt_isKindOfClass(v10, v5) & 1) != 0)
        v6 = v10;
      else
        v6 = 0;
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CPAnalyticsPayloadAssetsKey);
      v7 = (objc_class *)objc_opt_class(self);
      v8 = NSStringFromClass(v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CPAnalyticsPayloadClassNameKey);

      +[CPAnalytics sendEvent:withPayload:](CPAnalytics, "sendEvent:withPayload:", CPAnalyticsEventScreenshotTaken, v4);
    }

  }
}

- (void)_beginUndoActionsInvalidator
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosApplication px_photoLibrary](self, "px_photoLibrary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "librarySpecificFetchOptions"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[PHAssetCollection fetchAssetCollectionsWithType:subtype:options:](PHAssetCollection, "fetchAssetCollectionsWithType:subtype:options:", 2, 1000000201, v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100020BB4;
  v8[3] = &unk_10006D648;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  px_dispatch_on_main_queue(v8);

}

- (void)photosPreferencesChanged
{
  unsigned int v3;
  _BOOL8 v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  uint8_t v8[16];
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PhotosApplication;
  -[PhotosApplication photosPreferencesChanged](&v9, "photosPreferencesChanged");
  v3 = -[PhotosApplication hiddenAlbumIsVisible](self, "hiddenAlbumIsVisible");
  -[PhotosApplication updateShowHiddenAlbumCachedValue](self, "updateShowHiddenAlbumCachedValue");
  v4 = -[PhotosApplication hiddenAlbumIsVisible](self, "hiddenAlbumIsVisible");
  if (!v4 && v3)
  {
    v5 = PLUIGetLog(v4);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Preferences 'HiddenAlbumVisible' changed to NO in Photos. Forcing navigation to root view controller in current navigation controller.", v8, 2u);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosApplication keyTabbedLibraryViewController](self, "keyTabbedLibraryViewController"));
    objc_msgSend(v7, "navigateToAlbumsTabRoot");

  }
}

- (id)_newImportViewController
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint8_t v12[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosApplication keySpec](self, "keySpec"));
  if (!v3)
  {
    v4 = PLUIGetLog(0);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "_newImportViewController: PhotosAppSpec from keySpec is nil; it may be too early to access our connected scene. "
        "Instantiating a PhotosAppSpec from our current interface idiom as a fallback.",
        v12,
        2u);
    }

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[PhotosAppSpec specForIdiom:](PhotosAppSpec, "specForIdiom:", objc_msgSend(v6, "userInterfaceIdiom")));

  }
  v7 = objc_alloc((Class)PUImportViewController);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "importViewControllerSpec"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosApplication px_photoLibrary](self, "px_photoLibrary"));
  v10 = objc_msgSend(v7, "initWithSpec:photoLibrary:", v8, v9);

  return v10;
}

- (BOOL)isShowingImportTab
{
  void *v2;
  void *v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosApplication keyTabbedLibraryViewController](self, "keyTabbedLibraryViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "importViewController"));
  v4 = v3 != 0;

  return v4;
}

- (void)_dequeueNextImportDevice
{
  void *v3;
  uint64_t Log;
  NSObject *v5;
  PUImportViewController *v6;
  PUImportViewController *importViewController;
  void *v8;
  int v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_importDeviceQueue, "firstObject"));
  Log = PLCameraConnectionKitGetLog();
  v5 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v9 = 138412290;
    v10 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "_dequeueNextImportDevice: %@", (uint8_t *)&v9, 0xCu);
  }

  if (v3)
  {
    -[NSMutableArray removeObjectAtIndex:](self->_importDeviceQueue, "removeObjectAtIndex:", 0);
    if (self->_importViewController)
      -[PhotosApplication _tearDownImportViewController](self, "_tearDownImportViewController");
    v6 = -[PhotosApplication _newImportViewController](self, "_newImportViewController");
    importViewController = self->_importViewController;
    self->_importViewController = v6;

    -[PUImportViewController setImportSource:](self->_importViewController, "setImportSource:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosApplication importViewControllerInstanceHost](self, "importViewControllerInstanceHost"));
    objc_msgSend(v8, "setImportViewController:forImportSource:", self->_importViewController, v3);

  }
  else
  {
    -[PhotosApplication _tearDownImportViewController](self, "_tearDownImportViewController");
  }

}

- (void)_tearDownImportViewController
{
  PUImportViewController *importViewController;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[PUImportViewController importSource](self->_importViewController, "importSource"));
  -[PUImportViewController setImportSource:](self->_importViewController, "setImportSource:", 0);
  importViewController = self->_importViewController;
  self->_importViewController = 0;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosApplication importViewControllerInstanceHost](self, "importViewControllerInstanceHost"));
  objc_msgSend(v4, "setImportViewController:forImportSource:", 0, v5);

}

- (void)handleImportCompleteAlertResponse:(__CFUserNotification *)a3 flags:(unint64_t)a4
{
  -[PUImportViewController handleImportCompleteAlertResponse:flags:](self->_importViewController, "handleImportCompleteAlertResponse:flags:", a3, a4);
}

- (void)handleOAuthRedirectURL:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  int v8;
  uint64_t v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  _BYTE buf[24];
  void *v21;
  uint64_t *v22;

  v3 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2050000000;
  v4 = (void *)qword_10007C0E8;
  v19 = qword_10007C0E8;
  if (!qword_10007C0E8)
  {
    *(_QWORD *)buf = _NSConcreteStackBlock;
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = sub_100020A18;
    v21 = &unk_10006D288;
    v22 = &v16;
    sub_100020A18((uint64_t)buf);
    v4 = (void *)v17[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v16, 8);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sharedInstance", v16));
  v7 = objc_msgSend(v6, "handleOAuthRedirectURL:", v3);
  v8 = (int)v7;
  v9 = PLUIGetLog(v7);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "scheme"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "path"));
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v12;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v13;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Handled OAuth Redirect url %@:%@", buf, 0x16u);

    }
  }
  else if (v11)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "scheme"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "path"));
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v14;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v15;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Unable to handle OAuth Redirect url %@:%@", buf, 0x16u);

  }
}

- (void)_showCloudPhotoLibraryExitPromptIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSMutableDictionary *v11;
  uint64_t v12;
  uint64_t v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  objc_class *v23;
  NSString *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD v38[4];
  id v39;
  uint64_t v40;
  _QWORD v41[4];
  id v42;
  uint64_t v43;

  if ((PXCPLIsInTestReadonlyMode(self, a2) & 1) == 0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosApplication px_photoLibrary](self, "px_photoLibrary"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "cplStatus"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "exitDeleteTime"));
    v6 = v5;
    if (!v5)
    {
LABEL_14:

      return;
    }
    objc_msgSend(v5, "timeIntervalSince1970");
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("CPLExitWarningPromptShownforExitDate:%f"), v7));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dictionaryForKey:", v8));
    v11 = (NSMutableDictionary *)objc_msgSend(v10, "mutableCopy");

    if (!v11)
      v11 = objc_opt_new(NSMutableDictionary);
    v12 = PXCPLNumberOfCalendarDaysUntilDate(v6);
    v13 = v12;
    if (v12 < 8)
    {
      if (v12 < 2)
      {
        if (v12 != 1)
        {
LABEL_13:

          goto LABEL_14;
        }
        v14 = CFSTR("1");
      }
      else
      {
        v14 = CFSTR("7");
      }
    }
    else
    {
      v14 = CFSTR("30");
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", v14));

    if (!v15)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      objc_msgSend(v16, "setObject:forKey:", v11, v8);

      v17 = PULocalizedString(CFSTR("CPL_EXIT_PROMPT_TITLE_FORMAT"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(v17);
      v18 = PULocalizedString(CFSTR("CPL_EXIT_PROMPT_MESSAGE_FORMAT"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(v18);
      v19 = PFLocalizedStringWithValidatedFormat(v37, CFSTR("%d"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(v19);
      v20 = PFLocalizedStringWithValidatedFormat(v36, CFSTR("%d"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(v20);
      v21 = PULocalizedString(CFSTR("CPL_EXIT_PROMPT_OK"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(v21);
      v22 = PULocalizedString(CFSTR("CPL_EXIT_PROMPT_SETTINGS"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(v22);
      v23 = (objc_class *)objc_opt_class(self);
      v24 = NSStringFromClass(v23);
      v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v35, v34, 1, v13));
      v41[0] = _NSConcreteStackBlock;
      v41[1] = 3221225472;
      v41[2] = sub_1000208C4;
      v41[3] = &unk_10006AD90;
      v43 = v13;
      v27 = v25;
      v42 = v27;
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v32, 0, v41));
      objc_msgSend(v26, "addAction:", v28);

      v38[0] = _NSConcreteStackBlock;
      v38[1] = 3221225472;
      v38[2] = sub_1000208FC;
      v38[3] = &unk_10006AD90;
      v39 = v27;
      v40 = v13;
      v29 = v27;
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v33, 0, v38));
      objc_msgSend(v26, "addAction:", v30);

      v31 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosApplication px_firstKeyWindow](self, "px_firstKeyWindow"));
      objc_msgSend(v31, "pl_presentViewController:animated:", v26, 1);

    }
    goto LABEL_13;
  }
}

- (void)_showSyncReminderPromptIfNecessary
{
  unsigned int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  _BOOL4 v12;
  double v13;
  _BOOL4 v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosApplication px_photoLibrary](self, "px_photoLibrary"));
  v3 = objc_msgSend(v32, "isCloudPhotoLibraryEnabled");
  v4 = v32;
  if (!v3)
    goto LABEL_10;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "cplStatus"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastSuccessfulSyncDate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("CPLSyncReminderLastPromptDate")));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v10 = v9;
  if (!v6)
  {
    v12 = 1;
    if (v8)
      goto LABEL_4;
LABEL_6:
    v14 = 0;
    goto LABEL_7;
  }
  objc_msgSend(v9, "timeIntervalSinceDate:", v6);
  v12 = v11 <= 604800.0;
  if (!v8)
    goto LABEL_6;
LABEL_4:
  objc_msgSend(v10, "timeIntervalSinceDate:", v8);
  v14 = v13 <= 604800.0;
LABEL_7:
  if (!v12 && !v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "components:fromDate:toDate:options:", 16, v6, v10, 0));

    v31 = v5;
    v16 = objc_msgSend(v30, "day");
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v17, "setObject:forKey:", v10, CFSTR("CPLSyncReminderLastPromptDate"));

    v18 = PULocalizedString(CFSTR("ICLOUDPHOTOS_SYNC_REMINDER_TITLE"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v29 = v16;
    v20 = PFLocalizedStringWithValidatedFormat(v19, CFSTR("%d"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    v22 = PULocalizedString(CFSTR("ICLOUDPHOTOS_SYNC_REMINDER_MESSAGE"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    v24 = PULocalizedString(CFSTR("ICLOUDPHOTOS_SYNC_REMINDER_OK"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v21, v23, 1, v29));
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v25, 1, 0));
    objc_msgSend(v26, "addAction:", v27);

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosApplication px_firstKeyWindow](self, "px_firstKeyWindow"));
    objc_msgSend(v28, "pl_presentViewController:animated:", v26, 1);

    v5 = v31;
  }

  v4 = v32;
LABEL_10:

}

- (void)_showWelcomeViewControllersIfNecessaryWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(void);

  v6 = (void (**)(void))a3;
  if (-[PhotosApplication launchedToTest](self, "launchedToTest"))
  {
    v6[2]();
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosApplication keyRootViewController](self, "keyRootViewController"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[PUWelcomeViewControllersManager defaultManager](PUWelcomeViewControllersManager, "defaultManager"));
    objc_msgSend(v5, "presentWelcomeViewControllersIfNecessaryFromViewController:completion:", v4, v6);

  }
}

- (void)_showAppleMusicPromptsIfNecessaryWithCompletion:(id)a3
{
  void *v3;
  id v4;
  void (**v5)(void);

  v5 = (void (**)(void))a3;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance"));
  v4 = objc_msgSend(v3, "appleMusicPromptTrigger");

  if (v4)
    v5[2]();
  else
    +[PXAppleMusicPrompter showPromptsIfNeededWithCompletion:](PXAppleMusicPrompter, "showPromptsIfNeededWithCompletion:", v5);

}

- (void)importController:(id)a3 addedImportSource:(id)a4
{
  id v5;
  uint64_t Log;
  NSObject *v7;
  void *v8;
  NSMutableArray *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  NSMutableArray *importDeviceQueue;
  NSMutableArray *v17;
  NSMutableArray *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[16];
  _BYTE v25[128];

  v5 = a4;
  Log = PLCameraConnectionKitGetLog();
  v7 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "_importDeviceAdded", buf, 2u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "uuid"));
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v9 = self->_importDeviceQueue;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v21;
    while (2)
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v9);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v13), "uuid", (_QWORD)v20));
        v15 = objc_msgSend(v14, "isEqualToString:", v8);

        if ((v15 & 1) != 0)
        {

          goto LABEL_16;
        }
        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      if (v11)
        continue;
      break;
    }
  }

  importDeviceQueue = self->_importDeviceQueue;
  if (!importDeviceQueue)
  {
    v17 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v18 = self->_importDeviceQueue;
    self->_importDeviceQueue = v17;

    importDeviceQueue = self->_importDeviceQueue;
  }
  -[NSMutableArray addObject:](importDeviceQueue, "addObject:", v5, (_QWORD)v20);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[PUImportViewController importSource](self->_importViewController, "importSource"));

  if (!v19)
    -[PhotosApplication _dequeueNextImportDevice](self, "_dequeueNextImportDevice");
LABEL_16:

}

- (void)importController:(id)a3 removedImportSource:(id)a4
{
  id v5;
  uint64_t Log;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSMutableArray *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSMutableArray *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[16];
  _BYTE v24[128];

  v5 = a4;
  Log = PLCameraConnectionKitGetLog();
  v7 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "_importDeviceRemoved", buf, 2u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "uuid"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PUImportViewController importSource](self->_importViewController, "importSource"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "uuid"));

  if (objc_msgSend(v8, "isEqualToString:", v10))
  {
    -[PhotosApplication _dequeueNextImportDevice](self, "_dequeueNextImportDevice");
  }
  else
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v11 = self->_importDeviceQueue;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v20;
LABEL_7:
      v15 = 0;
      while (1)
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "uuid"));
        if ((objc_msgSend(v17, "isEqualToString:", v8) & 1) != 0)
          break;

        if (v13 == (id)++v15)
        {
          v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
          if (v13)
            goto LABEL_7;
          goto LABEL_16;
        }
      }
      v18 = v16;

      if (!v18)
        goto LABEL_17;
      -[NSMutableArray removeObject:](self->_importDeviceQueue, "removeObject:", v18);
      v11 = v18;
    }
LABEL_16:

  }
LABEL_17:

}

- (void)performNebuladCrashRecoveryIfNeededForceEndLastTimelapseSession:(BOOL)a3
{
  NSObject *v5;
  _QWORD block[4];
  id v7;
  BOOL v8;
  id location;

  if (qword_10007C0E0 != -1)
    dispatch_once(&qword_10007C0E0, &stru_10006ADB0);
  objc_initWeak(&location, self);
  v5 = qword_10007C0D8;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002056C;
  block[3] = &unk_10006ADD8;
  objc_copyWeak(&v7, &location);
  v8 = a3;
  dispatch_async(v5, block);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (id)importViewControllerForImportSource:(id)a3
{
  return self->_importViewController;
}

- (id)keySpec
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosApplication photosWindowSceneDelegate](self, "photosWindowSceneDelegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "spec"));

  return v3;
}

- (PUTabbedLibraryViewController)keyTabbedLibraryViewController
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosApplication photosWindowSceneDelegate](self, "photosWindowSceneDelegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "tabbedLibraryViewController"));

  return (PUTabbedLibraryViewController *)v3;
}

- (PXRootLibraryNavigationController)lemonadeRootViewController
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosApplication photosWindowSceneDelegate](self, "photosWindowSceneDelegate"));

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "lemonadeRootViewController"));
  return (PXRootLibraryNavigationController *)v3;
}

- (UIViewController)keyRootViewController
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosApplication photosWindowSceneDelegate](self, "photosWindowSceneDelegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "rootViewController"));

  return (UIViewController *)v3;
}

- (id)importViewControllerInstanceHost
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosApplication photosWindowSceneDelegate](self, "photosWindowSceneDelegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "importViewControllerInstanceHost"));

  return v3;
}

- (PXCollectionActionReceiver)keyCollectionActionReceiver
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosApplication photosWindowSceneDelegate](self, "photosWindowSceneDelegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "collectionActionReceiver"));

  return (PXCollectionActionReceiver *)v3;
}

- (void)providePhotoLibrary:(id)a3
{
  void (**v5)(id, id);
  id v6;
  void *v7;
  id v8;

  v5 = (void (**)(id, id))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  if (!v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PhotosApplication.m"), 987, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

  }
  v6 = -[PhotosApplication px_photoLibrary]_0();
  v8 = (id)objc_claimAutoreleasedReturnValue(v6);
  v5[2](v5, v8);

}

- (void)provideURLNavigationPerformer:(id)a3
{
  void (**v5)(id, PhotosApplication *);
  void *v6;
  void (**v7)(id, PhotosApplication *);

  v7 = (void (**)(id, PhotosApplication *))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v5 = v7;
  if (!v7)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PhotosApplication.m"), 997, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

    v5 = 0;
  }
  v5[2](v5, self);

}

- (void)navigateToURLDestination:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD *v11;
  void *v12;
  uint64_t Log;
  NSObject *v14;
  NSMutableArray *appIntentsURLNavigationRequests;
  NSMutableArray *v16;
  NSMutableArray *v17;
  id v18;
  void *v19;
  uint8_t buf[16];
  _QWORD v21[4];
  id v22;
  PhotosApplication *v23;
  id v24;
  SEL v25;

  v7 = a3;
  v8 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  if (!v8)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PhotosApplication.m"), 1006, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

  }
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000201C8;
  v21[3] = &unk_10006AE28;
  v9 = v7;
  v22 = v9;
  v23 = self;
  v25 = a2;
  v10 = v8;
  v24 = v10;
  v11 = objc_retainBlock(v21);
  v12 = v11;
  if (self->_canSatisfyAppIntentsURLNavigationRequests)
  {
    ((void (*)(_QWORD *))v11[2])(v11);
  }
  else
  {
    Log = PLAppIntentsGetLog(v11);
    v14 = objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Defer App Intents URL navigation request", buf, 2u);
    }

    appIntentsURLNavigationRequests = self->_appIntentsURLNavigationRequests;
    if (!appIntentsURLNavigationRequests)
    {
      v16 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
      v17 = self->_appIntentsURLNavigationRequests;
      self->_appIntentsURLNavigationRequests = v16;

      appIntentsURLNavigationRequests = self->_appIntentsURLNavigationRequests;
    }
    v18 = objc_retainBlock(v12);
    -[NSMutableArray addObject:](appIntentsURLNavigationRequests, "addObject:", v18);

  }
}

- (void)noteSceneWillEnterForeground:(id)a3
{
  uint64_t v4;
  uint64_t Log;
  NSObject *v6;
  dispatch_time_t v7;
  _QWORD block[5];
  uint8_t buf[16];

  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  if (!self->_canSatisfyAppIntentsURLNavigationRequests)
  {
    Log = PLAppIntentsGetLog(v4);
    v6 = objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
    }

    v7 = dispatch_time(0, 1000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100020158;
    block[3] = &unk_10006D620;
    block[4] = self;
    dispatch_after(v7, (dispatch_queue_t)&_dispatch_main_q, block);

  }
}

- (void)_satisfyAppIntentsURLNavigationPerformerProviderRequestsIfNecessary
{
  id v3;
  uint64_t Log;
  NSObject *v5;
  _BOOL4 v6;
  id v7;
  NSMutableArray *appIntentsURLNavigationRequests;
  int v9;
  id v10;

  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  self->_canSatisfyAppIntentsURLNavigationRequests = 1;
  v3 = -[NSMutableArray count](self->_appIntentsURLNavigationRequests, "count");
  Log = PLAppIntentsGetLog(v3);
  v5 = objc_claimAutoreleasedReturnValue(Log);
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v6)
    {
      v7 = -[NSMutableArray count](self->_appIntentsURLNavigationRequests, "count");
      v9 = 134217984;
      v10 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Perform %lu deferred App Intents URL navigation request(s)", (uint8_t *)&v9, 0xCu);
    }

    v5 = -[NSMutableArray copy](self->_appIntentsURLNavigationRequests, "copy");
    appIntentsURLNavigationRequests = self->_appIntentsURLNavigationRequests;
    self->_appIntentsURLNavigationRequests = 0;

    -[NSObject enumerateObjectsUsingBlock:](v5, "enumerateObjectsUsingBlock:", &stru_10006AE68);
  }
  else if (v6)
  {
    LOWORD(v9) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Ignore deferred App Intents URL navigation for zero requests", (uint8_t *)&v9, 2u);
  }

}

- (void)provideImageForPerson:(id)a3 size:(CGSize)a4 completionHandler:(id)a5
{
  double height;
  double width;
  id v10;
  id v11;
  void *v12;
  double v13;
  double v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;

  height = a4.height;
  width = a4.width;
  v10 = a5;
  v11 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  if (!v11)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PhotosApplication.m"), 1082, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("person"));

    if (v10)
      goto LABEL_3;
LABEL_5:
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PhotosApplication.m"), 1083, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

    goto LABEL_3;
  }
  if (!v10)
    goto LABEL_5;
LABEL_3:
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosApplication photosWindowSceneDelegate](self, "photosWindowSceneDelegate"));
  objc_msgSend(v12, "screenScale");
  v14 = v13;

  v15 = objc_msgSend(objc_alloc((Class)PXPeopleFaceCropFetchOptions), "initWithPerson:targetSize:displayScale:", v11, width, height, v14);
  objc_msgSend(v15, "setDeliveryMode:", 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[PXPeopleFaceCropManager sharedManager](PXPeopleFaceCropManager, "sharedManager"));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000200D8;
  v20[3] = &unk_10006AE90;
  v21 = v10;
  v17 = v10;
  objc_msgSend(v16, "requestFaceCropForOptions:resultHandler:", v15, v20);

}

- (void)performEditRequestWithAdjustments:(id)a3 completionHandler:(id)a4
{
  void (**v7)(id, _QWORD, void *);
  void *v8;
  id v9;
  id v10;
  _QWORD *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  if (v17)
  {
    if (v7)
      goto LABEL_3;
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PhotosApplication.m"), 1097, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("adjustments"));

    if (v7)
      goto LABEL_3;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PhotosApplication.m"), 1098, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

LABEL_3:
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosApplication keyRootViewController](self, "keyRootViewController"));
  if (+[PUPhotoEditPendingEditsRequest canPerformEditsWithRootViewController:](PUPhotoEditPendingEditsRequest, "canPerformEditsWithRootViewController:", v8))
  {
    v9 = objc_msgSend(objc_alloc((Class)PUPhotoEditPendingEditsRequest), "initWithAdjustments:rootViewController:", v17, v8);
    objc_msgSend(v9, "submitWithCompletionHandler:", v7);
  }
  else
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "firstObject"));
    if (!v9)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PhotosApplication.m"), 1112, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("adjustment"));

    }
    v10 = objc_msgSend(v9, "category");
    if (v10 == (id)8)
    {
      v12 = objc_msgSend(v9, "clockwise");
      v11 = &PXAssetActionTypeEditRotateRight;
      if (!v12)
        v11 = &PXAssetActionTypeEditRotateLeft;
    }
    else
    {
      if (v10)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSError px_genericErrorWithDebugDescription:](NSError, "px_genericErrorWithDebugDescription:", CFSTR("Unsupported category: %ld"), v10));
        v7[2](v7, 0, v13);

        goto LABEL_14;
      }
      v11 = &PXAssetActionTypeEditAdjustAutoEnhance;
    }
    -[PhotosApplication _performActionType:completionHandler:](self, "_performActionType:completionHandler:", *v11, v7);
  }
LABEL_14:

}

- (void)copyEditsFromSelectedAssetWithCompletionHandler:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void (*v9)(void);
  _QWORD *v10;

  v10 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosApplication contentViewController](self, "contentViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "window"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_responderForKeyEvents"));

  if (v7)
  {
    while ((objc_opt_respondsToSelector(v7, "copyAdjustmentsSkippingOptions:") & 1) == 0)
    {
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "nextResponder"));

      v7 = (void *)v8;
      if (!v8)
        goto LABEL_4;
    }
    objc_msgSend(v7, "performSelector:withObject:", "copyAdjustmentsSkippingOptions:", 0);
    v9 = (void (*)(void))v10[2];
  }
  else
  {
LABEL_4:
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSError px_genericErrorWithDebugDescription:](NSError, "px_genericErrorWithDebugDescription:", CFSTR("Cannot perform action: CopyEdits")));
    v9 = (void (*)(void))v10[2];
  }
  v9();

}

- (void)pasteEditsOnSelectedAssetsWithCompletionHandler:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosApplication contentViewController](self, "contentViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "window"));
  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_responderForKeyEvents"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "targetForAction:withSender:", "pasteAdjustments:", 0));
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "performSelector:withObject:", "pasteAdjustments:", 0);
    v4[2](v4, 1, 0);
  }
  else
  {
    v10 = objc_claimAutoreleasedReturnValue(+[NSError px_genericErrorWithDebugDescription:](NSError, "px_genericErrorWithDebugDescription:", CFSTR("Cannot perform action: PasteEdits")));
    v4[2](v4, 0, v10);

    v4 = (void (**)(id, uint64_t, _QWORD))v10;
  }

}

- (void)_performActionType:(id)a3 completionHandler:(id)a4
{
  void (**v6)(id, _QWORD, void *);
  id v7;
  void *v8;
  id v9;

  v6 = (void (**)(id, _QWORD, void *))a4;
  v7 = a3;
  -[PhotosApplication invalidateActionManagerProvider](self, "invalidateActionManagerProvider");
  v9 = (id)objc_claimAutoreleasedReturnValue(-[PhotosApplication assetActionManager](self, "assetActionManager"));
  if (objc_msgSend(v9, "canPerformActionType:", v7))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "actionPerformerForActionType:", v7));

    objc_msgSend(v8, "performActionWithCompletionHandler:", v6);
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSError px_genericErrorWithDebugDescription:](NSError, "px_genericErrorWithDebugDescription:", CFSTR("Cannot perform action: \"%@\"), v7));

    v6[2](v6, 0, v8);
  }

}

- (CAMNebulaDaemonProxyManager)_nebulaDaemonProxyManager
{
  return self->__nebulaDaemonProxyManager;
}

- (void)_setNebulaDaemonProxyManager:(id)a3
{
  objc_storeStrong((id *)&self->__nebulaDaemonProxyManager, a3);
}

- (PXAlertController)iPhotoMigrationAlertController
{
  return self->_iPhotoMigrationAlertController;
}

- (void)setIPhotoMigrationAlertController:(id)a3
{
  objc_storeStrong((id *)&self->_iPhotoMigrationAlertController, a3);
}

- (BOOL)hiddenAlbumIsVisible
{
  return self->_hiddenAlbumIsVisible;
}

- (PXUndoActionsInvalidator)undoActionsInvalidator
{
  return self->_undoActionsInvalidator;
}

- (void)setUndoActionsInvalidator:(id)a3
{
  objc_storeStrong((id *)&self->_undoActionsInvalidator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_undoActionsInvalidator, 0);
  objc_storeStrong((id *)&self->_iPhotoMigrationAlertController, 0);
  objc_storeStrong((id *)&self->__nebulaDaemonProxyManager, 0);
  objc_storeStrong((id *)&self->_appIntentsURLNavigationRequests, 0);
  objc_storeStrong((id *)&self->_stateCaptureHandler, 0);
  objc_destroyWeak((id *)&self->_actionManagerProvider);
  objc_storeStrong((id *)&self->_importDeviceQueue, 0);
  objc_storeStrong((id *)&self->_importViewController, 0);
}

+ (void)_donateTipsAppPhotosSignals
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[PHPhotoLibrary px_systemPhotoLibrary](PHPhotoLibrary, "px_systemPhotoLibrary"));
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "librarySpecificFetchOptions"));

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[PHCollection fetchTopLevelUserCollectionsWithOptions:](PHCollection, "fetchTopLevelUserCollectionsWithOptions:", v7));
  v4 = objc_msgSend(v3, "count");

  if (v4)
    v5 = 2;
  else
    v5 = 3;
  if (PLIsCloudPhotoLibraryEnabledForCurrentUser(+[PXTipsAppDonation donateSignalForEvent:](PXTipsAppDonation, "donateSignalForEvent:", v5)))v6 = 4;
  else
    v6 = 5;
  +[PXTipsAppDonation donateSignalForEvent:](PXTipsAppDonation, "donateSignalForEvent:", v6);

}

- (void)buildMenuWithBuilder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  id v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  void *v89;
  uint64_t v90;
  void *v91;
  uint64_t v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  uint64_t v98;
  void *v99;
  uint64_t v100;
  void *v101;
  void *v102;
  uint64_t v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  uint64_t v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  _QWORD v149[4];
  Block_layout *v150;
  _QWORD v151[4];
  Block_layout *v152;
  _QWORD v153[2];
  void *v154;
  void *v155;
  _QWORD v156[14];
  _QWORD v157[3];
  void *v158;
  _QWORD v159[4];
  void *v160;
  _QWORD v161[2];
  _QWORD v162[4];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "system"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenuSystem mainSystem](UIMenuSystem, "mainSystem"));

  if (v4 == v5)
  {
    v6 = PXLocalizedString(CFSTR("CREATE_NEW_ALBUM"));
    v146 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v144 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v146, 0, "newAlbum:", CFSTR("n"), 0x100000, 0));
    v162[0] = v144;
    v7 = PXLocalizedString(CFSTR("CREATE_NEW_SHARED_ALBUM"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v8, 0, "newSharedAlbum:", CFSTR("n"), 1310720, 0));
    v162[1] = v9;
    v10 = PXLocalizedString(CFSTR("CREATE_NEW_SMART_ALBUM"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v11, 0, "newSmartAlbum:", CFSTR("n"), 1572864, 0));
    v162[2] = v12;
    v13 = PXLocalizedString(CFSTR("CREATE_NEW_FOLDER"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v14, 0, "newFolder:", CFSTR("n"), 1179648, 0));
    v162[3] = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v162, 4));
    v17 = 1;
    v18 = objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_10006E450, 0, 0, 1, v16));

    v147 = (void *)v18;
    objc_msgSend(v3, "insertChildMenu:atEndOfMenuForIdentifier:", v18, UIMenuFile);
    v151[0] = _NSConcreteStackBlock;
    v151[1] = 3221225472;
    v151[2] = sub_100023808;
    v151[3] = &unk_10006AF40;
    v152 = &stru_10006AEF8;
    objc_msgSend(v3, "replaceChildrenOfMenuForIdentifier:fromChildrenBlock:", UIMenuStandardEdit, v151);
    v148 = v3;
    v149[0] = _NSConcreteStackBlock;
    v149[1] = 3221225472;
    v149[2] = sub_1000238CC;
    v149[3] = &unk_10006AF40;
    v150 = &stru_10006AEF8;
    objc_msgSend(v3, "replaceChildrenOfMenuForIdentifier:fromChildrenBlock:", UIMenuFind, v149);
    v19 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 9);
    do
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v17));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "stringValue"));
      v22 = PULocalizedString(CFSTR("MENU_ITEM_TITLE_SEGMENT"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v23, v21));

      v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v24, 0, "navigateToSegment:", v21, 0x100000, v20));
      objc_msgSend(v19, "addObject:", v25);

      ++v17;
    }
    while (v17 != 10);
    v26 = 1;
    v145 = v19;
    v143 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_10006E450, 0, 0, 1, v19));
    objc_msgSend(v3, "insertChildMenu:atEndOfMenuForIdentifier:");
    v27 = PULocalizedString(CFSTR("MENU_ITEM_TITLE_PREVIOUS_TAB"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v28, 0, "navigateToPreviousTab:", CFSTR("["), 1179648, 0));
    v161[0] = v29;
    v30 = PULocalizedString(CFSTR("MENU_ITEM_TITLE_NEXT_TAB"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v31, 0, "navigateToNextTab:", CFSTR("]"), 1179648, 0));
    v161[1] = v32;
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v161, 2));
    v34 = objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_10006E450, 0, 0, 1, v33));

    v142 = (void *)v34;
    objc_msgSend(v3, "insertChildMenu:atEndOfMenuForIdentifier:", v34, UIMenuView);
    v35 = PULocalizedString(CFSTR("MENU_ITEM_TITLE_TOGGLE_VIEW_MODE"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v36, 0, "toggleViewMode:", CFSTR("t"), 0x80000, 0));
    v160 = v37;
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v160, 1));
    v39 = objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_10006E450, 0, 0, 1, v38));

    v141 = (void *)v39;
    objc_msgSend(v3, "insertChildMenu:atEndOfMenuForIdentifier:", v39, UIMenuView);
    v40 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 9);
    do
    {
      v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v26));
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "stringValue"));
      v43 = PULocalizedString(CFSTR("MENU_ITEM_TITLE_FILTER"));
      v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
      v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v44, v42));

      v46 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v45, 0, "toggleFilter:", v42, 1572864, v41));
      objc_msgSend(v40, "addObject:", v46);

      ++v26;
    }
    while (v26 != 5);
    v140 = v40;
    v139 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_10006E450, 0, 0, 1, v40));
    objc_msgSend(v3, "insertChildMenu:atEndOfMenuForIdentifier:");
    objc_msgSend(v3, "removeMenuForIdentifier:", UIMenuTextSize);
    v47 = PXLocalizedString(CFSTR("PXLibraryAllPhotosZoomIn"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(v47);
    v49 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v48, 0, "zoomIn:", CFSTR("+"), 0x100000, &__kCFBooleanTrue));
    v159[0] = v49;
    v50 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", CFSTR("="), 0x100000, "zoomIn:"));
    v159[1] = v50;
    v51 = PXLocalizedString(CFSTR("PXLibraryAllPhotosZoomOut"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(v51);
    v53 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v52, 0, "zoomOut:", CFSTR("-"), 0x100000, &__kCFBooleanTrue));
    v159[2] = v53;
    v54 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", CFSTR("_"), 0x100000, "zoomOut:"));
    v159[3] = v54;
    v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v159, 4));
    v56 = objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_10006E450, 0, 0, 1, v55));

    v138 = (void *)v56;
    if ((PLHasInternalUI(objc_msgSend(v3, "insertChildMenu:atEndOfMenuForIdentifier:", v56, UIMenuView)) & 1) != 0
      && PLHasInternalDiagnostics())
    {
      v57 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", CFSTR("Internal Settings"), 0, "showInternalSettings:", CFSTR(","), 1572864, 0));
      v158 = v57;
      v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v158, 1));
      v59 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_10006E450, 0, 0, 1, v58));

      objc_msgSend(v3, "insertChildMenu:atEndOfMenuForIdentifier:", v59, UIMenuView);
    }
    v60 = PXMenuImage;
    v61 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "menuForIdentifier:", PXMenuImage));
    if (!v61)
    {
      v62 = PULocalizedString(CFSTR("MENU_TITLE_IMAGE"));
      v63 = (void *)objc_claimAutoreleasedReturnValue(v62);
      v61 = objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", v63, 0, v60, 1, &__NSArray0__struct));

      objc_msgSend(v3, "insertSiblingMenu:afterMenuForIdentifier:", v61, UIMenuView);
    }
    v137 = (void *)v61;
    v64 = v60;
    v135 = v60;
    v65 = PULocalizedString(CFSTR("MENU_ITEM_TITLE_ROTATE_COUNTERCLOCKWISE"));
    v66 = (void *)objc_claimAutoreleasedReturnValue(v65);
    v67 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v66, 0, "rotateAssetsCounterclockwise:", CFSTR("r"), 0x100000, 0));
    v157[0] = v67;
    v68 = PULocalizedString(CFSTR("MENU_ITEM_TITLE_ROTATE_CLOCKWISE"));
    v69 = (void *)objc_claimAutoreleasedReturnValue(v68);
    v70 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v69, 0, "rotateAssetsClockwise:", CFSTR("r"), 1572864, 0));
    v157[1] = v70;
    v71 = PULocalizedString(CFSTR("MENU_ITEM_TITLE_AUTO_ENHANCE"));
    v72 = (void *)objc_claimAutoreleasedReturnValue(v71);
    v73 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v72, 0, "autoEnhanceAssets:", CFSTR("e"), 0x100000, 0));
    v157[2] = v73;
    v74 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v157, 3));
    v136 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_10006E450, 0, 0, 1, v74));

    objc_msgSend(v148, "insertChildMenu:atEndOfMenuForIdentifier:", v136, v64);
    objc_msgSend(v148, "removeMenuForIdentifier:", UIMenuTextStyle);
    v75 = PXLocalizedString(CFSTR("PLAY_ASSET_SHORTCUT"));
    v134 = (void *)objc_claimAutoreleasedReturnValue(v75);
    v133 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v134, 0, "togglePlayback:", CFSTR(" "), 0x80000, 0));
    v156[0] = v133;
    v76 = PXLocalizedString(CFSTR("SHOW_INFO_SHORTCUT"));
    v132 = (void *)objc_claimAutoreleasedReturnValue(v76);
    v131 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v132, 0, "toggleInspector:", CFSTR("i"), 0x100000, 0));
    v156[1] = v131;
    v77 = PXLocalizedString(CFSTR("SHARE_ASSET_SHORTCUT"));
    v130 = (void *)objc_claimAutoreleasedReturnValue(v77);
    v129 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v130, 0, "shareAssets:", CFSTR("s"), 0x100000, 0));
    v156[2] = v129;
    v78 = PXLocalizedString(CFSTR("ADD_TO_ALBUM_FROM_GRID_SHORTCUT"));
    v128 = (void *)objc_claimAutoreleasedReturnValue(v78);
    v127 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v128, 0, "addAssetsToAlbum:", CFSTR("a"), 1179648, 0));
    v156[3] = v127;
    v126 = (void *)objc_claimAutoreleasedReturnValue(+[PXAddAssetsToLastUsedAssetCollectionAction placeholderCommandTitle](PXAddAssetsToLastUsedAssetCollectionAction, "placeholderCommandTitle"));
    v125 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v126, 0, "addAssetsToLastUsedAlbum:", CFSTR("a"), 1310720, 0));
    v156[4] = v125;
    v79 = PXLocalizedString(CFSTR("HIDE_ASSET_SHORTCUT"));
    v124 = (void *)objc_claimAutoreleasedReturnValue(v79);
    v123 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v124, 0, "hideAssets:", CFSTR("l"), 0x100000, 0));
    v156[5] = v123;
    v80 = PXLocalizedString(CFSTR("MAKE_KEY_PHOTO_SHORTCUT"));
    v122 = (void *)objc_claimAutoreleasedReturnValue(v80);
    v121 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v122, 0, "makeKeyPhoto:", CFSTR("k"), 1179648, 0));
    v156[6] = v121;
    v81 = PXLocalizedString(CFSTR("DUPLICATE_ASSET_SHORTCUT"));
    v120 = (void *)objc_claimAutoreleasedReturnValue(v81);
    v119 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v120, 0, "duplicateAssets:", CFSTR("d"), 0x100000, 0));
    v156[7] = v119;
    v82 = PULocalizedString(CFSTR("MENU_ITEM_TITLE_PRINT"));
    v118 = (void *)objc_claimAutoreleasedReturnValue(v82);
    v117 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v118, 0, "printAssets:", CFSTR("p"), 0x100000, 0));
    v156[8] = v117;
    v83 = PXLocalizedString(CFSTR("TRASH_ASSET_SHORTCUT"));
    v114 = (void *)objc_claimAutoreleasedReturnValue(v83);
    v84 = PXLocalizedString(CFSTR("TRASH_ASSET_SHORTCUT"));
    v116 = (void *)objc_claimAutoreleasedReturnValue(v84);
    v115 = (void *)objc_claimAutoreleasedReturnValue(+[UICommandAlternate alternateWithTitle:action:modifierFlags:](UICommandAlternate, "alternateWithTitle:action:modifierFlags:", v116, "trashAssetsWithoutConfirmation:", 0x100000));
    v155 = v115;
    v113 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v155, 1));
    v112 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:alternates:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:alternates:", v114, 0, "trashAssets:", CFSTR("\b"), 0, 0, v113));
    v156[9] = v112;
    v85 = PXLocalizedString(CFSTR("FAVORITE_ASSET_SHORTCUT"));
    v111 = (void *)objc_claimAutoreleasedReturnValue(v85);
    v110 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v111, 0, "favoriteAssets:", CFSTR("."), 0, 0));
    v156[10] = v110;
    v86 = PULocalizedString(CFSTR("MENU_ITEM_TITLE_COPY_ADJUSTMENTS"));
    v109 = (void *)objc_claimAutoreleasedReturnValue(v86);
    v108 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v109, 0, "copyAdjustments:", CFSTR("c"), 1179648, 0));
    v156[11] = v108;
    v87 = PULocalizedString(CFSTR("MENU_ITEM_TITLE_PASTE_ADJUSTMENTS"));
    v88 = (void *)objc_claimAutoreleasedReturnValue(v87);
    v89 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v88, 0, "pasteAdjustments:", CFSTR("v"), 1179648, 0));
    v156[12] = v89;
    v90 = PXLocalizedString(CFSTR("MERGE_DUPLICATES_SHORTCUT"));
    v91 = (void *)objc_claimAutoreleasedReturnValue(v90);
    v3 = v148;
    v92 = PXLocalizedString(CFSTR("MERGE_DUPLICATES_SHORTCUT"));
    v93 = (void *)objc_claimAutoreleasedReturnValue(v92);
    v94 = (void *)objc_claimAutoreleasedReturnValue(+[UICommandAlternate alternateWithTitle:action:modifierFlags:](UICommandAlternate, "alternateWithTitle:action:modifierFlags:", v93, "mergeDuplicatesWithoutConfirmation:", 1835008));
    v154 = v94;
    v95 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v154, 1));
    v96 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:alternates:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:alternates:", v91, 0, "mergeDuplicates:", CFSTR("m"), 1310720, 0, v95));
    v156[13] = v96;
    v97 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v156, 14));
    v98 = objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_10006E450, 0, 0, 1, v97));

    v99 = (void *)v98;
    objc_msgSend(v148, "insertChildMenu:atEndOfMenuForIdentifier:", v98, v135);
    v100 = PULocalizedString(CFSTR("MENU_ITEM_TITLE_OPEN_VIEWER"));
    v101 = (void *)objc_claimAutoreleasedReturnValue(v100);
    v102 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v101, 0, "toggleViewer:", CFSTR(" "), 0, 0));
    v153[0] = v102;
    v103 = PULocalizedString(CFSTR("MENU_ITEM_TITLE_OPEN_EDITOR"));
    v104 = (void *)objc_claimAutoreleasedReturnValue(v103);
    v105 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v104, 0, "toggleEditor:", CFSTR("\r"), 0, 0));
    v153[1] = v105;
    v106 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v153, 2));
    v107 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_10006E450, 0, 0, 1, v106));

    objc_msgSend(v148, "insertChildMenu:atEndOfMenuForIdentifier:", v107, v135);
  }

}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  unsigned __int8 v11;
  BOOL v12;
  _QWORD *v13;
  objc_super v15;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosApplication assetActionManager](self, "assetActionManager"));
  v8 = v7;
  if ("undo:" == a3)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosApplication fallbackUndoManager](self, "fallbackUndoManager"));
    v11 = objc_msgSend(v10, "canUndo");
LABEL_21:
    v12 = v11;

    goto LABEL_44;
  }
  if ("redo:" == a3)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosApplication fallbackUndoManager](self, "fallbackUndoManager"));
    v11 = objc_msgSend(v10, "canRedo");
    goto LABEL_21;
  }
  if ("copy:" == a3)
  {
    v13 = &PXAssetActionTypeCopy;
    goto LABEL_42;
  }
  if ("printAssets:" == a3)
  {
    v13 = &PXAssetActionTypePrint;
    goto LABEL_42;
  }
  if ("makeKeyPhoto:" == a3)
  {
    if ((objc_msgSend(v7, "canPerformActionType:", PXAssetActionTypeAlbumMakeKeyPhoto) & 1) == 0
      && (objc_msgSend(v8, "canPerformActionType:", PXAssetActionTypePersonMakeKeyPhoto) & 1) == 0)
    {
      v13 = &PXAssetActionTypeStoryMakeKeyPhoto;
      goto LABEL_42;
    }
  }
  else
  {
    if ("shareAssets:" == a3)
    {
      v13 = &PXAssetActionTypeShare;
      goto LABEL_42;
    }
    if ("addAssetsToAlbum:" == a3)
    {
      v13 = &PXAssetActionTypeAddToAlbum;
      goto LABEL_42;
    }
    if ("addAssetsToLastUsedAlbum:" == a3)
    {
      v13 = &PXAssetActionTypeAddToLastUsedAlbum;
      goto LABEL_42;
    }
    if ("duplicateAssets:" == a3)
    {
      v13 = &PXAssetActionTypeDuplicate;
      goto LABEL_42;
    }
    if ("hideAssets:" == a3)
    {
      v13 = &PXAssetActionTypeHide;
      goto LABEL_42;
    }
    if ("favoriteAssets:" == a3)
    {
      v13 = &PXAssetActionTypeToggleFavorite;
      goto LABEL_42;
    }
    if ("trashAssets:" != a3)
    {
      if ("copyAdjustments:" == a3)
      {
        v13 = &PXAssetActionTypeCopyAdjustments;
      }
      else if ("copyAdjustmentsSkippingOptions:" == a3)
      {
        v13 = &PXAssetActionTypeCopyAdjustmentsSkippingOptions;
      }
      else if ("pasteAdjustments:" == a3)
      {
        v13 = &PXAssetActionTypePasteAdjustments;
      }
      else if ("revertAdjustments:" == a3)
      {
        v13 = &PXAssetActionTypeRevertAdjustments;
      }
      else
      {
        if ("mergeDuplicates:" != a3)
        {
          v15.receiver = self;
          v15.super_class = (Class)PhotosApplication;
          v9 = -[PhotosApplication canPerformAction:withSender:](&v15, "canPerformAction:withSender:", a3, v6);
LABEL_43:
          v12 = v9;
          goto LABEL_44;
        }
        v13 = &PXAssetActionTypeMergeDuplicates;
      }
LABEL_42:
      v9 = objc_msgSend(v8, "canPerformActionType:", *v13);
      goto LABEL_43;
    }
    if ((objc_msgSend(v7, "canPerformActionType:", PXAssetActionTypeRemove) & 1) == 0
      && (objc_msgSend(v8, "canPerformActionType:", PXAssetActionTypeTrash) & 1) == 0)
    {
      v13 = &PXAssetActionTypeDelete;
      goto LABEL_42;
    }
  }
  v12 = 1;
LABEL_44:

  return v12;
}

- (id)targetForAction:(SEL)a3 withSender:(id)a4
{
  id v7;
  void *v8;
  objc_super v10;

  if ("newAlbum:" == a3 || "newSharedAlbum:" == a3 || "newSmartAlbum:" == a3 || "newFolder:" == a3)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosApplication keyCollectionActionReceiver](self, "keyCollectionActionReceiver"));
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)PhotosApplication;
    v7 = -[PhotosApplication targetForAction:withSender:](&v10, "targetForAction:withSender:");
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  }
  return v8;
}

- (void)validateCommand:(id)a3
{
  void *v4;
  void *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a3;
  if (objc_msgSend(v10, "action") == "find:")
  {
    v7 = PXLocalizedString(CFSTR("NAVIGATE_TO_AND_START_SEARCH"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(v7);
    objc_msgSend(v10, "setDiscoverabilityTitle:", v5);
LABEL_15:

    goto LABEL_16;
  }
  if (objc_msgSend(v10, "action") == "undo:")
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosApplication fallbackUndoManager](self, "fallbackUndoManager"));
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "undoMenuItemTitle"));
LABEL_14:
    v9 = (void *)v8;
    objc_msgSend(v10, "setDiscoverabilityTitle:", v8);

    goto LABEL_15;
  }
  if (objc_msgSend(v10, "action") == "redo:")
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosApplication fallbackUndoManager](self, "fallbackUndoManager"));
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "redoMenuItemTitle"));
    goto LABEL_14;
  }
  if (objc_msgSend(v10, "action") == "hideAssets:")
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosApplication assetActionManager](self, "assetActionManager"));
    v5 = v4;
    v6 = &PXAssetActionTypeHide;
    goto LABEL_13;
  }
  if (objc_msgSend(v10, "action") == "favoriteAssets:")
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosApplication assetActionManager](self, "assetActionManager"));
    v5 = v4;
    v6 = &PXAssetActionTypeToggleFavorite;
    goto LABEL_13;
  }
  if (objc_msgSend(v10, "action") == "addAssetsToLastUsedAlbum:")
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosApplication assetActionManager](self, "assetActionManager"));
    v5 = v4;
    v6 = &PXAssetActionTypeAddToLastUsedAlbum;
LABEL_13:
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedTitleForActionType:useCase:", *v6, 1));
    goto LABEL_14;
  }
LABEL_16:

}

- (void)find:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = objc_msgSend(objc_alloc((Class)PXProgrammaticNavigationDestination), "initWithType:revealMode:", 14, 1);
  v4 = objc_msgSend(objc_alloc((Class)PXProgrammaticNavigationRequest), "initWithDestination:options:completionHandler:", v6, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosApplication keyRootViewController](self, "keyRootViewController"));
  PXProgrammaticNavigationRequestExecute(v4, v5);

}

- (void)undo:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[PhotosApplication fallbackUndoManager](self, "fallbackUndoManager", a3));
  objc_msgSend(v3, "undo");

}

- (void)redo:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[PhotosApplication fallbackUndoManager](self, "fallbackUndoManager", a3));
  objc_msgSend(v3, "redo");

}

- (void)copy:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosApplication assetActionManager](self, "assetActionManager", a3));
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "actionPerformerForActionType:", PXAssetActionTypeCopy));

  objc_msgSend(v4, "performActionWithCompletionHandler:", 0);
}

- (void)printAssets:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosApplication assetActionManager](self, "assetActionManager", a3));
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "actionPerformerForActionType:", PXAssetActionTypePrint));

  objc_msgSend(v4, "performActionWithCompletionHandler:", 0);
}

- (void)shareAssets:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosApplication assetActionManager](self, "assetActionManager", a3));
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "actionPerformerForActionType:", PXAssetActionTypeShare));

  objc_msgSend(v4, "performActionWithCompletionHandler:", 0);
}

- (void)addAssetsToAlbum:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosApplication assetActionManager](self, "assetActionManager", a3));
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "actionPerformerForActionType:", PXAssetActionTypeAddToAlbum));

  objc_msgSend(v4, "performActionWithCompletionHandler:", 0);
}

- (void)addAssetsToLastUsedAlbum:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosApplication assetActionManager](self, "assetActionManager", a3));
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "actionPerformerForActionType:", PXAssetActionTypeAddToLastUsedAlbum));

  objc_msgSend(v4, "performActionWithCompletionHandler:", 0);
}

- (void)duplicateAssets:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosApplication assetActionManager](self, "assetActionManager", a3));
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "actionPerformerForActionType:", PXAssetActionTypeDuplicate));

  objc_msgSend(v4, "performActionWithCompletionHandler:", 0);
}

- (void)hideAssets:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosApplication assetActionManager](self, "assetActionManager", a3));
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "actionPerformerForActionType:", PXAssetActionTypeHide));

  objc_msgSend(v4, "performActionWithCompletionHandler:", 0);
}

- (void)favoriteAssets:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosApplication assetActionManager](self, "assetActionManager", a3));
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "actionPerformerForActionType:", PXAssetActionTypeToggleFavorite));

  objc_msgSend(v4, "performActionWithCompletionHandler:", 0);
}

- (void)makeKeyPhoto:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosApplication assetActionManager](self, "assetActionManager", a3));
  v4 = PXAssetActionTypeAlbumMakeKeyPhoto;
  v6 = v3;
  if ((objc_msgSend(v3, "canPerformActionType:", PXAssetActionTypeAlbumMakeKeyPhoto) & 1) != 0
    || (v4 = PXAssetActionTypePersonMakeKeyPhoto,
        (objc_msgSend(v6, "canPerformActionType:", PXAssetActionTypePersonMakeKeyPhoto) & 1) != 0)
    || (v4 = PXAssetActionTypeStoryMakeKeyPhoto,
        objc_msgSend(v6, "canPerformActionType:", PXAssetActionTypeStoryMakeKeyPhoto)))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "actionPerformerForActionType:", v4));
    objc_msgSend(v5, "performActionWithCompletionHandler:", 0);

  }
}

- (void)trashAssets:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosApplication assetActionManager](self, "assetActionManager", a3));
  v4 = PXAssetActionTypeRemove;
  v6 = v3;
  if ((objc_msgSend(v3, "canPerformActionType:", PXAssetActionTypeRemove) & 1) != 0
    || (v4 = PXAssetActionTypeTrash,
        (objc_msgSend(v6, "canPerformActionType:", PXAssetActionTypeTrash) & 1) != 0)
    || (v4 = PXAssetActionTypeDelete, objc_msgSend(v6, "canPerformActionType:", PXAssetActionTypeDelete)))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "actionPerformerForActionType:", v4));
    objc_msgSend(v5, "performActionWithCompletionHandler:", 0);

  }
}

- (void)trashAssetsWithoutConfirmation:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosApplication assetActionManager](self, "assetActionManager", a3));
  v4 = PXAssetActionTypeTrashNoConfirm;
  v6 = v3;
  if ((objc_msgSend(v3, "canPerformActionType:", PXAssetActionTypeTrashNoConfirm) & 1) != 0
    || (v4 = PXAssetActionTypeDelete, objc_msgSend(v6, "canPerformActionType:", PXAssetActionTypeDelete)))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "actionPerformerForActionType:", v4));
    objc_msgSend(v5, "performActionWithCompletionHandler:", 0);

  }
}

- (void)mergeDuplicates:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosApplication assetActionManager](self, "assetActionManager", a3));
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "actionPerformerForActionType:", PXAssetActionTypeMergeDuplicates));

  objc_msgSend(v4, "performActionWithCompletionHandler:", 0);
}

- (void)mergeDuplicatesWithoutConfirmation:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosApplication assetActionManager](self, "assetActionManager", a3));
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "actionPerformerForActionType:", PXAssetActionTypeMergeDuplicatesWithoutConfirmation));

  objc_msgSend(v4, "performActionWithCompletionHandler:", 0);
}

- (void)copyAdjustments:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosApplication assetActionManager](self, "assetActionManager", a3));
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "actionPerformerForActionType:", PXAssetActionTypeCopyAdjustments));

  objc_msgSend(v4, "performActionWithCompletionHandler:", 0);
}

- (void)copyAdjustmentsSkippingOptions:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosApplication assetActionManager](self, "assetActionManager", a3));
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "actionPerformerForActionType:", PXAssetActionTypeCopyAdjustmentsSkippingOptions));

  objc_msgSend(v4, "performActionWithCompletionHandler:", 0);
}

- (void)pasteAdjustments:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosApplication assetActionManager](self, "assetActionManager", a3));
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "actionPerformerForActionType:", PXAssetActionTypePasteAdjustments));

  objc_msgSend(v4, "performActionWithCompletionHandler:", 0);
}

- (void)revertAdjustments:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosApplication assetActionManager](self, "assetActionManager", a3));
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "actionPerformerForActionType:", PXAssetActionTypeRevertAdjustments));

  objc_msgSend(v4, "performActionWithCompletionHandler:", 0);
}

- (void)showInternalSettings:(id)a3
{
  +[PURootSettings presentSettingsController](PURootSettings, "presentSettingsController", a3);
}

@end
