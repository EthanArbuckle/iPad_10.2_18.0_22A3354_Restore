@implementation ASKProfilePictureStore

+ (ASKProfilePictureStore)sharedStore
{
  if (sharedStore_onceToken[0] != -1)
    dispatch_once(sharedStore_onceToken, &__block_literal_global_0);
  return (ASKProfilePictureStore *)(id)sharedStore_instance;
}

- (ASKProfilePictureStore)init
{
  ASKProfilePictureStore *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *accessQueue;
  dispatch_queue_t v5;
  OS_dispatch_queue *notificationQueue;
  ACAccountStore *v7;
  ACAccountStore *accountStore;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  _QWORD v16[4];
  id v17;
  id location;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)ASKProfilePictureStore;
  v2 = -[ASKProfilePictureStore init](&v19, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("AppStoreKitInternal.ASKProfilePictureStore.accessQueue", 0);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v3;

    v5 = dispatch_queue_create("AppStoreKitInternal.ASKProfilePictureStore.notificationQueue", MEMORY[0x1E0C80D50]);
    notificationQueue = v2->_notificationQueue;
    v2->_notificationQueue = (OS_dispatch_queue *)v5;

    v7 = (ACAccountStore *)objc_alloc_init(MEMORY[0x1E0C8F2B8]);
    accountStore = v2->_accountStore;
    v2->_accountStore = v7;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *MEMORY[0x1E0C8F010];
    objc_msgSend(v9, "addObserver:selector:name:object:", v2, sel_appleAccountsDidChange_, *MEMORY[0x1E0C8F010], v2->_accountStore);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v2, sel_storeAccountsDidChange_, v10, v12);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:selector:name:object:", v2, sel_profilePictureStoreDidChange_, *MEMORY[0x1E0CFAEC8], 0);

    objc_initWeak(&location, v2);
    -[ASKProfilePictureStore accessQueue](v2, "accessQueue");
    v14 = objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __30__ASKProfilePictureStore_init__block_invoke;
    v16[3] = &unk_1E9DC1CF8;
    objc_copyWeak(&v17, &location);
    dispatch_async(v14, v16);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)configureProfilePictureStoreAndNotifyIfNeeded
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  int v15;
  void *v16;
  uint64_t v17;
  int v18;
  void *v19;
  int v20;
  _BOOL4 v21;
  int v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;

  -[ASKProfilePictureStore accessQueue](self, "accessQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[ASKProfilePictureStore accountStore](self, "accountStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "aa_primaryAppleAccount");
  v29 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v29, "username");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ams_activeiTunesAccount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "username");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[ASKProfilePictureStore primaryAccountName](self, "primaryAccountName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");
  if (v10 == objc_msgSend(v5, "length"))
  {
    v11 = 0;
  }
  else
  {
    -[ASKProfilePictureStore primaryAccountName](self, "primaryAccountName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v12, "isEqualToString:", v5) ^ 1;

  }
  -[ASKProfilePictureStore storeAccountName](self, "storeAccountName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "length");
  if (v14 == objc_msgSend(v8, "length"))
  {
    v15 = 0;
  }
  else
  {
    -[ASKProfilePictureStore storeAccountName](self, "storeAccountName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v16, "isEqualToString:", v8) ^ 1;

  }
  if (!objc_msgSend(v5, "length"))
  {
    v18 = objc_msgSend(v8, "isEqualToString:", v5);
    goto LABEL_11;
  }
  v17 = objc_msgSend(v8, "length");
  v18 = objc_msgSend(v8, "isEqualToString:", v5);
  if (!v17)
  {
LABEL_11:
    -[ASKProfilePictureStore profilePictureStore](self, "profilePictureStore");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v19 != 0;
    v20 = 1;
    goto LABEL_12;
  }
  -[ASKProfilePictureStore profilePictureStore](self, "profilePictureStore");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v21 = v19 == 0;
LABEL_12:

  v22 = v11 | v15;
  if ((v22 & 1) != 0 || v21)
  {
    -[ASKProfilePictureStore setPrimaryAccountName:](self, "setPrimaryAccountName:", v5);
    -[ASKProfilePictureStore setStoreAccountName:](self, "setStoreAccountName:", v8);
    if (((v20 | v18 ^ 1) & 1) != 0)
    {
      -[ASKProfilePictureStore setProfilePictureStore:](self, "setProfilePictureStore:", 0);
      if (!v22)
        goto LABEL_19;
      goto LABEL_18;
    }
    -[ASKProfilePictureStore accountStore](self, "accountStore");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "aa_grandSlamAccountForiCloudAccount:", v29);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = objc_alloc(MEMORY[0x1E0CFAED0]);
    -[ASKProfilePictureStore accountStore](self, "accountStore");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend(v25, "initWithAppleAccount:grandSlamAccount:accountStore:", v29, v24, v26);
    -[ASKProfilePictureStore setProfilePictureStore:](self, "setProfilePictureStore:", v27);

    -[ASKProfilePictureStore profilePictureStore](self, "profilePictureStore");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setMonogramType:", 0);

    if (v22)
LABEL_18:
      -[ASKProfilePictureStore notifyIfNeeded](self, "notifyIfNeeded");
  }
LABEL_19:

}

void __106__ASKProfilePictureStore_profilePictureForAccountOwnerWithMonogramFallbackWithPictureDiameter_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  double v4;
  void *v5;
  void *v6;
  id *v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_markAsHasRequestedImages");
  objc_msgSend(WeakRetained, "profilePictureStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = *(double *)(a1 + 48);
    objc_msgSend(WeakRetained, "profilePictureStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPictureDiameter:", v4);

    objc_msgSend(WeakRetained, "profilePictureStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __106__ASKProfilePictureStore_profilePictureForAccountOwnerWithMonogramFallbackWithPictureDiameter_completion___block_invoke_2;
    v10[3] = &unk_1E9DC1D48;
    v7 = &v11;
    v11 = *(id *)(a1 + 32);
    objc_msgSend(v6, "profilePictureForAccountOwnerWithCompletion:", v10);

  }
  else
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __106__ASKProfilePictureStore_profilePictureForAccountOwnerWithMonogramFallbackWithPictureDiameter_completion___block_invoke_4;
    v8[3] = &unk_1E9DC1D70;
    v7 = &v9;
    v9 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], v8);
  }

}

- (AAUIProfilePictureStore)profilePictureStore
{
  return self->_profilePictureStore;
}

- (void)_markAsHasRequestedImages
{
  if (!-[ASKProfilePictureStore hasRequestedImages](self, "hasRequestedImages"))
    -[ASKProfilePictureStore setHasRequestedImages:](self, "setHasRequestedImages:", 1);
}

- (BOOL)hasRequestedImages
{
  return self->_hasRequestedImages;
}

- (void)profilePictureForAccountOwnerWithMonogramFallbackWithPictureDiameter:(double)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11[2];
  id location;

  v6 = a4;
  objc_initWeak(&location, self);
  -[ASKProfilePictureStore accessQueue](self, "accessQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __106__ASKProfilePictureStore_profilePictureForAccountOwnerWithMonogramFallbackWithPictureDiameter_completion___block_invoke;
  v9[3] = &unk_1E9DC1D98;
  objc_copyWeak(v11, &location);
  v11[1] = *(id *)&a3;
  v10 = v6;
  v8 = v6;
  dispatch_async(v7, v9);

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (NSString)storeAccountName
{
  return self->_storeAccountName;
}

- (void)setHasRequestedImages:(BOOL)a3
{
  self->_hasRequestedImages = a3;
}

- (NSString)primaryAccountName
{
  return self->_primaryAccountName;
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

uint64_t __106__ASKProfilePictureStore_profilePictureForAccountOwnerWithMonogramFallbackWithPictureDiameter_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __30__ASKProfilePictureStore_init__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "configureProfilePictureStoreAndNotifyIfNeeded");

}

void __37__ASKProfilePictureStore_sharedStore__block_invoke()
{
  ASKProfilePictureStore *v0;
  void *v1;

  v0 = objc_alloc_init(ASKProfilePictureStore);
  v1 = (void *)sharedStore_instance;
  sharedStore_instance = (uint64_t)v0;

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)ASKProfilePictureStore;
  -[ASKProfilePictureStore dealloc](&v4, sel_dealloc);
}

- (void)notifyIfNeeded
{
  NSObject *v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  id location;

  -[ASKProfilePictureStore accessQueue](self, "accessQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (-[ASKProfilePictureStore hasRequestedImages](self, "hasRequestedImages"))
  {
    objc_initWeak(&location, self);
    -[ASKProfilePictureStore notificationQueue](self, "notificationQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __40__ASKProfilePictureStore_notifyIfNeeded__block_invoke;
    v5[3] = &unk_1E9DC1CF8;
    objc_copyWeak(&v6, &location);
    dispatch_async(v4, v5);

    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

void __40__ASKProfilePictureStore_notifyIfNeeded__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "postNotificationName:object:", CFSTR("ASKProfilePictureStoreDidChange"), WeakRetained);

}

- (void)appleAccountsDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[ASKProfilePictureStore accessQueue](self, "accessQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__ASKProfilePictureStore_appleAccountsDidChange___block_invoke;
  v6[3] = &unk_1E9DC1CF8;
  objc_copyWeak(&v7, &location);
  dispatch_async(v5, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

void __49__ASKProfilePictureStore_appleAccountsDidChange___block_invoke(uint64_t a1)
{
  id v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = objc_alloc_init(MEMORY[0x1E0C8F2B8]);
  objc_msgSend(WeakRetained, "setAccountStore:", v1);

  objc_msgSend(WeakRetained, "setProfilePictureStore:", 0);
  objc_msgSend(WeakRetained, "configureProfilePictureStoreAndNotifyIfNeeded");

}

- (void)storeAccountsDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[ASKProfilePictureStore accessQueue](self, "accessQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__ASKProfilePictureStore_storeAccountsDidChange___block_invoke;
  v6[3] = &unk_1E9DC1CF8;
  objc_copyWeak(&v7, &location);
  dispatch_async(v5, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

void __49__ASKProfilePictureStore_storeAccountsDidChange___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "configureProfilePictureStoreAndNotifyIfNeeded");

}

- (void)profilePictureStoreDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[ASKProfilePictureStore accessQueue](self, "accessQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__ASKProfilePictureStore_profilePictureStoreDidChange___block_invoke;
  v6[3] = &unk_1E9DC1CF8;
  objc_copyWeak(&v7, &location);
  dispatch_async(v5, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

void __55__ASKProfilePictureStore_profilePictureStoreDidChange___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "notifyIfNeeded");

}

void __106__ASKProfilePictureStore_profilePictureForAccountOwnerWithMonogramFallbackWithPictureDiameter_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __106__ASKProfilePictureStore_profilePictureForAccountOwnerWithMonogramFallbackWithPictureDiameter_completion___block_invoke_3;
  v6[3] = &unk_1E9DC1D20;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __106__ASKProfilePictureStore_profilePictureForAccountOwnerWithMonogramFallbackWithPictureDiameter_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)profilePictureWithMonogramFallbackForFamilyMembers:(id)a3 pictureDiameter:(double)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16[2];
  id location;

  v8 = a3;
  v9 = a5;
  objc_initWeak(&location, self);
  -[ASKProfilePictureStore accessQueue](self, "accessQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __104__ASKProfilePictureStore_profilePictureWithMonogramFallbackForFamilyMembers_pictureDiameter_completion___block_invoke;
  block[3] = &unk_1E9DC1DC0;
  objc_copyWeak(v16, &location);
  v16[1] = *(id *)&a4;
  v14 = v8;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, block);

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

void __104__ASKProfilePictureStore_profilePictureWithMonogramFallbackForFamilyMembers_pictureDiameter_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  double v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  _QWORD block[4];
  id v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = *(double *)(a1 + 56);
  objc_msgSend(WeakRetained, "profilePictureStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPictureDiameter:", v3);

  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97518]), "initWithStyle:diameter:", 0, *(double *)(a1 + 56));
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v20 = a1;
  v7 = *(id *)(a1 + 32);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v25 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        if (objc_msgSend(v12, "isCurrentSignedInUser"))
        {
          objc_msgSend(WeakRetained, "profilePictureStore");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "profilePictureForAccountOwnerWithoutMonogramFallback");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14)
            goto LABEL_9;
        }
        objc_msgSend(WeakRetained, "profilePictureStore");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "_profilePictureForFamilyMember:withProfilePictureStore:usingMonogrammer:", v12, v15, v6);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
LABEL_9:
          objc_msgSend(v12, "iTunesDSID");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            objc_msgSend(v12, "iTunesDSID");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, v17);

          }
        }

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v9);
  }

  objc_msgSend(WeakRetained, "_markAsHasRequestedImages");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __104__ASKProfilePictureStore_profilePictureWithMonogramFallbackForFamilyMembers_pictureDiameter_completion___block_invoke_2;
  block[3] = &unk_1E9DC1D20;
  v18 = *(id *)(v20 + 40);
  v22 = v5;
  v23 = v18;
  v19 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __104__ASKProfilePictureStore_profilePictureWithMonogramFallbackForFamilyMembers_pictureDiameter_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "copy");
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (id)_profilePictureForFamilyMember:(id)a3 withProfilePictureStore:(id)a4 usingMonogrammer:(id)a5
{
  id v7;
  id v8;
  objc_class *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v7 = a3;
  v8 = a5;
  v9 = (objc_class *)MEMORY[0x1E0CFAC60];
  v10 = a4;
  v11 = objc_alloc_init(v9);
  objc_msgSend(v7, "firstName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFirstName:", v12);

  objc_msgSend(v7, "lastName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setLastName:", v13);

  objc_msgSend(v7, "iCloudDSID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPersonID:", v14);

  objc_msgSend(v7, "iCloudUsername");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAppleID:", v15);

  objc_msgSend(v10, "profilePictureForFamilyMember:", v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 && !v16)
  {
    objc_msgSend(v7, "firstName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "monogramForPersonWithFirstName:lastName:", v17, v18);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v16;
}

- (void)setAccessQueue:(id)a3
{
  objc_storeStrong((id *)&self->_accessQueue, a3);
}

- (OS_dispatch_queue)notificationQueue
{
  return self->_notificationQueue;
}

- (void)setNotificationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_notificationQueue, a3);
}

- (void)setAccountStore:(id)a3
{
  objc_storeStrong((id *)&self->_accountStore, a3);
}

- (void)setProfilePictureStore:(id)a3
{
  objc_storeStrong((id *)&self->_profilePictureStore, a3);
}

- (void)setPrimaryAccountName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setStoreAccountName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeAccountName, 0);
  objc_storeStrong((id *)&self->_primaryAccountName, 0);
  objc_storeStrong((id *)&self->_profilePictureStore, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end
