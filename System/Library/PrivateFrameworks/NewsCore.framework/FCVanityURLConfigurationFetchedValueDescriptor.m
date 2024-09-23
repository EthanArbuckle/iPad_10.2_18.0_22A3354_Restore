@implementation FCVanityURLConfigurationFetchedValueDescriptor

- (FCVanityURLConfigurationFetchedValueDescriptor)initWithConfigurationManager:(id)a3
{
  id v5;
  FCVanityURLConfigurationFetchedValueDescriptor *v6;
  FCVanityURLConfigurationFetchedValueDescriptor *v7;
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
    v12 = "-[FCVanityURLConfigurationFetchedValueDescriptor initWithConfigurationManager:]";
    v13 = 2080;
    v14 = "FCVanityURLConfigurationFetchedValueDescriptor.m";
    v15 = 1024;
    v16 = 29;
    v17 = 2114;
    v18 = v9;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v10.receiver = self;
  v10.super_class = (Class)FCVanityURLConfigurationFetchedValueDescriptor;
  v6 = -[FCFetchedValueDescriptor init](&v10, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_configurationManager, a3);

  return v7;
}

- (id)inputManagers
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  -[FCVanityURLConfigurationFetchedValueDescriptor configurationManager](self, "configurationManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)fetchValueWithCachePolicy:(unint64_t)a3 qualityOfService:(int64_t)a4 completion:(id)a5
{
  void (**v6)(id, void *, void *);
  void *v7;
  void *v8;
  id v9;

  v6 = (void (**)(id, void *, void *))a5;
  -[FCVanityURLConfigurationFetchedValueDescriptor _vanityURLConfiguration](self, "_vanityURLConfiguration");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("FCErrorDomain"), 8, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[FCVanityURLConfigurationFetchedValueDescriptor _vanityURLConfiguration](self, "_vanityURLConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v8, v7);

}

- (id)_vanityURLConfiguration
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  FCManagedResourceConfiguration *v6;

  -[FCVanityURLConfigurationFetchedValueDescriptor configurationManager](self, "configurationManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "paidBundleConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "vanityURLMappingResourceID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = -[FCManagedResourceConfiguration initWithResourceID:refreshRate:]([FCManagedResourceConfiguration alloc], "initWithResourceID:refreshRate:", v5, objc_msgSend(v4, "vanityURLMappingRefreshRate"));
  else
    v6 = 0;

  return v6;
}

- (FCFetchedValueManager)configurationManager
{
  return self->_configurationManager;
}

- (BOOL)isValue:(id)a3 equalToValue:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  BOOL v11;
  void *v13;
  void *v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (!v5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "left");
    *(_DWORD *)buf = 136315906;
    v16 = "-[FCVanityURLConfigurationFetchedValueDescriptor isValue:equalToValue:]";
    v17 = 2080;
    v18 = "FCVanityURLConfigurationFetchedValueDescriptor.m";
    v19 = 1024;
    v20 = 62;
    v21 = 2114;
    v22 = v13;
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
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "right");
    *(_DWORD *)buf = 136315906;
    v16 = "-[FCVanityURLConfigurationFetchedValueDescriptor isValue:equalToValue:]";
    v17 = 2080;
    v18 = "FCVanityURLConfigurationFetchedValueDescriptor.m";
    v19 = 1024;
    v20 = 63;
    v21 = 2114;
    v22 = v14;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_6:
  v7 = (void *)MEMORY[0x1E0DE7910];
  objc_msgSend(v5, "resourceID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resourceID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "nf_object:isEqualToObject:", v8, v9))
  {
    v10 = objc_msgSend(v5, "refreshRate");
    v11 = v10 == objc_msgSend(v6, "refreshRate");
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationManager, 0);
}

- (FCVanityURLConfigurationFetchedValueDescriptor)init
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
    v8 = "-[FCVanityURLConfigurationFetchedValueDescriptor init]";
    v9 = 2080;
    v10 = "FCVanityURLConfigurationFetchedValueDescriptor.m";
    v11 = 1024;
    v12 = 24;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCVanityURLConfigurationFetchedValueDescriptor init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

@end
