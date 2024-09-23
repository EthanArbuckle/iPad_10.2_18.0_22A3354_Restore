@implementation CNContactChangesNotifier

- (void)registerObserver:(id)a3 forContact:(id)a4 keysToFetch:(id)a5
{
  -[CNContactChangesNotifier registerObserver:forContact:keysToFetch:completionHandler:](self, "registerObserver:forContact:keysToFetch:completionHandler:", a3, a4, a5, 0);
}

void __53__CNContactChangesNotifier_registerProxy_identifier___block_invoke_2(uint64_t a1)
{
  -[CNContactChangesNotifier workQueue_updateObserving](*(_QWORD *)(a1 + 32));
}

uint64_t __53__CNContactChangesNotifier_registerProxy_identifier___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v7[5];

  v2 = a1[4];
  if (v2)
    v3 = *(void **)(v2 + 56);
  else
    v3 = 0;
  objc_msgSend(v3, "addObject:forKey:", a1[5], a1[6]);
  v4 = a1[4];
  if (v4)
    v5 = *(void **)(v4 + 24);
  else
    v5 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__CNContactChangesNotifier_registerProxy_identifier___block_invoke_2;
  v7[3] = &unk_1E29F8508;
  v7[4] = a1[4];
  return objc_msgSend(v5, "performBlock:qualityOfService:", v7, 2);
}

void __53__CNContactChangesNotifier_workQueue_updateObserving__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
    v2 = (_QWORD *)v2[7];
  v3 = v2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v3, "count");

}

- (void)registerObserver:(id)a3 forContact:(id)a4 keysToFetch:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  char v14;
  _BYTE *v15;
  void *v16;
  void *v17;
  char v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  _BYTE *v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v11)
  {
    v14 = objc_msgSend(v11, "hasBeenPersisted");
    if (v10)
    {
      if ((v14 & 1) != 0)
      {
        +[CNContactChangesNotifier createProxyForObserver:keysToFetch:]((uint64_t)CNContactChangesNotifier, v10, v12);
        v15 = (_BYTE *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "identifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNContactChangesNotifier registerProxy:identifier:]((uint64_t)self, v15, v16);

        objc_msgSend(v11, "snapshot");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNContactChangesObserverProxy setContactSnapshot:]((uint64_t)v15, v17);

        v18 = objc_msgSend(v11, "isUnified");
        if (v15)
          v15[8] = v18;
        if (v13)
        {
          if (self)
            self = (CNContactChangesNotifier *)self->_downstream;
          v19[0] = MEMORY[0x1E0C809B0];
          v19[1] = 3221225472;
          v19[2] = __86__CNContactChangesNotifier_registerObserver_forContact_keysToFetch_completionHandler___block_invoke_2;
          v19[3] = &unk_1E29F9F70;
          v20 = v13;
          -[CNContactChangesNotifier performBlock:](self, "performBlock:", v19);

        }
LABEL_14:

        goto LABEL_15;
      }
    }
  }
  if (v13)
  {
    if (self)
      self = (CNContactChangesNotifier *)self->_downstream;
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __86__CNContactChangesNotifier_registerObserver_forContact_keysToFetch_completionHandler___block_invoke;
    v21[3] = &unk_1E29F9F70;
    v22 = v13;
    -[CNContactChangesNotifier performBlock:](self, "performBlock:", v21);
    v15 = v22;
    goto LABEL_14;
  }
LABEL_15:

}

- (void)registerProxy:(void *)a3 identifier:
{
  id v5;
  id v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  id v10;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v7 = *(void **)(a1 + 16);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __53__CNContactChangesNotifier_registerProxy_identifier___block_invoke;
    v8[3] = &unk_1E29F84E0;
    v8[4] = a1;
    v9 = v5;
    v10 = v6;
    objc_msgSend(v7, "performBlock:", v8);

  }
}

- (void)workQueue_updateObserving
{
  id v2;
  void *v3;
  char v4;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  if (a1)
  {
    v6 = 0;
    v7 = &v6;
    v8 = 0x2020000000;
    v9 = 0;
    v2 = *(id *)(a1 + 16);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __53__CNContactChangesNotifier_workQueue_updateObserving__block_invoke;
    v5[3] = &unk_1E29F7EA0;
    v5[4] = a1;
    v5[5] = &v6;
    objc_msgSend(v2, "performBlock:", v5);

    if (v7[3])
    {
      if (!*(_BYTE *)(a1 + 8))
      {
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObserver:selector:name:object:", a1, sel_contactStoreDidChange_, CFSTR("CNContactStoreDidChangeNotification"), 0);
        v4 = 1;
LABEL_7:

        *(_BYTE *)(a1 + 8) = v4;
      }
    }
    else if (*(_BYTE *)(a1 + 8))
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "removeObserver:name:object:", a1, CFSTR("CNContactStoreDidChangeNotification"), 0);
      v4 = 0;
      goto LABEL_7;
    }
    _Block_object_dispose(&v6, 8);
  }
}

+ (CNContactChangesObserverProxy)createProxyForObserver:(void *)a3 keysToFetch:
{
  id v4;
  id v5;
  CNContactChangesObserverProxy *v6;
  CNContactChangesObserverProxy *v7;

  v4 = a2;
  v5 = a3;
  objc_opt_self();
  v6 = objc_alloc_init(CNContactChangesObserverProxy);
  v7 = v6;
  if (v6)
    objc_storeWeak((id *)&v6->_observer, v4);
  -[CNChangesNotifierProxy setRemovalBlocks:]((uint64_t)v7, v5);

  return v7;
}

- (CNContactChangesNotifier)initWithContactStore:(id)a3 downstreamScheduler:(id)a4 schedulerProvider:(id)a5
{
  id v9;
  id v10;
  id v11;
  CNContactChangesNotifier *v12;
  CNContactChangesNotifier *v13;
  uint64_t v14;
  CNScheduler *workQueue;
  uint64_t v16;
  CNScheduler *resourceLock;
  uint64_t v18;
  CNMutableMultiDictionary *registeredObservers;
  uint64_t v20;
  CNCoalescingTimer *entryCompactionTimer;
  CNContactChangesNotifier *v22;
  objc_super v24;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v24.receiver = self;
  v24.super_class = (Class)CNContactChangesNotifier;
  v12 = -[CNContactChangesNotifier init](&v24, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_contactStore, a3);
    v14 = objc_msgSend(v11, "newSerialSchedulerWithName:", CFSTR("com.apple.Contacts.CNContactChangesNotifier.workQueue"));
    workQueue = v13->_workQueue;
    v13->_workQueue = (CNScheduler *)v14;

    objc_storeStrong((id *)&v13->_downstream, a4);
    v16 = objc_msgSend(v11, "newSynchronousSerialSchedulerWithName:", CFSTR("com.apple.Contacts.CNContactChangesNotifier.resourceLock"));
    resourceLock = v13->_resourceLock;
    v13->_resourceLock = (CNScheduler *)v16;

    objc_msgSend(MEMORY[0x1E0D13AC8], "multiDictionary");
    v18 = objc_claimAutoreleasedReturnValue();
    registeredObservers = v13->_registeredObservers;
    v13->_registeredObservers = (CNMutableMultiDictionary *)v18;

    v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0D139C8]), "initWithDelay:options:delegate:", 0, v13, 1.0);
    entryCompactionTimer = v13->_entryCompactionTimer;
    v13->_entryCompactionTimer = (CNCoalescingTimer *)v20;

    v22 = v13;
  }

  return v13;
}

void __34__CNContactChangesNotifier_os_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts", "notifications");
  v1 = (void *)os_log_cn_once_object_1_1;
  os_log_cn_once_object_1_1 = (uint64_t)v0;

}

- (void)removeEntriesWithoutObservers
{
  NSObject *v3;
  uint8_t v4[16];

  objc_opt_class();
  +[CNContactChangesNotifier os_log]();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_18F8BD000, v3, OS_LOG_TYPE_INFO, "Scheduling removal of entries without observers", v4, 2u);
  }

  -[CNCoalescingTimer handleEvent](self->_entryCompactionTimer, "handleEvent");
}

+ (id)os_log
{
  objc_opt_self();
  if (os_log_cn_once_token_1_1 != -1)
    dispatch_once(&os_log_cn_once_token_1_1, &__block_literal_global_97);
  return (id)os_log_cn_once_object_1_1;
}

+ (id)sharedNotifier
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__CNContactChangesNotifier_sharedNotifier__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedNotifier_cn_once_token_0 != -1)
    dispatch_once(&sharedNotifier_cn_once_token_0, block);
  return (id)sharedNotifier_cn_once_object_0;
}

void __42__CNContactChangesNotifier_sharedNotifier__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedNotifier_cn_once_object_0;
  sharedNotifier_cn_once_object_0 = (uint64_t)v1;

}

- (CNContactChangesNotifier)init
{
  void *v3;
  CNContactStore *v4;
  void *v5;
  CNContactChangesNotifier *v6;

  objc_msgSend(MEMORY[0x1E0D13B70], "defaultProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(CNContactStore);
  objc_msgSend(v3, "mainThreadScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CNContactChangesNotifier initWithContactStore:downstreamScheduler:schedulerProvider:](self, "initWithContactStore:downstreamScheduler:schedulerProvider:", v4, v5, v3);

  return v6;
}

- (void)registerObserver:(id)a3 forContact:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "availableKeyDescriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactChangesNotifier registerObserver:forContact:keysToFetch:](self, "registerObserver:forContact:keysToFetch:", v7, v6, v9);

}

void __86__CNContactChangesNotifier_registerObserver_forContact_keysToFetch_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v4 = *MEMORY[0x1E0CB2D68];
  v5[0] = CFSTR("contact and observer can't be nil and contact needs to be persisted");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNErrorFactory errorWithCode:userInfo:](CNErrorFactory, "errorWithCode:userInfo:", 1002, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v3);

}

uint64_t __86__CNContactChangesNotifier_registerObserver_forContact_keysToFetch_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)unregisterObserver:(id)a3 forContact:(id)a4
{
  -[CNContactChangesNotifier unregisterObserver:forContact:completionHandler:](self, "unregisterObserver:forContact:completionHandler:", a3, a4, 0);
}

- (void)unregisterObserver:(id)a3 forContact:(id)a4 completionHandler:(id)a5
{
  -[CNContactChangesNotifier removeProxiesForObserver:forContact:completionHandler:]((uint64_t)self, a3, a4, a5);
}

- (void)removeProxiesForObserver:(void *)a3 forContact:(void *)a4 completionHandler:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  id v15;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    v10 = *(void **)(a1 + 16);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __82__CNContactChangesNotifier_removeProxiesForObserver_forContact_completionHandler___block_invoke;
    v11[3] = &unk_1E29FC3C8;
    v12 = v8;
    v13 = a1;
    v14 = v7;
    v15 = v9;
    objc_msgSend(v10, "performBlock:", v11);

  }
}

void __82__CNContactChangesNotifier_removeProxiesForObserver_forContact_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD *v3;
  uint64_t v4;
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD *v14;
  _QWORD *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[5];
  _QWORD v21[5];
  id v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v3 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v28[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = *(_QWORD **)(a1 + 40);
    if (v5)
      v5 = (_QWORD *)v5[7];
    v3 = v5;
    objc_msgSend(v3, "allKeys");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v4;

  v7 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __82__CNContactChangesNotifier_removeProxiesForObserver_forContact_completionHandler___block_invoke_2;
  v21[3] = &unk_1E29FC3A0;
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(void **)(a1 + 48);
  v23 = &v24;
  v21[4] = v8;
  v22 = v9;
  objc_msgSend(v6, "_cn_each:", v21);
  if (*((_BYTE *)v25 + 24))
  {
    v10 = *(_QWORD **)(a1 + 40);
    if (v10)
      v10 = (_QWORD *)v10[3];
    v11 = v10;
    v20[0] = v7;
    v20[1] = 3221225472;
    v20[2] = __82__CNContactChangesNotifier_removeProxiesForObserver_forContact_completionHandler___block_invoke_4;
    v20[3] = &unk_1E29F8508;
    v20[4] = *(_QWORD *)(a1 + 40);
    objc_msgSend(v11, "performBlock:qualityOfService:", v20, 2);

    if (*(_QWORD *)(a1 + 56))
    {
      v12 = *(_QWORD **)(a1 + 40);
      if (v12)
        v12 = (_QWORD *)v12[4];
      v13 = v12;
      v18[0] = v7;
      v18[1] = 3221225472;
      v18[2] = __82__CNContactChangesNotifier_removeProxiesForObserver_forContact_completionHandler___block_invoke_5;
      v18[3] = &unk_1E29F9F70;
      v19 = *(id *)(a1 + 56);
      objc_msgSend(v13, "performBlock:", v18);

    }
  }
  else if (*(_QWORD *)(a1 + 56))
  {
    v14 = *(_QWORD **)(a1 + 40);
    if (v14)
      v14 = (_QWORD *)v14[4];
    v15 = v14;
    v16[0] = v7;
    v16[1] = 3221225472;
    v16[2] = __82__CNContactChangesNotifier_removeProxiesForObserver_forContact_completionHandler___block_invoke_6;
    v16[3] = &unk_1E29F9F70;
    v17 = *(id *)(a1 + 56);
    objc_msgSend(v15, "performBlock:", v16);

  }
  _Block_object_dispose(&v24, 8);
}

void __82__CNContactChangesNotifier_removeProxiesForObserver_forContact_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __82__CNContactChangesNotifier_removeProxiesForObserver_forContact_completionHandler___block_invoke_3;
  v5[3] = &unk_1E29FC378;
  v4 = *(_QWORD *)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = -[CNContactChangesNotifier resourceLock_removeProxiesForIdentifier:passingTest:](v4, a2, v5);

}

uint64_t __82__CNContactChangesNotifier_removeProxiesForObserver_forContact_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  _BOOL8 v4;

  if (!a2)
    return 1;
  WeakRetained = objc_loadWeakRetained((id *)(a2 + 16));
  if (!WeakRetained)
    return 1;
  v4 = WeakRetained == *(id *)(a1 + 32);

  return v4;
}

- (BOOL)resourceLock_removeProxiesForIdentifier:(void *)a3 passingTest:
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  _BOOL8 v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;

  v5 = a2;
  if (a1)
  {
    v6 = *(void **)(a1 + 56);
    v7 = a3;
    objc_msgSend(v6, "objectsForKey:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_cn_partition:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "second");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");
    v12 = objc_msgSend(v8, "count");
    v13 = v11 == v12;
    v14 = v11 != v12;
    if (v13)
    {
      objc_opt_class();
      +[CNContactChangesNotifier os_log]();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        -[CNContactChangesNotifier resourceLock_removeProxiesForIdentifier:passingTest:].cold.2(v8, v17);
    }
    else
    {
      v15 = objc_msgSend(v10, "count");
      v16 = *(void **)(a1 + 56);
      if (v15)
        objc_msgSend(v16, "setObjects:forKey:", v10, v5);
      else
        objc_msgSend(v16, "removeObjectsForKey:", v5);
      objc_msgSend(v9, "first");
      v17 = objc_claimAutoreleasedReturnValue();
      -[NSObject _cn_each:](v17, "_cn_each:", &__block_literal_global_37_1);
      objc_opt_class();
      +[CNContactChangesNotifier os_log]();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        -[CNContactChangesNotifier resourceLock_removeProxiesForIdentifier:passingTest:].cold.1(v17, v10, v18);

    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

void __82__CNContactChangesNotifier_removeProxiesForObserver_forContact_completionHandler___block_invoke_4(uint64_t a1)
{
  -[CNContactChangesNotifier workQueue_updateObserving](*(_QWORD *)(a1 + 32));
}

uint64_t __82__CNContactChangesNotifier_removeProxiesForObserver_forContact_completionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __82__CNContactChangesNotifier_removeProxiesForObserver_forContact_completionHandler___block_invoke_6(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v4 = *MEMORY[0x1E0CB2D68];
  v5[0] = CFSTR("The observer to be unregistered hasn't been found.");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNErrorFactory errorWithCode:userInfo:](CNErrorFactory, "errorWithCode:userInfo:", 1003, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v3);

}

id __80__CNContactChangesNotifier_resourceLock_removeProxiesForIdentifier_passingTest___block_invoke(uint64_t a1, uint64_t a2)
{
  id result;

  if (a2)
    return objc_storeWeak((id *)(a2 + 16), 0);
  return result;
}

- (void)timerDidEmitEvent:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];
  uint8_t buf[16];

  objc_opt_class();
  +[CNContactChangesNotifier os_log]();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18F8BD000, v4, OS_LOG_TYPE_INFO, "Will remove entries without observers", buf, 2u);
  }

  -[CNContactChangesNotifier removeProxiesForObserver:forContact:completionHandler:]((uint64_t)self, 0, 0, 0);
  objc_opt_class();
  +[CNContactChangesNotifier os_log]();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_18F8BD000, v5, OS_LOG_TYPE_INFO, "Did remove entries without observers", v6, 2u);
  }

}

- (void)contactStoreDidChange:(id)a3
{
  CNScheduler *workQueue;
  _QWORD v4[5];

  if (self)
    workQueue = self->_workQueue;
  else
    workQueue = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __50__CNContactChangesNotifier_contactStoreDidChange___block_invoke;
  v4[3] = &unk_1E29F8508;
  v4[4] = self;
  -[CNScheduler performBlock:](workQueue, "performBlock:", v4);
}

void __50__CNContactChangesNotifier_contactStoreDidChange___block_invoke(uint64_t a1)
{
  -[CNContactChangesNotifier workQueue_updateObservers](*(id **)(a1 + 32));
}

- (void)workQueue_updateObservers
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t i;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  CNContactFetchRequest *v11;
  void *v12;
  id v13;
  void *v14;
  CNContactFetchRequest *v15;
  _BOOL8 v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  uint64_t v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id WeakRetained;
  char v39;
  id v40;
  uint64_t v41;
  id v42;
  id v43;
  id obj;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  void *v49;
  uint64_t v50;
  uint64_t k;
  _QWORD v52[6];
  _QWORD v53[7];
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _QWORD v62[4];
  id v63;
  id v64;
  id v65;
  id v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _QWORD v75[6];
  uint64_t v76;
  uint64_t *v77;
  uint64_t v78;
  uint64_t (*v79)(uint64_t, uint64_t);
  void (*v80)(uint64_t);
  id v81;
  _BYTE v82[128];
  _BYTE v83[128];
  _BYTE v84[128];
  _BYTE v85[128];
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v48 = a1[5];
    v76 = 0;
    v77 = &v76;
    v78 = 0x3032000000;
    v79 = __Block_byref_object_copy__25;
    v80 = __Block_byref_object_dispose__25;
    v81 = 0;
    v2 = a1[2];
    v75[0] = MEMORY[0x1E0C809B0];
    v75[1] = 3221225472;
    v75[2] = __53__CNContactChangesNotifier_workQueue_updateObservers__block_invoke;
    v75[3] = &unk_1E29F7EA0;
    v75[5] = &v76;
    v75[4] = a1;
    objc_msgSend(v2, "performBlock:", v75);

    objc_msgSend((id)objc_opt_class(), "workQueue_createFetchersFromRegisteredObservers:", v77[5]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = 0u;
    v74 = 0u;
    v71 = 0u;
    v72 = 0u;
    obj = v3;
    v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v85, 16);
    if (v4)
    {
      v46 = *(_QWORD *)v72;
      do
      {
        v50 = v4;
        for (i = 0; i != v50; ++i)
        {
          if (*(_QWORD *)v72 != v46)
            objc_enumerationMutation(obj);
          v6 = *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * i);
          if (v6)
            v7 = *(void **)(v6 + 16);
          else
            v7 = 0;
          v8 = v7;
          objc_msgSend(v8, "allObjects");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          +[CNContact predicateForContactsWithIdentifiers:](CNContact, "predicateForContactsWithIdentifiers:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          v11 = [CNContactFetchRequest alloc];
          if (v6)
            v12 = *(void **)(v6 + 24);
          else
            v12 = 0;
          v13 = v12;
          objc_msgSend(v13, "allObjects");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = -[CNContactFetchRequest initWithKeysToFetch:](v11, "initWithKeysToFetch:", v14);

          -[CNContactFetchRequest setPredicate:](v15, "setPredicate:", v10);
          if (v6)
            v16 = *(_BYTE *)(v6 + 8) != 0;
          else
            v16 = 0;
          -[CNContactFetchRequest setUnifyResults:](v15, "setUnifyResults:", v16);
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v69 = 0u;
          v70 = 0u;
          v67 = 0u;
          v68 = 0u;
          if (v6)
            v18 = *(void **)(v6 + 16);
          else
            v18 = 0;
          v19 = v18;
          objc_msgSend(v19, "allObjects");
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v67, v84, 16);
          if (v21)
          {
            v22 = *(_QWORD *)v68;
            do
            {
              for (j = 0; j != v21; ++j)
              {
                if (*(_QWORD *)v68 != v22)
                  objc_enumerationMutation(v20);
                objc_msgSend((id)v77[5], "objectsForKey:", *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * j));
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                if (v24)
                  objc_msgSend(v17, "addObjectsFromArray:", v24);

              }
              v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v67, v84, 16);
            }
            while (v21);
          }

          v25 = a1[4];
          v26 = a1[2];
          v62[0] = MEMORY[0x1E0C809B0];
          v62[1] = 3221225472;
          v62[2] = __53__CNContactChangesNotifier_workQueue_updateObservers__block_invoke_51;
          v62[3] = &unk_1E29FC410;
          v27 = v17;
          v63 = v27;
          v64 = v49;
          v28 = v25;
          v65 = v28;
          v29 = v26;
          v66 = v29;
          objc_msgSend(v48, "enumerateContactsWithFetchRequest:error:usingBlock:", v15, 0, v62);

        }
        v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v85, 16);
      }
      while (v4);
    }

    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    objc_msgSend((id)v77[5], "allKeys");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v58, v83, 16);
    if (v47)
    {
      v45 = *(_QWORD *)v59;
      v43 = v30;
      do
      {
        for (k = 0; k != v47; ++k)
        {
          if (*(_QWORD *)v59 != v45)
            objc_enumerationMutation(v43);
          v31 = *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * k);
          if ((objc_msgSend(v49, "containsObject:", v31, v43) & 1) == 0)
          {
            objc_msgSend((id)v77[5], "objectsForKey:", v31);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v56 = 0u;
            v57 = 0u;
            v54 = 0u;
            v55 = 0u;
            v33 = v32;
            v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v54, v82, 16);
            if (v34)
            {
              v35 = *(_QWORD *)v55;
              do
              {
                v36 = 0;
                do
                {
                  if (*(_QWORD *)v55 != v35)
                    objc_enumerationMutation(v33);
                  v37 = *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * v36);
                  if (v37)
                    WeakRetained = objc_loadWeakRetained((id *)(v37 + 16));
                  else
                    WeakRetained = 0;
                  v39 = objc_opt_respondsToSelector();

                  if ((v39 & 1) != 0)
                  {
                    v40 = a1[4];
                    v53[0] = MEMORY[0x1E0C809B0];
                    v53[1] = 3221225472;
                    v53[2] = __53__CNContactChangesNotifier_workQueue_updateObservers__block_invoke_4;
                    v53[3] = &unk_1E29F84E0;
                    v53[4] = a1;
                    v53[5] = v37;
                    v53[6] = v31;
                    objc_msgSend(v40, "performBlock:", v53);

                  }
                  ++v36;
                }
                while (v34 != v36);
                v41 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v54, v82, 16);
                v34 = v41;
              }
              while (v41);
            }

            v42 = a1[2];
            v52[0] = MEMORY[0x1E0C809B0];
            v52[1] = 3221225472;
            v52[2] = __53__CNContactChangesNotifier_workQueue_updateObservers__block_invoke_6;
            v52[3] = &unk_1E29F7CE0;
            v52[4] = a1;
            v52[5] = v31;
            objc_msgSend(v42, "performBlock:", v52);

          }
        }
        v30 = v43;
        v47 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v58, v83, 16);
      }
      while (v47);
    }

    _Block_object_dispose(&v76, 8);
  }
}

void __53__CNContactChangesNotifier_workQueue_updateObservers__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD *v6;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
    v2 = (_QWORD *)v2[7];
  v6 = v2;
  v3 = objc_msgSend(v6, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __53__CNContactChangesNotifier_workQueue_updateObservers__block_invoke_51(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  uint64_t v24;
  char v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD v33[4];
  id v34;
  uint64_t v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v38;
    v30 = a1;
    v31 = *(_QWORD *)v38;
    do
    {
      v8 = 0;
      v32 = v6;
      do
      {
        if (*(_QWORD *)v38 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * v8);
        v5 = _block_invoke_0(v5, v3, (void *)v9);
        if ((_DWORD)v5)
        {
          v10 = *(void **)(a1 + 40);
          if (v9)
          {
            v11 = *(id *)(v9 + 32);
            objc_msgSend(v11, "identifier");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "addObject:", v12);

            v13 = v3;
            v14 = *(id *)(v9 + 32);
            v15 = *(_QWORD *)(v9 + 24);
          }
          else
          {
            objc_msgSend(0, "identifier");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "addObject:", v28);

            v29 = v3;
            v14 = 0;
            v15 = 0;
          }
          if (objc_msgSend(v14, "areKeysAvailable:", v15, v30))
          {
            v16 = v4;
            objc_msgSend(v3, "keyVector");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "keyVector");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v17, "isEqualToKeyVector:", v18) & 1) != 0)
            {
              v19 = v3;
            }
            else
            {
              if (v9)
                v20 = *(void **)(v9 + 24);
              else
                v20 = 0;
              v21 = v20;
              v19 = (id)objc_msgSend(v3, "copyWithPropertyKeys:", v21);

              if (v9)
                v22 = *(void **)(v9 + 24);
              else
                v22 = 0;
              v23 = v22;
              v24 = objc_msgSend(v14, "copyWithPropertyKeys:", v23);

              v14 = (id)v24;
              a1 = v30;
            }
            v25 = objc_msgSend(v19, "isEqual:", v14);

            v4 = v16;
            v7 = v31;
            if ((v25 & 1) == 0)
            {
LABEL_19:
              objc_msgSend(v19, "snapshot");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              -[CNContactChangesObserverProxy setContactSnapshot:](v9, v26);

              v33[0] = MEMORY[0x1E0C809B0];
              v33[1] = 3221225472;
              v33[2] = __53__CNContactChangesNotifier_workQueue_updateObservers__block_invoke_2;
              v33[3] = &unk_1E29F84E0;
              v27 = *(void **)(a1 + 48);
              v34 = *(id *)(a1 + 56);
              v35 = v9;
              v19 = v19;
              v36 = v19;
              objc_msgSend(v27, "performBlock:", v33);

            }
            v6 = v32;
            goto LABEL_21;
          }
          v19 = v3;
          goto LABEL_19;
        }
LABEL_21:
        ++v8;
      }
      while (v6 != v8);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      v6 = v5;
    }
    while (v5);
  }

}

void __53__CNContactChangesNotifier_workQueue_updateObservers__block_invoke_2(_QWORD *a1)
{
  void *v2;
  _QWORD v3[6];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__25;
  v8 = __Block_byref_object_dispose__25;
  v9 = 0;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __53__CNContactChangesNotifier_workQueue_updateObservers__block_invoke_3;
  v3[3] = &unk_1E29F7EA0;
  v2 = (void *)a1[4];
  v3[4] = a1[5];
  v3[5] = &v4;
  objc_msgSend(v2, "performBlock:", v3);
  objc_msgSend((id)v5[5], "contactDidChange:", a1[6]);
  _Block_object_dispose(&v4, 8);

}

void __53__CNContactChangesNotifier_workQueue_updateObservers__block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    WeakRetained = objc_loadWeakRetained((id *)(v2 + 16));
  else
    WeakRetained = 0;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = WeakRetained;

}

void __53__CNContactChangesNotifier_workQueue_updateObservers__block_invoke_4(_QWORD *a1)
{
  _QWORD *v2;
  _QWORD *v3;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__25;
  v9 = __Block_byref_object_dispose__25;
  v10 = 0;
  v2 = (_QWORD *)a1[4];
  if (v2)
    v2 = (_QWORD *)v2[2];
  v3 = v2;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __53__CNContactChangesNotifier_workQueue_updateObservers__block_invoke_5;
  v4[3] = &unk_1E29F7EA0;
  v4[4] = a1[5];
  v4[5] = &v5;
  objc_msgSend(v3, "performBlock:", v4);

  objc_msgSend((id)v6[5], "contactWithIdentifierWasDeleted:", a1[6]);
  _Block_object_dispose(&v5, 8);

}

void __53__CNContactChangesNotifier_workQueue_updateObservers__block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    WeakRetained = objc_loadWeakRetained((id *)(v2 + 16));
  else
    WeakRetained = 0;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = WeakRetained;

}

uint64_t __53__CNContactChangesNotifier_workQueue_updateObservers__block_invoke_6(uint64_t a1)
{
  _QWORD *v1;

  v1 = *(_QWORD **)(a1 + 32);
  if (v1)
    v1 = (_QWORD *)v1[7];
  return objc_msgSend(v1, "removeObjectsForKey:", *(_QWORD *)(a1 + 40));
}

+ (id)workQueue_createFetchersFromRegisteredObservers:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  CNContactChangesFetcher *v29;
  void *v30;
  void *v31;
  id obj;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v3;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  objc_msgSend(v3, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
  if (v37)
  {
    v34 = *(_QWORD *)v49;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v49 != v34)
          objc_enumerationMutation(obj);
        v39 = v4;
        v5 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * v4);
        objc_msgSend(v36, "objectsForKey:", v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E20], "set");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = 0u;
        v45 = 0u;
        v46 = 0u;
        v47 = 0u;
        v8 = v6;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
        if (v9)
        {
          v10 = v9;
          v11 = 0;
          v12 = *(_QWORD *)v45;
          do
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v45 != v12)
                objc_enumerationMutation(v8);
              v14 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i);
              if (v14)
              {
                v15 = *(id *)(v14 + 24);
                if (v15)
                  objc_msgSend(v7, "addObjectsFromArray:", v15);
                LOBYTE(v14) = *(_BYTE *)(v14 + 8) != 0;

              }
              v11 |= v14;
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
          }
          while (v10);
        }
        else
        {
          v11 = 0;
        }
        v38 = v5;

        v42 = 0u;
        v43 = 0u;
        v40 = 0u;
        v41 = 0u;
        v16 = v35;
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
        if (v17)
        {
          v18 = v17;
          v19 = *(_QWORD *)v41;
          while (2)
          {
            v20 = 0;
            do
            {
              if (*(_QWORD *)v41 != v19)
                objc_enumerationMutation(v16);
              v21 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * v20);
              if (v21)
                v22 = *(void **)(v21 + 24);
              else
                v22 = 0;
              v23 = v22;
              if (objc_msgSend(v23, "isEqual:", v7))
              {
                if (v21)
                {
                  v24 = v11 ^ (*(_BYTE *)(v21 + 8) != 0);

                  if ((v24 & 1) == 0)
                  {
                    v27 = *(void **)(v21 + 16);
                    goto LABEL_38;
                  }
                }
                else
                {

                  if ((v11 & 1) == 0)
                  {
                    v27 = 0;
LABEL_38:
                    v26 = v38;
                    objc_msgSend(v27, "setByAddingObject:", v38);
                    v28 = (void *)objc_claimAutoreleasedReturnValue();
                    -[CNContactChangesFetcher setIdentifiers:](v21, v28);
                    v29 = (CNContactChangesFetcher *)(id)v21;

                    if (v21)
                      goto LABEL_42;
                    goto LABEL_39;
                  }
                }
              }
              else
              {

              }
              ++v20;
            }
            while (v18 != v20);
            v25 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
            v18 = v25;
            if (v25)
              continue;
            break;
          }
        }

        v26 = v38;
LABEL_39:
        v29 = objc_alloc_init(CNContactChangesFetcher);
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v26);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNContactChangesFetcher setIdentifiers:]((uint64_t)v29, v30);

        -[CNChangesNotifierProxy setRemovalBlocks:]((uint64_t)v29, v7);
        if (v29)
          v29->_unify = v11 & 1;
        objc_msgSend(v16, "addObject:", v29);
LABEL_42:

        v4 = v39 + 1;
      }
      while (v39 + 1 != v37);
      v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
    }
    while (v37);
  }

  v31 = (void *)objc_msgSend(v35, "copy");
  return v31;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registeredObservers, 0);
  objc_storeStrong((id *)&self->_entryCompactionTimer, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_downstream, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_resourceLock, 0);
}

- (void)resourceLock_removeProxiesForIdentifier:(NSObject *)a3 passingTest:.cold.1(void *a1, void *a2, NSObject *a3)
{
  uint64_t v6;
  const __CFString *v7;
  uint64_t v8;
  const __CFString *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  const __CFString *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = objc_msgSend(a1, "count");
  if (objc_msgSend(a1, "count") == 1)
    v7 = CFSTR("entry");
  else
    v7 = CFSTR("entries");
  v8 = objc_msgSend(a2, "count");
  v10 = 134218754;
  if (objc_msgSend(a2, "count") == 1)
    v9 = CFSTR("entry");
  else
    v9 = CFSTR("entries");
  v11 = v6;
  v12 = 2112;
  v13 = v7;
  v14 = 2048;
  v15 = v8;
  v16 = 2112;
  v17 = v9;
  _os_log_debug_impl(&dword_18F8BD000, a3, OS_LOG_TYPE_DEBUG, "Removing %lu %@, keeping %lu %@", (uint8_t *)&v10, 0x2Au);
}

- (void)resourceLock_removeProxiesForIdentifier:(void *)a1 passingTest:(NSObject *)a2 .cold.2(void *a1, NSObject *a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 134217984;
  v4 = objc_msgSend(a1, "count");
  _os_log_debug_impl(&dword_18F8BD000, a2, OS_LOG_TYPE_DEBUG, "No entries were removed (total: %lu)", (uint8_t *)&v3, 0xCu);
}

@end
