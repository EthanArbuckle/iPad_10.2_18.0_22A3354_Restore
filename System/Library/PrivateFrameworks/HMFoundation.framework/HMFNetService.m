@implementation HMFNetService

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  id v3;
  char v4;
  void *v6;
  char v7;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("resolved")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("isResolved")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("publishing")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("isPublishing")) & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    NSStringFromSelector(sel_port);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v3, "isEqualToString:", v6);

    v4 = v7 ^ 1;
  }

  return v4;
}

+ (id)errorFromNetServiceErrorDict:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "hmf_numberForKey:", *MEMORY[0x1E0C92B20]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("NSNetServiceErrorDomain"), objc_msgSend(v4, "integerValue"), v3);
  else
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:userInfo:", 11, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (HMFNetService)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (HMFNetService)initWithDomain:(id)a3 type:(id)a4 name:(id)a5
{
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  HMFNetService *v13;

  v8 = (objc_class *)MEMORY[0x1E0C92C38];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = (void *)objc_msgSend([v8 alloc], "initWithDomain:type:name:", v11, v10, v9);

  v13 = -[HMFNetService initWithNetService:](self, "initWithNetService:", v12);
  return v13;
}

- (HMFNetService)initWithNetService:(id)a3
{
  id v5;
  HMFNetService *v6;
  HMFNetService *v7;
  void *v8;
  uint64_t v9;
  NSString *domain;
  void *v11;
  uint64_t v12;
  NSString *type;
  void *v14;
  uint64_t v15;
  NSString *name;
  uint64_t v17;
  NSMutableArray *resolveBlocks;
  uint64_t v19;
  NSMutableDictionary *TXTRecord;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  objc_super v26;

  v5 = a3;
  v26.receiver = self;
  v26.super_class = (Class)HMFNetService;
  v6 = -[HMFNetService init](&v26, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_clientQueue, MEMORY[0x1E0C80D38]);
    objc_msgSend(v5, "domain");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "copy");
    domain = v7->_domain;
    v7->_domain = (NSString *)v9;

    objc_msgSend(v5, "type");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "copy");
    type = v7->_type;
    v7->_type = (NSString *)v12;

    objc_msgSend(v5, "name");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "copy");
    name = v7->_name;
    v7->_name = (NSString *)v15;

    v7->_port = objc_msgSend(v5, "port");
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v17 = objc_claimAutoreleasedReturnValue();
    resolveBlocks = v7->_resolveBlocks;
    v7->_resolveBlocks = (NSMutableArray *)v17;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v19 = objc_claimAutoreleasedReturnValue();
    TXTRecord = v7->_TXTRecord;
    v7->_TXTRecord = (NSMutableDictionary *)v19;

    objc_storeStrong((id *)&v7->_internal, a3);
    objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = *MEMORY[0x1E0C99860];
    objc_msgSend(v5, "removeFromRunLoop:forMode:", v21, *MEMORY[0x1E0C99860]);

    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "scheduleInRunLoop:forMode:", v23, v22);

    if (v5)
    {
      objc_msgSend(v5, "TXTRecordData");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMFNetService updateTXTRecordWithData:](v7, "updateTXTRecordWithData:", v24);

    }
    -[HMFNetService startMonitoring](v7, "startMonitoring");
  }

  return v7;
}

- (void)dealloc
{
  NSNetService *v3;
  NSNetService *internal;
  OS_dispatch_queue *clientQueue;
  NSObject *v6;
  id v7;
  objc_super v8;
  _QWORD block[4];
  NSNetService *v10;

  v3 = self->_internal;
  -[NSNetService setDelegate:](v3, "setDelegate:", 0);
  internal = self->_internal;
  self->_internal = 0;

  if (v3)
  {
    clientQueue = self->_clientQueue;
    if (clientQueue)
    {
      v6 = clientQueue;
    }
    else
    {
      v6 = MEMORY[0x1E0C80D38];
      v7 = MEMORY[0x1E0C80D38];
    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __24__HMFNetService_dealloc__block_invoke;
    block[3] = &unk_1E3B37AF8;
    v10 = v3;
    dispatch_async(v6, block);

  }
  v8.receiver = self;
  v8.super_class = (Class)HMFNetService;
  -[HMFNetService dealloc](&v8, sel_dealloc);
}

uint64_t __24__HMFNetService_dealloc__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "stop");
  return objc_msgSend(*(id *)(a1 + 32), "stopMonitoring");
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (id)shortDescription
{
  return (id)objc_msgSend((id)objc_opt_class(), "shortDescription");
}

- (id)descriptionWithPointer:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  _BOOL4 v11;
  _BOOL8 v12;
  _BOOL8 v13;
  void *v14;
  void *v15;
  void *v17;
  __CFString *v18;
  _BOOL4 v19;

  v3 = a3;
  v17 = (void *)MEMORY[0x1E0CB3940];
  -[HMFNetService shortDescription](self, "shortDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" %p"), self);
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = &stru_1E3B39EC0;
  }
  -[HMFNetService domain](self, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMFNetService type](self, "type");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMFNetService name](self, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HMFNetService port](self, "port");
  -[HMFNetService addresses](self, "addresses");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HMFNetService isPublishing](self, "isPublishing");
  v12 = self->_resolveState == 1;
  v13 = self->_resolveRunningState == 1;
  -[HMFNetService resolveBlocks](self, "resolveBlocks");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringWithFormat:", CFSTR("<%@%@, Domain = %@, Type = %@, Name = %@, Port = %tu, Addresses = %@, isPublishing = %d, ResolveState = %d, ResolveRunningState = %d, ResolveBlocksCount = %d>"), v5, v18, v6, v7, v8, v9, v10, v11, v12, v13, objc_msgSend(v14, "count"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  return v15;
}

- (NSString)debugDescription
{
  return (NSString *)-[HMFNetService descriptionWithPointer:](self, "descriptionWithPointer:", 1);
}

- (NSString)description
{
  return (NSString *)-[HMFNetService descriptionWithPointer:](self, "descriptionWithPointer:", 0);
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[HMFNetService name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[HMFNetService type](self, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[HMFNetService domain](self, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  HMFNetService *v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;

  v4 = (HMFNetService *)a3;
  if (self == v4)
  {
    v18 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_11;
    v5 = -[HMFNetService port](self, "port");
    v6 = -[HMFNetService port](v4, "port");
    if (v5 != -1 && v6 != -1)
    {
      v7 = -[HMFNetService port](self, "port");
      if (v7 != -[HMFNetService port](v4, "port"))
        goto LABEL_11;
    }
    -[HMFNetService name](self, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMFNetService name](v4, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqualToString:", v9);

    if (!v10)
      goto LABEL_11;
    -[HMFNetService type](self, "type");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMFNetService type](v4, "type");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqualToString:", v12);

    if (v13)
    {
      -[HMFNetService domain](self, "domain");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "length"))
      {
        -[HMFNetService domain](v4, "domain");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v15, "length"))
        {
          -[HMFNetService domain](self, "domain");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMFNetService domain](v4, "domain");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v16, "isEqualToString:", v17);

        }
        else
        {
          v18 = 1;
        }

      }
      else
      {
        v18 = 1;
      }

    }
    else
    {
LABEL_11:
      v18 = 0;
    }
  }

  return v18;
}

- (void)startMonitoring
{
  NSObject *v3;
  _QWORD block[5];

  -[HMFNetService clientQueue](self, "clientQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__HMFNetService_startMonitoring__block_invoke;
  block[3] = &unk_1E3B37AF8;
  block[4] = self;
  dispatch_async(v3, block);

}

void __32__HMFNetService_startMonitoring__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDelegate:", *(_QWORD *)(a1 + 32));

  objc_msgSend(*(id *)(a1 + 32), "internal");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startMonitoring");

}

- (unint64_t)port
{
  os_unfair_lock_s *p_lock;
  unint64_t port;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  port = self->_port;
  os_unfair_lock_unlock(p_lock);
  return port;
}

- (BOOL)isResolved
{
  HMFNetService *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_resolved;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setResolved:(BOOL)a3
{
  if (a3)
  {
    -[HMFNetService willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isResolved"));
    os_unfair_lock_lock_with_options();
    self->_resolved = 1;
    os_unfair_lock_unlock(&self->_lock);
    -[HMFNetService didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isResolved"));
  }
}

- (BOOL)isPublishing
{
  HMFNetService *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_publishing;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setPublishing:(BOOL)a3
{
  _BOOL4 v3;
  id v5;

  v3 = a3;
  -[HMFNetService willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isPublishing"));
  os_unfair_lock_lock_with_options();
  if (self->_publishing == v3)
  {
    os_unfair_lock_unlock(&self->_lock);
    -[HMFNetService didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isPublishing"));
  }
  else
  {
    self->_publishing = v3;
    os_unfair_lock_unlock(&self->_lock);
    -[HMFNetService didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isPublishing"));
    -[HMFNetService delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v5, "netServiceDidStartPublishing:", self);
    }
    else if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v5, "netServiceDidStopPublishing:", self);
    }

  }
}

- (int64_t)resolveState
{
  NSObject *v3;

  -[HMFNetService clientQueue](self, "clientQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  return self->_resolveState;
}

- (void)setResolveState:(int64_t)a3
{
  NSObject *v5;

  -[HMFNetService clientQueue](self, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  self->_resolveState = a3;
}

- (int64_t)resolveRunningState
{
  NSObject *v3;

  -[HMFNetService clientQueue](self, "clientQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  return self->_resolveRunningState;
}

- (void)setResolveRunningState:(int64_t)a3
{
  NSObject *v5;

  -[HMFNetService clientQueue](self, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  self->_resolveRunningState = a3;
}

- (HMFNetAddress)hostName
{
  os_unfair_lock_s *p_lock;
  HMFNetAddress *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_hostName;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setHostname:(id)a3
{
  HMFNetAddress *v4;
  HMFNetAddress *hostName;

  v4 = (HMFNetAddress *)a3;
  os_unfair_lock_lock_with_options();
  hostName = self->_hostName;
  self->_hostName = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSArray)addresses
{
  os_unfair_lock_s *p_lock;
  NSArray *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_addresses;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setAddresses:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_msgSend(v5, "copy");
  os_unfair_lock_lock_with_options();
  if ((-[NSArray isEqual:](self->_addresses, "isEqual:", v4) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_addresses, v4);
    -[HMFNetService notifyUpdatedAddresses:](self, "notifyUpdatedAddresses:", v4);
  }
  os_unfair_lock_unlock(&self->_lock);

}

- (void)notifyUpdatedAddresses:(id)a3
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
  v7[2] = __40__HMFNetService_notifyUpdatedAddresses___block_invoke;
  v7[3] = &unk_1E3B37CA8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __40__HMFNetService_notifyUpdatedAddresses___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "netService:didUpdateAddresses:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (NSDictionary)TXTRecord
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)-[NSMutableDictionary copy](self->_TXTRecord, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSDictionary *)v4;
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
  if ((-[NSMutableDictionary isEqualToDictionary:](self->_TXTRecord, "isEqualToDictionary:", v10) & 1) != 0)
  {
    os_unfair_lock_unlock(&self->_lock);
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
    TXTRecord = self->_TXTRecord;
    self->_TXTRecord = v5;

    os_unfair_lock_unlock(&self->_lock);
    v7 = objc_msgSend(v4, "copy");
    v8 = (void *)v7;
    if (v7)
      v9 = (void *)v7;
    else
      v9 = (void *)MEMORY[0x1E0C9AA70];
    __notifyUpdatedTXTRecord(self, v9);

  }
}

- (void)removeAllTXTRecordObjects
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (-[NSMutableDictionary count](self->_TXTRecord, "count"))
  {
    -[NSMutableDictionary removeAllObjects](self->_TXTRecord, "removeAllObjects");
    os_unfair_lock_unlock(p_lock);
    __notifyUpdatedTXTRecord(self, MEMORY[0x1E0C9AA70]);
  }
  else
  {
    os_unfair_lock_unlock(p_lock);
  }
}

- (void)updateTXTRecordWithData:(id)a3
{
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a3;
  if (v6
    && (objc_msgSend(MEMORY[0x1E0C92C38], "dictionaryFromTXTRecordData:", v6),
        (v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v5 = (void *)v4;
    -[HMFNetService setTXTRecord:](self, "setTXTRecord:", v4);

  }
  else
  {
    -[HMFNetService removeAllTXTRecordObjects](self, "removeAllTXTRecordObjects");
  }

}

- (id)bestAddress
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[HMFNetService hostName](self, "hostName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[HMFNetService addresses](self, "addresses");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (void)resolveWithTimeout:(double)a3 completionHandler:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  double v11;

  v6 = a4;
  -[HMFNetService clientQueue](self, "clientQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__HMFNetService_resolveWithTimeout_completionHandler___block_invoke;
  block[3] = &unk_1E3B38268;
  block[4] = self;
  v10 = v6;
  v11 = a3;
  v8 = v6;
  dispatch_async(v7, block);

}

void __54__HMFNetService_resolveWithTimeout_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "resolveState") == 1
    && (objc_msgSend(*(id *)(a1 + 32), "bestAddress"), (v2 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v3 = (void *)v2;
    v4 = (void *)MEMORY[0x1A1AC355C]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier(v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543618;
      v10 = v7;
      v11 = 2112;
      v12 = v3;
      _os_log_impl(&dword_19B546000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Skipping resolving service, already have a cached address: %@", (uint8_t *)&v9, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    v8 = *(_QWORD *)(a1 + 40);
    if (v8)
      (*(void (**)(uint64_t, void *, _QWORD))(v8 + 16))(v8, v3, 0);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_reallyResolveWithTimeout:completionHandler:", *(_QWORD *)(a1 + 40), *(double *)(a1 + 48));
  }
}

- (void)confirmWithTimeout:(double)a3 completionHandler:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  double v11;

  v6 = a4;
  -[HMFNetService clientQueue](self, "clientQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__HMFNetService_confirmWithTimeout_completionHandler___block_invoke;
  block[3] = &unk_1E3B38268;
  block[4] = self;
  v10 = v6;
  v11 = a3;
  v8 = v6;
  dispatch_async(v7, block);

}

void __54__HMFNetService_confirmWithTimeout_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  double v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "resolveRunningState") == 1 && objc_msgSend(*(id *)(a1 + 32), "resolveState") == 1)
  {
    v2 = (void *)MEMORY[0x1A1AC355C]();
    v3 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier(v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v12 = v5;
      _os_log_impl(&dword_19B546000, v4, OS_LOG_TYPE_DEBUG, "%{public}@Skipping resolving service, still running and already resolved", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v2);
    v6 = *(_QWORD *)(a1 + 40);
    if (v6)
      (*(void (**)(uint64_t, _QWORD))(v6 + 16))(v6, 0);
  }
  else
  {
    v7 = *(double *)(a1 + 48);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __54__HMFNetService_confirmWithTimeout_completionHandler___block_invoke_35;
    v9[3] = &unk_1E3B398E0;
    v8 = *(void **)(a1 + 32);
    v10 = *(id *)(a1 + 40);
    objc_msgSend(v8, "_reallyResolveWithTimeout:completionHandler:", v9, v7);

  }
}

uint64_t __54__HMFNetService_confirmWithTimeout_completionHandler___block_invoke_35(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  return result;
}

- (void)_reallyResolveWithTimeout:(double)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HMFNetService *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (v6)
  {
    -[HMFNetService resolveBlocks](self, "resolveBlocks");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "copy");
    v9 = (void *)MEMORY[0x1A1AC373C]();
    objc_msgSend(v7, "addObject:", v9);

  }
  if (-[HMFNetService resolveRunningState](self, "resolveRunningState") != 1)
  {
    v10 = (void *)MEMORY[0x1A1AC355C]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier(v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543362;
      v18 = v13;
      _os_log_impl(&dword_19B546000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Starting to resolve service", (uint8_t *)&v17, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
    -[HMFNetService setResolveRunningState:](v11, "setResolveRunningState:", 1);
    -[HMFNetService internal](v11, "internal");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    v16 = 15.0;
    if (a3 > 0.0)
      v16 = a3;
    objc_msgSend(v14, "resolveWithTimeout:", v16);

  }
}

+ (id)logCategory
{
  if (_MergedGlobals_3_20 != -1)
    dispatch_once(&_MergedGlobals_3_20, &__block_literal_global_52);
  return (id)qword_1ED013058;
}

void __28__HMFNetService_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle(CFSTR("Networking.Service"), CFSTR("com.apple.HMFoundation"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED013058;
  qword_1ED013058 = v0;

}

- (void)netServiceWillResolve:(id)a3
{
  id v4;
  void *v5;
  HMFNetService *v6;
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
    _os_log_impl(&dword_19B546000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Net service will resolve", (uint8_t *)&v9, 0xCu);

  }
  objc_autoreleasePoolPop(v5);

}

- (void)netServiceDidResolveAddress:(id)a3
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
  v7[2] = __45__HMFNetService_netServiceDidResolveAddress___block_invoke;
  v7[3] = &unk_1E3B37CA8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __45__HMFNetService_netServiceDidResolveAddress___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  HMFNetAddress *v7;
  void *v8;
  HMFNetAddress *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  HMFNetAddress *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint8_t v36[128];
  uint8_t buf[4];
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1A1AC355C]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v38 = v5;
    _os_log_impl(&dword_19B546000, v4, OS_LOG_TYPE_DEBUG, "%{public}@Net service resolved", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "setResolveState:", 1);
  v6 = objc_msgSend(*(id *)(a1 + 40), "port");
  if (v6 != objc_msgSend(*(id *)(a1 + 32), "port"))
    __HMFNetServiceUpdatePort(*(void **)(a1 + 32), v6);
  v7 = [HMFNetAddress alloc];
  objc_msgSend(*(id *)(a1 + 40), "hostName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HMFNetAddress initWithHostname:](v7, "initWithHostname:", v8);

  objc_msgSend(*(id *)(a1 + 32), "setHostname:", v9);
  objc_msgSend(*(id *)(a1 + 40), "addresses");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v10, "count") + 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v9)
    objc_msgSend(v11, "addObject:", v9);
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v13 = v10;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v32;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v32 != v16)
          objc_enumerationMutation(v13);
        v18 = -[HMFNetAddress initWithSocketAddress:]([HMFNetAddress alloc], "initWithSocketAddress:", objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v31 + 1) + 8 * v17)), "bytes"));
        if (v18)
          objc_msgSend(v12, "addObject:", v18);

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v15);
  }

  objc_msgSend(*(id *)(a1 + 32), "setAddresses:", v12);
  objc_msgSend(*(id *)(a1 + 32), "setResolved:", 1);
  if (objc_msgSend(v12, "count"))
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "resolveBlocks", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v28;
      do
      {
        v23 = 0;
        do
        {
          if (*(_QWORD *)v28 != v22)
            objc_enumerationMutation(v19);
          v24 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v23);
          if (v9)
          {
            (*(void (**)(_QWORD, HMFNetAddress *, _QWORD))(v24 + 16))(*(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v23), v9, 0);
          }
          else
          {
            objc_msgSend(v12, "firstObject");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            (*(void (**)(uint64_t, void *, _QWORD))(v24 + 16))(v24, v25, 0);

          }
          ++v23;
        }
        while (v21 != v23);
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
      }
      while (v21);
    }

    objc_msgSend(*(id *)(a1 + 32), "resolveBlocks");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "removeAllObjects");

  }
}

- (void)netService:(id)a3 didNotResolve:(id)a4
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
  v8[2] = __42__HMFNetService_netService_didNotResolve___block_invoke;
  v8[3] = &unk_1E3B37CA8;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, v8);

}

void __42__HMFNetService_netService_didNotResolve___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1A1AC355C]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v23 = v5;
    v24 = 2112;
    v25 = v6;
    _os_log_impl(&dword_19B546000, v4, OS_LOG_TYPE_DEBUG, "%{public}@Net service failed to resolve with error: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "setResolveState:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setResolveRunningState:", 0);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "resolveBlocks", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v11);
        v13 = (void *)MEMORY[0x1E0CB35C8];
        objc_msgSend((id)objc_opt_class(), "errorFromNetServiceErrorDict:", *(_QWORD *)(a1 + 40));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "hmfErrorWithCode:reason:suggestion:underlyingError:", 2, CFSTR("Failed to resolve."), 0, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        (*(void (**)(uint64_t, _QWORD, void *))(v12 + 16))(v12, 0, v15);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

  objc_msgSend(*(id *)(a1 + 32), "resolveBlocks");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "removeAllObjects");

}

- (void)netServiceDidStop:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HMFNetService clientQueue](self, "clientQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__HMFNetService_netServiceDidStop___block_invoke;
  block[3] = &unk_1E3B37AF8;
  block[4] = self;
  dispatch_async(v4, block);

}

void __35__HMFNetService_netServiceDidStop___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1A1AC355C]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v20 = v5;
    _os_log_impl(&dword_19B546000, v4, OS_LOG_TYPE_DEBUG, "%{public}@Net service stopped resolving", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "setResolveRunningState:", 0);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "resolveBlocks", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10);
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:reason:", 12, CFSTR("Net service stopped resolving."));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, _QWORD, void *))(v11 + 16))(v11, 0, v12);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  objc_msgSend(*(id *)(a1 + 32), "resolveBlocks");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removeAllObjects");

}

- (void)netService:(id)a3 didUpdateTXTRecordData:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMFNetService *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1A1AC355C]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v11;
    v14 = 2112;
    v15 = v7;
    _os_log_impl(&dword_19B546000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Net service TXT record updated: %@", (uint8_t *)&v12, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  -[HMFNetService updateTXTRecordWithData:](v9, "updateTXTRecordWithData:", v7);

}

- (NSNetService)internal
{
  return self->_internal;
}

- (HMFNetServiceDelegate)delegate
{
  return (HMFNetServiceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)type
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)domain
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (NSMutableArray)resolveBlocks
{
  return self->_resolveBlocks;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resolveBlocks, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_hostName, 0);
  objc_storeStrong((id *)&self->_TXTRecord, 0);
  objc_storeStrong((id *)&self->_addresses, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_internal, 0);
}

@end
