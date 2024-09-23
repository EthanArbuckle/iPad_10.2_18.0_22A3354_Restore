@implementation SFWebAppServiceViewController

void __56___SFWebAppServiceViewController_serviceViewControllers__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)serviceViewControllers_serviceViewControllers;
  serviceViewControllers_serviceViewControllers = v0;

}

uint64_t __75___SFWebAppServiceViewController_clearWebViewAndWebsiteDataWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = WBS_LOG_CHANNEL_PREFIXWebApp();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __75___SFWebAppServiceViewController_clearWebViewAndWebsiteDataWithCompletion___block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return objc_msgSend((id)*MEMORY[0x1E0DC4730], "endBackgroundTask:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
}

void __75___SFWebAppServiceViewController_clearWebViewAndWebsiteDataWithCompletion___block_invoke_125(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    v3 = WBS_LOG_CHANNEL_PREFIXWebApp();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __75___SFWebAppServiceViewController_clearWebViewAndWebsiteDataWithCompletion___block_invoke_125_cold_1(v3, v2);
  }

}

uint64_t __75___SFWebAppServiceViewController_clearWebViewAndWebsiteDataWithCompletion___block_invoke_130(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return objc_msgSend((id)*MEMORY[0x1E0DC4730], "endBackgroundTask:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
}

uint64_t __67___SFWebAppServiceViewController_setNeedsStatusBarAppearanceUpdate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 2072), "setBackgroundColor:", *(_QWORD *)(a1 + 40));
}

void __65___SFWebAppServiceViewController__showBlankViewWithAlertIfNeeded__block_invoke(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[5];

  if (a2)
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 2064), "pageURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __65___SFWebAppServiceViewController__showBlankViewWithAlertIfNeeded__block_invoke_2;
    v6[3] = &unk_1E4AC05E0;
    v6[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "openURL:options:completionHandler:", v4, MEMORY[0x1E0C9AA70], v6);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_remoteViewControllerProxy");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "destroyScene");

  }
}

void __65___SFWebAppServiceViewController__showBlankViewWithAlertIfNeeded__block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "_remoteViewControllerProxy");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "destroyScene");

}

void __65___SFWebAppServiceViewController__showBlankViewWithAlertIfNeeded__block_invoke_3(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "_remoteViewControllerProxy");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "destroyScene");

}

void __115___SFWebAppServiceViewController_webViewController_requestNotificationPermissionForSecurityOrigin_decisionHandler___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  char v10;
  uint8_t buf[4];
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = WBS_LOG_CHANNEL_PREFIXWebPush();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __115___SFWebAppServiceViewController_webViewController_requestNotificationPermissionForSecurityOrigin_decisionHandler___block_invoke_cold_1(a2, v7, v5);
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v12 = a2;
    _os_log_impl(&dword_1A3B2D000, v7, OS_LOG_TYPE_DEFAULT, "Push notification permission request finished with result %i", buf, 8u);
  }
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __115___SFWebAppServiceViewController_webViewController_requestNotificationPermissionForSecurityOrigin_decisionHandler___block_invoke_153;
  v8[3] = &unk_1E4AC2C20;
  v9 = *(id *)(a1 + 32);
  v10 = a2;
  dispatch_async(MEMORY[0x1E0C80D38], v8);

}

uint64_t __115___SFWebAppServiceViewController_webViewController_requestNotificationPermissionForSecurityOrigin_decisionHandler___block_invoke_153(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

void __100___SFWebAppServiceViewController_webViewController_decidePolicyForNavigationAction_decisionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  objc_msgSend(*(id *)(a1 + 32), "_navigationUtilitiesManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(unsigned __int8 *)(a1 + 64);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __100___SFWebAppServiceViewController_webViewController_decidePolicyForNavigationAction_decisionHandler___block_invoke_2;
  v8[3] = &unk_1E4AC2C70;
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 56);
  v9 = *(id *)(a1 + 48);
  v10 = a2;
  objc_msgSend(v4, "websitePoliciesForURL:isForMainFrameNavigation:navigationType:completionHandler:", v6, v5, v7, v8);

}

uint64_t __100___SFWebAppServiceViewController_webViewController_decidePolicyForNavigationAction_decisionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), a2);
}

uint64_t __52___SFWebAppServiceViewController__updateDisplayMode__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "_isURLOutOfScope:withLoginURLExempted:", v5, 0);

  if (*(_BYTE *)(a1 + 48))
  {
    v7 = *(void **)(a1 + 40);
    objc_msgSend(v3, "URL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "isEqual:", v8);

  }
  return v6 ^ 1u;
}

uint64_t __67___SFWebAppServiceViewController_navigationBarDoneButtonWasTapped___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "_isURLOutOfScope:withLoginURLExempted:", v3, 0) ^ 1;

  return v4;
}

void __59___SFWebAppServiceViewController_loadWebAppWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59___SFWebAppServiceViewController_loadWebAppWithIdentifier___block_invoke_2;
  v5[3] = &unk_1E4ABFF70;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v7);
}

void __59___SFWebAppServiceViewController_loadWebAppWithIdentifier___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_handleHostStateUpdate:", *(_QWORD *)(a1 + 32));

}

void __77___SFWebAppServiceViewController_notificationPermissionsForWebsiteDataStore___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;
  __int128 v3;
  _QWORD v4[4];
  __int128 v5;

  v1 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __77___SFWebAppServiceViewController_notificationPermissionsForWebsiteDataStore___block_invoke_2;
  v4[3] = &unk_1E4AC2D10;
  v3 = *(_OWORD *)(a1 + 40);
  v2 = (id)v3;
  v5 = v3;
  objc_msgSend(v1, "getNotificationSettingsWithCompletionHandler:", v4);

}

void __77___SFWebAppServiceViewController_notificationPermissionsForWebsiteDataStore___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __68___SFWebAppServiceViewController_websiteDataStore_showNotification___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    v3 = WBS_LOG_CHANNEL_PREFIXWebPush();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __68___SFWebAppServiceViewController_websiteDataStore_showNotification___block_invoke_cold_1(v3, v2);
  }

}

void __110___SFWebAppServiceViewController_websiteDataStore_getDisplayedNotificationsForWorkerOrigin_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)objc_opt_new();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "request", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "content");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "userInfo");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v12);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __72___SFWebAppServiceViewController_processWebPushForWebAppWithIdentifier___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;

  v2 = WBS_LOG_CHANNEL_PREFIXWebPush();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __72___SFWebAppServiceViewController_processWebPushForWebAppWithIdentifier___block_invoke_cold_1(a1, v2, v3);
}

void __72___SFWebAppServiceViewController_processWebPushForWebAppWithIdentifier___block_invoke_251(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = WBS_LOG_CHANNEL_PREFIXWebPush();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    *(_DWORD *)buf = 67109120;
    v24 = objc_msgSend(v3, "count");
    _os_log_impl(&dword_1A3B2D000, v5, OS_LOG_TYPE_DEFAULT, "Processing %i push messages", buf, 8u);

  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    v10 = MEMORY[0x1E0C809B0];
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v12 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v11);
        dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
        CFRetain(*(CFTypeRef *)(a1 + 40));
        v13 = *(void **)(a1 + 40);
        v15[0] = v10;
        v15[1] = 3221225472;
        v15[2] = __72___SFWebAppServiceViewController_processWebPushForWebAppWithIdentifier___block_invoke_252;
        v15[3] = &unk_1E4AC2D58;
        v15[4] = v12;
        v14 = v13;
        v16 = v14;
        v17 = *(id *)(a1 + 32);
        objc_msgSend(v14, "_processPushMessage:completionHandler:", v12, v15);

        ++v11;
      }
      while (v8 != v11);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v8);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __72___SFWebAppServiceViewController_processWebPushForWebAppWithIdentifier___block_invoke_252(uint64_t a1, int a2)
{
  NSObject *v4;
  const __CFString *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = WBS_LOG_CHANNEL_PREFIXWebPush();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = CFSTR("FAILURE");
    v6 = *(_QWORD *)(a1 + 32);
    if (a2)
      v5 = CFSTR("SUCCESS");
    v7 = 138740227;
    v8 = v6;
    v9 = 2114;
    v10 = v5;
    _os_log_impl(&dword_1A3B2D000, v4, OS_LOG_TYPE_DEFAULT, "Push message delivered: %{sensitive}@, %{public}@", (uint8_t *)&v7, 0x16u);
  }
  CFRelease(*(CFTypeRef *)(a1 + 40));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

uint64_t __72___SFWebAppServiceViewController_processWebPushForWebAppWithIdentifier___block_invoke_257(uint64_t a1)
{
  return objc_msgSend((id)*MEMORY[0x1E0DC4730], "endBackgroundTask:", *(_QWORD *)(a1 + 40));
}

void __67___SFWebAppServiceViewController_handlePushNotificationActivation___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;

  v2 = WBS_LOG_CHANNEL_PREFIXWebPush();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __67___SFWebAppServiceViewController_handlePushNotificationActivation___block_invoke_cold_1(a1, v2, v3);
}

void __67___SFWebAppServiceViewController_handlePushNotificationActivation___block_invoke_258(uint64_t a1, int a2)
{
  NSObject *v4;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v4 = WBS_LOG_CHANNEL_PREFIXWebPush();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = a2;
    _os_log_impl(&dword_1A3B2D000, v4, OS_LOG_TYPE_DEFAULT, "Push notification activation event handler done. Result: %i", (uint8_t *)v5, 8u);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __67___SFWebAppServiceViewController_handlePushNotificationActivation___block_invoke_259(uint64_t a1)
{
  return objc_msgSend((id)*MEMORY[0x1E0DC4730], "endBackgroundTask:", *(_QWORD *)(a1 + 40));
}

uint64_t __80___SFWebAppServiceViewController_statusBarIndicatorTappedWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;

  +[_SFWebAppMediaCaptureStatusBarManager sharedManager](_SFWebAppMediaCaptureStatusBarManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancelStatusBarOverride");

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __80___SFWebAppServiceViewController_statusBarIndicatorTappedWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __67___SFWebAppServiceViewController__fetchApplicationManifestIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id *WeakRetained;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (v6 && WeakRetained)
  {
    objc_msgSend(WeakRetained[258], "_sf_setApplicationManifest:", v6);
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 0, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained[258], "_sf_applicationManifestPath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeToURL:atomically:", v5, 1);

  }
}

void __67___SFWebAppServiceViewController__fetchApplicationManifestIfNeeded__block_invoke_2(uint64_t a1, void *a2)
{
  id *WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "_web_stringForKey:", *MEMORY[0x1E0DC5670]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained[258], "setWebClipStatusBarStyle:", UIWebClipStatusBarStyleForMetaTagContent());

    objc_msgSend(WeakRetained[258], "updateOnDisk");
    objc_msgSend(WeakRetained, "setNeedsStatusBarAppearanceUpdate");
  }

}

uint64_t __51___SFWebAppServiceViewController__updateThemeColor__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 2160) = 0;
  return result;
}

void __75___SFWebAppServiceViewController_clearWebViewAndWebsiteDataWithCompletion___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A3B2D000, a1, a3, "Background task expired while waiting to delete web app data", a5, a6, a7, a8, 0);
}

void __75___SFWebAppServiceViewController_clearWebViewAndWebsiteDataWithCompletion___block_invoke_125_cold_1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543362;
  v7 = v4;
  OUTLINED_FUNCTION_1_2(&dword_1A3B2D000, v3, v5, "Error removing network process from WKWebsiteDataStore. Error: %{public}@", (uint8_t *)&v6);

  OUTLINED_FUNCTION_6();
}

void __115___SFWebAppServiceViewController_webViewController_requestNotificationPermissionForSecurityOrigin_decisionHandler___block_invoke_cold_1(char a1, void *a2, void *a3)
{
  int v4;
  NSObject *v5;
  void *v6;
  _DWORD v7[2];
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a1 & 1;
  v5 = a2;
  objc_msgSend(a3, "safari_privacyPreservingDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = 67109379;
  v7[1] = v4;
  v8 = 2113;
  v9 = v6;
  _os_log_error_impl(&dword_1A3B2D000, v5, OS_LOG_TYPE_ERROR, "Push notification permission request finished with result %i. Error: %{private}@", (uint8_t *)v7, 0x12u);

}

void __68___SFWebAppServiceViewController_websiteDataStore_showNotification___block_invoke_cold_1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138477827;
  v7 = v4;
  OUTLINED_FUNCTION_1_2(&dword_1A3B2D000, v3, v5, "Failed to add web push notfication request: %{private}@", (uint8_t *)&v6);

  OUTLINED_FUNCTION_6();
}

void __72___SFWebAppServiceViewController_processWebPushForWebAppWithIdentifier___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_1_2(&dword_1A3B2D000, a2, a3, "Took too long to handle push for Web clip with identifier: '%@'", (uint8_t *)&v4);
  OUTLINED_FUNCTION_3_2();
}

void __67___SFWebAppServiceViewController_handlePushNotificationActivation___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_1_2(&dword_1A3B2D000, a2, a3, "Took too long to handle notification activation for Web clip with identifier: '%@'", (uint8_t *)&v4);
  OUTLINED_FUNCTION_3_2();
}

@end
