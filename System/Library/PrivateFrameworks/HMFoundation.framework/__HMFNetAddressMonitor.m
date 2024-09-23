@implementation __HMFNetAddressMonitor

- (unint64_t)reachabilityPath
{
  os_unfair_lock_s *p_lock;
  unsigned int currentNetworkFlags;
  uint64_t v5;
  unint64_t v6;

  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  currentNetworkFlags = self->_currentNetworkFlags;
  v5 = 2;
  if ((currentNetworkFlags & 0x40000) != 0)
    v5 = 3;
  if ((currentNetworkFlags & 2) != 0)
    v6 = v5;
  else
    v6 = 1;
  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (__HMFNetAddressMonitor)initWithNetService:(id)a3
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

- (__HMFNetAddressMonitor)init
{
  return -[__HMFNetAddressMonitor initWithNetAddress:](self, "initWithNetAddress:", 0);
}

- (__HMFNetAddressMonitor)initWithNetAddress:(id)a3
{
  void *v3;
  id v6;
  __HMFNetAddressMonitor *v7;
  __HMFNetAddressMonitor *v8;
  const char *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *queue;
  const __CFAllocator *v13;
  id v14;
  HMFWeakObject *v15;
  int v16;
  void *v17;
  __HMFNetAddressMonitor *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  char v23;
  SCNetworkReachabilityRef v24;
  void *v25;
  __HMFNetAddressMonitor *v26;
  NSObject *v27;
  id v28;
  void *v29;
  __CFString *v30;
  void *v31;
  __HMFNetAddressMonitor *v32;
  SCNetworkReachabilityFlags flags;
  objc_super v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  SCNetworkReachabilityContext context;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v35.receiver = self;
  v35.super_class = (Class)__HMFNetAddressMonitor;
  v7 = -[HMFNetMonitor initWithNetAddress:](&v35, sel_initWithNetAddress_, v6);
  v8 = v7;
  if (!v7)
  {
LABEL_16:
    v32 = v8;
    goto LABEL_22;
  }
  v9 = (const char *)HMFDispatchQueueName(v7, 0);
  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = dispatch_queue_create(v9, v10);
  queue = v8->_queue;
  v8->_queue = (OS_dispatch_queue *)v11;

  objc_storeStrong((id *)&v8->_netAddress, a3);
  if (v6)
  {
    v13 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    objc_msgSend(v6, "addressString");
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8->_networkReachabilityRef = SCNetworkReachabilityCreateWithName(v13, (const char *)objc_msgSend(v14, "UTF8String"));

    if (v8->_networkReachabilityRef)
    {
LABEL_4:
      memset(&context, 0, sizeof(context));
      v15 = -[HMFWeakObject initWithWeakObject:]([HMFWeakObject alloc], "initWithWeakObject:", v8);
      context.info = v15;
      context.retain = (const void *(__cdecl *)(const void *))MEMORY[0x1E0C98BD0];
      context.release = (void (__cdecl *)(const void *))MEMORY[0x1E0C98BC0];
      SCNetworkReachabilitySetCallback(v8->_networkReachabilityRef, (SCNetworkReachabilityCallBack)_networkReachabilityChangeCallback, &context);
      SCNetworkReachabilitySetDispatchQueue(v8->_networkReachabilityRef, (dispatch_queue_t)v8->_queue);
      flags = 0;
      v16 = SCNetworkReachabilityGetFlags(v8->_networkReachabilityRef, &flags);
      v17 = (void *)MEMORY[0x1A1AC355C]();
      v18 = v8;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = v19;
      if (v16)
      {
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier(v18);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          __SCNetworkReachabilityFlagsToString(flags);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v37 = v21;
          v38 = 2112;
          v39 = v22;
          _os_log_impl(&dword_19B546000, v20, OS_LOG_TYPE_INFO, "%{public}@Initial flags: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v17);
        v23 = flags;
        v18->_currentNetworkFlags = flags;
        v18->super._reachable = (v23 & 2) != 0;
      }
      else
      {
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier(v18);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v37 = v31;
          _os_log_impl(&dword_19B546000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to get initial reachability", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v17);
      }

      goto LABEL_16;
    }
  }
  else
  {
    *(_OWORD *)&context.version = xmmword_19B5C6A90;
    v24 = SCNetworkReachabilityCreateWithAddress(0, (const sockaddr *)&context);
    v8->_networkReachabilityRef = v24;
    if (v24)
      goto LABEL_4;
  }
  v25 = (void *)MEMORY[0x1A1AC355C]();
  v26 = v8;
  HMFGetOSLogHandle();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier(v26);
    v28 = (id)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v29 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v6, "addressString");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "stringWithFormat:", CFSTR("for %@"), v3);
      v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v30 = &stru_1E3B39EC0;
    }
    LODWORD(context.version) = 138543618;
    *(CFIndex *)((char *)&context.version + 4) = (CFIndex)v28;
    WORD2(context.info) = 2112;
    *(void **)((char *)&context.info + 6) = v30;
    _os_log_impl(&dword_19B546000, v27, OS_LOG_TYPE_ERROR, "%{public}@Failed to create network reachability monitor%@.", (uint8_t *)&context, 0x16u);
    if (v6)
    {

    }
  }

  objc_autoreleasePoolPop(v25);
  v32 = 0;
LABEL_22:

  return v32;
}

- (void)dealloc
{
  __SCNetworkReachability *networkReachabilityRef;
  objc_super v4;

  networkReachabilityRef = self->_networkReachabilityRef;
  if (networkReachabilityRef)
  {
    SCNetworkReachabilitySetCallback(networkReachabilityRef, 0, 0);
    SCNetworkReachabilitySetDispatchQueue(self->_networkReachabilityRef, 0);
    CFRelease(self->_networkReachabilityRef);
    self->_networkReachabilityRef = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)__HMFNetAddressMonitor;
  -[__HMFNetAddressMonitor dealloc](&v4, sel_dealloc);
}

- (id)shortDescription
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
  -[__HMFNetAddressMonitor netAddress](self, "netAddress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[__HMFNetAddressMonitor netAddress](self, "netAddress");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addressString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ '%@'"), v4, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ '%@'"), v4, CFSTR("localhost"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)attributeDescriptions
{
  HMFAttributeDescription *v3;
  void *v4;
  HMFAttributeDescription *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = [HMFAttributeDescription alloc];
  -[__HMFNetAddressMonitor netAddress](self, "netAddress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HMFAttributeDescription initWithName:value:](v3, "initWithName:value:", CFSTR("Address"), v4);
  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)handleNetworkReachabilityChange:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  __HMFNetAddressMonitor *v6;
  NSObject *v7;
  void *v8;
  __CFString *v9;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;
  void *v13;
  __HMFNetAddressMonitor *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  const __CFString *v22;
  uint64_t v23;

  v3 = *(_QWORD *)&a3;
  v23 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1A1AC355C](self, a2);
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    __SCNetworkReachabilityFlagsToString(v3);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v19 = 138543618;
    v20 = (uint64_t)v8;
    v21 = 2112;
    v22 = v9;
    _os_log_impl(&dword_19B546000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Received notification of updated flags: %@", (uint8_t *)&v19, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  v10 = -[__HMFNetAddressMonitor currentNetworkFlags](v6, "currentNetworkFlags");
  v11 = v3 & 2;
  v12 = -[__HMFNetAddressMonitor setCurrentNetworkFlags:](v6, "setCurrentNetworkFlags:", v3);
  if (((v10 >> 1) & 1) != v11 >> 1)
  {
    v13 = (void *)MEMORY[0x1A1AC355C](v12);
    v14 = v6;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier(v14);
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = (void *)v16;
      v18 = CFSTR("unreachable");
      if (v11)
        v18 = CFSTR("reachable");
      v19 = 138543618;
      v20 = v16;
      v21 = 2112;
      v22 = v18;
      _os_log_impl(&dword_19B546000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@Updating reachability to: %@", (uint8_t *)&v19, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
    -[HMFNetMonitor setReachable:](v14, "setReachable:", v11 != 0);
  }
}

- (id)logIdentifier
{
  void *v3;
  void *v4;
  __CFString *v5;

  -[__HMFNetAddressMonitor netAddress](self, "netAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[__HMFNetAddressMonitor netAddress](self, "netAddress");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addressString");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = CFSTR("localhost");
  }

  return v5;
}

- (id)netAddress
{
  return self->_netAddress;
}

- (__SCNetworkReachability)networkReachabilityRef
{
  return self->_networkReachabilityRef;
}

- (unsigned)currentNetworkFlags
{
  return self->_currentNetworkFlags;
}

- (void)setCurrentNetworkFlags:(unsigned int)a3
{
  self->_currentNetworkFlags = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_netAddress, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
