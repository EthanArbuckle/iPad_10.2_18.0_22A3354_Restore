@implementation HMFMutableNetService

- (HMFMutableNetService)initWithNetService:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99768];
  v7 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ is unavailable"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v9, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v10);
}

- (HMFMutableNetService)initWithDomain:(id)a3 type:(id)a4 name:(id)a5 port:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  HMFMutableNetService *v14;
  uint64_t v15;
  NSString *domain;
  uint64_t v17;
  NSString *type;
  uint64_t v19;
  NSString *name;
  void *v21;
  uint64_t v22;
  NSArray *addresses;
  HMFMutableNetService *v24;
  HMFMutableNetService *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  const char *v29;
  objc_super v31;
  void *v32;
  uint8_t buf[4];
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = v12;
  if (!v10)
  {
    v26 = (void *)MEMORY[0x1A1AC355C]();
    v24 = self;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    HMFGetLogIdentifier(v24);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v34 = v28;
    v29 = "%{public}@Service domain is required";
LABEL_13:
    _os_log_impl(&dword_19B546000, v27, OS_LOG_TYPE_ERROR, v29, buf, 0xCu);

    goto LABEL_14;
  }
  if (!v11)
  {
    v26 = (void *)MEMORY[0x1A1AC355C]();
    v24 = self;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    HMFGetLogIdentifier(v24);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v34 = v28;
    v29 = "%{public}@Service type is required";
    goto LABEL_13;
  }
  if (!v12)
  {
    v26 = (void *)MEMORY[0x1A1AC355C]();
    v24 = self;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier(v24);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v34 = v28;
      v29 = "%{public}@Service name is required";
      goto LABEL_13;
    }
LABEL_14:

    objc_autoreleasePoolPop(v26);
    v25 = 0;
    goto LABEL_15;
  }
  v31.receiver = self;
  v31.super_class = (Class)HMFMutableNetService;
  v14 = -[HMFNetService initWithNetService:](&v31, sel_initWithNetService_, 0);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    domain = v14->super._domain;
    v14->super._domain = (NSString *)v15;

    v17 = objc_msgSend(v11, "copy");
    type = v14->super._type;
    v14->super._type = (NSString *)v17;

    v19 = objc_msgSend(v13, "copy");
    name = v14->super._name;
    v14->super._name = (NSString *)v19;

    v14->super._port = a6;
    +[HMFNetAddress localAddress](HMFNetAddress, "localAddress");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
    v22 = objc_claimAutoreleasedReturnValue();
    addresses = v14->super._addresses;
    v14->super._addresses = (NSArray *)v22;

  }
  v24 = v14;
  v25 = v24;
LABEL_15:

  return v25;
}

- (void)setPort:(unint64_t)a3
{
  __HMFNetServiceUpdatePort(self, a3);
}

- (void)setTXTRecord:(id)a3
{
  void *v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *TXTRecord;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v4 = (void *)objc_msgSend(v10, "mutableCopy");
  os_unfair_lock_lock_with_options();
  if ((-[NSMutableDictionary isEqualToDictionary:](self->super._TXTRecord, "isEqualToDictionary:", v4) & 1) != 0)
  {
    os_unfair_lock_unlock(&self->super._lock);
  }
  else
  {
    if (v4)
    {
      v5 = v4;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v5 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    }
    TXTRecord = self->super._TXTRecord;
    self->super._TXTRecord = v5;

    -[HMFMutableNetService updateTXTRecord](self, "updateTXTRecord");
    os_unfair_lock_unlock(&self->super._lock);
    v7 = objc_msgSend(v4, "copy");
    v8 = (void *)v7;
    if (v7)
      v9 = (void *)v7;
    else
      v9 = (void *)MEMORY[0x1E0C9AA70];
    __notifyUpdatedTXTRecord(self, v9);

  }
}

- (void)setTXTRecordValue:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  HMFMutableNetService *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  HMFMutableNetService *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  int v22;
  void *v23;
  const __CFString *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = (__CFString *)v7;
  v10 = (void *)MEMORY[0x1E0C92C38];
  v24 = v9;
  objc_msgSend(MEMORY[0x1E0C99D50], "data");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v10, "dataFromTXTRecordDictionary:", v12);

  v14 = 0;
  v15 = v8;
  v16 = v6;
  v17 = (void *)MEMORY[0x1E0C92C38];
  v24 = CFSTR("key");
  v25[0] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (id)objc_msgSend(v17, "dataFromTXTRecordDictionary:", v18);

  v20 = v14;
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary objectForKey:](v15->super._TXTRecord, "objectForKey:", v9);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "isEqualToData:", v16);

  if (v22)
  {
    os_unfair_lock_unlock(&v15->super._lock);
  }
  else
  {
    -[NSMutableDictionary setObject:forKey:](v15->super._TXTRecord, "setObject:forKey:", v16, v9);
    -[HMFMutableNetService updateTXTRecord](v15, "updateTXTRecord");
    v23 = (void *)-[NSMutableDictionary copy](v15->super._TXTRecord, "copy");
    os_unfair_lock_unlock(&v15->super._lock);
    if (v23)
    {
      __notifyUpdatedTXTRecord(v15, v23);

    }
  }

}

- (void)removeTXTRecordValueForKey:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary removeObjectForKey:](self->super._TXTRecord, "removeObjectForKey:", v5);
  -[HMFMutableNetService updateTXTRecord](self, "updateTXTRecord");
  v4 = (void *)-[NSMutableDictionary copy](self->super._TXTRecord, "copy");
  os_unfair_lock_unlock(&self->super._lock);
  if (v4)
    __notifyUpdatedTXTRecord(self, v4);

}

- (void)updateTXTRecord
{
  NSObject *v3;
  _QWORD block[5];

  -[HMFNetService clientQueue](self, "clientQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__HMFMutableNetService_updateTXTRecord__block_invoke;
  block[3] = &unk_1E3B37AF8;
  block[4] = self;
  dispatch_async(v3, block);

}

void __39__HMFMutableNetService_updateTXTRecord__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "isPublishing"))
  {
    objc_msgSend(*(id *)(a1 + 32), "internal");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)MEMORY[0x1E0C92C38];
    objc_msgSend(*(id *)(a1 + 32), "TXTRecord");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dataFromTXTRecordDictionary:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v2, "setTXTRecordData:", v5);

    if ((v6 & 1) == 0)
    {
      v7 = (void *)MEMORY[0x1A1AC355C]();
      v8 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier(v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 138543362;
        v12 = v10;
        _os_log_impl(&dword_19B546000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to update TXT record", (uint8_t *)&v11, 0xCu);

      }
      objc_autoreleasePoolPop(v7);
    }
  }
}

- (id)internal
{
  os_unfair_lock_s *p_lock;
  NSNetService *v4;

  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  v4 = self->super._internal;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setInternal:(id)a3
{
  NSNetService *v4;
  NSNetService *internal;

  v4 = (NSNetService *)a3;
  os_unfair_lock_lock_with_options();
  internal = self->super._internal;
  self->super._internal = v4;

  os_unfair_lock_unlock(&self->super._lock);
}

- (void)startPublishingWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMFNetService clientQueue](self, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__HMFMutableNetService_startPublishingWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E3B37D38;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __61__HMFMutableNetService_startPublishingWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  int v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "isPublishing"))
  {
    v2 = (void *)MEMORY[0x1A1AC355C]();
    v3 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier(v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 138543362;
      v29 = v5;
      _os_log_impl(&dword_19B546000, v4, OS_LOG_TYPE_INFO, "%{public}@The service is already publishing", (uint8_t *)&v28, 0xCu);

    }
    objc_autoreleasePoolPop(v2);
    v6 = *(_QWORD *)(a1 + 40);
    if (v6)
      (*(void (**)(uint64_t, _QWORD))(v6 + 16))(v6, 0);
    return;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "port"))
  {
    v7 = objc_alloc(MEMORY[0x1E0C92C38]);
    objc_msgSend(*(id *)(a1 + 32), "domain");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "type");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v7, "initWithDomain:type:name:port:", v8, v9, v10, objc_msgSend(*(id *)(a1 + 32), "port"));

    if (v11)
    {
      objc_msgSend(*(id *)(a1 + 32), "setInternal:", v11);
      objc_msgSend(v11, "setDelegate:", *(_QWORD *)(a1 + 32));
      v12 = (void *)MEMORY[0x1E0C92C38];
      objc_msgSend(*(id *)(a1 + 32), "TXTRecord");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "dataFromTXTRecordDictionary:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setTXTRecordData:", v14);

      v15 = (void *)MEMORY[0x1A1AC355C]();
      v16 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier(v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 138543362;
        v29 = v18;
        _os_log_impl(&dword_19B546000, v17, OS_LOG_TYPE_INFO, "%{public}@Start publishing the net service", (uint8_t *)&v28, 0xCu);

      }
      objc_autoreleasePoolPop(v15);
      objc_msgSend(*(id *)(a1 + 32), "setPublishing:", 1);
      objc_msgSend(*(id *)(a1 + 32), "setPublishBlock:", *(_QWORD *)(a1 + 40));
      objc_msgSend(*(id *)(a1 + 32), "internal");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "publishWithOptions:", 0);
    }
    else
    {
      v24 = (void *)MEMORY[0x1A1AC355C]();
      v25 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier(v25);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 138543362;
        v29 = v27;
        _os_log_impl(&dword_19B546000, v26, OS_LOG_TYPE_ERROR, "%{public}@Failed to create internal net service", (uint8_t *)&v28, 0xCu);

      }
      objc_autoreleasePoolPop(v24);
      if (!*(_QWORD *)(a1 + 40))
        goto LABEL_20;
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:reason:", 3, CFSTR("Failed to create record."));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }

LABEL_20:
    return;
  }
  v20 = (void *)MEMORY[0x1A1AC355C]();
  v21 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier(v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 138543362;
    v29 = v23;
    _os_log_impl(&dword_19B546000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@Cannot publish without a resolved port", (uint8_t *)&v28, 0xCu);

  }
  objc_autoreleasePoolPop(v20);
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:reason:", 3, CFSTR("Cannot publish without a resolved port."));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    goto LABEL_20;
  }
}

- (void)stopPublishing
{
  void *v3;
  HMFMutableNetService *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  _QWORD block[5];
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (-[HMFNetService isPublishing](self, "isPublishing"))
  {
    v3 = (void *)MEMORY[0x1A1AC355C]();
    v4 = self;
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier(v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v10 = v6;
      _os_log_impl(&dword_19B546000, v5, OS_LOG_TYPE_INFO, "%{public}@Stopping the net service", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
    -[HMFNetService setPublishing:](v4, "setPublishing:", 0);
    -[HMFNetService clientQueue](v4, "clientQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __38__HMFMutableNetService_stopPublishing__block_invoke;
    block[3] = &unk_1E3B37AF8;
    block[4] = v4;
    dispatch_async(v7, block);

  }
}

void __38__HMFMutableNetService_stopPublishing__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "internal");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stop");

}

- (void)netServiceWillPublish:(id)a3
{
  id v4;
  void *v5;
  HMFMutableNetService *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1A1AC355C]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v8;
    _os_log_impl(&dword_19B546000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Net service will publish", (uint8_t *)&v9, 0xCu);

  }
  objc_autoreleasePoolPop(v5);

}

- (void)netServiceDidPublish:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HMFNetService clientQueue](self, "clientQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__HMFMutableNetService_netServiceDidPublish___block_invoke;
  block[3] = &unk_1E3B37AF8;
  block[4] = self;
  dispatch_async(v4, block);

}

void __45__HMFMutableNetService_netServiceDidPublish___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1A1AC355C]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_19B546000, v4, OS_LOG_TYPE_INFO, "%{public}@Published", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "publishBlock");
  v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "setPublishBlock:", 0);
    v6[2](v6, 0);
  }

}

- (void)netService:(id)a3 didNotPublish:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  -[HMFNetService clientQueue](self, "clientQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __49__HMFMutableNetService_netService_didNotPublish___block_invoke;
  v8[3] = &unk_1E3B37CA8;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, v8);

}

void __49__HMFMutableNetService_netService_didNotPublish___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void (**v11)(_QWORD, _QWORD);
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1A1AC355C]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543362;
    v16 = v5;
    _os_log_impl(&dword_19B546000, v4, OS_LOG_TYPE_INFO, "%{public}@Failed to publish", (uint8_t *)&v15, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  v6 = (void *)MEMORY[0x1A1AC355C]();
  v7 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 40);
    v15 = 138543618;
    v16 = v9;
    v17 = 2112;
    v18 = v10;
    _os_log_impl(&dword_19B546000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Failed to publish with error: %@", (uint8_t *)&v15, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  objc_msgSend(*(id *)(a1 + 32), "publishBlock");
  v11 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(*(id *)(a1 + 32), "setPublishBlock:", 0);
    v12 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend((id)objc_opt_class(), "errorFromNetServiceErrorDict:", *(_QWORD *)(a1 + 40));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "hmfErrorWithCode:reason:suggestion:underlyingError:", 11, CFSTR("Failed to publish net service."), 0, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    ((void (**)(_QWORD, void *))v11)[2](v11, v14);
  }

}

- (void)netServiceDidStop:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HMFNetService clientQueue](self, "clientQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__HMFMutableNetService_netServiceDidStop___block_invoke;
  block[3] = &unk_1E3B37AF8;
  block[4] = self;
  dispatch_async(v4, block);

}

void __42__HMFMutableNetService_netServiceDidStop___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1A1AC355C]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v5;
    _os_log_impl(&dword_19B546000, v4, OS_LOG_TYPE_DEBUG, "%{public}@Net service did stop", (uint8_t *)&v8, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "setPublishing:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setInternal:", 0);
  objc_msgSend(*(id *)(a1 + 32), "publishBlock");
  v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "setPublishBlock:", 0);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:reason:", 12, CFSTR("Net service stopped publishing."));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v6)[2](v6, v7);

  }
}

- (id)publishBlock
{
  return self->_publishBlock;
}

- (void)setPublishBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_publishBlock, 0);
}

@end
