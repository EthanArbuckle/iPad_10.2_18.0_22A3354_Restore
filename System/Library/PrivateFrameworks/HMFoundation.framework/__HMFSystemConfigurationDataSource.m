@implementation __HMFSystemConfigurationDataSource

- (__HMFSystemConfigurationDataSource)init
{
  __HMFSystemConfigurationDataSource *v2;
  __HMFSystemConfigurationDataSource *v3;
  const char *v4;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *queue;
  __HMFSystemConfigurationDataSource *v8;
  __HMFSystemConfigurationDataSource *v9;
  SCDynamicStoreRef v10;
  const __SCDynamicStore *v11;
  CFMutableArrayRef Mutable;
  __CFArray *v13;
  CFStringRef HostNames;
  CFStringRef v15;
  NSObject *v16;
  int v17;
  void *v18;
  __HMFSystemConfigurationDataSource *v19;
  NSObject *v20;
  void *v21;
  const char *v22;
  void *v23;
  __HMFSystemConfigurationDataSource *v24;
  NSObject *v25;
  void *v26;
  __CFArray *v27;
  __HMFSystemConfigurationDataSource *v28;
  CFStringRef v29;
  NSString *name;
  objc_super v32;
  uint8_t buf[4];
  void *v34;
  SCDynamicStoreContext context;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v32.receiver = self;
  v32.super_class = (Class)__HMFSystemConfigurationDataSource;
  v2 = -[__HMFSystemConfigurationDataSource init](&v32, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = (const char *)HMFDispatchQueueName(v2, 0);
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create(v4, v5);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v6;

    v8 = v3;
    memset(&context, 0, sizeof(context));
    v9 = v8;
    context.info = v9;
    v10 = SCDynamicStoreCreate(0, CFSTR("HostNameChange"), (SCDynamicStoreCallBack)__updateName, &context);
    if (!v10)
    {
      v23 = (void *)MEMORY[0x1A1AC355C]();
      v24 = v9;
      HMFGetOSLogHandle();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier(v24);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v34 = v26;
        _os_log_impl(&dword_19B546000, v25, OS_LOG_TYPE_ERROR, "%{public}@Failed to create store", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v23);
      goto LABEL_20;
    }
    v11 = v10;
    v9->_store = (__SCDynamicStore *)CFRetain(v10);
    Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
    if (Mutable)
    {
      v13 = Mutable;
      HostNames = SCDynamicStoreKeyCreateHostNames(0);
      if (HostNames)
      {
        v15 = HostNames;
        CFArrayAppendValue(v13, HostNames);
        if (SCDynamicStoreSetNotificationKeys(v11, v13, 0))
        {
          -[__HMFSystemConfigurationDataSource queue](v9, "queue");
          v16 = objc_claimAutoreleasedReturnValue();
          v17 = SCDynamicStoreSetDispatchQueue(v11, v16);

          if (v17)
          {
LABEL_18:
            CFRelease(v11);
            CFRelease(v13);
            v27 = (__CFArray *)v15;
            goto LABEL_19;
          }
          v18 = (void *)MEMORY[0x1A1AC355C]();
          v19 = v9;
          HMFGetOSLogHandle();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier(v19);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(context.version) = 138543362;
            *(CFIndex *)((char *)&context.version + 4) = (CFIndex)v21;
            v22 = "%{public}@Failed to set DispatchQueue on DynamicStore";
LABEL_16:
            _os_log_impl(&dword_19B546000, v20, OS_LOG_TYPE_ERROR, v22, (uint8_t *)&context, 0xCu);

          }
        }
        else
        {
          v18 = (void *)MEMORY[0x1A1AC355C]();
          v28 = v9;
          HMFGetOSLogHandle();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier(v28);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(context.version) = 138543362;
            *(CFIndex *)((char *)&context.version + 4) = (CFIndex)v21;
            v22 = "%{public}@Failed to set Notification on DynamicStore";
            goto LABEL_16;
          }
        }

        objc_autoreleasePoolPop(v18);
        goto LABEL_18;
      }
      CFRelease(v11);
      v27 = v13;
    }
    else
    {
      v27 = v11;
    }
LABEL_19:
    CFRelease(v27);
LABEL_20:

    v29 = SCDynamicStoreCopyLocalHostName(0);
    name = v9->_name;
    v9->_name = &v29->isa;

  }
  return v3;
}

- (void)dealloc
{
  __SCDynamicStore *store;
  objc_super v4;

  store = self->_store;
  if (store)
    CFRelease(store);
  v4.receiver = self;
  v4.super_class = (Class)__HMFSystemConfigurationDataSource;
  -[__HMFSystemConfigurationDataSource dealloc](&v4, sel_dealloc);
}

- (NSString)name
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_name;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (HMFSystemInfoNameDataSourceDelegate)delegate
{
  return (HMFSystemInfoNameDataSourceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (__SCDynamicStore)store
{
  return self->_store;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
