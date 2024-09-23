@implementation FCFetchedValueObservable

void __43__FCFetchedValueObservable_valueWithError___block_invoke(_QWORD *a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), *(id *)(a1[4] + 8));
  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), *(id *)(a1[4] + 48));
}

void __43__FCFetchedValueObservable_removeObserver___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "observers");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 40));

}

void __40__FCFetchedValueObservable_addObserver___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "observers");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

}

- (NSHashTable)observers
{
  return self->_observers;
}

void __37__FCFetchedValueObservable_setValue___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t (**v3)(_QWORD, _QWORD, _QWORD);
  int v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2[1])
  {
    objc_msgSend(v2, "equalityTest");
    v3 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v4 = v3[2](v3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(_QWORD *)(a1 + 40)) ^ 1;

  }
  else
  {
    v4 = 1;
  }
  v5 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 8);
  *(_QWORD *)(v6 + 8) = v5;

  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 48);
  *(_QWORD *)(v8 + 48) = 0;

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "observers");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "allObjects");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

  }
}

- (id)equalityTest
{
  return self->_equalityTest;
}

- (void)setValue:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  _QWORD block[4];
  id v12;
  id v13;
  _BYTE *v14;
  _QWORD v15[5];
  id v16;
  _BYTE *v17;
  _BYTE buf[24];
  __int128 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "value");
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = "-[FCFetchedValueObservable setValue:]";
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = "FCFetchedValueObservable.m";
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v19) = 58;
    WORD2(v19) = 2114;
    *(_QWORD *)((char *)&v19 + 6) = v10;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  *(_QWORD *)&v19 = __Block_byref_object_copy__13;
  *((_QWORD *)&v19 + 1) = __Block_byref_object_dispose__13;
  v20 = 0;
  -[FCFetchedValueObservable lock](self, "lock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __37__FCFetchedValueObservable_setValue___block_invoke;
  v15[3] = &unk_1E463AFC0;
  v15[4] = self;
  v7 = v4;
  v16 = v7;
  v17 = buf;
  objc_msgSend(v5, "performWithLockSync:", v15);

  -[FCFetchedValueObservable manager](self, "manager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    dispatch_get_global_queue(17, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = v6;
    block[1] = 3221225472;
    block[2] = __37__FCFetchedValueObservable_setValue___block_invoke_2;
    block[3] = &unk_1E463AD58;
    v14 = buf;
    v12 = v8;
    v13 = v7;
    dispatch_async(v9, block);

  }
  _Block_object_dispose(buf, 8);

}

- (FCFetchedValueManager)manager
{
  return (FCFetchedValueManager *)objc_loadWeakRetained((id *)&self->_manager);
}

- (void)addObserver:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "observer");
    *(_DWORD *)buf = 136315906;
    v11 = "-[FCFetchedValueObservable addObserver:]";
    v12 = 2080;
    v13 = "FCFetchedValueObservable.m";
    v14 = 1024;
    v15 = 134;
    v16 = 2114;
    v17 = v7;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  -[FCFetchedValueObservable lock](self, "lock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __40__FCFetchedValueObservable_addObserver___block_invoke;
  v8[3] = &unk_1E463AD10;
  v8[4] = self;
  v9 = v4;
  v6 = v4;
  objc_msgSend(v5, "performWithLockSync:", v8);

}

- (id)valueWithError:(id *)a3
{
  void *v5;
  id v6;
  _QWORD v8[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__13;
  v19 = __Block_byref_object_dispose__13;
  v20 = 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__13;
  v13 = __Block_byref_object_dispose__13;
  v14 = 0;
  -[FCFetchedValueObservable lock](self, "lock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __43__FCFetchedValueObservable_valueWithError___block_invoke;
  v8[3] = &unk_1E463D9D8;
  v8[4] = self;
  v8[5] = &v15;
  v8[6] = &v9;
  objc_msgSend(v5, "performWithLockSync:", v8);

  if (a3)
    *a3 = objc_retainAutorelease((id)v10[5]);
  v6 = (id)v16[5];
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
  return v6;
}

- (NFUnfairLock)lock
{
  return self->_lock;
}

- (NFCopying)value
{
  return (NFCopying *)-[FCFetchedValueObservable valueWithError:](self, "valueWithError:", 0);
}

- (FCFetchedValueObservable)initWithManager:(id)a3 initialValue:(id)a4 equalityTest:(id)a5
{
  id v8;
  id v9;
  id v10;
  FCFetchedValueObservable *v11;
  FCFetchedValueObservable *v12;
  uint64_t v13;
  NFCopying *value;
  void *v15;
  id equalityTest;
  uint64_t v17;
  NSHashTable *observers;
  uint64_t v19;
  NFUnfairLock *lock;
  void *v22;
  void *v23;
  objc_super v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "manager != nil");
    *(_DWORD *)buf = 136315906;
    v26 = "-[FCFetchedValueObservable initWithManager:initialValue:equalityTest:]";
    v27 = 2080;
    v28 = "FCFetchedValueObservable.m";
    v29 = 1024;
    v30 = 40;
    v31 = 2114;
    v32 = v22;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v10)
      goto LABEL_6;
  }
  else if (v10)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "equalityTest != nil");
    *(_DWORD *)buf = 136315906;
    v26 = "-[FCFetchedValueObservable initWithManager:initialValue:equalityTest:]";
    v27 = 2080;
    v28 = "FCFetchedValueObservable.m";
    v29 = 1024;
    v30 = 41;
    v31 = 2114;
    v32 = v23;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_6:
  v24.receiver = self;
  v24.super_class = (Class)FCFetchedValueObservable;
  v11 = -[FCFetchedValueObservable init](&v24, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_manager, v8);
    v13 = objc_msgSend(v9, "copy");
    value = v12->_value;
    v12->_value = (NFCopying *)v13;

    v15 = _Block_copy(v10);
    equalityTest = v12->_equalityTest;
    v12->_equalityTest = v15;

    objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 517);
    v17 = objc_claimAutoreleasedReturnValue();
    observers = v12->_observers;
    v12->_observers = (NSHashTable *)v17;

    v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0D60B18]), "initWithOptions:", 1);
    lock = v12->_lock;
    v12->_lock = (NFUnfairLock *)v19;

  }
  return v12;
}

- (void)removeObserver:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "observer");
    *(_DWORD *)buf = 136315906;
    v11 = "-[FCFetchedValueObservable removeObserver:]";
    v12 = 2080;
    v13 = "FCFetchedValueObservable.m";
    v14 = 1024;
    v15 = 144;
    v16 = 2114;
    v17 = v7;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  -[FCFetchedValueObservable lock](self, "lock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __43__FCFetchedValueObservable_removeObserver___block_invoke;
  v8[3] = &unk_1E463AD10;
  v8[4] = self;
  v9 = v4;
  v6 = v4;
  objc_msgSend(v5, "performWithLockSync:", v8);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong(&self->_equalityTest, 0);
  objc_destroyWeak((id *)&self->_manager);
  objc_storeStrong((id *)&self->_value, 0);
}

void __37__FCFetchedValueObservable_setValue___block_invoke_2(_QWORD *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1[6] + 8) + 40);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "fetchedObjectManager:valueDidChange:", a1[4], a1[5], (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (FCFetchedValueObservable)init
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCFetchedValueObservable init]";
    v9 = 2080;
    v10 = "FCFetchedValueObservable.m";
    v11 = 1024;
    v12 = 33;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCFetchedValueObservable init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (void)handleError:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "error");
    *(_DWORD *)buf = 136315906;
    v11 = "-[FCFetchedValueObservable handleError:]";
    v12 = 2080;
    v13 = "FCFetchedValueObservable.m";
    v14 = 1024;
    v15 = 90;
    v16 = 2114;
    v17 = v7;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  -[FCFetchedValueObservable lock](self, "lock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __40__FCFetchedValueObservable_handleError___block_invoke;
  v8[3] = &unk_1E463AD10;
  v8[4] = self;
  v9 = v4;
  v6 = v4;
  objc_msgSend(v5, "performWithLockSync:", v8);

}

void __40__FCFetchedValueObservable_handleError___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v1 + 8))
  {
    v2 = *(void **)(v1 + 48);
    *(_QWORD *)(v1 + 48) = 0;
  }
  else
  {
    v4 = objc_msgSend(*(id *)(a1 + 40), "copy");
    v5 = *(_QWORD *)(a1 + 32);
    v2 = *(void **)(v5 + 48);
    *(_QWORD *)(v5 + 48) = v4;
  }

}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

@end
