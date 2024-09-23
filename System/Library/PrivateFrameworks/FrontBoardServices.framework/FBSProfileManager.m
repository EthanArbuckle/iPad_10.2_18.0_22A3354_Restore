@implementation FBSProfileManager

+ (id)sharedInstance
{
  if (sharedInstance___once != -1)
    dispatch_once(&sharedInstance___once, &__block_literal_global_17);
  return (id)sharedInstance___instance;
}

void __35__FBSProfileManager_sharedInstance__block_invoke()
{
  FBSProfileManager *v0;
  void *v1;

  v0 = objc_alloc_init(FBSProfileManager);
  v1 = (void *)sharedInstance___instance;
  sharedInstance___instance = (uint64_t)v0;

}

- (FBSProfileManager)init
{
  FBSProfileManager *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  OS_dispatch_queue *workQueue;
  NSSet *v7;
  NSSet *workQueue_managedApplicationBundleIDs;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)FBSProfileManager;
  v2 = -[FBSProfileManager init](&v10, sel_init);
  if (v2)
  {
    objc_msgSend(off_1E38E9DF8, "serial");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "serviceClass:", 25);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = BSDispatchQueueCreate();
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v5;

    v7 = (NSSet *)objc_alloc_init(MEMORY[0x1E0C99E60]);
    workQueue_managedApplicationBundleIDs = v2->_workQueue_managedApplicationBundleIDs;
    v2->_workQueue_managedApplicationBundleIDs = v7;

  }
  return v2;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v4;
  objc_super v5;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)FBSProfileManager;
  -[FBSProfileManager dealloc](&v5, sel_dealloc);
}

- (void)startService
{
  NSObject *workQueue;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__FBSProfileManager_startService__block_invoke;
  block[3] = &unk_1E38EAE78;
  block[4] = self;
  dispatch_async(workQueue, block);
}

void __33__FBSProfileManager_startService__block_invoke(uint64_t a1)
{
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_workQueue_reloadProfiles");
  objc_msgSend(*(id *)(a1 + 32), "_workQueue_reloadManagedApplicationBundleIDs");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 1;
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, *(const void **)(a1 + 32), (CFNotificationCallback)_handleProfilesChangedNotification, CFSTR("MISProvisioningProfileInstalled"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  CFNotificationCenterAddObserver(DarwinNotifyCenter, *(const void **)(a1 + 32), (CFNotificationCallback)_handleProfilesChangedNotification, CFSTR("MISProvisioningProfileRemoved"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  getMCManagedAppsChangedNotification();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", v3, sel__managedAppsChangedNotification_, v4, 0);

}

- (BOOL)isStarted
{
  NSObject *workQueue;
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
  workQueue = self->_workQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __30__FBSProfileManager_isStarted__block_invoke;
  v5[3] = &unk_1E38EB928;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(workQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __30__FBSProfileManager_isStarted__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 8);
  return result;
}

- (BOOL)isManaged:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__FBSProfileManager_isManaged___block_invoke;
  block[3] = &unk_1E38EBE20;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(workQueue, block);
  LOBYTE(workQueue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)workQueue;
}

uint64_t __31__FBSProfileManager_isManaged___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1[4] + 24), "containsObject:", a1[5]);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = result;
  return result;
}

- (id)profilesForSignerIdentity:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__7;
  v16 = __Block_byref_object_dispose__7;
  v17 = 0;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__FBSProfileManager_profilesForSignerIdentity___block_invoke;
  block[3] = &unk_1E38EBE20;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(workQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __47__FBSProfileManager_profilesForSignerIdentity___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 32), "objectForKey:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)_reloadProfiles
{
  NSObject *workQueue;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__FBSProfileManager__reloadProfiles__block_invoke;
  block[3] = &unk_1E38EAE78;
  block[4] = self;
  dispatch_async(workQueue, block);
}

uint64_t __36__FBSProfileManager__reloadProfiles__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_workQueue_reloadProfiles");
}

- (void)_workQueue_reloadProfiles
{
  objc_class *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)soft_MISCopyErrorStringForErrorCode(a2);
  v8 = 138543618;
  v9 = v6;
  v10 = 2114;
  v11 = v7;
  _os_log_error_impl(&dword_19A6D4000, a3, OS_LOG_TYPE_ERROR, "%{public}@: Error loading provisioning profiles: %{public}@", (uint8_t *)&v8, 0x16u);

}

uint64_t __46__FBSProfileManager__workQueue_reloadProfiles__block_invoke(uint64_t a1, uint64_t a2)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const void *v9;
  void *v10;
  void *v11;
  FBSApplicationProvisioningProfile *v12;
  void *context;
  const void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x19AECA15C]();
  soft_MISProvisioningProfileGetDeveloperCertificates(a2);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v17;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(v4);
        v8 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v7);
        v15 = 0;
        v9 = (const void *)soft_SecCertificateCreateWithData(0, v8);
        v15 = v9;
        if (v9)
        {
          v10 = (void *)soft_SecCertificateCopySubjectSummary((uint64_t)v9);
          if (v10)
          {
            objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v10, context, v15, (_QWORD)v16);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v11)
            {
              objc_msgSend(MEMORY[0x1E0C99DE8], "array");
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v11, v10);
            }
            v12 = -[FBSApplicationProvisioningProfile initWithSignerIdentity:profile:]([FBSApplicationProvisioningProfile alloc], "initWithSignerIdentity:profile:", v10, a2);
            if (v12)
              objc_msgSend(v11, "addObject:", v12);

          }
        }
        fbs_release(&v15);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v5);
  }

  objc_autoreleasePoolPop(context);
  return 1;
}

- (void)_workQueue_reloadManagedApplicationBundleIDs
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSSet *v7;
  NSSet *workQueue_managedApplicationBundleIDs;
  NSSet *v9;

  v9 = self->_workQueue_managedApplicationBundleIDs;
  v3 = objc_alloc(MEMORY[0x1E0C99E60]);
  objc_msgSend(getMCProfileConnectionClass(), "sharedConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "managedAppIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithArray:", v5);

  if ((objc_msgSend(v6, "isEqual:", v9) & 1) == 0)
  {
    v7 = (NSSet *)objc_msgSend(v6, "copy");
    workQueue_managedApplicationBundleIDs = self->_workQueue_managedApplicationBundleIDs;
    self->_workQueue_managedApplicationBundleIDs = v7;

  }
}

- (void)_managedAppsChangedNotification:(id)a3
{
  NSObject *workQueue;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__FBSProfileManager__managedAppsChangedNotification___block_invoke;
  block[3] = &unk_1E38EAE78;
  block[4] = self;
  dispatch_async(workQueue, block);
}

uint64_t __53__FBSProfileManager__managedAppsChangedNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_workQueue_reloadManagedApplicationBundleIDs");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue_profilesBySignerIdentity, 0);
  objc_storeStrong((id *)&self->_workQueue_managedApplicationBundleIDs, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

@end
