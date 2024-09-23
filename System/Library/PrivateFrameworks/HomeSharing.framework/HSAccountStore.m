@implementation HSAccountStore

uint64_t __56__HSAccountStore_determineGroupIDWithCompletionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onBackgroundQueue_determineGroupIDWithCompletionHandler:", *(_QWORD *)(a1 + 40));
}

- (NSString)groupID
{
  return (NSString *)(id)CFPreferencesCopyAppValue(CFSTR("homeSharingGroupID"), CFSTR("com.apple.homesharing"));
}

void __30__HSAccountStore_defaultStore__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)defaultStore_defaultStore;
  defaultStore_defaultStore = (uint64_t)v0;

}

- (HSAccountStore)init
{
  HSAccountStore *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  _QWORD handler[4];
  HSAccountStore *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HSAccountStore;
  v2 = -[HSAccountStore init](&v8, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.HomeSharing.HSAccountStore", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __22__HSAccountStore_init__block_invoke;
    handler[3] = &unk_24C364518;
    v7 = v2;
    notify_register_dispatch("com.apple.mobileipod.HomeSharingDefaultsDidChange", &v2->_defaultsDidChangeToken, MEMORY[0x24BDAC9B8], handler);
    CFPreferencesAppSynchronize(CFSTR("com.apple.homesharing"));

  }
  return v2;
}

- (void)determineGroupIDWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatch_get_global_queue(0, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __56__HSAccountStore_determineGroupIDWithCompletionHandler___block_invoke;
  v7[3] = &unk_24C364C98;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

+ (id)defaultStore
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __30__HSAccountStore_defaultStore__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultStore_onceToken != -1)
    dispatch_once(&defaultStore_onceToken, block);
  return (id)defaultStore_defaultStore;
}

- (void)_onBackgroundQueue_determineGroupIDWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[HSAccountStore canDetermineGroupID](self, "canDetermineGroupID"))
  {
    v5 = os_log_create("com.apple.amp.HomeSharing", "Accounts");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      -[HSAccountStore appleID](self, "appleID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v16 = v6;
      _os_log_impl(&dword_20AA9E000, v5, OS_LOG_TYPE_DEFAULT, "Determining Group ID for Apple ID: %@", buf, 0xCu);

    }
    v7 = objc_alloc(MEMORY[0x24BEC89F8]);
    objc_msgSend(MEMORY[0x24BEC8A58], "activeAccount");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithIdentity:", v8);

    objc_msgSend(MEMORY[0x24BEC8A38], "sharedBagProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __75__HSAccountStore__onBackgroundQueue_determineGroupIDWithCompletionHandler___block_invoke;
    v12[3] = &unk_24C3645B8;
    v13 = v9;
    v14 = v4;
    v12[4] = self;
    v11 = v9;
    objc_msgSend(v10, "getBagForRequestContext:withCompletionHandler:", v11, v12);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
  }

}

- (BOOL)canDetermineGroupID
{
  void *v3;
  void *v4;
  BOOL v5;

  -[HSAccountStore appleID](self, "appleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[HSAccountStore password](self, "password");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NSString)appleID
{
  dispatch_semaphore_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v9[5];
  NSObject *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = (id)CFPreferencesCopyAppValue(CFSTR("homeSharingAppleID"), CFSTR("com.apple.homesharing"));
  if (!CFPreferencesGetAppBooleanValue(CFSTR("homeSharingDidSetDefaultAppleID"), CFSTR("com.apple.homesharing"), 0)
    && !objc_msgSend((id)v13[5], "length"))
  {
    v3 = dispatch_semaphore_create(0);
    objc_msgSend(MEMORY[0x24BEC8A60], "defaultIdentityStore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEC8A58], "activeAccount");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __25__HSAccountStore_appleID__block_invoke;
    v9[3] = &unk_24C364540;
    v11 = &v12;
    v9[4] = self;
    v6 = v3;
    v10 = v6;
    objc_msgSend(v4, "getPropertiesForUserIdentity:completionHandler:", v5, v9);

  }
  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return (NSString *)v7;
}

- (void)dealloc
{
  void *v3;
  ICURLRequest *groupIDRequest;
  objc_super v5;

  notify_cancel(self->_defaultsDidChangeToken);
  if (self->_groupIDRequest)
  {
    objc_msgSend(MEMORY[0x24BEC8A50], "defaultSession");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cancelRequest:", self->_groupIDRequest);

    groupIDRequest = self->_groupIDRequest;
    self->_groupIDRequest = 0;

  }
  v5.receiver = self;
  v5.super_class = (Class)HSAccountStore;
  -[HSAccountStore dealloc](&v5, sel_dealloc);
}

- (void)setAppleID:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  id v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HSAccountStore appleID](self, "appleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if ((v6 & 1) == 0)
  {
    v7 = os_log_create("com.apple.amp.HomeSharing", "Accounts");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      -[HSAccountStore appleID](self, "appleID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v12 = v4;
      v13 = 2112;
      v14 = v8;
      _os_log_impl(&dword_20AA9E000, v7, OS_LOG_TYPE_DEFAULT, "ids are different new=%@, old=%@", buf, 0x16u);

    }
    -[HSAccountStore clearGroupID](self, "clearGroupID");
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __29__HSAccountStore_setAppleID___block_invoke;
    block[3] = &unk_24C364D10;
    block[4] = self;
    dispatch_sync(queue, block);
    CFPreferencesSetAppValue(CFSTR("homeSharingAppleID"), v4, CFSTR("com.apple.homesharing"));
    CFPreferencesAppSynchronize(CFSTR("com.apple.homesharing"));
    notify_set_state(self->_defaultsDidChangeToken, 0);
    notify_post("com.apple.mobileipod.HomeSharingDefaultsDidChange");
  }

}

- (void)setPassword:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSObject *v7;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[16];

  v4 = a3;
  -[HSAccountStore password](self, "password");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if ((v6 & 1) == 0)
  {
    if (v4)
    {
      v7 = os_log_create("com.apple.amp.HomeSharing", "Accounts");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20AA9E000, v7, OS_LOG_TYPE_DEFAULT, "passwords are different - clearing groupid", buf, 2u);
      }

      -[HSAccountStore clearGroupID](self, "clearGroupID");
    }
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __30__HSAccountStore_setPassword___block_invoke;
    block[3] = &unk_24C364D10;
    block[4] = self;
    dispatch_sync(queue, block);
    HSSetKeychainValueForAccountWithService(v4);
  }

}

- (void)clearAllCredentials
{
  NSObject *v3;
  uint8_t v4[16];

  v3 = os_log_create("com.apple.amp.HomeSharing", "Accounts");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_20AA9E000, v3, OS_LOG_TYPE_DEFAULT, "Clearing all credentials", v4, 2u);
  }

  -[HSAccountStore setAppleID:](self, "setAppleID:", 0);
  -[HSAccountStore setPassword:](self, "setPassword:", 0);
  -[HSAccountStore setGroupID:](self, "setGroupID:", 0);
}

- (void)clearCaches
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  NSObject *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t buf[4];
  uint64_t v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  HSLibraryCacheAllKnownCacheDirectories();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        v10 = os_log_create("com.apple.amp.HomeSharing", "Accounts");
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v16 = v9;
          _os_log_impl(&dword_20AA9E000, v10, OS_LOG_TYPE_DEFAULT, "Removing sharing Home Sharing library caches at path: %{public}@", buf, 0xCu);
        }

        objc_msgSend(v3, "removeItemAtPath:error:", v9, 0);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
    }
    while (v6);
  }

  notify_post((const char *)objc_msgSend(CFSTR("HSCachesClearedNotification"), "UTF8String"));
}

- (void)clearGroupID
{
  NSObject *v3;
  uint8_t v4[16];

  v3 = os_log_create("com.apple.amp.HomeSharing", "Accounts");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_20AA9E000, v3, OS_LOG_TYPE_DEFAULT, "Clearing group id", v4, 2u);
  }

  -[HSAccountStore setGroupID:](self, "setGroupID:", 0);
}

- (void)setGroupID:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = os_log_create("com.apple.amp.HomeSharing", "Accounts");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_20AA9E000, v5, OS_LOG_TYPE_DEFAULT, "Setting groupID=%{public}@", (uint8_t *)&v6, 0xCu);
  }

  CFPreferencesSetAppValue(CFSTR("homeSharingGroupID"), v4, CFSTR("com.apple.homesharing"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.homesharing"));
  notify_set_state(self->_defaultsDidChangeToken, 1uLL);
  notify_post("com.apple.mobileipod.HomeSharingDefaultsDidChange");

}

- (ICURLRequest)groupIDRequest
{
  return self->_groupIDRequest;
}

- (void)setGroupIDRequest:(id)a3
{
  objc_storeStrong((id *)&self->_groupIDRequest, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_groupIDRequest, 0);
}

void __75__HSAccountStore__onBackgroundQueue_determineGroupIDWithCompletionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  NSObject *v22;
  id v23;
  NSObject *v24;
  _QWORD block[5];
  id v26;
  _QWORD v27[5];
  id v28;
  id v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), 0);
  }
  else
  {
    objc_msgSend(a2, "urlForBagKey:", *MEMORY[0x24BEC86E0]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16B0]), "initWithURL:", v4);
    objc_msgSend(v5, "setHTTPMethod:", CFSTR("POST"));
    objc_msgSend(MEMORY[0x24BEC87B8], "currentDeviceInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "deviceGUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)MEMORY[0x24BDBCE70];
    objc_msgSend(*(id *)(a1 + 32), "appleID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "password");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dictionaryWithObjectsAndKeys:", v9, CFSTR("appleId"), v10, CFSTR("password"), v7, CFSTR("guid"), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = 0;
    objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v11, 100, 0, &v30);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v30;
    v14 = v13;
    if (!v12 || v13)
    {
      v24 = os_log_create("com.apple.amp.HomeSharing", "Accounts");
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v32 = v14;
        v33 = 2114;
        v34 = v11;
        _os_log_impl(&dword_20AA9E000, v24, OS_LOG_TYPE_DEFAULT, "failed to serialize body data. err=%{public}@, bodyDictionary=%{public}@", buf, 0x16u);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
    else
    {
      objc_msgSend(v5, "setHTTPBody:", v12);
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC8A00]), "initWithURLRequest:requestContext:", v5, *(_QWORD *)(a1 + 40));
      objc_msgSend(MEMORY[0x24BEC8A50], "defaultSession");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = MEMORY[0x24BDAC760];
      v27[0] = MEMORY[0x24BDAC760];
      v27[1] = 3221225472;
      v27[2] = __75__HSAccountStore__onBackgroundQueue_determineGroupIDWithCompletionHandler___block_invoke_41;
      v27[3] = &unk_24C364590;
      v18 = *(id *)(a1 + 48);
      v19 = *(_QWORD *)(a1 + 32);
      v29 = v18;
      v27[4] = v19;
      v20 = v15;
      v28 = v20;
      objc_msgSend(v16, "enqueueDataRequest:withCompletionHandler:", v20, v27);

      v21 = *(_QWORD *)(a1 + 32);
      v22 = *(NSObject **)(v21 + 24);
      block[0] = v17;
      block[1] = 3221225472;
      block[2] = __75__HSAccountStore__onBackgroundQueue_determineGroupIDWithCompletionHandler___block_invoke_2_48;
      block[3] = &unk_24C364710;
      block[4] = v21;
      v26 = v20;
      v23 = v20;
      dispatch_sync(v22, block);

    }
  }
}

void __75__HSAccountStore__onBackgroundQueue_determineGroupIDWithCompletionHandler___block_invoke_41(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __75__HSAccountStore__onBackgroundQueue_determineGroupIDWithCompletionHandler___block_invoke_2;
  block[3] = &unk_24C364568;
  v13 = v5;
  v14 = v6;
  v7 = *(id *)(a1 + 48);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(a1 + 40);
  v17 = v7;
  v15 = v8;
  v16 = v9;
  v10 = v6;
  v11 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __75__HSAccountStore__onBackgroundQueue_determineGroupIDWithCompletionHandler___block_invoke_2_48(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 16))
  {
    objc_msgSend(MEMORY[0x24BEC8A50], "defaultSession");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cancelRequest:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));

    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 16);
    *(_QWORD *)(v4 + 16) = 0;

    v2 = *(_QWORD *)(a1 + 32);
  }
  objc_storeStrong((id *)(v2 + 16), *(id *)(a1 + 40));
}

void __75__HSAccountStore__onBackgroundQueue_determineGroupIDWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  _QWORD v20[5];
  id v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "urlResponse");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = os_log_create("com.apple.amp.HomeSharing", "Accounts");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_msgSend(v2, "statusCode");
    v5 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 134218242;
    v23 = v4;
    v24 = 2114;
    v25 = v5;
    _os_log_impl(&dword_20AA9E000, v3, OS_LOG_TYPE_DEFAULT, "Request got status code: %ld, error = %{public}@", buf, 0x16u);
  }

  if (*(_QWORD *)(a1 + 40) && (v6 = *(_QWORD *)(a1 + 64)) != 0)
  {
    (*(void (**)(uint64_t, _QWORD))(v6 + 16))(v6, 0);
  }
  else
  {
    if (objc_msgSend(v2, "statusCode") >= 200
      && objc_msgSend(v2, "statusCode") <= 299
      && (objc_msgSend(*(id *)(a1 + 32), "bodyData"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v8 = objc_msgSend(v7, "length"),
          v7,
          v8))
    {
      objc_msgSend(*(id *)(a1 + 32), "parsedBodyDictionary");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKey:", CFSTR("status"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "integerValue");

      if (v11)
      {
        v12 = os_log_create("com.apple.amp.HomeSharing", "Accounts");
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          v23 = v11;
          _os_log_impl(&dword_20AA9E000, v12, OS_LOG_TYPE_DEFAULT, "Determine Group ID request returned status %ld", buf, 0xCu);
        }

      }
      objc_msgSend(v9, "objectForKey:", CFSTR("sgid"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "length");
      if (v14)
      {
        objc_msgSend(*(id *)(a1 + 48), "setGroupID:", v13);
        objc_msgSend(*(id *)(a1 + 48), "setPassword:", 0);
      }
      else if (v11 == 5507)
      {
        HSSetKeychainValueForAccountWithService(0);
        CFPreferencesSetAppValue(CFSTR("homeSharingAppleID"), 0, CFSTR("com.apple.homesharing"));
        CFPreferencesAppSynchronize(CFSTR("com.apple.homesharing"));
        notify_post("com.apple.mobileipod.HomeSharingDefaultsDidChange");
      }
      v16 = *(_QWORD *)(a1 + 64);
      if (v16)
        (*(void (**)(uint64_t, BOOL, _QWORD))(v16 + 16))(v16, v14 != 0, 0);

    }
    else
    {
      v15 = *(_QWORD *)(a1 + 64);
      if (v15)
        (*(void (**)(uint64_t, _QWORD, _QWORD))(v15 + 16))(v15, 0, 0);
    }
    v17 = *(_QWORD *)(a1 + 48);
    v18 = *(void **)(a1 + 56);
    v19 = *(NSObject **)(v17 + 24);
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __75__HSAccountStore__onBackgroundQueue_determineGroupIDWithCompletionHandler___block_invoke_46;
    v20[3] = &unk_24C364710;
    v20[4] = v17;
    v21 = v18;
    dispatch_sync(v19, v20);

  }
}

void __75__HSAccountStore__onBackgroundQueue_determineGroupIDWithCompletionHandler___block_invoke_46(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(v1 + 16);
  if (v3 == v2)
  {
    *(_QWORD *)(v1 + 16) = 0;

  }
}

void __30__HSAccountStore_setPassword___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
  {
    objc_msgSend(MEMORY[0x24BEC8A50], "defaultSession");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "cancelRequest:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));

    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 16);
    *(_QWORD *)(v3 + 16) = 0;

  }
}

void __29__HSAccountStore_setAppleID___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
  {
    objc_msgSend(MEMORY[0x24BEC8A50], "defaultSession");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "cancelRequest:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));

    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 16);
    *(_QWORD *)(v3 + 16) = 0;

  }
}

void __25__HSAccountStore_appleID__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "username");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    objc_msgSend(v3, "username");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    CFPreferencesSetAppValue(CFSTR("homeSharingAppleID"), *(CFPropertyListRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), CFSTR("com.apple.homesharing"));
    CFPreferencesSetAppValue(CFSTR("homeSharingDidSetDefaultAppleID"), (CFPropertyListRef)*MEMORY[0x24BDBD270], CFSTR("com.apple.homesharing"));
    CFPreferencesAppSynchronize(CFSTR("com.apple.homesharing"));
    v9 = os_log_create("com.apple.amp.HomeSharing", "Accounts");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      v11 = 138412290;
      v12 = v10;
      _os_log_impl(&dword_20AA9E000, v9, OS_LOG_TYPE_DEFAULT, "Setting anAppleID=%@", (uint8_t *)&v11, 0xCu);
    }

    notify_set_state(*(_DWORD *)(*(_QWORD *)(a1 + 32) + 8), 0);
    notify_post("com.apple.mobileipod.HomeSharingDefaultsDidChange");
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

void __22__HSAccountStore_init__block_invoke(uint64_t a1, int a2)
{
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t state64;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  CFPreferencesAppSynchronize(CFSTR("com.apple.homesharing"));
  state64 = 0;
  if (!notify_get_state(a2, &state64) && state64 == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "groupID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", v4, CFSTR("groupID"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }
    v6 = os_log_create("com.apple.amp.HomeSharing", "Accounts");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v10 = v4;
      _os_log_impl(&dword_20AA9E000, v6, OS_LOG_TYPE_DEFAULT, "Responding to group id changed notification - newGroupID=%@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("HSGroupIDDidChangeNotification"), *(_QWORD *)(a1 + 32), v5);

  }
}

@end
