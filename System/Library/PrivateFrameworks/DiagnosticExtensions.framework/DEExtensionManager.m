@implementation DEExtensionManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_3);
  return (id)sharedInstance__manager;
}

uint64_t __36__DEExtensionManager_sharedInstance__block_invoke()
{
  DEExtensionManager *v0;
  void *v1;
  dispatch_queue_t v2;
  dispatch_queue_t v3;
  void *v4;

  v0 = objc_alloc_init(DEExtensionManager);
  v1 = (void *)sharedInstance__manager;
  sharedInstance__manager = (uint64_t)v0;

  v2 = dispatch_queue_create("initialLoadQueue", 0);
  objc_msgSend((id)sharedInstance__manager, "setInitialLoadQueue:", v2);

  v3 = dispatch_queue_create("extendedQueue", MEMORY[0x1E0C80D50]);
  v4 = (void *)extendedQueue;
  extendedQueue = (uint64_t)v3;

  objc_msgSend((id)sharedInstance__manager, "setAfterExtendedBlock:", 0);
  return objc_msgSend((id)sharedInstance__manager, "setExtendedLoaded:", 0);
}

- (id)extensionForIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[DEExtensionManager extensions](self, "extensions", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (DEExtensionManager)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DEExtensionManager;
  return -[DEExtensionManager init](&v3, sel_init);
}

- (void)loadExtensions
{
  NSObject *v3;
  dispatch_semaphore_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[5];
  dispatch_semaphore_t v9;
  uint8_t buf[8];
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  +[DELogging fwHandle](DELogging, "fwHandle");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A4EEE000, v3, OS_LOG_TYPE_DEFAULT, "Start loading extension initial info", buf, 2u);
  }

  v4 = dispatch_semaphore_create(0);
  v11 = *MEMORY[0x1E0CB2A28];
  v12[0] = CFSTR("com.apple.diagnosticextensions-service");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB35D8];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __36__DEExtensionManager_loadExtensions__block_invoke;
  v8[3] = &unk_1E4E35798;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "extensionsWithMatchingAttributes:completion:", v5, v8);
  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);

}

void __36__DEExtensionManager_loadExtensions__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  DEExtension *v15;
  DEExtension *v16;
  id v17;
  NSObject *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    +[DELogging fwHandle](DELogging, "fwHandle");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v6;
      _os_log_impl(&dword_1A4EEE000, v7, OS_LOG_TYPE_DEFAULT, "Error discovering extensions: %@", buf, 0xCu);
    }

  }
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v20;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v13);
        v15 = [DEExtension alloc];
        v16 = -[DEExtension initWithNSExtension:](v15, "initWithNSExtension:", v14, (_QWORD)v19);
        objc_msgSend(v8, "addObject:", v16);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v11);
  }

  v17 = (id)objc_msgSend(v8, "sortedArrayUsingComparator:", &__block_literal_global_17);
  +[DELogging fwHandle](DELogging, "fwHandle");
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A4EEE000, v18, OS_LOG_TYPE_INFO, "Finished loading extension initial info", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "setExtensions:", v8);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

uint64_t __36__DEExtensionManager_loadExtensions__block_invoke_15(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "attachmentsName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attachmentsName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "caseInsensitiveCompare:", v6);
  return v7;
}

- (id)extensionsWithFilter:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[4];
  id v10;
  DEExtensionManager *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__1;
  v17 = __Block_byref_object_dispose__1;
  v18 = 0;
  -[DEExtensionManager initialLoadQueue](self, "initialLoadQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__DEExtensionManager_extensionsWithFilter___block_invoke;
  block[3] = &unk_1E4E357C0;
  v11 = self;
  v12 = &v13;
  v10 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v7;
}

void __43__DEExtensionManager_extensionsWithFilter___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    objc_msgSend(*(id *)(a1 + 40), "extensions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v18 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          v11 = *(void **)(a1 + 32);
          objc_msgSend(v10, "identifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v11) = objc_msgSend(v11, "containsObject:", v12);

          if ((_DWORD)v11)
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v10);
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v7);
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "extensions");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v16, "mutableCopy");
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

  }
}

- (OS_dispatch_queue)initialLoadQueue
{
  return self->_initialLoadQueue;
}

- (void)setInitialLoadQueue:(id)a3
{
  objc_storeStrong((id *)&self->_initialLoadQueue, a3);
}

- (NSArray)extensions
{
  return self->_extensions;
}

- (void)setExtensions:(id)a3
{
  objc_storeStrong((id *)&self->_extensions, a3);
}

- (id)afterExtendedBlock
{
  return self->_afterExtendedBlock;
}

- (void)setAfterExtendedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)extendedLoaded
{
  return self->_extendedLoaded;
}

- (void)setExtendedLoaded:(BOOL)a3
{
  self->_extendedLoaded = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_afterExtendedBlock, 0);
  objc_storeStrong((id *)&self->_extensions, 0);
  objc_storeStrong((id *)&self->_initialLoadQueue, 0);
}

@end
