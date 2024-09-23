@implementation BSSharedMemoryStore

- (BSSharedMemoryStore)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BSSharedMemoryStore.m"), 103, CFSTR("init is not allowed on BSSharedMemoryStore"));

  return 0;
}

- (BSSharedMemoryStore)initWithIdentifier:(id)a3 dataClass:(Class)a4
{
  id v7;
  BSSharedMemoryStore *v8;
  BSSharedMemoryStore *v9;
  uint64_t v10;
  NSString *basePath;
  void *v12;
  void *v13;
  void *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *queue;
  BSSharedMemoryStoreData *queue_data;
  void *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  void *v23;
  id v24;
  objc_class *v25;
  void *v26;
  void *v27;
  id v28;
  objc_class *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD block[4];
  BSSharedMemoryStore *v34;
  Class v35;
  objc_super v36;
  uint8_t buf[4];
  id v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  BSSharedMemoryStore *v42;
  __int16 v43;
  const __CFString *v44;
  __int16 v45;
  int v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  NSClassFromString(CFSTR("NSString"));
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v24 = (id)objc_claimAutoreleasedReturnValue();
      v25 = (objc_class *)objc_opt_class();
      NSStringFromClass(v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v38 = v24;
      v39 = 2114;
      v40 = v26;
      v41 = 2048;
      v42 = self;
      v43 = 2114;
      v44 = CFSTR("BSSharedMemoryStore.m");
      v45 = 1024;
      v46 = 108;
      v47 = 2114;
      v48 = v23;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v23), "UTF8String");
    __break(0);
    JUMPOUT(0x18A1D03CCLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v28 = (id)objc_claimAutoreleasedReturnValue();
      v29 = (objc_class *)objc_opt_class();
      NSStringFromClass(v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v38 = v28;
      v39 = 2114;
      v40 = v30;
      v41 = 2048;
      v42 = self;
      v43 = 2114;
      v44 = CFSTR("BSSharedMemoryStore.m");
      v45 = 1024;
      v46 = 108;
      v47 = 2114;
      v48 = v27;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v27), "UTF8String");
    __break(0);
    JUMPOUT(0x18A1D04D0);
  }

  if (objc_msgSend(v7, "length"))
  {
    if (a4)
      goto LABEL_5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BSSharedMemoryStore.m"), 109, CFSTR("identifier is too short : %@"), v7);

    if (a4)
      goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BSSharedMemoryStore.m"), 110, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dataClass"));

LABEL_5:
  v36.receiver = self;
  v36.super_class = (Class)BSSharedMemoryStore;
  v8 = -[BSSharedMemoryStore init](&v36, sel_init);
  v9 = v8;
  if (v8)
  {
    _initializePath((uint64_t)v8->_queue_path.path, v7);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", &v9->_queue_path);
    v10 = objc_claimAutoreleasedReturnValue();
    basePath = v9->_basePath;
    v9->_basePath = (NSString *)v10;

    objc_msgSend(CFSTR("com.apple.baseboard.shm-store:"), "stringByAppendingString:", v9->_basePath);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[BSDispatchQueueAttributes serial](BSDispatchQueueAttributes, "serial");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "serviceClass:", 25);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = BSDispatchQueueCreate(v12, v14);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v15;

    queue_data = v9->_queue_data;
    v9->_queue_data = 0;

    *(_DWORD *)&v9->_queue_lastState = 0x1000000;
    os_unfair_lock_lock((os_unfair_lock_t)&__allShmsLock);
    if (objc_msgSend((id)__allShms, "containsObject:", v9->_basePath))
    {
      os_unfair_lock_unlock((os_unfair_lock_t)&__allShmsLock);
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, CFSTR("BSSharedMemoryStore.m"), 127, CFSTR("%@: competing with another shm for the same buffers"), v9->_basePath);

    }
    else
    {
      if (__allShms)
      {
        objc_msgSend((id)__allShms, "addObject:", v9->_basePath);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", v9->_basePath);
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = (void *)__allShms;
        __allShms = v19;

      }
      os_unfair_lock_unlock((os_unfair_lock_t)&__allShmsLock);
    }
    v9->_queue_invalidated = 0;
    v21 = v9->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __52__BSSharedMemoryStore_initWithIdentifier_dataClass___block_invoke;
    block[3] = &unk_1E1EBEA00;
    v34 = v9;
    v35 = a4;
    dispatch_async(v21, block);

  }
  return v9;
}

void __52__BSSharedMemoryStore_initWithIdentifier_dataClass___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  char *v5;
  void *v6;
  void *v7;
  char v8;
  int v9;
  int v10;
  int v11;
  char v12;
  uint64_t v13;
  char v14;
  NSObject *v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  NSObject *v22;
  os_log_type_t v23;
  uint32_t v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  __int16 v32;
  __int16 v33;
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v33 = 0;
  v3 = a1 + 32;
  v2 = *(_QWORD *)(a1 + 32);
  *(_BYTE *)(v2 + 24 + *(char *)(v2 + 56)) = 49;
  BSShmLoad((char *)(v2 + 24), *(void **)(a1 + 40), (BOOL *)&v33 + 1, &v33);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  v5 = (char *)(*(_QWORD *)v3 + 24);
  v5[*(char *)(*(_QWORD *)v3 + 56)] = 50;
  BSShmLoad(v5, *(void **)(a1 + 40), (BOOL *)&v32 + 1, &v32);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v4 && v6)
  {
    if (HIBYTE(v33) == HIBYTE(v32))
      goto LABEL_12;
LABEL_6:
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 64), v4);
    if (HIBYTE(v33))
      v8 = 3;
    else
      v8 = 1;
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 72) = v8;
    v9 = 1;
    if ((_BYTE)v32)
    {
      v10 = 0;
      goto LABEL_28;
    }
    goto LABEL_34;
  }
  if (v4)
    goto LABEL_6;
  if (!v6)
  {
    v27 = *(_QWORD *)(a1 + 32);
    v28 = *(void **)(v27 + 64);
    *(_QWORD *)(v27 + 64) = 0;

    v12 = 0;
    v9 = 0;
    v11 = 1;
    goto LABEL_15;
  }
LABEL_12:
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 64), v6);
  v11 = 0;
  v9 = 2;
  if (HIBYTE(v32))
    v12 = 4;
  else
    v12 = 2;
LABEL_15:
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 72) = v12;
  if ((_BYTE)v33)
  {
    v13 = *(_QWORD *)(a1 + 32);
    *(_BYTE *)(v13 + 24 + *(char *)(v13 + 56)) = 49;
    BSShmDelete((char *)(v13 + 24), 0);
    if ((_BYTE)v32)
      v14 = v11;
    else
      v14 = 0;
    if ((v14 & 1) == 0)
    {
      if ((v11 & 1) == 0)
        goto LABEL_21;
      goto LABEL_29;
    }
    goto LABEL_27;
  }
  if ((_BYTE)v32)
    v17 = v11;
  else
    v17 = 0;
  if ((v17 & 1) == 0)
  {
    if (v11)
    {
      BSLogSharedMemory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        goto LABEL_37;
      v20 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
      *(_DWORD *)buf = 138412290;
      v35 = v20;
      v21 = "%@: initializing to nil";
      v22 = v15;
      v23 = OS_LOG_TYPE_DEFAULT;
      v24 = 12;
LABEL_36:
      _os_log_impl(&dword_18A184000, v22, v23, v21, buf, v24);
      goto LABEL_37;
    }
LABEL_34:
    BSLogSharedMemory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      goto LABEL_37;
    v25 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
    *(_DWORD *)buf = 138412546;
    v35 = v25;
    v36 = 1024;
    LODWORD(v37) = v9;
    v21 = "%@: restored from buffer %i";
    v22 = v15;
    v23 = OS_LOG_TYPE_INFO;
    v24 = 18;
    goto LABEL_36;
  }
LABEL_27:
  v10 = 1;
LABEL_28:
  v18 = *(_QWORD *)(a1 + 32);
  *(_BYTE *)(v18 + 24 + *(char *)(v18 + 56)) = 50;
  BSShmDelete((char *)(v18 + 24), 0);
  if (!v10)
  {
LABEL_21:
    BSLogSharedMemory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
      *(_DWORD *)buf = 138412546;
      v35 = v16;
      v36 = 1024;
      LODWORD(v37) = v9;
      _os_log_error_impl(&dword_18A184000, v15, OS_LOG_TYPE_ERROR, "%@: resolved to restore from buffer %i", buf, 0x12u);
    }
    goto LABEL_37;
  }
LABEL_29:
  BSLogSharedMemory();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
  {
    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
    *(_DWORD *)buf = 138412290;
    v35 = v19;
    _os_log_fault_impl(&dword_18A184000, v15, OS_LOG_TYPE_FAULT, "%@: failed to restore from buffers", buf, 0xCu);
  }
LABEL_37:

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64))
  {
    BSLogSharedMemory();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      v29 = *(_QWORD *)(a1 + 32);
      v30 = *(_QWORD *)(v29 + 16);
      v31 = *(_QWORD *)(v29 + 64);
      *(_DWORD *)buf = 138412546;
      v35 = v30;
      v36 = 2112;
      v37 = v31;
      _os_log_debug_impl(&dword_18A184000, v26, OS_LOG_TYPE_DEBUG, "%@: loaded data = %@", buf, 0x16u);
    }

  }
}

- (void)dealloc
{
  void *v4;
  objc_super v5;

  if (!self->_queue_invalidated)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BSSharedMemoryStore.m"), 207, CFSTR("must invalidate before dealloc"));

  }
  v5.receiver = self;
  v5.super_class = (Class)BSSharedMemoryStore;
  -[BSSharedMemoryStore dealloc](&v5, sel_dealloc);
}

- (void)invalidate
{
  NSObject *queue;
  _QWORD v3[6];

  queue = self->_queue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __33__BSSharedMemoryStore_invalidate__block_invoke;
  v3[3] = &unk_1E1EBEA28;
  v3[4] = self;
  v3[5] = a2;
  dispatch_async_and_wait(queue, v3);
}

void __33__BSSharedMemoryStore_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  id v4;

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 75))
  {
    *(_BYTE *)(v1 + 75) = 1;
    os_unfair_lock_lock((os_unfair_lock_t)&__allShmsLock);
    if (objc_msgSend((id)__allShms, "containsObject:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16)))
    {
      objc_msgSend((id)__allShms, "removeObject:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
      if (!objc_msgSend((id)__allShms, "count"))
      {
        v3 = (void *)__allShms;
        __allShms = 0;

      }
      os_unfair_lock_unlock((os_unfair_lock_t)&__allShmsLock);
    }
    else
    {
      os_unfair_lock_unlock((os_unfair_lock_t)&__allShmsLock);
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));

    }
  }
}

- (BSSharedMemoryStoreData)data
{
  NSObject *queue;
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__1;
  v10 = __Block_byref_object_dispose__1;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __27__BSSharedMemoryStore_data__block_invoke;
  v5[3] = &unk_1E1EBEA50;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_async_and_wait(queue, v5);
  v3 = (void *)objc_msgSend((id)v7[5], "copyWithZone:", 0);
  _Block_object_dispose(&v6, 8);

  return (BSSharedMemoryStoreData *)v3;
}

void __27__BSSharedMemoryStore_data__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 64));
}

- (void)setData:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = (void *)objc_msgSend(v4, "copyWithZone:", 0);
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __31__BSSharedMemoryStore_setData___block_invoke;
  v8[3] = &unk_1E1EBE700;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(queue, v8);

}

void __31__BSSharedMemoryStore_setData___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  unsigned int v5;
  char v6;
  NSObject *v7;
  char *v8;
  NSObject *v9;
  char *v10;
  unint64_t v11;
  uint64_t v12;
  os_log_type_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
  if (v3 == v2 || (objc_msgSend(v3, "isEqual:") & 1) != 0)
    return;
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 64), *(id *)(a1 + 40));
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(unsigned __int8 *)(v4 + 72);
  if (!*(_QWORD *)(v4 + 64))
  {
    v6 = 0;
    goto LABEL_7;
  }
  *(_BYTE *)(v4 + 24 + *(char *)(v4 + 56)) = 0x32313231u >> (8 * (v5 & 3));
  if (BSShmStore((char *)(v4 + 24), *(void **)(*(_QWORD *)(a1 + 32) + 64), (v5 >> 1) & 1, (_BYTE *)(*(_QWORD *)(a1 + 32) + 73)))
  {
    v6 = (v5 & 3) + 1;
LABEL_7:
    BSLogSharedMemory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v16 = *(_QWORD *)(a1 + 32);
      v17 = *(_QWORD *)(v16 + 16);
      v18 = *(_QWORD *)(v16 + 64);
      v22 = 138412546;
      v23 = v17;
      v24 = 2112;
      v25 = v18;
      _os_log_debug_impl(&dword_18A184000, v7, OS_LOG_TYPE_DEBUG, "%@: stored data = %@", (uint8_t *)&v22, 0x16u);
    }

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 72) = v6;
    v8 = *(char **)(a1 + 32);
    if (v8[73] == 1)
    {
      v8[73] = 0;
      BSLogSharedMemory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v19 = *(_QWORD *)(a1 + 32);
        v20 = 0x3231323100uLL >> (8 * v5);
        if (v5 >= 5)
          LOBYTE(v20) = 0;
        *(_BYTE *)(v19 + 24 + *(char *)(v19 + 56)) = v20;
        v22 = 136315138;
        v23 = v19 + 24;
        _os_log_error_impl(&dword_18A184000, v9, OS_LOG_TYPE_ERROR, "%s: simulating failure to purge old buffer", (uint8_t *)&v22, 0xCu);
      }
LABEL_11:

      return;
    }
    if (v5)
    {
      v10 = v8 + 24;
      v11 = 0x3231323100uLL >> (8 * v5);
      if (v5 >= 5)
        LOBYTE(v11) = 0;
      v10[v8[56]] = v11;
      BSShmDelete(v10, 0);
    }
    return;
  }
  if (v5)
  {
    BSLogSharedMemory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      v21 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
      v22 = 138412290;
      v23 = v21;
      _os_log_fault_impl(&dword_18A184000, v9, OS_LOG_TYPE_FAULT, "%@: data desynced with shm", (uint8_t *)&v22, 0xCu);
    }
    goto LABEL_11;
  }
  v12 = *(_QWORD *)(a1 + 32);
  v13 = OS_LOG_TYPE_INFO;
  if (!*(_BYTE *)(v12 + 74))
  {
    *(_BYTE *)(v12 + 74) = 1;
    v13 = OS_LOG_TYPE_FAULT;
  }
  BSLogSharedMemory();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, v13))
  {
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
    v22 = 138412290;
    v23 = v15;
    _os_log_impl(&dword_18A184000, v14, v13, "%@: failed to write new workspace connections state to shm - are we sandboxed?", (uint8_t *)&v22, 0xCu);
  }

}

+ (id)deserializeDataOfClass:(Class)a3 withSerializedFromData:(id)a4
{
  id v7;
  void *v8;
  unint64_t v9;
  size_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  int v15;
  NSObject *v16;
  const char *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  _BOOL4 v22;
  const char *v23;
  uint64_t v24;
  _BOOL4 v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  __int128 *p_buf;
  uint64_t *v36;
  uint64_t *v37;
  size_t v38;
  void *v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD v48[4];
  id v49;
  uint64_t *v50;
  uint64_t *v51;
  uint64_t *v52;
  size_t v53;
  void *v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  char v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  char v66;
  uint8_t v67[4];
  void *v68;
  __int16 v69;
  void *v70;
  __int128 buf;
  uint64_t v72;
  char v73;
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = v7;
  if (a3)
  {
    if (v7)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("BSSharedMemoryStore.m"), 278, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dataClass"));

    if (v8)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("BSSharedMemoryStore.m"), 279, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("source"));

LABEL_3:
  v9 = objc_msgSend(v8, "serializedDataLength");
  v10 = v9;
  if (v9 >= 0x7FFFFFFFFFFFFFF0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[BSSharedMemoryStore deserializeDataOfClass:withSerializedFromData:]");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInFunction:file:lineNumber:description:", v30, CFSTR("BSSharedMemoryStore.m"), 287, CFSTR("shmLength out of range"));

  }
  else if (!v9)
  {
    v11 = 0;
    goto LABEL_9;
  }
  v11 = malloc_type_malloc(v10, 0xAF618871uLL);
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[BSSharedMemoryStore deserializeDataOfClass:withSerializedFromData:]");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInFunction:file:lineNumber:description:", v32, CFSTR("BSSharedMemoryStore.m"), 291, CFSTR("failed to allocate serializing buffers"));

  }
  bzero(v11, v10);
LABEL_9:
  v63 = 0;
  v64 = &v63;
  v65 = 0x2020000000;
  v66 = 1;
  v59 = 0;
  v60 = &v59;
  v61 = 0x2020000000;
  v62 = 0;
  v55 = 0;
  v56 = &v55;
  v57 = 0x2020000000;
  v58 = 0;
  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v48[0] = MEMORY[0x1E0C809B0];
  v48[1] = 3221225472;
  v48[2] = __69__BSSharedMemoryStore_deserializeDataOfClass_withSerializedFromData___block_invoke;
  v48[3] = &unk_1E1EBEA78;
  v14 = v12;
  v49 = v14;
  v50 = &v63;
  v53 = v10;
  v54 = v11;
  v51 = &v59;
  v52 = &v55;
  v15 = objc_msgSend(v8, "serializeToWriter:", v48);
  *((_BYTE *)v64 + 24) = 0;
  if (v15)
  {
    if (*((_BYTE *)v56 + 24))
    {
      BSLogSharedMemory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v8;
        v17 = "data serialized but it tried to serialize more than it declared necessary : %@";
LABEL_20:
        _os_log_error_impl(&dword_18A184000, v16, OS_LOG_TYPE_ERROR, v17, (uint8_t *)&buf, 0xCu);
      }
    }
    else
    {
      if (v60[3] == v10)
        goto LABEL_22;
      BSLogSharedMemory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v8;
        v17 = "data serialized but it serialized less than it declared necessary : %@";
        goto LABEL_20;
      }
    }

LABEL_22:
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v72 = 0x2020000000;
    v73 = 1;
    v44 = 0;
    v45 = &v44;
    v46 = 0x2020000000;
    v47 = 0;
    v40 = 0;
    v41 = &v40;
    v42 = 0x2020000000;
    v43 = 0;
    v33[0] = v13;
    v33[1] = 3221225472;
    v33[2] = __69__BSSharedMemoryStore_deserializeDataOfClass_withSerializedFromData___block_invoke_43;
    v33[3] = &unk_1E1EBEAA0;
    v34 = v14;
    p_buf = &buf;
    v38 = v10;
    v39 = v11;
    v36 = &v44;
    v37 = &v40;
    -[objc_class deserializeFromReader:](a3, "deserializeFromReader:", v33);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*((_QWORD *)&buf + 1) + 24) = 0;
    if (v19)
    {
      if (*((_BYTE *)v41 + 24))
      {
        BSLogSharedMemory();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)v67 = 138412546;
          v68 = v8;
          v69 = 2112;
          v70 = v19;
          _os_log_debug_impl(&dword_18A184000, v20, OS_LOG_TYPE_DEBUG, "data deserialized but it tried to over read : data=%@ deserialized=%@", v67, 0x16u);
        }
      }
      else
      {
        if (v45[3] == v10)
        {
LABEL_46:

          _Block_object_dispose(&v40, 8);
          _Block_object_dispose(&v44, 8);
          _Block_object_dispose(&buf, 8);
          goto LABEL_47;
        }
        BSLogSharedMemory();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v67 = 138412546;
          v68 = v8;
          v69 = 2112;
          v70 = v19;
          _os_log_impl(&dword_18A184000, v20, OS_LOG_TYPE_INFO, "data deserialized but it didn't read everything : data=%@ deserialized=%@", v67, 0x16u);
        }
      }
LABEL_45:

      goto LABEL_46;
    }
    if (*((_BYTE *)v41 + 24))
    {
      BSLogSharedMemory();
      v20 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        goto LABEL_45;
      *(_DWORD *)v67 = 138412290;
      v68 = v8;
      v23 = "data failed to deserialize (maybe because it tried to over read) : data=%@";
    }
    else
    {
      v24 = v45[3];
      BSLogSharedMemory();
      v20 = objc_claimAutoreleasedReturnValue();
      v25 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
      if (v24 == v10)
      {
        if (!v25)
          goto LABEL_45;
        *(_DWORD *)v67 = 138412290;
        v68 = v8;
        v23 = "data failed to deserialize (external reason) : data=%@";
      }
      else
      {
        if (!v25)
          goto LABEL_45;
        *(_DWORD *)v67 = 138412290;
        v68 = v8;
        v23 = "data failed to deserialize (maybe because it didn't read everything) : data=%@";
      }
    }
    _os_log_error_impl(&dword_18A184000, v20, OS_LOG_TYPE_ERROR, v23, v67, 0xCu);
    goto LABEL_45;
  }
  if (*((_BYTE *)v56 + 24))
  {
    BSLogSharedMemory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v8;
      _os_log_error_impl(&dword_18A184000, v18, OS_LOG_TYPE_ERROR, "data failed to serialize (maybe because it tried to write more than it declared up front) : %@", (uint8_t *)&buf, 0xCu);
    }
  }
  else
  {
    v21 = v60[3];
    BSLogSharedMemory();
    v18 = objc_claimAutoreleasedReturnValue();
    v22 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    if (v21 == v10)
    {
      if (v22)
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v8;
        _os_log_error_impl(&dword_18A184000, v18, OS_LOG_TYPE_ERROR, "data failed to serialize (external reason) : %@", (uint8_t *)&buf, 0xCu);
      }
    }
    else if (v22)
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v8;
      _os_log_error_impl(&dword_18A184000, v18, OS_LOG_TYPE_ERROR, "data failed to serialize (maybe because it tried to write less than it declared up front) : %@", (uint8_t *)&buf, 0xCu);
    }
  }

  v19 = 0;
LABEL_47:
  free(v11);

  _Block_object_dispose(&v55, 8);
  _Block_object_dispose(&v59, 8);
  _Block_object_dispose(&v63, 8);

  return v19;
}

uint64_t __69__BSSharedMemoryStore_deserializeDataOfClass_withSerializedFromData___block_invoke(_QWORD *a1, const void *a2, size_t a3)
{
  void *v6;
  void *v7;
  unint64_t v8;
  size_t v9;
  size_t v10;
  int *v11;
  uint64_t result;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v6 = (void *)a1[4];
  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 != v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[BSSharedMemoryStore deserializeDataOfClass:withSerializedFromData:]_block_invoke");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("BSSharedMemoryStore.m"), 299, CFSTR("writeBlock cannot be called on a different thread"));

  }
  if (!*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[BSSharedMemoryStore deserializeDataOfClass:withSerializedFromData:]_block_invoke");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, CFSTR("BSSharedMemoryStore.m"), 300, CFSTR("writeBlock must be called in scope"));

  }
  v8 = a1[8];
  v9 = v8 - a3;
  if (v8 >= a3 && (v10 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24), v10 <= v9))
  {
    if (a3)
    {
      memcpy((void *)(a1[9] + v10), a2, a3);
      *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) += a3;
    }
    return 1;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 1;
    v11 = __error();
    result = 0;
    *v11 = 28;
  }
  return result;
}

uint64_t __69__BSSharedMemoryStore_deserializeDataOfClass_withSerializedFromData___block_invoke_43(_QWORD *a1, void *a2, size_t a3)
{
  void *v6;
  void *v7;
  unint64_t v8;
  size_t v9;
  size_t v10;
  int *v11;
  uint64_t result;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  if (!a2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[BSSharedMemoryStore deserializeDataOfClass:withSerializedFromData:]_block_invoke");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("BSSharedMemoryStore.m"), 328, CFSTR("buf cannot be nil"));

  }
  v6 = (void *)a1[4];
  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 != v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[BSSharedMemoryStore deserializeDataOfClass:withSerializedFromData:]_block_invoke");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, CFSTR("BSSharedMemoryStore.m"), 329, CFSTR("readBlock cannot be called on a different thread"));

  }
  if (!*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[BSSharedMemoryStore deserializeDataOfClass:withSerializedFromData:]_block_invoke");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, CFSTR("BSSharedMemoryStore.m"), 330, CFSTR("readBlock must be called in scope"));

  }
  v8 = a1[8];
  v9 = v8 - a3;
  if (v8 >= a3 && (v10 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24), v10 <= v9))
  {
    if (a3)
    {
      memcpy(a2, (const void *)(a1[9] + v10), a3);
      *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) += a3;
    }
    return 1;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 1;
    v11 = __error();
    result = 0;
    *v11 = 14;
  }
  return result;
}

- (unsigned)_lastState
{
  NSObject *queue;
  unsigned __int8 v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __33__BSSharedMemoryStore__lastState__block_invoke;
  v5[3] = &unk_1E1EBEA50;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_async_and_wait(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __33__BSSharedMemoryStore__lastState__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 72);
  return result;
}

- (void)_setFailureModeForNextWrite:(unsigned __int8)a3
{
  NSObject *queue;
  _QWORD v4[5];
  unsigned __int8 v5;

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__BSSharedMemoryStore__setFailureModeForNextWrite___block_invoke;
  v4[3] = &unk_1E1EBEAC8;
  v4[4] = self;
  v5 = a3;
  dispatch_async_and_wait(queue, v4);
}

uint64_t __51__BSSharedMemoryStore__setFailureModeForNextWrite___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 73) = *(_BYTE *)(result + 40);
  return result;
}

+ (void)_unlinkAllForIdentifier:(id)a3
{
  id v5;
  void *v6;
  id v7;
  objc_class *v8;
  void *v9;
  void *v10;
  id v11;
  objc_class *v12;
  void *v13;
  uint8_t buf[32];
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  NSClassFromString(CFSTR("NSString"));
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      *(_QWORD *)&buf[4] = v7;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v9;
      *(_WORD *)&buf[22] = 2048;
      *(_QWORD *)&buf[24] = a1;
      v15 = 2114;
      v16 = CFSTR("BSSharedMemoryStore.m");
      v17 = 1024;
      v18 = 393;
      v19 = 2114;
      v20 = v6;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
    __break(0);
    JUMPOUT(0x18A1D39C0);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      *(_QWORD *)&buf[4] = v11;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v13;
      *(_WORD *)&buf[22] = 2048;
      *(_QWORD *)&buf[24] = a1;
      v15 = 2114;
      v16 = CFSTR("BSSharedMemoryStore.m");
      v17 = 1024;
      v18 = 393;
      v19 = 2114;
      v20 = v10;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
    __break(0);
    JUMPOUT(0x18A1D3AC4);
  }

  LOBYTE(v15) = 0;
  memset(buf, 0, sizeof(buf));
  _initializePath((uint64_t)buf, v5);
  buf[(char)v15] = 49;
  BSShmDelete((char *)buf, 1);
  buf[(char)v15] = 50;
  BSShmDelete((char *)buf, 1);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue_data, 0);
  objc_storeStrong((id *)&self->_basePath, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
