@implementation BLSAssertion

+ (id)acquireWithExplanation:(id)a3 observer:(id)a4 attributes:(id)a5
{
  id v7;
  id v8;
  id v9;
  BLSAssertion *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[BLSAssertion initWithExplanation:attributes:]([BLSAssertion alloc], "initWithExplanation:attributes:", v9, v7);

  -[BLSAssertion acquireWithObserver:](v10, "acquireWithObserver:", v8);
  return v10;
}

- (BLSAssertion)initWithExplanation:(id)a3 attributes:(id)a4
{
  id v6;
  id v7;
  BLSAssertion *v8;
  BLSAssertion *v9;
  id v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  BLSAssertionDescriptor *v14;
  BLSAssertionDescriptor *descriptor;
  uint64_t v16;
  BLSAssertionService *service;
  uint64_t v18;
  NSHashTable *observers;
  objc_super v21;
  uint8_t buf[4];
  BLSAssertion *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)BLSAssertion;
  v8 = -[BLSAssertion init](&v21, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_lock._os_unfair_lock_opaque = 0;
    v8->_lock_acquisitionState = 0;
    v10 = v7;
    v11 = objc_msgSend(v10, "count");
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "allObjects");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "count") != v11)
    {
      bls_assertions_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 134218498;
        v23 = v9;
        v24 = 2114;
        v25 = v6;
        v26 = 2114;
        v27 = v10;
        _os_log_fault_impl(&dword_1B0C75000, v13, OS_LOG_TYPE_FAULT, "%p for assertion with explanation:%{public}@ cannot repeat the same exact attribute:%{public}@", buf, 0x20u);
      }

    }
    v14 = -[BLSAssertionDescriptor initWithExplanation:attributes:]([BLSAssertionDescriptor alloc], "initWithExplanation:attributes:", v6, v7);
    descriptor = v9->_descriptor;
    v9->_descriptor = v14;

    +[BLSAssertion defaultService]();
    v16 = objc_claimAutoreleasedReturnValue();
    service = v9->_service;
    v9->_service = (BLSAssertionService *)v16;

    v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 517, 2);
    observers = v9->_observers;
    v9->_observers = (NSHashTable *)v18;

  }
  return v9;
}

+ (id)defaultService
{
  id v0;
  _BOOL4 v1;
  __objc2_class **v2;
  id v3;
  void *v4;

  objc_opt_self();
  os_unfair_lock_lock((os_unfair_lock_t)&_classLock);
  v0 = (id)_defaultService;
  if (!v0)
  {
    v1 = +[BLSRuntime isHostProcess](BLSRuntime, "isHostProcess");
    v2 = off_1E6219980;
    if (!v1)
      v2 = off_1E62199E0;
    v3 = objc_alloc_init(*v2);
    v4 = (void *)_defaultService;
    _defaultService = (uint64_t)v3;

    v0 = v3;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_classLock);
  return v0;
}

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  uint8_t v5[14];
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  -[BLSAssertion lock_description](a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_0();
  v6 = v4;
  _os_log_fault_impl(&dword_1B0C75000, a2, OS_LOG_TYPE_FAULT, "%p BLSAssertion must be invalidated before dealloc:%{public}@", v5, 0x16u);

}

- (unsigned)lock_description
{
  unsigned __int8 *v1;
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;

  v1 = a1;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", a1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (id)objc_msgSend(v2, "appendBool:withName:", *((_QWORD *)v1 + 5) == 2, CFSTR("isAcquired"));
    v4 = *((_QWORD *)v1 + 5);
    if (v4 == 2)
    {
      BLSShortLoggingStringForMachTime(*((_QWORD *)v1 + 6));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "appendString:withName:", v5, CFSTR("acquiredTimestamp"));

      mach_continuous_time();
      BSTimeDifferenceFromMachTimeToMachTime();
      v6 = (id)objc_msgSend(v2, "appendTimeInterval:withName:decomposeUnits:", CFSTR("acquiredDuration"), 1);
      v4 = *((_QWORD *)v1 + 5);
    }
    v7 = (id)objc_msgSend(v2, "appendBool:withName:ifEqualTo:", v4 == 1, CFSTR("pendingAcquisition"), 1);
    v8 = (id)objc_msgSend(v2, "appendBool:withName:", v1[36], CFSTR("isPaused"));
    v9 = (id)objc_msgSend(v2, "appendObject:withName:", *((_QWORD *)v1 + 7), CFSTR("descriptor"));
    v10 = (id)objc_msgSend(v2, "appendObject:withName:skipIfNil:", *((_QWORD *)v1 + 1), CFSTR("identifier"), 1);
    objc_msgSend(v1, "service");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (id)objc_msgSend(v2, "appendPointer:withName:", v11, CFSTR("service"));

    v13 = (id)objc_msgSend(v2, "appendInteger:withName:", objc_msgSend(*((id *)v1 + 3), "count"), CFSTR("observerCount"));
    objc_msgSend(v2, "build");
    v1 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();

  }
  return v1;
}

- (NSString)description
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[BLSAssertion lock_description]((unsigned __int8 *)self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return (NSString *)v4;
}

- (NSString)explanation
{
  return -[BLSAssertionDescriptor explanation](self->_descriptor, "explanation");
}

- (NSArray)attributes
{
  return -[BLSAssertionDescriptor attributes](self->_descriptor, "attributes");
}

- (BOOL)isAcquired
{
  BLSAssertion *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_acquisitionState == 2;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (unint64_t)acquisitionState
{
  os_unfair_lock_s *p_lock;
  unint64_t lock_acquisitionState;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_acquisitionState = self->_lock_acquisitionState;
  os_unfair_lock_unlock(p_lock);
  return lock_acquisitionState;
}

- (BOOL)isPaused
{
  BLSAssertion *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_paused;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)isActive
{
  os_unfair_lock_s *p_lock;
  BOOL v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_lock_acquisitionState == 2 && !self->_lock_paused;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BLSAssertionIdentifier)identifier
{
  os_unfair_lock_s *p_lock;
  BLSAssertionIdentifier *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_identifier;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setIdentifier:(id)a3
{
  BLSAssertionIdentifier *v4;
  BLSAssertionIdentifier *identifier;

  v4 = (BLSAssertionIdentifier *)a3;
  os_unfair_lock_lock(&self->_lock);
  identifier = self->_identifier;
  self->_identifier = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)acquireWithObserver:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_invalidated)
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    -[BLSAssertion lock_description]((unsigned __int8 *)self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("BLSAssertion cannot be acquired after invalidation:%@"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[BLSAssertion acquireWithObserver:].cold.1(a2);
    objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
    if (v9)
      -[BLSAssertion addObserver:](self, "addObserver:", v9);
    -[BLSAssertion service](self, "service");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "acquireAssertion:", self);

  }
}

- (void)acquireWithCompletion:(id)a3
{
  id v5;
  BLSAssertionAcquisitionObserver *v6;
  BLSAssertionAcquisitionObserver *acquisitionObserver;
  void *v8;
  id v9;

  v5 = a3;
  if (v5)
  {
    v9 = v5;
    os_unfair_lock_lock(&self->_lock);
    +[BLSAssertionAcquisitionObserver observerWithCompletion:](BLSAssertionAcquisitionObserver, "observerWithCompletion:", v9);
    v6 = (BLSAssertionAcquisitionObserver *)objc_claimAutoreleasedReturnValue();
    acquisitionObserver = self->_acquisitionObserver;
    self->_acquisitionObserver = v6;

    os_unfair_lock_unlock(&self->_lock);
    -[BLSAssertion acquireWithObserver:](self, "acquireWithObserver:", self->_acquisitionObserver);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("completion != nil"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[BLSAssertion acquireWithCompletion:].cold.1(a2);
    objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
}

- (void)cancel
{
  id v3;

  if (self)
  {
    os_unfair_lock_lock(&self->_lock);
    self->_lock_acquisitionState = 0;
    os_unfair_lock_unlock(&self->_lock);
  }
  -[BLSAssertion service](self, "service");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelAssertion:withError:", self, 0);

}

- (void)invalidate
{
  -[BLSAssertion cancel](self, "cancel");
  os_unfair_lock_lock(&self->_lock);
  self->_lock_invalidated = 1;
  os_unfair_lock_unlock(&self->_lock);
}

- (void)restartTimeoutTimer
{
  id v3;

  -[BLSAssertion service](self, "service");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "restartAssertionTimeoutTimer:", self);

}

- (void)addObserver:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSHashTable addObject:](self->_observers, "addObject:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)removeObserver:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSHashTable removeObject:](self->_observers, "removeObject:", v5);

  os_unfair_lock_unlock(p_lock);
}

+ (void)setDefaultService:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint8_t v8[16];

  v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_classLock);
  v4 = (id)_defaultService;
  v5 = (void *)_defaultService;
  _defaultService = (uint64_t)v3;
  v6 = v3;

  os_unfair_lock_unlock((os_unfair_lock_t)&_classLock);
  if (v6)
  {
    objc_msgSend(v4, "replaceWithService:", v6);
  }
  else
  {
    bls_assertions_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1B0C75000, v7, OS_LOG_TYPE_DEFAULT, "BLSAssertionService defaultService reset - should only occur during unit testing", v8, 2u);
    }

  }
}

- (void)serviceDidAcquire
{
  os_unfair_lock_s *p_lock;
  unint64_t lock_acquisitionState;
  NSObject *v5;
  _QWORD v6[5];
  uint8_t buf[4];
  BLSAssertion *v8;
  __int16 v9;
  BLSAssertion *v10;
  __int16 v11;
  _BOOL4 v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_acquisitionState = self->_lock_acquisitionState;
  self->_lock_acquisitionState = 2;
  self->_lock_acquiredMachContinuousTime = mach_continuous_time();
  os_unfair_lock_unlock(p_lock);
  bls_assertions_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218498;
    v8 = self;
    v9 = 2114;
    v10 = self;
    v11 = 1024;
    v12 = lock_acquisitionState != 2;
    _os_log_impl(&dword_1B0C75000, v5, OS_LOG_TYPE_INFO, "%p did acquire assertion %{public}@, willNotify=%{BOOL}d", buf, 0x1Cu);
  }

  if (lock_acquisitionState != 2)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __33__BLSAssertion_serviceDidAcquire__block_invoke;
    v6[3] = &unk_1E621AA58;
    v6[4] = self;
    -[BLSAssertion notifyObserversWithBlock:]((uint64_t)self, v6);
  }
}

void __33__BLSAssertion_serviceDidAcquire__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "assertionWasAcquired:", *(_QWORD *)(a1 + 32));

}

- (void)notifyObserversWithBlock:(uint64_t)a1
{
  id v3;
  void *v4;
  _QWORD v5[5];
  id v6;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __41__BLSAssertion_notifyObserversWithBlock___block_invoke;
    v5[3] = &unk_1E621A660;
    v5[4] = a1;
    v6 = v3;
    dispatch_async(MEMORY[0x1E0C80D38], v5);

  }
}

- (void)serviceFailedToAcquireWithError:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if (self)
  {
    os_unfair_lock_lock(&self->_lock);
    self->_lock_acquisitionState = 0;
    os_unfair_lock_unlock(&self->_lock);
  }
  bls_assertions_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[BLSAssertion serviceFailedToAcquireWithError:].cold.1((uint64_t)self, v4, v5);

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__BLSAssertion_serviceFailedToAcquireWithError___block_invoke;
  v7[3] = &unk_1E621AA80;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[BLSAssertion notifyObserversWithBlock:]((uint64_t)self, v7);

}

void __48__BLSAssertion_serviceFailedToAcquireWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "assertion:didFailToAcquireWithError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)serviceDidPause
{
  NSObject *v3;
  _QWORD v4[5];
  uint8_t buf[4];
  BLSAssertion *v6;
  __int16 v7;
  BLSAssertion *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (self)
  {
    os_unfair_lock_lock(&self->_lock);
    self->_lock_paused = 1;
    os_unfair_lock_unlock(&self->_lock);
  }
  bls_assertions_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218242;
    v6 = self;
    v7 = 2114;
    v8 = self;
    _os_log_impl(&dword_1B0C75000, v3, OS_LOG_TYPE_INFO, "%p did pause assertion %{public}@", buf, 0x16u);
  }

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __31__BLSAssertion_serviceDidPause__block_invoke;
  v4[3] = &unk_1E621AA58;
  v4[4] = self;
  -[BLSAssertion notifyObserversWithBlock:]((uint64_t)self, v4);
}

void __31__BLSAssertion_serviceDidPause__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "assertionDidPause:", *(_QWORD *)(a1 + 32));

}

- (void)serviceDidResume
{
  NSObject *v3;
  _QWORD v4[5];
  uint8_t buf[4];
  BLSAssertion *v6;
  __int16 v7;
  BLSAssertion *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (self)
  {
    os_unfair_lock_lock(&self->_lock);
    self->_lock_paused = 0;
    os_unfair_lock_unlock(&self->_lock);
  }
  bls_assertions_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218242;
    v6 = self;
    v7 = 2114;
    v8 = self;
    _os_log_impl(&dword_1B0C75000, v3, OS_LOG_TYPE_INFO, "%p did resume assertion %{public}@", buf, 0x16u);
  }

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __32__BLSAssertion_serviceDidResume__block_invoke;
  v4[3] = &unk_1E621AA58;
  v4[4] = self;
  -[BLSAssertion notifyObserversWithBlock:]((uint64_t)self, v4);
}

void __32__BLSAssertion_serviceDidResume__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "assertionDidResume:", *(_QWORD *)(a1 + 32));

}

- (void)serviceWillCancel
{
  NSObject *v3;
  _QWORD v4[5];
  uint8_t buf[4];
  BLSAssertion *v6;
  __int16 v7;
  BLSAssertion *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  bls_assertions_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218242;
    v6 = self;
    v7 = 2114;
    v8 = self;
    _os_log_impl(&dword_1B0C75000, v3, OS_LOG_TYPE_INFO, "%p (warning) will cancel assertion %{public}@", buf, 0x16u);
  }

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __33__BLSAssertion_serviceWillCancel__block_invoke;
  v4[3] = &unk_1E621AA58;
  v4[4] = self;
  -[BLSAssertion notifyObserversWithBlock:]((uint64_t)self, v4);
}

void __33__BLSAssertion_serviceWillCancel__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "assertionWillCancel:", *(_QWORD *)(a1 + 32));

}

- (void)serviceDidCancelWithError:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  BLSAssertion *v11;
  __int16 v12;
  BLSAssertion *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self)
  {
    os_unfair_lock_lock(&self->_lock);
    self->_lock_acquisitionState = 0;
    os_unfair_lock_unlock(&self->_lock);
  }
  bls_assertions_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "bls_loggingString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v11 = self;
    v12 = 2114;
    v13 = self;
    v14 = 2114;
    v15 = v6;
    _os_log_impl(&dword_1B0C75000, v5, OS_LOG_TYPE_INFO, "%p did cancel assertion %{public}@ with error:%{public}@", buf, 0x20u);

  }
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __42__BLSAssertion_serviceDidCancelWithError___block_invoke;
  v8[3] = &unk_1E621AA80;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  -[BLSAssertion notifyObserversWithBlock:]((uint64_t)self, v8);

}

void __42__BLSAssertion_serviceDidCancelWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "assertion:didCancelWithError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __41__BLSAssertion_notifyObserversWithBlock___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 32));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "allObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 32));
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v3 = v2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40));
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (BLSAssertionDescriptor)descriptor
{
  return self->_descriptor;
}

- (BLSAssertionService)service
{
  return (BLSAssertionService *)objc_getProperty(self, a2, 64, 1);
}

- (void)setService:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_descriptor, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_acquisitionObserver, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)acquireWithObserver:(const char *)a1 .cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_1(&dword_1B0C75000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)acquireWithCompletion:(const char *)a1 .cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_1(&dword_1B0C75000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)serviceFailedToAcquireWithError:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  __int16 v6;
  uint64_t v7;
  uint8_t v8[14];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "bls_loggingString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_0();
  v9 = a1;
  v10 = v6;
  v11 = v7;
  _os_log_error_impl(&dword_1B0C75000, a3, OS_LOG_TYPE_ERROR, "%p failed to acquire assertion %{public}@ with error:%{public}@", v8, 0x20u);

}

@end
