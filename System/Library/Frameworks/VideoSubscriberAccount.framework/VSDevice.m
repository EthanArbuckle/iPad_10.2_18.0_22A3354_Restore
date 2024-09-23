@implementation VSDevice

+ (id)currentDevice
{
  if (currentDevice___vs_lazy_init_predicate != -1)
    dispatch_once(&currentDevice___vs_lazy_init_predicate, &__block_literal_global_49);
  return (id)currentDevice___vs_lazy_init_variable;
}

void __25__VSDevice_currentDevice__block_invoke()
{
  VSDevice *v0;
  void *v1;

  v0 = objc_alloc_init(VSDevice);
  v1 = (void *)currentDevice___vs_lazy_init_variable;
  currentDevice___vs_lazy_init_variable = (uint64_t)v0;

}

- (VSDevice)init
{
  VSDevice *v2;
  VSDevice *v3;
  NSOperationQueue *v4;
  NSOperationQueue *privateQueue;
  NSOperationQueue *v6;
  NSOperationQueue *propertyFetchQueue;
  dispatch_queue_t v8;
  OS_dispatch_queue *notificationQueue;
  NSMutableSet *v10;
  NSMutableSet *observers;
  VSPreferences *v12;
  VSPreferences *preferences;
  uint64_t v14;
  VSManagedProfileConnection *profileConnection;
  id newDeveloperSettingsFetchOperationBlock;
  VSRemoteNotifier *v17;
  VSRemoteNotifier *setTopBoxStateRemoteNotifier;
  VSRemoteNotifier *v19;
  VSRemoteNotifier *developerSettingsRemoteNotifier;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)VSDevice;
  v2 = -[VSDevice init](&v22, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_copyAnswer = (void *)MEMORY[0x1E0DE2B20];
    v4 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    privateQueue = v3->_privateQueue;
    v3->_privateQueue = v4;

    -[NSOperationQueue setName:](v3->_privateQueue, "setName:", CFSTR("VSDevice"));
    v6 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    propertyFetchQueue = v3->_propertyFetchQueue;
    v3->_propertyFetchQueue = v6;

    -[NSOperationQueue setName:](v3->_propertyFetchQueue, "setName:", CFSTR("VSDevice - PropertyFetch"));
    -[NSOperationQueue setMaxConcurrentOperationCount:](v3->_propertyFetchQueue, "setMaxConcurrentOperationCount:", 1);
    v8 = dispatch_queue_create(0, 0);
    notificationQueue = v3->_notificationQueue;
    v3->_notificationQueue = (OS_dispatch_queue *)v8;

    v10 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    observers = v3->_observers;
    v3->_observers = v10;

    v12 = objc_alloc_init(VSPreferences);
    preferences = v3->_preferences;
    v3->_preferences = v12;

    +[VSManagedProfileConnection sharedConnection](VSManagedProfileConnection, "sharedConnection");
    v14 = objc_claimAutoreleasedReturnValue();
    profileConnection = v3->_profileConnection;
    v3->_profileConnection = (VSManagedProfileConnection *)v14;

    -[VSManagedProfileConnection registerObserver:](v3->_profileConnection, "registerObserver:", v3);
    newDeveloperSettingsFetchOperationBlock = v3->_newDeveloperSettingsFetchOperationBlock;
    v3->_newDeveloperSettingsFetchOperationBlock = &__block_literal_global_50_0;

    v17 = -[VSRemoteNotifier initWithNotificationName:]([VSRemoteNotifier alloc], "initWithNotificationName:", CFSTR("VSSetTopBoxStateChangedNotification"));
    setTopBoxStateRemoteNotifier = v3->_setTopBoxStateRemoteNotifier;
    v3->_setTopBoxStateRemoteNotifier = v17;

    v19 = -[VSRemoteNotifier initWithNotificationName:]([VSRemoteNotifier alloc], "initWithNotificationName:", CFSTR("VSDeveloperServiceSettingsDidChangeNotification"));
    developerSettingsRemoteNotifier = v3->_developerSettingsRemoteNotifier;
    v3->_developerSettingsRemoteNotifier = v19;

    -[VSRemoteNotifier setDelegate:](v3->_developerSettingsRemoteNotifier, "setDelegate:", v3);
  }
  return v3;
}

VSDeveloperSettingsFetchOperation *__16__VSDevice_init__block_invoke()
{
  return objc_alloc_init(VSDeveloperSettingsFetchOperation);
}

- (void)setProfileConnection:(id)a3
{
  VSManagedProfileConnection *v4;
  VSManagedProfileConnection *profileConnection;
  VSManagedProfileConnection *v6;

  v4 = (VSManagedProfileConnection *)a3;
  -[VSManagedProfileConnection unregisterObserver:](self->_profileConnection, "unregisterObserver:", self);
  profileConnection = self->_profileConnection;
  self->_profileConnection = v4;
  v6 = v4;

  -[VSManagedProfileConnection registerObserver:](self->_profileConnection, "registerObserver:", self);
}

- (void)registerObserver:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[VSDevice notificationQueue](self, "notificationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__VSDevice_registerObserver___block_invoke;
  block[3] = &unk_1E939F138;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

void __29__VSDevice_registerObserver___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "observers");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

}

- (void)unregisterObserver:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[VSDevice notificationQueue](self, "notificationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__VSDevice_unregisterObserver___block_invoke;
  block[3] = &unk_1E939F138;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

void __31__VSDevice_unregisterObserver___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "observers");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 40));

}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[VSDevice profileConnection](self, "profileConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unregisterObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)VSDevice;
  -[VSDevice dealloc](&v5, sel_dealloc);
}

- (id)developerIdentityProviderDeletionConfirmationMessage
{
  void *v2;
  void *v3;
  const __CFString *v4;
  void *v5;

  switch(-[VSDevice deviceType](self, "deviceType"))
  {
    case 0uLL:
      objc_msgSend(MEMORY[0x1E0CB34D0], "vs_frameworkBundle");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = v2;
      v4 = CFSTR("DEVELOPER_DELETION_CONFIRMATION_QUESTION_GENERIC");
      goto LABEL_7;
    case 1uLL:
      objc_msgSend(MEMORY[0x1E0CB34D0], "vs_frameworkBundle");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = v2;
      v4 = CFSTR("DEVELOPER_DELETION_CONFIRMATION_QUESTION_PHONE");
      goto LABEL_7;
    case 2uLL:
      objc_msgSend(MEMORY[0x1E0CB34D0], "vs_frameworkBundle");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = v2;
      v4 = CFSTR("DEVELOPER_DELETION_CONFIRMATION_QUESTION_PAD");
      goto LABEL_7;
    case 3uLL:
      objc_msgSend(MEMORY[0x1E0CB34D0], "vs_frameworkBundle");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = v2;
      v4 = CFSTR("DEVELOPER_DELETION_CONFIRMATION_QUESTION_POD");
      goto LABEL_7;
    case 4uLL:
      objc_msgSend(MEMORY[0x1E0CB34D0], "vs_frameworkBundle");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = v2;
      v4 = CFSTR("DEVELOPER_DELETION_CONFIRMATION_QUESTION_TV");
LABEL_7:
      objc_msgSend(v2, "localizedStringForKey:value:table:", v4, 0, 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v5)
        goto LABEL_8;
      return v5;
    default:
LABEL_8:
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The question parameter must not be nil."));
      v5 = 0;
      return v5;
  }
}

- (id)accountDeletionConfirmationMessageForIdentityProviderDisplayName:(id)a3
{
  id v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;

  v4 = a3;
  v5 = objc_msgSend(v4, "length");
  v6 = -[VSDevice deviceType](self, "deviceType");
  if (!v5)
  {
    if (v6 >= 4)
    {
      if (v6 != 4)
        goto LABEL_15;
      objc_msgSend(MEMORY[0x1E0CB34D0], "vs_frameworkBundle");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      v11 = CFSTR("DELETE_ACCOUNT_CONFIRMATION_MESSAGE_TV");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "vs_frameworkBundle");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      v11 = CFSTR("DELETE_ACCOUNT_CONFIRMATION_MESSAGE_GENERIC");
    }
    objc_msgSend(v9, "localizedStringForKey:value:table:", v11, 0, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
      goto LABEL_16;
LABEL_15:
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The message parameter must not be nil."));
    v13 = 0;
    goto LABEL_16;
  }
  if (v6 < 4)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "vs_frameworkBundle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("DELETE_ACCOUNT_CONFIRMATION_MESSAGE_FORMAT_GENERIC"), 0, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (v6 == 4)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "vs_frameworkBundle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("DELETE_ACCOUNT_CONFIRMATION_MESSAGE_FORMAT_TV"), 0, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v7, v4);
    v8 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v13 = (void *)v8;

    if (v13)
      goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The message parameter must not be nil."));
  v13 = 0;
LABEL_10:
  if (!v13)
    goto LABEL_15;
LABEL_16:

  return v13;
}

- (void)fetchSetTopBoxProfileWithCompletion:(id)a3
{
  id v4;
  void (**v5)(void);
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  VSDevice *v15;
  id v16;

  v4 = a3;
  -[VSDevice newDeveloperSettingsFetchOperationBlock](self, "newDeveloperSettingsFetchOperationBlock");
  v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v5[2]();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0CB34C8];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __48__VSDevice_fetchSetTopBoxProfileWithCompletion___block_invoke;
  v13[3] = &unk_1E939F1F8;
  v14 = v6;
  v15 = self;
  v16 = v4;
  v8 = v4;
  v9 = v6;
  objc_msgSend(v7, "blockOperationWithBlock:", v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addDependency:", v9);
  -[VSDevice privateQueue](self, "privateQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addOperation:", v9);

  -[VSDevice privateQueue](self, "privateQueue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addOperation:", v10);

}

void __48__VSDevice_fetchSetTopBoxProfileWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[5];
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "result");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "forceUnwrapObject");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v3 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__VSDevice_fetchSetTopBoxProfileWithCompletion___block_invoke_2;
  v8[3] = &unk_1E93A0DA8;
  v4 = *(void **)(a1 + 48);
  v8[4] = *(_QWORD *)(a1 + 40);
  v9 = v4;
  v6[0] = v3;
  v6[1] = 3221225472;
  v6[2] = __48__VSDevice_fetchSetTopBoxProfileWithCompletion___block_invoke_3;
  v6[3] = &unk_1E939F2C0;
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v5, "unwrapObject:error:", v8, v6);

}

void __48__VSDevice_fetchSetTopBoxProfileWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  VSSetTopBoxProfile *v15;
  id v16;

  v16 = a2;
  objc_msgSend(*(id *)(a1 + 32), "preferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "ignoreSetTopBoxProfile");

  objc_msgSend(*(id *)(a1 + 32), "profileConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "providerUniqueID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v16, "isInSetTopBoxMode") & 1) == 0 && !v6)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    goto LABEL_22;
  }
  v7 = objc_msgSend(v16, "isInSetTopBoxMode");
  if (!(_DWORD)v7)
  {
    if ((v4 & 1) != 0)
    {
      v10 = 0;
      v11 = 0;
      v9 = &stru_1E93A8CC0;
    }
    else
    {
      if (!v6)
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The providerIDOrNil parameter must not be nil."));
      v9 = v6;
      objc_msgSend(*(id *)(a1 + 32), "profileConnection");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "userToken");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "preferences");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setTopBoxActivationTime");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_18;
  }
  objc_msgSend(v16, "setTopBoxIdentityProviderID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The [settings setTopBoxIdentityProviderID] parameter must not be nil."));
  objc_msgSend(v16, "setTopBoxIdentityProviderID");
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v16, "setTopBoxUseDeviceProfile"))
  {
    objc_msgSend(v16, "setTopBoxUserToken");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:
    v10 = 0;
    goto LABEL_18;
  }
  if ((v4 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "profileConnection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "userToken");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_17;
  }
  v10 = 0;
  v11 = 0;
LABEL_18:
  if (-[__CFString length](v9, "length"))
  {
    v15 = -[VSSetTopBoxProfile initWithProviderID:userToken:activationTime:isDeveloper:]([VSSetTopBoxProfile alloc], "initWithProviderID:userToken:activationTime:isDeveloper:", v9, v11, v10, v7);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

LABEL_22:
}

uint64_t __48__VSDevice_fetchSetTopBoxProfileWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchDeviceManagedSetTopBoxProfileWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  VSSetTopBoxProfile *v13;
  void *v14;
  void *v15;
  void (**v16)(id, VSSetTopBoxProfile *);

  v16 = (void (**)(id, VSSetTopBoxProfile *))a3;
  -[VSDevice profileConnection](self, "profileConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "providerUniqueID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5
    && (-[VSDevice preferences](self, "preferences"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "ignoreSetTopBoxProfile"),
        v6,
        (v7 & 1) == 0))
  {
    v8 = v5;
    -[VSDevice profileConnection](self, "profileConnection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "userToken");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The [[self profileConnection] userToken] parameter must not be nil."));
    -[VSDevice profileConnection](self, "profileConnection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "userToken");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_alloc_init(VSSetTopBoxProfile);
    -[VSSetTopBoxProfile setProviderID:](v13, "setProviderID:", v8);

    -[VSSetTopBoxProfile setUserToken:](v13, "setUserToken:", v12);
    -[VSSetTopBoxProfile setIsDeveloper:](v13, "setIsDeveloper:", 0);
    -[VSDevice preferences](self, "preferences");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTopBoxActivationTime");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSSetTopBoxProfile setActivationTime:](v13, "setActivationTime:", v15);

    v16[2](v16, v13);
  }
  else
  {
    v16[2](v16, 0);
  }

}

+ (BOOL)_runningAnInternalBuildWithCopyAnswer:(void *)a3
{
  return objc_msgSend(a1, "_getMobileGestaltBoolean:withCopyAnswer:", CFSTR("InternalBuild"), a3);
}

- (BOOL)isRunningAnInternalBuild
{
  return objc_msgSend((id)objc_opt_class(), "_runningAnInternalBuildWithCopyAnswer:", -[VSDevice copyAnswer](self, "copyAnswer"));
}

+ (BOOL)_runningACustomerBuildWithCopyAnswer:(void *)a3
{
  const void *v3;

  if (!a3)
    return 1;
  v3 = (const void *)((uint64_t (*)(const __CFString *, _QWORD))a3)(CFSTR("ReleaseType"), 0);
  if (!v3)
    return 1;
  CFRelease(v3);
  return 0;
}

- (BOOL)isRunningACustomerBuild
{
  return objc_msgSend((id)objc_opt_class(), "_runningACustomerBuildWithCopyAnswer:", -[VSDevice copyAnswer](self, "copyAnswer"));
}

+ (BOOL)_getMobileGestaltBoolean:(__CFString *)a3 withCopyAnswer:(void *)a4
{
  const __CFBoolean *v4;
  const __CFBoolean *v5;
  CFTypeID v6;
  BOOL v7;

  if (!a4)
    return 0;
  v4 = (const __CFBoolean *)((uint64_t (*)(__CFString *, _QWORD))a4)(a3, 0);
  if (!v4)
    return 0;
  v5 = v4;
  v6 = CFGetTypeID(v4);
  v7 = v6 == CFBooleanGetTypeID() && CFBooleanGetValue(v5) != 0;
  CFRelease(v5);
  return v7;
}

+ (unint64_t)_deviceTypeWithCopyAnswer:(void *)a3
{
  const void *v3;
  const void *v4;
  CFTypeID v5;
  unint64_t v6;

  if (!a3)
    return 0;
  v3 = (const void *)((uint64_t (*)(const __CFString *, _QWORD))a3)(CFSTR("DeviceClass"), 0);
  if (!v3)
    return 0;
  v4 = v3;
  v5 = CFGetTypeID(v3);
  if (v5 == CFStringGetTypeID())
  {
    if (CFEqual(v4, CFSTR("iPhone")))
    {
      v6 = 1;
    }
    else if (CFEqual(v4, CFSTR("iPod")))
    {
      v6 = 3;
    }
    else if (CFEqual(v4, CFSTR("iPad")))
    {
      v6 = 2;
    }
    else if (CFEqual(v4, CFSTR("AppleTV")))
    {
      v6 = 4;
    }
    else if (CFEqual(v4, CFSTR("RealityDevice")))
    {
      v6 = 5;
    }
    else
    {
      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
  }
  CFRelease(v4);
  return v6;
}

- (unint64_t)deviceType
{
  return objc_msgSend((id)objc_opt_class(), "_deviceTypeWithCopyAnswer:", -[VSDevice copyAnswer](self, "copyAnswer"));
}

- (BOOL)setIgnoreSetTopBoxProfile:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  int v6;
  VSDeveloperServiceConnection *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  VSDevice *v15;
  id v16;
  id buf[2];

  v3 = a3;
  -[VSDevice preferences](self, "preferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIgnoreSetTopBoxProfile:", v3);
  v6 = objc_msgSend(v5, "ignoreSetTopBoxProfile") ^ v3;
  if (v6 == 1)
  {
    VSDefaultLogObject();
    v7 = (VSDeveloperServiceConnection *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v7->super, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1D2419000, &v7->super, OS_LOG_TYPE_DEFAULT, "IgnoreSetTopBoxProfile default value does not match written value.", (uint8_t *)buf, 2u);
    }
  }
  else
  {
    v7 = objc_alloc_init(VSDeveloperServiceConnection);
    -[VSDeveloperServiceConnection serviceWithErrorHandler:](v7, "serviceWithErrorHandler:", &__block_literal_global_108);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(buf, v8);
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __38__VSDevice_setIgnoreSetTopBoxProfile___block_invoke_109;
    v14 = &unk_1E93A0E58;
    objc_copyWeak(&v16, buf);
    v15 = self;
    objc_msgSend(v8, "fetchDeveloperSettingsWithCompletionHandler:", &v11);
    -[VSDevice setTopBoxStateRemoteNotifier](self, "setTopBoxStateRemoteNotifier", v11, v12, v13, v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "postNotification");

    objc_destroyWeak(&v16);
    objc_destroyWeak(buf);

  }
  return v6 ^ 1;
}

void __38__VSDevice_setIgnoreSetTopBoxProfile___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  VSErrorLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __38__VSDevice_setIgnoreSetTopBoxProfile___block_invoke_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

}

void __38__VSDevice_setIgnoreSetTopBoxProfile___block_invoke_109(uint64_t a1, void *a2)
{
  id v3;
  _QWORD v4[5];
  id v5;

  v3 = a2;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __38__VSDevice_setIgnoreSetTopBoxProfile___block_invoke_2;
  v4[3] = &unk_1E93A0E10;
  objc_copyWeak(&v5, (id *)(a1 + 40));
  v4[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "unwrapObject:error:", v4, &__block_literal_global_114);
  objc_destroyWeak(&v5);

}

void __38__VSDevice_setIgnoreSetTopBoxProfile___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id WeakRetained;
  void *v6;
  _QWORD v7[5];

  v3 = a2;
  if (objc_msgSend(v3, "setTopBoxUseDeviceProfile"))
  {
    v4 = (void *)objc_msgSend(v3, "copy");
    objc_msgSend(v4, "setSetTopBoxUseDeviceProfile:", 0);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v6 = WeakRetained;
    if (WeakRetained)
    {
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __38__VSDevice_setIgnoreSetTopBoxProfile___block_invoke_3;
      v7[3] = &unk_1E939EDB8;
      v7[4] = *(_QWORD *)(a1 + 32);
      objc_msgSend(WeakRetained, "updateDeveloperSettings:completionHandler:", v4, v7);
    }

  }
}

uint64_t __38__VSDevice_setIgnoreSetTopBoxProfile___block_invoke_3(uint64_t a1, void *a2)
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __38__VSDevice_setIgnoreSetTopBoxProfile___block_invoke_4;
  v3[3] = &unk_1E93A0340;
  v3[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(a2, "unwrapObject:error:", v3, &__block_literal_global_111);
}

uint64_t __38__VSDevice_setIgnoreSetTopBoxProfile___block_invoke_4(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  VSDefaultLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D2419000, v2, OS_LOG_TYPE_DEFAULT, "Successfully updated developer settings after profile statae change.", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "cloudConfigurationDidChange");
}

void __38__VSDevice_setIgnoreSetTopBoxProfile___block_invoke_110(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  VSErrorLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __38__VSDevice_setIgnoreSetTopBoxProfile___block_invoke_110_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

}

void __38__VSDevice_setIgnoreSetTopBoxProfile___block_invoke_113(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  VSErrorLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __38__VSDevice_setIgnoreSetTopBoxProfile___block_invoke_113_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

}

- (void)refreshSetTopBoxProfile:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  +[VSManagedProfileConnection sharedConnection](VSManagedProfileConnection, "sharedConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __36__VSDevice_refreshSetTopBoxProfile___block_invoke;
  v6[3] = &unk_1E939F2C0;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "refreshProfileWithCompletion:", v6);

}

uint64_t __36__VSDevice_refreshSetTopBoxProfile___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)productVersion
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  -[VSDevice productVersionString](self, "productVersionString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __26__VSDevice_productVersion__block_invoke;
    v7[3] = &unk_1E939EE88;
    v7[4] = self;
    objc_msgSend(MEMORY[0x1E0CB34C8], "blockOperationWithBlock:", v7);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSDevice propertyFetchQueue](self, "propertyFetchQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addOperation:", v4);

    objc_msgSend(v4, "waitUntilFinished");
  }
  -[VSDevice productVersionString](self, "productVersionString");
  return (id)objc_claimAutoreleasedReturnValue();
}

void __26__VSDevice_productVersion__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "productVersionString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(v3, "_stringForKey:copyAnswer:", CFSTR("ProductVersion"), objc_msgSend(v3, "copyAnswer"));
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setProductVersionString:", v4);

  }
}

- (id)serialNumber
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  -[VSDevice serialNumberString](self, "serialNumberString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __24__VSDevice_serialNumber__block_invoke;
    v7[3] = &unk_1E939EE88;
    v7[4] = self;
    objc_msgSend(MEMORY[0x1E0CB34C8], "blockOperationWithBlock:", v7);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSDevice propertyFetchQueue](self, "propertyFetchQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addOperation:", v4);

    objc_msgSend(v4, "waitUntilFinished");
  }
  -[VSDevice serialNumberString](self, "serialNumberString");
  return (id)objc_claimAutoreleasedReturnValue();
}

void __24__VSDevice_serialNumber__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "serialNumberString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(v3, "_stringForKey:copyAnswer:", CFSTR("SerialNumber"), objc_msgSend(v3, "copyAnswer"));
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setSerialNumberString:", v4);

  }
}

- (id)name
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  -[VSDevice deviceNameString](self, "deviceNameString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __16__VSDevice_name__block_invoke;
    v7[3] = &unk_1E939EE88;
    v7[4] = self;
    objc_msgSend(MEMORY[0x1E0CB34C8], "blockOperationWithBlock:", v7);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSDevice propertyFetchQueue](self, "propertyFetchQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addOperation:", v4);

    objc_msgSend(v4, "waitUntilFinished");
  }
  -[VSDevice deviceNameString](self, "deviceNameString");
  return (id)objc_claimAutoreleasedReturnValue();
}

void __16__VSDevice_name__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "deviceNameString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(v3, "_stringForKey:copyAnswer:", CFSTR("UserAssignedDeviceName"), objc_msgSend(v3, "copyAnswer"));
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setDeviceNameString:", v4);

  }
}

- (id)_stringForKey:(__CFString *)a3 copyAnswer:(void *)a4
{
  VSWaitGroup *v7;
  void *v8;
  VSWaitGroup *v9;
  id v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  VSWaitGroup *v16;
  uint64_t *v17;
  void *v18;
  __CFString *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__14;
  v24 = __Block_byref_object_dispose__14;
  v25 = 0;
  v7 = objc_alloc_init(VSWaitGroup);
  -[VSWaitGroup enter](v7, "enter");
  -[VSDevice privateQueue](self, "privateQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __37__VSDevice__stringForKey_copyAnswer___block_invoke;
  v15 = &unk_1E93A0E80;
  v18 = a4;
  v19 = a3;
  v17 = &v20;
  v9 = v7;
  v16 = v9;
  objc_msgSend(v8, "addOperationWithBlock:", &v12);

  -[VSWaitGroup wait](v9, "wait", v12, v13, v14, v15);
  v10 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
  return v10;
}

uint64_t __37__VSDevice__stringForKey_copyAnswer___block_invoke(uint64_t a1)
{
  uint64_t (*v2)(_QWORD, _QWORD);
  const void *v3;
  const void *v4;
  CFTypeID v5;
  uint64_t v6;
  void *v7;

  v2 = *(uint64_t (**)(_QWORD, _QWORD))(a1 + 48);
  if (v2)
  {
    v3 = (const void *)v2(*(_QWORD *)(a1 + 56), 0);
    if (v3)
    {
      v4 = v3;
      v5 = CFGetTypeID(v3);
      if (v5 == CFStringGetTypeID())
      {
        v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v7 = *(void **)(v6 + 40);
        *(_QWORD *)(v6 + 40) = v4;

      }
    }
  }
  return objc_msgSend(*(id *)(a1 + 32), "leave");
}

- (void)cloudConfigurationDidChange
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  _QWORD block[5];
  uint8_t buf[16];

  VSDefaultLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D2419000, v3, OS_LOG_TYPE_DEFAULT, "Received cloud configuration did change notification.", buf, 2u);
  }

  -[VSDevice setTopBoxStateRemoteNotifier](self, "setTopBoxStateRemoteNotifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotification");

  -[VSDevice notificationQueue](self, "notificationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__VSDevice_cloudConfigurationDidChange__block_invoke;
  block[3] = &unk_1E939EE88;
  block[4] = self;
  dispatch_async(v5, block);

}

void __39__VSDevice_cloudConfigurationDidChange__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "observers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "deviceSetTopBoxProfileChanged:", *(_QWORD *)(a1 + 32));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (id)stringForAMSPlatform
{
  unint64_t v2;

  v2 = -[VSDevice deviceType](self, "deviceType");
  if (v2 > 5)
    return CFSTR("ipad");
  else
    return off_1E93A0EA0[v2];
}

- (id)stringForAMSPlatformAttributes
{
  unint64_t v2;

  v2 = -[VSDevice deviceType](self, "deviceType");
  if (v2 > 5)
    return CFSTR("appletvos");
  else
    return off_1E93A0ED0[v2];
}

- (id)stringForAMSDeviceFamilies
{
  unint64_t v2;

  v2 = -[VSDevice deviceType](self, "deviceType");
  if (v2 > 4)
    return CFSTR("xros");
  else
    return off_1E93A0F00[v2];
}

- (NSString)bincompatOS
{
  if (-[VSDevice deviceType](self, "deviceType") == 5)
    return (NSString *)CFSTR("ios");
  else
    return 0;
}

- (NSString)bincompatPlatform
{
  if (-[VSDevice deviceType](self, "deviceType") == 5)
    return (NSString *)CFSTR("ipad");
  else
    return 0;
}

- (void)remoteNotifier:(id)a3 didReceiveRemoteNotificationWithUserInfo:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  -[VSDevice developerSettingsRemoteNotifier](self, "developerSettingsRemoteNotifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v5)
    -[VSDevice cloudConfigurationDidChange](self, "cloudConfigurationDidChange");
}

- (OS_dispatch_queue)notificationQueue
{
  return self->_notificationQueue;
}

- (void)setNotificationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_notificationQueue, a3);
}

- (NSMutableSet)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (NSString)productVersionString
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setProductVersionString:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSString)serialNumberString
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSerialNumberString:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSString)deviceNameString
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDeviceNameString:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSOperationQueue)propertyFetchQueue
{
  return self->_propertyFetchQueue;
}

- (void)setPropertyFetchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_propertyFetchQueue, a3);
}

- (void)copyAnswer
{
  return self->_copyAnswer;
}

- (void)setCopyAnswer:(void *)a3
{
  self->_copyAnswer = a3;
}

- (NSOperationQueue)privateQueue
{
  return self->_privateQueue;
}

- (void)setPrivateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_privateQueue, a3);
}

- (VSPreferences)preferences
{
  return self->_preferences;
}

- (void)setPreferences:(id)a3
{
  objc_storeStrong((id *)&self->_preferences, a3);
}

- (id)newDeveloperSettingsFetchOperationBlock
{
  return self->_newDeveloperSettingsFetchOperationBlock;
}

- (void)setNewDeveloperSettingsFetchOperationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (VSManagedProfileConnection)profileConnection
{
  return self->_profileConnection;
}

- (VSRemoteNotifier)setTopBoxStateRemoteNotifier
{
  return self->_setTopBoxStateRemoteNotifier;
}

- (void)setSetTopBoxStateRemoteNotifier:(id)a3
{
  objc_storeStrong((id *)&self->_setTopBoxStateRemoteNotifier, a3);
}

- (VSRemoteNotifier)developerSettingsRemoteNotifier
{
  return self->_developerSettingsRemoteNotifier;
}

- (void)setDeveloperSettingsRemoteNotifier:(id)a3
{
  objc_storeStrong((id *)&self->_developerSettingsRemoteNotifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_developerSettingsRemoteNotifier, 0);
  objc_storeStrong((id *)&self->_setTopBoxStateRemoteNotifier, 0);
  objc_storeStrong((id *)&self->_profileConnection, 0);
  objc_storeStrong(&self->_newDeveloperSettingsFetchOperationBlock, 0);
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong((id *)&self->_privateQueue, 0);
  objc_storeStrong((id *)&self->_propertyFetchQueue, 0);
  objc_storeStrong((id *)&self->_deviceNameString, 0);
  objc_storeStrong((id *)&self->_serialNumberString, 0);
  objc_storeStrong((id *)&self->_productVersionString, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
}

void __38__VSDevice_setIgnoreSetTopBoxProfile___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1D2419000, a2, a3, "Error with developer service connection: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

void __38__VSDevice_setIgnoreSetTopBoxProfile___block_invoke_110_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1D2419000, a2, a3, "Error updating developer settings after profile state change: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

void __38__VSDevice_setIgnoreSetTopBoxProfile___block_invoke_113_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1D2419000, a2, a3, "Error fetching developer settings to update profile state: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

@end
