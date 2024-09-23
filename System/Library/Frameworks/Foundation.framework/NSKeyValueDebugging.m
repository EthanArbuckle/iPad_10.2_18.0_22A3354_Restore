@implementation NSKeyValueDebugging

uint64_t __28___NSKeyValueDebugging_init__block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
  return objc_msgSend(v2, "addTimer:forMode:", *(_QWORD *)(a1 + 32), *MEMORY[0x1E0C99748]);
}

uint64_t __42___NSKeyValueDebugging__clearWillDidTable__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint8_t buf[4];
  uint64_t v12;
  _BYTE v13[128];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) = 0;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v15;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v15 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v6);
        v8 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKeyedSubscript:", v7);
        if (v8 && *(uint64_t *)(v8 + 8) >= 1)
        {
          if (_MergedGlobals_132)
            NSLog((NSString *)CFSTR("<KVODebugging> KVO ISSUE: %@ -- Has called 'will's but did not pair with enough 'did's during the same run loop spin"), v7);
          if (qword_1ECD0A2E0 != -1)
            dispatch_once(&qword_1ECD0A2E0, &__block_literal_global_143);
          v9 = qword_1ECD0A2D8;
          if (os_log_type_enabled((os_log_t)qword_1ECD0A2D8, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v12 = v7;
            _os_log_error_impl(&dword_1817D9000, v9, OS_LOG_TYPE_ERROR, "KVO ISSUE: , key: %{public}@ -- Has called 'will's but did not pair with enough 'did's during the same run loop spin", buf, 0xCu);
          }
        }
        objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", v7), v7);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
    }
    while (v4);
  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeAllObjects");
}

void __66___NSKeyValueDebugging__object_trackChangeForKeyOrKeys_operation___block_invoke(uint64_t a1, void *a2)
{
  _NSKeyValueObjectAndKeyPair *v4;
  id v5;
  void *v6;
  uint64_t v7;
  const __CFString *v8;
  const __CFString *v9;
  NSObject *v10;
  id v11;
  os_unfair_lock_s *v12;
  uint64_t v13;
  os_unfair_lock_s *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  _Unwind_Exception *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  NSThread *v23;
  NSArray *v24;
  NSThread *v25;
  NSArray *v26;
  NSThread *v27;
  NSThread *v28;
  NSArray *v29;
  _QWORD v30[10];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  void *v34;
  __int16 v35;
  char v36;
  uint8_t v37[4];
  void *v38;
  __int16 v39;
  NSThread *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  NSArray *v44;
  _BYTE v45[128];
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE buf[24];
  void (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  uint64_t v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v4 = [_NSKeyValueObjectAndKeyPair alloc];
  if (v4)
  {
    v5 = -[_NSKeyValueObjectAndKeyPair initWithObject:key:context:](v4, *(void **)(a1 + 32), a2, 0);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)(a1 + 48);
      v8 = CFSTR("???");
      if (v7 == 1)
        v8 = CFSTR("Did change");
      if (v7)
        v9 = v8;
      else
        v9 = CFSTR("Will change");
      if (_MergedGlobals_132)
        NSLog((NSString *)CFSTR("<KVODebugging> %@ -- Note: %@."), v5, v9);
      if (qword_1ECD0A2E0 != -1)
        dispatch_once(&qword_1ECD0A2E0, &__block_literal_global_143);
      v10 = qword_1ECD0A2D8;
      if (os_log_type_enabled((os_log_t)qword_1ECD0A2D8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v6;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v9;
        _os_log_impl(&dword_1817D9000, v10, OS_LOG_TYPE_INFO, "%{public}@ -- Note: %{public}@.", buf, 0x16u);
      }
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3052000000;
      v51 = __Block_byref_object_copy__18;
      v52 = __Block_byref_object_dispose__18;
      v53 = 0;
      v31 = 0;
      v32 = &v31;
      v33 = 0x2810000000;
      v34 = &unk_1823C230D;
      v35 = 0;
      v36 = 0;
      v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v12 = *(os_unfair_lock_s **)(a1 + 40);
      v13 = *(_QWORD *)(a1 + 48);
      v14 = v12 + 2;
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __66___NSKeyValueDebugging__object_trackChangeForKeyOrKeys_operation___block_invoke_82;
      v30[3] = &unk_1E0F515B0;
      v30[4] = v12;
      v30[5] = v6;
      v30[8] = buf;
      v30[9] = v13;
      v30[6] = v11;
      v30[7] = &v31;
      os_unfair_lock_lock(v12 + 2);
      __66___NSKeyValueDebugging__object_trackChangeForKeyOrKeys_operation___block_invoke_82((uint64_t)v30);
      os_unfair_lock_unlock(v14);
      v48 = 0u;
      v49 = 0u;
      v46 = 0u;
      v47 = 0u;
      v15 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v46, v45, 16);
      if (v15)
      {
        v16 = *(_QWORD *)v47;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v47 != v16)
              objc_enumerationMutation(v11);
            v18 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * i);
            if (v18 && !*(_BYTE *)(v18 + 16))
            {
              v19 = -[_NSKeyValueObjectAndKeyPair newCurrentValue](*(_Unwind_Exception **)(v18 + 8));
              *(_BYTE *)(v18 + 16) = 1;
              objc_msgSend((id)v18, "setCurrentValue:", v19);

            }
          }
          v15 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v46, v45, 16);
        }
        while (v15);
      }
      if (*((_BYTE *)v32 + 32))
      {
        if (_MergedGlobals_132)
          NSLog((NSString *)CFSTR("KVO ISSUE: %@ -- Has become reentrant ('will' called after 'did') -- in thread: %@, backtrace: %@"), v6, +[NSThread currentThread](NSThread, "currentThread"), +[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        if (qword_1ECD0A2E0 != -1)
          dispatch_once(&qword_1ECD0A2E0, &__block_literal_global_143);
        v20 = qword_1ECD0A2D8;
        if (os_log_type_enabled((os_log_t)qword_1ECD0A2D8, OS_LOG_TYPE_ERROR))
        {
          v23 = +[NSThread currentThread](NSThread, "currentThread");
          v24 = +[NSThread callStackSymbols](NSThread, "callStackSymbols");
          *(_DWORD *)v37 = 138543874;
          v38 = v6;
          v39 = 2114;
          v40 = v23;
          v41 = 2114;
          v42 = v24;
          _os_log_error_impl(&dword_1817D9000, v20, OS_LOG_TYPE_ERROR, "KVO ISSUE: %{public}@ -- Has become reentrant ('will' called after 'did') -- in thread: %{public}@, backtrace: %{public}@", v37, 0x20u);
        }
      }
      if (*((_BYTE *)v32 + 33))
      {
        if (_MergedGlobals_132)
          NSLog((NSString *)CFSTR("KVO ISSUE: %@ -- Has called 'did' more times than 'will' -- in thread: %@, backtrace: %@"), v6, +[NSThread currentThread](NSThread, "currentThread"), +[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        if (qword_1ECD0A2E0 != -1)
          dispatch_once(&qword_1ECD0A2E0, &__block_literal_global_143);
        v21 = qword_1ECD0A2D8;
        if (os_log_type_enabled((os_log_t)qword_1ECD0A2D8, OS_LOG_TYPE_ERROR))
        {
          v25 = +[NSThread currentThread](NSThread, "currentThread");
          v26 = +[NSThread callStackSymbols](NSThread, "callStackSymbols");
          *(_DWORD *)v37 = 138543874;
          v38 = v6;
          v39 = 2114;
          v40 = v25;
          v41 = 2114;
          v42 = v26;
          _os_log_error_impl(&dword_1817D9000, v21, OS_LOG_TYPE_ERROR, "KVO ISSUE: %{public}@ -- Has called 'did' more times than 'will' -- in thread: %{public}@, backtrace: %{public}@", v37, 0x20u);
        }
      }
      if (*((_BYTE *)v32 + 34))
      {
        if (_MergedGlobals_132)
          NSLog((NSString *)CFSTR("KVO ISSUE: %@ -- Has called 'will' or 'did' for the same key in multiple threads, first will/did recorded in thread %@ -- in thread: %@, backtrace: %@"), v6, *(_QWORD *)(*(_QWORD *)&buf[8] + 40), +[NSThread currentThread](NSThread, "currentThread"), +[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        if (qword_1ECD0A2E0 != -1)
          dispatch_once(&qword_1ECD0A2E0, &__block_literal_global_143);
        v22 = qword_1ECD0A2D8;
        if (os_log_type_enabled((os_log_t)qword_1ECD0A2D8, OS_LOG_TYPE_ERROR))
        {
          v27 = *(NSThread **)(*(_QWORD *)&buf[8] + 40);
          v28 = +[NSThread currentThread](NSThread, "currentThread");
          v29 = +[NSThread callStackSymbols](NSThread, "callStackSymbols");
          *(_DWORD *)v37 = 138544130;
          v38 = v6;
          v39 = 2114;
          v40 = v27;
          v41 = 2114;
          v42 = v28;
          v43 = 2114;
          v44 = v29;
          _os_log_error_impl(&dword_1817D9000, v22, OS_LOG_TYPE_ERROR, "KVO ISSUE: %{public}@ -- Has called 'will' or 'did' for the same key in multiple threads, first will/did recorded in thread %{public}@ -- in thread: %{public}@, backtrace: %{public}@", v37, 0x2Au);
        }
      }

      _Block_object_dispose(&v31, 8);
      _Block_object_dispose(buf, 8);
    }
  }
}

void __66___NSKeyValueDebugging__object_trackChangeForKeyOrKeys_operation___block_invoke_82(uint64_t a1)
{
  _NSKeyValueDidWillStats *v2;
  _NSKeyValueDidWillStats *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t count;
  BOOL v7;
  char v8;
  BOOL v9;
  BOOL v10;
  char v11;
  int v12;
  uint64_t v13;
  NSThread *originalThread;
  _NSKeyValueReturnedValueConsistencyStats *v15;
  void *v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD v19[5];
  objc_super dest;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = (_NSKeyValueDidWillStats *)(id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = v2;
  if (!v2)
    v3 = objc_alloc_init(_NSKeyValueDidWillStats);
  v4 = *(_QWORD *)(a1 + 72);
  if (v4 == 1)
  {
    if (v3)
    {
      -[_NSKeyValueDidWillStats _recordThread](v3, "_recordThread");
      *(_WORD *)&v3->_hasDecreased = 1;
      count = v3->_count;
      v7 = count < 1;
      v5 = count - 1;
      v3->_count = v5;
      v8 = v7;
      v3->_detectedIssues.hasExcessiveDids = v8;
      goto LABEL_14;
    }
  }
  else if (v4)
  {
    if (v3)
    {
      v5 = v3->_count;
      goto LABEL_14;
    }
  }
  else if (v3)
  {
    -[_NSKeyValueDidWillStats _recordThread](v3, "_recordThread");
    v3->_detectedIssues.hasBecomeReentrant = v3->_hasDecreased;
    v3->_hasDecreased = 0;
    v5 = v3->_count + 1;
    v3->_count = v5;
LABEL_14:
    if (v2)
      v9 = 1;
    else
      v9 = v5 == 0;
    if (v9)
    {
      if (v2)
        v10 = v5 == 0;
      else
        v10 = 0;
      if (v10)
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
    }
    else
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setObject:forKeyedSubscript:", v3, *(_QWORD *)(a1 + 40));
    }
    objc_copyStruct(&dest, &v3->_detectedIssues, 3, 1, 0);
    v11 = 0;
    v12 = LOWORD(dest.receiver) | (BYTE2(dest.receiver) << 16);
    goto LABEL_26;
  }
  if (v2)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  v12 = 0;
  v11 = 1;
LABEL_26:
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  *(_BYTE *)(v13 + 34) = BYTE2(v12);
  *(_WORD *)(v13 + 32) = v12;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 34))
  {
    if ((v11 & 1) != 0)
      originalThread = 0;
    else
      originalThread = v3->_originalThread;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) = originalThread;
  }
  if (*(_QWORD *)(a1 + 72))
  {
    v15 = [_NSKeyValueReturnedValueConsistencyStats alloc];
    if (v15)
    {
      v16 = *(void **)(a1 + 40);
      dest.receiver = v15;
      dest.super_class = (Class)_NSKeyValueReturnedValueConsistencyStats;
      v17 = objc_msgSendSuper2(&dest, sel_init);
      if (v17)
        v17[1] = objc_msgSend(v16, "copy");
    }
    else
    {
      v17 = 0;
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setObject:forKeyedSubscript:", v17, *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v17);

  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  }

  v18 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v18 + 24))
  {
    *(_BYTE *)(v18 + 24) = 1;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __66___NSKeyValueDebugging__object_trackChangeForKeyOrKeys_operation___block_invoke_2;
    v19[3] = &unk_1E0F4D2D8;
    v19[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], v19);
  }
}

uint64_t __66___NSKeyValueDebugging__object_trackChangeForKeyOrKeys_operation___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performSelector:withObject:afterDelay:", sel__clearWillDidTable, 0, 0.0);
}

void __66___NSKeyValueDebugging_object_willAddObserver_forKeyPath_context___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(*(id *)(a1[4] + 48), "objectForKeyedSubscript:", a1[5]);
  if (v2)
  {
    objc_msgSend(v2, "addObject:", a1[6]);
  }
  else
  {
    v4[0] = a1[6];
    v3 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1), "mutableCopy");
    objc_msgSend(*(id *)(a1[4] + 48), "setObject:forKeyedSubscript:", v3, a1[5]);

  }
}

void __66___NSKeyValueDebugging_object_willAddObserver_forKeyPath_context___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  uint64_t v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  NSArray *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  v11 = &v10;
  v12 = 0x3052000000;
  v13 = __Block_byref_object_copy__18;
  v14 = __Block_byref_object_dispose__18;
  v15 = 0;
  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  os_unfair_lock_lock((os_unfair_lock_t)(v3 + 8));
  v4 = (id)objc_msgSend(*(id *)(v3 + 48), "objectForKeyedSubscript:", v2);
  v11[5] = (uint64_t)v4;
  objc_msgSend(*(id *)(v3 + 48), "removeObjectForKey:", v2);
  os_unfair_lock_unlock((os_unfair_lock_t)(v3 + 8));
  v5 = objc_msgSend((id)v11[5], "indexesOfObjectsPassingTest:", &__block_literal_global_97);
  objc_msgSend((id)v11[5], "removeObjectsAtIndexes:", v5);
  if (objc_msgSend((id)v11[5], "count"))
  {
    if (_MergedGlobals_132)
      NSLog((NSString *)CFSTR("<KVODebugging> KVO ISSUE -- MAY CAUSE CRASHES -- An observer was deallocated before it removed itself from its outstanding observations, while those objects remain active in memory. Observer: %@, Outstanding observations: %@, Deallocated at: %@"), *(_QWORD *)(a1 + 40), v11[5], +[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    if (qword_1ECD0A2E0 != -1)
      dispatch_once(&qword_1ECD0A2E0, &__block_literal_global_143);
    v6 = qword_1ECD0A2D8;
    if (os_log_type_enabled((os_log_t)qword_1ECD0A2D8, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 40);
      v8 = v11[5];
      v9 = +[NSThread callStackSymbols](NSThread, "callStackSymbols");
      *(_DWORD *)buf = 138543874;
      v17 = v7;
      v18 = 2114;
      v19 = v8;
      v20 = 2114;
      v21 = v9;
      _os_log_error_impl(&dword_1817D9000, v6, OS_LOG_TYPE_ERROR, "KVO ISSUE -- MAY CAUSE CRASHES -- An observer was deallocated before it removed itself from its outstanding observations, while those objects remain active in memory. Observer: %{public}@, Outstanding observations: %{public}@, Deallocated at: %{public}@", buf, 0x20u);
    }
  }
  _Block_object_dispose(&v10, 8);
}

BOOL __66___NSKeyValueDebugging_object_willAddObserver_forKeyPath_context___block_invoke_4(uint64_t a1, _BOOL8 a2)
{
  return -[_NSKeyValueObjectAndKeyPair objectWasDeallocated](a2);
}

uint64_t __69___NSKeyValueDebugging_object_willRemoveObserver_forKeyPath_context___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unint64_t v11;
  _QWORD v12[4];
  __int128 v13;
  _BYTE v14[128];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = (id)objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "allKeys"), "copy");
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
  if (result)
  {
    v4 = result;
    v5 = *(_QWORD *)v16;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v16 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v6);
        if (-[_NSKeyValueObjectAndKeyPair objectWasDeallocated](v7))
        {
LABEL_7:
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeObjectForKey:", v7);
          goto LABEL_13;
        }
        if (v7)
          v8 = *(_QWORD *)(v7 + 16);
        else
          v8 = 0;
        if (v8 == *(_QWORD *)(a1 + 40))
        {
          v9 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "objectForKeyedSubscript:", v7);
          v12[0] = MEMORY[0x1E0C809B0];
          v12[1] = 3221225472;
          v12[2] = __69___NSKeyValueDebugging_object_willRemoveObserver_forKeyPath_context___block_invoke_2;
          v12[3] = &unk_1E0F51648;
          v13 = *(_OWORD *)(a1 + 48);
          v10 = (void *)objc_msgSend(v9, "indexesOfObjectsPassingTest:", v12);
          v11 = objc_msgSend(v10, "count");
          if (v11 >= objc_msgSend(v9, "count"))
            goto LABEL_7;
          objc_msgSend(v9, "removeObjectsAtIndexes:", v10);
        }
LABEL_13:
        ++v6;
      }
      while (v4 != v6);
      result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
      v4 = result;
    }
    while (result);
  }
  return result;
}

BOOL __69___NSKeyValueDebugging_object_willRemoveObserver_forKeyPath_context___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (-[_NSKeyValueObjectAndKeyPair objectWasDeallocated](a2))
    return 1;
  if (a2)
    v5 = *(_QWORD *)(a2 + 16);
  else
    v5 = 0;
  if (v5 != *(_QWORD *)(a1 + 32))
    return 0;
  v6 = *(_QWORD *)(a1 + 40);
  if (!v6)
    return 1;
  if (a2)
    v7 = *(_QWORD *)(a2 + 32);
  else
    v7 = 0;
  return v6 == v7;
}

@end
