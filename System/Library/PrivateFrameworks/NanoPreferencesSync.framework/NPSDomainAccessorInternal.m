@implementation NPSDomainAccessorInternal

+ (BOOL)domainIsValid:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;

  v3 = a3;
  v4 = v3;
  v5 = v3
    && objc_msgSend(v3, "rangeOfString:", CFSTR("/")) == 0x7FFFFFFFFFFFFFFFLL
    && objc_msgSend(v4, "rangeOfString:", CFSTR("..")) == 0x7FFFFFFFFFFFFFFFLL;

  return v5;
}

+ (void)initialize
{
  NSObject *v3;
  dispatch_queue_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v12;
  void *v13;
  void *v14;
  void (**v15)(_QWORD);
  void *v16;
  void *v17;
  NSObject *v18;
  _QWORD v19[5];
  _QWORD v20[4];
  id v21;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = dispatch_queue_create("com.apple.nanoprefsync.frmrk.internalAccessors", v3);
  v5 = (void *)internalAccessorsQueue;
  internalAccessorsQueue = (uint64_t)v4;

  v6 = objc_opt_new();
  v7 = (void *)internalAccessors;
  internalAccessors = v6;

  uiApplicationClass = (uint64_t)NSClassFromString(CFSTR("UIApplication"));
  objc_msgSend((id)uiApplicationClass, "sharedApplication");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  if (v8)
  {
    while (!__ldaxr((unsigned int *)&applicationEnteredBackground))
    {
      if (!__stlxr(1u, (unsigned int *)&applicationEnteredBackground))
        goto LABEL_12;
    }
    __clrex();
LABEL_12:
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", a1, sel_applicationDidResume, CFSTR("UIApplicationDidBecomeActiveNotification"), v8);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:selector:name:object:", a1, sel_applicationDidEnterBackground, CFSTR("UIApplicationDidEnterBackgroundNotification"), v8);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", a1, sel_applicationDidResume, CFSTR("UIApplicationResumedNotification"), v8);

    v20[0] = v9;
    v20[1] = 3221225472;
    v20[2] = __39__NPSDomainAccessorInternal_initialize__block_invoke;
    v20[3] = &unk_1E68E5CF0;
    v21 = v8;
    v15 = (void (**)(_QWORD))MEMORY[0x1B5E49A1C](v20);
    if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
      v15[2](v15);
    else
      dispatch_async(MEMORY[0x1E0C80D38], v15);

  }
  else
  {
    if (ProcessIsExtension_once != -1)
      dispatch_once(&ProcessIsExtension_once, &__block_literal_global_263);
    if (ProcessIsExtension_result)
    {
      while (!__ldaxr((unsigned int *)&applicationEnteredBackground))
      {
        if (!__stlxr(1u, (unsigned int *)&applicationEnteredBackground))
          goto LABEL_17;
      }
      __clrex();
LABEL_17:
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addObserver:selector:name:object:", a1, sel_extensionDidBecomeActive, *MEMORY[0x1E0CB29E8], 0);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addObserver:selector:name:object:", a1, sel_extensionWillResignActive, *MEMORY[0x1E0CB2A00], 0);

    }
  }
  v18 = dispatch_source_create(MEMORY[0x1E0C80DA8], 0, 6uLL, (dispatch_queue_t)internalAccessorsQueue);
  v19[0] = v9;
  v19[1] = 3221225472;
  v19[2] = __39__NPSDomainAccessorInternal_initialize__block_invoke_17;
  v19[3] = &__block_descriptor_40_e5_v8__0l;
  v19[4] = a1;
  dispatch_source_set_event_handler(v18, v19);
  dispatch_resume(v18);

}

void __39__NPSDomainAccessorInternal_initialize__block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  unsigned int v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v1 = objc_msgSend(*(id *)(a1 + 32), "applicationState");
  v2 = nps_domain_accessor_log;
  if (os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 134217984;
    v5 = v1;
    _os_log_impl(&dword_1B5280000, v2, OS_LOG_TYPE_DEFAULT, "Application state: %ld", (uint8_t *)&v4, 0xCu);
  }
  if (!v1)
  {
    while (1)
    {
      v3 = __ldaxr((unsigned int *)&applicationEnteredBackground);
      if (v3 != 1)
        break;
      if (!__stlxr(0, (unsigned int *)&applicationEnteredBackground))
        return;
    }
    __clrex();
  }
}

+ (void)applicationDidResume
{
  NSObject *v2;
  unsigned int v3;
  uint8_t v4[16];

  v2 = nps_domain_accessor_log;
  if (os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1B5280000, v2, OS_LOG_TYPE_DEFAULT, (const char *)&unk_1B528BE3F, v4, 2u);
  }
  while (1)
  {
    v3 = __ldaxr((unsigned int *)&applicationEnteredBackground);
    if (v3 != 1)
      break;
    if (!__stlxr(0, (unsigned int *)&applicationEnteredBackground))
      return;
  }
  __clrex();
}

void __39__NPSDomainAccessorInternal_initialize__block_invoke_17(uint64_t a1)
{
  double Current;

  Current = CFAbsoluteTimeGetCurrent();
  if (Current - *(double *)&_block_invoke_lastFlush > 10.0)
    objc_msgSend(*(id *)(a1 + 32), "invalidateAndReleaseUnreferencedAccessors");
  _block_invoke_lastFlush = *(_QWORD *)&Current;
}

+ (void)applicationDidEnterBackground
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  _QWORD block[5];
  uint8_t buf[16];

  v2 = nps_domain_accessor_log;
  if (os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B5280000, v2, OS_LOG_TYPE_DEFAULT, (const char *)&unk_1B528BE3F, buf, 2u);
  }
  objc_msgSend((id)uiApplicationClass, "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "beginBackgroundTaskWithName:expirationHandler:", CFSTR("NPSDomainAccessorInternal"), &__block_literal_global_1);

  while (!__ldaxr((unsigned int *)&applicationEnteredBackground))
  {
    if (!__stlxr(1u, (unsigned int *)&applicationEnteredBackground))
      goto LABEL_8;
  }
  __clrex();
LABEL_8:
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__NPSDomainAccessorInternal_applicationDidEnterBackground__block_invoke_20;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v4;
  dispatch_async((dispatch_queue_t)internalAccessorsQueue, block);
}

void __58__NPSDomainAccessorInternal_applicationDidEnterBackground__block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  v0 = nps_domain_accessor_log;
  if (os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1B5280000, v0, OS_LOG_TYPE_DEFAULT, "Expiration handler called", v1, 2u);
  }
}

void __58__NPSDomainAccessorInternal_applicationDidEnterBackground__block_invoke_20(uint64_t a1)
{
  id v2;

  objc_msgSend((id)internalAccessors, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_22);
  objc_msgSend((id)uiApplicationClass, "sharedApplication");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endBackgroundTask:", *(_QWORD *)(a1 + 32));

}

uint64_t __58__NPSDomainAccessorInternal_applicationDidEnterBackground__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_24);
}

uint64_t __58__NPSDomainAccessorInternal_applicationDidEnterBackground__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "invalidatePresenter");
}

+ (void)extensionDidBecomeActive
{
  NSObject *v2;
  unsigned int v3;
  uint8_t v4[16];

  v2 = nps_domain_accessor_log;
  if (os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1B5280000, v2, OS_LOG_TYPE_DEFAULT, (const char *)&unk_1B528BE3F, v4, 2u);
  }
  while (1)
  {
    v3 = __ldaxr((unsigned int *)&applicationEnteredBackground);
    if (v3 != 1)
      break;
    if (!__stlxr(0, (unsigned int *)&applicationEnteredBackground))
      return;
  }
  __clrex();
}

+ (void)extensionWillResignActive
{
  NSObject *v2;
  void *v4;
  uint8_t v5[16];

  v2 = nps_domain_accessor_log;
  if (os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1B5280000, v2, OS_LOG_TYPE_DEFAULT, (const char *)&unk_1B528BE3F, v5, 2u);
  }
  while (!__ldaxr((unsigned int *)&applicationEnteredBackground))
  {
    if (!__stlxr(1u, (unsigned int *)&applicationEnteredBackground))
      goto LABEL_7;
  }
  __clrex();
LABEL_7:
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "performExpiringActivityWithReason:usingBlock:", CFSTR("NPSDomainAccessor"), &__block_literal_global_29);

}

void __54__NPSDomainAccessorInternal_extensionWillResignActive__block_invoke(uint64_t a1, int a2)
{
  NSObject *v3;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = nps_domain_accessor_log;
  if (os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109120;
    v4[1] = a2;
    _os_log_impl(&dword_1B5280000, v3, OS_LOG_TYPE_DEFAULT, "expired: (%d)", (uint8_t *)v4, 8u);
  }
  dispatch_sync((dispatch_queue_t)internalAccessorsQueue, &__block_literal_global_31);
}

uint64_t __54__NPSDomainAccessorInternal_extensionWillResignActive__block_invoke_30()
{
  return objc_msgSend((id)internalAccessors, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_32);
}

uint64_t __54__NPSDomainAccessorInternal_extensionWillResignActive__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_33);
}

uint64_t __54__NPSDomainAccessorInternal_extensionWillResignActive__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "invalidatePresenter");
}

+ (id)internalAccessorForPairingID:(id)a3 pairingDataStore:(id)a4 domain:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__0;
  v25 = __Block_byref_object_dispose__0;
  v26 = 0;
  v10 = internalAccessorsQueue;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __82__NPSDomainAccessorInternal_internalAccessorForPairingID_pairingDataStore_domain___block_invoke;
  v16[3] = &unk_1E68E6108;
  v17 = v7;
  v18 = v9;
  v19 = v8;
  v20 = &v21;
  v11 = v8;
  v12 = v9;
  v13 = v7;
  dispatch_sync(v10, v16);
  v14 = (id)v22[5];

  _Block_object_dispose(&v21, 8);
  return v14;
}

void __82__NPSDomainAccessorInternal_internalAccessorForPairingID_pairingDataStore_domain___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  NPSDomainAccessorInternal *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NPSDomainAccessorInternal *v14;
  uint64_t v15;
  void *v16;
  id v17;
  _QWORD block[5];

  objc_msgSend((id)internalAccessors, "objectForKey:", a1[4]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    objc_msgSend(v2, "objectForKey:", a1[5]);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1[7] + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

    v7 = *(_QWORD *)(a1[7] + 8);
    v8 = *(void **)(v7 + 40);
    if (v8)
    {
      objc_msgSend(v8, "setReferenceCounter:", objc_msgSend(*(id *)(v7 + 40), "referenceCounter") + 1);
      objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "internalQueue");
      v9 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __82__NPSDomainAccessorInternal_internalAccessorForPairingID_pairingDataStore_domain___block_invoke_2;
      block[3] = &unk_1E68E60E0;
      block[4] = a1[7];
      dispatch_async(v9, block);

    }
    else
    {
      v14 = -[NPSDomainAccessorInternal initWithPairingID:pairingDataStore:domain:]([NPSDomainAccessorInternal alloc], "initWithPairingID:pairingDataStore:domain:", a1[4], a1[6], a1[5]);
      v15 = *(_QWORD *)(a1[7] + 8);
      v16 = *(void **)(v15 + 40);
      *(_QWORD *)(v15 + 40) = v14;

      objc_msgSend(v3, "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40), a1[5]);
    }
  }
  else
  {
    v10 = -[NPSDomainAccessorInternal initWithPairingID:pairingDataStore:domain:]([NPSDomainAccessorInternal alloc], "initWithPairingID:pairingDataStore:domain:", a1[4], a1[6], a1[5]);
    v11 = *(_QWORD *)(a1[7] + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    if (*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40))
    {
      v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithObjectsAndKeys:", *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40), a1[5], 0);
      objc_msgSend((id)internalAccessors, "setObject:forKey:", v3, a1[4]);
      v13 = *(void **)(*(_QWORD *)(a1[7] + 8) + 40);
    }
    else
    {
      v13 = 0;
      v3 = 0;
    }
    v17 = (id)objc_msgSend(v13, "createNanoSettingsDirectory");
  }

}

void __82__NPSDomainAccessorInternal_internalAccessorForPairingID_pairingDataStore_domain___block_invoke_2(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "filePresenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setHasReadFromDisk:", 0);
}

+ (void)decrementInternalAccessorReferenceCount:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;

  v3 = a3;
  v4 = internalAccessorsQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__NPSDomainAccessorInternal_decrementInternalAccessorReferenceCount___block_invoke;
  block[3] = &unk_1E68E5CF0;
  v7 = v3;
  v5 = v3;
  dispatch_sync(v4, block);

}

uint64_t __69__NPSDomainAccessorInternal_decrementInternalAccessorReferenceCount___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t result;

  v1 = *(void **)(a1 + 32);
  v2 = objc_msgSend(v1, "referenceCounter");
  result = objc_msgSend(v1, "setReferenceCounter:", v2 - 1);
  if (!v2)
    __69__NPSDomainAccessorInternal_decrementInternalAccessorReferenceCount___block_invoke_cold_1();
  return result;
}

- (void)invalidatePresenter
{
  NSObject *v3;
  NSObject *internalQueue;
  _QWORD block[5];
  uint8_t buf[4];
  NPSDomainAccessorInternal *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = nps_domain_accessor_log;
  if (os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v7 = self;
    _os_log_impl(&dword_1B5280000, v3, OS_LOG_TYPE_DEFAULT, "self: (%p)", buf, 0xCu);
  }
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__NPSDomainAccessorInternal_invalidatePresenter__block_invoke;
  block[3] = &unk_1E68E5CF0;
  block[4] = self;
  dispatch_sync(internalQueue, block);
}

uint64_t __48__NPSDomainAccessorInternal_invalidatePresenter__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidatePresenter");
}

- (void)_invalidatePresenter
{
  NSObject *v3;
  NPSDomainAccessorFilePresenter *filePresenter;
  NPSDomainAccessorFilePresenter *v5;
  int v6;
  NPSDomainAccessorInternal *v7;
  __int16 v8;
  NPSDomainAccessorFilePresenter *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (self->_filePresenter)
  {
    objc_msgSend(MEMORY[0x1E0CB3600], "removeFilePresenter:");
    v3 = nps_domain_accessor_log;
    if (os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT))
    {
      filePresenter = self->_filePresenter;
      v6 = 134218240;
      v7 = self;
      v8 = 2048;
      v9 = filePresenter;
      _os_log_impl(&dword_1B5280000, v3, OS_LOG_TYPE_DEFAULT, "self:(%p); Unregisted file presenter: (%p)",
        (uint8_t *)&v6,
        0x16u);
    }
    v5 = self->_filePresenter;
    self->_filePresenter = 0;

  }
}

+ (void)invalidateAndReleaseUnreferencedAccessors
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v2 = (void *)objc_opt_new();
  v3 = (void *)internalAccessors;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __70__NPSDomainAccessorInternal_invalidateAndReleaseUnreferencedAccessors__block_invoke;
  v5[3] = &unk_1E68E6158;
  v6 = v2;
  v4 = v2;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v5);
  objc_msgSend((id)internalAccessors, "removeObjectsForKeys:", v4);

}

void __70__NPSDomainAccessorInternal_invalidateAndReleaseUnreferencedAccessors__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v9 = a2;
  v5 = a3;
  v6 = (void *)objc_opt_new();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __70__NPSDomainAccessorInternal_invalidateAndReleaseUnreferencedAccessors__block_invoke_2;
  v10[3] = &unk_1E68E6130;
  v7 = v6;
  v11 = v7;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v10);
  objc_msgSend(v5, "removeObjectsForKeys:", v7);
  v8 = objc_msgSend(v5, "count");

  if (!v8)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v9);

}

void __70__NPSDomainAccessorInternal_invalidateAndReleaseUnreferencedAccessors__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (!objc_msgSend(v5, "referenceCounter"))
  {
    objc_msgSend(v5, "invalidatePresenter");
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);
  }

}

+ (id)urlForDomain:(id)a3 pairingDataStore:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;

  if (a3)
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    v6 = a4;
    objc_msgSend(v5, "stringWithFormat:", CFSTR("NanoPreferencesSync/NanoDomains/%@"), a3);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByAppendingPathComponent:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = a4;
    objc_msgSend(v7, "stringByAppendingPathComponent:", CFSTR("NanoPreferencesSync/NanoDomains/"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v8, a3 == 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NPSDomainAccessorInternal)initWithPairingID:(id)a3 pairingDataStore:(id)a4 domain:(id)a5
{
  id v9;
  id v10;
  id v11;
  NPSDomainAccessorInternal *v12;
  NSObject *v13;
  uint64_t v14;
  NSURL *domainURL;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  const char *v20;
  dispatch_queue_t v21;
  OS_dispatch_queue *internalQueue;
  void *v23;
  void *v24;
  id v25;
  const char *v26;
  dispatch_queue_t v27;
  OS_dispatch_queue *externalQueue;
  objc_super v30;
  uint8_t buf[4];
  NPSDomainAccessorInternal *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if ((objc_msgSend((id)objc_opt_class(), "domainIsValid:", v11) & 1) == 0)
    -[NPSDomainAccessorInternal initWithPairingID:pairingDataStore:domain:].cold.3();
  if (!v9)
    -[NPSDomainAccessorInternal initWithPairingID:pairingDataStore:domain:].cold.1();
  if (!v10)
    -[NPSDomainAccessorInternal initWithPairingID:pairingDataStore:domain:].cold.2();
  v30.receiver = self;
  v30.super_class = (Class)NPSDomainAccessorInternal;
  v12 = -[NPSDomainAccessorInternal init](&v30, sel_init);
  if (v12)
  {
    v13 = nps_domain_accessor_log;
    if (os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218754;
      v32 = v12;
      v33 = 2112;
      v34 = v9;
      v35 = 2112;
      v36 = v11;
      v37 = 2112;
      v38 = v10;
      _os_log_impl(&dword_1B5280000, v13, OS_LOG_TYPE_DEFAULT, "self: (%p); pairingID: (%@); domain: (%@); pairingDataStore: (%@)",
        buf,
        0x2Au);
    }
    objc_storeStrong((id *)&v12->_domain, a5);
    objc_storeStrong((id *)&v12->_pairingID, a3);
    v12->_hasReadFromDisk = 0;
    objc_storeStrong((id *)&v12->_pairingStorePath, a4);
    v12->_nanoSettingsDirectoryExists = 0;
    v12->_referenceCounter = 1;
    objc_msgSend((id)objc_opt_class(), "urlForDomain:pairingDataStore:", v11, v10);
    v14 = objc_claimAutoreleasedReturnValue();
    domainURL = v12->_domainURL;
    v12->_domainURL = (NSURL *)v14;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v9, "UUIDString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("com.apple.nanoprefsync.frmrk.internalAccessor.int.%@.%@"), v18, v11);
    v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v20 = (const char *)objc_msgSend(v19, "UTF8String");

    v21 = dispatch_queue_create(v20, v16);
    internalQueue = v12->_internalQueue;
    v12->_internalQueue = (OS_dispatch_queue *)v21;

    v23 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v9, "UUIDString");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "stringWithFormat:", CFSTR("com.apple.nanoprefsync.frmrk.internalAccessor.ext.%@.%@"), v24, v11);
    v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v26 = (const char *)objc_msgSend(v25, "UTF8String");

    v27 = dispatch_queue_create(v26, 0);
    externalQueue = v12->_externalQueue;
    v12->_externalQueue = (OS_dispatch_queue *)v27;

  }
  return v12;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  NPSDomainAccessorInternal *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = nps_domain_accessor_log;
  if (os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v6 = self;
    _os_log_impl(&dword_1B5280000, v3, OS_LOG_TYPE_DEFAULT, "self:(%p)", buf, 0xCu);
  }
  -[NPSDomainAccessorInternal _invalidatePresenter](self, "_invalidatePresenter");
  v4.receiver = self;
  v4.super_class = (Class)NPSDomainAccessorInternal;
  -[NPSDomainAccessorInternal dealloc](&v4, sel_dealloc);
}

+ (BOOL)valueIsValid:(id)a3
{
  id v3;
  BOOL v4;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!v3
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v4 = 1;
  }
  else
  {
    v6 = nps_domain_accessor_log;
    v4 = 0;
    if (os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = v3;
      _os_log_impl(&dword_1B5280000, v6, OS_LOG_TYPE_DEFAULT, "Invalid type: (%@)", (uint8_t *)&v7, 0xCu);
      v4 = 0;
    }
  }

  return v4;
}

+ (id)cfTypeNameForCFPropertyListRef:(void *)a3
{
  CFTypeID v3;

  if (!a3)
    return CFSTR("n/a/");
  v3 = CFGetTypeID(a3);
  if (v3 == CFDataGetTypeID())
    return CFSTR("CFDataRef");
  if (v3 == CFStringGetTypeID())
    return CFSTR("CFStringRef");
  if (v3 == CFArrayGetTypeID())
    return CFSTR("CFArrayRef");
  if (v3 == CFDictionaryGetTypeID())
    return CFSTR("CFDictionaryRef");
  if (v3 == CFDateGetTypeID())
    return CFSTR("CFDateRef");
  if (v3 == CFBooleanGetTypeID())
    return CFSTR("CFBooleanRef");
  if (v3 == CFNumberGetTypeID())
    return CFSTR("CFNumberRef");
  return CFSTR("unknown");
}

+ (void)mergeDirtyKeys:(id)a3 fromDictionary:(id)a4 toDictionary:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v7 = a4;
  v8 = a5;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __72__NPSDomainAccessorInternal_mergeDirtyKeys_fromDictionary_toDictionary___block_invoke;
  v11[3] = &unk_1E68E6180;
  v12 = v7;
  v13 = v8;
  v9 = v8;
  v10 = v7;
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", v11);

}

void __72__NPSDomainAccessorInternal_mergeDirtyKeys_fromDictionary_toDictionary___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 40);
  v7 = (id)v5;
  if (v5)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, v4);
  else
    objc_msgSend(v6, "removeObjectForKey:", v4);

}

- (id)copyKeyList
{
  NSObject *v3;
  NSObject *internalQueue;
  void *v5;
  _QWORD v7[6];
  uint8_t buf[8];
  uint8_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v3 = nps_domain_accessor_log;
  if (os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B5280000, v3, OS_LOG_TYPE_DEFAULT, (const char *)&unk_1B528BE3F, buf, 2u);
  }
  *(_QWORD *)buf = 0;
  v9 = buf;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__0;
  v12 = __Block_byref_object_dispose__0;
  v13 = 0;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__NPSDomainAccessorInternal_copyKeyList__block_invoke;
  v7[3] = &unk_1E68E5D18;
  v7[4] = self;
  v7[5] = buf;
  dispatch_sync(internalQueue, v7);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", *((_QWORD *)v9 + 5));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(buf, 8);

  return v5;
}

void __40__NPSDomainAccessorInternal_copyKeyList__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_copyKeyList");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_copyKeyList
{
  id v3;

  if (!self->_hasReadFromDisk)
    v3 = -[NPSDomainAccessorInternal _synchronizeReadOnly:](self, "_synchronizeReadOnly:", 1);
  -[NSMutableDictionary allKeys](self->_map, "allKeys");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)copyDomainListForPairingDataStore:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[6];
  id v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  _QWORD v17[5];
  id v18;

  v3 = a3;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__0;
  v17[4] = __Block_byref_object_dispose__0;
  v18 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__0;
  v15 = __Block_byref_object_dispose__0;
  v16 = 0;
  v4 = objc_alloc_init(MEMORY[0x1E0CB3600]);
  +[NPSDomainAccessorInternal urlForDomain:pairingDataStore:](NPSDomainAccessorInternal, "urlForDomain:pairingDataStore:", 0, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __63__NPSDomainAccessorInternal_copyDomainListForPairingDataStore___block_invoke;
  v9[3] = &unk_1E68E61A8;
  v9[4] = &v11;
  v9[5] = v17;
  objc_msgSend(v4, "coordinateReadingItemAtURL:options:error:byAccessor:", v5, 1, &v10, v9);
  v6 = v10;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v12[5]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(v17, 8);

  return v7;
}

void __63__NPSDomainAccessorInternal_copyDomainListForPairingDataStore___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id obj;

  v3 = (void *)MEMORY[0x1E0CB3620];
  v4 = a2;
  objc_msgSend(v3, "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v7 + 40);
  objc_msgSend(v5, "contentsOfDirectoryAtPath:error:", v6, &obj);
  v8 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v7 + 40), obj);
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

}

- (id)synchronize
{
  NSObject *v3;
  NSObject *internalQueue;
  id v5;
  _QWORD v7[6];
  uint8_t buf[8];
  uint8_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v3 = nps_domain_accessor_log;
  if (os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B5280000, v3, OS_LOG_TYPE_DEFAULT, (const char *)&unk_1B528BE3F, buf, 2u);
  }
  *(_QWORD *)buf = 0;
  v9 = buf;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__0;
  v12 = __Block_byref_object_dispose__0;
  v13 = 0;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__NPSDomainAccessorInternal_synchronize__block_invoke;
  v7[3] = &unk_1E68E5D18;
  v7[4] = self;
  v7[5] = buf;
  dispatch_sync(internalQueue, v7);
  v5 = *((id *)v9 + 5);
  _Block_object_dispose(buf, 8);

  return v5;
}

void __40__NPSDomainAccessorInternal_synchronize__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_synchronizeReadOnly:", 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)synchronizeWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *internalQueue;
  id v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  NPSDomainAccessorInternal *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)nps_domain_accessor_log;
  if (os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = (void *)MEMORY[0x1B5E49A1C](v4);
    *(_DWORD *)buf = 134218240;
    v13 = self;
    v14 = 2048;
    v15 = v7;
    _os_log_impl(&dword_1B5280000, v6, OS_LOG_TYPE_DEFAULT, "self: (%p); completionHandler: (%p)", buf, 0x16u);

  }
  internalQueue = self->_internalQueue;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __62__NPSDomainAccessorInternal_synchronizeWithCompletionHandler___block_invoke;
  v10[3] = &unk_1E68E61D0;
  v10[4] = self;
  v11 = v4;
  v9 = v4;
  dispatch_async(internalQueue, v10);

}

void __62__NPSDomainAccessorInternal_synchronizeWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "_synchronizeReadOnly:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);
  if (v3)
  {
    v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 56);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __62__NPSDomainAccessorInternal_synchronizeWithCompletionHandler___block_invoke_2;
    v5[3] = &unk_1E68E5D40;
    v7 = v3;
    v6 = v2;
    dispatch_async(v4, v5);

  }
}

uint64_t __62__NPSDomainAccessorInternal_synchronizeWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (id)_synchronizeReadOnly:(BOOL)a3
{
  NSObject *v5;
  void *v6;
  _BOOL4 v7;
  NPSDomainAccessorFilePresenter *filePresenter;
  char v9;
  id v10;
  NPSDomainAccessorFilePresenter *v11;
  NPSDomainAccessorFilePresenter *v12;
  uint64_t v13;
  void *v14;
  _QWORD v16[5];
  NPSDomainAccessorFilePresenter *v17;
  uint64_t *v18;
  char v19;
  BOOL v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    v5 = nps_framework_log;
    if (os_log_type_enabled((os_log_t)nps_framework_log, OS_LOG_TYPE_ERROR))
      -[NPSDomainAccessorInternal _synchronizeReadOnly:].cold.2(v5);
    v6 = (void *)nps_framework_log;
    if (os_log_type_enabled((os_log_t)nps_framework_log, OS_LOG_TYPE_ERROR))
      -[NPSDomainAccessorInternal _synchronizeReadOnly:].cold.1(v6);
  }
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__0;
  v25 = __Block_byref_object_dispose__0;
  v26 = 0;
  v7 = !a3 && self->_dirtyKeysForWriting != 0;
  if (self->_hasReadFromDisk && (filePresenter = self->_filePresenter) != 0)
  {
    v9 = !-[NPSDomainAccessorFilePresenter isCurrent](filePresenter, "isCurrent");
    if ((v9 & 1) == 0 && !v7)
    {
      v10 = 0;
      goto LABEL_18;
    }
  }
  else
  {
    v9 = 1;
  }
  v11 = self->_filePresenter;
  if (!v11)
    v11 = -[NPSDomainAccessorFilePresenter initWithDelegate:domainURL:]([NPSDomainAccessorFilePresenter alloc], "initWithDelegate:domainURL:", self, self->_domainURL);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __50__NPSDomainAccessorInternal__synchronizeReadOnly___block_invoke;
  v16[3] = &unk_1E68E61F8;
  v16[4] = self;
  v12 = v11;
  v19 = v9;
  v20 = v7;
  v17 = v12;
  v18 = &v21;
  -[NPSDomainAccessorFilePresenter synchronizeForReadingOnly:handler:](v12, "synchronizeForReadingOnly:handler:", !v7, v16);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v22[5];
  v22[5] = v13;

  v10 = (id)v22[5];
LABEL_18:
  _Block_object_dispose(&v21, 8);

  return v10;
}

BOOL __50__NPSDomainAccessorInternal__synchronizeReadOnly___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _BOOL8 v13;
  int v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!applicationEnteredBackground && !*(_QWORD *)(*(_QWORD *)(a1 + 32) + 88))
  {
    objc_msgSend(MEMORY[0x1E0CB3600], "addFilePresenter:", *(_QWORD *)(a1 + 40));
    v6 = nps_domain_accessor_log;
    if (os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(_QWORD *)(a1 + 40);
      v15 = 134218240;
      v16 = v7;
      v17 = 2048;
      v18 = v8;
      _os_log_impl(&dword_1B5280000, v6, OS_LOG_TYPE_DEFAULT, "self: (%p); Registered file presenter: (%p)",
        (uint8_t *)&v15,
        0x16u);
    }
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 88), *(id *)(a1 + 40));
  }
  if (*(_BYTE *)(a1 + 57))
  {
    if (*(_BYTE *)(a1 + 56))
      v9 = 1;
    else
      v9 = a3 ^ 1u;
    objc_msgSend(*(id *)(a1 + 32), "canSynchronizeForWritingURL:readFirst:", v5, v9);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "canSynchronizeForReadingURL:", v5);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

  v13 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) == 0;
  return v13;
}

- (id)objectForKey:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *internalQueue;
  id v7;
  id v8;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  _QWORD block[5];
  id v15;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = nps_domain_accessor_log;
  if (os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v4;
    _os_log_impl(&dword_1B5280000, v5, OS_LOG_TYPE_DEFAULT, "key: (%@)", (uint8_t *)&buf, 0xCu);
  }
  if (!v4)
  {
    v10 = (void *)MEMORY[0x1E0C99DA0];
    v11 = *MEMORY[0x1E0C99778];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("key: (%@)"), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "exceptionWithName:reason:userInfo:", v11, v12, 0);
    v13 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v13);
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__0;
  v20 = __Block_byref_object_dispose__0;
  v21 = 0;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__NPSDomainAccessorInternal_objectForKey___block_invoke;
  block[3] = &unk_1E68E6220;
  v15 = v4;
  p_buf = &buf;
  block[4] = self;
  v7 = v4;
  dispatch_sync(internalQueue, block);
  v8 = *(id *)(*((_QWORD *)&buf + 1) + 40);

  _Block_object_dispose(&buf, 8);
  return v8;
}

void __42__NPSDomainAccessorInternal_objectForKey___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_objectForKey:error:", *(_QWORD *)(a1 + 40), 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)objectForKey:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *internalQueue;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD block[5];
  id v22;
  id v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)nps_domain_accessor_log;
  if (os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    v10 = (void *)MEMORY[0x1B5E49A1C](v7);
    *(_DWORD *)buf = 138412546;
    v25 = v6;
    v26 = 2048;
    v27 = v10;
    _os_log_impl(&dword_1B5280000, v9, OS_LOG_TYPE_DEFAULT, "key: (%@); completionHandler: (%p)", buf, 0x16u);

  }
  if (!v6 || !v7)
  {
    v15 = (void *)MEMORY[0x1E0C99DA0];
    v16 = *MEMORY[0x1E0C99778];
    v17 = (void *)MEMORY[0x1E0CB3940];
    v18 = (void *)MEMORY[0x1B5E49A1C](v7);
    objc_msgSend(v17, "stringWithFormat:", CFSTR("nil key (%@) or completion handler (%p)"), v6, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "exceptionWithName:reason:userInfo:", v16, v19, 0);
    v20 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v20);
  }
  v11 = (void *)objc_msgSend(v6, "copy");
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__NPSDomainAccessorInternal_objectForKey_completionHandler___block_invoke;
  block[3] = &unk_1E68E6248;
  block[4] = self;
  v22 = v11;
  v23 = v7;
  v13 = v7;
  v14 = v11;
  dispatch_async(internalQueue, block);

}

void __60__NPSDomainAccessorInternal_objectForKey_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v14 = 0;
  objc_msgSend(v2, "_objectForKey:error:", v3, &v14);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v14;
  v6 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 56);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __60__NPSDomainAccessorInternal_objectForKey_completionHandler___block_invoke_2;
  v10[3] = &unk_1E68E5D90;
  v7 = *(id *)(a1 + 48);
  v12 = v5;
  v13 = v7;
  v11 = v4;
  v8 = v5;
  v9 = v4;
  dispatch_async(v6, v10);

}

uint64_t __60__NPSDomainAccessorInternal_objectForKey_completionHandler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (id)_objectForKey:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int v14;
  id v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (self->_hasReadFromDisk
    || (-[NPSDomainAccessorInternal _synchronizeReadOnly:](self, "_synchronizeReadOnly:", 1),
        (v11 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_map, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)nps_domain_accessor_log;
    if (os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT))
    {
      v9 = v8;
      objc_msgSend((id)objc_opt_class(), "cfTypeNameForCFPropertyListRef:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412802;
      v15 = v6;
      v16 = 2112;
      v17 = v10;
      v18 = 2112;
      v19 = v7;
      _os_log_impl(&dword_1B5280000, v9, OS_LOG_TYPE_DEFAULT, "key: (%@); value type: (%@); value: (%@)",
        (uint8_t *)&v14,
        0x20u);

    }
  }
  else
  {
    v12 = v11;
    if (a4)
      *a4 = objc_retainAutorelease(v11);

    v7 = 0;
  }

  return v7;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = nps_domain_accessor_log;
  if (os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315650;
    v10 = "-[NPSDomainAccessorInternal setObject:forKey:]";
    v11 = 2112;
    v12 = v6;
    v13 = 2112;
    v14 = v7;
    _os_log_impl(&dword_1B5280000, v8, OS_LOG_TYPE_DEFAULT, "%s: value : %@; key: %@", (uint8_t *)&v9, 0x20u);
  }
  -[NPSDomainAccessorInternal setObject:forKey:completionHandler:](self, "setObject:forKey:completionHandler:", v6, v7, 0);

}

- (void)setObject:(id)a3 forKey:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *DeepCopy;
  NSObject *internalQueue;
  id *v19;
  id *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  _QWORD v29[5];
  void *v30;
  void *v31;
  _QWORD block[5];
  void *v33;
  void *v34;
  id v35;
  uint8_t buf[4];
  id v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  id v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)nps_domain_accessor_log;
  if (os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT))
  {
    v12 = v11;
    objc_msgSend((id)objc_opt_class(), "cfTypeNameForCFPropertyListRef:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x1B5E49A1C](v10);
    *(_DWORD *)buf = 138413058;
    v37 = v9;
    v38 = 2112;
    v39 = v13;
    v40 = 2112;
    v41 = v8;
    v42 = 2048;
    v43 = v14;
    _os_log_impl(&dword_1B5280000, v12, OS_LOG_TYPE_DEFAULT, "key: (%@); value type: (%@): value: (%@); completionHandler: (%p)",
      buf,
      0x2Au);

  }
  if (!v9 || (objc_msgSend((id)objc_opt_class(), "valueIsValid:", v8) & 1) == 0)
  {
    v25 = (void *)MEMORY[0x1E0C99DA0];
    v26 = *MEMORY[0x1E0C99778];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("nil or invalid key (%@) or value (%@)"), v9, v8);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "exceptionWithName:reason:userInfo:", v26, v27, 0);
    v28 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v28);
  }
  v15 = (void *)objc_msgSend(v9, "copy");
  v16 = (void *)MEMORY[0x1B5E498CC]();
  DeepCopy = (void *)CFPropertyListCreateDeepCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE30], v8, 0);
  objc_autoreleasePoolPop(v16);
  internalQueue = self->_internalQueue;
  if (v10)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __64__NPSDomainAccessorInternal_setObject_forKey_completionHandler___block_invoke;
    block[3] = &unk_1E68E6270;
    v19 = &v33;
    block[4] = self;
    v33 = DeepCopy;
    v20 = &v34;
    v34 = v15;
    v35 = v10;
    v21 = v15;
    v22 = DeepCopy;
    dispatch_async(internalQueue, block);

  }
  else
  {
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __64__NPSDomainAccessorInternal_setObject_forKey_completionHandler___block_invoke_3;
    v29[3] = &unk_1E68E6298;
    v19 = &v30;
    v29[4] = self;
    v30 = DeepCopy;
    v20 = &v31;
    v31 = v15;
    v23 = v15;
    v24 = DeepCopy;
    dispatch_sync(internalQueue, v29);
  }

}

void __64__NPSDomainAccessorInternal_setObject_forKey_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  _QWORD block[4];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_setObject:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = *(void **)(a1 + 56);
  if (v2)
  {
    v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 56);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __64__NPSDomainAccessorInternal_setObject_forKey_completionHandler___block_invoke_2;
    block[3] = &unk_1E68E5DE0;
    v5 = v2;
    dispatch_async(v3, block);

  }
}

uint64_t __64__NPSDomainAccessorInternal_setObject_forKey_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __64__NPSDomainAccessorInternal_setObject_forKey_completionHandler___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setObject:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_setObject:(id)a3 forKey:(id)a4
{
  id v6;
  uint64_t v7;
  NSMutableSet *dirtyKeysForWriting;
  NSMutableSet *v9;
  NSMutableSet *v10;
  NSMutableDictionary *map;
  NSMutableDictionary *v12;
  NSMutableDictionary *v13;
  unint64_t v14;

  v14 = (unint64_t)a3;
  v6 = a4;
  if (self->_hasReadFromDisk && self->_filePresenter
    || -[NSMutableSet containsObject:](self->_dirtyKeysForWriting, "containsObject:", v6))
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_map, "objectForKeyedSubscript:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    if (!(v14 | v7) || (objc_msgSend((id)v7, "isEqual:", v14) & 1) != 0)
    {

      goto LABEL_15;
    }

  }
  dirtyKeysForWriting = self->_dirtyKeysForWriting;
  if (!dirtyKeysForWriting)
  {
    v9 = (NSMutableSet *)objc_opt_new();
    v10 = self->_dirtyKeysForWriting;
    self->_dirtyKeysForWriting = v9;

    dirtyKeysForWriting = self->_dirtyKeysForWriting;
  }
  -[NSMutableSet addObject:](dirtyKeysForWriting, "addObject:", v6);
  map = self->_map;
  if (v14)
  {
    if (!map)
    {
      v12 = (NSMutableDictionary *)objc_opt_new();
      v13 = self->_map;
      self->_map = v12;

      map = self->_map;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](map, "setObject:forKeyedSubscript:", v14, v6);
  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](map, "removeObjectForKey:", v6);
  }
LABEL_15:

}

- (void)removeObjectForKey:(id)a3
{
  -[NPSDomainAccessorInternal setObject:forKey:](self, "setObject:forKey:", 0, a3);
}

- (id)stringForKey:(id)a3
{
  void *v3;
  void *v4;

  -[NPSDomainAccessorInternal objectForKey:](self, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[NPSDomainAccessorUtils stringForObject:](NPSDomainAccessorUtils, "stringForObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)arrayForKey:(id)a3
{
  void *v3;
  void *v4;

  -[NPSDomainAccessorInternal objectForKey:](self, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[NPSDomainAccessorUtils arrayForObject:](NPSDomainAccessorUtils, "arrayForObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)dictionaryForKey:(id)a3
{
  void *v3;
  void *v4;

  -[NPSDomainAccessorInternal objectForKey:](self, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[NPSDomainAccessorUtils dictionaryForObject:](NPSDomainAccessorUtils, "dictionaryForObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)dataForKey:(id)a3
{
  void *v3;
  void *v4;

  -[NPSDomainAccessorInternal objectForKey:](self, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[NPSDomainAccessorUtils dataForObject:](NPSDomainAccessorUtils, "dataForObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)stringArrayForKey:(id)a3
{
  void *v3;
  void *v4;

  -[NPSDomainAccessorInternal objectForKey:](self, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[NPSDomainAccessorUtils stringArrayForObject:](NPSDomainAccessorUtils, "stringArrayForObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (int64_t)integerForKey:(id)a3
{
  return -[NPSDomainAccessorInternal integerForKey:keyExistsAndHasValidFormat:](self, "integerForKey:keyExistsAndHasValidFormat:", a3, 0);
}

- (int64_t)longForKey:(id)a3
{
  return -[NPSDomainAccessorInternal longForKey:keyExistsAndHasValidFormat:](self, "longForKey:keyExistsAndHasValidFormat:", a3, 0);
}

- (float)floatForKey:(id)a3
{
  float result;

  -[NPSDomainAccessorInternal floatForKey:keyExistsAndHasValidFormat:](self, "floatForKey:keyExistsAndHasValidFormat:", a3, 0);
  return result;
}

- (double)doubleForKey:(id)a3
{
  double result;

  -[NPSDomainAccessorInternal doubleForKey:keyExistsAndHasValidFormat:](self, "doubleForKey:keyExistsAndHasValidFormat:", a3, 0);
  return result;
}

- (BOOL)BOOLForKey:(id)a3
{
  return -[NPSDomainAccessorInternal BOOLForKey:keyExistsAndHasValidFormat:](self, "BOOLForKey:keyExistsAndHasValidFormat:", a3, 0);
}

- (int64_t)integerForKey:(id)a3 keyExistsAndHasValidFormat:(BOOL *)a4
{
  void *v5;
  int64_t v6;

  -[NPSDomainAccessorInternal objectForKey:](self, "objectForKey:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[NPSDomainAccessorUtils integerForObject:existsAndHasValidFormat:](NPSDomainAccessorUtils, "integerForObject:existsAndHasValidFormat:", v5, a4);

  return v6;
}

- (int64_t)longForKey:(id)a3 keyExistsAndHasValidFormat:(BOOL *)a4
{
  void *v5;
  int64_t v6;

  -[NPSDomainAccessorInternal objectForKey:](self, "objectForKey:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[NPSDomainAccessorUtils longForObject:existsAndHasValidFormat:](NPSDomainAccessorUtils, "longForObject:existsAndHasValidFormat:", v5, a4);

  return v6;
}

- (float)floatForKey:(id)a3 keyExistsAndHasValidFormat:(BOOL *)a4
{
  void *v5;
  float v6;
  float v7;

  -[NPSDomainAccessorInternal objectForKey:](self, "objectForKey:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[NPSDomainAccessorUtils floatForObject:existsAndHasValidFormat:](NPSDomainAccessorUtils, "floatForObject:existsAndHasValidFormat:", v5, a4);
  v7 = v6;

  return v7;
}

- (double)doubleForKey:(id)a3 keyExistsAndHasValidFormat:(BOOL *)a4
{
  void *v5;
  double v6;
  double v7;

  -[NPSDomainAccessorInternal objectForKey:](self, "objectForKey:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[NPSDomainAccessorUtils doubleForObject:existsAndHasValidFormat:](NPSDomainAccessorUtils, "doubleForObject:existsAndHasValidFormat:", v5, a4);
  v7 = v6;

  return v7;
}

- (BOOL)BOOLForKey:(id)a3 keyExistsAndHasValidFormat:(BOOL *)a4
{
  void *v5;

  -[NPSDomainAccessorInternal objectForKey:](self, "objectForKey:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = +[NPSDomainAccessorUtils BOOLForObject:existsAndHasValidFormat:](NPSDomainAccessorUtils, "BOOLForObject:existsAndHasValidFormat:", v5, a4);

  return (char)a4;
}

- (id)URLForKey:(id)a3
{
  void *v3;
  void *v4;

  -[NPSDomainAccessorInternal objectForKey:](self, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[NPSDomainAccessorUtils URLForObject:](NPSDomainAccessorUtils, "URLForObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setInteger:(int64_t)a3 forKey:(id)a4
{
  void *v6;
  id v7;
  id v8;

  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend(v6, "numberWithInteger:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NPSDomainAccessorInternal setObject:forKey:](self, "setObject:forKey:", v8, v7);

}

- (void)setLong:(int64_t)a3 forKey:(id)a4
{
  void *v6;
  id v7;
  id v8;

  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend(v6, "numberWithLongLong:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NPSDomainAccessorInternal setObject:forKey:](self, "setObject:forKey:", v8, v7);

}

- (void)setFloat:(float)a3 forKey:(id)a4
{
  void *v6;
  id v7;
  double v8;
  id v9;

  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  *(float *)&v8 = a3;
  objc_msgSend(v6, "numberWithFloat:", v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[NPSDomainAccessorInternal setObject:forKey:](self, "setObject:forKey:", v9, v7);

}

- (void)setDouble:(double)a3 forKey:(id)a4
{
  void *v6;
  id v7;
  id v8;

  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend(v6, "numberWithDouble:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NPSDomainAccessorInternal setObject:forKey:](self, "setObject:forKey:", v8, v7);

}

- (void)setBool:(BOOL)a3 forKey:(id)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;
  id v8;

  v4 = a3;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend(v6, "numberWithBool:", v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NPSDomainAccessorInternal setObject:forKey:](self, "setObject:forKey:", v8, v7);

}

- (void)setURL:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  +[NPSDomainAccessorUtils objectForURL:](NPSDomainAccessorUtils, "objectForURL:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[NPSDomainAccessorInternal setObject:forKey:](self, "setObject:forKey:", v7, v6);

}

- (id)dictionaryRepresentation
{
  NSObject *v3;
  NSObject *internalQueue;
  id v5;
  _QWORD v7[6];
  __int128 buf;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = nps_domain_accessor_log;
  if (os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = self;
    _os_log_impl(&dword_1B5280000, v3, OS_LOG_TYPE_DEFAULT, "self: (%p)", (uint8_t *)&buf, 0xCu);
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__0;
  v11 = __Block_byref_object_dispose__0;
  v12 = 0;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__NPSDomainAccessorInternal_dictionaryRepresentation__block_invoke;
  v7[3] = &unk_1E68E5D18;
  v7[4] = self;
  v7[5] = &buf;
  dispatch_sync(internalQueue, v7);
  v5 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  return v5;
}

void __53__NPSDomainAccessorInternal_dictionaryRepresentation__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_dictionaryRepresentation");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_dictionaryRepresentation
{
  id v3;

  if (!self->_hasReadFromDisk)
    v3 = -[NPSDomainAccessorInternal _synchronizeReadOnly:](self, "_synchronizeReadOnly:", 1);
  return self->_map;
}

- (id)canSynchronizeForReadingURL:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v11;
  uint8_t buf[4];
  NPSDomainAccessorInternal *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = nps_domain_accessor_log;
  if (os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v13 = self;
    _os_log_impl(&dword_1B5280000, v5, OS_LOG_TYPE_DEFAULT, "self: (%p)", buf, 0xCu);
  }
  v11 = 0;
  objc_msgSend((id)objc_opt_class(), "readDomainURL:withError:", v4, &v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v11;
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    if (self->_dirtyKeysForWriting)
      objc_msgSend((id)objc_opt_class(), "mergeDirtyKeys:fromDictionary:toDictionary:", self->_dirtyKeysForWriting, self->_map, v6);
    objc_storeStrong((id *)&self->_map, v6);
    self->_hasReadFromDisk = 1;
  }

  return v8;
}

- (id)canSynchronizeForWritingURL:(id)a3 readFirst:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  NSMutableDictionary *v8;
  NSString *v9;
  NSString *v10;
  NSObject *v11;
  NSString *v12;
  NSMutableDictionary *map;
  NSObject *v14;
  NSString *domain;
  NSMutableSet *dirtyKeysForWriting;
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  NSString *v22;
  __int16 v23;
  NSString *v24;
  uint64_t v25;

  v4 = a4;
  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = nps_domain_accessor_log;
  if (os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v20 = "-[NPSDomainAccessorInternal canSynchronizeForWritingURL:readFirst:]";
    _os_log_impl(&dword_1B5280000, v7, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }
  if (v4)
  {
    v18 = 0;
    objc_msgSend((id)objc_opt_class(), "readDomainURL:withError:", v6, &v18);
    v8 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v9 = (NSString *)v18;
    if (v9)
    {
      v10 = v9;
      v11 = nps_domain_accessor_log;
      if (os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v20 = "-[NPSDomainAccessorInternal canSynchronizeForWritingURL:readFirst:]";
        v21 = 2112;
        v22 = v10;
        _os_log_impl(&dword_1B5280000, v11, OS_LOG_TYPE_DEFAULT, "%s: Read First error %@", buf, 0x16u);
      }
      v12 = v10;

      goto LABEL_13;
    }
    objc_msgSend((id)objc_opt_class(), "mergeDirtyKeys:fromDictionary:toDictionary:", self->_dirtyKeysForWriting, self->_map, v8);
    map = self->_map;
    self->_map = v8;

    self->_hasReadFromDisk = 1;
  }
  objc_msgSend((id)objc_opt_class(), "writeDomain:toURL:", self->_map, v6);
  v12 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v14 = nps_domain_accessor_log;
    if (os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT))
    {
      domain = self->_domain;
      *(_DWORD *)buf = 136315650;
      v20 = "-[NPSDomainAccessorInternal canSynchronizeForWritingURL:readFirst:]";
      v21 = 2112;
      v22 = domain;
      v23 = 2112;
      v24 = v12;
      _os_log_impl(&dword_1B5280000, v14, OS_LOG_TYPE_DEFAULT, "%s: Error saving domain %@. Error: %@", buf, 0x20u);
    }
  }
  else
  {
    dirtyKeysForWriting = self->_dirtyKeysForWriting;
    self->_dirtyKeysForWriting = 0;

  }
LABEL_13:

  return v12;
}

- (id)createNanoSettingsDirectory
{
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  if (self->_nanoSettingsDirectoryExists)
    return 0;
  -[NSString stringByAppendingPathComponent:](self->_pairingStorePath, "stringByAppendingPathComponent:", CFSTR("NanoPreferencesSync/NanoDomains/"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "fileExistsAtPath:", v4) & 1) == 0)
  {
    v7 = nps_domain_accessor_log;
    if (os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v4;
      _os_log_impl(&dword_1B5280000, v7, OS_LOG_TYPE_DEFAULT, "Creating NanoDomains directory (%@) as it doesn't exist", buf, 0xCu);
    }
    v17 = *MEMORY[0x1E0CB2AD8];
    v18[0] = *MEMORY[0x1E0CB2AE0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    objc_msgSend(v5, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v4, 1, v8, &v12);
    v6 = v12;

    if (!v6)
      goto LABEL_10;
    objc_msgSend(v6, "domain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CB28A8]) & 1) != 0)
    {
      v10 = objc_msgSend(v6, "code");

      if (v10 == 516)
      {
LABEL_10:
        self->_nanoSettingsDirectoryExists = 1;
        goto LABEL_14;
      }
    }
    else
    {

    }
    v11 = nps_domain_accessor_log;
    if (os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v14 = v4;
      v15 = 2112;
      v16 = v6;
      _os_log_impl(&dword_1B5280000, v11, OS_LOG_TYPE_DEFAULT, "Failed to create the NanoDomains directory (%@) with error: (%@)", buf, 0x16u);
    }
    goto LABEL_14;
  }
  v6 = 0;
LABEL_14:

  return v6;
}

+ (id)readDomainURL:(id)a3 withError:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  id v22;
  id v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = nps_domain_accessor_log;
  if (os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v25 = a1;
    v26 = 2112;
    v27 = v6;
    _os_log_impl(&dword_1B5280000, v7, OS_LOG_TYPE_DEFAULT, "self: (%p); domainURL: (%@)", buf, 0x16u);
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "attributesOfItemAtPath:error:", v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0CB2AF0]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "integerValue") > 102400)
    {
      v12 = nps_domain_accessor_log;
      if (os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_FAULT))
        +[NPSDomainAccessorInternal readDomainURL:withError:].cold.1((uint64_t)v6, (uint64_t)v11, v12);
    }
    v23 = 0;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v6, 2, &v23);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v23;
    if (v14)
    {
      v15 = v14;
      v16 = nps_domain_accessor_log;
      if (os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v25 = v6;
        v26 = 2112;
        v27 = v15;
        _os_log_impl(&dword_1B5280000, v16, OS_LOG_TYPE_DEFAULT, "Failed to read domain from disk (%@) with error: (%@). Resetting it.", buf, 0x16u);
      }
      if (a4)
      {
        v15 = objc_retainAutorelease(v15);
        v17 = 0;
        *a4 = v15;
      }
      else
      {
        v17 = 0;
      }
    }
    else
    {
      v22 = 0;
      objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v13, 0, 0, &v22);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v22;
      v17 = (void *)objc_msgSend(v18, "mutableCopy");

      if (v15)
      {
        v19 = nps_domain_accessor_log;
        if (os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          v25 = v13;
          v26 = 2112;
          v27 = v6;
          v28 = 2112;
          v29 = v15;
          _os_log_impl(&dword_1B5280000, v19, OS_LOG_TYPE_DEFAULT, "Failed to un-serialize domain (%@) at path (%@) with error: (%@). Resetting it.", buf, 0x20u);
        }
        v20 = objc_opt_new();

        v17 = (void *)v20;
      }
    }

  }
  else
  {
    v17 = (void *)objc_opt_new();
  }

  return v17;
}

+ (id)writeDomain:(id)a3 toURL:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  const char *v23;
  NSObject *v24;
  uint32_t v25;
  uint64_t v26;
  id v28;
  id v29;
  id v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = nps_domain_accessor_log;
  if (os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    v32 = "+[NPSDomainAccessorInternal writeDomain:toURL:]";
    v33 = 2048;
    v34 = a1;
    v35 = 2112;
    v36 = v6;
    v37 = 2112;
    v38 = v7;
    _os_log_impl(&dword_1B5280000, v8, OS_LOG_TYPE_DEFAULT, "%s: self: (%p); domainDict: (%@); url: (%@)", buf, 0x2Au);
  }
  v9 = objc_msgSend(v6, "count");
  v10 = nps_domain_accessor_log;
  v11 = os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT);
  if (!v9)
  {
    if (v11)
    {
      *(_DWORD *)buf = 136315138;
      v32 = "+[NPSDomainAccessorInternal writeDomain:toURL:]";
      _os_log_impl(&dword_1B5280000, v10, OS_LOG_TYPE_DEFAULT, "%s: Deleting domain.", buf, 0xCu);
    }
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0;
    objc_msgSend(v12, "removeItemAtURL:error:", v7, &v28);
    v17 = v28;
    v18 = v17;
    if (!v17)
      goto LABEL_26;
    objc_msgSend(v17, "domain");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "isEqualToString:", *MEMORY[0x1E0CB28A8]))
    {
      v20 = objc_msgSend(v18, "code");

      if (v20 == 4)
      {

        v18 = 0;
        goto LABEL_26;
      }
    }
    else
    {

    }
    v26 = nps_domain_accessor_log;
    if (os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v32 = "+[NPSDomainAccessorInternal writeDomain:toURL:]";
      v33 = 2112;
      v34 = v7;
      v35 = 2112;
      v36 = v18;
      v23 = "%s: Failed to delete domain from disk (%@) with error: (%@).";
      v24 = v26;
      v25 = 32;
LABEL_25:
      _os_log_impl(&dword_1B5280000, v24, OS_LOG_TYPE_DEFAULT, v23, buf, v25);
    }
LABEL_26:

    v16 = v18;
    goto LABEL_27;
  }
  if (v11)
  {
    *(_DWORD *)buf = 136315138;
    v32 = "+[NPSDomainAccessorInternal writeDomain:toURL:]";
    _os_log_impl(&dword_1B5280000, v10, OS_LOG_TYPE_DEFAULT, "%s: Updating domain.", buf, 0xCu);
  }
  v30 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v6, 200, 0, &v30);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v30;
  if (!v13)
  {
    if ((unint64_t)objc_msgSend(v12, "length") > 0x19000)
    {
      v21 = (void *)nps_domain_accessor_log;
      if (os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_FAULT))
        +[NPSDomainAccessorInternal writeDomain:toURL:].cold.1((uint64_t)v7, v21, v12);
    }
    v29 = 0;
    objc_msgSend(v12, "writeToURL:options:error:", v7, 268435457, &v29);
    v18 = v29;
    if (!v18)
      goto LABEL_26;
    v22 = nps_domain_accessor_log;
    if (!os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT))
      goto LABEL_26;
    *(_DWORD *)buf = 136315906;
    v32 = "+[NPSDomainAccessorInternal writeDomain:toURL:]";
    v33 = 2112;
    v34 = v7;
    v35 = 2112;
    v36 = v6;
    v37 = 2112;
    v38 = v18;
    v23 = "%s: Failed to write to disk (%@) the domain (%@) with error: (%@).";
    v24 = v22;
    v25 = 42;
    goto LABEL_25;
  }
  v14 = v13;
  v15 = nps_domain_accessor_log;
  if (os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    v32 = "+[NPSDomainAccessorInternal writeDomain:toURL:]";
    v33 = 2112;
    v34 = v6;
    v35 = 2112;
    v36 = v14;
    v37 = 2112;
    v38 = v7;
    _os_log_impl(&dword_1B5280000, v15, OS_LOG_TYPE_DEFAULT, "%s: Failed to serialize domain (%@) with error: (%@). Not persisting it to disk (%@).", buf, 0x2Au);
  }
  v16 = v14;

LABEL_27:
  return v16;
}

- (void)filePresenterDidBecomeNonCurrent:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *internalQueue;
  _QWORD block[5];
  uint8_t buf[4];
  NPSDomainAccessorInternal *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = nps_domain_accessor_log;
  if (os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v9 = self;
    v10 = 2048;
    v11 = v4;
    _os_log_impl(&dword_1B5280000, v5, OS_LOG_TYPE_DEFAULT, "self: (%p); filePresenter: (%p)", buf, 0x16u);
  }
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__NPSDomainAccessorInternal_filePresenterDidBecomeNonCurrent___block_invoke;
  block[3] = &unk_1E68E5CF0;
  block[4] = self;
  dispatch_async(internalQueue, block);

}

uint64_t __62__NPSDomainAccessorInternal_filePresenterDidBecomeNonCurrent___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "isCurrent");
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "_invalidatePresenter");
  return result;
}

- (unint64_t)domainSize
{
  void *v2;
  unint64_t v3;

  -[NSURL absoluteString](self->_domainURL, "absoluteString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[NPSPrefPlistSizeUtil sizeForPlistAtPath:](NPSPrefPlistSizeUtil, "sizeForPlistAtPath:", v2);

  return v3;
}

- (BOOL)requiresDeviceUnlockedSinceBoot
{
  void *v2;
  BOOL v3;

  -[NSURL absoluteString](self->_domainURL, "absoluteString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[NPSPrefPlistProtectedUtil isPlistProtectedAtPath:](NPSPrefPlistProtectedUtil, "isPlistProtectedAtPath:", v2);

  return v3;
}

- (NSUUID)pairingID
{
  return self->_pairingID;
}

- (void)setPairingID:(id)a3
{
  objc_storeStrong((id *)&self->_pairingID, a3);
}

- (NSString)pairingStorePath
{
  return self->_pairingStorePath;
}

- (void)setPairingStorePath:(id)a3
{
  objc_storeStrong((id *)&self->_pairingStorePath, a3);
}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
  objc_storeStrong((id *)&self->_domain, a3);
}

- (NSURL)domainURL
{
  return self->_domainURL;
}

- (void)setDomainURL:(id)a3
{
  objc_storeStrong((id *)&self->_domainURL, a3);
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (void)setInternalQueue:(id)a3
{
  objc_storeStrong((id *)&self->_internalQueue, a3);
}

- (OS_dispatch_queue)externalQueue
{
  return self->_externalQueue;
}

- (void)setExternalQueue:(id)a3
{
  objc_storeStrong((id *)&self->_externalQueue, a3);
}

- (unint64_t)referenceCounter
{
  return self->_referenceCounter;
}

- (void)setReferenceCounter:(unint64_t)a3
{
  self->_referenceCounter = a3;
}

- (BOOL)nanoSettingsDirectoryExists
{
  return self->_nanoSettingsDirectoryExists;
}

- (void)setNanoSettingsDirectoryExists:(BOOL)a3
{
  self->_nanoSettingsDirectoryExists = a3;
}

- (BOOL)hasReadFromDisk
{
  return self->_hasReadFromDisk;
}

- (void)setHasReadFromDisk:(BOOL)a3
{
  self->_hasReadFromDisk = a3;
}

- (NSMutableSet)dirtyKeysForWriting
{
  return self->_dirtyKeysForWriting;
}

- (void)setDirtyKeysForWriting:(id)a3
{
  objc_storeStrong((id *)&self->_dirtyKeysForWriting, a3);
}

- (NSMutableDictionary)map
{
  return self->_map;
}

- (void)setMap:(id)a3
{
  objc_storeStrong((id *)&self->_map, a3);
}

- (NPSDomainAccessorFilePresenter)filePresenter
{
  return self->_filePresenter;
}

- (void)setFilePresenter:(id)a3
{
  objc_storeStrong((id *)&self->_filePresenter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filePresenter, 0);
  objc_storeStrong((id *)&self->_map, 0);
  objc_storeStrong((id *)&self->_dirtyKeysForWriting, 0);
  objc_storeStrong((id *)&self->_externalQueue, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_domainURL, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_pairingStorePath, 0);
  objc_storeStrong((id *)&self->_pairingID, 0);
}

void __69__NPSDomainAccessorInternal_decrementInternalAccessorReferenceCount___block_invoke_cold_1()
{
  __assert_rtn("+[NPSDomainAccessorInternal decrementInternalAccessorReferenceCount:]_block_invoke", "NPSDomainAccessorInternal.m", 239, "internalAccessor.referenceCounter--");
}

- (void)initWithPairingID:pairingDataStore:domain:.cold.1()
{
  __assert_rtn("-[NPSDomainAccessorInternal initWithPairingID:pairingDataStore:domain:]", "NPSDomainAccessorInternal.m", 299, "pairingID");
}

- (void)initWithPairingID:pairingDataStore:domain:.cold.2()
{
  __assert_rtn("-[NPSDomainAccessorInternal initWithPairingID:pairingDataStore:domain:]", "NPSDomainAccessorInternal.m", 300, "pairingDataStore");
}

- (void)initWithPairingID:pairingDataStore:domain:.cold.3()
{
  __assert_rtn("-[NPSDomainAccessorInternal initWithPairingID:pairingDataStore:domain:]", "NPSDomainAccessorInternal.m", 298, "[[self class] domainIsValid:domain]");
}

- (void)_synchronizeReadOnly:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  NSObject *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v1 = (void *)MEMORY[0x1E0CB3978];
  v2 = a1;
  objc_msgSend(v1, "callStackSymbols");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1B5280000, v2, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v4, 0xCu);

}

- (void)_synchronizeReadOnly:(os_log_t)log .cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B5280000, log, OS_LOG_TYPE_ERROR, "ERROR: NPSDomainAccessor init() and synchronize called on main thread! his could result in thread getting blocked indefinitely.", v1, 2u);
}

+ (void)readDomainURL:(NSObject *)a3 withError:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 138543874;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  v7 = 2112;
  v8 = &unk_1E68E84F8;
  OUTLINED_FUNCTION_0(&dword_1B5280000, a3, (uint64_t)a3, "Plist for %{public}@ is too large (%@) > (%@)", (uint8_t *)&v3);
}

+ (void)writeDomain:(void *)a3 toURL:.cold.1(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = a2;
  objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(a3, "length"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138543874;
  v10 = a1;
  v11 = 2112;
  v12 = v7;
  v13 = 2112;
  v14 = &unk_1E68E84F8;
  OUTLINED_FUNCTION_0(&dword_1B5280000, v6, v8, "Plist for %{public}@ is too large (%@) > (%@)", (uint8_t *)&v9);

}

@end
