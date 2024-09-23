@implementation FCFetchedValueDescriptor

uint64_t __82__FCFetchedValueDescriptor_Promise__valuePromiseWithCachePolicy_qualityOfService___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_observer);
}

- (FCFetchedValueDescriptor)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FCFetchedValueDescriptor;
  return -[FCFetchedValueDescriptor init](&v3, sel_init);
}

- (void)setObserver:(id)a3
{
  objc_storeWeak((id *)&self->_observer, a3);
}

void __82__FCFetchedValueDescriptor_Promise__valuePromiseWithCachePolicy_qualityOfService___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v7 = (void *)a1[4];
  v8 = a1[5];
  v9 = a1[6];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __82__FCFetchedValueDescriptor_Promise__valuePromiseWithCachePolicy_qualityOfService___block_invoke_2;
  v12[3] = &unk_1E4644378;
  v13 = v6;
  v14 = v5;
  v10 = v5;
  v11 = v6;
  objc_msgSend(v7, "fetchValueWithCachePolicy:qualityOfService:completion:", v8, v9, v12);

}

- (id)valuePromiseWithCachePolicy:(unint64_t)a3 qualityOfService:(int64_t)a4
{
  id v7;
  _QWORD v9[7];

  v7 = objc_alloc(MEMORY[0x1E0D60AF0]);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __82__FCFetchedValueDescriptor_Promise__valuePromiseWithCachePolicy_qualityOfService___block_invoke;
  v9[3] = &unk_1E4640DB8;
  v9[4] = self;
  v9[5] = a3;
  v9[6] = a4;
  return (id)objc_msgSend(v7, "initWithResolver:", v9);
}

- (void)fetchValueWithCachePolicy:(unint64_t)a3 qualityOfService:(int64_t)a4 completion:(id)a5
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a5;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Abstract method"));
    *(_DWORD *)buf = 136315906;
    v12 = "-[FCFetchedValueDescriptor fetchValueWithCachePolicy:qualityOfService:completion:]";
    v13 = 2080;
    v14 = "FCFetchedValueDescriptor.m";
    v15 = 1024;
    v16 = 24;
    v17 = 2114;
    v18 = v6;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v7 = (void *)MEMORY[0x1E0C99DA0];
  v8 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "-[FCFetchedValueDescriptor fetchValueWithCachePolicy:qualityOfService:completion:]");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "exceptionWithName:reason:userInfo:", v8, v9, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v10);
}

- (id)fastCachedValue
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
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Abstract method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCFetchedValueDescriptor fastCachedValue]";
    v9 = 2080;
    v10 = "FCFetchedValueDescriptor.m";
    v11 = 1024;
    v12 = 29;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "-[FCFetchedValueDescriptor fastCachedValue]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (BOOL)isValue:(id)a3 equalToValue:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Abstract method"));
    *(_DWORD *)buf = 136315906;
    v13 = "-[FCFetchedValueDescriptor isValue:equalToValue:]";
    v14 = 2080;
    v15 = "FCFetchedValueDescriptor.m";
    v16 = 1024;
    v17 = 34;
    v18 = 2114;
    v19 = v7;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v8 = (void *)MEMORY[0x1E0C99DA0];
  v9 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "-[FCFetchedValueDescriptor isValue:equalToValue:]");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "exceptionWithName:reason:userInfo:", v9, v10, 0);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v11);
}

- (NSArray)inputManagers
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
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Abstract method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCFetchedValueDescriptor inputManagers]";
    v9 = 2080;
    v10 = "FCFetchedValueDescriptor.m";
    v11 = 1024;
    v12 = 39;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "-[FCFetchedValueDescriptor inputManagers]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Abstract method"));
    *(_DWORD *)buf = 136315906;
    v9 = "-[FCFetchedValueDescriptor copyWithZone:]";
    v10 = 2080;
    v11 = "FCFetchedValueDescriptor.m";
    v12 = 1024;
    v13 = 45;
    v14 = 2114;
    v15 = v3;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v4 = (void *)MEMORY[0x1E0C99DA0];
  v5 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "-[FCFetchedValueDescriptor copyWithZone:]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "exceptionWithName:reason:userInfo:", v5, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (FCFetchedValueDescriptorObserving)observer
{
  return (FCFetchedValueDescriptorObserving *)objc_loadWeakRetained((id *)&self->_observer);
}

@end
