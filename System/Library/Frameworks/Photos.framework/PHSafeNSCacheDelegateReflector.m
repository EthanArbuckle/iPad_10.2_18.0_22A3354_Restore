@implementation PHSafeNSCacheDelegateReflector

void __55__PHSafeNSCacheDelegateReflector_setDelegate_forCache___block_invoke(_QWORD *a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x19AEBEADC]();
  objc_msgSend(*(id *)(a1[4] + 16), "setObject:forKey:", a1[5], a1[6]);
  objc_autoreleasePoolPop(v2);
}

+ (void)setDelegate:(id)a3 forCache:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "sharedInstance");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDelegate:forCache:", v7, v6);

}

- (void)setDelegate:(id)a3 forCache:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHSafeNSCacheDelegateReflector.m"), 54, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("delegate != nil"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHSafeNSCacheDelegateReflector.m"), 55, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("cache != nil"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  v14 = v9;
  v10 = v9;
  v13 = v7;
  PLRunWithUnfairLock();
  objc_msgSend(v10, "setDelegate:", self);

}

+ (id)sharedInstance
{
  pl_dispatch_once();
  return (id)sharedInstance_pl_once_object_17;
}

void __48__PHSafeNSCacheDelegateReflector_sharedInstance__block_invoke()
{
  PHSafeNSCacheDelegateReflector *v0;
  void *v1;

  v0 = objc_alloc_init(PHSafeNSCacheDelegateReflector);
  v1 = (void *)sharedInstance_pl_once_object_17;
  sharedInstance_pl_once_object_17 = (uint64_t)v0;

}

- (PHSafeNSCacheDelegateReflector)init
{
  PHSafeNSCacheDelegateReflector *v2;
  PHSafeNSCacheDelegateReflector *v3;
  uint64_t v4;
  NSMapTable *delegatesByCache;
  PHSafeNSCacheDelegateReflector *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PHSafeNSCacheDelegateReflector;
  v2 = -[PHSafeNSCacheDelegateReflector init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToWeakObjectsMapTable");
    v4 = objc_claimAutoreleasedReturnValue();
    delegatesByCache = v3->_delegatesByCache;
    v3->_delegatesByCache = (NSMapTable *)v4;

    v6 = v3;
  }

  return v3;
}

- (void)cache:(id)a3 willEvictObject:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v5 = a3;
  v6 = a4;
  v8 = v5;
  PLResultWithUnfairLock();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "cache:willEvictObject:", v8, v6);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegatesByCache, 0);
}

id __56__PHSafeNSCacheDelegateReflector_cache_willEvictObject___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = (void *)MEMORY[0x19AEBEADC]();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKey:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v2);
  return v3;
}

@end
