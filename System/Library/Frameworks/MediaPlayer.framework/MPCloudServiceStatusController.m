@implementation MPCloudServiceStatusController

- (ICMusicSubscriptionStatus)musicSubscriptionStatus
{
  return (ICMusicSubscriptionStatus *)-[ICMusicSubscriptionStatusMonitor subscriptionStatus](self->_subscriptionStatusMonitor, "subscriptionStatus");
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MPCloudServiceStatusController;
  -[MPCloudServiceStatusController description](&v7, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCloudServiceStatusController userIdentity](self, "userIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" [%@]"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (ICUserIdentity)userIdentity
{
  ICUserIdentity *userIdentity;

  userIdentity = self->_userIdentity;
  if (userIdentity)
    return userIdentity;
  objc_msgSend(MEMORY[0x1E0DDC100], "activeAccount");
  return (ICUserIdentity *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)_updateSubscriptionAvailabilityWithValue:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  NSObject *calloutQueue;
  _QWORD block[5];

  self->_hasLoadedSubscriptionAvailability = 1;
  if (self->_subscriptionAvailable != a3)
  {
    v3 = a3;
    self->_subscriptionAvailable = a3;
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBool:forKey:", v3, CFSTR("_MPCloudServiceStatusControllerSubscriptionAvailability"));

    calloutQueue = self->_calloutQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __75__MPCloudServiceStatusController__updateSubscriptionAvailabilityWithValue___block_invoke;
    block[3] = &unk_1E3163508;
    block[4] = self;
    dispatch_async(calloutQueue, block);
  }
}

void __61__MPCloudServiceStatusController__currentCloudLibraryEnabled__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
  if (v2 == -1)
  {
    objc_msgSend(MEMORY[0x1E0DDC108], "defaultIdentityStore");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "userIdentity");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 0;
    objc_msgSend(v3, "getPropertiesForUserIdentity:error:", v4, &v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v7;

    if (!v6 && v5)
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = objc_msgSend(v5, "isActiveLocker");

    v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v2 == 1;
}

+ (void)_postNotificationName:(id)a3 controller:(id)a4 userInfo:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v8)
  {
    v10 = os_log_create("com.apple.amp.mediaplayer", "CloudController");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v17 = v8;
      v18 = 2112;
      v19 = v7;
      _os_log_impl(&dword_193B9B000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ - Posting notification [%@]", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "postNotificationName:object:userInfo:", v7, v8, v9);

    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __76__MPCloudServiceStatusController__postNotificationName_controller_userInfo___block_invoke;
    v13[3] = &unk_1E315AD40;
    v14 = v7;
    v15 = v9;
    objc_msgSend(v8, "_performBlockOnControllerHandlingTheSameAccount:", v13);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "postNotificationName:object:userInfo:", v7, 0, v9);

  }
}

void __97__MPCloudServiceStatusController__cloudServiceStatusControllerWithUserIdentity_createIfRequired___block_invoke(uint64_t a1)
{
  __CFString *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "accountDSID");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!-[__CFString length](v2, "length"))
  {

    v2 = CFSTR("NoDSID");
  }
  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 48), "controllers");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      v5 = os_log_create("com.apple.amp.mediaplayer", "CloudController");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6 = *(_QWORD *)(a1 + 48);
        v7 = *(_QWORD *)(a1 + 32);
        v14 = 138543618;
        v15 = v6;
        v16 = 2112;
        v17 = v7;
        _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ - No pre-existing controller for user identity %@", (uint8_t *)&v14, 0x16u);
      }

      v8 = -[MPCloudServiceStatusController _initWithUserIdentity:]([MPCloudServiceStatusController alloc], "_initWithUserIdentity:", *(_QWORD *)(a1 + 32));
      objc_msgSend(*(id *)(a1 + 48), "controllers");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v2);

    }
  }
  objc_msgSend(*(id *)(a1 + 48), "controllers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v2);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

}

+ (NSMutableDictionary)controllers
{
  if (controllers_onceToken_27831 != -1)
    dispatch_once(&controllers_onceToken_27831, &__block_literal_global_25_27832);
  return (NSMutableDictionary *)(id)controllers___controllers_27833;
}

void __50__MPCloudServiceStatusController_sharedController__block_invoke()
{
  id v0;
  void *v1;
  NSObject *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v0 = -[MPCloudServiceStatusController _initWithUserIdentity:]([MPCloudServiceStatusController alloc], "_initWithUserIdentity:", 0);
  v1 = (void *)sharedController___controller;
  sharedController___controller = (uint64_t)v0;

  v2 = os_log_create("com.apple.amp.mediaplayer", "CloudController");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = 138543362;
    v4 = sharedController___controller;
    _os_log_impl(&dword_193B9B000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ - Singleton", (uint8_t *)&v3, 0xCu);
  }

}

+ (void)_postNotificationName:(id)a3 controller:(id)a4
{
  +[MPCloudServiceStatusController _postNotificationName:controller:userInfo:](MPCloudServiceStatusController, "_postNotificationName:controller:userInfo:", a3, a4, 0);
}

- (BOOL)_currentCloudLibraryEnabled
{
  NSObject *cloudLibraryStatusAccessQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  cloudLibraryStatusAccessQueue = self->_cloudLibraryStatusAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __61__MPCloudServiceStatusController__currentCloudLibraryEnabled__block_invoke;
  v5[3] = &unk_1E3163580;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(cloudLibraryStatusAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)beginObservingCloudLibraryEnabled
{
  MPCloudServiceStatusController *v3;

  +[MPCloudServiceStatusController sharedController](MPCloudServiceStatusController, "sharedController");
  v3 = (MPCloudServiceStatusController *)objc_claimAutoreleasedReturnValue();

  if (v3 == self)
  {
    -[MPCloudServiceStatusController _beginObservingCloudLibraryEnabled](self, "_beginObservingCloudLibraryEnabled");
    -[MPCloudServiceStatusController _performBlockOnControllerHandlingTheSameAccount:](self, "_performBlockOnControllerHandlingTheSameAccount:", &__block_literal_global_55_27777);
  }
}

- (void)_beginObservingCloudLibraryEnabled
{
  NSObject *accessQueue;
  _QWORD block[5];

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__MPCloudServiceStatusController__beginObservingCloudLibraryEnabled__block_invoke;
  block[3] = &unk_1E3163508;
  block[4] = self;
  dispatch_sync(accessQueue, block);
}

+ (id)cloudServiceStatusControllerWithUserIdentity:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  char v7;
  void *v8;
  int v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_log_create("com.apple.amp.mediaplayer", "CloudController");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v10 = 138543618;
    v11 = a1;
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_INFO, "%{public}@ - Request for a controller with user identity %@", (uint8_t *)&v10, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0DDBF50], "currentDeviceInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "supportsMultipleITunesAccounts");

  if ((v7 & 1) != 0)
    +[MPCloudServiceStatusController _cloudServiceStatusControllerWithUserIdentity:createIfRequired:](MPCloudServiceStatusController, "_cloudServiceStatusControllerWithUserIdentity:createIfRequired:", v4, 1);
  else
    +[MPCloudServiceStatusController sharedController](MPCloudServiceStatusController, "sharedController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)_performBlockOnControllerHandlingTheSameAccount:(id)a3
{
  MPCloudServiceStatusController *v4;
  MPCloudServiceStatusController *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  MPCloudServiceStatusController *v9;
  void *v10;
  void *v11;
  void (**v12)(id, void *);

  v12 = (void (**)(id, void *))a3;
  +[MPCloudServiceStatusController sharedController](MPCloudServiceStatusController, "sharedController");
  v4 = (MPCloudServiceStatusController *)objc_claimAutoreleasedReturnValue();
  if (v4 == self)
  {

  }
  else
  {
    v5 = v4;
    +[MPCloudServiceStatusController sharedController](MPCloudServiceStatusController, "sharedController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[MPCloudServiceStatusController _handlesSameAccountAs:](self, "_handlesSameAccountAs:", v6);

    if (v7)
    {
      +[MPCloudServiceStatusController sharedController](MPCloudServiceStatusController, "sharedController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v8)
        goto LABEL_9;
      goto LABEL_8;
    }
  }
  +[MPCloudServiceStatusController sharedController](MPCloudServiceStatusController, "sharedController");
  v9 = (MPCloudServiceStatusController *)objc_claimAutoreleasedReturnValue();

  if (v9 == self)
  {
    +[MPCloudServiceStatusController sharedController](MPCloudServiceStatusController, "sharedController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "userIdentity");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPCloudServiceStatusController _cloudServiceStatusControllerWithUserIdentity:createIfRequired:](MPCloudServiceStatusController, "_cloudServiceStatusControllerWithUserIdentity:createIfRequired:", v11, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
LABEL_8:
      v12[2](v12, v8);

    }
  }
LABEL_9:

}

+ (MPCloudServiceStatusController)sharedController
{
  if (sharedController_onceToken_27828 != -1)
    dispatch_once(&sharedController_onceToken_27828, &__block_literal_global_26_27829);
  return (MPCloudServiceStatusController *)(id)sharedController___controller;
}

+ (id)_cloudServiceStatusControllerWithUserIdentity:(id)a3 createIfRequired:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  uint64_t *v18;
  id v19;
  BOOL v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v4 = a4;
  v6 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__27820;
  v25 = __Block_byref_object_dispose__27821;
  v26 = 0;
  objc_msgSend(a1, "globalSerialQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __97__MPCloudServiceStatusController__cloudServiceStatusControllerWithUserIdentity_createIfRequired___block_invoke;
  v16 = &unk_1E315ACF0;
  v8 = v6;
  v20 = v4;
  v18 = &v21;
  v19 = a1;
  v17 = v8;
  dispatch_sync(v7, &v13);

  if (v4)
  {
    v9 = (void *)v22[5];
    +[MPCloudServiceStatusController sharedController](MPCloudServiceStatusController, "sharedController", v13, v14, v15, v16);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_copyObservationStateFrom:", v10);

  }
  v11 = (id)v22[5];

  _Block_object_dispose(&v21, 8);
  return v11;
}

+ (OS_dispatch_queue)globalSerialQueue
{
  if (globalSerialQueue_onceToken_27835 != -1)
    dispatch_once(&globalSerialQueue_onceToken_27835, &__block_literal_global_27836);
  return (OS_dispatch_queue *)(id)globalSerialQueue___globalSerialQueue_27837;
}

uint64_t __75__MPCloudServiceStatusController__updateSubscriptionAvailabilityWithValue___block_invoke(uint64_t a1)
{
  return +[MPCloudServiceStatusController _postNotificationName:controller:](MPCloudServiceStatusController, "_postNotificationName:controller:", CFSTR("MPCloudServiceStatusControllerSubscriptionAvailabilityDidChangeNotification"), *(_QWORD *)(a1 + 32));
}

uint64_t __56__MPCloudServiceStatusController__initWithUserIdentity___block_invoke_2(uint64_t a1)
{
  return +[MPCloudServiceStatusController _postNotificationName:controller:](MPCloudServiceStatusController, "_postNotificationName:controller:", CFSTR("MPCloudServiceStatusControllerSubscriptionStatusDidChangeNotification"), *(_QWORD *)(a1 + 32));
}

void __65__MPCloudServiceStatusController__updateSubscriptionAvailability__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0DDC108];
  v6 = a2;
  objc_msgSend(v3, "defaultIdentityStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIdentityStore:", v4);

  objc_msgSend(*(id *)(a1 + 32), "userIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIdentity:", v5);

  objc_msgSend(v6, "setAllowsExpiredBags:", 1);
}

uint64_t __65__MPCloudServiceStatusController__updateSubscriptionAvailability__block_invoke_2(uint64_t result, void *a2, uint64_t a3)
{
  uint64_t v3;
  void *v4;
  _BOOL8 v5;

  if (!a3)
  {
    v3 = result;
    objc_msgSend(a2, "dictionaryForBagKey:", *MEMORY[0x1E0DDBEA8]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 != 0;

    return objc_msgSend(*(id *)(v3 + 32), "_updateSubscriptionAvailabilityWithValue:", v5);
  }
  return result;
}

void __45__MPCloudServiceStatusController_controllers__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = (void *)controllers___controllers_27833;
  controllers___controllers_27833 = (uint64_t)v0;

}

void __68__MPCloudServiceStatusController__beginObservingCloudLibraryEnabled__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  __CFNotificationCenter *DarwinNotifyCenter;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) == 1)
  {
    v2 = os_log_create("com.apple.amp.mediaplayer", "CloudController");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(_QWORD *)(a1 + 32);
      v5 = 138543362;
      v6 = v3;
      _os_log_impl(&dword_193B9B000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ - beginObservingCloudLibraryEnabled - Registering for ICCloudClientIsAuthenticatedDidChangeNotification", (uint8_t *)&v5, 0xCu);
    }

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, *(const void **)(a1 + 32), (CFNotificationCallback)_CloudClientAuthenticationDidChangeCallback, (CFStringRef)*MEMORY[0x1E0DDBCE0], 0, (CFNotificationSuspensionBehavior)0);
  }
}

void __51__MPCloudServiceStatusController_globalSerialQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.mediaplayer.MPCloudServiceStatusController.global.serial.queue", v2);
  v1 = (void *)globalSerialQueue___globalSerialQueue_27837;
  globalSerialQueue___globalSerialQueue_27837 = (uint64_t)v0;

}

void __56__MPCloudServiceStatusController__initWithUserIdentity___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  NSObject *v3;
  _QWORD block[4];
  _QWORD *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = WeakRetained[2];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__MPCloudServiceStatusController__initWithUserIdentity___block_invoke_2;
    block[3] = &unk_1E3163508;
    v5 = WeakRetained;
    dispatch_async(v3, block);

  }
}

- (id)_initWithUserIdentity:(id)a3
{
  id v4;
  MPCloudServiceStatusController *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *accessQueue;
  dispatch_queue_t v9;
  OS_dispatch_queue *calloutQueue;
  dispatch_queue_t v11;
  OS_dispatch_queue *cloudLibraryStatusAccessQueue;
  uint64_t v13;
  ICUserIdentity *userIdentity;
  void *v15;
  void *v16;
  void *v17;
  ICUserIdentity *v18;
  ICUserIdentity *v19;
  uint64_t v20;
  ICMusicSubscriptionStatusMonitor *subscriptionStatusMonitor;
  ICMusicSubscriptionStatusMonitor *v22;
  uint64_t v23;
  NSCopying *subscriptionStatusObservationToken;
  NSObject *v25;
  void *v26;
  void *v27;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t);
  void *v32;
  id v33;
  id location;
  objc_super v35;
  uint8_t buf[4];
  MPCloudServiceStatusController *v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)MPCloudServiceStatusController;
  v5 = -[MPCloudServiceStatusController init](&v35, sel_init);
  if (v5)
  {
    v6 = os_log_create("com.apple.amp.mediaplayer", "CloudController");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v37 = v5;
      v38 = 2112;
      v39 = v4;
      _os_log_impl(&dword_193B9B000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ - Creating new controller for user identity %@", buf, 0x16u);
    }

    v7 = dispatch_queue_create("com.apple.MediaPlayer.MPCloudServiceStatusController.accessQueue", 0);
    accessQueue = v5->_accessQueue;
    v5->_accessQueue = (OS_dispatch_queue *)v7;

    v9 = dispatch_queue_create("com.apple.MediaPlayer.MPCloudServiceStatusController.calloutQueue", 0);
    calloutQueue = v5->_calloutQueue;
    v5->_calloutQueue = (OS_dispatch_queue *)v9;

    v11 = dispatch_queue_create("com.apple.MediaPlayer.MPCloudServiceStatusController.cloudLibraryStatusAccessQueue", 0);
    cloudLibraryStatusAccessQueue = v5->_cloudLibraryStatusAccessQueue;
    v5->_cloudLibraryStatusAccessQueue = (OS_dispatch_queue *)v11;

    v5->_cloudLibraryStatus = -1;
    v13 = objc_msgSend(v4, "copy");
    userIdentity = v5->_userIdentity;
    v5->_userIdentity = (ICUserIdentity *)v13;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DDC108], "defaultIdentityStore");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:selector:name:object:", v5, sel__userIdentityStoreDidChange_, *MEMORY[0x1E0DDBEC0], v16);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserver:selector:name:object:", v5, sel__enableICMLErrorReasonChange_, *MEMORY[0x1E0DDBCD0], 0);

    objc_initWeak(&location, v5);
    if (v5->_userIdentity)
    {
      v18 = v5->_userIdentity;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DDC100], "autoupdatingActiveAccount");
      v18 = (ICUserIdentity *)objc_claimAutoreleasedReturnValue();
    }
    v19 = v18;
    objc_msgSend(MEMORY[0x1E0DDBFF0], "sharedMonitorForIdentity:", v18);
    v20 = objc_claimAutoreleasedReturnValue();
    subscriptionStatusMonitor = v5->_subscriptionStatusMonitor;
    v5->_subscriptionStatusMonitor = (ICMusicSubscriptionStatusMonitor *)v20;

    v22 = v5->_subscriptionStatusMonitor;
    v29 = MEMORY[0x1E0C809B0];
    v30 = 3221225472;
    v31 = __56__MPCloudServiceStatusController__initWithUserIdentity___block_invoke;
    v32 = &unk_1E315AD18;
    objc_copyWeak(&v33, &location);
    -[ICMusicSubscriptionStatusMonitor beginObservingSubscriptionStatusWithHandler:](v22, "beginObservingSubscriptionStatusWithHandler:", &v29);
    v23 = objc_claimAutoreleasedReturnValue();
    subscriptionStatusObservationToken = v5->_subscriptionStatusObservationToken;
    v5->_subscriptionStatusObservationToken = (NSCopying *)v23;

    v25 = os_log_create("com.apple.amp.mediaplayer", "CloudController");
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      v37 = v5;
      v38 = 2112;
      v39 = v4;
      _os_log_impl(&dword_193B9B000, v25, OS_LOG_TYPE_INFO, "%{public}@ - New instance created for user identity: %@", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", v29, v30, v31, v32);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPRestrictionsMonitor sharedRestrictionsMonitor](MPRestrictionsMonitor, "sharedRestrictionsMonitor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addObserver:selector:name:object:", v5, sel__allowsMusicSubscriptionDidChange_, CFSTR("MPRestrictionsMonitorMusicSubscriptionDidChangeNotification"), v27);

    -[MPCloudServiceStatusController _updateSubscriptionAvailability](v5, "_updateSubscriptionAvailability");
    objc_destroyWeak(&v33);

    objc_destroyWeak(&location);
  }

  return v5;
}

- (void)_updateSubscriptionAvailability
{
  void *v3;
  char v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  _QWORD v10[5];

  +[MPRestrictionsMonitor sharedRestrictionsMonitor](MPRestrictionsMonitor, "sharedRestrictionsMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "allowsMusicSubscription");

  if ((v4 & 1) != 0)
  {
    v5 = objc_alloc(MEMORY[0x1E0DDC0A0]);
    v6 = MEMORY[0x1E0C809B0];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __65__MPCloudServiceStatusController__updateSubscriptionAvailability__block_invoke;
    v10[3] = &unk_1E315F468;
    v10[4] = self;
    v7 = (void *)objc_msgSend(v5, "initWithBlock:", v10);
    objc_msgSend(MEMORY[0x1E0DDC0D0], "sharedBagProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v6;
    v9[1] = 3221225472;
    v9[2] = __65__MPCloudServiceStatusController__updateSubscriptionAvailability__block_invoke_2;
    v9[3] = &unk_1E31638C0;
    v9[4] = self;
    objc_msgSend(v8, "getBagForRequestContext:withCompletionHandler:", v7, v9);

  }
  else
  {
    -[MPCloudServiceStatusController _updateSubscriptionAvailabilityWithValue:](self, "_updateSubscriptionAvailabilityWithValue:", 0);
  }
}

- (MPCloudServiceStatusController)init
{
  return (MPCloudServiceStatusController *)-[MPCloudServiceStatusController _initWithUserIdentity:](self, "_initWithUserIdentity:", 0);
}

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  void *v5;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v7;
  objc_super v8;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0DDBEC0];
  objc_msgSend(MEMORY[0x1E0DDC108], "defaultIdentityStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, v4, v5);

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)*MEMORY[0x1E0DDBCE0], 0);
  -[ICMusicSubscriptionStatusMonitor endObservingSubscriptionStatusWithToken:](self->_subscriptionStatusMonitor, "endObservingSubscriptionStatusWithToken:", self->_subscriptionStatusObservationToken);
  +[MPRestrictionsMonitor sharedRestrictionsMonitor](MPRestrictionsMonitor, "sharedRestrictionsMonitor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("MPRestrictionsMonitorMusicSubscriptionDidChangeNotification"), v7);

  v8.receiver = self;
  v8.super_class = (Class)MPCloudServiceStatusController;
  -[MPCloudServiceStatusController dealloc](&v8, sel_dealloc);
}

- (void)environmentMonitorDidChangeNetworkReachability:(id)a3
{
  BOOL v4;
  NSObject *accessQueue;
  _QWORD v6[5];
  BOOL v7;
  char v8;

  v8 = 0;
  v4 = -[MPCloudServiceStatusController _calculateShouldPlaybackRequireSubscriptionLeaseReturningLikelyToReachRemoteServer:](self, "_calculateShouldPlaybackRequireSubscriptionLeaseReturningLikelyToReachRemoteServer:", &v8);
  accessQueue = self->_accessQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __81__MPCloudServiceStatusController_environmentMonitorDidChangeNetworkReachability___block_invoke;
  v6[3] = &unk_1E3163468;
  v6[4] = self;
  v7 = v4;
  dispatch_async(accessQueue, v6);
}

- (void)_allowsMusicSubscriptionDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  MPCloudServiceStatusController *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_log_create("com.apple.amp.mediaplayer", "CloudController");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543618;
    v8 = self;
    v9 = 2114;
    v10 = v6;
    _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_INFO, "%{public}@ - Received notification [%{public}@]", (uint8_t *)&v7, 0x16u);

  }
  self->_hasLoadedSubscriptionAvailability = 0;
  -[MPCloudServiceStatusController _updateSubscriptionAvailability](self, "_updateSubscriptionAvailability");

}

- (void)_cloudClientAuthenticationDidChange
{
  NSObject *v3;
  NSObject *calloutQueue;
  _QWORD block[5];
  uint8_t buf[4];
  MPCloudServiceStatusController *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.amp.mediaplayer", "CloudController");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v7 = self;
    _os_log_impl(&dword_193B9B000, v3, OS_LOG_TYPE_INFO, "%{public}@ - Received notification [ICCloudClientIsAuthenticatedDidChangeNotification]", buf, 0xCu);
  }

  self->_cloudLibraryStatus = -1;
  calloutQueue = self->_calloutQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__MPCloudServiceStatusController__cloudClientAuthenticationDidChange__block_invoke;
  block[3] = &unk_1E3163508;
  block[4] = self;
  dispatch_async(calloutQueue, block);
}

- (void)_userIdentityStoreDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *cloudLibraryStatusAccessQueue;
  _QWORD block[5];
  uint8_t buf[4];
  MPCloudServiceStatusController *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_log_create("com.apple.amp.mediaplayer", "CloudController");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v10 = self;
    v11 = 2114;
    v12 = v6;
    _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_INFO, "%{public}@ - Received notification [%{public}@]", buf, 0x16u);

  }
  cloudLibraryStatusAccessQueue = self->_cloudLibraryStatusAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__MPCloudServiceStatusController__userIdentityStoreDidChange___block_invoke;
  block[3] = &unk_1E3163508;
  block[4] = self;
  dispatch_async(cloudLibraryStatusAccessQueue, block);

}

- (void)_enableICMLErrorReasonChange:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  MPCloudServiceStatusController *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_log_create("com.apple.amp.mediaplayer", "CloudController");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543618;
    v8 = self;
    v9 = 2114;
    v10 = v6;
    _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ - Received notification [%{public}@]", (uint8_t *)&v7, 0x16u);

  }
  +[MPCloudServiceStatusController _postNotificationName:controller:](MPCloudServiceStatusController, "_postNotificationName:controller:", CFSTR("MPCloudServiceStatusControllerCloudLibraryEnabledDidChangeNotification"), self);

}

- (BOOL)hasLoadedSubscriptionAvailability
{
  return self->_hasLoadedSubscriptionAvailability;
}

- (BOOL)isSubscriptionAvailable
{
  void *v4;
  char v5;

  if (self->_hasLoadedSubscriptionAvailability)
    return self->_subscriptionAvailable;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLForKey:", CFSTR("_MPCloudServiceStatusControllerSubscriptionAvailability"));

  -[MPCloudServiceStatusController _updateSubscriptionAvailability](self, "_updateSubscriptionAvailability");
  return v5;
}

- (SSVFairPlaySubscriptionStatus)lastKnownFairPlaySubscriptionStatus
{
  return 0;
}

- (unint64_t)matchStatus
{
  NSObject *accessQueue;
  unint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__MPCloudServiceStatusController_matchStatus__block_invoke;
  v5[3] = &unk_1E3163580;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)shouldPlaybackRequireSubscriptionLease
{
  NSObject *accessQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __72__MPCloudServiceStatusController_shouldPlaybackRequireSubscriptionLease__block_invoke;
  v5[3] = &unk_1E3163580;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)beginObservingMatchStatus
{
  MPCloudServiceStatusController *v3;

  +[MPCloudServiceStatusController sharedController](MPCloudServiceStatusController, "sharedController");
  v3 = (MPCloudServiceStatusController *)objc_claimAutoreleasedReturnValue();

  if (v3 == self)
  {
    -[MPCloudServiceStatusController _beginObservingMatchStatus](self, "_beginObservingMatchStatus");
    -[MPCloudServiceStatusController _performBlockOnControllerHandlingTheSameAccount:](self, "_performBlockOnControllerHandlingTheSameAccount:", &__block_literal_global_56_27776);
  }
}

- (void)refreshMusicSubscriptionStatus
{
  -[ICMusicSubscriptionStatusMonitor refreshSubscriptionStatus](self->_subscriptionStatusMonitor, "refreshSubscriptionStatus");
}

- (void)endObservingCloudLibraryEnabled
{
  MPCloudServiceStatusController *v3;

  +[MPCloudServiceStatusController sharedController](MPCloudServiceStatusController, "sharedController");
  v3 = (MPCloudServiceStatusController *)objc_claimAutoreleasedReturnValue();

  if (v3 == self)
  {
    -[MPCloudServiceStatusController _endObservingCloudLibraryEnabled](self, "_endObservingCloudLibraryEnabled");
    -[MPCloudServiceStatusController _performBlockOnControllerHandlingTheSameAccount:](self, "_performBlockOnControllerHandlingTheSameAccount:", &__block_literal_global_57_27775);
  }
}

- (void)endObservingMatchStatus
{
  MPCloudServiceStatusController *v3;

  +[MPCloudServiceStatusController sharedController](MPCloudServiceStatusController, "sharedController");
  v3 = (MPCloudServiceStatusController *)objc_claimAutoreleasedReturnValue();

  if (v3 == self)
  {
    -[MPCloudServiceStatusController _endObservingMatchStatus](self, "_endObservingMatchStatus");
    -[MPCloudServiceStatusController _performBlockOnControllerHandlingTheSameAccount:](self, "_performBlockOnControllerHandlingTheSameAccount:", &__block_literal_global_58);
  }
}

- (BOOL)_calculateShouldPlaybackRequireSubscriptionLeaseReturningLikelyToReachRemoteServer:(BOOL *)a3
{
  void *v4;
  char v5;

  objc_msgSend(MEMORY[0x1E0DDBF60], "sharedMonitor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isRemoteServerLikelyReachable");

  if (a3)
    *a3 = v5;
  return v5;
}

- (BOOL)_currentPurchaseHistoryEnabled
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  char v7;
  uint64_t v9;

  objc_msgSend(MEMORY[0x1E0DDC108], "defaultIdentityStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCloudServiceStatusController userIdentity](self, "userIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  objc_msgSend(v3, "getPropertiesForUserIdentity:error:", v4, &v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v9;

  v7 = 0;
  if (!v6 && v5)
    v7 = objc_msgSend(v5, "isActive");

  return v7;
}

- (void)_updateMatchStatus
{
  _BOOL4 hasLoadedMatchStatus;
  void *v4;
  unint64_t v5;
  void *v7;
  NSObject *calloutQueue;
  _QWORD block[5];

  hasLoadedMatchStatus = self->_hasLoadedMatchStatus;
  self->_hasLoadedMatchStatus = 1;
  -[MPCloudServiceStatusController musicSubscriptionStatus](self, "musicSubscriptionStatus");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isMatchEnabled"))
    v5 = 4;
  else
    v5 = 0;
  if (!hasLoadedMatchStatus || self->_matchStatus != v5)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setInteger:forKey:", v5, CFSTR("_MPCloudServiceStatusControllerMatchStatus"));

    if (self->_matchStatus != v5)
    {
      self->_matchStatus = v5;
      calloutQueue = self->_calloutQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __52__MPCloudServiceStatusController__updateMatchStatus__block_invoke;
      block[3] = &unk_1E3163508;
      block[4] = self;
      dispatch_async(calloutQueue, block);
    }
  }

}

- (void)_endObservingCloudLibraryEnabled
{
  NSObject *accessQueue;
  _QWORD block[5];

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__MPCloudServiceStatusController__endObservingCloudLibraryEnabled__block_invoke;
  block[3] = &unk_1E3163508;
  block[4] = self;
  dispatch_sync(accessQueue, block);
}

- (void)_beginObservingMatchStatus
{
  NSObject *accessQueue;
  _QWORD block[5];

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__MPCloudServiceStatusController__beginObservingMatchStatus__block_invoke;
  block[3] = &unk_1E3163508;
  block[4] = self;
  dispatch_sync(accessQueue, block);
}

- (void)_endObservingMatchStatus
{
  NSObject *accessQueue;
  _QWORD block[5];

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__MPCloudServiceStatusController__endObservingMatchStatus__block_invoke;
  block[3] = &unk_1E3163508;
  block[4] = self;
  dispatch_sync(accessQueue, block);
}

- (void)_copyObservationStateFrom:(id)a3
{
  _QWORD *v4;
  NSObject *v5;
  _QWORD *v6;
  unint64_t v7;
  unint64_t v8;
  _QWORD block[4];
  id v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v4 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v5 = v4[1];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__MPCloudServiceStatusController__copyObservationStateFrom___block_invoke;
  block[3] = &unk_1E31626B8;
  v11 = &v17;
  v6 = v4;
  v10 = v6;
  v12 = &v13;
  dispatch_sync(v5, block);
  if (v18[3])
  {
    v7 = 0;
    do
    {
      -[MPCloudServiceStatusController _beginObservingCloudLibraryEnabled](self, "_beginObservingCloudLibraryEnabled");
      ++v7;
    }
    while (v7 < v18[3]);
  }
  if (v14[3])
  {
    v8 = 0;
    do
    {
      -[MPCloudServiceStatusController _beginObservingMatchStatus](self, "_beginObservingMatchStatus");
      ++v8;
    }
    while (v8 < v14[3]);
  }

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);

}

- (BOOL)_handlesSameAccountAs:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  if (self == a3)
    return 0;
  v4 = a3;
  -[MPCloudServiceStatusController userIdentity](self, "userIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accountDSID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userIdentity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "accountDSID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 == v8)
    v9 = 1;
  else
    v9 = objc_msgSend(v6, "isEqual:", v8);

  return v9;
}

- (ICMusicSubscriptionFairPlayKeyStatus)lastKnownSubscriptionFairPlayKeyStatus
{
  return self->_lastKnownSubscriptionFairPlayKeyStatus;
}

- (SSVSubscriptionStatus)subscriptionStatus
{
  return self->_subscriptionStatus;
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_subscriptionStatus, 0);
  objc_storeStrong((id *)&self->_lastKnownSubscriptionFairPlayKeyStatus, 0);
  objc_storeStrong((id *)&self->_userIdentity, 0);
  objc_storeStrong((id *)&self->_subscriptionStatusObservationToken, 0);
  objc_storeStrong((id *)&self->_subscriptionStatusMonitor, 0);
  objc_storeStrong((id *)&self->_cloudLibraryStatusAccessQueue, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

_QWORD *__60__MPCloudServiceStatusController__copyObservationStateFrom___block_invoke(_QWORD *result)
{
  *(_QWORD *)(*(_QWORD *)(result[5] + 8) + 24) = *(_QWORD *)(result[4] + 40);
  *(_QWORD *)(*(_QWORD *)(result[6] + 8) + 24) = *(_QWORD *)(result[4] + 72);
  return result;
}

uint64_t __58__MPCloudServiceStatusController__endObservingMatchStatus__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(result + 32);
  v2 = *(_QWORD *)(v1 + 72);
  if (v2)
    *(_QWORD *)(v1 + 72) = v2 - 1;
  return result;
}

_QWORD *__60__MPCloudServiceStatusController__beginObservingMatchStatus__block_invoke(uint64_t a1)
{
  _QWORD *result;

  ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72);
  result = *(_QWORD **)(a1 + 32);
  if (result[9] == 1)
    return (_QWORD *)objc_msgSend(result, "_updateMatchStatus");
  return result;
}

void __66__MPCloudServiceStatusController__endObservingCloudLibraryEnabled__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v4;
  uint64_t v5;
  __CFNotificationCenter *DarwinNotifyCenter;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(v1 + 40);
  if (v2)
  {
    *(_QWORD *)(v1 + 40) = v2 - 1;
    if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40))
    {
      v4 = os_log_create("com.apple.amp.mediaplayer", "CloudController");
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v5 = *(_QWORD *)(a1 + 32);
        v7 = 138543362;
        v8 = v5;
        _os_log_impl(&dword_193B9B000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ - endObservingCloudLibraryEnabled - Unregistering for ICCloudClientIsAuthenticatedDidChangeNotification", (uint8_t *)&v7, 0xCu);
      }

      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterRemoveObserver(DarwinNotifyCenter, *(const void **)(a1 + 32), (CFNotificationName)*MEMORY[0x1E0DDBCE0], 0);
    }
  }
}

uint64_t __52__MPCloudServiceStatusController__updateMatchStatus__block_invoke(uint64_t a1)
{
  return +[MPCloudServiceStatusController _postNotificationName:controller:](MPCloudServiceStatusController, "_postNotificationName:controller:", CFSTR("MPCloudServiceStatusControllerMatchStatusDidChangeNotification"), *(_QWORD *)(a1 + 32));
}

uint64_t __57__MPCloudServiceStatusController_endObservingMatchStatus__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_endObservingMatchStatus");
}

uint64_t __65__MPCloudServiceStatusController_endObservingCloudLibraryEnabled__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_endObservingCloudLibraryEnabled");
}

uint64_t __59__MPCloudServiceStatusController_beginObservingMatchStatus__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_beginObservingMatchStatus");
}

uint64_t __67__MPCloudServiceStatusController_beginObservingCloudLibraryEnabled__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_beginObservingCloudLibraryEnabled");
}

_BYTE *__72__MPCloudServiceStatusController_shouldPlaybackRequireSubscriptionLease__block_invoke(uint64_t a1)
{
  _BYTE *result;

  result = *(_BYTE **)(a1 + 32);
  if (result[88])
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result[90];
  }
  else
  {
    result = (_BYTE *)objc_msgSend(result, "_calculateShouldPlaybackRequireSubscriptionLeaseReturningLikelyToReachRemoteServer:", 0);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (_BYTE)result;
  }
  return result;
}

void __45__MPCloudServiceStatusController_matchStatus__block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 48))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(_QWORD *)(v2 + 80);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v3, "integerForKey:", CFSTR("_MPCloudServiceStatusControllerMatchStatus"));

  }
}

void __62__MPCloudServiceStatusController__userIdentityStoreDidChange___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  _QWORD v16[5];
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  unint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 32);
  *(_QWORD *)(v2 + 32) = -1;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 49) = 0;
  objc_msgSend(MEMORY[0x1E0DDC108], "defaultIdentityStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "userIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  objc_msgSend(v4, "getPropertiesForUserIdentity:error:", v5, &v17);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v17;

  if (v7)
  {
    v8 = os_log_create("com.apple.amp.mediaplayer", "CloudController");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = *(void **)(a1 + 32);
      objc_msgSend(v9, "userIdentity");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v19 = v9;
      v20 = 2112;
      v21 = v10;
      v22 = 2114;
      v23 = (unint64_t)v7;
      _os_log_impl(&dword_193B9B000, v8, OS_LOG_TYPE_ERROR, "%{public}@ - Error retrieving user identity properties [Processing identity change] - identity=%@ - error=%{public}@", buf, 0x20u);

    }
  }
  else
  {
    v11 = objc_msgSend(v6, "isActiveLocker");
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = v11;
    if (v3 != (void *)v11)
    {
      v12 = os_log_create("com.apple.amp.mediaplayer", "CloudController");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 138543874;
        v19 = v13;
        v20 = 2048;
        v21 = v3;
        v22 = 2048;
        v23 = v11;
        _os_log_impl(&dword_193B9B000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ - Cloud library status changed [%ld -> %ld] - Posting MPCloudServiceStatusControllerCloudLibraryEnabledDidChangeNotification", buf, 0x20u);
      }

      v14 = *(_QWORD *)(a1 + 32);
      v15 = *(NSObject **)(v14 + 16);
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __62__MPCloudServiceStatusController__userIdentityStoreDidChange___block_invoke_52;
      v16[3] = &unk_1E3163508;
      v16[4] = v14;
      dispatch_async(v15, v16);
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "_updateMatchStatus");
  objc_msgSend(*(id *)(a1 + 32), "_updateSubscriptionAvailability");

}

uint64_t __62__MPCloudServiceStatusController__userIdentityStoreDidChange___block_invoke_52(uint64_t a1)
{
  return +[MPCloudServiceStatusController _postNotificationName:controller:](MPCloudServiceStatusController, "_postNotificationName:controller:", CFSTR("MPCloudServiceStatusControllerCloudLibraryEnabledDidChangeNotification"), *(_QWORD *)(a1 + 32));
}

uint64_t __69__MPCloudServiceStatusController__cloudClientAuthenticationDidChange__block_invoke(uint64_t a1)
{
  return +[MPCloudServiceStatusController _postNotificationName:controller:](MPCloudServiceStatusController, "_postNotificationName:controller:", CFSTR("MPCloudServiceStatusControllerCloudLibraryEnabledDidChangeNotification"), *(_QWORD *)(a1 + 32));
}

void __81__MPCloudServiceStatusController_environmentMonitorDidChangeNetworkReachability___block_invoke(uint64_t a1)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  NSObject *v4;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(unsigned __int8 *)(a1 + 40);
  if (*(unsigned __int8 *)(v1 + 90) != v2)
  {
    *(_BYTE *)(v1 + 90) = v2;
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(NSObject **)(v3 + 16);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __81__MPCloudServiceStatusController_environmentMonitorDidChangeNetworkReachability___block_invoke_2;
    block[3] = &unk_1E3163508;
    block[4] = v3;
    dispatch_async(v4, block);
  }
}

uint64_t __81__MPCloudServiceStatusController_environmentMonitorDidChangeNetworkReachability___block_invoke_2(uint64_t a1)
{
  return +[MPCloudServiceStatusController _postNotificationName:controller:](MPCloudServiceStatusController, "_postNotificationName:controller:", CFSTR("MPCloudServiceStatusControllerShouldPlaybackRequireSubscriptionLeaseDidChangeNotification"), *(_QWORD *)(a1 + 32));
}

void __76__MPCloudServiceStatusController__postNotificationName_controller_userInfo___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  id v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.mediaplayer", "CloudController");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v7 = 138543618;
    v8 = v3;
    v9 = 2112;
    v10 = v5;
    _os_log_impl(&dword_193B9B000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ - Related controller posting notification [%@]", (uint8_t *)&v7, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:userInfo:", *(_QWORD *)(a1 + 32), v3, *(_QWORD *)(a1 + 40));

}

@end
