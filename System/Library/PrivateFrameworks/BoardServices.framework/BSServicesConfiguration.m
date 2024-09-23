@implementation BSServicesConfiguration

+ (id)bootstrapConfiguration
{
  if (qword_1ECD9C5D0 != -1)
    dispatch_once(&qword_1ECD9C5D0, &__block_literal_global_2);
  return (id)_MergedGlobals_5;
}

void __49__BSServicesConfiguration_bootstrapConfiguration__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  const char *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  int v19;
  void *v20;
  id v21;
  objc_class *v22;
  void *v23;
  void *v24;
  id v25;
  objc_class *v26;
  void *v27;
  void *v28;
  id v29;
  objc_class *v30;
  void *v31;
  void *v32;
  id v33;
  objc_class *v34;
  void *v35;
  void *v36;
  id v37;
  objc_class *v38;
  void *v39;
  void *v40;
  id v41;
  objc_class *v42;
  void *v43;
  id v44;
  uint8_t buf[4];
  id v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  const __CFString *v52;
  __int16 v53;
  int v54;
  __int16 v55;
  void *v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x19AECA850]();
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "environment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("BSServiceDomains"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "infoDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("BSServiceDomains"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v3;
  v8 = v6;
  v9 = objc_opt_self();
  v10 = (void *)MEMORY[0x19AECA850]();
  if (v7)
  {
    v11 = objc_retainAutorelease(v7);
    v12 = (const char *)objc_msgSend(v11, "UTF8String");
    if (!v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("BSServiceDomains of environment could not be converted to UTF8String : %@"), v11);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__bootstrapConfigWithEnv_info_);
        v21 = (id)objc_claimAutoreleasedReturnValue();
        v22 = (objc_class *)objc_opt_class();
        NSStringFromClass(v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v46 = v21;
        v47 = 2114;
        v48 = v23;
        v49 = 2048;
        v50 = v9;
        v51 = 2114;
        v52 = CFSTR("BSServicesConfiguration.m");
        v53 = 1024;
        v54 = 322;
        v55 = 2114;
        v56 = v20;
        _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v20), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A7B8574);
    }
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v12, strlen(v12));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("BSServiceDomains of environment could not be converted to NSData : %@"), v11);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__bootstrapConfigWithEnv_info_);
        v25 = (id)objc_claimAutoreleasedReturnValue();
        v26 = (objc_class *)objc_opt_class();
        NSStringFromClass(v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v46 = v25;
        v47 = 2114;
        v48 = v27;
        v49 = 2048;
        v50 = v9;
        v51 = 2114;
        v52 = CFSTR("BSServicesConfiguration.m");
        v53 = 1024;
        v54 = 324;
        v55 = 2114;
        v56 = v24;
        _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v24), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A7B8670);
    }
    v44 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v13, 0, &v44);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v44;
    if (!v14)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("BSServiceDomains of environment could not be deserialized due to %@ : %@"), v15, v11);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__bootstrapConfigWithEnv_info_);
        v29 = (id)objc_claimAutoreleasedReturnValue();
        v30 = (objc_class *)objc_opt_class();
        NSStringFromClass(v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v46 = v29;
        v47 = 2114;
        v48 = v31;
        v49 = 2048;
        v50 = v9;
        v51 = 2114;
        v52 = CFSTR("BSServicesConfiguration.m");
        v53 = 1024;
        v54 = 327;
        v55 = 2114;
        v56 = v28;
        _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v28), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A7B876CLL);
    }

    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("BSServiceDomains cannot be defined in both the environment and the Info.plist : env=%@ info=%@"), v14, v8);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__bootstrapConfigWithEnv_info_);
        v33 = (id)objc_claimAutoreleasedReturnValue();
        v34 = (objc_class *)objc_opt_class();
        NSStringFromClass(v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v46 = v33;
        v47 = 2114;
        v48 = v35;
        v49 = 2048;
        v50 = v9;
        v51 = 2114;
        v52 = CFSTR("BSServicesConfiguration.m");
        v53 = 1024;
        v54 = 331;
        v55 = 2114;
        v56 = v32;
        _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v32), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A7B8868);
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("BSServiceDomains of environment was of an unexpected type : %@"), v14);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__bootstrapConfigWithEnv_info_);
        v37 = (id)objc_claimAutoreleasedReturnValue();
        v38 = (objc_class *)objc_opt_class();
        NSStringFromClass(v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v46 = v37;
        v47 = 2114;
        v48 = v39;
        v49 = 2048;
        v50 = v9;
        v51 = 2114;
        v52 = CFSTR("BSServicesConfiguration.m");
        v53 = 1024;
        v54 = 332;
        v55 = 2114;
        v56 = v36;
        _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v36), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A7B8964);
    }
    +[BSServicesConfiguration _configurationFromPlist:postfixBlock:]((uint64_t)BSServicesConfiguration, v14, 0);
    v16 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (v8)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("BSServiceDomains was of an unexpected type : %@"), 0);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(sel__bootstrapConfigWithEnv_info_);
          v41 = (id)objc_claimAutoreleasedReturnValue();
          v42 = (objc_class *)objc_opt_class();
          NSStringFromClass(v42);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544642;
          v46 = v41;
          v47 = 2114;
          v48 = v43;
          v49 = 2048;
          v50 = v9;
          v51 = 2114;
          v52 = CFSTR("BSServicesConfiguration.m");
          v53 = 1024;
          v54 = 335;
          v55 = 2114;
          v56 = v40;
          _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

        }
        objc_msgSend(objc_retainAutorelease(v40), "UTF8String");
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x19A7B8A5CLL);
      }
      +[BSServicesConfiguration _configurationFromPlist:postfixBlock:]((uint64_t)BSServicesConfiguration, v8, &__block_literal_global_115);
      v17 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[BSServicesConfiguration _configurationFromPlist:postfixBlock:]((uint64_t)BSServicesConfiguration, 0, 0);
      v17 = objc_claimAutoreleasedReturnValue();
    }
    v16 = v17;
  }
  objc_autoreleasePoolPop(v10);

  v18 = (void *)_MergedGlobals_5;
  _MergedGlobals_5 = v16;

  if (v7)
  {
    *__error() = 0;
    if (unsetenv("BSServiceDomains"))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v19 = *__error();
        *(_DWORD *)buf = 67109120;
        LODWORD(v46) = v19;
        _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failed to unsetenv(BSServiceDomains) : errno=%{darwin.errno}d", buf, 8u);
      }
    }
  }

  objc_autoreleasePoolPop(v0);
}

+ (id)_configurationFromPlist:(void *)a3 postfixBlock:
{
  id v4;
  void (**v5)(id, id *, id);
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id *v15;
  uint64_t v16;
  void *v18;
  id v19;
  objc_class *v20;
  void *v21;
  id v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  char *v28;
  uint64_t v29;
  _QWORD v30[4];
  id v31;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  const __CFString *v39;
  __int16 v40;
  int v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  v6 = objc_opt_self();
  v7 = (void *)MEMORY[0x19AECA850]();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __64__BSServicesConfiguration__configurationFromPlist_postfixBlock___block_invoke;
  v30[3] = &unk_1E390D4C8;
  v22 = v8;
  v31 = v22;
  v23 = (void *)MEMORY[0x19AECAA00](v30);
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("domainsInfo was of an unexpected type : %@"), v4);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__configurationFromPlist_postfixBlock_);
        v19 = (id)objc_claimAutoreleasedReturnValue();
        v20 = (objc_class *)objc_opt_class();
        NSStringFromClass(v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v33 = v19;
        v34 = 2114;
        v35 = v21;
        v36 = 2048;
        v37 = v6;
        v38 = 2114;
        v39 = CFSTR("BSServicesConfiguration.m");
        v40 = 1024;
        v41 = 162;
        v42 = 2114;
        v43 = v18;
        _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v18), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A7B8F20);
    }
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v9;
  v24[1] = 3221225472;
  v24[2] = __64__BSServicesConfiguration__configurationFromPlist_postfixBlock___block_invoke_26;
  v24[3] = &unk_1E390D540;
  v28 = sel__configurationFromPlist_postfixBlock_;
  v29 = v6;
  v12 = v23;
  v27 = v12;
  v13 = v11;
  v25 = v13;
  v14 = v10;
  v26 = v14;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v24);
  v15 = -[BSServicesConfiguration _initWithDomainsByIdentifier:disabledDomainsByIdentifier:]((id *)[BSServicesConfiguration alloc], v14, v13);
  if (v5)
  {
    v5[2](v5, v15, v12);
    v16 = objc_claimAutoreleasedReturnValue();

    v15 = (id *)v16;
  }

  objc_autoreleasePoolPop(v7);
  return v15;
}

- (id)_initWithDomainsByIdentifier:(void *)a3 disabledDomainsByIdentifier:
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  objc_super v17;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v17.receiver = a1;
    v17.super_class = (Class)BSServicesConfiguration;
    a1 = (id *)objc_msgSendSuper2(&v17, sel_init);
    if (a1)
    {
      v7 = objc_msgSend(v5, "copy");
      v8 = a1[1];
      a1[1] = (id)v7;

      v9 = objc_msgSend(v6, "copy");
      v10 = a1[2];
      a1[2] = (id)v9;

      v11 = (void *)MEMORY[0x1E0C99E40];
      objc_msgSend(a1[1], "allValues");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "sortedArrayUsingComparator:", &__block_literal_global_97);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "orderedSetWithArray:", v13);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = a1[3];
      a1[3] = (id)v14;

    }
  }

  return a1;
}

- (BSServicesConfiguration)init
{
  void *v4;
  id v5;
  objc_class *v6;
  void *v7;
  BSServicesConfiguration *result;
  int v9;
  id v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  BSServicesConfiguration *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("init is not allowed on BSServicesConfiguration"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v5 = (id)objc_claimAutoreleasedReturnValue();
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
    v16 = CFSTR("BSServicesConfiguration.m");
    v17 = 1024;
    v18 = 29;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (BSServicesConfiguration *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

+ (id)defaultConfiguration
{
  return +[BSServicesConfiguration bootstrapConfiguration](BSServicesConfiguration, "bootstrapConfiguration");
}

- (NSSet)domains
{
  return -[NSOrderedSet set](self->_orderedDomains, "set");
}

- (NSSet)disabledDomains
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[NSDictionary allValues](self->_disabledDomainsByIdentifier, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

- (id)domainForIdentifier:(id)a3
{
  id v5;
  void *v6;
  void *v8;
  id v9;
  objc_class *v10;
  void *v11;
  void *v12;
  id v13;
  objc_class *v14;
  void *v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  BSServicesConfiguration *v21;
  __int16 v22;
  const __CFString *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  NSClassFromString(CFSTR("NSString"));
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v17 = v9;
      v18 = 2114;
      v19 = v11;
      v20 = 2048;
      v21 = self;
      v22 = 2114;
      v23 = CFSTR("BSServicesConfiguration.m");
      v24 = 1024;
      v25 = 68;
      v26 = 2114;
      v27 = v8;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7C5398);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v17 = v13;
      v18 = 2114;
      v19 = v15;
      v20 = 2048;
      v21 = self;
      v22 = 2114;
      v23 = CFSTR("BSServicesConfiguration.m");
      v24 = 1024;
      v25 = 68;
      v26 = 2114;
      v27 = v12;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7C5498);
  }

  -[NSDictionary objectForKey:](self->_domainsByIdentifier, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)domainForMachName:(id)a3
{
  id v5;
  NSOrderedSet *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  char v12;
  void *v14;
  id v15;
  objc_class *v16;
  void *v17;
  void *v18;
  id v19;
  objc_class *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  id v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  BSServicesConfiguration *v32;
  __int16 v33;
  const __CFString *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  NSClassFromString(CFSTR("NSString"));
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v28 = v15;
      v29 = 2114;
      v30 = v17;
      v31 = 2048;
      v32 = self;
      v33 = 2114;
      v34 = CFSTR("BSServicesConfiguration.m");
      v35 = 1024;
      v36 = 73;
      v37 = 2114;
      v38 = v14;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v14), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7C576CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v19 = (id)objc_claimAutoreleasedReturnValue();
      v20 = (objc_class *)objc_opt_class();
      NSStringFromClass(v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v28 = v19;
      v29 = 2114;
      v30 = v21;
      v31 = 2048;
      v32 = self;
      v33 = 2114;
      v34 = CFSTR("BSServicesConfiguration.m");
      v35 = 1024;
      v36 = 73;
      v37 = 2114;
      v38 = v18;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v18), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7C586CLL);
  }

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v6 = self->_orderedDomains;
  v7 = (id)-[NSOrderedSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "machName");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", v5);

        if ((v12 & 1) != 0)
        {
          v7 = v10;
          goto LABEL_13;
        }
      }
      v7 = (id)-[NSOrderedSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_13:

  return v7;
}

- (id)domainsContainingServiceIdentifier:(id)a3
{
  id v5;
  void *v6;
  NSOrderedSet *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v14;
  id v15;
  objc_class *v16;
  void *v17;
  void *v18;
  id v19;
  objc_class *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  id v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  BSServicesConfiguration *v32;
  __int16 v33;
  const __CFString *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  NSClassFromString(CFSTR("NSString"));
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v28 = v15;
      v29 = 2114;
      v30 = v17;
      v31 = 2048;
      v32 = self;
      v33 = 2114;
      v34 = CFSTR("BSServicesConfiguration.m");
      v35 = 1024;
      v36 = 83;
      v37 = 2114;
      v38 = v14;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v14), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7C5B78);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v19 = (id)objc_claimAutoreleasedReturnValue();
      v20 = (objc_class *)objc_opt_class();
      NSStringFromClass(v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v28 = v19;
      v29 = 2114;
      v30 = v21;
      v31 = 2048;
      v32 = self;
      v33 = 2114;
      v34 = CFSTR("BSServicesConfiguration.m");
      v35 = 1024;
      v36 = 83;
      v37 = 2114;
      v38 = v18;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v18), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7C5C78);
  }

  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", -[NSOrderedSet count](self->_orderedDomains, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v7 = self->_orderedDomains;
  v8 = -[NSOrderedSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v23 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v11, "serviceForIdentifier:", v5);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          objc_msgSend(v6, "addObject:", v11);

      }
      v8 = -[NSOrderedSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v8);
  }

  return v6;
}

+ (id)extendAutomaticBootstrapCompletion
{
  os_unfair_lock_s *v2;
  void *v3;

  +[BSServiceManager sharedInstanceCreatingIfNecessary:]((uint64_t)BSServiceManager, 1);
  v2 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
  -[BSServiceManager extendAutomaticBootstrapCompletion](v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)registerDynamicDomainsFromPlist:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v12;
  id v13;
  objc_class *v14;
  void *v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  const __CFString *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[BSServiceManager sharedInstanceCreatingIfNecessary:]((uint64_t)BSServiceManager, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  v6 = objc_opt_self();
  +[BSServicesConfiguration _configurationFromPlist:postfixBlock:]((uint64_t)BSServicesConfiguration, v5, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "domains");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("no domains in dynamic registration : %@"), v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel__dynamicConfigWithPlist_);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v17 = v13;
      v18 = 2114;
      v19 = v15;
      v20 = 2048;
      v21 = v6;
      v22 = 2114;
      v23 = CFSTR("BSServicesConfiguration.m");
      v24 = 1024;
      v25 = 416;
      v26 = 2114;
      v27 = v12;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7C5F60);
  }

  -[BSServiceManager registerDynamicConfiguration:]((uint64_t)v4, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)activateManualDomain:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[BSServiceManager sharedInstanceCreatingIfNecessary:]((uint64_t)BSServiceManager, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSServiceManager activateManualDomain:]((uint64_t)v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (void)activateXPCService
{
  void *v2;
  void *v3;
  _Unwind_Exception *v4;

  v2 = (void *)MEMORY[0x19AECA850](a1, a2);
  +[BSServiceManager sharedInstanceCreatingIfNecessary:]((uint64_t)BSServiceManager, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSServiceManager enforceXPCServiceListenerRegistration]((uint64_t)v3);

  objc_autoreleasePoolPop(v2);
  v4 = (_Unwind_Exception *)xpc_bs_main();

  _Unwind_Resume(v4);
}

id __64__BSServicesConfiguration__configurationFromPlist_postfixBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a2;
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = v5;

    }
    else
    {
      v7 = (id)objc_msgSend(v4, "copyWithZone:", 0);

      objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v7, v7);
    }

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

void __64__BSServicesConfiguration__configurationFromPlist_postfixBlock___block_invoke_26(uint64_t a1, void *a2, void *a3)
{
  id v5;
  int v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  id v11;
  objc_class *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  objc_class *v19;
  void *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  id v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  int v41;
  uint64_t k;
  BSServiceDomainSpecification *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  id *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  objc_class *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  id v57;
  objc_class *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  id v62;
  objc_class *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  id v67;
  objc_class *v68;
  void *v69;
  uint64_t v70;
  void *v71;
  id v72;
  objc_class *v73;
  void *v74;
  uint64_t v75;
  void *v76;
  id v77;
  objc_class *v78;
  void *v79;
  uint64_t v80;
  void *v81;
  id v82;
  objc_class *v83;
  void *v84;
  uint64_t v85;
  void *v86;
  id v87;
  objc_class *v88;
  void *v89;
  uint64_t v90;
  void *v91;
  id v92;
  objc_class *v93;
  void *v94;
  uint64_t v95;
  void *v96;
  id v97;
  objc_class *v98;
  void *v99;
  uint64_t v100;
  void *v101;
  id v102;
  objc_class *v103;
  void *v104;
  uint64_t v105;
  void *v106;
  void *v107;
  void *v108;
  int v109;
  __int128 v110;
  id v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  id v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  _QWORD v126[4];
  id v127;
  id v128;
  __int128 v129;
  uint64_t v130;
  void *v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  _BYTE v136[128];
  _BYTE v137[128];
  uint8_t v138[128];
  uint8_t buf[4];
  id v140;
  __int16 v141;
  void *v142;
  __int16 v143;
  uint64_t v144;
  __int16 v145;
  const __CFString *v146;
  __int16 v147;
  int v148;
  __int16 v149;
  void *v150;
  uint64_t v151;

  v151 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v117 = a3;
  v108 = v5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("identifier of the domain must be NSString : %@"), v5);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v62 = (id)objc_claimAutoreleasedReturnValue();
      v63 = (objc_class *)objc_opt_class();
      NSStringFromClass(v63);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = *(_QWORD *)(a1 + 64);
      *(_DWORD *)buf = 138544642;
      v140 = v62;
      v141 = 2114;
      v142 = v64;
      v143 = 2048;
      v144 = v65;
      v145 = 2114;
      v146 = CFSTR("BSServicesConfiguration.m");
      v147 = 1024;
      v148 = 167;
      v149 = 2114;
      v150 = v61;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v61), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7C6E28);
  }
  v6 = objc_msgSend(v5, "hasPrefix:", CFSTR("XPCService"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("configuration of domain %@ must be NSDictionary : %@"), v5, v117);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v67 = (id)objc_claimAutoreleasedReturnValue();
      v68 = (objc_class *)objc_opt_class();
      NSStringFromClass(v68);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = *(_QWORD *)(a1 + 64);
      *(_DWORD *)buf = 138544642;
      v140 = v67;
      v141 = 2114;
      v142 = v69;
      v143 = 2048;
      v144 = v70;
      v145 = 2114;
      v146 = CFSTR("BSServicesConfiguration.m");
      v147 = 1024;
      v148 = 169;
      v149 = 2114;
      v150 = v66;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v66), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7C6F24);
  }
  objc_msgSend(v117, "objectForKey:", CFSTR("MachName"));
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    if (v116)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("MachName of domain %@ is not allowed : %@"), v5, v116);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(*(SEL *)(a1 + 56));
        v77 = (id)objc_claimAutoreleasedReturnValue();
        v78 = (objc_class *)objc_opt_class();
        NSStringFromClass(v78);
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        v80 = *(_QWORD *)(a1 + 64);
        *(_DWORD *)buf = 138544642;
        v140 = v77;
        v141 = 2114;
        v142 = v79;
        v143 = 2048;
        v144 = v80;
        v145 = 2114;
        v146 = CFSTR("BSServicesConfiguration.m");
        v147 = 1024;
        v148 = 174;
        v149 = 2114;
        v150 = v76;
        _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v76), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A7C7120);
    }
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("XPCService")) & 1) == 0)
    {
      if ((objc_msgSend(v5, "hasPrefix:", CFSTR("XPCService.")) & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("XPCService sub domain "));
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(*(SEL *)(a1 + 56));
          v97 = (id)objc_claimAutoreleasedReturnValue();
          v98 = (objc_class *)objc_opt_class();
          NSStringFromClass(v98);
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          v100 = *(_QWORD *)(a1 + 64);
          *(_DWORD *)buf = 138544642;
          v140 = v97;
          v141 = 2114;
          v142 = v99;
          v143 = 2048;
          v144 = v100;
          v145 = 2114;
          v146 = CFSTR("BSServicesConfiguration.m");
          v147 = 1024;
          v148 = 176;
          v149 = 2114;
          v150 = v96;
          _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

        }
        objc_msgSend(objc_retainAutorelease(v96), "UTF8String");
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x19A7C750CLL);
      }
      v7 = objc_msgSend(CFSTR("XPCService."), "length");
      v8 = objc_msgSend(v5, "length");
      if (v8 <= objc_msgSend(CFSTR("XPCService."), "length"))
      {
        v9 = 0;
      }
      else
      {
        objc_msgSend(v5, "substringFromIndex:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v116 = v9;
      if (!objc_msgSend(v9, "length"))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("MachName of domain %@ is invalid : %@"), v5, v9);
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(*(SEL *)(a1 + 56));
          v102 = (id)objc_claimAutoreleasedReturnValue();
          v103 = (objc_class *)objc_opt_class();
          NSStringFromClass(v103);
          v104 = (void *)objc_claimAutoreleasedReturnValue();
          v105 = *(_QWORD *)(a1 + 64);
          *(_DWORD *)buf = 138544642;
          v140 = v102;
          v141 = 2114;
          v142 = v104;
          v143 = 2048;
          v144 = v105;
          v145 = 2114;
          v146 = CFSTR("BSServicesConfiguration.m");
          v147 = 1024;
          v148 = 181;
          v149 = 2114;
          v150 = v101;
          _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

        }
        objc_msgSend(objc_retainAutorelease(v101), "UTF8String");
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x19A7C7608);
      }
      goto LABEL_17;
    }
LABEL_14:
    v116 = 0;
    goto LABEL_17;
  }
  if (!v116)
    goto LABEL_14;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("MachName of domain %@ must be NSString : %@"), v5, v116);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v11 = (id)objc_claimAutoreleasedReturnValue();
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(a1 + 64);
      *(_DWORD *)buf = 138544642;
      v140 = v11;
      v141 = 2114;
      v142 = v13;
      v143 = 2048;
      v144 = v14;
      v145 = 2114;
      v146 = CFSTR("BSServicesConfiguration.m");
      v147 = 1024;
      v148 = 184;
      v149 = 2114;
      v150 = v10;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7C63A0);
  }
LABEL_17:
  objc_msgSend(v117, "objectForKey:", CFSTR("Start"));
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    if (v114)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Start of domain %@ is not allowed : %@"), v5, v114);
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(*(SEL *)(a1 + 56));
        v82 = (id)objc_claimAutoreleasedReturnValue();
        v83 = (objc_class *)objc_opt_class();
        NSStringFromClass(v83);
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        v85 = *(_QWORD *)(a1 + 64);
        *(_DWORD *)buf = 138544642;
        v140 = v82;
        v141 = 2114;
        v142 = v84;
        v143 = 2048;
        v144 = v85;
        v145 = 2114;
        v146 = CFSTR("BSServicesConfiguration.m");
        v147 = 1024;
        v148 = 191;
        v149 = 2114;
        v150 = v81;
        _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v81), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A7C721CLL);
    }
    v15 = 3;
  }
  else
  {
    if (!v114)
    {
      v112 = 0;
      goto LABEL_28;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Start of domain %@ must be NSString : %@"), v5, v114);
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(*(SEL *)(a1 + 56));
        v87 = (id)objc_claimAutoreleasedReturnValue();
        v88 = (objc_class *)objc_opt_class();
        NSStringFromClass(v88);
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        v90 = *(_QWORD *)(a1 + 64);
        *(_DWORD *)buf = 138544642;
        v140 = v87;
        v141 = 2114;
        v142 = v89;
        v143 = 2048;
        v144 = v90;
        v145 = 2114;
        v146 = CFSTR("BSServicesConfiguration.m");
        v147 = 1024;
        v148 = 194;
        v149 = 2114;
        v150 = v86;
        _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v86), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A7C7318);
    }
    if ((objc_msgSend(v114, "isEqualToString:", CFSTR("ManualBootstrap")) & 1) != 0)
    {
      v15 = 1;
    }
    else
    {
      if ((objc_msgSend(v114, "isEqualToString:", CFSTR("ManualSession")) & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unrecognized Start value of domain %@ : %@"), v5, v114);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(*(SEL *)(a1 + 56));
          v57 = (id)objc_claimAutoreleasedReturnValue();
          v58 = (objc_class *)objc_opt_class();
          NSStringFromClass(v58);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v60 = *(_QWORD *)(a1 + 64);
          *(_DWORD *)buf = 138544642;
          v140 = v57;
          v141 = 2114;
          v142 = v59;
          v143 = 2048;
          v144 = v60;
          v145 = 2114;
          v146 = CFSTR("BSServicesConfiguration.m");
          v147 = 1024;
          v148 = 200;
          v149 = 2114;
          v150 = v56;
          _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

        }
        objc_msgSend(objc_retainAutorelease(v56), "UTF8String");
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x19A7C6D30);
      }
      v15 = 2;
    }
  }
  v112 = (void *)v15;
LABEL_28:
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v117, "objectForKey:", CFSTR("DerivedServiceRestrictions"));
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    if (v113)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DerivedServiceRestrictions of domain %@ is not allowed : %@"), v108, v113);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(*(SEL *)(a1 + 56));
        v18 = (id)objc_claimAutoreleasedReturnValue();
        v19 = (objc_class *)objc_opt_class();
        NSStringFromClass(v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = *(_QWORD *)(a1 + 64);
        *(_DWORD *)buf = 138544642;
        v140 = v18;
        v141 = 2114;
        v142 = v20;
        v143 = 2048;
        v144 = v21;
        v145 = 2114;
        v146 = CFSTR("BSServicesConfiguration.m");
        v147 = 1024;
        v148 = 208;
        v149 = 2114;
        v150 = v17;
        _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v17), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A7C6580);
    }
  }
  else
  {
    if (v113)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DerivedServiceRestrictions of domain %@ was of an unexpected type : %@"), v108, v113);
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(*(SEL *)(a1 + 56));
          v92 = (id)objc_claimAutoreleasedReturnValue();
          v93 = (objc_class *)objc_opt_class();
          NSStringFromClass(v93);
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          v95 = *(_QWORD *)(a1 + 64);
          *(_DWORD *)buf = 138544642;
          v140 = v92;
          v141 = 2114;
          v142 = v94;
          v143 = 2048;
          v144 = v95;
          v145 = 2114;
          v146 = CFSTR("BSServicesConfiguration.m");
          v147 = 1024;
          v148 = 210;
          v149 = 2114;
          v150 = v91;
          _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

        }
        objc_msgSend(objc_retainAutorelease(v91), "UTF8String");
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x19A7C7418);
      }
    }
    v134 = 0u;
    v135 = 0u;
    v132 = 0u;
    v133 = 0u;
    v22 = v113;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v132, v138, 16);
    if (v23)
    {
      v24 = *(_QWORD *)v133;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v133 != v24)
            objc_enumerationMutation(v22);
          v26 = *(_QWORD *)(*((_QWORD *)&v132 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("entry of DerivedServiceRestrictions of domain %@ must be NSString : %@"), v108, v26);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              NSStringFromSelector(*(SEL *)(a1 + 56));
              v52 = (id)objc_claimAutoreleasedReturnValue();
              v53 = (objc_class *)objc_opt_class();
              NSStringFromClass(v53);
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              v55 = *(_QWORD *)(a1 + 64);
              *(_DWORD *)buf = 138544642;
              v140 = v52;
              v141 = 2114;
              v142 = v54;
              v143 = 2048;
              v144 = v55;
              v145 = 2114;
              v146 = CFSTR("BSServicesConfiguration.m");
              v147 = 1024;
              v148 = 212;
              v149 = 2114;
              v150 = v51;
              _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

            }
            objc_msgSend(objc_retainAutorelease(v51), "UTF8String");
            _bs_set_crash_log_message();
            __break(0);
            JUMPOUT(0x19A7C6C34);
          }
          (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addObject:", v27);

        }
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v132, v138, 16);
      }
      while (v23);
    }

  }
  objc_msgSend(v117, "objectForKey:", CFSTR("Services"));
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("expected a Services entry in the configuration of domain %@ : %@"), v108, v117);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v72 = (id)objc_claimAutoreleasedReturnValue();
      v73 = (objc_class *)objc_opt_class();
      NSStringFromClass(v73);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v75 = *(_QWORD *)(a1 + 64);
      *(_DWORD *)buf = 138544642;
      v140 = v72;
      v141 = 2114;
      v142 = v74;
      v143 = 2048;
      v144 = v75;
      v145 = 2114;
      v146 = CFSTR("BSServicesConfiguration.m");
      v147 = 1024;
      v148 = 219;
      v149 = 2114;
      v150 = v71;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v71), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7C7024);
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v115, "count"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v126[0] = MEMORY[0x1E0C809B0];
  v126[1] = 3221225472;
  v126[2] = __64__BSServicesConfiguration__configurationFromPlist_postfixBlock___block_invoke_70;
  v126[3] = &unk_1E390D518;
  v29 = v108;
  v30 = *(_QWORD *)(a1 + 64);
  v127 = v29;
  v130 = v30;
  v131 = v112;
  v110 = *(_OWORD *)(a1 + 48);
  v31 = (id)v110;
  v129 = v110;
  v111 = v28;
  v128 = v111;
  objc_msgSend(v115, "enumerateKeysAndObjectsUsingBlock:", v126);
  objc_msgSend(v117, "objectForKey:", CFSTR("EnableIfFeatureFlag"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v106 = v32;
  if (v32)
  {
    +[BSServicesConfiguration _parseFeatureFlagsForDomain:parameterName:featureFlags:](*(_QWORD *)(a1 + 64), v29, CFSTR("EnableIfFeatureFlag"), v32);
    v124 = 0u;
    v125 = 0u;
    v122 = 0u;
    v123 = 0u;
    v33 = (id)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v122, v137, 16);
    if (v34)
    {
      v35 = *(_QWORD *)v123;
      while (2)
      {
        for (j = 0; j != v34; ++j)
        {
          if (*(_QWORD *)v123 != v35)
            objc_enumerationMutation(v33);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v122 + 1) + 8 * j), "isEnabled") & 1) == 0)
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v140 = v29;
              _os_log_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Feature flag enablement conditional for BSServiceDomain %{public}@ not satisfied; ignoring domain.",
                buf,
                0xCu);
            }
            v109 = 1;
            goto LABEL_58;
          }
        }
        v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v122, v137, 16);
        if (v34)
          continue;
        break;
      }
    }
    v109 = 0;
LABEL_58:

  }
  else
  {
    v109 = 0;
    v33 = 0;
  }
  objc_msgSend(v117, "objectForKey:", CFSTR("DisableIfFeatureFlag"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v107 = v37;
  if (!v37)
  {
    v38 = 0;
    goto LABEL_75;
  }
  +[BSServicesConfiguration _parseFeatureFlagsForDomain:parameterName:featureFlags:](*(_QWORD *)(a1 + 64), v29, CFSTR("DisableIfFeatureFlag"), v37);
  v120 = 0u;
  v121 = 0u;
  v118 = 0u;
  v119 = 0u;
  v38 = (id)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v118, v136, 16);
  if (!v39)
  {

LABEL_72:
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v140 = v29;
      _os_log_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Feature flag disablement conditional met for BSServiceDomain %{public}@; ignoring domain.",
        buf,
        0xCu);
    }
    v109 = 1;
    goto LABEL_75;
  }
  v40 = *(_QWORD *)v119;
  v41 = 1;
  do
  {
    for (k = 0; k != v39; ++k)
    {
      if (*(_QWORD *)v119 != v40)
        objc_enumerationMutation(v38);
      v41 &= objc_msgSend(*(id *)(*((_QWORD *)&v118 + 1) + 8 * k), "isEnabled");
    }
    v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v118, v136, 16);
  }
  while (v39);

  if ((v41 & 1) != 0)
    goto LABEL_72;
LABEL_75:
  v43 = [BSServiceDomainSpecification alloc];
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend(v16, "count");
  if (v46)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    v47 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v47 = 0;
  }
  v48 = -[BSServiceDomainSpecification _initWithIdentifier:machName:start:servicesByIdentifier:derivedServiceRestrictions:enableIfFeatureFlags:disableIfFeatureFlags:]((id *)&v43->super.isa, v44, v45, v112, v111, v47, v33, v38);
  if (v46)

  if (v109)
    v49 = *(void **)(a1 + 32);
  else
    v49 = *(void **)(a1 + 40);
  objc_msgSend(v48, "identifier");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setObject:forKey:", v48, v50);

}

void __64__BSServicesConfiguration__configurationFromPlist_postfixBlock___block_invoke_70(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  BSServiceSpecification *v11;
  void *v12;
  char v13;
  uint64_t v14;
  void *v15;
  _QWORD *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  objc_class *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  objc_class *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  id v31;
  objc_class *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  id v36;
  objc_class *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  id v41;
  _QWORD v42[4];
  id v43;
  id v44;
  uint8_t buf[4];
  id v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  const __CFString *v52;
  __int16 v53;
  int v54;
  __int16 v55;
  void *v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v41 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("identifier of a service in domatin %@ must be NSString : %@"), *(_QWORD *)(a1 + 32), v41);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v21 = (id)objc_claimAutoreleasedReturnValue();
      v22 = (objc_class *)objc_opt_class();
      NSStringFromClass(v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = *(_QWORD *)(a1 + 64);
      *(_DWORD *)buf = 138544642;
      v46 = v21;
      v47 = 2114;
      v48 = v23;
      v49 = 2048;
      v50 = v24;
      v51 = 2114;
      v52 = CFSTR("BSServicesConfiguration.m");
      v53 = 1024;
      v54 = 223;
      v55 = 2114;
      v56 = v20;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v20), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7C7D24);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("configuration of service %@ in domain %@ must be NSDictionary : %@"), v41, *(_QWORD *)(a1 + 32), v5);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v26 = (id)objc_claimAutoreleasedReturnValue();
      v27 = (objc_class *)objc_opt_class();
      NSStringFromClass(v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = *(_QWORD *)(a1 + 64);
      *(_DWORD *)buf = 138544642;
      v46 = v26;
      v47 = 2114;
      v48 = v28;
      v49 = 2048;
      v50 = v29;
      v51 = 2114;
      v52 = CFSTR("BSServicesConfiguration.m");
      v53 = 1024;
      v54 = 224;
      v55 = 2114;
      v56 = v25;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v25), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7C7E28);
  }
  objc_msgSend(v5, "objectForKey:", CFSTR("HideAtLaunch"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v5;
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("HideAtLaunch value of service %@ in domain %@ was of an unexpected type : %@"), v41, *(_QWORD *)(a1 + 32), v6);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(*(SEL *)(a1 + 56));
        v31 = (id)objc_claimAutoreleasedReturnValue();
        v32 = (objc_class *)objc_opt_class();
        NSStringFromClass(v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = *(_QWORD *)(a1 + 64);
        *(_DWORD *)buf = 138544642;
        v46 = v31;
        v47 = 2114;
        v48 = v33;
        v49 = 2048;
        v50 = v34;
        v51 = 2114;
        v52 = CFSTR("BSServicesConfiguration.m");
        v53 = 1024;
        v54 = 229;
        v55 = 2114;
        v56 = v30;
        _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v30), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A7C7F2CLL);
    }
    if (objc_msgSend(v6, "BOOLValue") && *(_QWORD *)(a1 + 72))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("HideAtLaunch is only supported for automatic domains"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(*(SEL *)(a1 + 56));
        v36 = (id)objc_claimAutoreleasedReturnValue();
        v37 = (objc_class *)objc_opt_class();
        NSStringFromClass(v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = *(_QWORD *)(a1 + 64);
        *(_DWORD *)buf = 138544642;
        v46 = v36;
        v47 = 2114;
        v48 = v38;
        v49 = 2048;
        v50 = v39;
        v51 = 2114;
        v52 = CFSTR("BSServicesConfiguration.m");
        v53 = 1024;
        v54 = 231;
        v55 = 2114;
        v56 = v35;
        _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v35), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A7C8020);
    }
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bs_safeDictionaryForKey:", CFSTR("Options"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __64__BSServicesConfiguration__configurationFromPlist_postfixBlock___block_invoke_84;
  v42[3] = &unk_1E390D4F0;
  v9 = v7;
  v43 = v9;
  v44 = *(id *)(a1 + 48);
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v42);

  v10 = *(_QWORD *)(a1 + 48);
  v11 = [BSServiceSpecification alloc];
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v6, "BOOLValue");
  v14 = objc_msgSend(v9, "count");
  if (v14)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }
  v16 = -[BSServiceSpecification _initWithIdentifier:hiddenAtLaunch:derived:options:](v11, v12, v13, 0, v15);
  (*(void (**)(uint64_t, _QWORD *))(v10 + 16))(v10, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  v18 = *(void **)(a1 + 40);
  objc_msgSend(v17, "identifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKey:", v17, v19);

}

void __64__BSServicesConfiguration__configurationFromPlist_postfixBlock___block_invoke_84(uint64_t a1, void *a2, void *a3)
{
  _dedupeOptions(*(void **)(a1 + 32), a3, a2, *(void **)(a1 + 40));
}

+ (id)_parseFeatureFlagsForDomain:(void *)a3 parameterName:(void *)a4 featureFlags:
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void (**v10)(_QWORD, _QWORD);
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  id v21;
  objc_class *v22;
  void *v23;
  void *v24;
  id v25;
  objc_class *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[7];
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint8_t v39[128];
  uint8_t buf[4];
  id v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  const __CFString *v47;
  __int16 v48;
  int v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  v8 = a4;
  v9 = objc_opt_self();
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__0;
  v37 = __Block_byref_object_dispose__0;
  v38 = 0;
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __82__BSServicesConfiguration__parseFeatureFlagsForDomain_parameterName_featureFlags___block_invoke;
  v32[3] = &unk_1E390D5E8;
  v32[5] = sel__parseFeatureFlagsForDomain_parameterName_featureFlags_;
  v32[6] = v9;
  v32[4] = &v33;
  v10 = (void (**)(_QWORD, _QWORD))MEMORY[0x19AECAA00](v32);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    ((void (**)(_QWORD, id))v10)[2](v10, v8);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v17 = (void *)MEMORY[0x1E0CB3940];
      v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__parseFeatureFlagsForDomain_parameterName_featureFlags_);
        v21 = (id)objc_claimAutoreleasedReturnValue();
        v22 = (objc_class *)objc_opt_class();
        NSStringFromClass(v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v41 = v21;
        v42 = 2114;
        v43 = v23;
        v44 = 2048;
        v45 = v9;
        v46 = 2114;
        v47 = CFSTR("BSServicesConfiguration.m");
        v48 = 1024;
        v49 = 408;
        v50 = 2114;
        v51 = v20;
        _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v20), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A7C8A74);
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("FeatureFlagConditionals"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__parseFeatureFlagsForDomain_parameterName_featureFlags_);
        v25 = (id)objc_claimAutoreleasedReturnValue();
        v26 = (objc_class *)objc_opt_class();
        NSStringFromClass(v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v41 = v25;
        v42 = 2114;
        v43 = v27;
        v44 = 2048;
        v45 = v9;
        v46 = 2114;
        v47 = CFSTR("BSServicesConfiguration.m");
        v48 = 1024;
        v49 = 403;
        v50 = 2114;
        v51 = v24;
        _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v24), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A7C8B64);
    }
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v11 = v8;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v39, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v29;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v29 != v13)
            objc_enumerationMutation(v11);
          v10[2](v10, *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v14++));
        }
        while (v12 != v14);
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v39, 16);
      }
      while (v12);
    }

  }
  v15 = (id)v34[5];

  _Block_object_dispose(&v33, 8);
  return v15;
}

uint64_t __84__BSServicesConfiguration__initWithDomainsByIdentifier_disabledDomainsByIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "compare:", v6);

  return v7;
}

id *__56__BSServicesConfiguration__bootstrapConfigWithEnv_info___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  void (**v5)(id, _QWORD);
  _QWORD *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  _BOOL4 v14;
  BSServiceSpecification *v15;
  void *v16;
  _QWORD *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  _QWORD *v26;
  void *v27;
  void *v28;
  id *v29;
  void *v31;
  void *v32;
  void *v33;
  id *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  v34 = v4;
  objc_msgSend(v4, "domainsContainingServiceIdentifier:", CFSTR("com.apple.frontboard.system-service"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v31, "count") == 1)
  {
    objc_msgSend(v31, "anyObject");
    v6 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "serviceForIdentifier:", CFSTR("com.apple.frontboard.system-service"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v7 = (void *)v6[8];
    else
      v7 = 0;
    v8 = v7;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v9 = objc_msgSend(&unk_1E3918B48, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v40 != v10)
            objc_enumerationMutation(&unk_1E3918B48);
          v12 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i);
          if ((objc_msgSend(v8, "containsObject:", v12) & 1) == 0)
          {
            objc_msgSend(v34, "domainsContainingServiceIdentifier:", v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v13, "count") == 0;

            if (v14)
            {
              v15 = [BSServiceSpecification alloc];
              v5[2](v5, v12);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = -[BSServiceSpecification _initWithIdentifier:hiddenAtLaunch:derived:options:](v15, v16, objc_msgSend(v32, "isHiddenAtLaunch"), 1, 0);

              ((void (**)(id, _QWORD *))v5)[2](v5, v17);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "addObject:", v18);

            }
          }
        }
        v9 = objc_msgSend(&unk_1E3918B48, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
      }
      while (v9);
    }
    if (objc_msgSend(v33, "count"))
    {
      v19 = (void *)MEMORY[0x1E0C99E08];
      objc_msgSend(v34, "domains");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "dictionaryWithCapacity:", objc_msgSend(v20, "count"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      objc_msgSend(v34, "domains");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
      if (v23)
      {
        v24 = *(_QWORD *)v36;
        do
        {
          for (j = 0; j != v23; ++j)
          {
            if (*(_QWORD *)v36 != v24)
              objc_enumerationMutation(v22);
            v26 = *(_QWORD **)(*((_QWORD *)&v35 + 1) + 8 * j);
            if (v26 == v6)
            {
              -[BSServiceDomainSpecification _domainWithAdditionalServices:]((id *)v6, v33);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "identifier");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "setObject:forKey:", v27, v28);

            }
            else
            {
              objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * j), "identifier");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "setObject:forKey:", v26, v27);
            }

          }
          v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
        }
        while (v23);
      }

      v29 = -[BSServicesConfiguration _initWithDomainsByIdentifier:disabledDomainsByIdentifier:]((id *)[BSServicesConfiguration alloc], v21, 0);
      v34 = v29;
    }

  }
  return v34;
}

void __82__BSServicesConfiguration__parseFeatureFlagsForDomain_parameterName_featureFlags___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  BSServiceFeatureFlag *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  objc_class *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  objc_class *v18;
  void *v19;
  uint64_t v20;
  id v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  const __CFString *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v21 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("FeatureFlagConditional values must be NSString types."));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v12 = (id)objc_claimAutoreleasedReturnValue();
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138544642;
      v23 = v12;
      v24 = 2114;
      v25 = v14;
      v26 = 2048;
      v27 = v15;
      v28 = 2114;
      v29 = CFSTR("BSServicesConfiguration.m");
      v30 = 1024;
      v31 = 385;
      v32 = 2114;
      v33 = v11;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7C9398);
  }
  objc_msgSend(v21, "componentsSeparatedByString:", CFSTR("/"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") != 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Feature flags must be defined in the format: Domain/FeatureName"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v17 = (id)objc_claimAutoreleasedReturnValue();
      v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138544642;
      v23 = v17;
      v24 = 2114;
      v25 = v19;
      v26 = 2048;
      v27 = v20;
      v28 = 2114;
      v29 = CFSTR("BSServicesConfiguration.m");
      v30 = 1024;
      v31 = 387;
      v32 = 2114;
      v33 = v16;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v16), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7C948CLL);
  }
  objc_msgSend(v3, "objectAtIndex:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndex:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[BSServiceFeatureFlag initWithDomain:featureName:]([BSServiceFeatureFlag alloc], "initWithDomain:featureName:", v4, v5);
  v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  }
  objc_msgSend(v7, "addObject:", v6);

}

- (NSString)description
{
  return (NSString *)-[BSServicesConfiguration descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[BSServicesConfiguration succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[BSServicesConfiguration descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  BSServicesConfiguration *v11;

  v4 = a3;
  -[BSServicesConfiguration succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __65__BSServicesConfiguration_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E390D478;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);
  v7 = v6;

  return v7;
}

void __65__BSServicesConfiguration_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "array");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "appendArraySection:withName:skipIfEmpty:");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderedDomains, 0);
  objc_storeStrong((id *)&self->_disabledDomainsByIdentifier, 0);
  objc_storeStrong((id *)&self->_domainsByIdentifier, 0);
}

@end
