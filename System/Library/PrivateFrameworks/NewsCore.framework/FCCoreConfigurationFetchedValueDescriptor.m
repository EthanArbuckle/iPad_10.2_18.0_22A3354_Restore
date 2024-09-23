@implementation FCCoreConfigurationFetchedValueDescriptor

- (void)fetchValueWithCachePolicy:(unint64_t)a3 qualityOfService:(int64_t)a4 completion:(id)a5
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a5;
  -[FCCoreConfigurationFetchedValueDescriptor configurationManager](self, "configurationManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __99__FCCoreConfigurationFetchedValueDescriptor_fetchValueWithCachePolicy_qualityOfService_completion___block_invoke;
  v9[3] = &unk_1E463DAA8;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "fetchConfigurationIfNeededWithCompletion:", v9);

}

- (FCCoreConfigurationManager)configurationManager
{
  return self->_configurationManager;
}

- (BOOL)isValue:(id)a3 equalToValue:(id)a4
{
  id v5;
  id v6;
  void *v8;
  void *v9;
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
  v5 = a3;
  v6 = a4;
  if (!v5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "left");
    *(_DWORD *)buf = 136315906;
    v11 = "-[FCCoreConfigurationFetchedValueDescriptor isValue:equalToValue:]";
    v12 = 2080;
    v13 = "FCCoreConfigurationFetchedValueDescriptor.m";
    v14 = 1024;
    v15 = 65;
    v16 = 2114;
    v17 = v8;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v6)
      goto LABEL_6;
  }
  else if (v6)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "right");
    *(_DWORD *)buf = 136315906;
    v11 = "-[FCCoreConfigurationFetchedValueDescriptor isValue:equalToValue:]";
    v12 = 2080;
    v13 = "FCCoreConfigurationFetchedValueDescriptor.m";
    v14 = 1024;
    v15 = 66;
    v16 = 2114;
    v17 = v9;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_6:

  return v5 == v6;
}

- (FCCoreConfigurationFetchedValueDescriptor)initWithConfigurationManager:(id)a3
{
  id v5;
  FCCoreConfigurationFetchedValueDescriptor *v6;
  FCCoreConfigurationFetchedValueDescriptor *v7;
  void *v9;
  objc_super v10;
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
  v5 = a3;
  if (!v5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "configurationManager");
    *(_DWORD *)buf = 136315906;
    v12 = "-[FCCoreConfigurationFetchedValueDescriptor initWithConfigurationManager:]";
    v13 = 2080;
    v14 = "FCCoreConfigurationFetchedValueDescriptor.m";
    v15 = 1024;
    v16 = 30;
    v17 = 2114;
    v18 = v9;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v10.receiver = self;
  v10.super_class = (Class)FCCoreConfigurationFetchedValueDescriptor;
  v6 = -[FCFetchedValueDescriptor init](&v10, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_configurationManager, a3);

  return v7;
}

- (id)inputManagers
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)fastCachedValue
{
  void *v2;
  void *v3;

  -[FCCoreConfigurationFetchedValueDescriptor configurationManager](self, "configurationManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __99__FCCoreConfigurationFetchedValueDescriptor_fetchValueWithCachePolicy_qualityOfService_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationManager, 0);
}

- (FCCoreConfigurationFetchedValueDescriptor)init
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
    v8 = "-[FCCoreConfigurationFetchedValueDescriptor init]";
    v9 = 2080;
    v10 = "FCCoreConfigurationFetchedValueDescriptor.m";
    v11 = 1024;
    v12 = 25;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCCoreConfigurationFetchedValueDescriptor init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

@end
