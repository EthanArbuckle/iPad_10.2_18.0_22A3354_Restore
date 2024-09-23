@implementation CAMApplicationDelegate

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  CAMSubsystems *v9;
  id v10;
  CFAbsoluteTime Current;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  id v23;
  CAMSubsystems *v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  uint64_t v28;
  CAMSecureWindow *v29;
  CAMSecureWindow *v30;
  id v31;
  char v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  BOOL v40;
  CAMApplicationDelegate *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  void (*v46)(uint64_t, void *);
  void *v47;
  CAMApplicationDelegate *v48;
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _QWORD v54[5];
  uint8_t buf[16];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  CAMSignpostWithIDAndArgs(2, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
  PLDebugEnableCoreDataMultithreadedAsserts();
  v8 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB760000, v8, OS_LOG_TYPE_DEFAULT, "Camera launched.", buf, 2u);
  }

  v9 = -[CAMSubsystems initWithLaunchOptions:]([CAMSubsystems alloc], "initWithLaunchOptions:", v7);
  -[CAMApplicationDelegate setSubsystems:](self, "setSubsystems:", v9);
  v10 = v6;
  objc_msgSend(v10, "_configureExtendedLaunchTestIfNeeded");
  Current = CFAbsoluteTimeGetCurrent();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *MEMORY[0x1E0C8A1D8];
  objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v54[0] = MEMORY[0x1E0C809B0];
  v54[1] = 3221225472;
  v54[2] = __68__CAMApplicationDelegate_application_didFinishLaunchingWithOptions___block_invoke;
  v54[3] = &__block_descriptor_40_e24_v16__0__NSNotification_8l;
  *(CFAbsoluteTime *)&v54[4] = Current;
  v16 = (id)objc_msgSend(v12, "addObserverForName:object:queue:usingBlock:", v13, 0, v14, v54);

  -[CAMApplicationDelegate viewfinderViewController](self, "viewfinderViewController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  objc_msgSend(v10, "connectedScenes");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
  if (v20)
  {
    v21 = v20;
    v42 = self;
    v43 = v17;
    v22 = v10;
    v23 = v7;
    v24 = v9;
    v25 = *(_QWORD *)v51;
    while (2)
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v51 != v25)
          objc_enumerationMutation(v19);
        v27 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v27, "screen");
          v28 = objc_claimAutoreleasedReturnValue();

          v18 = (void *)v28;
          goto LABEL_13;
        }
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
      if (v21)
        continue;
      break;
    }
LABEL_13:
    v9 = v24;
    v7 = v23;
    v10 = v22;
    self = v42;
    v15 = MEMORY[0x1E0C809B0];
  }

  v29 = [CAMSecureWindow alloc];
  objc_msgSend(v18, "bounds");
  v30 = -[CAMSecureWindow initWithFrame:](v29, "initWithFrame:");
  -[CAMSecureWindow setRootViewController:](v30, "setRootViewController:", v17);
  -[CAMSecureWindow makeKeyAndVisible](v30, "makeKeyAndVisible");
  -[CAMApplicationDelegate setWindow:](self, "setWindow:", v30);
  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v31 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v31, "shouldEnableUserNotifications"))
  {
    v32 = objc_msgSend((id)*MEMORY[0x1E0DC4730], "launchedToTest");

    if ((v32 & 1) != 0)
      goto LABEL_18;
    objc_msgSend(MEMORY[0x1E0CEC7A0], "currentNotificationCenter");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setDelegate:", self);
    v44 = v15;
    v45 = 3221225472;
    v46 = __68__CAMApplicationDelegate_application_didFinishLaunchingWithOptions___block_invoke_145;
    v47 = &unk_1EA32FDD0;
    v48 = self;
    v49 = v33;
    v31 = v33;
    objc_msgSend(v31, "getNotificationSettingsWithCompletionHandler:", &v44);

  }
LABEL_18:
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0DC47C0], v42, v43, v44, v45, v46, v47, v48);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (v34)
  {
    -[CAMApplicationDelegate viewfinderViewController](self, "viewfinderViewController");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "generateAnalyticsForLaunchWithShortCutItem:", v34);

  }
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0DC47D0]);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v36;
  if (v36)
  {
    objc_msgSend(v36, "configurationRequest");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (v38)
    {
      -[CAMApplicationDelegate viewfinderViewController](self, "viewfinderViewController");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "generateAnalyticsForLaunchWithURLConfigurationRequest:", v38);

    }
  }
  CAMSignpostWithIDAndArgs(3, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
  v40 = -[CAMSubsystems isConfiguredFromLaunchOptions](v9, "isConfiguredFromLaunchOptions");

  return !v40;
}

void __68__CAMApplicationDelegate_application_didFinishLaunchingWithOptions___block_invoke(uint64_t a1)
{
  NSObject *v2;
  CFAbsoluteTime v3;
  int v4;
  CFAbsoluteTime v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 32);
    v4 = 134217984;
    v5 = v3;
    _os_log_impl(&dword_1DB760000, v2, OS_LOG_TYPE_DEFAULT, "Preview started %f seconds after launch", (uint8_t *)&v4, 0xCu);
  }

}

- (CAMTimelapseController)timelapseController
{
  return -[CAMSubsystems timelapseController](self->_subsystems, "timelapseController");
}

- (CUCaptureController)captureController
{
  return -[CAMSubsystems captureController](self->_subsystems, "captureController");
}

- (CAMPersistenceController)persistenceController
{
  return -[CAMSubsystems persistenceController](self->_subsystems, "persistenceController");
}

- (CAMViewfinderViewController)viewfinderViewController
{
  return -[CAMSubsystems viewfinderViewController](self->_subsystems, "viewfinderViewController");
}

- (void)setWindow:(id)a3
{
  objc_storeStrong((id *)&self->_window, a3);
}

- (void)applicationDidEnterBackground:(id)a3
{
  int v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  +[CAMUserPreferences preferences](CAMUserPreferences, "preferences", a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v9, "forceEnableQRBanners");
  objc_msgSend(v9, "setForceEnableQRBanners:", 0);
  if (v4 && (objc_msgSend(v9, "QRBannersEnabledInSettings") & 1) == 0)
  {
    -[CAMApplicationDelegate viewfinderViewController](self, "viewfinderViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMApplicationDelegate viewfinderViewController](self, "viewfinderViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "currentCaptureMode");
    -[CAMApplicationDelegate viewfinderViewController](self, "viewfinderViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "changeToMode:device:", v7, objc_msgSend(v8, "currentCaptureDevice"));

  }
}

- (void)prepareForDefaultImageSnapshotForScreen:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CAMApplicationDelegate viewfinderViewController](self, "viewfinderViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "prepareForDefaultImageSnapshotForScreen:", v4);

}

- (CAMCameraRollController)cameraRollController
{
  return -[CAMSubsystems cameraRollController](self->_subsystems, "cameraRollController");
}

- (CAMMotionController)motionController
{
  return -[CAMSubsystems motionController](self->_subsystems, "motionController");
}

- (CAMLocationController)locationController
{
  return -[CAMSubsystems locationController](self->_subsystems, "locationController");
}

- (CAMPowerController)powerController
{
  return -[CAMSubsystems powerController](self->_subsystems, "powerController");
}

- (CAMBurstController)burstController
{
  return -[CAMSubsystems burstController](self->_subsystems, "burstController");
}

- (CAMKeepAliveController)keepAliveController
{
  return -[CAMSubsystems keepAliveController](self->_subsystems, "keepAliveController");
}

- (CAMProtectionController)protectionController
{
  return -[CAMSubsystems protectionController](self->_subsystems, "protectionController");
}

- (CAMRemoteShutterController)remoteShutterController
{
  return -[CAMSubsystems remoteShutterController](self->_subsystems, "remoteShutterController");
}

- (CAMLibrarySelectionController)librarySelectionController
{
  return -[CAMSubsystems librarySelectionController](self->_subsystems, "librarySelectionController");
}

- (CAMNebulaDaemonProxyManager)nebulaDaemonProxyManager
{
  return -[CAMSubsystems nebulaDaemonProxyManager](self->_subsystems, "nebulaDaemonProxyManager");
}

- (CAMIrisVideoController)irisVideoController
{
  return -[CAMSubsystems irisVideoController](self->_subsystems, "irisVideoController");
}

void __68__CAMApplicationDelegate_application_didFinishLaunchingWithOptions___block_invoke_145(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD v4[5];
  id v5;

  if (!objc_msgSend(a2, "authorizationStatus"))
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __68__CAMApplicationDelegate_application_didFinishLaunchingWithOptions___block_invoke_2;
    v4[3] = &unk_1EA328A40;
    v3 = *(void **)(a1 + 40);
    v4[4] = *(_QWORD *)(a1 + 32);
    v5 = v3;
    cam_perform_on_main_asap(v4);

  }
}

void __68__CAMApplicationDelegate_application_didFinishLaunchingWithOptions___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  uint64_t v11;
  id v12;

  if (_os_feature_enabled_impl())
  {
    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", CFSTR("INTERNAL: Please Allow Notifications"), CFSTR("Camera will notify you when it detects errors and prompt you to file radars."), 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x1E0C809B0];
    v9 = __68__CAMApplicationDelegate_application_didFinishLaunchingWithOptions___block_invoke_3;
    v10 = &unk_1EA32A598;
    v3 = *(void **)(a1 + 40);
    v11 = *(_QWORD *)(a1 + 32);
    v4 = (void *)MEMORY[0x1E0DC3448];
    v8 = 3221225472;
    v12 = v3;
    objc_msgSend(v4, "actionWithTitle:style:handler:", CFSTR("OK"), 0, &v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addAction:", v5, v7, v8, v9, v10, v11);

    objc_msgSend(*(id *)(a1 + 32), "viewfinderViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "presentViewController:animated:completion:", v2, 1, 0);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_requestAuthorizationForNotificationCenter:", *(_QWORD *)(a1 + 40));
  }
}

uint64_t __68__CAMApplicationDelegate_application_didFinishLaunchingWithOptions___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_requestAuthorizationForNotificationCenter:", *(_QWORD *)(a1 + 40));
}

- (void)_requestAuthorizationForNotificationCenter:(id)a3
{
  objc_msgSend(a3, "requestAuthorizationWithOptions:completionHandler:", 4, &__block_literal_global_57);
}

void __69__CAMApplicationDelegate__requestAuthorizationForNotificationCenter___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v4;
  NSObject *v5;

  v4 = a3;
  if (v4 && a2)
  {
    v5 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __69__CAMApplicationDelegate__requestAuthorizationForNotificationCenter___block_invoke_cold_1(v4, v5);

  }
}

- (void)updateShortcutItemsForApplication:(id)a3
{
  id v4;
  void *v5;
  int v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  const __CFString *v21;
  void *v22;
  int v23;
  id v24;

  v24 = a3;
  CAMSignpostWithIDAndArgs(53, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isBackPortraitModeSupported");
  v7 = objc_msgSend(v5, "isFrontPortraitModeSupported");
  v23 = objc_msgSend(v5, "isBackSlomoSupported");
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v6)
  {
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Take Portrait"), &stru_1EA3325A0, CFSTR("InfoPlist"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMApplicationDelegate _userInfoForMode:devicePosition:](self, "_userInfoForMode:devicePosition:", 6, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3498], "iconWithSystemImageName:", CFSTR("f.cursive.circle"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_alloc(MEMORY[0x1E0DC34A0]);
    v14 = CFSTR("com.apple.camera.shortcuts.portrait");
  }
  else
  {
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Take Photo"), &stru_1EA3325A0, CFSTR("InfoPlist"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMApplicationDelegate _userInfoForMode:devicePosition:](self, "_userInfoForMode:devicePosition:", 0, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3498], "iconWithSystemImageName:", CFSTR("camera"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_alloc(MEMORY[0x1E0DC34A0]);
    v14 = CFSTR("com.apple.camera.shortcuts.photo");
  }
  v15 = (void *)objc_msgSend(v13, "initWithType:localizedTitle:localizedSubtitle:icon:userInfo:", v14, v10, 0, v12, v11);
  objc_msgSend(v4, "addObject:", v15);

  if (v7)
  {
    v16 = v9;
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Take Portrait Selfie"), &stru_1EA3325A0, CFSTR("InfoPlist"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMApplicationDelegate _userInfoForMode:devicePosition:](self, "_userInfoForMode:devicePosition:", 6, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3498], "iconWithSystemImageName:", CFSTR("f.cursive.circle"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_alloc(MEMORY[0x1E0DC34A0]);
    v21 = CFSTR("com.apple.camera.shortcuts.portraitselfie");
LABEL_8:
    v22 = (void *)objc_msgSend(v20, "initWithType:localizedTitle:localizedSubtitle:icon:userInfo:", v21, v17, 0, v19, v18);
    objc_msgSend(v4, "addObject:", v22);

    goto LABEL_9;
  }
  v16 = v9;
  if (v23)
  {
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Record Slo-mo"), &stru_1EA3325A0, CFSTR("InfoPlist"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMApplicationDelegate _userInfoForMode:devicePosition:](self, "_userInfoForMode:devicePosition:", 2, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3498], "iconWithSystemImageName:", CFSTR("slowmo"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_alloc(MEMORY[0x1E0DC34A0]);
    v21 = CFSTR("com.apple.camera.shortcuts.slomo");
    goto LABEL_8;
  }
LABEL_9:
  objc_msgSend(v24, "setShortcutItems:", v4);
  CAMSignpostWithIDAndArgs(54, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);

}

- (void)application:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5
{
  id v6;
  void *v7;
  int v8;
  NSObject *v9;
  CAMUserPreferenceOverrides *v10;
  void *v11;
  unint64_t v12;
  __CFString *v13;
  void *v14;
  unint64_t v15;
  __CFString *v16;
  NSObject *v17;
  void *v18;
  int v19;
  NSObject *v20;
  void *v21;
  void *v22;
  int v23;
  __CFString *v24;
  __int16 v25;
  __CFString *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[CAMApplicationDelegate viewfinderViewController](self, "viewfinderViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isRecording");

  if (v8)
  {
    v9 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      _os_log_impl(&dword_1DB760000, v9, OS_LOG_TYPE_DEFAULT, "Ignoring launching with a URL request since we're currently recording", (uint8_t *)&v23, 2u);
    }
  }
  else
  {
    +[CAMUserPreferences preferences](CAMUserPreferences, "preferences");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = -[CAMUserPreferenceOverrides initWithShortcutItem:]([CAMUserPreferenceOverrides alloc], "initWithShortcutItem:", v6);
    -[CAMUserPreferenceOverrides captureMode](v10, "captureMode");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "integerValue");
    if (v12 > 9)
      v13 = 0;
    else
      v13 = off_1EA32FE38[v12];

    -[CAMUserPreferenceOverrides captureDevice](v10, "captureDevice");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "integerValue");
    if (v15 > 0xB)
      v16 = 0;
    else
      v16 = off_1EA32FE88[v15];

    v17 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v23 = 138543618;
      v24 = v13;
      v25 = 2114;
      v26 = v16;
      _os_log_impl(&dword_1DB760000, v17, OS_LOG_TYPE_DEFAULT, "Launched with a shortcut request for mode:%{public}@ device:%{public}@", (uint8_t *)&v23, 0x16u);
    }

    -[CAMUserPreferenceOverrides wantsQRCodes](v10, "wantsQRCodes");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "BOOLValue");

    if (v19)
    {
      -[NSObject setForceEnableQRBanners:](v9, "setForceEnableQRBanners:", 1);
      v20 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v23) = 0;
        _os_log_impl(&dword_1DB760000, v20, OS_LOG_TYPE_DEFAULT, "Launched with a URL request to force enable QR scanning", (uint8_t *)&v23, 2u);
      }

    }
    -[CAMApplicationDelegate viewfinderViewController](self, "viewfinderViewController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "readUserPreferencesAndHandleChangesWithOverrides:", v10);

    -[CAMApplicationDelegate viewfinderViewController](self, "viewfinderViewController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "generateAnalyticsForLaunchWithShortCutItem:", v6);

  }
}

- (BOOL)application:(id)a3 openURL:(id)a4 options:(id)a5
{
  id v6;
  void *v7;
  char v8;

  v6 = a4;
  -[CAMApplicationDelegate viewfinderViewController](self, "viewfinderViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "handleURLIfNeeded:", v6);

  return v8;
}

- (id)_userInfoForMode:(int64_t)a3 devicePosition:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("CAMCaptureMode");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = CFSTR("CAMCaptureDevice");
  v13[0] = v6;
  v7 = (void *)MEMORY[0x1E0CB37E8];
  +[CAMUserPreferences preferences](CAMUserPreferences, "preferences");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "numberWithInteger:", objc_msgSend(v8, "defaultDeviceForModeChange:devicePosition:spatialVideoEnabled:", a3, a4, 0));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5
{
  (*((void (**)(id, uint64_t))a5 + 2))(a5, 24);
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __102__CAMApplicationDelegate_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke;
  v10[3] = &unk_1EA32FE18;
  v11 = v7;
  v12 = v6;
  v8 = v6;
  v9 = v7;
  objc_msgSend(v8, "getDeliveredNotificationsWithCompletionHandler:", v10);

}

void __102__CAMApplicationDelegate_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  int v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  id obj;
  id v58;
  void *v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v58 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(*(id *)(a1 + 32), "notification");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "content");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:");
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "notification");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "request");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "content");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "userInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("keywordIDs"));
  v55 = objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "notification");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "request");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "content");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "userInfo");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("%@\n"), v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v54 = a1;
  objc_msgSend(*(id *)(a1 + 32), "notification");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "request");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "content");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "userInfo");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectForKeyedSubscript:");
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  obj = v3;
  v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v64, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v61;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v61 != v25)
          objc_enumerationMutation(obj);
        v27 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
        objc_msgSend(v27, "request");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "content");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "userInfo");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("error"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v59, "isEqualToString:", v31);

        objc_msgSend(v27, "request");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "content");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "userInfo");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = v35;
        if (v32)
        {
          objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("captureID"));
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "stringByAppendingFormat:", CFSTR("%@\n"), v37);
          v38 = objc_claimAutoreleasedReturnValue();

          v18 = (void *)v38;
        }
        else
        {
          objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("prewarmReason"));
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = objc_msgSend(v56, "isEqualToString:", v39);

          if (!v40)
            continue;
        }
        objc_msgSend(v27, "request");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "identifier");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "addObject:", v42);

      }
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v64, 16);
    }
    while (v24);
  }

  objc_msgSend(*(id *)(v54 + 40), "removeDeliveredNotificationsWithIdentifiers:", v58);
  objc_msgSend(*(id *)(v54 + 32), "notification");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "request");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "content");
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  v46 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v46, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss"));
  objc_msgSend(*(id *)(v54 + 32), "notification");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "date");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "stringFromDate:", v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  if (v59)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("A capture error occurred on %@ while I was ...\n\nError occurred for captureIDs:\n%@"), v49, v18);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "title");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    BYTE2(v53) = 0;
    LOWORD(v53) = 1;
    v52 = (void *)v55;
    +[CAMTapToRadarUtilities fileRadarWithTitle:description:classification:reproducibility:componentID:componentName:componentVersion:keywordIdsString:attachmentURLs:includeSysDiagnose:includePhotosDiagnose:includeHIDContinuousRecordings:](CAMTapToRadarUtilities, "fileRadarWithTitle:description:classification:reproducibility:componentID:componentName:componentVersion:keywordIdsString:attachmentURLs:includeSysDiagnose:includePhotosDiagnose:includeHIDContinuousRecordings:", v51, v50, CFSTR("Other Bug"), CFSTR("Not Applicable"), CFSTR("1576982"), CFSTR("CameraCapture (New Bugs)"), CFSTR("iOS"), v55, MEMORY[0x1E0C9AA60], v53);
LABEL_16:

    goto LABEL_17;
  }
  v52 = (void *)v55;
  if (v56)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Accidental Camera launch with prewarm reason %@"), v56);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Camera accidentally launched on %@ while I was ..."), v49);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    BYTE2(v53) = 1;
    LOWORD(v53) = 1;
    +[CAMTapToRadarUtilities fileRadarWithTitle:description:classification:reproducibility:componentID:componentName:componentVersion:keywordIdsString:attachmentURLs:includeSysDiagnose:includePhotosDiagnose:includeHIDContinuousRecordings:](CAMTapToRadarUtilities, "fileRadarWithTitle:description:classification:reproducibility:componentID:componentName:componentVersion:keywordIdsString:attachmentURLs:includeSysDiagnose:includePhotosDiagnose:includeHIDContinuousRecordings:", v50, v51, CFSTR("Other Bug"), CFSTR("Not Applicable"), CFSTR("1577042"), CFSTR("Tostada"), CFSTR("New Bugs"), v55, MEMORY[0x1E0C9AA60], v53);
    goto LABEL_16;
  }
LABEL_17:

}

- (BOOL)application:(id)a3 continueUserActivity:(id)a4 restorationHandler:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  int v19;
  NSObject *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[CAMApplicationDelegate viewfinderViewController](self, "viewfinderViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("userAction"));
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 138543362;
      v20 = v9;
      _os_log_impl(&dword_1DB760000, v10, OS_LOG_TYPE_DEFAULT, "Continuing user activity:%{public}@", (uint8_t *)&v19, 0xCu);
    }

    if (-[NSObject isEqual:](v9, "isEqual:", CFSTR("documentScanning")))
    {
      objc_msgSend(v7, "presentDocumentScanningViewControllerAnimated:", 1);
      goto LABEL_24;
    }
    if (!-[NSObject isEqual:](v9, "isEqual:", CFSTR("cameraRoll")))
      goto LABEL_24;
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("cameraRollActionType"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      if ((objc_msgSend(v11, "isEqual:", &stru_1EA3325A0) & 1) != 0)
      {
        v13 = 0;
        goto LABEL_17;
      }
      if ((objc_msgSend(v12, "isEqual:", CFSTR("edit")) & 1) != 0)
      {
        v13 = 1;
        goto LABEL_17;
      }
      if (objc_msgSend(v12, "isEqual:", CFSTR("menu")))
      {
        v13 = 2;
LABEL_17:
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("cameraRollIndex"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
LABEL_18:
          v15 = objc_msgSend(v14, "unsignedIntValue");
LABEL_22:
          objc_msgSend(v7, "presentCameraRollViewControllerAnimated:withAction:selectedAssetIndexFromEnd:", 0, v13, v15);
          +[CAMViewfinderLockScreenExtensionHelper notifyCompleteTransition](CAMViewfinderLockScreenExtensionHelper, "notifyCompleteTransition");
          goto LABEL_23;
        }
LABEL_21:
        v15 = 0;
        goto LABEL_22;
      }
      v16 = objc_msgSend(v12, "isEqual:", CFSTR("share"));
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("cameraRollIndex"));
      v17 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)v17;
      if (v16)
      {
        v13 = 3;
        if (v17)
          goto LABEL_18;
        goto LABEL_21;
      }
    }
    else
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("cameraRollIndex"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
LABEL_23:

    goto LABEL_24;
  }
  v9 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v19) = 0;
    _os_log_impl(&dword_1DB760000, v9, OS_LOG_TYPE_DEFAULT, "Skipping continue user activity, no userInfo", (uint8_t *)&v19, 2u);
  }
LABEL_24:

  return v8 != 0;
}

- (UIWindow)window
{
  return self->_window;
}

- (CAMSubsystems)subsystems
{
  return self->_subsystems;
}

- (void)setSubsystems:(id)a3
{
  objc_storeStrong((id *)&self->_subsystems, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subsystems, 0);
  objc_storeStrong((id *)&self->_window, 0);
}

void __69__CAMApplicationDelegate__requestAuthorizationForNotificationCenter___block_invoke_cold_1(void *a1, NSObject *a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 134217984;
  v4 = objc_msgSend(a1, "code");
  _os_log_error_impl(&dword_1DB760000, a2, OS_LOG_TYPE_ERROR, "Error requesting authorization for UNNotificationRequest. Received: %ld", (uint8_t *)&v3, 0xCu);
}

@end
