@implementation IDSDependencyProvider

- (id)createServiceConnectionWithServiceName:(const char *)a3 invalidationHandler:(id)a4 terminationHandler:(id)a5 peerEventHandler:(id)a6 peerQueue:(id)a7
{
  void *v7;
  IDSXPCConnectionWrapper *v8;
  const char *v9;
  double v10;
  void *v11;

  v7 = (void *)IMXPCCreateServerConnection();
  v8 = [IDSXPCConnectionWrapper alloc];
  v11 = (void *)objc_msgSend_initWithConnection_(v8, v9, (uint64_t)v7, v10);

  return v11;
}

+ (id)sharedProvider
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_19B971C58;
  block[3] = &unk_1E3C1C798;
  block[4] = a1;
  if (qword_1ECDD4938 != -1)
    dispatch_once(&qword_1ECDD4938, block);
  return (id)qword_1ECDD4930;
}

- (id)registeredObjectForProtocol:(id)a3
{
  Protocol *v4;
  os_unfair_lock_s *p_lock;
  void *registeredAdapters;
  void *v7;
  const char *v8;
  double v9;

  v4 = (Protocol *)a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  registeredAdapters = self->_registeredAdapters;
  if (registeredAdapters)
  {
    NSStringFromProtocol(v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKey_(registeredAdapters, v8, (uint64_t)v7, v9);
    registeredAdapters = (void *)objc_claimAutoreleasedReturnValue();

  }
  os_unfair_lock_unlock(p_lock);

  return registeredAdapters;
}

+ (id)XPCAdapter
{
  double v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;
  id v9;
  void *v10;

  objc_msgSend_registeredObjectForProtocol_(a1, a2, (uint64_t)&unk_1EE4305E8, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v4;
  if (v4)
  {
    v9 = v4;
  }
  else
  {
    objc_msgSend_sharedProvider(a1, v5, v6, v7);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  return v10;
}

+ (id)registeredObjectForProtocol:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;
  void *v11;

  v4 = a3;
  objc_msgSend_sharedProvider(a1, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_registeredObjectForProtocol_(v8, v9, (uint64_t)v4, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_init
{
  id result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IDSDependencyProvider;
  result = -[IDSDependencyProvider init](&v3, sel_init);
  if (result)
    *((_DWORD *)result + 4) = 0;
  return result;
}

- (void)registerObject:(id)a3 forProtocol:(id)a4
{
  Protocol *v6;
  os_unfair_lock_s *p_lock;
  id v8;
  NSMutableDictionary *registeredAdapters;
  NSMutableDictionary *v10;
  NSMutableDictionary *v11;
  void *v12;
  const char *v13;
  double v14;
  Protocol *proto;

  v6 = (Protocol *)a4;
  if (a3 && v6)
  {
    proto = v6;
    p_lock = &self->_lock;
    v8 = a3;
    os_unfair_lock_lock(&self->_lock);
    registeredAdapters = self->_registeredAdapters;
    if (!registeredAdapters)
    {
      v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v11 = self->_registeredAdapters;
      self->_registeredAdapters = v10;

      registeredAdapters = self->_registeredAdapters;
    }
    NSStringFromProtocol(proto);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(registeredAdapters, v13, (uint64_t)v8, v14, v12);

    os_unfair_lock_unlock(p_lock);
    v6 = proto;
  }

}

+ (id)pushAdapter
{
  double v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;
  id v9;
  void *v10;

  objc_msgSend_registeredObjectForProtocol_(a1, a2, (uint64_t)&unk_1EE4306B0, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v4;
  if (v4)
  {
    v9 = v4;
  }
  else
  {
    objc_msgSend_sharedProvider(a1, v5, v6, v7);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  return v10;
}

+ (id)serviceLoader
{
  double v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;
  id v9;
  void *v10;

  objc_msgSend_registeredObjectForProtocol_(a1, a2, (uint64_t)&unk_1EE430830, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v4;
  if (v4)
  {
    v9 = v4;
  }
  else
  {
    objc_msgSend_sharedProvider(a1, v5, v6, v7);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  return v10;
}

+ (id)keychainAdapter
{
  double v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;
  id v9;
  void *v10;

  objc_msgSend_registeredObjectForProtocol_(a1, a2, (uint64_t)&unk_1EE4307B8, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v4;
  if (v4)
  {
    v9 = v4;
  }
  else
  {
    objc_msgSend_sharedProvider(a1, v5, v6, v7);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  return v10;
}

+ (id)systemMonitorAdapter
{
  double v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  double v6;
  void *v7;
  id v8;
  void *v9;

  objc_msgSend_registeredObjectForProtocol_(a1, a2, (uint64_t)&unk_1EE4397F0, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v3;
  if (v3)
  {
    v8 = v3;
  }
  else
  {
    objc_msgSend_sharedInstance(MEMORY[0x1E0D36AD0], v4, v5, v6);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  return v9;
}

+ (id)userDefaults
{
  double v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  double v6;
  void *v7;
  id v8;
  void *v9;

  objc_msgSend_registeredObjectForProtocol_(a1, a2, (uint64_t)&unk_1EE4363F0, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v3;
  if (v3)
  {
    v8 = v3;
  }
  else
  {
    objc_msgSend_sharedDefaults(MEMORY[0x1E0D36AF8], v4, v5, v6);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  return v9;
}

+ (void)registerObject:(id)a3 forProtocol:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  double v10;
  const char *v11;
  double v12;
  id v13;

  v6 = a4;
  v7 = a3;
  objc_msgSend_sharedProvider(a1, v8, v9, v10);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_registerObject_forProtocol_(v13, v11, (uint64_t)v7, v12, v6);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registeredAdapters, 0);
}

- (BOOL)setKeychainData:(id)a3 service:(id)a4 account:(id)a5 accessGroup:(id)a6 allowSync:(BOOL)a7 error:(int *)a8
{
  return IMSetKeychainData();
}

- (BOOL)getKeychainData:(id *)a3 service:(id)a4 account:(id)a5 accessGroup:(id)a6 error:(int *)a7
{
  return IMGetKeychainData();
}

- (BOOL)removeKeychainDataOnService:(id)a3 account:(id)a4 error:(int *)a5
{
  return IMRemoveKeychainData();
}

- (id)placeholderMachPort
{
  return *(id *)MEMORY[0x1A1AC7380]("APSConnectionOverrideNamedDelegatePort", CFSTR("ApplePushService"));
}

- (id)apsConnectionWithEnvironmentName:(id)a3 namedDelegatePort:(id)a4 enablePushDuringSleep:(BOOL)a5 queue:(id)a6
{
  id v8;
  id v9;
  id v10;
  id v11;
  const char *v12;
  double v13;
  void *v14;

  v8 = a6;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc((Class)CUTWeakLinkClass());
  v14 = (void *)objc_msgSend_initWithEnvironmentName_namedDelegatePort_queue_(v11, v12, (uint64_t)v10, v13, v9, v8);

  return v14;
}

- (id)createSim2HostServiceConnectionWithServiceName:(const char *)a3 invalidationHandler:(id)a4 terminationHandler:(id)a5 peerEventHandler:(id)a6 peerQueue:(id)a7
{
  void *v7;
  IDSXPCConnectionWrapper *v8;
  const char *v9;
  double v10;
  void *v11;

  v7 = (void *)IMXPCCreateSim2HostServerConnection();
  v8 = [IDSXPCConnectionWrapper alloc];
  v11 = (void *)objc_msgSend_initWithConnection_(v8, v9, (uint64_t)v7, v10);

  return v11;
}

@end
