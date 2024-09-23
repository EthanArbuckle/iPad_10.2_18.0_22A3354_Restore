@implementation _NSKeyValueDebugging

- (void)object:(void *)a3 willAddObserver:(void *)a4 forKeyPath:(uint64_t)a5 context:
{
  _NSKeyValueObjectBox *v10;
  id *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _NSKeyValueDebuggingDeallocSentinel *v16;
  _QWORD v17[6];
  _QWORD v18[7];
  objc_super v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v10 = [_NSKeyValueObjectBox alloc];
    if (v10)
    {
      v19.receiver = v10;
      v19.super_class = (Class)_NSKeyValueObjectBox;
      v11 = (id *)-[os_unfair_lock_s init](&v19, sel_init);
      if (v11)
      {
        if ((objc_opt_respondsToSelector() & 1) != 0
          && (objc_msgSend(a3, sel_allowsWeakReference) & 1) == 0)
        {

        }
        else
        {
          objc_storeWeak(v11 + 1, a3);
          v11[2] = a3;
          v11[3] = object_getClass(a3);
          v12 = -[_NSKeyValueObjectAndKeyPair initWithObject:key:context:]([_NSKeyValueObjectAndKeyPair alloc], a2, a4, a5);
          v13 = MEMORY[0x1E0C809B0];
          v18[0] = MEMORY[0x1E0C809B0];
          v18[1] = 3221225472;
          v18[2] = __66___NSKeyValueDebugging_object_willAddObserver_forKeyPath_context___block_invoke;
          v18[3] = &unk_1E0F51588;
          v18[4] = a1;
          v18[5] = v11;
          v18[6] = v12;
          os_unfair_lock_lock(a1 + 2);
          __66___NSKeyValueDebugging_object_willAddObserver_forKeyPath_context___block_invoke(v18);
          os_unfair_lock_unlock(a1 + 2);
          v17[0] = v13;
          v17[1] = 3221225472;
          v17[2] = __66___NSKeyValueDebugging_object_willAddObserver_forKeyPath_context___block_invoke_2;
          v17[3] = &unk_1E0F51620;
          v17[4] = a1;
          v17[5] = v11;
          v14 = objc_opt_self();
          v15 = (void *)MEMORY[0x186DA8F78](v14);
          +[_NSKeyValueDebuggingDeallocSentinel _invalidateSentinelWithKey:fromObject:](_NSKeyValueDebuggingDeallocSentinel, "_invalidateSentinelWithKey:fromObject:", &_NSKeyValueDebuggingObserverDeallocBeforeRemovalKey, a3);
          v16 = -[_NSKeyValueDebuggingDeallocSentinel initWithObjectPointer:callbackBlock:]([_NSKeyValueDebuggingDeallocSentinel alloc], "initWithObjectPointer:callbackBlock:", a3, v17);
          objc_setAssociatedObject(a3, &_NSKeyValueDebuggingObserverDeallocBeforeRemovalKey, v16, (void *)0x301);

          objc_autoreleasePoolPop(v15);
        }
      }
    }
  }
}

- (void)object:(void *)a3 willRemoveObserver:(uint64_t)a4 forKeyPath:(uint64_t)a5 context:
{
  _QWORD v9[9];

  v9[8] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend((id)objc_opt_self(), "_invalidateSentinelWithKey:fromObject:", &_NSKeyValueDebuggingObserverDeallocBeforeRemovalKey, a3);
    objc_setAssociatedObject(a3, &_NSKeyValueDebuggingObserverDeallocBeforeRemovalKey, 0, (void *)0x301);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __69___NSKeyValueDebugging_object_willRemoveObserver_forKeyPath_context___block_invoke;
    v9[3] = &unk_1E0F51670;
    v9[4] = a1;
    v9[5] = a3;
    v9[6] = a2;
    v9[7] = a5;
    os_unfair_lock_lock(a1 + 2);
    __69___NSKeyValueDebugging_object_willRemoveObserver_forKeyPath_context___block_invoke((uint64_t)v9);
    os_unfair_lock_unlock(a1 + 2);
  }
}

- (_NSKeyValueDebugging)init
{
  _NSKeyValueDebugging *v2;
  _NSKeyValueDebugging *v3;
  NSTimer *v4;
  uint64_t v5;
  _QWORD v7[5];
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)_NSKeyValueDebugging;
  v2 = -[_NSKeyValueDebugging init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v2->_willDidCountTable = (NSMutableDictionary *)objc_opt_new();
    v3->_consistencyTable = (NSMutableDictionary *)objc_opt_new();
    v3->_observedKeyPathsByObserver = (NSMutableDictionary *)objc_opt_new();
    v4 = (NSTimer *)(id)objc_msgSend(MEMORY[0x1E0C99E88], "timerWithTimeInterval:target:selector:userInfo:repeats:", v3, sel__checkConsistency, 0, 1, 1.0);
    v5 = MEMORY[0x1E0C809B0];
    v3->_consistencyCheckTimer = v4;
    v7[0] = v5;
    v7[1] = 3221225472;
    v7[2] = __28___NSKeyValueDebugging_init__block_invoke;
    v7[3] = &unk_1E0F4D2D8;
    v7[4] = v4;
    dispatch_async(MEMORY[0x1E0C80D38], v7);
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  -[NSTimer invalidate](self->_consistencyCheckTimer, "invalidate");

  v3.receiver = self;
  v3.super_class = (Class)_NSKeyValueDebugging;
  -[_NSKeyValueDebugging dealloc](&v3, sel_dealloc);
}

- (void)_clearWillDidTable
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[6];
  _BYTE v8[128];
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42___NSKeyValueDebugging__clearWillDidTable__block_invoke;
  v7[3] = &unk_1E0F4C650;
  v7[4] = self;
  v7[5] = v3;
  os_unfair_lock_lock(&self->_lock);
  __42___NSKeyValueDebugging__clearWillDidTable__block_invoke((uint64_t)v7);
  os_unfair_lock_unlock(&self->_lock);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v8, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v3);
        -[_NSKeyValueDebugging _checkConsistencyForStatsWhileOutOfLock:forPair:timingDescription:](self, "_checkConsistencyForStatsWhileOutOfLock:forPair:timingDescription:", objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v6)), *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v6), CFSTR("at the next run loop spin after the 'did'"));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v8, 16);
    }
    while (v4);
  }

}

- (void)_checkConsistencyForStatsWhileOutOfLock:(id)a3 forPair:(id)a4 timingDescription:(id)a5
{
  NSObject *v9;
  _Unwind_Exception *v10;
  _Unwind_Exception *v11;
  _Unwind_Exception *v12;
  _Unwind_Exception *v13;
  _Unwind_Exception *v14;
  void *v15;
  NSObject *v16;
  const char *v17;
  NSObject *v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  id v22;
  __int16 v23;
  _Unwind_Exception *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (_MergedGlobals_132)
    NSLog((NSString *)CFSTR("<KVODebugging>: %@ -- Checking for consistency now (%@)."), a2, a4, a5);
  if (qword_1ECD0A2E0 != -1)
    dispatch_once(&qword_1ECD0A2E0, &__block_literal_global_143);
  v9 = qword_1ECD0A2D8;
  if (os_log_type_enabled((os_log_t)qword_1ECD0A2D8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v20 = a4;
    v21 = 2114;
    v22 = a5;
    _os_log_impl(&dword_1817D9000, v9, OS_LOG_TYPE_INFO, "%{public}@ -- Checking for consistency now (%{public}@).", buf, 0x16u);
  }
  if (a3)
  {
    ++*((_QWORD *)a3 + 5);
    v10 = -[_NSKeyValueObjectAndKeyPair newCurrentValue](*((_Unwind_Exception **)a3 + 1));
    if (!v10)
      goto LABEL_26;
    v11 = (_Unwind_Exception *)(id)objc_msgSend(a3, "currentValue");
    v12 = v11;
    if (*((_QWORD *)a3 + 4))
    {
      if ((-[_Unwind_Exception isEqual:](v11, "isEqual:", v10) & 1) != 0)
      {
LABEL_11:

        goto LABEL_26;
      }
    }
    else if (v11 == v10)
    {
      goto LABEL_11;
    }
    v13 = v12;
    v14 = v10;
    objc_msgSend(a3, "setCurrentValue:", v10);

    if (v12 && (v15 = _NSKeyValueRetainedObservationInfoForObject(v12, 0)) != 0)
    {

      if (_MergedGlobals_132)
        NSLog((NSString *)CFSTR("<KVODebugging> KVO ISSUE: %@ -- MAY CAUSE CRASHES -- The value for this key pair seems to have changed outside of a will/did pair AND IT IS OBSERVED BY OTHER OBJECTS!!!; last observed value was '%@', current value is '%@'"),
          a4,
          v13,
          v14);
      if (qword_1ECD0A2E0 != -1)
        dispatch_once(&qword_1ECD0A2E0, &__block_literal_global_143);
      v16 = qword_1ECD0A2D8;
      if (os_log_type_enabled((os_log_t)qword_1ECD0A2D8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        v20 = a4;
        v21 = 2114;
        v22 = v13;
        v23 = 2114;
        v24 = v14;
        v17 = "KVO ISSUE: %{public}@ -- MAY CAUSE CRASHES -- The value for this key pair seems to have changed outside of"
              " a will/did pair AND IT IS OBSERVED BY OTHER OBJECTS!!!; last observed value was '%{public}@', current val"
              "ue is '%{public}@'";
LABEL_40:
        _os_log_error_impl(&dword_1817D9000, v16, OS_LOG_TYPE_ERROR, v17, buf, 0x20u);
      }
    }
    else
    {
      if (_MergedGlobals_132)
        NSLog((NSString *)CFSTR("<KVODebugging> KVO ISSUE: %@ -- The value for this key pair seems to have changed outside of a will/did pair, which makes this key unsafe to observe within a longer key path; last observed value was '%@', current value is '%@'"),
          a4,
          v13,
          v14);
      if (qword_1ECD0A2E0 != -1)
        dispatch_once(&qword_1ECD0A2E0, &__block_literal_global_143);
      v16 = qword_1ECD0A2D8;
      if (os_log_type_enabled((os_log_t)qword_1ECD0A2D8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        v20 = a4;
        v21 = 2114;
        v22 = v13;
        v23 = 2114;
        v24 = v14;
        v17 = "KVO ISSUE: %{public}@ -- The value for this key pair seems to have changed outside of a will/did pair, whi"
              "ch makes this key unsafe to observe within a longer key path; last observed value was '%{public}@', curren"
              "t value is '%{public}@'";
        goto LABEL_40;
      }
    }
LABEL_26:
    if ((!*((_BYTE *)a3 + 16) || objc_msgSend(a3, "currentValue")) && *((uint64_t *)a3 + 5) < 4)
      return;
  }
  if (_MergedGlobals_132)
    NSLog((NSString *)CFSTR("<KVODebugging>: %@ -- No longer tracking for consistency changes."), a4);
  if (qword_1ECD0A2E0 != -1)
    dispatch_once(&qword_1ECD0A2E0, &__block_literal_global_143);
  v18 = qword_1ECD0A2D8;
  if (os_log_type_enabled((os_log_t)qword_1ECD0A2D8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v20 = a4;
    _os_log_impl(&dword_1817D9000, v18, OS_LOG_TYPE_INFO, "%{public}@ -- No longer tracking for consistency changes.", buf, 0xCu);
  }
  os_unfair_lock_lock(&self->_lock);
  if ((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_consistencyTable, "objectForKeyedSubscript:", a4) == a3)
    -[NSMutableDictionary removeObjectForKey:](self->_consistencyTable, "removeObjectForKey:", a4);
  os_unfair_lock_unlock(&self->_lock);
}

- (void)_checkConsistency
{
  os_unfair_lock_s *p_lock;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  uint64_t v14;
  _BYTE v15[128];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v9 = 0;
  v10 = &v9;
  v11 = 0x3052000000;
  v12 = __Block_byref_object_copy__18;
  v13 = __Block_byref_object_dispose__18;
  v14 = 0;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = -[NSMutableDictionary copy](self->_consistencyTable, "copy");
  v10[5] = v4;
  os_unfair_lock_unlock(p_lock);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = (void *)v10[5];
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v5);
        -[_NSKeyValueDebugging _checkConsistencyForStatsWhileOutOfLock:forPair:timingDescription:](self, "_checkConsistencyForStatsWhileOutOfLock:forPair:timingDescription:", objc_msgSend((id)v10[5], "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i)), *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i), CFSTR("periodically for a short time every second after the 'did'"));
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v15, 16);
    }
    while (v6);
  }

  _Block_object_dispose(&v9, 8);
}

- (void)_object:(id)a3 trackChangeForKeyOrKeys:(id)a4 operation:(int64_t)a5
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  _QWORD v11[2];
  void (*v12)(uint64_t, void *);
  void *v13;
  id v14;
  _NSKeyValueDebugging *v15;
  int64_t v16;
  _BYTE v17[128];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v12 = __66___NSKeyValueDebugging__object_trackChangeForKeyOrKeys_operation___block_invoke;
  v13 = &unk_1E0F515D8;
  v15 = self;
  v16 = a5;
  v14 = a3;
  if (objc_msgSend(a4, "conformsToProtocol:", &unk_1EDCCD1E0))
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v6 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v18, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v19 != v8)
            objc_enumerationMutation(a4);
          v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          if (_NSIsNSString())
            v12((uint64_t)v11, v10);
        }
        v7 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v18, v17, 16);
      }
      while (v7);
    }
  }
  else if (_NSIsNSString())
  {
    __66___NSKeyValueDebugging__object_trackChangeForKeyOrKeys_operation___block_invoke((uint64_t)v11, a4);
  }
}

@end
