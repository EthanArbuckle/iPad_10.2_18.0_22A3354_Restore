@implementation HMFNetServiceBrowser

- (HMFNetServiceBrowser)init
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

- (HMFNetServiceBrowser)initWithDomain:(id)a3 serviceType:(id)a4
{
  id v6;
  id v7;
  HMFNetServiceBrowser *v8;
  HMFNetServiceBrowser *v9;
  uint64_t v10;
  NSHashTable *netServices;
  uint64_t v12;
  NSString *domain;
  uint64_t v14;
  NSString *serviceType;
  NSNetServiceBrowser *v16;
  NSNetServiceBrowser *internal;
  NSNetServiceBrowser *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  HMFNetServiceBrowser *v22;
  void *v23;
  HMFNetServiceBrowser *v24;
  NSObject *v25;
  void *v26;
  objc_super v28;
  uint8_t buf[4];
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v28.receiver = self;
  v28.super_class = (Class)HMFNetServiceBrowser;
  v8 = -[HMFNetServiceBrowser init](&v28, sel_init);
  v9 = v8;
  if (!v8)
    goto LABEL_4;
  objc_storeStrong((id *)&v8->_clientQueue, MEMORY[0x1E0C80D38]);
  objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
  v10 = objc_claimAutoreleasedReturnValue();
  netServices = v9->_netServices;
  v9->_netServices = (NSHashTable *)v10;

  v12 = objc_msgSend(v6, "copy");
  domain = v9->_domain;
  v9->_domain = (NSString *)v12;

  v14 = objc_msgSend(v7, "copy");
  serviceType = v9->_serviceType;
  v9->_serviceType = (NSString *)v14;

  v16 = (NSNetServiceBrowser *)objc_alloc_init(MEMORY[0x1E0C92C40]);
  if (v16)
  {
    internal = v9->_internal;
    v9->_internal = v16;
    v18 = v16;

    -[NSNetServiceBrowser setDelegate:](v18, "setDelegate:", v9);
    objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = *MEMORY[0x1E0C99860];
    -[NSNetServiceBrowser removeFromRunLoop:forMode:](v18, "removeFromRunLoop:forMode:", v19, *MEMORY[0x1E0C99860]);

    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSNetServiceBrowser scheduleInRunLoop:forMode:](v18, "scheduleInRunLoop:forMode:", v21, v20);

LABEL_4:
    v22 = v9;
    goto LABEL_8;
  }
  v23 = (void *)MEMORY[0x1A1AC355C]();
  v24 = v9;
  HMFGetOSLogHandle();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier(v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v30 = v26;
    _os_log_impl(&dword_19B546000, v25, OS_LOG_TYPE_ERROR, "%{public}@Failed to create internal net service browser", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v23);
  v22 = 0;
LABEL_8:

  return v22;
}

- (void)dealloc
{
  objc_super v3;

  -[NSNetServiceBrowser setDelegate:](self->_internal, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)HMFNetServiceBrowser;
  -[HMFNetServiceBrowser dealloc](&v3, sel_dealloc);
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
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = (void *)MEMORY[0x1E0CB3940];
  -[HMFNetServiceBrowser shortDescription](self, "shortDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMFNetServiceBrowser domain](self, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMFNetServiceBrowser serviceType](self, "serviceType");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" %p"), self);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@%@, Domain = %@, Service Type = %@>"), v6, v7, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@%@, Domain = %@, Service Type = %@>"), v6, v7, v8, &stru_1E3B39EC0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (NSString)debugDescription
{
  return (NSString *)-[HMFNetServiceBrowser descriptionWithPointer:](self, "descriptionWithPointer:", 1);
}

- (NSString)description
{
  return (NSString *)-[HMFNetServiceBrowser descriptionWithPointer:](self, "descriptionWithPointer:", 0);
}

- (BOOL)shouldCache
{
  HMFNetServiceBrowser *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_cachedNetServices != 0;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setShouldCache:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_lock;
  NSMutableOrderedSet *v6;
  NSMutableOrderedSet *cachedNetServices;
  NSHashTable *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSMutableOrderedSet *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v3 = a3;
  v19 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
    v6 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue();
    cachedNetServices = self->_cachedNetServices;
    self->_cachedNetServices = v6;

    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v8 = self->_netServices;
    v9 = -[NSHashTable countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v8);
          v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          if (objc_msgSend(v12, "isPublishing", (_QWORD)v14))
            -[NSMutableOrderedSet addObject:](self->_cachedNetServices, "addObject:", v12);
        }
        v9 = -[NSHashTable countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v9);
    }

  }
  else
  {
    v13 = self->_cachedNetServices;
    self->_cachedNetServices = 0;

  }
  os_unfair_lock_unlock(p_lock);
}

- (NSArray)cachedNetServices
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[NSMutableOrderedSet array](self->_cachedNetServices, "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v5;
}

- (void)addNetServiceToCache:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    os_unfair_lock_lock_with_options();
    -[NSHashTable addObject:](self->_netServices, "addObject:", v5);
    -[NSMutableOrderedSet addObject:](self->_cachedNetServices, "addObject:", v5);
    os_unfair_lock_unlock(&self->_lock);
    v4 = v5;
  }

}

- (BOOL)isBrowsing
{
  HMFNetServiceBrowser *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_browsing;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setBrowsing:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_browsing = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)startBrowsingWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMFNetServiceBrowser clientQueue](self, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__HMFNetServiceBrowser_startBrowsingWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E3B37D38;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __59__HMFNetServiceBrowser_startBrowsingWithCompletionHandler___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "isBrowsing");
  v3 = (void *)MEMORY[0x1A1AC355C]();
  v4 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v2)
  {
    if (v6)
    {
      HMFGetLogIdentifier(v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v7;
      _os_log_impl(&dword_19B546000, v5, OS_LOG_TYPE_INFO, "%{public}@The browser is already browsing", (uint8_t *)&v15, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
    v8 = *(_QWORD *)(a1 + 40);
    if (v8)
      (*(void (**)(uint64_t, _QWORD))(v8 + 16))(v8, 0);
  }
  else
  {
    if (v6)
    {
      HMFGetLogIdentifier(v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "serviceType");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "domain");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543874;
      v16 = v9;
      v17 = 2112;
      v18 = v10;
      v19 = 2112;
      v20 = v11;
      _os_log_impl(&dword_19B546000, v5, OS_LOG_TYPE_INFO, "%{public}@Start browsing for %@%@", (uint8_t *)&v15, 0x20u);

    }
    objc_autoreleasePoolPop(v3);
    objc_msgSend(*(id *)(a1 + 32), "setBrowsing:", 1);
    objc_msgSend(*(id *)(a1 + 32), "setBrowseBlock:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "internal");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "serviceType");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "domain");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "searchForServicesOfType:inDomain:", v13, v14);

  }
}

- (void)stopBrowsing
{
  NSObject *v3;
  _QWORD block[5];

  -[HMFNetServiceBrowser clientQueue](self, "clientQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__HMFNetServiceBrowser_stopBrowsing__block_invoke;
  block[3] = &unk_1E3B37AF8;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __36__HMFNetServiceBrowser_stopBrowsing__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stopBrowsingWithError:", 0);
}

- (void)_stopBrowsingWithError:(id)a3
{
  id v4;
  void *v5;
  HMFNetServiceBrowser *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  HMFNetServiceBrowser *v10;
  id v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[HMFNetServiceBrowser isBrowsing](self, "isBrowsing"))
  {
    v5 = (void *)MEMORY[0x1A1AC355C]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier(v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v8;
      _os_log_impl(&dword_19B546000, v7, OS_LOG_TYPE_INFO, "%{public}@Stopping the browse", (uint8_t *)&v13, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
    -[HMFNetServiceBrowser internal](v6, "internal");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stop");

    v10 = v6;
    v11 = v4;
    if (v10)
    {
      -[HMFNetServiceBrowser delegate](v10, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v12, "netServiceBrowser:didStopBrowsingWithError:", v10, v11);

    }
  }

}

+ (id)logCategory
{
  if (_MergedGlobals_3_4 != -1)
    dispatch_once(&_MergedGlobals_3_4, &__block_literal_global_15);
  return (id)qword_1ED012ED8;
}

void __35__HMFNetServiceBrowser_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle(CFSTR("Networking.Service.Browser"), CFSTR("com.apple.HMFoundation"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED012ED8;
  qword_1ED012ED8 = v0;

}

- (id)logIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HMFNetServiceBrowser domain](self, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMFNetServiceBrowser serviceType](self, "serviceType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ - %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)netServiceBrowserWillSearch:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HMFNetServiceBrowser clientQueue](self, "clientQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__HMFNetServiceBrowser_netServiceBrowserWillSearch___block_invoke;
  block[3] = &unk_1E3B37AF8;
  block[4] = self;
  dispatch_async(v4, block);

}

void __52__HMFNetServiceBrowser_netServiceBrowserWillSearch___block_invoke(uint64_t a1)
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
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_19B546000, v4, OS_LOG_TYPE_DEBUG, "%{public}@Browser started browsing", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "browseBlock");
  v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "setBrowseBlock:", 0);
    v6[2](v6, 0);
  }

}

- (void)netServiceBrowserDidStopSearch:(id)a3
{
  id v4;
  void *v5;
  HMFNetServiceBrowser *v6;
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
    _os_log_impl(&dword_19B546000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Browse did stop", (uint8_t *)&v9, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  -[HMFNetServiceBrowser setBrowsing:](v6, "setBrowsing:", 0);

}

- (void)netServiceBrowser:(id)a3 didNotSearch:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  -[HMFNetServiceBrowser clientQueue](self, "clientQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__HMFNetServiceBrowser_netServiceBrowser_didNotSearch___block_invoke;
  v8[3] = &unk_1E3B37CA8;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, v8);

}

void __55__HMFNetServiceBrowser_netServiceBrowser_didNotSearch___block_invoke(uint64_t a1)
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
    _os_log_impl(&dword_19B546000, v4, OS_LOG_TYPE_INFO, "%{public}@Failed to browse", (uint8_t *)&v15, 0xCu);

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
    _os_log_impl(&dword_19B546000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Failed to browse with error: %@", (uint8_t *)&v15, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  objc_msgSend(*(id *)(a1 + 32), "browseBlock");
  v11 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(*(id *)(a1 + 32), "setBrowseBlock:", 0);
    v12 = (void *)MEMORY[0x1E0CB35C8];
    +[HMFNetService errorFromNetServiceErrorDict:](HMFNetService, "errorFromNetServiceErrorDict:", *(_QWORD *)(a1 + 40));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "hmfErrorWithCode:reason:suggestion:underlyingError:", 12, CFSTR("Failed to search for services."), 0, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    ((void (**)(_QWORD, void *))v11)[2](v11, v14);
  }

}

- (void)netServiceBrowser:(id)a3 didFindService:(id)a4 moreComing:(BOOL)a5
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v6 = a4;
  -[HMFNetServiceBrowser clientQueue](self, "clientQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __68__HMFNetServiceBrowser_netServiceBrowser_didFindService_moreComing___block_invoke;
  v9[3] = &unk_1E3B37CA8;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(v7, v9);

}

void __68__HMFNetServiceBrowser_netServiceBrowser_didFindService_moreComing___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  os_unfair_lock_s *v7;
  id v8;
  HMFNetService *v9;
  uint64_t v10;
  HMFNetService *i;
  void *v12;
  void *v13;
  int v14;
  id v15;
  HMFNetService *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
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
    v24 = v5;
    v25 = 2112;
    v26 = v6;
    _os_log_impl(&dword_19B546000, v4, OS_LOG_TYPE_DEBUG, "%{public}@Added service: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  v7 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 8);
  os_unfair_lock_lock_with_options();
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
  v9 = (HMFNetService *)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v9; i = (HMFNetService *)((char *)i + 1))
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v12, "internal", (_QWORD)v18);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqual:", *(_QWORD *)(a1 + 40));

        if (v14)
        {
          v9 = v12;
          goto LABEL_13;
        }
      }
      v9 = (HMFNetService *)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_13:

  os_unfair_lock_unlock(v7);
  if (!v9)
    v9 = -[HMFNetService initWithNetService:]([HMFNetService alloc], "initWithNetService:", *(_QWORD *)(a1 + 40));
  -[HMFNetService setPublishing:](v9, "setPublishing:", 1, (_QWORD)v18);
  objc_msgSend(*(id *)(a1 + 32), "addNetServiceToCache:", v9);
  v15 = *(id *)(a1 + 32);
  v16 = v9;
  if (v16 && v15)
  {
    objc_msgSend(v15, "delegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v17, "netServiceBrowser:didAddService:", v15, v16);

  }
}

- (void)netServiceBrowser:(id)a3 didRemoveDomain:(id)a4 moreComing:(BOOL)a5
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  HMFNetServiceBrowser *v11;

  v6 = a4;
  -[HMFNetServiceBrowser clientQueue](self, "clientQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __69__HMFNetServiceBrowser_netServiceBrowser_didRemoveDomain_moreComing___block_invoke;
  v9[3] = &unk_1E3B37CA8;
  v10 = v6;
  v11 = self;
  v8 = v6;
  dispatch_async(v7, v9);

}

void __69__HMFNetServiceBrowser_netServiceBrowser_didRemoveDomain_moreComing___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = objc_msgSend(v2, "isEqualToString:", v3);

  if ((_DWORD)v2)
  {
    v4 = (void *)MEMORY[0x1A1AC355C]();
    v5 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier(v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 32);
      v10 = 138543618;
      v11 = v7;
      v12 = 2112;
      v13 = v8;
      _os_log_impl(&dword_19B546000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@The browse domain, %@, was removed", (uint8_t *)&v10, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:reason:", 12, CFSTR("The search domain was removed."));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "_stopBrowsingWithError:", v9);

  }
}

- (void)netServiceBrowser:(id)a3 didRemoveService:(id)a4 moreComing:(BOOL)a5
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v6 = a4;
  -[HMFNetServiceBrowser clientQueue](self, "clientQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __70__HMFNetServiceBrowser_netServiceBrowser_didRemoveService_moreComing___block_invoke;
  v9[3] = &unk_1E3B37CA8;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(v7, v9);

}

void __70__HMFNetServiceBrowser_netServiceBrowser_didRemoveService_moreComing___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  os_unfair_lock_s *v7;
  id v8;
  HMFNetService *v9;
  uint64_t v10;
  HMFNetService *i;
  void *v12;
  void *v13;
  int v14;
  id v15;
  HMFNetService *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
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
    v24 = v5;
    v25 = 2112;
    v26 = v6;
    _os_log_impl(&dword_19B546000, v4, OS_LOG_TYPE_DEBUG, "%{public}@Removed service: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  v7 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 8);
  os_unfair_lock_lock_with_options();
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
  v9 = (HMFNetService *)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v9; i = (HMFNetService *)((char *)i + 1))
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v12, "internal", (_QWORD)v18);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqual:", *(_QWORD *)(a1 + 40));

        if (v14)
        {
          v9 = v12;
          -[HMFNetService setPublishing:](v9, "setPublishing:", 0);
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObject:", v9);
          goto LABEL_13;
        }
      }
      v9 = (HMFNetService *)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_13:

  os_unfair_lock_unlock(v7);
  if (!v9)
    v9 = -[HMFNetService initWithNetService:]([HMFNetService alloc], "initWithNetService:", *(_QWORD *)(a1 + 40));
  v15 = *(id *)(a1 + 32);
  v16 = v9;
  if (v16 && v15)
  {
    objc_msgSend(v15, "delegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v17, "netServiceBrowser:didRemoveService:", v15, v16);

  }
}

- (HMFNetServiceBrowserDelegate)delegate
{
  return (HMFNetServiceBrowserDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)domain
{
  return self->_domain;
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (NSNetServiceBrowser)internal
{
  return self->_internal;
}

- (id)browseBlock
{
  return self->_browseBlock;
}

- (void)setBrowseBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_browseBlock, 0);
  objc_storeStrong((id *)&self->_internal, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_cachedNetServices, 0);
  objc_storeStrong((id *)&self->_netServices, 0);
}

@end
