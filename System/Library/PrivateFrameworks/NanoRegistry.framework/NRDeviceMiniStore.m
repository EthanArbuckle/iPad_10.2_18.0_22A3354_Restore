@implementation NRDeviceMiniStore

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSDictionary *store;

  store = self->_store;
  if (store)
    objc_msgSend(a3, "encodeObject:forKey:", store, CFSTR("miniStoreValuesKey"));
}

- (NRDeviceMiniStore)initWithStore:(id)a3
{
  id v5;
  NRDeviceMiniStore *v6;
  NRDeviceMiniStore *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NRDeviceMiniStore;
  v6 = -[NRDeviceMiniStore init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_store, a3);

  return v7;
}

- (NRDeviceMiniStore)initWithCoder:(id)a3
{
  id v4;
  NRDeviceMiniStore *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  uint8_t v14[16];
  objc_super v15;
  _QWORD v16[6];

  v16[5] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)NRDeviceMiniStore;
  v5 = -[NRDeviceMiniStore init](&v15, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v16[0] = objc_opt_class();
    v16[1] = objc_opt_class();
    v16[2] = objc_opt_class();
    v16[3] = objc_opt_class();
    v16[4] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("miniStoreValuesKey"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_storeStrong((id *)&v5->_store, v9);
    }
    else
    {
      nr_framework_log();
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);

      if (v11)
      {
        nr_framework_log();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v14 = 0;
          _os_log_error_impl(&dword_1A0BDB000, v12, OS_LOG_TYPE_ERROR, "No store found, will not return a deviceStore", v14, 2u);
        }

      }
      v5 = 0;
    }

  }
  return v5;
}

- (id)objectForKey:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!self->_store)
  {
    nr_framework_log();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);

    if (v6)
    {
      nr_framework_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v13) = 0;
        _os_log_error_impl(&dword_1A0BDB000, v7, OS_LOG_TYPE_ERROR, "No store found in ministore", (uint8_t *)&v13, 2u);
      }

    }
  }
  -[NSDictionary objectForKey:](self->_store, "objectForKey:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    nr_framework_log();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

    if (v10)
    {
      nr_framework_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 138412290;
        v14 = v4;
        _os_log_impl(&dword_1A0BDB000, v11, OS_LOG_TYPE_DEFAULT, "No value found in ministore for key %@", (uint8_t *)&v13, 0xCu);
      }

    }
  }

  return v8;
}

- (id)fullStore
{
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  uint8_t v7[16];

  if (!self->_store)
  {
    nr_framework_log();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

    if (v4)
    {
      nr_framework_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v7 = 0;
        _os_log_error_impl(&dword_1A0BDB000, v5, OS_LOG_TYPE_ERROR, "No store found in ministore", v7, 2u);
      }

    }
  }
  return self->_store;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);
}

@end
