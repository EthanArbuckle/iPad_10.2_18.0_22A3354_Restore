@implementation CPLConfigurationDictionary

- (CPLConfigurationDictionary)initWithConfiguration:(id)a3 refreshIntervalKey:(id)a4 minRefreshInterval:(double)a5 lastUpdateDate:(id)a6
{
  id v10;
  id v11;
  id v12;
  CPLConfigurationDictionary *v13;
  uint64_t v14;
  NSDictionary *configuration;
  uint64_t v16;
  NSString *refreshIntervalKey;
  double v18;
  uint64_t v19;
  NSDate *lastUpdateDate;
  objc_super v22;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v22.receiver = self;
  v22.super_class = (Class)CPLConfigurationDictionary;
  v13 = -[CPLConfigurationDictionary init](&v22, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v10, "copy");
    configuration = v13->_configuration;
    v13->_configuration = (NSDictionary *)v14;

    v16 = objc_msgSend(v11, "copy");
    refreshIntervalKey = v13->_refreshIntervalKey;
    v13->_refreshIntervalKey = (NSString *)v16;

    v13->_minRefreshInterval = a5;
    -[NSDate timeIntervalSinceNow](v13->_lastUpdateDate, "timeIntervalSinceNow");
    if (v18 <= 0.0)
      v19 = objc_msgSend(v12, "copy");
    else
      v19 = 0;
    lastUpdateDate = v13->_lastUpdateDate;
    v13->_lastUpdateDate = (NSDate *)v19;

  }
  return v13;
}

- (CPLConfigurationDictionary)initWithConfigurationName:(id)a3 refreshIntervalKey:(id)a4 minRefreshInterval:(double)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  CPLConfigurationDictionary *v15;
  NSObject *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "URLForResource:withExtension:", v9, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    if (!_CPLSilentLogging)
    {
      __CPLGenericOSLogDomain();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v30 = v18;
        v31 = 2112;
        v32 = (id)objc_opt_class();
        v19 = v32;
        _os_log_impl(&dword_1B03C2000, v17, OS_LOG_TYPE_ERROR, "Can't find configuration in %@ for %@", buf, 0x16u);

      }
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLConfigurationDictionary.m");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v21, 52, CFSTR("Can't find configuration in %@ for %@"), v22, objc_opt_class());

    abort();
  }
  v28 = 0;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithContentsOfURL:error:", v12, &v28);
  v14 = v28;
  if (!v13)
  {
    if (!_CPLSilentLogging)
    {
      __CPLGenericOSLogDomain();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v12, "path");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v30 = v24;
        v31 = 2112;
        v32 = v14;
        _os_log_impl(&dword_1B03C2000, v23, OS_LOG_TYPE_ERROR, "Unable to load configuration from %@: %@", buf, 0x16u);

      }
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLConfigurationDictionary.m");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "path");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v26, 55, CFSTR("Unable to load configuration from %@: %@"), v27, v14);

    abort();
  }
  v15 = -[CPLConfigurationDictionary initWithConfiguration:refreshIntervalKey:minRefreshInterval:lastUpdateDate:](self, "initWithConfiguration:refreshIntervalKey:minRefreshInterval:lastUpdateDate:", v13, v10, 0, a5);

  return v15;
}

- (CPLConfigurationDictionary)initWithData:(id)a3 refreshIntervalKey:(id)a4 minRefreshInterval:(double)a5 error:(id *)a6
{
  id v10;
  void *v11;
  void *v12;
  CPLConfigurationDictionary *v13;

  v10 = a4;
  objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", a3, 0, 0, a6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[CPLConfigurationDictionary initWithConfiguration:refreshIntervalKey:minRefreshInterval:lastUpdateDate:](self, "initWithConfiguration:refreshIntervalKey:minRefreshInterval:lastUpdateDate:", v11, v10, v12, a5);

    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (CPLConfigurationDictionary)initWithContentsOfURL:(id)a3 refreshIntervalKey:(id)a4 minRefreshInterval:(double)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  CPLConfigurationDictionary *v16;
  CPLConfigurationDictionary *v17;

  v10 = a3;
  v11 = a4;
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithContentsOfURL:error:", v10, a6);
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("configuration"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("lastUpdate"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[CPLConfigurationDictionary initWithConfiguration:refreshIntervalKey:minRefreshInterval:lastUpdateDate:](self, "initWithConfiguration:refreshIntervalKey:minRefreshInterval:lastUpdateDate:", v14, v11, v15, a5);
    }
    else
    {
      objc_msgSend(v10, "lastPathComponent");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[CPLConfigurationDictionary initWithConfigurationName:refreshIntervalKey:minRefreshInterval:](self, "initWithConfigurationName:refreshIntervalKey:minRefreshInterval:", v15, v11, a5);
    }
    self = v16;

    v17 = self;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (BOOL)writeToURL:(id)a3 error:(id *)a4
{
  id v6;
  NSDate *lastUpdateDate;
  NSDictionary *configuration;
  void *v9;
  NSDictionary **v10;
  const __CFString **v11;
  uint64_t v12;
  NSDictionary *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  int v19;
  id v20;
  id v22;
  id v23;
  const __CFString *v24;
  NSDictionary *v25;
  _QWORD v26[2];
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  lastUpdateDate = self->_lastUpdateDate;
  if (lastUpdateDate)
  {
    configuration = self->_configuration;
    v26[0] = CFSTR("configuration");
    v26[1] = CFSTR("lastUpdate");
    v27[0] = configuration;
    v27[1] = lastUpdateDate;
    v9 = (void *)MEMORY[0x1E0C99D80];
    v10 = (NSDictionary **)v27;
    v11 = (const __CFString **)v26;
    v12 = 2;
  }
  else
  {
    v13 = self->_configuration;
    v24 = CFSTR("configuration");
    v25 = v13;
    v9 = (void *)MEMORY[0x1E0C99D80];
    v10 = &v25;
    v11 = &v24;
    v12 = 1;
  }
  objc_msgSend(v9, "dictionaryWithObjects:forKeys:count:", v10, v11, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1B5E08BF0]();
  v23 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v14, 200, 0, &v23);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v23;
  v18 = v17;
  if (v16)
  {
    v22 = v17;
    v19 = objc_msgSend(v16, "writeToURL:options:error:", v6, 1, &v22);
    v20 = v22;

    objc_autoreleasePoolPop(v15);
    if (a4 && v19)
    {
      v18 = objc_retainAutorelease(v20);
      *a4 = v18;
      LOBYTE(v19) = 1;
    }
    else
    {
      v18 = v20;
    }
  }
  else
  {
    objc_autoreleasePoolPop(v15);
    LOBYTE(v19) = 0;
  }

  return v19;
}

- (unint64_t)hash
{
  return -[NSDate hash](self->_lastUpdateDate, "hash");
}

- (double)refreshInterval
{
  void *v3;
  double v4;
  double minRefreshInterval;

  -[NSDictionary objectForKeyedSubscript:](self->_configuration, "objectForKeyedSubscript:", self->_refreshIntervalKey);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  minRefreshInterval = self->_minRefreshInterval;
  if (v4 >= minRefreshInterval)
  {
    minRefreshInterval = v4;
    if (v4 > 86400.0)
      minRefreshInterval = 86400.0;
  }

  return minRefreshInterval;
}

- (id)objectForKeyedSubscript:(id)a3
{
  return -[NSDictionary objectForKeyedSubscript:](self->_configuration, "objectForKeyedSubscript:", a3);
}

- (BOOL)isStale
{
  void *v3;
  BOOL v4;
  double v5;
  double v6;
  double v7;

  if (!self->_lastUpdateDate)
    return 1;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSDate compare:](self->_lastUpdateDate, "compare:", v3) == NSOrderedDescending)
  {
    v4 = 1;
  }
  else
  {
    objc_msgSend(v3, "timeIntervalSinceDate:", self->_lastUpdateDate);
    v6 = v5;
    -[CPLConfigurationDictionary refreshInterval](self, "refreshInterval");
    v4 = v6 > v7;
  }

  return v4;
}

- (int64_t)compare:(id)a3
{
  NSDate *lastUpdateDate;
  uint64_t v4;

  lastUpdateDate = self->_lastUpdateDate;
  v4 = *((_QWORD *)a3 + 4);
  if (lastUpdateDate)
  {
    if (v4)
      return -[NSDate compare:](lastUpdateDate, "compare:");
    else
      return 1;
  }
  else if (v4)
  {
    return -1;
  }
  else
  {
    return 0;
  }
}

- (BOOL)matchesConfigurationDictionary:(id)a3
{
  return -[NSDictionary isEqualToDictionary:](self->_configuration, "isEqualToDictionary:", *((_QWORD *)a3 + 1));
}

- (id)copyConfigurationDictionaryWithUpdatedDate
{
  CPLConfigurationDictionary *v3;
  NSDictionary *configuration;
  NSString *refreshIntervalKey;
  double minRefreshInterval;
  void *v7;
  CPLConfigurationDictionary *v8;

  v3 = [CPLConfigurationDictionary alloc];
  configuration = self->_configuration;
  refreshIntervalKey = self->_refreshIntervalKey;
  minRefreshInterval = self->_minRefreshInterval;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CPLConfigurationDictionary initWithConfiguration:refreshIntervalKey:minRefreshInterval:lastUpdateDate:](v3, "initWithConfiguration:refreshIntervalKey:minRefreshInterval:lastUpdateDate:", configuration, refreshIntervalKey, v7, minRefreshInterval);

  return v8;
}

- (id)copyConfigurationDictionaryWithUpdatedKey:(id)a3 value:(id)a4
{
  NSDictionary *configuration;
  id v7;
  id v8;
  void *v9;
  CPLConfigurationDictionary *v10;
  NSString *refreshIntervalKey;
  double minRefreshInterval;
  void *v13;
  CPLConfigurationDictionary *v14;

  configuration = self->_configuration;
  v7 = a4;
  v8 = a3;
  v9 = (void *)-[NSDictionary mutableCopy](configuration, "mutableCopy");
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v7, v8);

  v10 = [CPLConfigurationDictionary alloc];
  refreshIntervalKey = self->_refreshIntervalKey;
  minRefreshInterval = self->_minRefreshInterval;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[CPLConfigurationDictionary initWithConfiguration:refreshIntervalKey:minRefreshInterval:lastUpdateDate:](v10, "initWithConfiguration:refreshIntervalKey:minRefreshInterval:lastUpdateDate:", v9, refreshIntervalKey, v13, minRefreshInterval);

  return v14;
}

- (NSString)refreshIntervalKey
{
  return self->_refreshIntervalKey;
}

- (double)minRefreshInterval
{
  return self->_minRefreshInterval;
}

- (NSDate)lastUpdateDate
{
  return self->_lastUpdateDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUpdateDate, 0);
  objc_storeStrong((id *)&self->_refreshIntervalKey, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
