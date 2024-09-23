@implementation NTKBundleComplicationMigrationCompanionDevicePrewarmer

+ (void)run
{
  if (run_onceToken != -1)
    dispatch_once(&run_onceToken, &__block_literal_global_143);
}

void __61__NTKBundleComplicationMigrationCompanionDevicePrewarmer_run__block_invoke()
{
  NSObject *v0;
  uint64_t v1;
  void *v2;
  uint8_t v3[16];

  _NTKLoggingObjectForDomain(56, (uint64_t)"NTKLoggingDomainBundleComplicationMigration");
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1B72A3000, v0, OS_LOG_TYPE_DEFAULT, "CompanionDevicePrewarmer: Starting", v3, 2u);
  }

  v1 = objc_opt_new();
  v2 = (void *)run_prewarmer;
  run_prewarmer = v1;

}

- (NTKBundleComplicationMigrationCompanionDevicePrewarmer)init
{
  NTKBundleComplicationMigrationCompanionDevicePrewarmer *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  uint64_t v6;
  NSMutableDictionary *queue_failureCount;
  void *v8;
  void *v9;
  NSObject *v10;
  _QWORD block[4];
  NTKBundleComplicationMigrationCompanionDevicePrewarmer *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)NTKBundleComplicationMigrationCompanionDevicePrewarmer;
  v2 = -[NTKBundleComplicationMigrationCompanionDevicePrewarmer init](&v14, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.NanoTimeKit.NTKBundleComplicationMigrationCompanionDevicePrewarmer", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v6 = objc_opt_new();
    queue_failureCount = v2->_queue_failureCount;
    v2->_queue_failureCount = (NSMutableDictionary *)v6;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v2, sel__handlePairedNotification, *MEMORY[0x1E0D517C0], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v2, sel__handleUnpairedNotification, *MEMORY[0x1E0D517D0], 0);

    v10 = v2->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __62__NTKBundleComplicationMigrationCompanionDevicePrewarmer_init__block_invoke;
    block[3] = &unk_1E6BCD5F0;
    v13 = v2;
    dispatch_async(v10, block);

  }
  return v2;
}

uint64_t __62__NTKBundleComplicationMigrationCompanionDevicePrewarmer_init__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_purgeCaches");
  return objc_msgSend(*(id *)(a1 + 32), "_queue_prewarmIfNeeded");
}

- (void)_queue_prewarmIfNeeded
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_queue_servicing)
  {
    -[NTKBundleComplicationMigrationCompanionDevicePrewarmer _nextDeviceToPrewarm](self, "_nextDeviceToPrewarm");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      self->_queue_servicing = 1;
      _NTKLoggingObjectForDomain(56, (uint64_t)"NTKLoggingDomainBundleComplicationMigration");
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v3, "nrDeviceUUID");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v11 = v5;
        _os_log_impl(&dword_1B72A3000, v4, OS_LOG_TYPE_DEFAULT, "CompanionDevicePrewarmer: Prewarming %@ migration lookup", buf, 0xCu);

      }
      +[NTKBundleComplicationMigrationProvider cachedInstance](NTKBundleComplicationMigrationProvider, "cachedInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __80__NTKBundleComplicationMigrationCompanionDevicePrewarmer__queue_prewarmIfNeeded__block_invoke;
      v8[3] = &unk_1E6BD8CF8;
      v8[4] = self;
      v9 = v3;
      objc_msgSend(v6, "ensureTypeLookupForDevice:completion:", v9, v8);

    }
    else
    {
      _NTKLoggingObjectForDomain(56, (uint64_t)"NTKLoggingDomainBundleComplicationMigration");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B72A3000, v7, OS_LOG_TYPE_DEFAULT, "CompanionDevicePrewarmer: Nothing to service", buf, 2u);
      }

    }
  }
}

void __80__NTKBundleComplicationMigrationCompanionDevicePrewarmer__queue_prewarmIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  uint64_t v10;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__NTKBundleComplicationMigrationCompanionDevicePrewarmer__queue_prewarmIfNeeded__block_invoke_2;
  block[3] = &unk_1E6BCDCB8;
  v8 = v4;
  v9 = v3;
  v10 = *(_QWORD *)(a1 + 32);
  v6 = v3;
  dispatch_async(v5, block);

}

uint64_t __80__NTKBundleComplicationMigrationCompanionDevicePrewarmer__queue_prewarmIfNeeded__block_invoke_2(uint64_t a1)
{
  void *v2;
  char v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  +[NTKBundleComplicationMigrationProvider cachedInstance](NTKBundleComplicationMigrationProvider, "cachedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasTypeLookupForDevice:", *(_QWORD *)(a1 + 32));

  v4 = *(_QWORD *)(a1 + 40);
  _NTKLoggingObjectForDomain(56, (uint64_t)"NTKLoggingDomainBundleComplicationMigration");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 || (v3 & 1) == 0)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __80__NTKBundleComplicationMigrationCompanionDevicePrewarmer__queue_prewarmIfNeeded__block_invoke_2_cold_1((id *)(a1 + 32), (uint64_t *)(a1 + 40), v6);

    objc_msgSend(*(id *)(a1 + 48), "_incrementFailureCountForDevice:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "nrDeviceUUID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v7;
      _os_log_impl(&dword_1B72A3000, v6, OS_LOG_TYPE_DEFAULT, "CompanionDevicePrewarmer: Finished prewarming %@", (uint8_t *)&v9, 0xCu);

    }
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 48) + 24) = 0;
  return objc_msgSend(*(id *)(a1 + 48), "_queue_prewarmIfNeeded");
}

- (id)_nextDeviceToPrewarm
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v9[5];
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(MEMORY[0x1E0D51838], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__44;
  v15 = __Block_byref_object_dispose__44;
  v16 = (id)objc_opt_new();
  objc_msgSend(v3, "getPairedDevices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __78__NTKBundleComplicationMigrationCompanionDevicePrewarmer__nextDeviceToPrewarm__block_invoke;
  v10[3] = &unk_1E6BD8D20;
  v10[4] = self;
  v10[5] = &v11;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v10);

  if (objc_msgSend((id)v12[5], "count"))
  {
    v6 = (void *)v12[5];
    v9[0] = v5;
    v9[1] = 3221225472;
    v9[2] = __78__NTKBundleComplicationMigrationCompanionDevicePrewarmer__nextDeviceToPrewarm__block_invoke_2;
    v9[3] = &unk_1E6BD8D48;
    v9[4] = self;
    objc_msgSend(v6, "sortUsingComparator:", v9);
    objc_msgSend((id)v12[5], "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  _Block_object_dispose(&v11, 8);

  return v7;
}

void __78__NTKBundleComplicationMigrationCompanionDevicePrewarmer__nextDeviceToPrewarm__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  char v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0C944B0], "deviceForNRDevice:", a2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  +[NTKBundleComplicationMigrationProvider cachedInstance](NTKBundleComplicationMigrationProvider, "cachedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasTypeLookupForDevice:", v5);

  if ((v4 & 1) == 0 && (unint64_t)objc_msgSend(*(id *)(a1 + 32), "_failureCountForDevice:", v5) <= 2)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v5);

}

uint64_t __78__NTKBundleComplicationMigrationCompanionDevicePrewarmer__nextDeviceToPrewarm__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  unint64_t v8;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "isBridgeActive") && !objc_msgSend(v6, "isBridgeActive"))
  {
    v7 = -1;
  }
  else if ((objc_msgSend(v5, "isBridgeActive") & 1) != 0 || (objc_msgSend(v6, "isBridgeActive") & 1) == 0)
  {
    v8 = objc_msgSend(*(id *)(a1 + 32), "_failureCountForDevice:", v5);
    if (v8 >= objc_msgSend(*(id *)(a1 + 32), "_failureCountForDevice:", v6))
      v7 = 0;
    else
      v7 = -1;
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (unint64_t)_failureCountForDevice:(id)a3
{
  NSObject *queue;
  id v5;
  NSMutableDictionary *queue_failureCount;
  void *v7;
  void *v8;
  unint64_t v9;

  queue = self->_queue;
  v5 = a3;
  dispatch_assert_queue_V2(queue);
  queue_failureCount = self->_queue_failureCount;
  objc_msgSend(v5, "nrDeviceUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary objectForKey:](queue_failureCount, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedIntegerValue");

  return v9;
}

- (void)_incrementFailureCountForDevice:(id)a3
{
  NSObject *queue;
  id v5;
  NSMutableDictionary *queue_failureCount;
  void *v7;
  void *v8;
  uint64_t v9;
  NSMutableDictionary *v10;
  void *v11;
  id v12;

  queue = self->_queue;
  v5 = a3;
  dispatch_assert_queue_V2(queue);
  queue_failureCount = self->_queue_failureCount;
  objc_msgSend(v5, "nrDeviceUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](queue_failureCount, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedIntegerValue");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v9 + 1);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v10 = self->_queue_failureCount;
  objc_msgSend(v5, "nrDeviceUUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v12, v11);
}

- (void)_purgeCaches
{
  void *v2;
  void *v3;
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  void *v21;
  int v22;
  id v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  char v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD v35[4];
  id v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  id v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0D51838], "sharedInstance");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "getPairedDevices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __70__NTKBundleComplicationMigrationCompanionDevicePrewarmer__purgeCaches__block_invoke;
  v35[3] = &unk_1E6BD8D70;
  v4 = v2;
  v36 = v4;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v35);

  v5 = 0x1E0CB3000uLL;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NTKBundleComplicationMigrationServiceLookupDirectory();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "enumeratorAtPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v32;
    v27 = v9;
    v28 = v4;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v32 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v13);
        v30 = 0;
        objc_msgSend(*(id *)(v5 + 1568), "defaultManager");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "fileExistsAtPath:isDirectory:", v14, &v30);

        if (!v30)
        {
          objc_msgSend(v14, "lastPathComponent");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "stringByDeletingPathExtension");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if ((objc_msgSend(v4, "containsObject:", v17) & 1) == 0)
          {
            NTKBundleComplicationMigrationServiceLookupDirectory();
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "stringByAppendingPathComponent:", v14);
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            v20 = v5;
            objc_msgSend(*(id *)(v5 + 1568), "defaultManager");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = 0;
            v22 = objc_msgSend(v21, "removeItemAtPath:error:", v19, &v29);
            v23 = v29;

            _NTKLoggingObjectForDomain(56, (uint64_t)"NTKLoggingDomainBundleComplicationMigration");
            v24 = objc_claimAutoreleasedReturnValue();
            v25 = v24;
            if (v22)
            {
              if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v38 = v14;
                _os_log_impl(&dword_1B72A3000, v25, OS_LOG_TYPE_DEFAULT, "CompanionDevicePrewarmer: Purged %@", buf, 0xCu);
              }
            }
            else if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v38 = v14;
              v39 = 2112;
              v40 = v23;
              _os_log_error_impl(&dword_1B72A3000, v25, OS_LOG_TYPE_ERROR, "CompanionDevicePrewarmer: Error purging %@: %@", buf, 0x16u);
            }

            v5 = v20;
            v9 = v27;
            v4 = v28;
          }

        }
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
    }
    while (v11);
  }

}

void __70__NTKBundleComplicationMigrationCompanionDevicePrewarmer__purgeCaches__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "pairingID");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (void)_handlePairedNotification
{
  NSObject *v3;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[16];

  _NTKLoggingObjectForDomain(56, (uint64_t)"NTKLoggingDomainBundleComplicationMigration");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B72A3000, v3, OS_LOG_TYPE_DEFAULT, "CompanionDevicePrewarmer: Received paired notification", buf, 2u);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83__NTKBundleComplicationMigrationCompanionDevicePrewarmer__handlePairedNotification__block_invoke;
  block[3] = &unk_1E6BCD5F0;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __83__NTKBundleComplicationMigrationCompanionDevicePrewarmer__handlePairedNotification__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_prewarmIfNeeded");
}

- (void)_handleUnpairedNotification
{
  NSObject *v3;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[16];

  _NTKLoggingObjectForDomain(56, (uint64_t)"NTKLoggingDomainBundleComplicationMigration");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B72A3000, v3, OS_LOG_TYPE_DEFAULT, "CompanionDevicePrewarmer: Received unpaired notification", buf, 2u);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __85__NTKBundleComplicationMigrationCompanionDevicePrewarmer__handleUnpairedNotification__block_invoke;
  block[3] = &unk_1E6BCD5F0;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __85__NTKBundleComplicationMigrationCompanionDevicePrewarmer__handleUnpairedNotification__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_purgeCaches");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_queue_failureCount, 0);
}

void __80__NTKBundleComplicationMigrationCompanionDevicePrewarmer__queue_prewarmIfNeeded__block_invoke_2_cold_1(id *a1, uint64_t *a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*a1, "nrDeviceUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *a2;
  v7 = 138412546;
  v8 = v5;
  v9 = 2112;
  v10 = v6;
  _os_log_error_impl(&dword_1B72A3000, a3, OS_LOG_TYPE_ERROR, "CompanionDevicePrewarmer: Error prewarming for %@: %@", (uint8_t *)&v7, 0x16u);

}

@end
