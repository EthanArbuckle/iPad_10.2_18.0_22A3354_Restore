@implementation NPSDomainAccessor

- (NPSDomainAccessor)initWithDomain:(id)a3 pairedDevice:(id)a4
{
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  NPSDomainAccessor *v11;

  v6 = *MEMORY[0x1E0D51730];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v7, "valueForProperty:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "valueForProperty:", *MEMORY[0x1E0D51700]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[NPSDomainAccessor initWithDomain:pairingID:pairingDataStore:](self, "initWithDomain:pairingID:pairingDataStore:", v8, v9, v10);
  return v11;
}

- (NPSDomainAccessor)initWithDomain:(id)a3 queue:(id)a4 pairingID:(id)a5 pairingDataStore:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  BOOL v15;
  void *v16;
  NPSDomainAccessor *v17;
  NSObject *v18;
  NSObject *v19;
  int v21;
  const char *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = nps_domain_accessor_log;
  if (os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT))
  {
    v21 = 136316162;
    v22 = "-[NPSDomainAccessor initWithDomain:queue:pairingID:pairingDataStore:]";
    v23 = 2112;
    v24 = v10;
    v25 = 2112;
    v26 = v11;
    v27 = 2112;
    v28 = v12;
    v29 = 2112;
    v30 = v13;
    _os_log_impl(&dword_1B5280000, v14, OS_LOG_TYPE_DEFAULT, "%s: domain: (%@); queue: (%@); pairingID: (%@); pairingDataStore: (%@)",
      (uint8_t *)&v21,
      0x34u);
  }
  v15 = +[NPSDomainAccessorInternal domainIsValid:](NPSDomainAccessorInternal, "domainIsValid:", v10);
  if (v13 && v12 && v15)
  {
    +[NPSDomainAccessorInternal internalAccessorForPairingID:pairingDataStore:domain:](NPSDomainAccessorInternal, "internalAccessorForPairingID:pairingDataStore:domain:", v12, v13, v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      self = -[NPSDomainAccessor initWithInternalDomainAccessor:queue:](self, "initWithInternalDomainAccessor:queue:", v16, v11);
      v17 = self;
    }
    else
    {
      v19 = nps_domain_accessor_log;
      if (os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT))
      {
        v21 = 136315138;
        v22 = "-[NPSDomainAccessor initWithDomain:queue:pairingID:pairingDataStore:]";
        _os_log_impl(&dword_1B5280000, v19, OS_LOG_TYPE_DEFAULT, "%s: Unable to create domain accessor.", (uint8_t *)&v21, 0xCu);
      }
      v17 = 0;
    }

  }
  else
  {
    v18 = nps_domain_accessor_log;
    if (os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT))
    {
      v21 = 136315138;
      v22 = "-[NPSDomainAccessor initWithDomain:queue:pairingID:pairingDataStore:]";
      _os_log_impl(&dword_1B5280000, v18, OS_LOG_TYPE_DEFAULT, "%s: Unable to create domain accessor. domain not valid.", (uint8_t *)&v21, 0xCu);
    }
    v17 = 0;
  }

  return v17;
}

- (NPSDomainAccessor)initWithDomain:(id)a3 pairingID:(id)a4 pairingDataStore:(id)a5
{
  return -[NPSDomainAccessor initWithDomain:queue:pairingID:pairingDataStore:](self, "initWithDomain:queue:pairingID:pairingDataStore:", a3, 0, a4, a5);
}

void __73__NPSDomainAccessor_resolveActivePairedDevicePairingID_pairingDataStore___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  v8 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (NPSDomainAccessor)initWithDomain:(id)a3
{
  id v4;
  NSObject *v5;
  NPSDomainAccessor *v6;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = nps_domain_accessor_log;
  if (os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315394;
    v9 = "-[NPSDomainAccessor initWithDomain:]";
    v10 = 2112;
    v11 = v4;
    _os_log_impl(&dword_1B5280000, v5, OS_LOG_TYPE_DEFAULT, "%s: domain: (%@)", (uint8_t *)&v8, 0x16u);
  }
  v6 = -[NPSDomainAccessor initWithDomain:queue:](self, "initWithDomain:queue:", v4, 0);

  return v6;
}

- (NPSDomainAccessor)initWithDomain:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  NPSDomainAccessor *v11;
  NSObject *v12;
  id v14;
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v14 = 0;
  v15 = 0;
  objc_msgSend((id)objc_opt_class(), "resolveActivePairedDevicePairingID:pairingDataStore:", &v15, &v14);
  v8 = v15;
  v9 = v14;
  self->_initializedWithActiveDevice = 1;
  v10 = nps_domain_accessor_log;
  if (os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    v17 = "-[NPSDomainAccessor initWithDomain:queue:]";
    v18 = 2112;
    v19 = v6;
    v20 = 2112;
    v21 = v8;
    v22 = 2112;
    v23 = v9;
    _os_log_impl(&dword_1B5280000, v10, OS_LOG_TYPE_DEFAULT, "%s: domain: (%@) pairingID: (%@); pairingDataStore: (%@)",
      buf,
      0x2Au);
  }
  if (v8 && v9)
  {
    self = -[NPSDomainAccessor initWithDomain:queue:pairingID:pairingDataStore:](self, "initWithDomain:queue:pairingID:pairingDataStore:", v6, v7, v8, v9);
    v11 = self;
  }
  else
  {
    v12 = nps_domain_accessor_log;
    if (os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v17 = "-[NPSDomainAccessor initWithDomain:queue:]";
      _os_log_impl(&dword_1B5280000, v12, OS_LOG_TYPE_DEFAULT, "%s: Unable to create domain accessor. No pairing ID or data store.", buf, 0xCu);
    }
    v11 = 0;
  }

  return v11;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  NPSDomainAccessor *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = nps_domain_accessor_log;
  if (os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v6 = self;
    _os_log_impl(&dword_1B5280000, v3, OS_LOG_TYPE_DEFAULT, "self: (%p)", buf, 0xCu);
  }
  if (self->_internalAccessor)
    +[NPSDomainAccessorInternal decrementInternalAccessorReferenceCount:](NPSDomainAccessorInternal, "decrementInternalAccessorReferenceCount:");
  v4.receiver = self;
  v4.super_class = (Class)NPSDomainAccessor;
  -[NPSDomainAccessor dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalAccessor, 0);
  objc_storeStrong((id *)&self->_invalidationQueue, 0);
  objc_storeStrong((id *)&self->_externalQueue, 0);
}

+ (void)resolveActivePairedDevicePairingID:(id *)a3 pairingDataStore:(id *)a4
{
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy_;
  v22 = __Block_byref_object_dispose_;
  v23 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = 0;
  objc_msgSend(MEMORY[0x1E0D51838], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __73__NPSDomainAccessor_resolveActivePairedDevicePairingID_pairingDataStore___block_invoke;
  v11[3] = &unk_1E68E5CA0;
  v11[4] = &v18;
  v11[5] = &v12;
  objc_msgSend(v6, "altAccountPairingStorePathPairingID:", v11);

  v7 = (void *)v19[5];
  if (v7 && v13[5])
  {
    if (a3)
      *a3 = objc_retainAutorelease(v7);
    if (a4)
      *a4 = objc_retainAutorelease((id)v13[5]);
  }
  else
  {
    v8 = nps_domain_accessor_log;
    if (os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT))
    {
      v9 = v19[5];
      v10 = v13[5];
      *(_DWORD *)buf = 138412546;
      v25 = v9;
      v26 = 2112;
      v27 = v10;
      _os_log_impl(&dword_1B5280000, v8, OS_LOG_TYPE_DEFAULT, "Failed to resolve pairing ID (%@) or data store (%@) for active device", buf, 0x16u);
    }
  }
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
}

- (NSString)domain
{
  void *v2;
  void *v3;

  -[NPSDomainAccessor internalAccessor](self, "internalAccessor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSUUID)pairingID
{
  void *v2;
  void *v3;

  -[NPSDomainAccessor internalAccessor](self, "internalAccessor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pairingID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v3;
}

- (id)queue
{
  return self->_externalQueue;
}

- (NPSDomainAccessor)initWithInternalDomainAccessor:(id)a3 queue:(id)a4
{
  id v7;
  id v8;
  NPSDomainAccessor *v9;
  NSObject *v10;
  OS_dispatch_queue *v11;
  OS_dispatch_queue *externalQueue;
  OS_dispatch_queue *v13;
  id v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *invalidationQueue;
  void *v17;
  NSObject *v18;
  NPSDomainAccessor *v19;
  objc_super v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)NPSDomainAccessor;
  v9 = -[NPSDomainAccessor init](&v21, sel_init);
  if (!v9)
    goto LABEL_11;
  v10 = nps_domain_accessor_log;
  if (os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    v23 = (const char *)v9;
    v24 = 2112;
    v25 = v8;
    v26 = 2048;
    v27 = v7;
    _os_log_impl(&dword_1B5280000, v10, OS_LOG_TYPE_DEFAULT, "self: (%p); queue: (%@); internalAccessor: (%p)",
      buf,
      0x20u);
  }
  objc_storeStrong((id *)&v9->_internalAccessor, a3);
  if (v8)
  {
    v11 = (OS_dispatch_queue *)v8;
    externalQueue = v9->_externalQueue;
    v9->_externalQueue = v11;
  }
  else
  {
    v13 = (OS_dispatch_queue *)MEMORY[0x1E0C80D38];
    v14 = MEMORY[0x1E0C80D38];
    externalQueue = v9->_externalQueue;
    v9->_externalQueue = v13;
  }

  v15 = dispatch_queue_create("com.apple.nanoprefsync.frmrk.accessor", 0);
  invalidationQueue = v9->_invalidationQueue;
  v9->_invalidationQueue = (OS_dispatch_queue *)v15;

  -[NPSDomainAccessor shouldNotDoWork](v9, "shouldNotDoWork");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v18 = nps_domain_accessor_log;
    if (os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v23 = "-[NPSDomainAccessor initWithInternalDomainAccessor:queue:]";
      _os_log_impl(&dword_1B5280000, v18, OS_LOG_TYPE_DEFAULT, "%s: Unable to create domain accessor.", buf, 0xCu);
    }
    v19 = 0;
  }
  else
  {
LABEL_11:
    v19 = v9;
  }

  return v19;
}

- (BOOL)activeDeviceChanged
{
  id v3;
  void *v4;
  NPSDomainAccessorInternal *internalAccessor;
  NSObject *v6;
  void *v7;
  void *v8;
  char v9;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v11 = 0;
  objc_msgSend((id)objc_opt_class(), "resolveActivePairedDevicePairingID:pairingDataStore:", &v11, 0);
  v3 = v11;
  v4 = (void *)nps_framework_log;
  if (os_log_type_enabled((os_log_t)nps_framework_log, OS_LOG_TYPE_DEFAULT))
  {
    internalAccessor = self->_internalAccessor;
    v6 = v4;
    -[NPSDomainAccessorInternal pairingID](internalAccessor, "pairingID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v13 = "-[NPSDomainAccessor activeDeviceChanged]";
    v14 = 2112;
    v15 = v3;
    v16 = 2112;
    v17 = v7;
    _os_log_impl(&dword_1B5280000, v6, OS_LOG_TYPE_DEFAULT, "%s: Current active pairing ID: %@. Old ID %@.", buf, 0x20u);

  }
  -[NPSDomainAccessorInternal pairingID](self->_internalAccessor, "pairingID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v3, "isEqual:", v8);

  return v9 ^ 1;
}

- (id)shouldNotDoWork
{
  NSObject *invalidationQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  v11 = 0;
  invalidationQueue = self->_invalidationQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __36__NPSDomainAccessor_shouldNotDoWork__block_invoke;
  v5[3] = &unk_1E68E5CC8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(invalidationQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __36__NPSDomainAccessor_shouldNotDoWork__block_invoke(uint64_t a1)
{
  _BYTE *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  int v18;
  const char *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;
  const __CFString *v25;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_BYTE **)(a1 + 32);
  if (v2[8] && objc_msgSend(v2, "activeDeviceChanged"))
  {
    v3 = (void *)MEMORY[0x1E0CB35C8];
    v26 = *MEMORY[0x1E0CB2D50];
    v27[0] = CFSTR("NPS domain accessor invalid because the active watch has changed- to resolve this specify a device when creating an NPSDomainAccessor");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NanoPreferencesSync"), 1, v4);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) && !NPSShouldRun())
  {
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v24 = *MEMORY[0x1E0CB2D50];
    v25 = CFSTR("NPS domain accessor invalid because there are no paired or pairing watches");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NanoPreferencesSync"), 1, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

  }
  v13 = (void *)nps_domain_accessor_log;
  if (os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT))
  {
    v14 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
    v15 = v13;
    objc_msgSend(v14, "domain");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v18 = 136315650;
    v19 = "-[NPSDomainAccessor shouldNotDoWork]_block_invoke";
    v20 = 2114;
    v21 = v16;
    v22 = 2114;
    v23 = v17;
    _os_log_impl(&dword_1B5280000, v15, OS_LOG_TYPE_DEFAULT, "%s: domain: %{public}@ error: %{public}@", (uint8_t *)&v18, 0x20u);

  }
}

- (void)invalidate
{
  NSObject *invalidationQueue;
  _QWORD block[5];

  invalidationQueue = self->_invalidationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__NPSDomainAccessor_invalidate__block_invoke;
  block[3] = &unk_1E68E5CF0;
  block[4] = self;
  dispatch_sync(invalidationQueue, block);
}

void __31__NPSDomainAccessor_invalidate__block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1B5E498CC]();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "invalidatePresenter");
  objc_autoreleasePoolPop(v2);
}

- (NPSDomainAccessorInternal)internalAccessor
{
  void *v3;
  NSObject *invalidationQueue;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  -[NPSDomainAccessor shouldNotDoWork](self, "shouldNotDoWork");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    return (NPSDomainAccessorInternal *)0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy_;
  v14 = __Block_byref_object_dispose_;
  v15 = 0;
  invalidationQueue = self->_invalidationQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __37__NPSDomainAccessor_internalAccessor__block_invoke;
  v9[3] = &unk_1E68E5D18;
  v9[4] = self;
  v9[5] = &v10;
  dispatch_sync(invalidationQueue, v9);
  v6 = (void *)v11[5];
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Accessor is used after being invalidated"), 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v8);
  }
  v7 = v6;
  _Block_object_dispose(&v10, 8);

  return (NPSDomainAccessorInternal *)v7;
}

void __37__NPSDomainAccessor_internalAccessor__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 32));
}

- (id)synchronize
{
  void *v2;
  void *v3;

  -[NPSDomainAccessor internalAccessor](self, "internalAccessor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronize");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)synchronizeWithCompletionHandler:(id)a3
{
  id v4;
  OS_dispatch_queue *v5;
  void *v6;
  id *v7;
  id *v8;
  void *v9;
  _QWORD v10[4];
  OS_dispatch_queue *v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;

  v4 = a3;
  v5 = self->_externalQueue;
  -[NPSDomainAccessor shouldNotDoWork](self, "shouldNotDoWork");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __54__NPSDomainAccessor_synchronizeWithCompletionHandler___block_invoke;
    block[3] = &unk_1E68E5D40;
    v7 = &v15;
    v15 = v4;
    v8 = &v14;
    v14 = v6;
    dispatch_async((dispatch_queue_t)v5, block);
  }
  else
  {
    -[NPSDomainAccessor internalAccessor](self, "internalAccessor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __54__NPSDomainAccessor_synchronizeWithCompletionHandler___block_invoke_2;
    v10[3] = &unk_1E68E5D68;
    v7 = &v12;
    v12 = v4;
    v8 = (id *)&v11;
    v11 = v5;
    objc_msgSend(v9, "synchronizeWithCompletionHandler:", v10);

  }
}

uint64_t __54__NPSDomainAccessor_synchronizeWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __54__NPSDomainAccessor_synchronizeWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  if (v4)
  {
    v5 = *(NSObject **)(a1 + 32);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __54__NPSDomainAccessor_synchronizeWithCompletionHandler___block_invoke_3;
    v6[3] = &unk_1E68E5D40;
    v8 = v4;
    v7 = v3;
    dispatch_async(v5, v6);

  }
}

uint64_t __54__NPSDomainAccessor_synchronizeWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (id)objectForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[NPSDomainAccessor internalAccessor](self, "internalAccessor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)objectForKey:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *v8;
  void *v9;
  id *v10;
  id *v11;
  void *v12;
  _QWORD v13[4];
  OS_dispatch_queue *v14;
  id v15;
  _QWORD block[4];
  id v17;
  id v18;

  v6 = a3;
  v7 = a4;
  v8 = self->_externalQueue;
  -[NPSDomainAccessor shouldNotDoWork](self, "shouldNotDoWork");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __52__NPSDomainAccessor_objectForKey_completionHandler___block_invoke;
    block[3] = &unk_1E68E5D40;
    v10 = &v18;
    v18 = v7;
    v11 = &v17;
    v17 = v9;
    dispatch_async((dispatch_queue_t)v8, block);
  }
  else
  {
    -[NPSDomainAccessor internalAccessor](self, "internalAccessor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __52__NPSDomainAccessor_objectForKey_completionHandler___block_invoke_2;
    v13[3] = &unk_1E68E5DB8;
    v10 = &v15;
    v15 = v7;
    v11 = (id *)&v14;
    v14 = v8;
    objc_msgSend(v12, "objectForKey:completionHandler:", v6, v13);

  }
}

uint64_t __52__NPSDomainAccessor_objectForKey_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __52__NPSDomainAccessor_objectForKey_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  if (v7)
  {
    v8 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __52__NPSDomainAccessor_objectForKey_completionHandler___block_invoke_3;
    block[3] = &unk_1E68E5D90;
    v12 = v7;
    v10 = v5;
    v11 = v6;
    dispatch_async(v8, block);

  }
}

uint64_t __52__NPSDomainAccessor_objectForKey_completionHandler___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[NPSDomainAccessor internalAccessor](self, "internalAccessor");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v7, v6);

}

- (void)setObject:(id)a3 forKey:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  OS_dispatch_queue *v11;
  void *v12;
  id *v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  OS_dispatch_queue *v18;
  id v19;
  _QWORD block[4];
  id v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self->_externalQueue;
  -[NPSDomainAccessor shouldNotDoWork](self, "shouldNotDoWork");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__NPSDomainAccessor_setObject_forKey_completionHandler___block_invoke;
    block[3] = &unk_1E68E5DE0;
    v13 = &v21;
    v21 = v10;
    v14 = v10;
    dispatch_async((dispatch_queue_t)v11, block);
  }
  else
  {
    -[NPSDomainAccessor internalAccessor](self, "internalAccessor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __56__NPSDomainAccessor_setObject_forKey_completionHandler___block_invoke_2;
    v17[3] = &unk_1E68E5D40;
    v13 = &v19;
    v19 = v10;
    v18 = v11;
    v16 = v10;
    objc_msgSend(v15, "setObject:forKey:completionHandler:", v8, v9, v17);

  }
}

uint64_t __56__NPSDomainAccessor_setObject_forKey_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __56__NPSDomainAccessor_setObject_forKey_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v1;
  NSObject *v2;
  _QWORD block[4];
  id v4;

  v1 = *(void **)(a1 + 40);
  if (v1)
  {
    v2 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__NPSDomainAccessor_setObject_forKey_completionHandler___block_invoke_3;
    block[3] = &unk_1E68E5DE0;
    v4 = v1;
    dispatch_async(v2, block);

  }
}

uint64_t __56__NPSDomainAccessor_setObject_forKey_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)removeObjectForKey:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[NPSDomainAccessor internalAccessor](self, "internalAccessor");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectForKey:", v4);

}

- (id)stringForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[NPSDomainAccessor internalAccessor](self, "internalAccessor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)arrayForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[NPSDomainAccessor internalAccessor](self, "internalAccessor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[NPSDomainAccessor internalAccessor](self, "internalAccessor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dictionaryForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dataForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[NPSDomainAccessor internalAccessor](self, "internalAccessor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)stringArrayForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[NPSDomainAccessor internalAccessor](self, "internalAccessor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int64_t)integerForKey:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;

  v4 = a3;
  -[NPSDomainAccessor internalAccessor](self, "internalAccessor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerForKey:", v4);

  return v6;
}

- (int64_t)longForKey:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;

  v4 = a3;
  -[NPSDomainAccessor internalAccessor](self, "internalAccessor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "longForKey:", v4);

  return v6;
}

- (float)floatForKey:(id)a3
{
  id v4;
  void *v5;
  float v6;
  float v7;

  v4 = a3;
  -[NPSDomainAccessor internalAccessor](self, "internalAccessor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "floatForKey:", v4);
  v7 = v6;

  return v7;
}

- (double)doubleForKey:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;

  v4 = a3;
  -[NPSDomainAccessor internalAccessor](self, "internalAccessor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleForKey:", v4);
  v7 = v6;

  return v7;
}

- (BOOL)BOOLForKey:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[NPSDomainAccessor internalAccessor](self, "internalAccessor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLForKey:", v4);

  return v6;
}

- (id)URLForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[NPSDomainAccessor internalAccessor](self, "internalAccessor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int64_t)integerForKey:(id)a3 keyExistsAndHasValidFormat:(BOOL *)a4
{
  id v6;
  void *v7;
  int64_t v8;

  v6 = a3;
  -[NPSDomainAccessor internalAccessor](self, "internalAccessor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerForKey:keyExistsAndHasValidFormat:", v6, a4);

  return v8;
}

- (int64_t)longForKey:(id)a3 keyExistsAndHasValidFormat:(BOOL *)a4
{
  id v6;
  void *v7;
  int64_t v8;

  v6 = a3;
  -[NPSDomainAccessor internalAccessor](self, "internalAccessor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "longForKey:keyExistsAndHasValidFormat:", v6, a4);

  return v8;
}

- (float)floatForKey:(id)a3 keyExistsAndHasValidFormat:(BOOL *)a4
{
  id v6;
  void *v7;
  float v8;
  float v9;

  v6 = a3;
  -[NPSDomainAccessor internalAccessor](self, "internalAccessor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "floatForKey:keyExistsAndHasValidFormat:", v6, a4);
  v9 = v8;

  return v9;
}

- (double)doubleForKey:(id)a3 keyExistsAndHasValidFormat:(BOOL *)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;

  v6 = a3;
  -[NPSDomainAccessor internalAccessor](self, "internalAccessor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleForKey:keyExistsAndHasValidFormat:", v6, a4);
  v9 = v8;

  return v9;
}

- (BOOL)BOOLForKey:(id)a3 keyExistsAndHasValidFormat:(BOOL *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[NPSDomainAccessor internalAccessor](self, "internalAccessor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "BOOLForKey:keyExistsAndHasValidFormat:", v6, a4);

  return (char)a4;
}

- (void)setInteger:(int64_t)a3 forKey:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[NPSDomainAccessor internalAccessor](self, "internalAccessor");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setInteger:forKey:", a3, v6);

}

- (void)setFloat:(float)a3 forKey:(id)a4
{
  id v6;
  double v7;
  id v8;

  v6 = a4;
  -[NPSDomainAccessor internalAccessor](self, "internalAccessor");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v7 = a3;
  objc_msgSend(v8, "setFloat:forKey:", v6, v7);

}

- (void)setDouble:(double)a3 forKey:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[NPSDomainAccessor internalAccessor](self, "internalAccessor");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDouble:forKey:", v6, a3);

}

- (void)setBool:(BOOL)a3 forKey:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a3;
  v6 = a4;
  -[NPSDomainAccessor internalAccessor](self, "internalAccessor");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBool:forKey:", v4, v6);

}

- (void)setURL:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[NPSDomainAccessor internalAccessor](self, "internalAccessor");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setURL:forKey:", v7, v6);

}

- (id)dictionaryRepresentation
{
  void *v2;
  void *v3;

  -[NPSDomainAccessor internalAccessor](self, "internalAccessor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)copyKeyList
{
  void *v2;
  void *v3;

  -[NPSDomainAccessor internalAccessor](self, "internalAccessor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copyKeyList");

  return v3;
}

+ (id)copyDomainList
{
  NSObject *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v10;
  id v11;
  uint8_t buf[4];
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = nps_domain_accessor_log;
  if (os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v13 = "+[NPSDomainAccessor copyDomainList]";
    _os_log_impl(&dword_1B5280000, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }
  if (NPSShouldRun())
  {
    v10 = 0;
    v11 = 0;
    objc_msgSend((id)objc_opt_class(), "resolveActivePairedDevicePairingID:pairingDataStore:", &v11, &v10);
    v4 = v11;
    v5 = v10;
    v6 = v5;
    v7 = 0;
    if (v4 && v5)
      v7 = (void *)objc_msgSend(a1, "copyDomainListForPairingID:pairingDataStore:", v4, v5);

  }
  else
  {
    v8 = nps_domain_accessor_log;
    if (os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v13 = "+[NPSDomainAccessor copyDomainList]";
      _os_log_impl(&dword_1B5280000, v8, OS_LOG_TYPE_DEFAULT, "%s: No paired watches, returning nil", buf, 0xCu);
    }
    return 0;
  }
  return v7;
}

+ (id)copyDomainListForPairingID:(id)a3 pairingDataStore:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = nps_domain_accessor_log;
  if (os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315650;
    v12 = "+[NPSDomainAccessor copyDomainListForPairingID:pairingDataStore:]";
    v13 = 2112;
    v14 = v5;
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_1B5280000, v7, OS_LOG_TYPE_DEFAULT, "%s: pairingID: (%@); pairingDataStore: (%@)",
      (uint8_t *)&v11,
      0x20u);
  }
  if (NPSShouldRun())
  {
    v8 = +[NPSDomainAccessorInternal copyDomainListForPairingDataStore:](NPSDomainAccessorInternal, "copyDomainListForPairingDataStore:", v6);
  }
  else
  {
    v9 = nps_domain_accessor_log;
    if (os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 136315138;
      v12 = "+[NPSDomainAccessor copyDomainListForPairingID:pairingDataStore:]";
      _os_log_impl(&dword_1B5280000, v9, OS_LOG_TYPE_DEFAULT, "%s: No paired watches, returning nil", (uint8_t *)&v11, 0xCu);
    }
    v8 = 0;
  }

  return v8;
}

- (unint64_t)domainSize
{
  void *v2;
  unint64_t v3;

  -[NPSDomainAccessor internalAccessor](self, "internalAccessor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "domainSize");

  return v3;
}

- (BOOL)requiresDeviceUnlockedSinceBoot
{
  void *v2;
  char v3;

  -[NPSDomainAccessor internalAccessor](self, "internalAccessor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "requiresDeviceUnlockedSinceBoot");

  return v3;
}

- (OS_dispatch_queue)externalQueue
{
  return self->_externalQueue;
}

- (void)setExternalQueue:(id)a3
{
  objc_storeStrong((id *)&self->_externalQueue, a3);
}

- (OS_dispatch_queue)invalidationQueue
{
  return self->_invalidationQueue;
}

- (void)setInvalidationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_invalidationQueue, a3);
}

- (void)setInternalAccessor:(id)a3
{
  objc_storeStrong((id *)&self->_internalAccessor, a3);
}

- (BOOL)initializedWithActiveDevice
{
  return self->_initializedWithActiveDevice;
}

- (void)setInitializedWithActiveDevice:(BOOL)a3
{
  self->_initializedWithActiveDevice = a3;
}

@end
