@implementation HMFKeyValueBlockObserver

- (HMFKeyValueBlockObserver)init
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

- (HMFKeyValueBlockObserver)initWithKeyPath:(id)a3 object:(id)a4
{
  return -[HMFKeyValueBlockObserver initWithKeyPath:object:options:](self, "initWithKeyPath:object:options:", a3, a4, 0);
}

- (HMFKeyValueBlockObserver)initWithKeyPath:(id)a3 object:(id)a4 options:(unint64_t)a5
{
  id v8;
  id v9;
  id v10;
  int v11;
  void *v12;
  id v13;
  HMFKeyValueBlockObserver *v14;
  uint64_t v15;
  NSString *keyPath;
  id v18;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  if (!v8)
    _HMFPreconditionFailure(CFSTR("keyPath"));
  if (!v9)
    _HMFPreconditionFailure(CFSTR("object"));
  v10 = v9;
  objc_opt_class();
  v11 = objc_opt_isKindOfClass() & 1;
  if (v11)
    v12 = v10;
  else
    v12 = 0;
  v13 = v12;

  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("The observed object must be an NSObject."), 0);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v18);
  }
  v19.receiver = self;
  v19.super_class = (Class)HMFKeyValueBlockObserver;
  v14 = -[HMFKeyValueBlockObserver init](&v19, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v8, "copy");
    keyPath = v14->_keyPath;
    v14->_keyPath = (NSString *)v15;

    objc_storeWeak(&v14->_observedObject, v10);
    v14->_options = a5;
    v14->_valid = 1;
  }

  return v14;
}

- (void)dealloc
{
  void *v3;
  HMFKeyValueBlockObserver *v4;
  NSObject *v5;
  void *v6;
  objc_super v7;
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1A1AC355C](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v9 = v6;
    _os_log_impl(&dword_19B546000, v5, OS_LOG_TYPE_DEBUG, "%{public}@Deallocating", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMFKeyValueBlockObserver __invalidate](v4, "__invalidate");
  v7.receiver = v4;
  v7.super_class = (Class)HMFKeyValueBlockObserver;
  -[HMFKeyValueBlockObserver dealloc](&v7, sel_dealloc);
}

- (void)invalidate
{
  void *v3;
  HMFKeyValueBlockObserver *v4;
  NSObject *v5;
  void *v6;
  BOOL v7;
  void *v8;
  HMFKeyValueBlockObserver *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1A1AC355C](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543362;
    v13 = v6;
    _os_log_impl(&dword_19B546000, v5, OS_LOG_TYPE_INFO, "%{public}@Invalidating", (uint8_t *)&v12, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  os_unfair_lock_lock_with_options();
  v7 = -[HMFKeyValueBlockObserver __invalidate](v4, "__invalidate");
  os_unfair_lock_unlock(&v4->_lock);
  if (v7)
  {
    v8 = (void *)MEMORY[0x1A1AC355C]();
    v9 = v4;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier(v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v11;
      _os_log_impl(&dword_19B546000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Invalidated", (uint8_t *)&v12, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
  }
}

- (BOOL)__invalidate
{
  _BOOL4 valid;
  id handler;
  id WeakRetained;

  valid = self->_valid;
  if (self->_valid)
  {
    handler = self->_handler;
    self->_handler = 0;

    self->_valid = 0;
  }
  if (self->_observing)
  {
    self->_observing = 0;
    WeakRetained = objc_loadWeakRetained(&self->_observedObject);
    objc_msgSend(WeakRetained, "removeObserver:forKeyPath:context:", self, self->_keyPath, HMFKeyValueBlockObserverContext);

  }
  return valid;
}

- (id)handler
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)MEMORY[0x1A1AC373C](self->_handler);
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setHandler:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;
  id handler;
  BOOL v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  HMFKeyValueBlockObserver *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  HMFKeyValueBlockObserver *v18;
  NSObject *v19;
  void *v20;
  id v21;
  int v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_lock_with_options();
  v5 = v4 == 0;
  if (v4 && !self->_valid)
  {
    os_unfair_lock_unlock(&self->_lock);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Cannot set a handler on an invalidated observer."), 0);
    v21 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v21);
  }
  if (self->_handler != v4)
  {
    v6 = (void *)MEMORY[0x1A1AC373C](v4);
    handler = self->_handler;
    self->_handler = v6;

    if (v4)
    {
      if (!self->_observing)
      {
        v8 = 1;
LABEL_8:
        v9 = v4 != 0;
        self->_observing = v8;
        goto LABEL_10;
      }
    }
    else
    {
      v8 = 0;
      if (self->_observing)
        goto LABEL_8;
    }
  }
  v5 = 0;
  v9 = 0;
LABEL_10:
  os_unfair_lock_unlock(&self->_lock);
  -[HMFKeyValueBlockObserver observedObject](self, "observedObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    if (v9)
    {
      v11 = (void *)MEMORY[0x1A1AC355C]();
      v12 = self;
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier(v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138543362;
        v23 = v14;
        _os_log_impl(&dword_19B546000, v13, OS_LOG_TYPE_INFO, "%{public}@Registering", (uint8_t *)&v22, 0xCu);

      }
      objc_autoreleasePoolPop(v11);
      -[HMFKeyValueBlockObserver keyPath](v12, "keyPath");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[HMFKeyValueBlockObserver options](v12, "options");
      objc_msgSend(v10, "addObserver:forKeyPath:options:context:", v12, v15, v16, HMFKeyValueBlockObserverContext);
LABEL_19:

      goto LABEL_20;
    }
    if (v5)
    {
      v17 = (void *)MEMORY[0x1A1AC355C]();
      v18 = self;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier(v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138543362;
        v23 = v20;
        _os_log_impl(&dword_19B546000, v19, OS_LOG_TYPE_INFO, "%{public}@Unregistering", (uint8_t *)&v22, 0xCu);

      }
      objc_autoreleasePoolPop(v17);
      -[HMFKeyValueBlockObserver keyPath](v18, "keyPath");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "removeObserver:forKeyPath:context:", v18, v15, HMFKeyValueBlockObserverContext);
      goto LABEL_19;
    }
  }
LABEL_20:

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  HMFKeyValueBlockObserver *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  objc_super v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if ((void *)HMFKeyValueBlockObserverContext == a6)
  {
    v13 = (void *)MEMORY[0x1A1AC355C]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier(v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v21 = v16;
      v22 = 2112;
      v23 = v12;
      _os_log_impl(&dword_19B546000, v15, OS_LOG_TYPE_DEBUG, "%{public}@Received change: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
    if (objc_msgSend(v10, "isEqualToString:", v14->_keyPath))
    {
      -[HMFKeyValueBlockObserver handler](v14, "handler");
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = (void *)v17;
      if (v17)
        (*(void (**)(uint64_t, id, id))(v17 + 16))(v17, v11, v12);

    }
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)HMFKeyValueBlockObserver;
    -[HMFKeyValueBlockObserver observeValueForKeyPath:ofObject:change:context:](&v19, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

}

+ (id)logCategory
{
  if (_MergedGlobals_3_19 != -1)
    dispatch_once(&_MergedGlobals_3_19, &__block_literal_global_50);
  return (id)qword_1ED013048;
}

void __39__HMFKeyValueBlockObserver_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle(CFSTR("KVO.observer"), CFSTR("com.apple.HMFoundation"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED013048;
  qword_1ED013048 = v0;

}

- (id)logIdentifier
{
  return self->_keyPath;
}

- (NSString)keyPath
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (id)observedObject
{
  return objc_loadWeakRetained(&self->_observedObject);
}

- (unint64_t)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_observedObject);
  objc_storeStrong((id *)&self->_keyPath, 0);
  objc_storeStrong(&self->_handler, 0);
}

@end
