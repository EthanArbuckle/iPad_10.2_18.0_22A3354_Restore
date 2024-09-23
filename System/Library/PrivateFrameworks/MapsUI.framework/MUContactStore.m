@implementation MUContactStore

- (MUContactStore)init
{
  MUContactStore *v2;
  uint64_t v3;
  OS_dispatch_queue *queue;
  uint64_t v5;
  geo_isolater *propertyIsolator;
  uint64_t v7;
  GEOObserverHashTable *observers;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MUContactStore;
  v2 = -[MUContactStore init](&v11, sel_init);
  if (v2)
  {
    geo_dispatch_queue_create_with_qos();
    v3 = objc_claimAutoreleasedReturnValue();
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = geo_isolater_create_with_format();
    propertyIsolator = v2->_propertyIsolator;
    v2->_propertyIsolator = (geo_isolater *)v5;

    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0D272B8]), "initWithProtocol:queue:", &unk_1EE25B840, 0);
    observers = v2->_observers;
    v2->_observers = (GEOObserverHashTable *)v7;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v2, sel__contactStoreDidChange, *MEMORY[0x1E0C96870], 0);

    -[MUContactStore _contactStoreDidChange](v2, "_contactStoreDidChange");
  }
  return v2;
}

- (void)_contactStoreDidChange
{
  NSObject *queue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __40__MUContactStore__contactStoreDidChange__block_invoke;
  v4[3] = &unk_1E2E01DA8;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __40__MUContactStore__contactStoreDidChange__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_calculateIfContainerIsGuardianRestricted");
    geo_isolate_sync();
    WeakRetained = v2;
  }

}

uint64_t __40__MUContactStore__contactStoreDidChange__block_invoke_2(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 48) = *(_BYTE *)(result + 40);
  return result;
}

- (BOOL)isGuardianRestrictedCNContainer
{
  char v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  geo_isolate_sync();
  v2 = *((_BYTE *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

uint64_t __49__MUContactStore_isGuardianRestrictedCNContainer__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 48);
  return result;
}

- (void)_invokeObservers
{
  GEOObserverHashTable *observers;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  observers = self->_observers;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __34__MUContactStore__invokeObservers__block_invoke;
  v4[3] = &unk_1E2E03170;
  objc_copyWeak(&v5, &location);
  -[GEOObserverHashTable enumerateObserversWithGroup:visitor:](observers, "enumerateObserversWithGroup:visitor:", 0, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __34__MUContactStore__invokeObservers__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;

  v4 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
    objc_msgSend(v4, "contactStoreDidChange:", WeakRetained);

}

- (void)fetchUnifiedContactForIdentifier:(id)a3 callbackQueue:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;
  id v19;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__MUContactStore_fetchUnifiedContactForIdentifier_callbackQueue_completion___block_invoke;
  block[3] = &unk_1E2E01560;
  objc_copyWeak(&v19, &location);
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(queue, block);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __76__MUContactStore_fetchUnifiedContactForIdentifier_callbackQueue_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "cnContactStore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C97200], "descriptorForAllComparatorKeys");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    objc_msgSend(v4, "unifiedContactWithIdentifier:keysToFetch:error:", v5, v7, &v18);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v18;

    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __76__MUContactStore_fetchUnifiedContactForIdentifier_callbackQueue_completion___block_invoke_2;
    v14[3] = &unk_1E2E02558;
    v10 = *(NSObject **)(a1 + 40);
    v11 = *(id *)(a1 + 48);
    v16 = v9;
    v17 = v11;
    v15 = v8;
    v12 = v9;
    v13 = v8;
    dispatch_async(v10, v14);

  }
}

uint64_t __76__MUContactStore_fetchUnifiedContactForIdentifier_callbackQueue_completion___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (CNContactStore)cnContactStore
{
  CNContactStore *cnContactStore;
  CNContactStore *v4;
  CNContactStore *v5;

  cnContactStore = self->_cnContactStore;
  if (!cnContactStore)
  {
    v4 = (CNContactStore *)objc_alloc_init(MEMORY[0x1E0C97298]);
    v5 = self->_cnContactStore;
    self->_cnContactStore = v4;

    cnContactStore = self->_cnContactStore;
  }
  return cnContactStore;
}

- (void)removeMapsDataFromContact:(id)a3 callbackQueue:(id)a4 completion:(id)a5
{
  NSObject *v8;
  id v9;
  void *v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD block[4];
  id v17;
  NSObject *v18;
  id v19;
  id v20;
  id location;
  _QWORD v22[4];
  id v23;
  id v24;

  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v10, "setMapsData:", 0);
  if (-[MUContactStore hasContactAccess](self, "hasContactAccess"))
  {
    objc_initWeak(&location, self);
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __69__MUContactStore_removeMapsDataFromContact_callbackQueue_completion___block_invoke_2;
    block[3] = &unk_1E2E01560;
    objc_copyWeak(&v20, &location);
    v17 = v10;
    v18 = v8;
    v19 = v9;
    v12 = v10;
    v13 = v9;
    dispatch_async(queue, block);

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
  else
  {
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __69__MUContactStore_removeMapsDataFromContact_callbackQueue_completion___block_invoke;
    v22[3] = &unk_1E2E03198;
    v23 = v10;
    v24 = v9;
    v14 = v10;
    v15 = v9;
    dispatch_async(v8, v22);

  }
}

uint64_t __69__MUContactStore_removeMapsDataFromContact_callbackQueue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __69__MUContactStore_removeMapsDataFromContact_callbackQueue_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id v12;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C973D0]);
    objc_msgSend(v3, "updateContact:", *(_QWORD *)(a1 + 32));
    objc_msgSend(WeakRetained, "cnContactStore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    objc_msgSend(v4, "executeSaveRequest:error:", v3, &v12);
    v5 = v12;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __69__MUContactStore_removeMapsDataFromContact_callbackQueue_completion___block_invoke_3;
    v8[3] = &unk_1E2E02558;
    v6 = *(NSObject **)(a1 + 40);
    v11 = *(id *)(a1 + 48);
    v9 = v5;
    v10 = *(id *)(a1 + 32);
    v7 = v5;
    dispatch_async(v6, v8);

  }
}

void __69__MUContactStore_removeMapsDataFromContact_callbackQueue_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id v3;

  v1 = *(_QWORD *)(a1 + 48);
  if (*(_QWORD *)(a1 + 32))
  {
    (*(void (**)(_QWORD, _QWORD))(v1 + 16))(*(_QWORD *)(a1 + 48), 0);
  }
  else
  {
    v3 = (id)objc_msgSend(*(id *)(a1 + 40), "copy");
    (*(void (**)(uint64_t, id, _QWORD))(v1 + 16))(v1, v3, *(_QWORD *)(a1 + 32));

  }
}

- (void)fetchContactForPickerDisplayUsingContact:(id)a3 callbackQueue:(id)a4 completion:(id)a5
{
  id v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  id v15;
  NSObject *queue;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  NSObject *v22;
  id v23;
  id v24;
  id location;
  _QWORD block[4];
  id v27;
  id v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0C974D8], "descriptorForRequiredKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v8, "areKeysAvailable:", v12);

  if (v13)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __84__MUContactStore_fetchContactForPickerDisplayUsingContact_callbackQueue_completion___block_invoke;
    block[3] = &unk_1E2E03198;
    v27 = v8;
    v28 = v10;
    v14 = v10;
    v15 = v8;
    dispatch_async(v9, block);

  }
  else
  {
    objc_initWeak(&location, self);
    queue = self->_queue;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __84__MUContactStore_fetchContactForPickerDisplayUsingContact_callbackQueue_completion___block_invoke_2;
    v19[3] = &unk_1E2E031C0;
    objc_copyWeak(&v24, &location);
    v19[4] = self;
    v20 = v8;
    v21 = v11;
    v22 = v9;
    v23 = v10;
    v17 = v10;
    v18 = v8;
    dispatch_async(queue, v19);

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }

}

uint64_t __84__MUContactStore_fetchContactForPickerDisplayUsingContact_callbackQueue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __84__MUContactStore_fetchContactForPickerDisplayUsingContact_callbackQueue_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  id *v9;
  id *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "cnContactStore");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    objc_msgSend(v3, "unifiedContactWithIdentifier:keysToFetch:error:", v4, v5, &v18);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v18;

    v8 = *(NSObject **)(a1 + 56);
    if (v7)
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __84__MUContactStore_fetchContactForPickerDisplayUsingContact_callbackQueue_completion___block_invoke_4;
      v11[3] = &unk_1E2E02558;
      v9 = &v14;
      v14 = *(id *)(a1 + 64);
      v10 = &v12;
      v12 = *(id *)(a1 + 40);
      v13 = v7;
      dispatch_async(v8, v11);

    }
    else
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __84__MUContactStore_fetchContactForPickerDisplayUsingContact_callbackQueue_completion___block_invoke_3;
      block[3] = &unk_1E2E03198;
      v9 = &v17;
      v17 = *(id *)(a1 + 64);
      v10 = &v16;
      v16 = v6;
      dispatch_async(v8, block);
    }

  }
}

uint64_t __84__MUContactStore_fetchContactForPickerDisplayUsingContact_callbackQueue_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

uint64_t __84__MUContactStore_fetchContactForPickerDisplayUsingContact_callbackQueue_completion___block_invoke_4(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)fetchStoredContactForMatchingMapItem:(id)a3 callbackQueue:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  objc_class *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *queue;
  id v20;
  id v21;
  id v22;
  _QWORD block[4];
  id v24;
  id v25;
  id v26;
  id v27;
  id location;
  _QWORD v29[4];

  v29[3] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = (objc_class *)MEMORY[0x1E0C97210];
  v11 = a3;
  v12 = [v10 alloc];
  v13 = *MEMORY[0x1E0C96898];
  v29[0] = *MEMORY[0x1E0C96770];
  v29[1] = v13;
  v29[2] = *MEMORY[0x1E0C967B8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v12, "initWithKeysToFetch:", v14);

  v16 = (void *)MEMORY[0x1E0C97200];
  objc_msgSend(v11, "_mapsDataString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "predicateForContactMatchingMapString:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setPredicate:", v18);

  objc_msgSend(v15, "setSortOrder:", 1);
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__MUContactStore_fetchStoredContactForMatchingMapItem_callbackQueue_completion___block_invoke;
  block[3] = &unk_1E2E01560;
  objc_copyWeak(&v27, &location);
  v24 = v15;
  v25 = v8;
  v26 = v9;
  v20 = v9;
  v21 = v8;
  v22 = v15;
  dispatch_async(queue, block);

  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);
}

void __80__MUContactStore_fetchStoredContactForMatchingMapItem_callbackQueue_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  _QWORD *v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[5];
  id v17;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "cnContactStore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = 0;
    v16[1] = v16;
    v16[2] = 0x3032000000;
    v16[3] = __Block_byref_object_copy__5;
    v16[4] = __Block_byref_object_dispose__5;
    v17 = 0;
    v5 = *(_QWORD *)(a1 + 32);
    v6 = MEMORY[0x1E0C809B0];
    v14[4] = v16;
    v15 = 0;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __80__MUContactStore_fetchStoredContactForMatchingMapItem_callbackQueue_completion___block_invoke_60;
    v14[3] = &unk_1E2E031E8;
    objc_msgSend(v4, "enumerateContactsWithFetchRequest:error:usingBlock:", v5, &v15, v14);
    v7 = v15;
    block[0] = v6;
    block[1] = 3221225472;
    block[2] = __80__MUContactStore_fetchStoredContactForMatchingMapItem_callbackQueue_completion___block_invoke_2;
    block[3] = &unk_1E2E03210;
    v8 = *(NSObject **)(a1 + 40);
    v12 = *(id *)(a1 + 48);
    v13 = v16;
    v11 = v7;
    v9 = v7;
    dispatch_async(v8, block);

    _Block_object_dispose(v16, 8);
  }

}

void __80__MUContactStore_fetchStoredContactForMatchingMapItem_callbackQueue_completion___block_invoke_60(uint64_t a1, void *a2, _BYTE *a3)
{
  id v6;
  id v7;

  v6 = a2;
  if (v6)
  {
    v7 = v6;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    v6 = v7;
  }
  *a3 = 1;

}

uint64_t __80__MUContactStore_fetchStoredContactForMatchingMapItem_callbackQueue_completion___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40), a1[4]);
}

- (BOOL)hasContactAccess
{
  return objc_msgSend(MEMORY[0x1E0C97298], "_mapkit_isAuthorized");
}

- (BOOL)_calculateIfContainerIsGuardianRestricted
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  -[MUContactStore cnContactStore](self, "cnContactStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "defaultContainerIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0C972C0];
    v13[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "predicateForContainersWithIdentifiers:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[MUContactStore cnContactStore](self, "cnContactStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "containersMatchingPredicate:error:", v7, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "count") == 1)
    {
      objc_msgSend(v9, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isGuardianRestricted");

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)registerObserver:(id)a3 queue:(id)a4
{
  -[GEOObserverHashTable registerObserver:queue:](self->_observers, "registerObserver:queue:", a3, a4);
}

- (void)unregisterObserver:(id)a3
{
  -[GEOObserverHashTable unregisterObserver:](self->_observers, "unregisterObserver:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertyIsolator, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_cnContactStore, 0);
}

@end
