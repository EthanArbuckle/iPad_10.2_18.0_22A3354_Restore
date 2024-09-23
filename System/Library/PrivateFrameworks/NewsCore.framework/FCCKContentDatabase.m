@implementation FCCKContentDatabase

- (id)generateURLForResourceID:(id)a3
{
  id v4;
  void *v5;
  void *v7;
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
  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "resourceID != nil");
    *(_DWORD *)buf = 136315906;
    v9 = "-[FCCKContentDatabase generateURLForResourceID:]";
    v10 = 2080;
    v11 = "FCCKContentDatabase.m";
    v12 = 1024;
    v13 = 113;
    v14 = 2114;
    v15 = v7;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  -[FCCKContentDatabase permanentURLForRecordID:field:](self, "permanentURLForRecordID:field:", v4, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)permanentURLForRecordID:(id)a3 field:(int64_t)a4
{
  id v6;
  int v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = -[FCCKContentDatabase shouldUseSecureConnectionForCKAssetURLs](self, "shouldUseSecureConnectionForCKAssetURLs");
  -[FCCKContentDatabase containerIdentifier](self, "containerIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  FCPermanentURLForRecordID(v6, a4, v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSString)containerIdentifier
{
  return self->_containerIdentifier;
}

- (BOOL)shouldUseSecureConnectionForCKAssetURLs
{
  return self->_shouldUseSecureConnectionForCKAssetURLs;
}

- (FCNetworkBehaviorMonitor)networkBehaviorMonitor
{
  return self->_networkBehaviorMonitor;
}

- (BOOL)isProductionEnvironment
{
  return self->_isProductionEnvironment;
}

- (BOOL)shouldUseCloudd
{
  return self->_shouldUseCloudd;
}

- (FCNetworkReachabilityType)networkReachability
{
  return self->_networkReachability;
}

- (NSURL)baseURLForEdgeCachedMultiFetch
{
  void *v2;
  void *v3;
  void *v4;

  -[FCCKContentDatabase configurationManager](self, "configurationManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCBaseURLConfiguration ckEdgeCachedMultiFetchBaseURLForConfiguration:](FCBaseURLConfiguration, "ckEdgeCachedMultiFetchBaseURLForConfiguration:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v4;
}

- (FCCoreConfigurationManager)configurationManager
{
  return self->_configurationManager;
}

- (NSURL)baseURLForRecordFetch
{
  void *v2;
  void *v3;
  void *v4;

  -[FCCKContentDatabase configurationManager](self, "configurationManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCBaseURLConfiguration ckRecordFetchBaseURLForConfiguration:](FCBaseURLConfiguration, "ckRecordFetchBaseURLForConfiguration:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v4;
}

- (void)setShouldUseSecureConnectionForCKAssetURLs:(BOOL)a3
{
  self->_shouldUseSecureConnectionForCKAssetURLs = a3;
}

- (void)setMaximumRetryAfterForCK:(double)a3
{
  self->_maximumRetryAfterForCK = a3;
}

- (double)maximumRetryAfterForCK
{
  return self->_maximumRetryAfterForCK;
}

- (NSURL)baseURLForOrderFeed
{
  void *v2;
  void *v3;
  void *v4;

  -[FCCKContentDatabase configurationManager](self, "configurationManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCBaseURLConfiguration ckOrderFeedBaseURLForConfiguration:](FCBaseURLConfiguration, "ckOrderFeedBaseURLForConfiguration:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v4;
}

- (NSURL)baseURLForMultiFetch
{
  void *v2;
  void *v3;
  void *v4;

  -[FCCKContentDatabase configurationManager](self, "configurationManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCBaseURLConfiguration ckMultiFetchBaseURLForConfiguration:](FCBaseURLConfiguration, "ckMultiFetchBaseURLForConfiguration:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v4;
}

- (FCCKContentDatabase)initWithContainerIdentifier:(id)a3 productionEnvironment:(BOOL)a4 networkBehaviorMonitor:(id)a5 networkReachability:(id)a6 configurationManager:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  FCCKContentDatabase *v16;
  uint64_t v17;
  NSString *containerIdentifier;
  objc_super v20;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v20.receiver = self;
  v20.super_class = (Class)FCCKContentDatabase;
  v16 = -[FCCKContentDatabase init](&v20, sel_init);
  if (v16)
  {
    v17 = objc_msgSend(v12, "copy");
    containerIdentifier = v16->_containerIdentifier;
    v16->_containerIdentifier = (NSString *)v17;

    v16->_isProductionEnvironment = a4;
    objc_storeStrong((id *)&v16->_networkBehaviorMonitor, a5);
    objc_storeStrong((id *)&v16->_networkReachability, a6);
    objc_storeStrong((id *)&v16->_configurationManager, a7);
  }

  return v16;
}

- (FCCKContentDatabase)init
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
    v8 = "-[FCCKContentDatabase init]";
    v9 = 2080;
    v10 = "FCCKContentDatabase.m";
    v11 = 1024;
    v12 = 29;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCCKContentDatabase init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (void)updateAssetURLHostIfNeededWithComponents:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[FCCKContentDatabase containerIdentifier](self, "containerIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  FCUpdateAssetURLHostIfNeededWithParameters(v4, v5, -[FCCKContentDatabase shouldBypassCDNForCKAssetURLs](self, "shouldBypassCDNForCKAssetURLs"));

}

- (BOOL)shouldBypassCDNForCKAssetURLs
{
  if (qword_1ED0F80A0 != -1)
    dispatch_once(&qword_1ED0F80A0, &__block_literal_global_59);
  return _MergedGlobals_160;
}

void __52__FCCKContentDatabase_shouldBypassCDNForCKAssetURLs__block_invoke()
{
  id v0;

  NewsCoreUserDefaults();
  v0 = (id)objc_claimAutoreleasedReturnValue();
  _MergedGlobals_160 = objc_msgSend(v0, "BOOLForKey:", CFSTR("replace_cdn_with_cvws"));

}

- (NSURL)baseURLForEdgeCachedOrderFeed
{
  void *v2;
  void *v3;
  void *v4;

  -[FCCKContentDatabase configurationManager](self, "configurationManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCBaseURLConfiguration ckEdgeCachedOrderFeedBaseURLForConfiguration:](FCBaseURLConfiguration, "ckEdgeCachedOrderFeedBaseURLForConfiguration:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v4;
}

- (void)addOperation:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Abstract method"));
    *(_DWORD *)buf = 136315906;
    v10 = "-[FCCKContentDatabase addOperation:]";
    v11 = 2080;
    v12 = "FCCKContentDatabase.m";
    v13 = 1024;
    v14 = 92;
    v15 = 2114;
    v16 = v4;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "-[FCCKContentDatabase addOperation:]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v7, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v8);
}

- (id)permanentURLForRecordID:(id)a3 field:(int64_t)a4 useSecureConnection:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  void *v10;

  v5 = a5;
  v8 = a3;
  -[FCCKContentDatabase containerIdentifier](self, "containerIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  FCPermanentURLForRecordID(v8, a4, v9, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)setShouldBypassCDNForCKAssetURLs:(BOOL)a3
{
  self->_shouldBypassCDNForCKAssetURLs = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_storeStrong((id *)&self->_networkReachability, 0);
  objc_storeStrong((id *)&self->_networkBehaviorMonitor, 0);
  objc_storeStrong((id *)&self->_containerIdentifier, 0);
}

@end
