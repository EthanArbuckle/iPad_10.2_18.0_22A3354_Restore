@implementation DMCLazyInitializationUtilities

+ (void)loadBundleAtURL:(id)a3 completionBlock:(id)a4
{
  void (**v5)(id, uint64_t, __CFBundle *);
  id v6;
  void *v7;
  NSObject *v8;
  __CFBundle *v9;
  int v10;
  NSObject *v11;
  NSObject *v12;
  CFErrorRef error;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  CFErrorRef v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(id, uint64_t, __CFBundle *))a4;
  v6 = a3;
  objc_msgSend(v6, "lastPathComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *DMCLogObjects();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v15 = v7;
    _os_log_impl(&dword_1A4951000, v8, OS_LOG_TYPE_INFO, "Lazy loading %{public}@", buf, 0xCu);
  }
  v9 = CFBundleCreate(0, (CFURLRef)v6);

  if (v9)
  {
    error = 0;
    v10 = CFBundleLoadExecutableAndReturnError(v9, &error);
    v11 = *DMCLogObjects();
    if (v10)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v15 = v7;
        _os_log_impl(&dword_1A4951000, v11, OS_LOG_TYPE_DEFAULT, "Loaded %{public}@", buf, 0xCu);
      }
      if (v5)
        v5[2](v5, 1, v9);
    }
    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v15 = v7;
        v16 = 2114;
        v17 = error;
        _os_log_impl(&dword_1A4951000, v11, OS_LOG_TYPE_ERROR, "Could not load %{public}@: %{public}@", buf, 0x16u);
      }
      if (v5)
        v5[2](v5, 0, 0);
    }
    CFRelease(v9);
    if (error)
      CFRelease(error);
  }
  else
  {
    v12 = *DMCLogObjects();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v15 = v7;
      _os_log_impl(&dword_1A4951000, v12, OS_LOG_TYPE_ERROR, "Could not load %{public}@", buf, 0xCu);
    }
    if (v5)
      v5[2](v5, 0, 0);
  }

}

+ (void)loadNSBundleAtURL:(id)a3 completionBlock:(id)a4
{
  void (**v5)(id, uint64_t, void *);
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  const char *v13;
  NSObject *v14;
  os_log_type_t v15;
  uint32_t v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(id, uint64_t, void *))a4;
  v6 = a3;
  objc_msgSend(v6, "lastPathComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *DMCLogObjects();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v19 = v7;
    _os_log_impl(&dword_1A4951000, v8, OS_LOG_TYPE_INFO, "Lazy loading NSBundle %{public}@", buf, 0xCu);
  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithURL:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0;
  v10 = objc_msgSend(v9, "loadAndReturnError:", &v17);
  v11 = v17;
  v12 = *DMCLogObjects();
  if ((_DWORD)v10)
  {
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      goto LABEL_9;
    *(_DWORD *)buf = 138543362;
    v19 = v7;
    v13 = "Loaded %{public}@";
    v14 = v12;
    v15 = OS_LOG_TYPE_DEFAULT;
    v16 = 12;
  }
  else
  {
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    *(_DWORD *)buf = 138543618;
    v19 = v7;
    v20 = 2114;
    v21 = v11;
    v13 = "Could not load %{public}@: %{public}@";
    v14 = v12;
    v15 = OS_LOG_TYPE_ERROR;
    v16 = 22;
  }
  _os_log_impl(&dword_1A4951000, v14, v15, v13, buf, v16);
LABEL_9:
  if (v5)
    v5[2](v5, v10, v9);

}

+ (void)initSpringBoardServices
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__DMCLazyInitializationUtilities_initSpringBoardServices__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (initSpringBoardServices_onceToken != -1)
    dispatch_once(&initSpringBoardServices_onceToken, block);
}

void __57__DMCLazyInitializationUtilities_initSpringBoardServices__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  URLForCanonicalFilePath(CFSTR("/System/Library/PrivateFrameworks/SpringBoardServices.framework"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "loadBundleAtURL:completionBlock:", v2, &__block_literal_global_10);

}

void __57__DMCLazyInitializationUtilities_initSpringBoardServices__block_invoke_2(int a1, int a2, CFBundleRef bundle)
{
  if (a2)
  {
    _SBUserNotificationDontDismissOnUnlock = *(_QWORD *)CFBundleGetDataPointerForName(bundle, CFSTR("SBUserNotificationDontDismissOnUnlock"));
    _SBUserNotificationDismissOnLock = *(_QWORD *)CFBundleGetDataPointerForName(bundle, CFSTR("SBUserNotificationDismissOnLock"));
  }
}

+ (void)initSetupAssistant
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__DMCLazyInitializationUtilities_initSetupAssistant__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (initSetupAssistant_onceToken != -1)
    dispatch_once(&initSetupAssistant_onceToken, block);
}

void __52__DMCLazyInitializationUtilities_initSetupAssistant__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  URLForCanonicalFilePath(CFSTR("/System/Library/PrivateFrameworks/SetupAssistant.framework"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "loadBundleAtURL:completionBlock:", v2, &__block_literal_global_23);

}

void __52__DMCLazyInitializationUtilities_initSetupAssistant__block_invoke_2(int a1, int a2, CFBundleRef bundle)
{
  id *DataPointerForName;

  if (a2)
  {
    _BYSetupAssistantNeedsToRun = CFBundleGetFunctionPointerForName(bundle, CFSTR("BYSetupAssistantNeedsToRun"));
    DataPointerForName = (id *)CFBundleGetDataPointerForName(bundle, CFSTR("BYSetupAssistantFinishedDarwinNotification"));
    objc_storeStrong((id *)&_BYSetupAssistantFinishedDarwinNotification, *DataPointerForName);
  }
}

+ (void)initUserManagement
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__DMCLazyInitializationUtilities_initUserManagement__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (initUserManagement_onceToken != -1)
    dispatch_once(&initUserManagement_onceToken, block);
}

void __52__DMCLazyInitializationUtilities_initUserManagement__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  URLForCanonicalFilePath(CFSTR("/System/Library/PrivateFrameworks/UserManagement.framework"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "loadBundleAtURL:completionBlock:", v2, &__block_literal_global_28);

}

void __52__DMCLazyInitializationUtilities_initUserManagement__block_invoke_2(int a1, int a2, CFBundleRef bundle)
{
  id *DataPointerForName;
  id *v5;
  id *v6;
  id *v7;

  if (a2)
  {
    DataPointerForName = (id *)CFBundleGetDataPointerForName(bundle, CFSTR("UMUserManagerErrorDomain"));
    objc_storeStrong((id *)&_UMUserManagerErrorDomain, *DataPointerForName);
    v5 = (id *)CFBundleGetDataPointerForName(bundle, CFSTR("kUMUserSessionProvisionTypeEducation"));
    objc_storeStrong((id *)&_kUMUserSessionProvisionTypeEducation, *v5);
    v6 = (id *)CFBundleGetDataPointerForName(bundle, CFSTR("kUMUserSessionProvisionTypeKey"));
    objc_storeStrong((id *)&_kUMUserSessionProvisionTypeKey, *v6);
    v7 = (id *)CFBundleGetDataPointerForName(bundle, CFSTR("kUMEducationUserSizeKey"));
    objc_storeStrong((id *)&_kUMEducationUserSizeKey, *v7);
  }
}

+ (void)initAuthKit
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__DMCLazyInitializationUtilities_initAuthKit__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (initAuthKit_onceToken != -1)
    dispatch_once(&initAuthKit_onceToken, block);
}

void __45__DMCLazyInitializationUtilities_initAuthKit__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  URLForCanonicalFilePath(CFSTR("/System/Library/PrivateFrameworks/AuthKit.framework"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "loadBundleAtURL:completionBlock:", v2, &__block_literal_global_37);

}

void __45__DMCLazyInitializationUtilities_initAuthKit__block_invoke_2(int a1, int a2, CFBundleRef bundle)
{
  id *DataPointerForName;
  id *v5;
  id *v6;
  id *v7;
  id *v8;

  if (a2)
  {
    DataPointerForName = (id *)CFBundleGetDataPointerForName(bundle, CFSTR("AKAuthenticationUsernameKey"));
    objc_storeStrong((id *)&_AKAuthenticationUsernameKey, *DataPointerForName);
    v5 = (id *)CFBundleGetDataPointerForName(bundle, CFSTR("AKAuthenticationPasswordKey"));
    objc_storeStrong((id *)&_AKAuthenticationPasswordKey, *v5);
    v6 = (id *)CFBundleGetDataPointerForName(bundle, CFSTR("AKAuthenticationAlternateDSIDKey"));
    objc_storeStrong((id *)&_AKAuthenticationAlternateDSIDKey, *v6);
    v7 = (id *)CFBundleGetDataPointerForName(bundle, CFSTR("AKAuthenticationDSIDKey"));
    objc_storeStrong((id *)&_AKAuthenticationDSIDKey, *v7);
    v8 = (id *)CFBundleGetDataPointerForName(bundle, CFSTR("AKAuthenticationIDMSTokenKey"));
    objc_storeStrong((id *)&_AKAuthenticationIDMSTokenKey, *v8);
  }
}

+ (void)initAppleIDSSOAuthentication
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__DMCLazyInitializationUtilities_initAppleIDSSOAuthentication__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (initAppleIDSSOAuthentication_onceToken != -1)
    dispatch_once(&initAppleIDSSOAuthentication_onceToken, block);
}

void __62__DMCLazyInitializationUtilities_initAppleIDSSOAuthentication__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  URLForCanonicalFilePath(CFSTR("/System/Library/PrivateFrameworks/AppleIDSSOAuthentication.framework"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "loadBundleAtURL:completionBlock:", v2, &__block_literal_global_48);

}

void __62__DMCLazyInitializationUtilities_initAppleIDSSOAuthentication__block_invoke_2(int a1, int a2, CFBundleRef bundle)
{
  id *DataPointerForName;
  id *v5;
  id *v6;
  id *v7;
  id *v8;

  if (a2)
  {
    DataPointerForName = (id *)CFBundleGetDataPointerForName(bundle, CFSTR("AIDAServiceTypeCloud"));
    objc_storeStrong((id *)&_AIDAServiceTypeCloud, *DataPointerForName);
    v5 = (id *)CFBundleGetDataPointerForName(bundle, CFSTR("AIDAServiceTypeMessages"));
    objc_storeStrong((id *)&_AIDAServiceTypeMessages, *v5);
    v6 = (id *)CFBundleGetDataPointerForName(bundle, CFSTR("AIDAServiceTypeFaceTime"));
    objc_storeStrong((id *)&_AIDAServiceTypeFaceTime, *v6);
    v7 = (id *)CFBundleGetDataPointerForName(bundle, CFSTR("AIDAServiceTypeStore"));
    objc_storeStrong((id *)&_AIDAServiceTypeStore, *v7);
    v8 = (id *)CFBundleGetDataPointerForName(bundle, CFSTR("AIDAServiceTypeGameCenter"));
    objc_storeStrong((id *)&_AIDAServiceTypeGameCenter, *v8);
  }
}

+ (void)initMobileActivation
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__DMCLazyInitializationUtilities_initMobileActivation__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (initMobileActivation_onceToken != -1)
    dispatch_once(&initMobileActivation_onceToken, block);
}

void __54__DMCLazyInitializationUtilities_initMobileActivation__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  URLForCanonicalFilePath(CFSTR("/System/Library/PrivateFrameworks/MobileActivation.framework"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "loadBundleAtURL:completionBlock:", v2, &__block_literal_global_82);

}

void __54__DMCLazyInitializationUtilities_initMobileActivation__block_invoke_2(int a1, int a2, CFBundleRef bundle)
{
  id *DataPointerForName;
  id *v5;

  if (a2)
  {
    DataPointerForName = (id *)CFBundleGetDataPointerForName(bundle, CFSTR("kMAActivationStateActivated"));
    objc_storeStrong((id *)&_kMAActivationStateActivated, *DataPointerForName);
    v5 = (id *)CFBundleGetDataPointerForName(bundle, CFSTR("kNotificationActivationStateChanged"));
    objc_storeStrong((id *)&_kNotificationActivationStateChanged, *v5);
    _MAEGetActivationStateWithError = (uint64_t (*)(_QWORD))CFBundleGetFunctionPointerForName(bundle, CFSTR("MAEGetActivationStateWithError"));
    _MAECopyActivationRecordWithError = (uint64_t (*)(_QWORD))CFBundleGetFunctionPointerForName(bundle, CFSTR("MAECopyActivationRecordWithError"));
  }
}

@end
