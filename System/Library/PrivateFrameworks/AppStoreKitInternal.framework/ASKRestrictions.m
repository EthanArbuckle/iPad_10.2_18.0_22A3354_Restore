@implementation ASKRestrictions

- (int64_t)maximumAppContentRating
{
  NSObject *v3;
  int64_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[ASKRestrictions queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42__ASKRestrictions_maximumAppContentRating__block_invoke;
  v6[3] = &unk_1E9DC2490;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (BOOL)isRunningInStoreDemoMode
{
  ASKRestrictions *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[ASKRestrictions queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__ASKRestrictions_isRunningInStoreDemoMode__block_invoke;
  v5[3] = &unk_1E9DC2490;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (BOOL)isAppInstallationAllowed
{
  ASKRestrictions *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[ASKRestrictions queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__ASKRestrictions_isAppInstallationAllowed__block_invoke;
  v5[3] = &unk_1E9DC2490;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (BOOL)hasManagedAppleID
{
  ASKRestrictions *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[ASKRestrictions queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __36__ASKRestrictions_hasManagedAppleID__block_invoke;
  v5[3] = &unk_1E9DC2490;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (ASKRestrictions)initWithAccountStore:(id)a3
{
  id v5;
  ASKRestrictions *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ASKRestrictions;
  v6 = -[ASKRestrictions init](&v15, sel_init);
  if (v6)
  {
    v7 = dispatch_queue_create("AppStoreKitInternal.ASKRestrictions.queue", MEMORY[0x1E0C80D50]);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    objc_storeStrong((id *)&v6->_accountStore, a3);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v6, sel_updateRestrictionsAndNotifyIfNeeded, *MEMORY[0x1E0D46EC8], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v6, sel_updateRestrictionsAndNotifyIfNeeded, *MEMORY[0x1E0DC4860], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *MEMORY[0x1E0C8F010];
    -[ASKRestrictions accountStore](v6, "accountStore");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v6, sel_updateRestrictionsAndNotifyIfNeeded, v12, v13);

    -[ASKRestrictions updateRestrictionsWithCompletionBlock:](v6, "updateRestrictionsWithCompletionBlock:", 0);
  }

  return v6;
}

void __57__ASKRestrictions_updateRestrictionsWithCompletionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BOOL8 v7;
  int v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  int v12;
  _BYTE *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  id v21;

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "effectiveValueForSetting:", *MEMORY[0x1E0D470B0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "integerValue");
  else
    v4 = 1000;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(v5 + 8);
  v7 = v6 != v4;
  if (v6 != v4)
    *(_QWORD *)(v5 + 8) = v4;
  v8 = objc_msgSend(v21, "isOnDeviceAppInstallationAllowed");
  v9 = *(_QWORD *)(a1 + 32);
  if (*(unsigned __int8 *)(v9 + 16) != v8)
  {
    *(_BYTE *)(v9 + 16) = v8;
    v7 = 1;
  }
  v10 = objc_msgSend(v21, "isAppRemovalAllowed");
  v11 = *(_QWORD *)(a1 + 32);
  if (*(unsigned __int8 *)(v11 + 17) != v10)
  {
    *(_BYTE *)(v11 + 17) = v10;
    v7 = 1;
  }
  v12 = objc_msgSend(MEMORY[0x1E0CFDA50], "isRunningInStoreDemoMode");
  v13 = *(_BYTE **)(a1 + 32);
  if (v13[18] != v12)
  {
    v13[18] = v12;
    v13 = *(_BYTE **)(a1 + 32);
    v7 = 1;
  }
  objc_msgSend(v13, "accountStore");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "ams_activeiTunesAccount");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "ams_isManagedAppleID");

  v17 = *(_QWORD *)(a1 + 32);
  if (*(unsigned __int8 *)(v17 + 19) != v16)
  {
    *(_BYTE *)(v17 + 19) = v16;
    v7 = 1;
  }
  v18 = objc_msgSend(v21, "effectiveBoolValueForSetting:", *MEMORY[0x1E0D46ED8]) == 2;
  v19 = *(_QWORD *)(a1 + 32);
  if (*(unsigned __int8 *)(v19 + 20) != v18)
  {
    *(_BYTE *)(v19 + 20) = v18;
    v7 = 1;
  }
  v20 = *(_QWORD *)(a1 + 40);
  if (v20)
    (*(void (**)(uint64_t, _BOOL8))(v20 + 16))(v20, v7);

}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

- (void)updateRestrictionsWithCompletionBlock:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[ASKRestrictions queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__ASKRestrictions_updateRestrictionsWithCompletionBlock___block_invoke;
  v7[3] = &unk_1E9DC2050;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_barrier_async(v5, v7);

}

uint64_t __43__ASKRestrictions_isRunningInStoreDemoMode__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 18);
  return result;
}

uint64_t __43__ASKRestrictions_isAppInstallationAllowed__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 16);
  return result;
}

uint64_t __42__ASKRestrictions_maximumAppContentRating__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  return result;
}

uint64_t __36__ASKRestrictions_hasManagedAppleID__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 19);
  return result;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)ASKRestrictions;
  -[ASKRestrictions dealloc](&v4, sel_dealloc);
}

- (void)updateRestrictionsAndNotifyIfNeeded
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __54__ASKRestrictions_updateRestrictionsAndNotifyIfNeeded__block_invoke;
  v2[3] = &unk_1E9DC2468;
  v2[4] = self;
  -[ASKRestrictions updateRestrictionsWithCompletionBlock:](self, "updateRestrictionsWithCompletionBlock:", v2);
}

void __54__ASKRestrictions_updateRestrictionsAndNotifyIfNeeded__block_invoke(uint64_t a1, int a2)
{
  _QWORD block[5];

  if (a2)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __54__ASKRestrictions_updateRestrictionsAndNotifyIfNeeded__block_invoke_2;
    block[3] = &unk_1E9DC2440;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

void __54__ASKRestrictions_updateRestrictionsAndNotifyIfNeeded__block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("AppStoreKitInternal.Restrictions.didChangeNotification"), *(_QWORD *)(a1 + 32));

}

- (BOOL)isAppUninstallationAllowed
{
  ASKRestrictions *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[ASKRestrictions queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__ASKRestrictions_isAppUninstallationAllowed__block_invoke;
  v5[3] = &unk_1E9DC2490;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __45__ASKRestrictions_isAppUninstallationAllowed__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 17);
  return result;
}

- (BOOL)isAccountModificationRestricted
{
  ASKRestrictions *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[ASKRestrictions queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__ASKRestrictions_isAccountModificationRestricted__block_invoke;
  v5[3] = &unk_1E9DC2490;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __50__ASKRestrictions_isAccountModificationRestricted__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 20);
  return result;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
