@implementation MCLazyInitializationUtilities

+ (void)loadNSBundleAtURL:(id)a3 completionBlock:(id)a4
{
  void (**v5)(id, uint64_t, void *);
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
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
  v8 = _MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v19 = v7;
    _os_log_impl(&dword_19ECC4000, v8, OS_LOG_TYPE_INFO, "Lazy loading NSBundle %{public}@", buf, 0xCu);
  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithURL:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0;
  v10 = objc_msgSend(v9, "loadAndReturnError:", &v17);
  v11 = v17;
  v12 = _MCLogObjects;
  if ((_DWORD)v10)
  {
    if (!os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
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
    if (!os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
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
  _os_log_impl(&dword_19ECC4000, v14, v15, v13, buf, v16);
LABEL_9:
  if (v5)
    v5[2](v5, v10, v9);

}

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
  v8 = _MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v15 = v7;
    _os_log_impl(&dword_19ECC4000, v8, OS_LOG_TYPE_INFO, "Lazy loading %{public}@", buf, 0xCu);
  }
  v9 = CFBundleCreate(0, (CFURLRef)v6);

  if (v9)
  {
    error = 0;
    v10 = CFBundleLoadExecutableAndReturnError(v9, &error);
    v11 = _MCLogObjects;
    if (v10)
    {
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v15 = v7;
        _os_log_impl(&dword_19ECC4000, v11, OS_LOG_TYPE_DEFAULT, "Loaded %{public}@", buf, 0xCu);
      }
      if (v5)
        v5[2](v5, 1, v9);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v15 = v7;
        v16 = 2114;
        v17 = error;
        _os_log_impl(&dword_19ECC4000, v11, OS_LOG_TYPE_ERROR, "Could not load %{public}@: %{public}@", buf, 0x16u);
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
    v12 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v15 = v7;
      _os_log_impl(&dword_19ECC4000, v12, OS_LOG_TYPE_ERROR, "Could not load %{public}@", buf, 0xCu);
    }
    if (v5)
      v5[2](v5, 0, 0);
  }

}

+ (void)initPowerlogControl
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__MCLazyInitializationUtilities_initPowerlogControl__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (initPowerlogControl_onceToken != -1)
    dispatch_once(&initPowerlogControl_onceToken, block);
}

void __52__MCLazyInitializationUtilities_initPowerlogControl__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  URLForCanonicalFilePath(CFSTR("/System/Library/PrivateFrameworks/PowerlogControl.framework"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "loadBundleAtURL:completionBlock:", v2, &__block_literal_global_14);

}

void __52__MCLazyInitializationUtilities_initPowerlogControl__block_invoke_2(int a1, int a2, CFBundleRef bundle)
{
  if (a2)
  {
    _PowerlogControlSwitchMode = CFBundleGetFunctionPointerForName(bundle, CFSTR("PowerlogControlSwitchMode"));
    _PowerlogControlReadMode = CFBundleGetFunctionPointerForName(bundle, CFSTR("PowerlogControlReadMode"));
  }
}

+ (void)initCoreGraphics
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__MCLazyInitializationUtilities_initCoreGraphics__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (initCoreGraphics_onceToken != -1)
    dispatch_once(&initCoreGraphics_onceToken, block);
}

void __49__MCLazyInitializationUtilities_initCoreGraphics__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  URLForCanonicalFilePath(CFSTR("/System/Library/Frameworks/CoreGraphics.framework"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "loadBundleAtURL:completionBlock:", v2, &__block_literal_global_53_0);

}

void __49__MCLazyInitializationUtilities_initCoreGraphics__block_invoke_2(int a1, int a2, CFBundleRef bundle)
{
  if (a2)
  {
    _CGDataProviderCreateWithURL = CFBundleGetFunctionPointerForName(bundle, CFSTR("CGDataProviderCreateWithURL"));
    _CGFontCopyFullName = CFBundleGetFunctionPointerForName(bundle, CFSTR("CGFontCopyFullName"));
    _CGFontCopyPostScriptName = CFBundleGetFunctionPointerForName(bundle, CFSTR("CGFontCopyPostScriptName"));
    _CGFontCreateWithDataProvider = CFBundleGetFunctionPointerForName(bundle, CFSTR("CGFontCreateWithDataProvider"));
  }
}

+ (void)initImageIO
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__MCLazyInitializationUtilities_initImageIO__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (initImageIO_onceToken != -1)
    dispatch_once(&initImageIO_onceToken, block);
}

void __44__MCLazyInitializationUtilities_initImageIO__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  URLForCanonicalFilePath(CFSTR("/System/Library/Frameworks/ImageIO.framework"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "loadBundleAtURL:completionBlock:", v2, &__block_literal_global_62_0);

}

void __44__MCLazyInitializationUtilities_initImageIO__block_invoke_2(int a1, int a2, CFBundleRef bundle)
{
  if (a2)
  {
    _CGImageSourceCreateImageAtIndex = (uint64_t (*)(_QWORD, _QWORD, _QWORD))CFBundleGetFunctionPointerForName(bundle, CFSTR("CGImageSourceCreateImageAtIndex"));
    _CGImageSourceCreateWithData = (uint64_t (*)(_QWORD, _QWORD))CFBundleGetFunctionPointerForName(bundle, CFSTR("CGImageSourceCreateWithData"));
    _CGImageSourceGetCount = (uint64_t (*)(_QWORD))CFBundleGetFunctionPointerForName(bundle, CFSTR("CGImageSourceGetCount"));
  }
}

+ (void)initCoreText
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__MCLazyInitializationUtilities_initCoreText__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (initCoreText_onceToken != -1)
    dispatch_once(&initCoreText_onceToken, block);
}

void __45__MCLazyInitializationUtilities_initCoreText__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  URLForCanonicalFilePath(CFSTR("/System/Library/Frameworks/CoreText.framework"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "loadBundleAtURL:completionBlock:", v2, &__block_literal_global_69);

}

void __45__MCLazyInitializationUtilities_initCoreText__block_invoke_2(int a1, int a2, CFBundleRef bundle)
{
  if (a2)
    _CTFontManagerCreateFontDescriptorsFromURL = CFBundleGetFunctionPointerForName(bundle, CFSTR("CTFontManagerCreateFontDescriptorsFromURL"));
}

+ (void)initMessage
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__MCLazyInitializationUtilities_initMessage__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (initMessage_onceToken != -1)
    dispatch_once(&initMessage_onceToken, block);
}

void __44__MCLazyInitializationUtilities_initMessage__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  URLForCanonicalFilePath(CFSTR("/System/Library/PrivateFrameworks/Message.framework"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "loadBundleAtURL:completionBlock:", v2, &__block_literal_global_72_0);

}

void __44__MCLazyInitializationUtilities_initMessage__block_invoke_2(int a1, int a2, CFBundleRef bundle)
{
  id *DataPointerForName;

  if (a2)
  {
    DataPointerForName = (id *)CFBundleGetDataPointerForName(bundle, CFSTR("MailAccountManagedTag"));
    objc_storeStrong((id *)&_MailAccountManagedTag, *DataPointerForName);
  }
}

+ (void)initExchangeSyncExpress
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__MCLazyInitializationUtilities_initExchangeSyncExpress__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (initExchangeSyncExpress_onceToken != -1)
    dispatch_once(&initExchangeSyncExpress_onceToken, block);
}

void __56__MCLazyInitializationUtilities_initExchangeSyncExpress__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  URLForCanonicalFilePath(CFSTR("/System/Library/PrivateFrameworks/ExchangeSyncExpress.framework"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "loadBundleAtURL:completionBlock:", v2, &__block_literal_global_75_0);

}

void __56__MCLazyInitializationUtilities_initExchangeSyncExpress__block_invoke_2(int a1, int a2, CFBundleRef bundle)
{
  id *DataPointerForName;
  void *v5;
  id *v6;
  void *v7;
  id *v8;
  void *v9;

  if (a2)
  {
    DataPointerForName = (id *)CFBundleGetDataPointerForName(bundle, CFSTR("kESExchangeAccountWipeOnly"));
    if (DataPointerForName)
      DataPointerForName = (id *)*DataPointerForName;
    v5 = (void *)_kESExchangeAccountWipeOnly;
    _kESExchangeAccountWipeOnly = (uint64_t)DataPointerForName;

    v6 = (id *)CFBundleGetDataPointerForName(bundle, CFSTR("kESExchangeDeviceID"));
    if (v6)
      v6 = (id *)*v6;
    v7 = (void *)_kESExchangeDeviceID;
    _kESExchangeDeviceID = (uint64_t)v6;

    v8 = (id *)CFBundleGetDataPointerForName(bundle, CFSTR("kESExchangeUserEnrollmentMode"));
    if (v8)
      v8 = (id *)*v8;
    v9 = (void *)_kESExchangeUserEnrollmentMode;
    _kESExchangeUserEnrollmentMode = (uint64_t)v8;

  }
}

+ (void)initDAEAS
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__MCLazyInitializationUtilities_initDAEAS__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (initDAEAS_onceToken != -1)
    dispatch_once(&initDAEAS_onceToken, block);
}

void __42__MCLazyInitializationUtilities_initDAEAS__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  URLForCanonicalFilePath(CFSTR("/System/Library/PrivateFrameworks/ExchangeSync.framework/Frameworks/DAEAS.framework"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "loadBundleAtURL:completionBlock:", v2, &__block_literal_global_82);

}

void __42__MCLazyInitializationUtilities_initDAEAS__block_invoke_2(int a1, int a2, CFBundleRef bundle)
{
  id *DataPointerForName;

  if (a2)
  {
    DataPointerForName = (id *)CFBundleGetDataPointerForName(bundle, CFSTR("kASSyncDefaultFoldersOnly"));
    objc_storeStrong((id *)&_kASSyncDefaultFoldersOnly, *DataPointerForName);
    _overSimplifiedStatusForError = CFBundleGetFunctionPointerForName(bundle, CFSTR("overSimplifiedStatusForError"));
  }
}

+ (void)initMobileActivation
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__MCLazyInitializationUtilities_initMobileActivation__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (initMobileActivation_onceToken != -1)
    dispatch_once(&initMobileActivation_onceToken, block);
}

void __53__MCLazyInitializationUtilities_initMobileActivation__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  URLForCanonicalFilePath(CFSTR("/System/Library/PrivateFrameworks/MobileActivation.framework"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "loadBundleAtURL:completionBlock:", v2, &__block_literal_global_87_0);

}

void __53__MCLazyInitializationUtilities_initMobileActivation__block_invoke_2(int a1, int a2, CFBundleRef bundle)
{
  id *DataPointerForName;
  id *v5;

  if (a2)
  {
    DataPointerForName = (id *)CFBundleGetDataPointerForName(bundle, CFSTR("kMAActivationStateActivated"));
    objc_storeStrong((id *)&_kMAActivationStateActivated, *DataPointerForName);
    v5 = (id *)CFBundleGetDataPointerForName(bundle, CFSTR("kNotificationActivationStateChanged"));
    objc_storeStrong((id *)&_kNotificationActivationStateChanged, *v5);
    _MAEGetActivationStateWithError = CFBundleGetFunctionPointerForName(bundle, CFSTR("MAEGetActivationStateWithError"));
    _MAECopyActivationRecordWithError = CFBundleGetFunctionPointerForName(bundle, CFSTR("MAECopyActivationRecordWithError"));
  }
}

+ (void)initLoggingSupport
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__MCLazyInitializationUtilities_initLoggingSupport__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (initLoggingSupport_onceToken != -1)
    dispatch_once(&initLoggingSupport_onceToken, block);
}

void __51__MCLazyInitializationUtilities_initLoggingSupport__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  URLForCanonicalFilePath(CFSTR("/System/Library/PrivateFrameworks/LoggingSupport.framework"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "loadBundleAtURL:completionBlock:", v2, &__block_literal_global_96_0);

}

void __51__MCLazyInitializationUtilities_initLoggingSupport__block_invoke_2(int a1, int a2, CFBundleRef bundle)
{
  if (a2)
  {
    _OSLogValidateProfilePayload = CFBundleGetFunctionPointerForName(bundle, CFSTR("OSLogValidateProfilePayload"));
    _OSLogInstallProfilePayload = CFBundleGetFunctionPointerForName(bundle, CFSTR("OSLogInstallProfilePayload"));
    _OSLogRemoveProfilePayload = CFBundleGetFunctionPointerForName(bundle, CFSTR("OSLogRemoveProfilePayload"));
  }
}

+ (void)initSetupAssistant
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__MCLazyInitializationUtilities_initSetupAssistant__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (initSetupAssistant_onceToken != -1)
    dispatch_once(&initSetupAssistant_onceToken, block);
}

void __51__MCLazyInitializationUtilities_initSetupAssistant__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  URLForCanonicalFilePath(CFSTR("/System/Library/PrivateFrameworks/SetupAssistant.framework"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "loadBundleAtURL:completionBlock:", v2, &__block_literal_global_103);

}

void __51__MCLazyInitializationUtilities_initSetupAssistant__block_invoke_2(int a1, int a2, CFBundleRef bundle)
{
  if (a2)
    _BYSetupAssistantNeedsToRun = CFBundleGetFunctionPointerForName(bundle, CFSTR("BYSetupAssistantNeedsToRun"));
}

+ (void)initSpringBoardServices
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__MCLazyInitializationUtilities_initSpringBoardServices__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (initSpringBoardServices_onceToken != -1)
    dispatch_once(&initSpringBoardServices_onceToken, block);
}

void __56__MCLazyInitializationUtilities_initSpringBoardServices__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  URLForCanonicalFilePath(CFSTR("/System/Library/PrivateFrameworks/SpringBoardServices.framework"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "loadBundleAtURL:completionBlock:", v2, &__block_literal_global_106);

}

void __56__MCLazyInitializationUtilities_initSpringBoardServices__block_invoke_2(int a1, int a2, CFBundleRef bundle)
{
  if (a2)
  {
    _SBUserNotificationDontDismissOnUnlock = *(_QWORD *)CFBundleGetDataPointerForName(bundle, CFSTR("SBUserNotificationDontDismissOnUnlock"));
    _SBUserNotificationDismissOnLock = *(_QWORD *)CFBundleGetDataPointerForName(bundle, CFSTR("SBUserNotificationDismissOnLock"));
    _SBSApplicationLaunchFromURLOptionUnlockDeviceKey = *(_QWORD *)CFBundleGetDataPointerForName(bundle, CFSTR("SBSApplicationLaunchFromURLOptionUnlockDeviceKey"));
    _SBSCopyFrontmostApplicationDisplayIdentifier = CFBundleGetFunctionPointerForName(bundle, CFSTR("SBSCopyFrontmostApplicationDisplayIdentifier"));
    _SBSSuspendFrontmostApplication = CFBundleGetFunctionPointerForName(bundle, CFSTR("SBSSuspendFrontmostApplication"));
    _SBSSpringBoardServerPort = CFBundleGetFunctionPointerForName(bundle, CFSTR("SBSSpringBoardServerPort"));
    _SBAddWebClipToHomeScreen = CFBundleGetFunctionPointerForName(bundle, CFSTR("SBAddWebClipToHomeScreen"));
    _SBGetScreenLockStatus = CFBundleGetFunctionPointerForName(bundle, CFSTR("SBGetScreenLockStatus"));
    _SBRemoveWebClipFromHomeScreen = CFBundleGetFunctionPointerForName(bundle, CFSTR("SBRemoveWebClipFromHomeScreen"));
  }
}

+ (void)initUserManagement
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__MCLazyInitializationUtilities_initUserManagement__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (initUserManagement_onceToken != -1)
    dispatch_once(&initUserManagement_onceToken, block);
}

void __51__MCLazyInitializationUtilities_initUserManagement__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  URLForCanonicalFilePath(CFSTR("/System/Library/PrivateFrameworks/UserManagement.framework"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "loadBundleAtURL:completionBlock:", v2, &__block_literal_global_125);

}

void __51__MCLazyInitializationUtilities_initUserManagement__block_invoke_2(int a1, int a2, CFBundleRef bundle)
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

+ (void)initAppleIDSSOAuthentication
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__MCLazyInitializationUtilities_initAppleIDSSOAuthentication__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (initAppleIDSSOAuthentication_onceToken != -1)
    dispatch_once(&initAppleIDSSOAuthentication_onceToken, block);
}

void __61__MCLazyInitializationUtilities_initAppleIDSSOAuthentication__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  URLForCanonicalFilePath(CFSTR("/System/Library/PrivateFrameworks/AppleIDSSOAuthentication.framework"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "loadBundleAtURL:completionBlock:", v2, &__block_literal_global_134);

}

void __61__MCLazyInitializationUtilities_initAppleIDSSOAuthentication__block_invoke_2(int a1, int a2, CFBundleRef bundle)
{
  id *DataPointerForName;

  if (a2)
  {
    DataPointerForName = (id *)CFBundleGetDataPointerForName(bundle, CFSTR("AIDAServiceTypeCloud"));
    objc_storeStrong((id *)&_AIDAServiceTypeCloud, *DataPointerForName);
  }
}

+ (void)initAuthKit
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__MCLazyInitializationUtilities_initAuthKit__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (initAuthKit_onceToken != -1)
    dispatch_once(&initAuthKit_onceToken, block);
}

void __44__MCLazyInitializationUtilities_initAuthKit__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  URLForCanonicalFilePath(CFSTR("/System/Library/PrivateFrameworks/AuthKit.framework"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "loadBundleAtURL:completionBlock:", v2, &__block_literal_global_137_0);

}

void __44__MCLazyInitializationUtilities_initAuthKit__block_invoke_2(int a1, int a2, CFBundleRef bundle)
{
  id *DataPointerForName;
  id *v5;
  id *v6;

  if (a2)
  {
    DataPointerForName = (id *)CFBundleGetDataPointerForName(bundle, CFSTR("AKAuthenticationUsernameKey"));
    objc_storeStrong((id *)&_AKAuthenticationUsernameKey, *DataPointerForName);
    v5 = (id *)CFBundleGetDataPointerForName(bundle, CFSTR("AKAuthenticationPasswordKey"));
    objc_storeStrong((id *)&_AKAuthenticationPasswordKey, *v5);
    v6 = (id *)CFBundleGetDataPointerForName(bundle, CFSTR("AKAuthenticationAlternateDSIDKey"));
    objc_storeStrong((id *)&_AKAuthenticationAlternateDSIDKey, *v6);
  }
}

@end
