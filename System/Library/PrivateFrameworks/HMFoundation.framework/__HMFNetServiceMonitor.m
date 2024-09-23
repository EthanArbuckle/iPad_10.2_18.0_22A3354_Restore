@implementation __HMFNetServiceMonitor

- (__HMFNetServiceMonitor)initWithNetAddress:(id)a3
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

- (__HMFNetServiceMonitor)initWithNetService:(id)a3
{
  id v5;
  __HMFNetServiceMonitor *v6;
  __HMFNetServiceMonitor *v7;
  void *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)__HMFNetServiceMonitor;
  v6 = -[HMFNetMonitor initWithNetService:](&v10, sel_initWithNetService_, v5);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_service, a3);
    NSStringFromSelector(sel_isPublishing);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:forKeyPath:options:context:", v7, v8, 3, 0);

    v7->super._reachable = objc_msgSend(v5, "isPublishing");
  }

  return v7;
}

- (void)dealloc
{
  HMFNetService *service;
  void *v4;
  objc_super v5;

  service = self->_service;
  NSStringFromSelector(sel_isPublishing);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMFNetService removeObserver:forKeyPath:](service, "removeObserver:forKeyPath:", self, v4);

  v5.receiver = self;
  v5.super_class = (Class)__HMFNetServiceMonitor;
  -[__HMFNetServiceMonitor dealloc](&v5, sel_dealloc);
}

- (id)netAddress
{
  void *v2;
  void *v3;

  -[HMFNetService addresses](self->_service, "addresses");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)reachabilityPath
{
  if (-[HMFNetMonitor isReachable](self, "isReachable"))
    return 2;
  else
    return 1;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  id v19;

  v9 = a5;
  if (self->_service == a4)
  {
    v19 = v9;
    v10 = a3;
    NSStringFromSelector(sel_isPublishing);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqualToString:", v11);

    v9 = v19;
    if (v12)
    {
      objc_msgSend(v19, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CC8]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *MEMORY[0x1E0CB2CB8];
      objc_msgSend(v19, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8]);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = HMFEqualObjects(v13, v15);

      v9 = v19;
      if ((v16 & 1) == 0)
      {
        objc_msgSend(v19, "hmf_numberForKey:", v14);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        if (v17)
          -[HMFNetMonitor setReachable:](self, "setReachable:", objc_msgSend(v17, "BOOLValue"));

        v9 = v19;
      }
    }
  }

}

- (id)logIdentifier
{
  return -[HMFNetService name](self->_service, "name");
}

- (HMFNetService)service
{
  return (HMFNetService *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
}

@end
