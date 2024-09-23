@implementation IAMStorageCoordinator

void __46__IAMStorageCoordinator__fetchMessageEntries___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  IAMLogCategoryDefault();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = 138543362;
      v10 = (uint64_t)v6;
      _os_log_impl(&dword_20DD38000, v8, OS_LOG_TYPE_ERROR, "Error fetching message entries. %{public}@", (uint8_t *)&v9, 0xCu);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 134217984;
    v10 = objc_msgSend(v5, "count");
    _os_log_impl(&dword_20DD38000, v8, OS_LOG_TYPE_DEFAULT, "Received %lu message entries from storage.", (uint8_t *)&v9, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __57__IAMStorageCoordinator_fetchMessagesEntriesAndMetadata___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void (*v7)(void);
  id WeakRetained;
  _QWORD v9[4];
  id v10;
  id v11;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
LABEL_9:
    v7();
    goto LABEL_10;
  }
  if (!v5 || !objc_msgSend(v5, "count"))
  {
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
    goto LABEL_9;
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __57__IAMStorageCoordinator_fetchMessagesEntriesAndMetadata___block_invoke_2;
    v9[3] = &unk_24C871530;
    v11 = *(id *)(a1 + 32);
    v10 = v5;
    objc_msgSend(WeakRetained, "_fetchMessagesMetadata:", v9);

  }
LABEL_10:

}

void __90__IAMStorageCoordinator__fetchLastDisplayTimeForGlobalPresentationPolicyGroup_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void (*v9)(void);
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    IAMLogCategoryDefault();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v10 = 138543618;
      v11 = v8;
      v12 = 2114;
      v13 = v6;
      _os_log_impl(&dword_20DD38000, v7, OS_LOG_TYPE_ERROR, "Error fetching last display time for global presentation policy group = %{public}@ :\n %{public}@", (uint8_t *)&v10, 0x16u);
    }

    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v9();

}

void __72__IAMStorageCoordinator_fetchGlobalPresentationPolicyGroupDisplayTimes___block_invoke_2(_QWORD *a1, void *a2, void *a3)
{
  id v6;
  id v7;

  v7 = a2;
  v6 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1[4] + 8) + 32));
  if (!v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a2);
    *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 1;
  }
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40) + 16))();
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1[4] + 8) + 32));

}

void __72__IAMStorageCoordinator_fetchGlobalPresentationPolicyGroupDisplayTimes___block_invoke(_QWORD *a1, void *a2)
{
  id v4;
  uint64_t v5;
  id *v6;
  uint64_t v7;
  void (*v8)(void);
  id v9;

  v4 = a2;
  v5 = *(_QWORD *)(a1[5] + 8);
  v7 = *(_QWORD *)(v5 + 40);
  v6 = (id *)(v5 + 40);
  if (!v7)
  {
    if (v4)
    {
      v9 = v4;
      objc_storeStrong(v6, a2);
      v8 = *(void (**)(void))(a1[4] + 16);
LABEL_7:
      v8();
      v4 = v9;
      goto LABEL_8;
    }
    if (*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) && *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24))
    {
      v8 = *(void (**)(void))(a1[4] + 16);
      v9 = 0;
      goto LABEL_7;
    }
  }
LABEL_8:

}

void __72__IAMStorageCoordinator_fetchGlobalPresentationPolicyGroupDisplayTimes___block_invoke_5(_QWORD *a1, void *a2, void *a3)
{
  id v6;
  id v7;

  v7 = a2;
  v6 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1[4] + 8) + 32));
  if (!v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a2);
    *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 1;
  }
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40) + 16))();
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1[4] + 8) + 32));

}

- (void)_fetchLastDisplayTimeForGlobalPresentationPolicyGroup:(int)a3 completion:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  id WeakRetained;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  +[IAMStorageCoordinator _propertyNameForGlobalPresentationPolicyGroupLastDisplayTime:](IAMStorageCoordinator, "_propertyNameForGlobalPresentationPolicyGroupLastDisplayTime:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_propertyStorage);
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __90__IAMStorageCoordinator__fetchLastDisplayTimeForGlobalPresentationPolicyGroup_completion___block_invoke;
  v13[3] = &unk_24C871648;
  v14 = v7;
  v15 = v6;
  v11 = v7;
  v12 = v6;
  objc_msgSend(WeakRetained, "getPropertyForKey:bundleIdentifier:completion:", v11, v10, v13);

}

+ (id)_propertyNameForGlobalPresentationPolicyGroupLastDisplayTime:(int)a3
{
  if (a3 == 1)
    return CFSTR("LastDisplayTime_GlobalPresentationPolicyGroup_Restricted");
  else
    return CFSTR("LastDisplayTime_GlobalPresentationPolicyGroup_Normal");
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (IAMStorageCoordinator)initWithMessageEntryProvider:(id)a3 messageMetadataStorage:(id)a4 propertyStorage:(id)a5 messageBundleIdentifiers:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  IAMStorageCoordinator *v14;
  IAMStorageCoordinator *v15;
  id *p_messageEntryProvider;
  void *v17;
  void *v18;
  id WeakRetained;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_super v25;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v25.receiver = self;
  v25.super_class = (Class)IAMStorageCoordinator;
  v14 = -[IAMStorageCoordinator init](&v25, sel_init);
  v15 = v14;
  if (v14)
  {
    if (v10)
    {
      p_messageEntryProvider = (id *)&v14->_messageEntryProvider;
      objc_storeWeak((id *)&v14->_messageEntryProvider, v10);
    }
    else
    {
      -[IAMStorageCoordinator iTunesCloudStorageProvider](v14, "iTunesCloudStorageProvider");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "messageEntryProvider");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      p_messageEntryProvider = (id *)&v15->_messageEntryProvider;
      objc_storeWeak((id *)&v15->_messageEntryProvider, v18);

    }
    WeakRetained = objc_loadWeakRetained(p_messageEntryProvider);
    objc_msgSend(WeakRetained, "setDelegate:", v15);

    if (v11)
    {
      objc_storeWeak((id *)&v15->_messageMetadataStorage, v11);
      if (v12)
      {
LABEL_7:
        objc_storeWeak((id *)&v15->_propertyStorage, v12);
LABEL_10:
        objc_storeStrong((id *)&v15->_messageBundleIdentifiers, a6);
        goto LABEL_11;
      }
    }
    else
    {
      -[IAMStorageCoordinator iTunesCloudStorageProvider](v15, "iTunesCloudStorageProvider");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "messageMetadataStorage");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeWeak((id *)&v15->_messageMetadataStorage, v21);

      if (v12)
        goto LABEL_7;
    }
    -[IAMStorageCoordinator iTunesCloudStorageProvider](v15, "iTunesCloudStorageProvider");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "propertyStorage");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v15->_propertyStorage, v23);

    goto LABEL_10;
  }
LABEL_11:

  return v15;
}

- (IAMICStorageProvider)iTunesCloudStorageProvider
{
  IAMICStorageProvider *iTunesCloudStorageProvider;
  IAMICStorageProvider *v4;
  IAMICStorageProvider *v5;

  iTunesCloudStorageProvider = self->_iTunesCloudStorageProvider;
  if (!iTunesCloudStorageProvider)
  {
    v4 = objc_alloc_init(IAMICStorageProvider);
    v5 = self->_iTunesCloudStorageProvider;
    self->_iTunesCloudStorageProvider = v4;

    iTunesCloudStorageProvider = self->_iTunesCloudStorageProvider;
  }
  return iTunesCloudStorageProvider;
}

- (void)fetchMessagesEntriesAndMetadata:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __57__IAMStorageCoordinator_fetchMessagesEntriesAndMetadata___block_invoke;
  v6[3] = &unk_24C871558;
  v5 = v4;
  v7 = v5;
  objc_copyWeak(&v8, &location);
  -[IAMStorageCoordinator _fetchMessageEntries:](self, "_fetchMessageEntries:", v6);
  objc_destroyWeak(&v8);

  objc_destroyWeak(&location);
}

- (void)fetchGlobalPresentationPolicyGroupDisplayTimes:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  _QWORD v8[8];
  _QWORD v9[8];
  uint8_t buf[8];
  _QWORD v11[4];
  id v12;
  _QWORD *v13;
  _QWORD *v14;
  _QWORD *v15;
  _QWORD *v16;
  _QWORD *v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[3];
  char v23;
  _QWORD v24[5];
  id v25;
  _QWORD v26[3];
  char v27;
  _QWORD v28[4];
  int v29;
  _QWORD v30[5];
  id v31;

  v4 = a3;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = __Block_byref_object_copy__1;
  v30[4] = __Block_byref_object_dispose__1;
  v31 = 0;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x2810000000;
  v28[3] = "";
  v29 = 0;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  v27 = 0;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy__1;
  v24[4] = __Block_byref_object_dispose__1;
  v25 = 0;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  v23 = 0;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy__1;
  v20[4] = __Block_byref_object_dispose__1;
  v21 = 0;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v5 = MEMORY[0x24BDAC760];
  v18[3] = __Block_byref_object_copy__3;
  v18[4] = __Block_byref_object_dispose__4;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __72__IAMStorageCoordinator_fetchGlobalPresentationPolicyGroupDisplayTimes___block_invoke;
  v11[3] = &unk_24C8712F0;
  v13 = v30;
  v6 = v4;
  v12 = v6;
  v14 = v26;
  v15 = v22;
  v16 = v24;
  v17 = v20;
  v19 = (id)MEMORY[0x212BB42FC](v11);
  IAMLogCategoryDefault();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20DD38000, v7, OS_LOG_TYPE_DEFAULT, "Fetching last display times for global presentation policy groups.", buf, 2u);
  }

  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __72__IAMStorageCoordinator_fetchGlobalPresentationPolicyGroupDisplayTimes___block_invoke_5;
  v9[3] = &unk_24C8715A8;
  v9[4] = v28;
  v9[5] = v18;
  v9[6] = v24;
  v9[7] = v26;
  -[IAMStorageCoordinator _fetchLastDisplayTimeForGlobalPresentationPolicyGroup:completion:](self, "_fetchLastDisplayTimeForGlobalPresentationPolicyGroup:completion:", 0, v9);
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __72__IAMStorageCoordinator_fetchGlobalPresentationPolicyGroupDisplayTimes___block_invoke_2;
  v8[3] = &unk_24C8715A8;
  v8[4] = v28;
  v8[5] = v18;
  v8[6] = v20;
  v8[7] = v22;
  -[IAMStorageCoordinator _fetchLastDisplayTimeForGlobalPresentationPolicyGroup:completion:](self, "_fetchLastDisplayTimeForGlobalPresentationPolicyGroup:completion:", 1, v8);
  _Block_object_dispose(v18, 8);

  _Block_object_dispose(v20, 8);
  _Block_object_dispose(v22, 8);
  _Block_object_dispose(v24, 8);

  _Block_object_dispose(v26, 8);
  _Block_object_dispose(v28, 8);
  _Block_object_dispose(v30, 8);

}

- (void)_fetchMessageEntries:(id)a3
{
  id v4;
  NSSet *v5;
  NSObject *v6;
  id WeakRetained;
  id v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  NSSet *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = self->_messageBundleIdentifiers;
  IAMLogCategoryDefault();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v12 = v5;
    _os_log_impl(&dword_20DD38000, v6, OS_LOG_TYPE_DEFAULT, "Fetching message entries with bundle identifiers = %{public}@", buf, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_messageEntryProvider);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __46__IAMStorageCoordinator__fetchMessageEntries___block_invoke;
  v9[3] = &unk_24C8715F8;
  v10 = v4;
  v8 = v4;
  objc_msgSend(WeakRetained, "messageEntriesForBundleIdentifiers:completion:", v5, v9);

}

uint64_t __57__IAMStorageCoordinator_fetchMessagesEntriesAndMetadata___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = *(_QWORD *)(a1 + 40);
  if (a3)
    a2 = 0;
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(v6 + 16))(v6, *(_QWORD *)(a1 + 32), a2);
}

- (void)downloadResourcesForMessageEntry:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id WeakRetained;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  IAMLogCategoryDefault();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "applicationMessage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v21 = v10;
    _os_log_impl(&dword_20DD38000, v8, OS_LOG_TYPE_DEFAULT, "Asking storage to download resources for message with identifier = %{public}@", buf, 0xCu);

  }
  objc_msgSend(v6, "applicationMessage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)&self->_messageEntryProvider);
  objc_msgSend(v6, "bundleIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __69__IAMStorageCoordinator_downloadResourcesForMessageEntry_completion___block_invoke;
  v17[3] = &unk_24C871580;
  v18 = v12;
  v19 = v7;
  v15 = v7;
  v16 = v12;
  objc_msgSend(WeakRetained, "downloadResourcesForMessageWithIdentifier:bundleIdentifier:completion:", v16, v14, v17);

}

void __69__IAMStorageCoordinator_downloadResourcesForMessageEntry_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(void);
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    IAMLogCategoryDefault();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v9 = 138543618;
      v10 = v5;
      v11 = 2114;
      v12 = v3;
      _os_log_impl(&dword_20DD38000, v4, OS_LOG_TYPE_ERROR, "Error downloading message resources for message with identifier = %{public}@ :\n %{public}@", (uint8_t *)&v9, 0x16u);
    }

    v6 = *(_QWORD *)(a1 + 40);
    if (v6)
    {
      v7 = *(void (**)(void))(v6 + 16);
LABEL_8:
      v7();
    }
  }
  else
  {
    v8 = *(_QWORD *)(a1 + 40);
    if (v8)
    {
      v7 = *(void (**)(void))(v8 + 16);
      goto LABEL_8;
    }
  }

}

- (void)removeMessageEntry:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id WeakRetained;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "applicationMessage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)&self->_messageEntryProvider);
  objc_msgSend(v7, "bundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __55__IAMStorageCoordinator_removeMessageEntry_completion___block_invoke;
  v14[3] = &unk_24C871580;
  v15 = v9;
  v16 = v6;
  v12 = v6;
  v13 = v9;
  objc_msgSend(WeakRetained, "removeMessageEntryWithIdentifier:forBundleIdentifier:completion:", v13, v11, v14);

}

void __55__IAMStorageCoordinator_removeMessageEntry_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(void);
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    IAMLogCategoryDefault();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v9 = 138543362;
      v10 = v5;
      _os_log_impl(&dword_20DD38000, v4, OS_LOG_TYPE_ERROR, "Error while removing message locally with identifier = %{public}@", (uint8_t *)&v9, 0xCu);
    }

    v6 = *(_QWORD *)(a1 + 40);
    if (v6)
    {
      v7 = *(void (**)(void))(v6 + 16);
LABEL_8:
      v7();
    }
  }
  else
  {
    v8 = *(_QWORD *)(a1 + 40);
    if (v8)
    {
      v7 = *(void (**)(void))(v8 + 16);
      goto LABEL_8;
    }
  }

}

- (void)reportEventForMessageIdentifier:(id)a3 withParams:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id WeakRetained;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v7 = a3;
  v8 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_messageEntryProvider);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __79__IAMStorageCoordinator_reportEventForMessageIdentifier_withParams_completion___block_invoke;
  v12[3] = &unk_24C871580;
  v13 = v7;
  v14 = v8;
  v10 = v8;
  v11 = v7;
  objc_msgSend(WeakRetained, "reportEventForMessageIdentifier:withParams:completion:", v11, MEMORY[0x24BDBD1B8], v12);

}

void __79__IAMStorageCoordinator_reportEventForMessageIdentifier_withParams_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(void);
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    IAMLogCategoryDefault();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v9 = 138543362;
      v10 = v5;
      _os_log_impl(&dword_20DD38000, v4, OS_LOG_TYPE_ERROR, "Error while removing message globally with identifier = %{public}@", (uint8_t *)&v9, 0xCu);
    }

    v6 = *(_QWORD *)(a1 + 40);
    if (v6)
    {
      v7 = *(void (**)(void))(v6 + 16);
LABEL_8:
      v7();
    }
  }
  else
  {
    v8 = *(_QWORD *)(a1 + 40);
    if (v8)
    {
      v7 = *(void (**)(void))(v8 + 16);
      goto LABEL_8;
    }
  }

}

- (void)updateMetadata:(id)a3 forMessageEntry:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id WeakRetained;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v9, "applicationMessage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)&self->_messageMetadataStorage);
  objc_msgSend(v9, "bundleIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __67__IAMStorageCoordinator_updateMetadata_forMessageEntry_completion___block_invoke;
  v17[3] = &unk_24C871580;
  v18 = v12;
  v19 = v8;
  v15 = v8;
  v16 = v12;
  objc_msgSend(WeakRetained, "updateMetadata:messageIdentifier:bundleIdentifier:completion:", v10, v16, v14, v17);

}

void __67__IAMStorageCoordinator_updateMetadata_forMessageEntry_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(void);
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    IAMLogCategoryDefault();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v9 = 138543618;
      v10 = v5;
      v11 = 2114;
      v12 = v3;
      _os_log_impl(&dword_20DD38000, v4, OS_LOG_TYPE_ERROR, "Error updating metadata for message entry with identifier = %{public}@ :\n %{public}@", (uint8_t *)&v9, 0x16u);
    }

    v6 = *(_QWORD *)(a1 + 40);
    if (v6)
    {
      v7 = *(void (**)(void))(v6 + 16);
LABEL_8:
      v7();
    }
  }
  else
  {
    v8 = *(_QWORD *)(a1 + 40);
    if (v8)
    {
      v7 = *(void (**)(void))(v8 + 16);
      goto LABEL_8;
    }
  }

}

- (void)updateLastDisplayTimeGlobalPresentationPolicyGroupNormal:(id)a3
{
  -[IAMStorageCoordinator _updateLastDisplayTime:forGlobalPresentationPolicyGroup:](self, "_updateLastDisplayTime:forGlobalPresentationPolicyGroup:", a3, 0);
}

- (void)updateLastDisplayTimeGlobalPresentationPolicyGroupRestricted:(id)a3
{
  -[IAMStorageCoordinator _updateLastDisplayTime:forGlobalPresentationPolicyGroup:](self, "_updateLastDisplayTime:forGlobalPresentationPolicyGroup:", a3, 1);
}

- (void)removeApplicationBadgeFromMessageEntry:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_messageEntryProvider);
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __75__IAMStorageCoordinator_removeApplicationBadgeFromMessageEntry_completion___block_invoke;
  v12[3] = &unk_24C8715D0;
  v13 = v6;
  v11 = v6;
  objc_msgSend(WeakRetained, "removeApplicationBadgeForBundleIdentifier:fromPresentedMessageEntry:completion:", v10, v7, v12);

}

uint64_t __75__IAMStorageCoordinator_removeApplicationBadgeFromMessageEntry_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)messageEntriesDidChange:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  id v8;

  -[IAMStorageCoordinator delegate](self, "delegate", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[IAMStorageCoordinator delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      -[IAMStorageCoordinator delegate](self, "delegate");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "storageCoordinatorMessageEntriesChanged:", self);

    }
  }
}

- (void)_fetchMessagesMetadata:(id)a3
{
  id v4;
  NSSet *v5;
  NSObject *v6;
  id WeakRetained;
  id v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  NSSet *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = self->_messageBundleIdentifiers;
  IAMLogCategoryDefault();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v12 = v5;
    _os_log_impl(&dword_20DD38000, v6, OS_LOG_TYPE_DEFAULT, "Fetching metadata for message with bundle identifiers = %{public}@", buf, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_messageMetadataStorage);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __48__IAMStorageCoordinator__fetchMessagesMetadata___block_invoke;
  v9[3] = &unk_24C871620;
  v10 = v4;
  v8 = v4;
  objc_msgSend(WeakRetained, "metadataForBundleIdentifiers:completion:", v5, v9);

}

void __48__IAMStorageCoordinator__fetchMessagesMetadata___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  IAMLogCategoryDefault();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = 138543362;
      v10 = (uint64_t)v6;
      _os_log_impl(&dword_20DD38000, v8, OS_LOG_TYPE_ERROR, "Error fetching metadata for all messages. %{public}@", (uint8_t *)&v9, 0xCu);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 134217984;
    v10 = objc_msgSend(v5, "count");
    _os_log_impl(&dword_20DD38000, v8, OS_LOG_TYPE_DEFAULT, "Received %lu metadata entries for messages from storage.", (uint8_t *)&v9, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_updateLastDisplayTime:(id)a3 forGlobalPresentationPolicyGroup:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  id WeakRetained;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  +[IAMStorageCoordinator _propertyNameForGlobalPresentationPolicyGroupLastDisplayTime:](IAMStorageCoordinator, "_propertyNameForGlobalPresentationPolicyGroupLastDisplayTime:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_propertyStorage);
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __81__IAMStorageCoordinator__updateLastDisplayTime_forGlobalPresentationPolicyGroup___block_invoke;
  v12[3] = &unk_24C871020;
  v13 = v7;
  v11 = v7;
  objc_msgSend(WeakRetained, "setProperty:forKey:bundleIdentifier:completion:", v6, v11, v10, v12);

}

void __81__IAMStorageCoordinator__updateLastDisplayTime_forGlobalPresentationPolicyGroup___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    IAMLogCategoryDefault();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = 138543618;
      v7 = v5;
      v8 = 2114;
      v9 = v3;
      _os_log_impl(&dword_20DD38000, v4, OS_LOG_TYPE_ERROR, "Error storing last display time for global presentation policy group = %{public}@ :\n %{public}@", (uint8_t *)&v6, 0x16u);
    }

  }
}

- (IAMStorageCoordinatorDelegate)delegate
{
  return (IAMStorageCoordinatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_iTunesCloudStorageProvider, 0);
  objc_storeStrong((id *)&self->_messageBundleIdentifiers, 0);
  objc_destroyWeak((id *)&self->_propertyStorage);
  objc_destroyWeak((id *)&self->_messageMetadataStorage);
  objc_destroyWeak((id *)&self->_messageEntryProvider);
}

@end
