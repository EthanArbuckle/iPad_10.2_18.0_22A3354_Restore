@implementation ASKClient

- (BOOL)supportsHEIF
{
  return 1;
}

- (BOOL)newPaymentMethodEnabled
{
  return 1;
}

- (BOOL)isTinkerWatch
{
  return objc_msgSend(MEMORY[0x1E0CFA168], "isStandaloneWatch");
}

- (BOOL)deviceHasCapabilities:(id)a3
{
  return -[ASKClient deviceHasCapabilitiesIncludingCompatibilityCheck:isVisionOSCompatibleIOSApp:](self, "deviceHasCapabilitiesIncludingCompatibilityCheck:isVisionOSCompatibleIOSApp:", a3, 0);
}

- (NSString)storefrontIdentifier
{
  void *v2;
  void *v3;

  -[ASKClient storefrontIdentifierPromise](self, "storefrontIdentifierPromise");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resultWithError:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (AMSPromise)storefrontIdentifierPromise
{
  return (AMSPromise *)objc_getProperty(self, a2, 8, 1);
}

- (BOOL)isSidepackingEnabled
{
  return ASKPerformanceProfileGetForCurrentDevice() != 0;
}

- (ASKClient)init
{
  ASKClient *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ASKClient;
  v2 = -[ASKClient init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[ASKClient getStorefrontIdentifierPromise:](ASKClient, "getStorefrontIdentifierPromise:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASKClient setStorefrontIdentifierPromise:](v2, "setStorefrontIdentifierPromise:", v4);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel_accountStoreDidChange_, *MEMORY[0x1E0C8F010], v3);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v2, sel_applicationDidForeground_, *MEMORY[0x1E0DC4750], 0);

    -[ASKClient updateNotificationAuthorisationStatus](v2, "updateNotificationAuthorisationStatus");
  }
  return v2;
}

- (void)updateNotificationAuthorisationStatus
{
  void *v3;
  _QWORD v4[5];

  if (-[ASKClient canUpdateNotificationAuthorizationStatus](self, "canUpdateNotificationAuthorizationStatus"))
  {
    objc_msgSend(MEMORY[0x1E0CEC7A0], "currentNotificationCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __50__ASKClient_updateNotificationAuthorisationStatus__block_invoke;
    v4[3] = &unk_1E9DC2410;
    v4[4] = self;
    objc_msgSend(v3, "getNotificationSettingsWithCompletionHandler:", v4);

  }
}

- (BOOL)canUpdateNotificationAuthorizationStatus
{
  if (canUpdateNotificationAuthorizationStatus_onceToken[0] != -1)
    dispatch_once(canUpdateNotificationAuthorizationStatus_onceToken, &__block_literal_global_54);
  return canUpdateNotificationAuthorizationStatus_isRunningTests == 0;
}

- (void)setStorefrontIdentifierPromise:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

+ (id)getStorefrontIdentifierPromise:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = a3;
  objc_msgSend(v3, "ams_mediaType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ams_activeiTunesAccountForMediaType:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __44__ASKClient_getStorefrontIdentifierPromise___block_invoke;
  v9[3] = &unk_1E9DC23C8;
  v10 = v3;
  v6 = v3;
  objc_msgSend(v5, "continueWithBlock:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)deviceHasCapabilitiesIncludingCompatibilityCheck:(id)a3 isVisionOSCompatibleIOSApp:(BOOL)a4
{
  if (a3)
    return objc_msgSend(MEMORY[0x1E0CFA168], "hasCapabilitiesIncludingCompatibilityCheck:isVisionOSCompatibleIOSApp:", a3, a4);
  else
    return 1;
}

- (CGSize)screenSize
{
  double v2;
  double v3;
  CGSize result;

  objc_msgSend(MEMORY[0x1E0CFA168], "mainScreenSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setCurrentNotificationAuthorizationStatus:(int64_t)a3
{
  self->_currentNotificationAuthorizationStatus = a3;
}

uint64_t __50__ASKClient_updateNotificationAuthorisationStatus__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCurrentNotificationAuthorizationStatus:", objc_msgSend(a2, "authorizationStatus"));
}

void __53__ASKClient_canUpdateNotificationAuthorizationStatus__block_invoke()
{
  void *v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "environment");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKeyedSubscript:", CFSTR("XCTestConfigurationFilePath"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  canUpdateNotificationAuthorizationStatus_isRunningTests = v1 != 0;

}

id __44__ASKClient_getStorefrontIdentifierPromise___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(a2, "ams_storefront");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "ams_hasDomain:code:", *MEMORY[0x1E0CFD808], 7) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CFDAF0], "ask_generalLogConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CFDAF0], "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "OSLogObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "domain");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v9;
      v16 = 1026;
      v17 = objc_msgSend(v5, "code");
      _os_log_impl(&dword_1D8328000, v8, OS_LOG_TYPE_ERROR, "Could not get active iTunes accountError domain=%{public}@, code=%{public}d", (uint8_t *)&v14, 0x12u);

    }
  }
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CFDBD8], "promiseWithResult:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "ams_fetchLocaliTunesAccount");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "thenWithBlock:", &__block_literal_global_6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "catchWithBlock:", &__block_literal_global_16);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

id __44__ASKClient_getStorefrontIdentifierPromise___block_invoke_12(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CFDBD8];
  objc_msgSend(a2, "ams_storefront");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "promiseWithResult:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)ASKClient;
  -[ASKClient dealloc](&v4, sel_dealloc);
}

- (void)accountStoreDidChange:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v4;
  else
    v6 = 0;

  if (v6)
  {
    +[ASKClient getStorefrontIdentifierPromise:](ASKClient, "getStorefrontIdentifierPromise:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASKClient setStorefrontIdentifierPromise:](self, "setStorefrontIdentifierPromise:", v5);

  }
  else
  {
    NSLog(CFSTR("%s sent notification with no account store"), "-[ASKClient accountStoreDidChange:]");
  }

}

- (NSString)thinnedApplicationVariantIdentifier
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CFDA50], "thinnedAppVariantId");
}

- (NSString)activePairedWatchSystemVersion
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CFA168], "activePairedSystemVersion");
}

- (NSString)guid
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CFDA50], "deviceGUID");
}

id __44__ASKClient_getStorefrontIdentifierPromise___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v8;
  void *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(MEMORY[0x1E0CFDAF0], "ask_generalLogConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CFDAF0], "sharedConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "OSLogObject");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v2, "domain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v5;
    v10 = 1026;
    v11 = objc_msgSend(v2, "code");
    _os_log_impl(&dword_1D8328000, v4, OS_LOG_TYPE_ERROR, "Could not get local iTunes accountError domain=%{public}@, code=%{public}d", (uint8_t *)&v8, 0x12u);

  }
  objc_msgSend(MEMORY[0x1E0CFDBD8], "promiseWithError:", v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isActivityAvailable
{
  return CFPreferencesGetAppBooleanValue(CFSTR("SBIconVisibility"), CFSTR("com.apple.Fitness"), 0) != 0;
}

- (BOOL)isElectrocardiogramInstallationAllowed
{
  return 0;
}

- (BOOL)isCharonSupported
{
  return objc_msgSend(MEMORY[0x1E0CFA168], "isCharonSupported");
}

- (BOOL)isMandrakeSupported
{
  return objc_msgSend(MEMORY[0x1E0CFA168], "isMandrakeSupported");
}

- (BOOL)isActivePairedWatchSystemVersionAtLeastMajorVersion:(id)a3 minorVersion:(id)a4 patchVersion:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  BOOL v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  id v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v29;
  uint64_t v30;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0CFA168], "activePairedSystemVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "componentsSeparatedByString:", CFSTR("."));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "count"))
    {
      objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "integerValue");

    }
    else
    {
      v14 = 0;
    }
    if ((unint64_t)objc_msgSend(v12, "count") < 2)
    {
      v30 = 0;
    }
    else
    {
      objc_msgSend(v12, "objectAtIndexedSubscript:", 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v16, "integerValue");

    }
    v17 = v14;
    if ((unint64_t)objc_msgSend(v12, "count") < 3)
    {
      v19 = 0;
    }
    else
    {
      objc_msgSend(v12, "objectAtIndexedSubscript:", 2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "integerValue");

    }
    v20 = (int)objc_msgSend(v7, "toInt32");
    v21 = (int)objc_msgSend(v8, "toInt32");
    v22 = objc_msgSend(v9, "toInt32");
    v23 = v9;
    v24 = v7;
    v25 = v22;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld.%ld.%ld"), v17, v30, v19);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v25;
    v7 = v24;
    v9 = v23;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld.%ld.%ld"), v20, v21, v29);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v26, "compare:options:", v27, 64) != -1;

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)isPairedSystemVersionAtLeast:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  _BOOL8 v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CBE0F0], "currentContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("%s called with no active JSContext"), "-[ASKClient isPairedSystemVersionAtLeast:]");
  if ((objc_msgSend(v3, "isString") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CFA168], "activePairedSystemVersion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    __42__ASKClient_isPairedSystemVersionAtLeast___block_invoke((uint64_t)v5, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v3, "toString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      __42__ASKClient_isPairedSystemVersionAtLeast___block_invoke((uint64_t)v7, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v6, "compare:options:", v8, 64) != -1;

      v10 = (void *)MEMORY[0x1E0CBE108];
      v11 = v9;
    }
    else
    {
      v10 = (void *)MEMORY[0x1E0CBE108];
      v11 = 0;
    }
    objc_msgSend(v10, "valueWithBool:inContext:", v11, v4);
    v13 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CBE108], "valueWithNewErrorFromMessage:inContext:", v6, v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setException:", v12);

    objc_msgSend(MEMORY[0x1E0CBE108], "valueWithUndefinedInContext:", v4);
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v14 = (void *)v13;

  return v14;
}

id __42__ASKClient_isPairedSystemVersionAtLeast___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  id v8;
  unint64_t v9;

  v2 = a2;
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "componentsSeparatedByString:", CFSTR("."));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");
    if (v5 < 4)
    {
      v9 = v5 - 3;
      if (v5 == 3)
      {
        v8 = v3;
LABEL_12:

        goto LABEL_13;
      }
      v7 = (void *)objc_msgSend(v4, "mutableCopy");
      do
        objc_msgSend(v7, "addObject:", CFSTR("0"));
      while (!__CFADD__(v9++, 1));
      v6 = v7;
    }
    else
    {
      objc_msgSend(v4, "subarrayWithRange:", 0, 3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
    }
    objc_msgSend(v6, "componentsJoinedByString:", CFSTR("."));
    v8 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_12;
  }
  v8 = 0;
LABEL_13:

  return v8;
}

- (BOOL)deletableSystemAppCanBeInstalledOnWatchWithBundleID:(id)a3
{
  return 1;
}

- (BOOL)canDevicePerformAppAction:(id)a3 withAppCapabilities:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  char v8;

  v5 = a3;
  v6 = a4;
  if (!objc_msgSend(v6, "count") || !objc_msgSend(v5, "length"))
    goto LABEL_14;
  if ((objc_msgSend(CFSTR("install"), "isEqualToString:", v5) & 1) == 0)
  {
    if ((objc_msgSend(CFSTR("update"), "isEqualToString:", v5) & 1) != 0)
    {
      v7 = 1;
      goto LABEL_13;
    }
    if ((objc_msgSend(CFSTR("restore"), "isEqualToString:", v5) & 1) != 0)
    {
      v7 = 2;
      goto LABEL_13;
    }
    if ((objc_msgSend(CFSTR("launch"), "isEqualToString:", v5) & 1) != 0)
    {
      v7 = 3;
      goto LABEL_13;
    }
    if (objc_msgSend(CFSTR("advertise"), "isEqualToString:", v5))
    {
      v7 = 4;
      goto LABEL_13;
    }
LABEL_14:
    v8 = 1;
    goto LABEL_15;
  }
  v7 = 0;
LABEL_13:
  v8 = objc_msgSend(MEMORY[0x1E0CF9C98], "isCapableOfAction:capabilities:", v7, v6);
LABEL_15:

  return v8;
}

- (BOOL)isAutomaticDownloadingEnabled
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ams_activeiTunesAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "accountPropertyForKey:", CFSTR("automaticDownloadKinds"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", CFSTR("software"));

  return v5;
}

- (BOOL)isAuthorizedForUserNotifications
{
  return -[ASKClient currentNotificationAuthorizationStatus](self, "currentNotificationAuthorizationStatus") == 2;
}

- (int64_t)currentNotificationAuthorizationStatus
{
  return self->_currentNotificationAuthorizationStatus;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storefrontIdentifierPromise, 0);
}

@end
