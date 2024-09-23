@implementation BKSHIDEventObserver

- (BKSHIDEventObserver)init
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  BKSHIDEventObserver *result;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  BKSHIDEventObserver *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("init is not allowed on BKSHIDEventObserver"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138544642;
    v10 = v5;
    v11 = 2114;
    v12 = v7;
    v13 = 2048;
    v14 = self;
    v15 = 2114;
    v16 = CFSTR("BKSHIDEventObserver.m");
    v17 = 1024;
    v18 = 81;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (BKSHIDEventObserver *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (id)_init
{
  BKSHIDEventObserver *v2;
  uint64_t Serial;
  OS_dispatch_queue *calloutQueue;
  uint64_t v5;
  NSMapTable *lock_deferringAssertionsToObservers;
  uint64_t v7;
  NSSet *lock_deferringObservations;
  uint64_t v9;
  BSServiceConnection *connection;
  BSServiceConnection *v11;
  _QWORD v13[4];
  BKSHIDEventObserver *v14;
  id v15;
  id location;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)BKSHIDEventObserver;
  v2 = -[BKSHIDEventObserver init](&v17, sel_init);
  if (v2)
  {
    Serial = BSDispatchQueueCreateSerial();
    calloutQueue = v2->_calloutQueue;
    v2->_calloutQueue = (OS_dispatch_queue *)Serial;

    v2->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToWeakObjectsMapTable");
    v5 = objc_claimAutoreleasedReturnValue();
    lock_deferringAssertionsToObservers = v2->_lock_deferringAssertionsToObservers;
    v2->_lock_deferringAssertionsToObservers = (NSMapTable *)v5;

    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v7 = objc_claimAutoreleasedReturnValue();
    lock_deferringObservations = v2->_lock_deferringObservations;
    v2->_lock_deferringObservations = (NSSet *)v7;

    objc_initWeak(&location, v2);
    +[BKSHIDServiceConnection clientConnectionForServiceWithName:](BKSHIDServiceConnection, "clientConnectionForServiceWithName:", CFSTR("BKHIDEventDeliveryObserver"));
    v9 = objc_claimAutoreleasedReturnValue();
    connection = v2->_connection;
    v2->_connection = (BSServiceConnection *)v9;

    v11 = v2->_connection;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __28__BKSHIDEventObserver__init__block_invoke;
    v13[3] = &unk_1E1EA0FA8;
    v14 = v2;
    objc_copyWeak(&v15, &location);
    -[BSServiceConnection configureConnection:](v11, "configureConnection:", v13);
    -[BSServiceConnection activate](v2->_connection, "activate");
    objc_destroyWeak(&v15);

    objc_destroyWeak(&location);
  }
  return v2;
}

- (id)addDeferringObserver:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  _QWORD v15[5];
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  BKSHIDEventObserver *v21;
  __int16 v22;
  const __CFString *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("observer"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v17 = v12;
      v18 = 2114;
      v19 = v14;
      v20 = 2048;
      v21 = self;
      v22 = 2114;
      v23 = CFSTR("BKSHIDEventObserver.m");
      v24 = 1024;
      v25 = 145;
      v26 = 2114;
      v27 = v11;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A11A638);
  }
  v6 = v5;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  v7 = objc_alloc(MEMORY[0x1E0D01868]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p>"), objc_opt_class(), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __44__BKSHIDEventObserver_addDeferringObserver___block_invoke;
  v15[3] = &unk_1E1EA0348;
  v15[4] = self;
  v9 = (void *)objc_msgSend(v7, "initWithIdentifier:forReason:invalidationBlock:", CFSTR("BKSHIDEventObserver-deferringObserver"), v8, v15);

  if (!-[NSMapTable count](self->_lock_deferringAssertionsToObservers, "count"))
    -[BKSHIDEventObserver _lock_enableObservation](self, "_lock_enableObservation");
  -[NSMapTable setObject:forKey:](self->_lock_deferringAssertionsToObservers, "setObject:forKey:", v6, v9);
  os_unfair_lock_unlock(&self->_lock);

  return v9;
}

- (NSSet)deferringObservations
{
  os_unfair_lock_s *p_lock;
  uint64_t v4;
  void *v5;

  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  if (-[NSMapTable count](self->_lock_deferringAssertionsToObservers, "count"))
  {
    v4 = -[NSSet copy](self->_lock_deferringObservations, "copy");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;
  os_unfair_lock_unlock(p_lock);
  return (NSSet *)v5;
}

- (id)addObservingClient:(id)a3 forChainObserver:(id)a4
{
  id v7;
  id v8;
  void *v9;
  _BKChainObserverContainer *v10;
  BKSEventDeferringChainIdentity *v11;
  void *v12;
  void *v13;
  BKSEventDeferringChainIdentity *v14;
  NSMutableSet *lock_chainObserverContainers;
  NSMutableSet *v16;
  NSMutableSet *v17;
  void *v18;
  _BKChainObserverContainer *v19;
  void *v20;
  void *v22;
  objc_class *v23;
  void *v24;
  void *v25;
  void *v26;
  objc_class *v27;
  void *v28;
  void *v29;
  objc_class *v30;
  void *v31;
  objc_class *v32;
  void *v33;
  void *v34;
  void *v35;
  objc_class *v36;
  void *v37;
  _QWORD v38[5];
  _BKChainObserverContainer *v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  BKSHIDEventObserver *v45;
  __int16 v46;
  const __CFString *v47;
  __int16 v48;
  int v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    v22 = (void *)MEMORY[0x1E0CB3940];
    objc_opt_class();
    v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringWithFormat:", CFSTR("Value for '%@' was unexpectedly nil. Expected %@."), CFSTR("observer"), v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (objc_class *)objc_opt_class();
      NSStringFromClass(v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v41 = v26;
      v42 = 2114;
      v43 = v28;
      v44 = 2048;
      v45 = self;
      v46 = 2114;
      v47 = CFSTR("BKSHIDEventObserver.m");
      v48 = 1024;
      v49 = 178;
      v50 = 2114;
      v51 = v25;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v25), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A11A9C4);
  }
  v9 = v8;
  objc_opt_class();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v29 = (void *)MEMORY[0x1E0CB3940];
    v30 = (objc_class *)objc_msgSend(v9, "classForCoder");
    if (!v30)
      v30 = (objc_class *)objc_opt_class();
    NSStringFromClass(v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v32 = (objc_class *)objc_opt_class();
    NSStringFromClass(v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "stringWithFormat:", CFSTR("Value for '%@' was of unexpected class %@. Expected %@."), CFSTR("observer"), v31, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = (objc_class *)objc_opt_class();
      NSStringFromClass(v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v41 = v35;
      v42 = 2114;
      v43 = v37;
      v44 = 2048;
      v45 = self;
      v46 = 2114;
      v47 = CFSTR("BKSHIDEventObserver.m");
      v48 = 1024;
      v49 = 178;
      v50 = 2114;
      v51 = v34;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v34), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A11AB04);
  }

  os_unfair_lock_lock(&self->_lock);
  v10 = objc_alloc_init(_BKChainObserverContainer);
  -[_BKChainObserverContainer setObservingClient:](v10, "setObservingClient:", v7);
  v11 = [BKSEventDeferringChainIdentity alloc];
  objc_msgSend(v9, "display");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "deferringEnvironment");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[BKSEventDeferringChainIdentity initWithDisplay:environment:](v11, "initWithDisplay:environment:", v12, v13);
  -[_BKChainObserverContainer setRequestedChainIdentity:](v10, "setRequestedChainIdentity:", v14);

  -[_BKChainObserverContainer setObserverInterface:](v10, "setObserverInterface:", v9);
  lock_chainObserverContainers = self->_lock_chainObserverContainers;
  if (!lock_chainObserverContainers)
  {
    v16 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v17 = self->_lock_chainObserverContainers;
    self->_lock_chainObserverContainers = v16;

    lock_chainObserverContainers = self->_lock_chainObserverContainers;
  }
  -[NSMutableSet addObject:](lock_chainObserverContainers, "addObject:", v10);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p>"), v9, v9);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __59__BKSHIDEventObserver_addObservingClient_forChainObserver___block_invoke;
  v38[3] = &unk_1E1EA1BF8;
  v38[4] = self;
  v39 = v10;
  v19 = v10;
  +[BKSSimplerAssertion assertionWithDescription:invalidationBlock:](BKSSimplerAssertion, "assertionWithDescription:invalidationBlock:", v18, v38);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  -[BKSHIDEventObserver _lock_resetChainObserverPredicates](self, "_lock_resetChainObserverPredicates");
  os_unfair_lock_unlock(&self->_lock);

  return v20;
}

- (void)_lock_resetChainObserverPredicates
{
  NSMutableSet *v3;
  NSMutableSet *lock_allChainObserverPredicates;
  NSMutableSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableSet *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_assert_owner(&self->_lock);
  -[NSMutableSet removeAllObjects](self->_lock_allChainObserverPredicates, "removeAllObjects");
  if (!self->_lock_allChainObserverPredicates)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    lock_allChainObserverPredicates = self->_lock_allChainObserverPredicates;
    self->_lock_allChainObserverPredicates = v3;

  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->_lock_chainObserverContainers;
  v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = self->_lock_allChainObserverPredicates;
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v9), "requestedChainIdentity", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableSet addObject:](v10, "addObject:", v11);

        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  -[BSServiceConnection remoteTarget](self->_connection, "remoteTarget");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet allObjects](self->_lock_allChainObserverPredicates, "allObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObservesDeferringChainIdentities:", v13);

}

- (void)_lock_enableObservation
{
  void *v3;
  NSSet *v4;
  NSSet *lock_deferringObservations;
  id v6;

  os_unfair_lock_assert_owner(&self->_lock);
  -[BSServiceConnection remoteTarget](self->_connection, "remoteTarget");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObservesDeferringResolutions:", MEMORY[0x1E0C9AAB0]);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v4 = (NSSet *)v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v4 = (NSSet *)objc_claimAutoreleasedReturnValue();
  }
  lock_deferringObservations = self->_lock_deferringObservations;
  self->_lock_deferringObservations = v4;

}

- (void)_lock_disableObservation
{
  void *v3;
  id v4;
  NSSet *lock_deferringObservations;

  os_unfair_lock_assert_owner(&self->_lock);
  -[BSServiceConnection remoteTarget](self->_connection, "remoteTarget");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "setObservesDeferringResolutions:", MEMORY[0x1E0C9AAA0]);

  lock_deferringObservations = self->_lock_deferringObservations;
  self->_lock_deferringObservations = 0;

}

- (void)didUpdateDeferringObservations:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;
  NSSet *v7;
  NSSet *lock_deferringObservations;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  if ((BSEqualObjects() & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    v7 = (NSSet *)objc_msgSend(v4, "copy");
    lock_deferringObservations = self->_lock_deferringObservations;
    self->_lock_deferringObservations = v7;

    objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", -[NSMapTable count](self->_lock_deferringAssertionsToObservers, "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    -[NSMapTable objectEnumerator](self->_lock_deferringAssertionsToObservers, "objectEnumerator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v24;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v24 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(v6, "addObject:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v13++));
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v11);
    }

  }
  os_unfair_lock_unlock(p_lock);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v14 = v6;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v20;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v20 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v18++), "deferringResolutionsChanged", (_QWORD)v19);
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v16);
  }

}

- (void)didUpdateDeferringChains:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  NSMutableDictionary *v16;
  NSMutableDictionary *lock_identityToChainMatches;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v7 = (void *)-[NSMutableDictionary mutableCopy](self->_lock_identityToChainMatches, "mutableCopy");
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v38 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        objc_msgSend(v13, "identity");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKey:", v13, v14);

        objc_msgSend(v13, "identity");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "removeObjectForKey:", v15);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v10);
  }
  v32 = v8;

  v16 = (NSMutableDictionary *)objc_msgSend(v6, "copy");
  lock_identityToChainMatches = self->_lock_identityToChainMatches;
  self->_lock_identityToChainMatches = v16;

  v18 = (void *)-[NSMutableSet copy](self->_lock_chainObserverContainers, "copy");
  os_unfair_lock_unlock(p_lock);
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v19 = v18;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v34;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v34 != v22)
          objc_enumerationMutation(v19);
        v24 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * j);
        objc_msgSend(v24, "requestedChainIdentity");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKey:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (v26)
        {
          objc_msgSend(v24, "observingClient");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "observerInterface");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "observer:deliveryChainDidUpdate:", v28, 0);

        }
        objc_msgSend(v6, "objectForKey:", v25);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (v29)
        {
          objc_msgSend(v24, "observingClient");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "observerInterface");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "observer:deliveryChainDidUpdate:", v31, v29);

        }
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    }
    while (v21);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_lock_allChainObserverPredicates, 0);
  objc_storeStrong((id *)&self->_lock_identityToChainMatches, 0);
  objc_storeStrong((id *)&self->_lock_chainObserverContainers, 0);
  objc_storeStrong((id *)&self->_lock_deferringObservations, 0);
  objc_storeStrong((id *)&self->_lock_deferringAssertionsToObservers, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
}

void __59__BKSHIDEventObserver_addObservingClient_forChainObserver___block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObject:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_lock_resetChainObserverPredicates");
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));
}

void __44__BKSHIDEventObserver_addDeferringObserver___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  os_unfair_lock_assert_not_owner((const os_unfair_lock *)(*(_QWORD *)(a1 + 32) + 16));
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKey:", v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObjectForKey:", v7);
    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "count"))
    {
      objc_msgSend(*(id *)(a1 + 32), "_lock_disableObservation");
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(void **)(v5 + 32);
      *(_QWORD *)(v5 + 32) = v4;

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));

}

void __28__BKSHIDEventObserver__init__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *);
  void *v11;
  id v12;
  id v13;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0D017E0], "protocolForProtocol:", &unk_1EDF5E9A8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D017E0], "protocolForProtocol:", &unk_1EDF66200);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D03430], "interfaceWithIdentifier:", CFSTR("BKHIDEventDeliveryObserver"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setServer:", v5);
  objc_msgSend(v6, "setClient:", v4);
  objc_msgSend(v3, "setInterface:", v6);
  objc_msgSend(v3, "setInterfaceTarget:", *(_QWORD *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0D03478], "userInitiated");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServiceQuality:", v7);

  objc_msgSend(v3, "setTargetQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __28__BKSHIDEventObserver__init__block_invoke_2;
  v11 = &unk_1E1EA0320;
  objc_copyWeak(&v13, (id *)(a1 + 40));
  v12 = *(id *)(a1 + 32);
  objc_msgSend(v3, "setInterruptionHandler:", &v8);
  objc_msgSend(v3, "setInvalidationHandler:", &__block_literal_global_95, v8, v9, v10, v11);

  objc_destroyWeak(&v13);
}

void __28__BKSHIDEventObserver__init__block_invoke_2(uint64_t a1, void *a2)
{
  const os_unfair_lock *WeakRetained;
  os_unfair_lock *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  WeakRetained = (const os_unfair_lock *)objc_loadWeakRetained((id *)(a1 + 40));
  v4 = (os_unfair_lock *)WeakRetained;
  if (WeakRetained)
  {
    os_unfair_lock_assert_not_owner(WeakRetained + 4);
    os_unfair_lock_lock(v4 + 4);
    objc_msgSend(v7, "activate");
    if (objc_msgSend(*(id *)&v4[6]._os_unfair_lock_opaque, "count"))
      -[os_unfair_lock _lock_enableObservation](v4, "_lock_enableObservation");
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "count"))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "remoteTarget");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "allObjects");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObservesDeferringChainIdentities:", v6);

    }
    os_unfair_lock_unlock(v4 + 4);
  }

}

void __28__BKSHIDEventObserver__init__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint8_t v4[16];

  v2 = a2;
  BKLogEventDelivery();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v4 = 0;
    _os_log_error_impl(&dword_18A0F0000, v3, OS_LOG_TYPE_ERROR, "BKSHIDEventObserver invalidated - backboardd must have unloaded, exiting…", v4, 2u);
  }

  exit(0);
}

+ (BKSHIDEventObserver)sharedInstance
{
  if (sharedInstance_onceToken_2933 != -1)
    dispatch_once(&sharedInstance_onceToken_2933, &__block_literal_global_2934);
  return (BKSHIDEventObserver *)(id)sharedInstance___instance;
}

void __37__BKSHIDEventObserver_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[BKSHIDEventObserver _init]([BKSHIDEventObserver alloc], "_init");
  v1 = (void *)sharedInstance___instance;
  sharedInstance___instance = (uint64_t)v0;

}

@end
