@implementation LACBiometryHelper

+ (id)sharedInstance
{
  uint64_t v2;
  void *v3;

  if (!sharedInstance_sharedInstance_0)
  {
    if (+[LACMobileGestalt deviceHasFaceID](LACMobileGestalt, "deviceHasFaceID"))
      +[LACBiometryHelper faceIdInstance](LACBiometryHelper, "faceIdInstance");
    else
      +[LACBiometryHelper touchIdInstance](LACBiometryHelper, "touchIdInstance");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)sharedInstance_sharedInstance_0;
    sharedInstance_sharedInstance_0 = v2;

  }
  return (id)sharedInstance_sharedInstance_0;
}

+ (id)touchIdInstance
{
  void *v2;
  LACBiometryHelper *v3;
  void *v4;

  v2 = (void *)touchIdInstance_touchIdInstance;
  if (!touchIdInstance_touchIdInstance)
  {
    v3 = -[LACBiometryHelper initWithBiometryType:]([LACBiometryHelper alloc], "initWithBiometryType:", 1);
    v4 = (void *)touchIdInstance_touchIdInstance;
    touchIdInstance_touchIdInstance = (uint64_t)v3;

    v2 = (void *)touchIdInstance_touchIdInstance;
  }
  return v2;
}

+ (id)faceIdInstance
{
  void *v2;
  LACBiometryHelper *v3;
  void *v4;

  v2 = (void *)faceIdInstance_faceIdInstance;
  if (!faceIdInstance_faceIdInstance)
  {
    v3 = -[LACBiometryHelper initWithBiometryType:]([LACBiometryHelper alloc], "initWithBiometryType:", 2);
    v4 = (void *)faceIdInstance_faceIdInstance;
    faceIdInstance_faceIdInstance = (uint64_t)v3;

    v2 = (void *)faceIdInstance_faceIdInstance;
  }
  return v2;
}

- (LACBiometryHelper)initWithBiometryType:(int64_t)a3
{
  LACBiometryHelper *v4;
  LACBiometryHelper *v5;
  uint64_t v6;
  NSHashTable *observers;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)LACBiometryHelper;
  v4 = -[LACBiometryHelper init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_deviceType = a3;
    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v6 = objc_claimAutoreleasedReturnValue();
    observers = v5->_observers;
    v5->_observers = (NSHashTable *)v6;

    -[LACBiometryHelper _setup](v5, "_setup");
  }
  return v5;
}

- (void)_setup
{
  void *v3;
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint8_t v24[128];
  __int128 buf;
  Class (*v26)(uint64_t);
  void *v27;
  uint64_t *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  if (+[LACMobileGestalt isSharedIPad](LACMobileGestalt, "isSharedIPad"))
  {
    +[LACError errorWithCode:debugDescription:](LACError, "errorWithCode:debugDescription:", -6, CFSTR("Biometry not supported in Shared iPad mode"));
    v15 = (id)objc_claimAutoreleasedReturnValue();
    -[LACBiometryHelper _setupWithPermanentError:](self, "_setupWithPermanentError:", v15);

  }
  else
  {
    v20 = 0;
    v21 = &v20;
    v22 = 0x2050000000;
    v3 = (void *)getBKDeviceManagerClass_softClass;
    v23 = getBKDeviceManagerClass_softClass;
    if (!getBKDeviceManagerClass_softClass)
    {
      *(_QWORD *)&buf = MEMORY[0x24BDAC760];
      *((_QWORD *)&buf + 1) = 3221225472;
      v26 = __getBKDeviceManagerClass_block_invoke;
      v27 = &unk_2510C0B58;
      v28 = &v20;
      __getBKDeviceManagerClass_block_invoke((uint64_t)&buf);
      v3 = (void *)v21[3];
    }
    v4 = objc_retainAutorelease(v3);
    _Block_object_dispose(&v20, 8);
    if (v4)
    {
      objc_msgSend(v4, "availableDevices");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        LACLogBiometry();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 138412290;
          *(_QWORD *)((char *)&buf + 4) = v5;
          _os_log_impl(&dword_2409DC000, v6, OS_LOG_TYPE_DEFAULT, "Available devices: %@", (uint8_t *)&buf, 0xCu);
        }

        if (objc_msgSend(v5, "count")
          || !-[LACBiometryHelper _shouldRetryAvailableDevices](self, "_shouldRetryAvailableDevices"))
        {
          v18 = 0u;
          v19 = 0u;
          v16 = 0u;
          v17 = 0u;
          v8 = v5;
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
          if (v9)
          {
            v10 = *(_QWORD *)v17;
            while (2)
            {
              for (i = 0; i != v9; ++i)
              {
                if (*(_QWORD *)v17 != v10)
                  objc_enumerationMutation(v8);
                v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
                v13 = objc_msgSend(v12, "type");
                if (v13 == -[LACBiometryHelper deviceType](self, "deviceType"))
                {
                  -[LACBiometryHelper _setupDeviceWithDescriptor:](self, "_setupDeviceWithDescriptor:", v12);

                  goto LABEL_24;
                }
              }
              v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
              if (v9)
                continue;
              break;
            }
          }

          +[LACError errorWithCode:debugDescription:](LACError, "errorWithCode:debugDescription:", -6, CFSTR("Biometry is not available on this device."));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[LACBiometryHelper _setupWithPermanentError:](self, "_setupWithPermanentError:", v14);

        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unexpected failure to enumerate device of type %d"), -[LACBiometryHelper deviceType](self, "deviceType"));
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          -[LACBiometryHelper _setupWithFault:](self, "_setupWithFault:", v7);

        }
      }
      else
      {
        -[LACBiometryHelper _setupWithFault:](self, "_setupWithFault:", CFSTR("Failed to enumerate biometric devices"));
      }
LABEL_24:

    }
    else
    {
      -[LACBiometryHelper _setupWithFault:](self, "_setupWithFault:", CFSTR("Failed to acquire device manager class"));
    }
  }
}

- (BOOL)_shouldRetryAvailableDevices
{
  int64_t v3;
  NSObject *v5;

  v3 = -[LACBiometryHelper deviceType](self, "deviceType");
  if (v3 == 2)
    return +[LACMobileGestalt deviceHasFaceID](LACMobileGestalt, "deviceHasFaceID");
  if (v3 == 1)
    return +[LACMobileGestalt deviceHasTouchID](LACMobileGestalt, "deviceHasTouchID");
  LACLogBiometry();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    -[LACBiometryHelper _shouldRetryAvailableDevices].cold.1(self, v5);

  return 0;
}

- (void)_setupWithFault:(id)a3
{
  id v4;
  NSError *v5;
  NSError *fault;
  NSObject *v7;

  v4 = a3;
  +[LACError errorWithCode:debugDescription:](LACError, "errorWithCode:debugDescription:", -1000, v4);
  v5 = (NSError *)objc_claimAutoreleasedReturnValue();
  fault = self->_fault;
  self->_fault = v5;

  LACLogBiometry();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    -[LACBiometryHelper _setupWithFault:].cold.1();

}

- (void)_setupWithPermanentError:(id)a3
{
  objc_storeStrong((id *)&self->_permanentError, a3);
}

- (void)_setupDeviceWithDescriptor:(id)a3
{
  id v4;
  void *v5;
  id v6;
  BKDevice *v7;
  id v8;
  BKDevice *device;
  BKDevice *v10;
  void *v11;
  uint64_t v12;
  int64_t *v13;
  NSObject *v14;
  NSMutableDictionary *v15;
  NSMutableDictionary *databaseHashesByUserId;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  __int128 buf;
  Class (*v28)(uint64_t);
  void *v29;
  uint64_t *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2050000000;
  v5 = (void *)getBKDeviceClass_softClass;
  v26 = getBKDeviceClass_softClass;
  if (!getBKDeviceClass_softClass)
  {
    *(_QWORD *)&buf = MEMORY[0x24BDAC760];
    *((_QWORD *)&buf + 1) = 3221225472;
    v28 = __getBKDeviceClass_block_invoke;
    v29 = &unk_2510C0B58;
    v30 = &v23;
    __getBKDeviceClass_block_invoke((uint64_t)&buf);
    v5 = (void *)v24[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v23, 8);
  if (v6)
  {
    v22 = 0;
    objc_msgSend(v6, "deviceWithDescriptor:error:", v4, &v22);
    v7 = (BKDevice *)objc_claimAutoreleasedReturnValue();
    v8 = v22;
    device = self->_device;
    self->_device = v7;

    v10 = self->_device;
    if (v10)
    {
      -[BKDevice descriptor](v10, "descriptor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "type");

      if (v12 == 1)
      {
        v13 = &LACBiometryTypeTouchID;
LABEL_11:
        self->_biometryType = *v13;
        v15 = (NSMutableDictionary *)objc_opt_new();
        databaseHashesByUserId = self->_databaseHashesByUserId;
        self->_databaseHashesByUserId = v15;

        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)BiometricKitNotificationCallback, CFSTR("com.apple.BiometricKit.enrollmentChanged"), 0, (CFNotificationSuspensionBehavior)0);
        v18 = CFNotificationCenterGetDarwinNotifyCenter();
        CFNotificationCenterAddObserver(v18, self, (CFNotificationCallback)BiometricKitNotificationCallback, CFSTR("com.apple.BiometricKit.generalLockoutStateChanged"), 0, (CFNotificationSuspensionBehavior)0);
        LACLogBiometry();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v4, "type"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(buf) = 138412290;
          *(_QWORD *)((char *)&buf + 4) = v19;
          _os_log_impl(&dword_2409DC000, v14, OS_LOG_TYPE_DEFAULT, "Device created successfully with type: %@", (uint8_t *)&buf, 0xCu);

        }
        goto LABEL_14;
      }
      if (v12 == 2)
      {
        v13 = &LACBiometryTypeFaceID;
        goto LABEL_11;
      }
      v20 = (void *)MEMORY[0x24BDD17C8];
      -[BKDevice descriptor](self->_device, "descriptor");
      v14 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "stringWithFormat:", CFSTR("Unknown device type: %d"), -[NSObject type](v14, "type"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[LACBiometryHelper _setupWithFault:](self, "_setupWithFault:", v21);

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to create device with %@: %@"), v4, v8);
      v14 = objc_claimAutoreleasedReturnValue();
      -[LACBiometryHelper _setupWithFault:](self, "_setupWithFault:", v14);
    }
LABEL_14:

    goto LABEL_15;
  }
  -[LACBiometryHelper _setupWithFault:](self, "_setupWithFault:", CFSTR("Failed to acquire device class"));
LABEL_15:

}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v4;
  objc_super v5;

  if (self->_device)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.BiometricKit.enrollmentChanged"), 0);
    v4 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(v4, self, CFSTR("com.apple.BiometricKit.generalLockoutStateChanged"), 0);
  }
  v5.receiver = self;
  v5.super_class = (Class)LACBiometryHelper;
  -[LACBiometryHelper dealloc](&v5, sel_dealloc);
}

- (BOOL)deviceHasBiometryWithError:(id *)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  NSError *fault;
  void *v9;

  -[LACBiometryHelper permanentError](self, "permanentError");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[LACBiometryHelper permanentError](self, "permanentError");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[LACBiometryHelper fault](self, "fault");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      v9 = 0;
      if (!a3)
        goto LABEL_7;
      goto LABEL_6;
    }
    fault = self->_fault;
    self->_fault = 0;

    -[LACBiometryHelper _setup](self, "_setup");
    -[LACBiometryHelper fault](self, "fault");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v6;
  if (a3)
LABEL_6:
    *a3 = objc_retainAutorelease(v9);
LABEL_7:

  return v9 == 0;
}

- (OS_dispatch_queue)workQueue
{
  return +[LACConcurrencyUtilities daemonQueue](LACConcurrencyUtilities, "daemonQueue");
}

- (NSDictionary)adminIdentities
{
  void *v3;
  NSDictionary *identities;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;

  if (!-[NSDictionary count](self->_identities, "count"))
    return (NSDictionary *)0;
  v3 = (void *)objc_opt_new();
  identities = self->_identities;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __36__LACBiometryHelper_adminIdentities__block_invoke;
  v9[3] = &unk_2510C1560;
  v10 = v3;
  v5 = v3;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](identities, "enumerateKeysAndObjectsUsingBlock:", v9);
  if (objc_msgSend(v5, "count"))
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  return (NSDictionary *)v7;
}

void __36__LACBiometryHelper_adminIdentities__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  int v7;
  id v8;

  v8 = a2;
  v5 = a3;
  +[LACADMUser findUserByID:searchParent:](LACADMUser, "findUserByID:searchParent:", objc_msgSend(v8, "unsignedIntegerValue"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isAdministrator");

  if (v7)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v8);

}

- (BOOL)_isEnrolled:(id)a3 adminOnly:(BOOL)a4 hardwareMustBeAvailable:(BOOL)a5 error:(id *)a6
{
  id v9;
  _BOOL4 v10;
  id v11;
  _BOOL4 v12;
  uint64_t v14;
  uint64_t v15;
  BOOL (*v16)(uint64_t);
  void *v17;
  LACBiometryHelper *v18;
  id v19;
  BOOL v20;
  id v21;

  v9 = a3;
  v21 = 0;
  v10 = -[LACBiometryHelper deviceHasBiometryWithError:](self, "deviceHasBiometryWithError:", &v21);
  v11 = v21;
  if (v10)
  {
    v14 = MEMORY[0x24BDAC760];
    v15 = 3221225472;
    v16 = __73__LACBiometryHelper__isEnrolled_adminOnly_hardwareMustBeAvailable_error___block_invoke;
    v17 = &unk_2510C1588;
    v18 = self;
    v19 = v9;
    v20 = a4;
    v12 = __73__LACBiometryHelper__isEnrolled_adminOnly_hardwareMustBeAvailable_error___block_invoke((uint64_t)&v14);
    if (!v11)
    {
      -[LACBiometryHelper _errorDisconnected:notEnrolled:](self, "_errorDisconnected:notEnrolled:", 0, !v12, v14, v15, v16, v17, v18);
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  if (a6)
    *a6 = objc_retainAutorelease(v11);

  return v11 == 0;
}

BOOL __73__LACBiometryHelper__isEnrolled_adminOnly_hardwareMustBeAvailable_error___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  _BOOL8 v3;

  objc_msgSend(*(id *)(a1 + 32), "_identitiesForUser:adminOnly:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
    v3 = objc_msgSend(v1, "count") != 0;
  else
    v3 = 0;

  return v3;
}

- (id)_errorDisconnected:(BOOL)a3 notEnrolled:(BOOL)a4
{
  if (!a4)
    return 0;
  +[LACError errorWithCode:debugDescription:](LACError, "errorWithCode:debugDescription:", -7, CFSTR("No identities are enrolled."));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isEnrolled:(id)a3 error:(id *)a4
{
  return -[LACBiometryHelper _isEnrolled:adminOnly:hardwareMustBeAvailable:error:](self, "_isEnrolled:adminOnly:hardwareMustBeAvailable:error:", a3, 0, 1, a4);
}

- (BOOL)isAnyUserEnrolledWithError:(id *)a3
{
  return -[LACBiometryHelper _isEnrolled:adminOnly:hardwareMustBeAvailable:error:](self, "_isEnrolled:adminOnly:hardwareMustBeAvailable:error:", 0, 0, 1, a3);
}

- (BOOL)isEnrolledWithoutHardware:(id)a3 error:(id *)a4
{
  return -[LACBiometryHelper _isEnrolled:adminOnly:hardwareMustBeAvailable:error:](self, "_isEnrolled:adminOnly:hardwareMustBeAvailable:error:", a3, 0, 0, a4);
}

- (BOOL)isAnyUserEnrolledWithAdminRole:(BOOL)a3 error:(id *)a4
{
  return -[LACBiometryHelper _isEnrolled:adminOnly:hardwareMustBeAvailable:error:](self, "_isEnrolled:adminOnly:hardwareMustBeAvailable:error:", 0, a3, 1, a4);
}

- (id)lockoutErrorForState:(int64_t)a3 userId:(id)a4
{
  if ((unint64_t)(a3 - 1) > 7)
    +[LACError errorWithCode:subcode:debugDescription:](LACError, "errorWithCode:subcode:debugDescription:", -8, -1, CFSTR("Unknown lockout state"));
  else
    -[LACBiometryHelper _lockoutErrorForExtendedState:userId:](self, "_lockoutErrorForExtendedState:userId:", qword_240A7B9F0[a3 - 1], a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_biolockoutStateForUser:(id)a3 request:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  LACCacheSync *biolockoutStateCache;
  LACCacheSync *v11;
  LACCacheSync *v12;
  LACCacheSync *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  void *v18;
  _QWORD v20[5];
  id v21;
  id location;

  v8 = a3;
  v9 = a4;
  if (!-[LACBiometryHelper deviceHasBiometryWithError:](self, "deviceHasBiometryWithError:", a5))
    goto LABEL_11;
  biolockoutStateCache = self->_biolockoutStateCache;
  if (!biolockoutStateCache)
  {
    objc_initWeak(&location, self);
    v11 = [LACCacheSync alloc];
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __59__LACBiometryHelper__biolockoutStateForUser_request_error___block_invoke;
    v20[3] = &unk_2510C15B0;
    objc_copyWeak(&v21, &location);
    v20[4] = self;
    v12 = -[LACCacheSync initWithTimeout:block:](v11, "initWithTimeout:block:", v20, 0.5);
    v13 = self->_biolockoutStateCache;
    self->_biolockoutStateCache = v12;

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
    biolockoutStateCache = self->_biolockoutStateCache;
  }
  -[LACCacheSync valueWithParameter:error:](biolockoutStateCache, "valueWithParameter:error:", v8, a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = v14;
    v16 = objc_msgSend(v14, "integerValue");
    if (!objc_msgSend(v9, "isPurposeUnlock"))
      v16 &= 0xFFFFFFFFFFFFFF6FLL;
    if (objc_msgSend(v9, "isPurposeApplePay"))
      v17 = v16;
    else
      v17 = v16 & 0xFFFFFFFFFFFFFFDFLL;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_11:
    v18 = 0;
  }

  return v18;
}

id __59__LACBiometryHelper__biolockoutStateForUser_request_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id WeakRetained;
  int v7;
  void *v8;
  uint64_t v10;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v10 = 0;
    v7 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "extendedBioLockoutState:forUser:error:", &v10, objc_msgSend(*(id *)(a1 + 32), "_uidFromUserId:", v5), a3);
    v8 = 0;
    if (v7)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v10);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_lockoutErrorForExtendedState:(int64_t)a3 userId:(id)a4
{
  id v6;
  _BOOL4 v7;
  uint64_t *v8;
  uint64_t *v9;
  const __CFString *v10;
  const __CFString *v11;
  uint64_t *v12;
  const __CFString *v13;
  void *v14;
  NSObject *v15;
  _DWORD v17[2];
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  if (a3)
  {
    if ((a3 & 1) != 0)
    {
      v11 = CFSTR("Biometry is not available before first unlock.");
      v8 = &LACErrorSubcodeBeforeFirstUnlock;
    }
    else if ((a3 & 2) != 0)
    {
      v11 = CFSTR("Biometry is not available in passcode lockout.");
      v8 = &LACErrorSubcodePasscodeLockout;
    }
    else if ((a3 & 8) != 0)
    {
      v11 = CFSTR("Identification lockout");
      v8 = &LACErrorSubcodeIdentificationLockout;
    }
    else if ((a3 & 4) != 0)
    {
      v11 = CFSTR("Biometry is locked out.");
      v8 = &LACErrorSubcodeBioLockout;
    }
    else if ((a3 & 0x90) != 0)
    {
      v7 = -[LACBiometryHelper isBiometryOnForUnlock:](self, "isBiometryOnForUnlock:", v6);
      v8 = (uint64_t *)&LACErrorSubcodeDisabledForUnlock;
      v9 = &LACErrorSubcodeTokenDropped;
      if ((a3 & 0x80) == 0)
        v9 = &LACErrorSubcodeTokenExpired;
      v10 = CFSTR("Token for device unlock has been dropped.");
      if ((a3 & 0x80) == 0)
        v10 = CFSTR("Token for device unlock has expired.");
      if (v7)
      {
        v8 = v9;
        v11 = v10;
      }
      else
      {
        v11 = CFSTR("Biometry is disabled for unlock.");
      }
    }
    else
    {
      v8 = (uint64_t *)&LACErrorSubcodeDisabledForApplePay;
      v12 = &LACErrorSubcodeFaceIDInterlocked;
      if ((a3 & 0x40) == 0)
        v12 = &LACErrorSubcodeUnknown;
      v13 = CFSTR("Face ID interlocked");
      if ((a3 & 0x40) == 0)
        v13 = CFSTR("Unknown lockout state");
      if ((a3 & 0x20) != 0)
      {
        v11 = CFSTR("Biometry is disabled for ApplePay");
      }
      else
      {
        v8 = v12;
        v11 = v13;
      }
    }
  }
  else
  {
    v11 = 0;
    v8 = &LACErrorSubcodeNone;
  }
  if (*v8)
  {
    +[LACError errorWithCode:subcode:debugDescription:](LACError, "errorWithCode:subcode:debugDescription:", -8, *v8, v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LACLogBiometry();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v17[0] = 67109378;
      v17[1] = a3;
      v18 = 2114;
      v19 = v14;
      _os_log_impl(&dword_2409DC000, v15, OS_LOG_TYPE_INFO, "lockoutErrorForExtendedState:%d returned %{public}@", (uint8_t *)v17, 0x12u);
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)biometryLostErrorForUser:(id)a3 request:(id)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v10;

  v10 = 0;
  v4 = -[LACBiometryHelper isLockedOutForUser:request:error:](self, "isLockedOutForUser:request:error:", a3, a4, &v10);
  v5 = v10;
  v6 = v5;
  if (v4)
  {
    v7 = v5;
  }
  else
  {
    +[LACError errorWithCode:subcode:debugDescription:](LACError, "errorWithCode:subcode:debugDescription:", -4, 18, CFSTR("Biometry lost."));
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

- (BOOL)isNotLockedOutForAnyUserWithAdminRole:(BOOL)a3 request:(id)a4 error:(id *)a5
{
  return -[LACBiometryHelper isLockedOutForUser:adminOnly:request:error:](self, "isLockedOutForUser:adminOnly:request:error:", 0, a3, a4, a5);
}

- (BOOL)isLockedOutForUser:(id)a3 request:(id)a4 error:(id *)a5
{
  return -[LACBiometryHelper isLockedOutForUser:adminOnly:request:error:](self, "isLockedOutForUser:adminOnly:request:error:", a3, 0, a4, a5);
}

- (BOOL)isLockedOutForUser:(id)a3 adminOnly:(BOOL)a4 request:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  BOOL v15;
  NSDictionary *identities;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  int v28;
  _QWORD v30[5];
  id v31;
  uint64_t *v32;
  uint64_t *v33;
  BOOL v34;
  id obj;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint64_t v42;
  _QWORD v43[4];
  id v44;
  uint8_t buf[4];
  id v46;
  __int16 v47;
  uint64_t v48;
  __int16 v49;
  int v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a5;
  LACLogBiometry();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[LACBiometryHelper isLockedOutForUser:adminOnly:request:error:].cold.2();

  if (-[LACBiometryHelper deviceHasBiometryWithError:](self, "deviceHasBiometryWithError:", a6))
  {
    v42 = 0;
    v43[0] = &v42;
    v43[1] = 0x3032000000;
    v43[2] = __Block_byref_object_copy__1;
    v43[3] = __Block_byref_object_dispose__1;
    v44 = 0;
    v36 = 0;
    v37 = &v36;
    v38 = 0x3032000000;
    v39 = __Block_byref_object_copy__1;
    v40 = __Block_byref_object_dispose__1;
    v41 = 0;
    if (v10)
    {
      obj = 0;
      -[LACBiometryHelper _biolockoutStateForUser:request:error:](self, "_biolockoutStateForUser:request:error:", v10, v11, &obj);
      v13 = objc_claimAutoreleasedReturnValue();
      objc_storeStrong(&v44, obj);
      v14 = (void *)v37[5];
      v37[5] = v13;
    }
    else
    {
      identities = self->_identities;
      if (!identities)
      {
        -[LACBiometryHelper _refreshIdentitiesDueToAccessoryChange:](self, "_refreshIdentitiesDueToAccessoryChange:", 0);
        identities = self->_identities;
      }
      -[NSDictionary allKeys](identities, "allKeys");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = MEMORY[0x24BDAC760];
      v30[1] = 3221225472;
      v30[2] = __64__LACBiometryHelper_isLockedOutForUser_adminOnly_request_error___block_invoke;
      v30[3] = &unk_2510C15D8;
      v34 = a4;
      v30[4] = self;
      v31 = v11;
      v32 = &v42;
      v33 = &v36;
      objc_msgSend(v14, "enumerateObjectsUsingBlock:", v30);

    }
    v17 = (void *)v37[5];
    if (v17)
    {
      -[LACBiometryHelper _lockoutErrorForExtendedState:userId:](self, "_lockoutErrorForExtendedState:userId:", objc_msgSend(v17, "integerValue"), v10);
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = *(NSObject **)(v43[0] + 40);
      *(_QWORD *)(v43[0] + 40) = v18;
    }
    else
    {
      LACLogBiometry();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[LACBiometryHelper isLockedOutForUser:adminOnly:request:error:].cold.1((uint64_t)v43, v19, v20, v21, v22, v23, v24, v25);
    }

    if (a6)
      *a6 = objc_retainAutorelease(*(id *)(v43[0] + 40));
    if (*(_QWORD *)(v43[0] + 40))
    {
      LACLogBiometry();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v27 = *(_QWORD *)(v43[0] + 40);
        v28 = objc_msgSend(v11, "purpose");
        *(_DWORD *)buf = 138543874;
        v46 = v10;
        v47 = 2114;
        v48 = v27;
        v49 = 1024;
        v50 = v28;
        _os_log_impl(&dword_2409DC000, v26, OS_LOG_TYPE_DEFAULT, "User %{public}@ is locked out: %{public}@, purpose:%d", buf, 0x1Cu);
      }

      v15 = *(_QWORD *)(v43[0] + 40) != 0;
    }
    else
    {
      v15 = 0;
    }
    _Block_object_dispose(&v36, 8);

    _Block_object_dispose(&v42, 8);
  }
  else
  {
    v15 = 1;
  }

  return v15;
}

void __64__LACBiometryHelper_isLockedOutForUser_adminOnly_request_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, BOOL *a4)
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id obj;

  v6 = a2;
  v7 = v6;
  if (!*(_BYTE *)(a1 + 64)
    || (+[LACADMUser findUserByID:searchParent:](LACADMUser, "findUserByID:searchParent:", objc_msgSend(v6, "unsignedIntegerValue"), 0), v8 = (void *)objc_claimAutoreleasedReturnValue(), v9 = objc_msgSend(v8, "isAdministrator"), v8, v9))
  {
    v10 = *(void **)(a1 + 32);
    v11 = *(_QWORD *)(a1 + 40);
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    obj = *(id *)(v12 + 40);
    objc_msgSend(v10, "_biolockoutStateForUser:request:error:", v7, v11, &obj);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v12 + 40), obj);
    if (v13)
    {
      if ((objc_msgSend(v13, "intValue") & 4) == 0 && (objc_msgSend(v13, "intValue") & 8) == 0)
      {
        v14 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
LABEL_8:
        objc_storeStrong((id *)(v14 + 40), v13);
        *a4 = objc_msgSend(v13, "integerValue") == 0;
        goto LABEL_9;
      }
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      if (!*(_QWORD *)(v14 + 40))
        goto LABEL_8;
    }
LABEL_9:

  }
}

- (id)biometryDatabaseHashForUser:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  NSMutableDictionary *databaseHashesByUserId;
  void *v9;
  void *v10;
  NSMutableDictionary *v11;
  void *v12;

  v6 = a3;
  if (-[LACBiometryHelper deviceHasBiometryWithError:](self, "deviceHasBiometryWithError:", a4))
  {
    v7 = -[LACBiometryHelper _uidFromUserId:](self, "_uidFromUserId:", v6);
    databaseHashesByUserId = self->_databaseHashesByUserId;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](databaseHashesByUserId, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      if (!a4)
        goto LABEL_9;
      goto LABEL_8;
    }
    -[BKDevice identitiesDatabaseHashForUser:error:](self->_device, "identitiesDatabaseHashForUser:error:", -[LACBiometryHelper _uidFromUserId:](self, "_uidFromUserId:", v6), a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = self->_databaseHashesByUserId;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](v11, "setObject:forKey:", v10, v12);

      if (a4)
LABEL_8:
        *a4 = 0;
    }
  }
  else
  {
    v10 = 0;
  }
LABEL_9:

  return v10;
}

- (void)_clearHashes
{
  -[NSMutableDictionary removeAllObjects](self->_databaseHashesByUserId, "removeAllObjects");
}

- (id)catacombUUID:(id)a3
{
  id v4;
  void *v5;
  BKDevice *device;
  void *v7;
  id v8;
  NSObject *v9;
  id v11;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = 0;
  if (-[LACBiometryHelper deviceHasBiometryWithError:](self, "deviceHasBiometryWithError:", 0))
  {
    device = self->_device;
    v11 = 0;
    -[BKDevice identitiesDatabaseUUIDForUser:error:](device, "identitiesDatabaseUUIDForUser:error:", -[LACBiometryHelper _uidFromUserId:](self, "_uidFromUserId:", v4), &v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v11;
    if (v7)
    {
      v12[0] = 0;
      v12[1] = 0;
      objc_msgSend(v7, "getUUIDBytes:", v12);
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v12, 16);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      LACLogBiometry();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[LACBiometryHelper catacombUUID:].cold.1();

      v5 = 0;
    }

  }
  return v5;
}

- (BOOL)userPresent:(BOOL *)a3 error:(id *)a4
{
  BKDevice *device;
  void *v8;
  id v9;
  int v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  BOOL v16;
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  if (!-[LACBiometryHelper deviceHasBiometryWithError:](self, "deviceHasBiometryWithError:", a4))
    return 0;
  device = self->_device;
  v20 = 0;
  -[BKDevice createPresenceDetectOperationWithError:](device, "createPresenceDetectOperationWithError:", &v20);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v20;
  if (!v8)
  {
LABEL_7:
    if (v9)
      goto LABEL_8;
LABEL_19:
    v13 = 0;
    if (!a4)
      goto LABEL_10;
    goto LABEL_9;
  }
  objc_msgSend(v8, "setPriority:", 50);
  v19 = v9;
  v10 = objc_msgSend(v8, "startWithError:", &v19);
  v11 = v19;

  if (v10)
  {
    v18 = v11;
    objc_msgSend(v8, "userPresentWithError:", &v18);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v18;

    objc_msgSend(v8, "cancel");
    if (v12)
      *a3 = objc_msgSend(v12, "BOOLValue");

    goto LABEL_7;
  }
  v9 = v11;
  if (!v11)
    goto LABEL_19;
LABEL_8:
  +[LACError errorWithCode:underlyingError:debugDescription:](LACError, "errorWithCode:underlyingError:debugDescription:", -1000, v9, CFSTR("Failed to determine user presence status."));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4)
LABEL_9:
    *a4 = objc_retainAutorelease(v13);
LABEL_10:
  LACLogBiometry();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = v13;
    if (!v13)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *a3);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    *(_DWORD *)buf = 138543362;
    v22 = v15;
    _os_log_impl(&dword_2409DC000, v14, OS_LOG_TYPE_DEFAULT, "User present: %{public}@", buf, 0xCu);
    if (!v13)

  }
  v16 = v13 == 0;

  return v16;
}

- (id)_protectedConfigurationForUser:(id)a3
{
  id v4;
  void *v5;
  BKDevice *device;
  id v7;
  NSObject *v8;
  id v10;

  v4 = a3;
  v5 = 0;
  if (-[LACBiometryHelper deviceHasBiometryWithError:](self, "deviceHasBiometryWithError:", 0))
  {
    device = self->_device;
    v10 = 0;
    -[BKDevice effectiveProtectedConfigurationForUser:error:](device, "effectiveProtectedConfigurationForUser:error:", -[LACBiometryHelper _uidFromUserId:](self, "_uidFromUserId:", v4), &v10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v10;
    if (!v5)
    {
      LACLogBiometry();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[LACBiometryHelper _protectedConfigurationForUser:].cold.1();

    }
  }

  return v5;
}

- (BOOL)isBiometryOnForApplePay:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  -[LACBiometryHelper _protectedConfigurationForUser:](self, "_protectedConfigurationForUser:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "applePayEnabled");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (BOOL)isBiometryOnForUnlock:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  -[LACBiometryHelper _protectedConfigurationForUser:](self, "_protectedConfigurationForUser:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unlockEnabled");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (BOOL)isIdentificationEnabled:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  -[LACBiometryHelper _protectedConfigurationForUser:](self, "_protectedConfigurationForUser:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identificationEnabled");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (BOOL)isPeriocularMatchingEnabledForUser:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  -[LACBiometryHelper _protectedConfigurationForUser:](self, "_protectedConfigurationForUser:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "periocularFaceIDMatchEnabled");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (id)_identitiesForUser:(id)a3 adminOnly:(BOOL)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  NSDictionary *identities;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  BOOL v18;

  v6 = a3;
  LACLogBiometry();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[LACBiometryHelper _identitiesForUser:adminOnly:].cold.1();

  if (!self->_identities || !-[LACBiometryHelper _shouldCacheIdentities](self, "_shouldCacheIdentities"))
    -[LACBiometryHelper _refreshIdentitiesDueToAccessoryChange:](self, "_refreshIdentitiesDueToAccessoryChange:", 0);
  v8 = (void *)objc_opt_new();
  identities = self->_identities;
  if (v6)
  {
    -[NSDictionary objectForKeyedSubscript:](identities, "objectForKeyedSubscript:", v6);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v10)
      v12 = v10;
    else
      v12 = MEMORY[0x24BDBD1A8];
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v12, v6);
  }
  else
  {
    v11 = v8;
    v8 = (void *)-[NSDictionary mutableCopy](identities, "mutableCopy");
  }

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __50__LACBiometryHelper__identitiesForUser_adminOnly___block_invoke;
  v16[3] = &unk_2510C1600;
  v18 = a4;
  v14 = v13;
  v17 = v14;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v16);

  return v14;
}

void __50__LACBiometryHelper__identitiesForUser_adminOnly___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  int v7;
  id v8;

  v8 = a2;
  v5 = a3;
  if (!*(_BYTE *)(a1 + 40)
    || (+[LACADMUser findUserByID:searchParent:](LACADMUser, "findUserByID:searchParent:", objc_msgSend(v8, "unsignedIntegerValue"), 0), v6 = (void *)objc_claimAutoreleasedReturnValue(), v7 = objc_msgSend(v6, "isAdministrator"), v6, v7))
  {
    objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", v5);
  }

}

- (BOOL)_shouldCacheIdentities
{
  return 1;
}

- (void)_refreshIdentitiesDueToAccessoryChange:(BOOL)a3
{
  BKDevice *device;
  _BOOL4 v5;
  void *v6;
  id v7;
  void *v8;
  NSDictionary *identities;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  NSObject *p_super;
  NSObject *v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _BOOL4 v33;
  id *location;
  LACBiometryHelper *v35;
  NSDictionary *v36;
  id v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  id v43;
  uint8_t buf[4];
  NSDictionary *v45;
  __int16 v46;
  id v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  device = self->_device;
  if (device)
  {
    v5 = a3;
    v43 = 0;
    -[BKDevice identitiesWithError:](device, "identitiesWithError:", &v43);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v43;
    v8 = v7;
    identities = self->_identities;
    if (!v6)
    {
      self->_identities = 0;

      LACLogBiometry();
      p_super = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
        -[LACBiometryHelper _refreshIdentitiesDueToAccessoryChange:].cold.1();
      goto LABEL_26;
    }
    location = (id *)&self->_identities;
    v35 = self;
    v33 = v5;
    v37 = v7;
    v36 = identities;
    v10 = (void *)objc_opt_new();
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v38 = v6;
    v11 = v6;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v40 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(v16, "userID"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "objectForKeyedSubscript:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v18;
          if (v18)
            v20 = v18;
          else
            v20 = (id)objc_opt_new();
          v21 = v20;

          objc_msgSend(v21, "addObject:", v16);
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(v16, "userID"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setObject:forKey:", v21, v22);

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
      }
      while (v13);
    }

    objc_storeStrong(location, v10);
    p_super = &v36->super;
    if (-[LACBiometryHelper _shouldCacheIdentities](v35, "_shouldCacheIdentities")
      || (objc_msgSend(*location, "isEqualToDictionary:", v36) & 1) == 0)
    {
      LACLogBiometry();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        v25 = *location;
        *(_DWORD *)buf = 138543618;
        v45 = v36;
        v46 = 2114;
        v47 = v25;
        _os_log_impl(&dword_2409DC000, v24, OS_LOG_TYPE_DEFAULT, "Identities updated from %{public}@ to %{public}@", buf, 0x16u);
      }

    }
    -[LACBiometryHelper delegate](v35, "delegate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "currentMatchingOperationUserId");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = v38;
    if (v27)
    {
      if (objc_msgSend(v27, "intValue") == -1)
      {
        if (objc_msgSend(v10, "count"))
          goto LABEL_23;
      }
      else
      {
        -[NSDictionary objectForKeyedSubscript:](v36, "objectForKeyedSubscript:", v27);
        v28 = objc_claimAutoreleasedReturnValue();
        if (!v28)
          goto LABEL_23;
        v29 = (void *)v28;
        objc_msgSend(v10, "objectForKeyedSubscript:", v27);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        if (v30)
          goto LABEL_23;
      }
      -[LACBiometryHelper delegate](v35, "delegate");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[LACBiometryHelper _errorDisconnected:notEnrolled:](v35, "_errorDisconnected:notEnrolled:", v33, 1);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "unEnrolledWithError:", v32);

    }
LABEL_23:
    -[LACBiometryHelper _clearHashes](v35, "_clearHashes");

    v8 = v37;
LABEL_26:

  }
}

- (void)addObserver:(id)a3
{
  -[NSHashTable addObject:](self->_observers, "addObject:", a3);
}

- (void)removeObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
}

- (void)_handleEnrollmentChangedNotification
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = (void *)MEMORY[0x24BDBCE30];
  -[NSHashTable allObjects](self->_observers, "allObjects", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "biometryEnrolledStateDidChangeForHelper:", self);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)_handleLockoutStateChangedNotification
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = (void *)MEMORY[0x24BDBCE30];
  -[NSHashTable allObjects](self->_observers, "allObjects", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "biometryLockoutStateDidChangeForHelper:", self);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)resetBiometry
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_2409DC000, v0, v1, "dropAllUnlockTokens failed: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (id)dumpStatus
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  id v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  id v23;
  _BYTE v24[128];
  const __CFString *v25;
  _QWORD v26[3];

  v26[1] = *MEMORY[0x24BDAC8D0];
  v25 = CFSTR("biometryType");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[LACBiometryHelper biometryType](self, "biometryType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v6 = -[LACBiometryHelper isAnyUserEnrolledWithError:](self, "isAnyUserEnrolledWithError:", &v23);
  v7 = v23;
  if (v6)
  {
    v17 = v7;
    v18 = v4;
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    -[NSDictionary allKeys](self->_identities, "allKeys");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v20 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
          -[LACBiometryHelper _dumpEnvironmentForUser:](self, "_dumpEnvironmentForUser:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("user %@"), v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKey:", v14, v15);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      }
      while (v10);
    }

    v7 = v17;
    v4 = v18;
  }

  return v5;
}

- (id)_dumpEnvironmentForUser:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  void *v22;
  _QWORD v23[5];
  id v24;
  _QWORD v25[5];
  id v26;
  _QWORD v27[8];
  _QWORD v28[10];

  v28[8] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v27[0] = CFSTR("catacombUUID");
  -[LACBiometryHelper catacombUUID:](self, "catacombUUID:", v4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "description");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = CFSTR("nil");
  if (v5)
    v7 = (const __CFString *)v5;
  v28[0] = v7;
  v8 = MEMORY[0x24BDAC760];
  v27[1] = CFSTR("biometryDbHash");
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __45__LACBiometryHelper__dumpEnvironmentForUser___block_invoke;
  v25[3] = &unk_2510C1628;
  v25[4] = self;
  v9 = v4;
  v26 = v9;
  __45__LACBiometryHelper__dumpEnvironmentForUser___block_invoke((uint64_t)v25);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v21;
  v27[2] = CFSTR("identities");
  v10 = (void *)MEMORY[0x24BDD16E0];
  -[NSDictionary objectForKeyedSubscript:](self->_identities, "objectForKeyedSubscript:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "numberWithUnsignedInteger:", objc_msgSend(v11, "count"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v28[2] = v12;
  v27[3] = CFSTR("lockoutState");
  v23[0] = v8;
  v23[1] = 3221225472;
  v23[2] = __45__LACBiometryHelper__dumpEnvironmentForUser___block_invoke_2;
  v23[3] = &unk_2510C1650;
  v23[4] = self;
  v24 = v9;
  v13 = v9;
  __45__LACBiometryHelper__dumpEnvironmentForUser___block_invoke_2((uint64_t)v23);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v28[3] = v14;
  v27[4] = CFSTR("unlock");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[LACBiometryHelper isBiometryOnForUnlock:](self, "isBiometryOnForUnlock:", v13));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v28[4] = v15;
  v27[5] = CFSTR("ApplePay");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[LACBiometryHelper isBiometryOnForApplePay:](self, "isBiometryOnForApplePay:", v13));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v28[5] = v16;
  v27[6] = CFSTR("periocular");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[LACBiometryHelper isPeriocularMatchingEnabledForUser:](self, "isPeriocularMatchingEnabledForUser:", v13));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v28[6] = v17;
  v27[7] = CFSTR("identification");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[LACBiometryHelper isIdentificationEnabled:](self, "isIdentificationEnabled:", v13));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v28[7] = v18;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, v27, 8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

id __45__LACBiometryHelper__dumpEnvironmentForUser___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v10;

  v2 = *(void **)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  v10 = 0;
  objc_msgSend(v2, "biometryDatabaseHashForUser:error:", v1, &v10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v10;
  objc_msgSend(v3, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(v4, "description");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

id __45__LACBiometryHelper__dumpEnvironmentForUser___block_invoke_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  char v3;
  id v4;
  void *v5;
  void *v6;
  id v8;
  uint64_t v9;

  v9 = 0;
  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  v2 = objc_msgSend(*(id *)(a1 + 32), "_uidFromUserId:", *(_QWORD *)(a1 + 40));
  v8 = 0;
  v3 = objc_msgSend(v1, "extendedBioLockoutState:forUser:error:", &v9, v2, &v8);
  v4 = v8;
  v5 = v4;
  if ((v3 & 1) != 0)
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v9);
  else
    objc_msgSend(v4, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSDictionary)identities
{
  return self->_identities;
}

- (BKDevice)device
{
  return self->_device;
}

- (int64_t)biometryType
{
  return self->_biometryType;
}

- (LACBiometryDelegate)delegate
{
  return (LACBiometryDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSError)fault
{
  return self->_fault;
}

- (NSError)permanentError
{
  return self->_permanentError;
}

- (int64_t)deviceType
{
  return self->_deviceType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_permanentError, 0);
  objc_storeStrong((id *)&self->_fault, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_identities, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_biolockoutStateCache, 0);
  objc_storeStrong((id *)&self->_databaseHashesByUserId, 0);
}

- (void)_shouldRetryAvailableDevices
{
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v3[0] = 67109120;
  v3[1] = objc_msgSend(a1, "deviceType");
  _os_log_fault_impl(&dword_2409DC000, a2, OS_LOG_TYPE_FAULT, "Unexpected biometry type: %d", (uint8_t *)v3, 8u);
  OUTLINED_FUNCTION_2();
}

- (void)_setupWithFault:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_1();
  _os_log_fault_impl(&dword_2409DC000, v0, OS_LOG_TYPE_FAULT, "%{public}@", v1, 0xCu);
  OUTLINED_FUNCTION_2();
}

- (void)isLockedOutForUser:(uint64_t)a3 adminOnly:(uint64_t)a4 request:(uint64_t)a5 error:(uint64_t)a6 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_2409DC000, a2, a3, "bioLockoutState failed: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)isLockedOutForUser:adminOnly:request:error:.cold.2()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl(&dword_2409DC000, v0, OS_LOG_TYPE_DEBUG, "isLockedOutForUser() - UID: %{public}@, request: %{public}@.", v1, 0x16u);
  OUTLINED_FUNCTION_2();
}

- (void)catacombUUID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_2409DC000, v0, v1, "Failed to determine catacomb UUID: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_protectedConfigurationForUser:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_2409DC000, v0, OS_LOG_TYPE_ERROR, "Failed to get protected configuration for user %{public}@: %{public}@", v1, 0x16u);
  OUTLINED_FUNCTION_2();
}

- (void)_identitiesForUser:adminOnly:.cold.1()
{
  int v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_1();
  v3 = 1026;
  v4 = v0;
  _os_log_debug_impl(&dword_2409DC000, v1, OS_LOG_TYPE_DEBUG, "_identitiesForUser() - UID: %{public}@ adminOnly: %{public}d", v2, 0x12u);
  OUTLINED_FUNCTION_2();
}

- (void)_refreshIdentitiesDueToAccessoryChange:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_2409DC000, v0, v1, "Failed to read identities: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
