@implementation MSVSonicAssertion

- (void)invalidate
{
  uint64_t v4;
  uint64_t v5;
  uint32_t v6;
  dispatch_time_t v7;
  NSObject *v8;
  void *v9;
  _QWORD block[4];
  uint32_t v11;

  os_unfair_lock_lock((os_unfair_lock_t)&__assertionLock_5075);
  if (self->_needsInvalidation)
  {
    self->_needsInvalidation = 0;
    v4 = __assertionCount_5076;
    v5 = --__assertionCount_5076;
    if (v4 <= 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSVSonicAssertion.m"), 151, CFSTR("__assertionCount can't be negative"));

      if (__assertionCount_5076)
        goto LABEL_5;
      goto LABEL_4;
    }
    if (!v5)
    {
LABEL_4:
      v6 = arc4random();
      __assertionInvalidationNonce_5079 = v6;
      v7 = dispatch_time(0, 2000000000);
      dispatch_get_global_queue(9, 0);
      v8 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __31__MSVSonicAssertion_invalidate__block_invoke;
      block[3] = &__block_descriptor_36_e5_v8__0l;
      v11 = v6;
      dispatch_after(v7, v8, block);

    }
  }
LABEL_5:
  os_unfair_lock_unlock((os_unfair_lock_t)&__assertionLock_5075);
}

- (void)dealloc
{
  objc_super v3;

  -[MSVSonicAssertion invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)MSVSonicAssertion;
  -[MSVSonicAssertion dealloc](&v3, sel_dealloc);
}

void __47__MSVSonicAssertion_shouldAlsoUseOSTransaction__block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "bundleIdentifier");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  shouldAlsoUseOSTransaction_useOSTransaction = objc_msgSend(v0, "isEqualToString:", CFSTR("com.apple.MediaPlayer.RemotePlayerService"));

}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p %@>"), objc_opt_class(), self, self->_name);
}

BOOL __35__MSVSonicAssertion_hasEntitlement__block_invoke()
{
  _BOOL8 result;

  result = +[MSVEntitlementUtilities hasBoolEntitlement:](MSVEntitlementUtilities, "hasBoolEntitlement:", CFSTR("com.apple.runningboard.sonic"));
  hasEntitlement_hasEntitlement = result;
  return result;
}

- (MSVSonicAssertion)initWithName:(id)a3
{
  id v4;
  MSVSonicAssertion *v5;
  id v6;
  void *v7;
  _UNKNOWN **v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  int v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  int v26;
  void *v27;
  int v28;
  uint64_t v29;
  void *v30;
  NSObject *v31;
  char v32;
  NSObject *v33;
  uint64_t v34;
  NSString *name;
  void *v36;
  MSVSonicAssertion *v37;
  id v39;
  id v40;
  objc_super v41;
  uint8_t buf[4];
  uint64_t v43;
  __int16 v44;
  id v45;
  _QWORD v46[2];

  v46[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)MSVSonicAssertion;
  v5 = -[MSVSonicAssertion init](&v41, sel_init);
  if (!v5)
    goto LABEL_37;
  os_unfair_lock_lock((os_unfair_lock_t)&__assertionLock_5075);
  v6 = (id)__assertion_5080;
  v7 = v6;
  v8 = &off_1E43E7000;
  if (v6)
  {
    if (objc_msgSend(v6, "isValid"))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "timeIntervalSince1970");
      v11 = v10 + 30.0 - *(double *)&__assertionCreatedTime;

      if (v11 >= 5.0)
        goto LABEL_18;
    }
  }
  objc_msgSend(MEMORY[0x1E0D87DF8], "currentProcess");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D87CD0], "attributeWithDomain:name:", CFSTR("com.apple.sonic.backgroundtask"), CFSTR("SonicBackgroundTask"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0D87C98]), "initWithExplanation:target:attributes:", v4, v12, v14);
  v16 = (void *)__assertion_5080;
  __assertion_5080 = v15;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "timeIntervalSince1970");
  __assertionCreatedTime = v18;

  v40 = 0;
  v19 = objc_msgSend((id)__assertion_5080, "acquireWithError:", &v40);
  v20 = v40;
  v21 = os_log_create("com.apple.amp.MediaServices", "Default");
  v22 = v21;
  if (v20)
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      v43 = __assertion_5080;
      v44 = 2114;
      v45 = v20;
      _os_log_impl(&dword_1A077D000, v22, OS_LOG_TYPE_ERROR, "[MSVSonicAssertion] Failed to acquire RBSAssertion %p error=%{public}@", buf, 0x16u);
    }
  }
  else
  {
    v39 = v4;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v43 = __assertion_5080;
      _os_log_impl(&dword_1A077D000, v22, OS_LOG_TYPE_DEFAULT, "[MSVSonicAssertion] Acquired RBSAssertion %p", buf, 0xCu);
    }

    v23 = __assertion_5080;
    +[MSVSonicAssertion sharedObserver](MSVSonicAssertion, "sharedObserver");
    v22 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)v23;
    v8 = &off_1E43E7000;
    objc_msgSend(v24, "addObserver:", v22);
  }

  if (v7)
  {
    if (objc_msgSend(v7, "isValid"))
    {
      v25 = os_log_create("com.apple.amp.MediaServices", "Default");
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v43 = (uint64_t)v7;
        _os_log_impl(&dword_1A077D000, v25, OS_LOG_TYPE_DEFAULT, "[MSVSonicAssertion] Invalidating existing RBSAssertion %p", buf, 0xCu);
      }

    }
    objc_msgSend(v7, "invalidate", v39);
  }

  if (v19)
  {
LABEL_18:
    ++__assertionCount_5076;
    v26 = 1;
  }
  else
  {
    v27 = (void *)__assertion_5080;
    __assertion_5080 = 0;

    v26 = 0;
  }
  if (objc_msgSend(v8[193], "shouldAlsoUseOSTransaction", v39))
  {
    if (__transaction)
      v28 = 0;
    else
      v28 = v26;
    if (v28 == 1)
    {
      objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
      v29 = os_transaction_create();
      v30 = (void *)__transaction;
      __transaction = v29;

      v31 = os_log_create("com.apple.amp.MediaServices", "Default");
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v43 = __transaction;
        _os_log_impl(&dword_1A077D000, v31, OS_LOG_TYPE_DEFAULT, "[MSVSonicAssertion] Created os_transaction %p", buf, 0xCu);
      }
    }
    else
    {
      if (__transaction)
        v32 = v26;
      else
        v32 = 1;
      if ((v32 & 1) != 0)
        goto LABEL_35;
      v33 = os_log_create("com.apple.amp.MediaServices", "Default");
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v43 = __transaction;
        _os_log_impl(&dword_1A077D000, v33, OS_LOG_TYPE_DEFAULT, "[MSVSonicAssertion] Releasing os_transaction %p", buf, 0xCu);
      }

      v31 = __transaction;
      __transaction = 0;
    }

  }
LABEL_35:
  os_unfair_lock_unlock((os_unfair_lock_t)&__assertionLock_5075);
  if (!v26)
  {

    v37 = 0;
    goto LABEL_39;
  }
  v34 = objc_msgSend(v4, "copy");
  name = v5->_name;
  v5->_name = (NSString *)v34;

  v5->_needsInvalidation = 1;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "addObserver:selector:name:object:", v5, sel_handleInvalidation_, CFSTR("MSVSonicAssertionsWereInvalidatedNotification"), 0);

LABEL_37:
  v37 = v5;
LABEL_39:

  return v37;
}

+ (BOOL)shouldAlsoUseOSTransaction
{
  if (shouldAlsoUseOSTransaction_onceToken != -1)
    dispatch_once(&shouldAlsoUseOSTransaction_onceToken, &__block_literal_global_52);
  return shouldAlsoUseOSTransaction_useOSTransaction;
}

+ (BOOL)hasEntitlement
{
  if (hasEntitlement_onceToken != -1)
    dispatch_once(&hasEntitlement_onceToken, &__block_literal_global_5108);
  return hasEntitlement_hasEntitlement;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

void __35__MSVSonicAssertion_sharedObserver__block_invoke()
{
  MSVSonicAssertionObserver *v0;
  void *v1;

  v0 = objc_alloc_init(MSVSonicAssertionObserver);
  v1 = (void *)sharedObserver_observer;
  sharedObserver_observer = (uint64_t)v0;

}

+ (id)sharedObserver
{
  if (sharedObserver_onceToken != -1)
    dispatch_once(&sharedObserver_onceToken, &__block_literal_global_56);
  return (id)sharedObserver_observer;
}

- (void)handleInvalidation:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD);

  -[MSVSonicAssertion invalidationHandler](self, "invalidationHandler", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[MSVSonicAssertion invalidationHandler](self, "invalidationHandler");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, MSVSonicAssertion *))v5)[2](v5, self);

    -[MSVSonicAssertion setInvalidationHandler:](self, "setInvalidationHandler:", 0);
  }
}

- (NSString)name
{
  return self->_name;
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

void __31__MSVSonicAssertion_invalidate__block_invoke(uint64_t a1)
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock((os_unfair_lock_t)&__assertionLock_5075);
  if (*(_DWORD *)(a1 + 32) == __assertionInvalidationNonce_5079 && !__assertionCount_5076 && __assertion_5080 != 0)
  {
    if (objc_msgSend((id)__assertion_5080, "isValid"))
    {
      v3 = os_log_create("com.apple.amp.MediaServices", "Default");
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        v7 = 134217984;
        v8 = __assertion_5080;
        _os_log_impl(&dword_1A077D000, v3, OS_LOG_TYPE_DEFAULT, "[MSVSonicAssertion] Invalidating RBSAssertion %p] Timeout", (uint8_t *)&v7, 0xCu);
      }

    }
    objc_msgSend((id)__assertion_5080, "invalidate");
    v4 = (void *)__assertion_5080;
    __assertion_5080 = 0;

    if (__transaction)
    {
      v5 = os_log_create("com.apple.amp.MediaServices", "Default");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v7 = 134217984;
        v8 = __transaction;
        _os_log_impl(&dword_1A077D000, v5, OS_LOG_TYPE_DEFAULT, "[MSVSonicAssertion] Releasing os_transaction %p Timeout", (uint8_t *)&v7, 0xCu);
      }

      v6 = (void *)__transaction;
      __transaction = 0;

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&__assertionLock_5075);
}

@end
