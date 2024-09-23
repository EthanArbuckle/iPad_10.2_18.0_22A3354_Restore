@implementation __HMFMessageHandler

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_name, "hash");
  return -[NSUUID hash](self->_target, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  __HMFMessageHandler *v4;
  __HMFMessageHandler *v5;
  unint64_t *v6;
  unint64_t v7;
  unint64_t v8;
  BOOL v9;
  BOOL v11;

  v4 = (__HMFMessageHandler *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    if (v6
      && -[NSString isEqualToString:](self->_name, "isEqualToString:", v6[2])
      && -[NSUUID isEqual:](self->_target, "isEqual:", v6[3]))
    {
      v7 = atomic_load((unint64_t *)&self->_receiver);
      v8 = atomic_load(v6 + 1);
      if (v7)
        v9 = v8 == 0;
      else
        v9 = 1;
      v11 = !v9 && v7 == v8;
    }
    else
    {
      v11 = 0;
    }

  }
  return v11;
}

- (HMFMessageReceiver)receiver
{
  return (HMFMessageReceiver *)objc_loadWeakRetained((id *)&self->_receiver);
}

- (OS_dispatch_queue)queue
{
  void *v2;
  void *v3;

  -[__HMFMessageHandler receiver](self, "receiver");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v2, "messageReceiveQueue");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (OS_dispatch_queue *)v3;
}

- (NSArray)policies
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSUUID)target
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (__HMFMessageHandler)initWithReceiver:(id)a3 targetUUID:(id)a4 name:(id)a5 policies:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  __HMFMessageHandler *v14;
  __HMFMessageHandler *v15;
  uint64_t v16;
  NSString *name;
  uint64_t v18;
  NSUUID *target;
  void *v20;
  uint64_t v21;
  NSArray *policies;
  __HMFMessageHandler *v23;
  __HMFMessageHandler *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  objc_super v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!v11)
  {
    objc_msgSend(v10, "messageTargetUUID");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (!v12)
    _HMFPreconditionFailure(CFSTR("name"));
  if (!v13)
    _HMFPreconditionFailure(CFSTR("policies"));
  if (v10 && v11)
  {
    v29.receiver = self;
    v29.super_class = (Class)__HMFMessageHandler;
    v14 = -[__HMFMessageHandler init](&v29, sel_init);
    v15 = v14;
    if (v14)
    {
      objc_storeWeak((id *)&v14->_receiver, v10);
      +[HMFObjectCacheNSString hmf_cachedInstanceForString:](HMFObjectCacheNSString, "hmf_cachedInstanceForString:", v12);
      v16 = objc_claimAutoreleasedReturnValue();
      name = v15->_name;
      v15->_name = (NSString *)v16;

      +[HMFObjectCacheNSUUID hmf_cachedInstanceForNSUUID:](HMFObjectCacheNSUUID, "hmf_cachedInstanceForNSUUID:", v11);
      v18 = objc_claimAutoreleasedReturnValue();
      target = v15->_target;
      v15->_target = (NSUUID *)v18;

      -[__HMFMessageHandler _canonicalizePolicyList:](v15, "_canonicalizePolicyList:", v13);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMFObjectCacheNSArray hmf_cachedPolicyLists:](HMFObjectCacheNSArray, "hmf_cachedPolicyLists:", v20);
      v21 = objc_claimAutoreleasedReturnValue();
      policies = v15->_policies;
      v15->_policies = (NSArray *)v21;

    }
    v23 = v15;
    v24 = v23;
  }
  else
  {
    v25 = (void *)MEMORY[0x1A1AC355C]();
    v23 = self;
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier(v23);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v31 = v27;
      v32 = 2112;
      v33 = v10;
      _os_log_impl(&dword_19B546000, v26, OS_LOG_TYPE_ERROR, "%{public}@Invalid receiver: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v25);
    v24 = 0;
  }

  return v24;
}

+ (id)handlerWithReceiver:(id)a3 targetUUID:(id)a4 name:(id)a5 policies:(id)a6 selector:(SEL)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  char v15;
  _BOOL8 v16;
  __objc2_class **v17;
  char *v18;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v20 = (void *)MEMORY[0x1E0C99DA0];
    v21 = *MEMORY[0x1E0C99778];
    v22 = (void *)MEMORY[0x1E0CB3940];
    HMFMethodDescription(v11, a7);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringWithFormat:", CFSTR("Receiver does not respond to %@"), v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "exceptionWithName:reason:userInfo:", v21, v24, 0);
    v25 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v25);
  }
  v15 = objc_opt_respondsToSelector();
  v16 = (v15 & 1) == 0;
  v17 = off_1E3B35BF0;
  if ((v15 & 1) == 0)
    v17 = &off_1E3B35C08;
  v18 = (char *)objc_msgSend(objc_alloc(*v17), "initWithReceiver:targetUUID:name:policies:", v11, v12, v13, v14);
  *(_QWORD *)&v18[OBJC_IVAR_____HMFDispatchExecutorMessageHandler__selector[v16]] = a7;

  return v18;
}

- (BOOL)invokeWithMessage:(id)a3
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
  objc_msgSend(v7, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v9, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v10);
}

+ (id)handlerWithReceiver:(id)a3 name:(id)a4 policies:(id)a5 handler:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  __HMFBlockMessageHandler *v13;
  uint64_t v14;
  id handler;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = -[__HMFMessageHandler initWithReceiver:targetUUID:name:policies:]([__HMFBlockMessageHandler alloc], "initWithReceiver:targetUUID:name:policies:", v12, 0, v11, v10);

  v14 = objc_msgSend(v9, "copy");
  handler = v13->_handler;
  v13->_handler = (id)v14;

  return v13;
}

- (NSString)shortDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "shortDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[__HMFMessageHandler name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[__HMFMessageHandler target](self, "target");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@(%@)"), v4, v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (NSArray)attributeDescriptions
{
  HMFAttributeDescription *v3;
  void *v4;
  HMFAttributeDescription *v5;
  HMFAttributeDescription *v6;
  void *v7;
  void *v8;
  HMFAttributeDescription *v9;
  HMFAttributeDescription *v10;
  void *v11;
  HMFAttributeDescription *v12;
  HMFAttributeDescription *v13;
  void *v14;
  HMFAttributeDescription *v15;
  void *v16;
  _QWORD v18[5];

  v18[4] = *MEMORY[0x1E0C80C00];
  v3 = [HMFAttributeDescription alloc];
  -[__HMFMessageHandler name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HMFAttributeDescription initWithName:value:](v3, "initWithName:value:", CFSTR("Name"), v4);
  v18[0] = v5;
  v6 = [HMFAttributeDescription alloc];
  -[__HMFMessageHandler target](self, "target");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HMFAttributeDescription initWithName:value:](v6, "initWithName:value:", CFSTR("Target"), v8);
  v18[1] = v9;
  v10 = [HMFAttributeDescription alloc];
  -[__HMFMessageHandler policies](self, "policies");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[HMFAttributeDescription initWithName:value:](v10, "initWithName:value:", CFSTR("Policies"), v11);
  v18[2] = v12;
  v13 = [HMFAttributeDescription alloc];
  -[__HMFMessageHandler receiver](self, "receiver");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[HMFAttributeDescription initWithName:value:options:formatter:](v13, "initWithName:value:options:formatter:", CFSTR("Receiver"), v14, 1, 0);
  v18[3] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v16;
}

- (BOOL)hasReceiver:(id)a3
{
  unint64_t *p_receiver;
  id v4;
  id v5;

  p_receiver = (unint64_t *)&self->_receiver;
  v4 = a3;
  v5 = (id)atomic_load(p_receiver);
  LOBYTE(p_receiver) = v5 == v4;

  return (char)p_receiver;
}

- (id)_canonicalizePolicyList:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = a3;
  v4 = (void *)MEMORY[0x1A1AC355C]();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __47____HMFMessageHandler__canonicalizePolicyList___block_invoke;
  v9[3] = &unk_1E3B39378;
  v10 = v5;
  v6 = v5;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v9);
  objc_msgSend(v6, "sortedArrayUsingComparator:", &__block_literal_global_37);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v4);
  return v7;
}

+ (id)logCategory
{
  if (qword_1ED012E10 != -1)
    dispatch_once(&qword_1ED012E10, &__block_literal_global_44);
  return (id)qword_1ED012E18;
}

- (id)logIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[__HMFMessageHandler name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[__HMFMessageHandler target](self, "target");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@(%@)"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_policies, 0);
  objc_storeStrong((id *)&self->_target, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_destroyWeak((id *)&self->_receiver);
}

@end
