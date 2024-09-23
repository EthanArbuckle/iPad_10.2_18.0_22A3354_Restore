@implementation HANanoSettings

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_348 != -1)
    dispatch_once(&sharedInstance_onceToken_348, &__block_literal_global_349);
  return (id)sharedInstance_Settings_347;
}

void __32__HANanoSettings_sharedInstance__block_invoke()
{
  HANanoSettings *v0;
  void *v1;

  v0 = objc_alloc_init(HANanoSettings);
  v1 = (void *)sharedInstance_Settings_347;
  sharedInstance_Settings_347 = (uint64_t)v0;

}

- (HANanoSettings)init
{
  HANanoSettings *v2;
  uint64_t v3;
  NPSDomainAccessor *globalDomainAccessor;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HANanoSettings;
  v2 = -[HUHearingAidSettings init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0D51610]), "initWithDomain:", CFSTR(".GlobalPreferences"));
    globalDomainAccessor = v2->_globalDomainAccessor;
    v2->_globalDomainAccessor = (NPSDomainAccessor *)v3;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel_pairedWatchDidChange_, *MEMORY[0x1E0D517D0], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v2, sel_pairedWatchDidChange_, *MEMORY[0x1E0D517A8], 0);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)HANanoSettings;
  -[HUHearingAidSettings dealloc](&v4, sel_dealloc);
}

- (void)pairedWatchDidChange:(id)a3
{
  NPSDomainAccessor *domainAccessor;

  domainAccessor = self->_domainAccessor;
  self->_domainAccessor = 0;

}

- (id)nanoDomainAccessor
{
  NPSDomainAccessor *domainAccessor;
  id v4;
  NPSDomainAccessor *v5;
  NPSDomainAccessor *v6;

  domainAccessor = self->_domainAccessor;
  if (!domainAccessor)
  {
    v4 = objc_alloc(MEMORY[0x1E0D51610]);
    v5 = (NPSDomainAccessor *)objc_msgSend(v4, "initWithDomain:", *MEMORY[0x1E0DDE118]);
    v6 = self->_domainAccessor;
    self->_domainAccessor = v5;

    domainAccessor = self->_domainAccessor;
  }
  return domainAccessor;
}

- (id)currentLocale
{
  id v3;

  v3 = (id)-[NPSDomainAccessor synchronize](self->_globalDomainAccessor, "synchronize");
  return (id)-[NPSDomainAccessor objectForKey:](self->_globalDomainAccessor, "objectForKey:", CFSTR("AppleLocale"));
}

- (BOOL)shouldUseiCloud
{
  return 0;
}

- (void)setValue:(id)a3 forPreferenceKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  os_log_t *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  os_log_t v18;
  id v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  uint8_t buf[4];
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  HAInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Setting nano value %@ - %@"), v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HANanoSettings setValue:forPreferenceKey:]", 1232, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (os_log_t *)MEMORY[0x1E0D2F928];
  v11 = (void *)*MEMORY[0x1E0D2F928];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
  {
    v12 = objc_retainAutorelease(v9);
    v13 = v11;
    *(_DWORD *)buf = 136446210;
    v29 = objc_msgSend(v12, "UTF8String");
    _os_log_impl(&dword_1DE311000, v13, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  -[HANanoSettings nanoDomainAccessor](self, "nanoDomainAccessor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKey:", v6, v7);
  objc_msgSend(v14, "synchronize");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    HAInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error synchronizing accessor %@"), v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HANanoSettings setValue:forPreferenceKey:]", 1238, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
    {
      v19 = objc_retainAutorelease(v17);
      v20 = v18;
      v21 = objc_msgSend(v19, "UTF8String");
      *(_DWORD *)buf = 136446210;
      v29 = v21;
      _os_log_impl(&dword_1DE311000, v20, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
  }
  v22 = (void *)objc_opt_new();
  v23 = *MEMORY[0x1E0DDE118];
  v24 = (void *)MEMORY[0x1E0C99E60];
  v27 = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setWithArray:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "synchronizeNanoDomain:keys:", v23, v26);

}

- (id)_valueForPreferenceKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HANanoSettings nanoDomainAccessor](self, "nanoDomainAccessor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "synchronize");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    HAInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error synchronizing accessor %@"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HANanoSettings _valueForPreferenceKey:]", 1251, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)*MEMORY[0x1E0D2F928];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
    {
      v10 = objc_retainAutorelease(v8);
      v11 = v9;
      *(_DWORD *)buf = 136446210;
      v15 = objc_msgSend(v10, "UTF8String");
      _os_log_impl(&dword_1DE311000, v11, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
  }
  objc_msgSend(v5, "objectForKey:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (NPSDomainAccessor)domainAccessor
{
  return self->_domainAccessor;
}

- (void)setDomainAccessor:(id)a3
{
  objc_storeStrong((id *)&self->_domainAccessor, a3);
}

- (NPSDomainAccessor)globalDomainAccessor
{
  return self->_globalDomainAccessor;
}

- (void)setGlobalDomainAccessor:(id)a3
{
  objc_storeStrong((id *)&self->_globalDomainAccessor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_globalDomainAccessor, 0);
  objc_storeStrong((id *)&self->_domainAccessor, 0);
}

@end
