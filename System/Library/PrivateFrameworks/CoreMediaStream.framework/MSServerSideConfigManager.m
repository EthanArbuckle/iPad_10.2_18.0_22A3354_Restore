@implementation MSServerSideConfigManager

- (MSServerSideConfigManager)initWithPersonID:(id)a3 baseURL:(id)a4
{
  id v7;
  id v8;
  MSServerSideConfigManager *v9;
  MSServerSideConfigManager *v10;
  MSServerSideConfigProtocol *v11;
  MSServerSideConfigProtocol *protocol;
  uint64_t v13;
  NSString *configPath;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)MSServerSideConfigManager;
  v9 = -[MSServerSideConfigManager init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_personID, a3);
    v11 = -[MSServerSideConfigProtocol initWithPersonID:baseURL:]([MSServerSideConfigProtocol alloc], "initWithPersonID:baseURL:", v7, v8);
    protocol = v10->_protocol;
    v10->_protocol = v11;

    -[MSServerSideConfigProtocol setDelegate:](v10->_protocol, "setDelegate:", v10);
    MSPathServerSideConfigPathForPersonID(v7);
    v13 = objc_claimAutoreleasedReturnValue();
    configPath = v10->_configPath;
    v10->_configPath = (NSString *)v13;

  }
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[MSServerSideConfigManager abort](self, "abort");
  v3.receiver = self;
  v3.super_class = (Class)MSServerSideConfigManager;
  -[MSServerSideConfigManager dealloc](&v3, sel_dealloc);
}

- (NSDictionary)config
{
  NSDictionary *config;
  NSDictionary *v4;
  NSDictionary *v5;
  NSDictionary *v6;

  config = self->_config;
  if (config
    || (objc_msgSend(MEMORY[0x1E0CB3710], "MSSafeUnarchiveObjectWithFile:outError:", self->_configPath, 0),
        v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue(),
        v5 = self->_config,
        self->_config = v4,
        v5,
        (config = self->_config) != 0))
  {
    v6 = config;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
    v6 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (void)setConfig:(id)a3
{
  id v5;
  NSDictionary *config;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  MSMediaStreamDaemon *daemon;
  void *v17;
  id v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  config = self->_config;
  if (!config || !-[NSDictionary isEqualToDictionary:](config, "isEqualToDictionary:", v5))
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v5)
    {
      -[NSString stringByDeletingLastPathComponent](self->_configPath, "stringByDeletingLastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v9, 1, 0, 0);

      v18 = 0;
      objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 1, &v18);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v18;
      if (!v10 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v11;
        _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Failed to archive config, error: %@", buf, 0xCu);
      }
      if ((objc_msgSend(v10, "writeToFile:atomically:", self->_configPath, 1) & 1) == 0
        && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Cannot save config.", buf, 2u);
      }

    }
    else
    {
      objc_msgSend(v7, "removeItemAtPath:error:", self->_configPath, 0);

    }
    objc_storeStrong((id *)&self->_config, a3);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x1E0C99D80];
    -[MSServerSideConfigManager personID](self, "personID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryWithObjectsAndKeys:", v14, CFSTR("personID"), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "postNotificationName:object:userInfo:", CFSTR("MSServerSideConfigChanged"), self, v15);

    daemon = self->_daemon;
    -[MSServerSideConfigManager personID](self, "personID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSMediaStreamDaemon didReceiveNewServerSideConfigurationForPersonID:](daemon, "didReceiveNewServerSideConfigurationForPersonID:", v17);

  }
}

- (void)refreshConfiguration
{
  int state;
  uint8_t v4[16];

  state = self->_state;
  if (state != 1)
  {
    if (state)
      return;
    -[MSDaemon retainBusy](self->_daemon, "retainBusy");
    self->_state = 1;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Refreshing server-side configuration.", v4, 2u);
  }
  self->_state = 2;
  -[MSServerSideConfigProtocol queryConfiguration](self->_protocol, "queryConfiguration");
}

- (void)abort
{
  if (self->_state == 2)
  {
    -[MSServerSideConfigProtocol abort](self->_protocol, "abort");
    -[MSDaemon releaseBusy](self->_daemon, "releaseBusy");
  }
  self->_state = 0;
}

- (void)serverSideConfigProtocol:(id)a3 didFinishWithConfiguration:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  MSMediaStreamDaemon *daemon;
  void *v13;
  int v14;
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v10, "MSVerboseDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543618;
    v15 = v9;
    v16 = 2114;
    v17 = v11;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Finished retrieving server-side configuration: %{public}@, error: %{public}@", (uint8_t *)&v14, 0x16u);

  }
  if (!v10)
  {
    daemon = self->_daemon;
    -[MSServerSideConfigManager personID](self, "personID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSMediaStreamDaemon didReceiveAuthenticationSuccessForPersonID:](daemon, "didReceiveAuthenticationSuccessForPersonID:", v13);

    -[MSServerSideConfigManager setConfig:](self, "setConfig:", v9);
  }
  -[MSDaemon releaseBusy](self->_daemon, "releaseBusy");
  self->_state = 0;

}

- (void)serverSideConfigProtocol:(id)a3 didReceiveAuthenticationError:(id)a4
{
  MSMediaStreamDaemon *daemon;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(a4, "MSVerboseDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v8;
    _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to retrieve configuration due to authentication error: %{public}@", (uint8_t *)&v9, 0xCu);

  }
  daemon = self->_daemon;
  -[MSServerSideConfigManager personID](self, "personID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSMediaStreamDaemon didReceiveAuthenticationFailureForPersonID:](daemon, "didReceiveAuthenticationFailureForPersonID:", v7);

  -[MSDaemon releaseBusy](self->_daemon, "releaseBusy");
  self->_state = 0;
}

- (NSString)personID
{
  return self->_personID;
}

- (MSMediaStreamDaemon)daemon
{
  return self->_daemon;
}

- (void)setDaemon:(id)a3
{
  self->_daemon = (MSMediaStreamDaemon *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protocol, 0);
  objc_storeStrong((id *)&self->_configPath, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_personID, 0);
}

+ (id)configManagerForPersonID:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  MSServerSideConfigManager *v7;
  MSServerSideConfigManager *v8;
  void *v9;
  void *v10;

  v3 = a3;
  if (v3)
  {
    v4 = (void *)_configManagerByID;
    if (!_configManagerByID)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v6 = (void *)_configManagerByID;
      _configManagerByID = (uint64_t)v5;

      v4 = (void *)_configManagerByID;
    }
    objc_msgSend(v4, "objectForKey:", v3);
    v7 = (MSServerSideConfigManager *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      v8 = [MSServerSideConfigManager alloc];
      MSPlatform();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "baseURLForPersonID:", v3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[MSServerSideConfigManager initWithPersonID:baseURL:](v8, "initWithPersonID:baseURL:", v3, v10);

      objc_msgSend((id)_configManagerByID, "setObject:forKey:", v7, v3);
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)existingConfigManagerForPersonID:(id)a3
{
  return (id)objc_msgSend((id)_configManagerByID, "objectForKey:", a3);
}

+ (void)abortAllActivities
{
  void *v2;
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
  objc_msgSend((id)_configManagerByID, "allValues", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
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
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "abort");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

+ (void)forgetPersonID:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend((id)_configManagerByID, "objectForKey:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "abort");
    objc_msgSend((id)_configManagerByID, "removeObjectForKey:", v5);
  }

}

+ (int)intValueForParameter:(id)a3 forPersonID:(id)a4 defaultValue:(int)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v14;
  id v15;
  __int16 v16;
  id v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  MSPlatform();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "theDaemon");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "serverSideConfigurationForPersonID:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      a5 = objc_msgSend(v12, "intValue");
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        v14 = 138412802;
        v15 = v8;
        v16 = 2114;
        v17 = v7;
        v18 = 1024;
        v19 = a5;
        _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "PersonID %@ using server-side value for parameter %{public}@. Value: %d", (uint8_t *)&v14, 0x1Cu);
      }
    }
  }

  return a5;
}

+ (double)doubleValueForParameter:(id)a3 forPersonID:(id)a4 defaultValue:(double)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  int v15;
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  double v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  MSPlatform();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "theDaemon");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "serverSideConfigurationForPersonID:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v12, "doubleValue");
      a5 = v13;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        v15 = 138412802;
        v16 = v8;
        v17 = 2114;
        v18 = v7;
        v19 = 2048;
        v20 = a5;
        _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "PersonID %@ using server-side value for parameter %{public}@. Value: %f", (uint8_t *)&v15, 0x20u);
      }
    }
  }

  return a5;
}

+ (int64_t)longValueForParameter:(id)a3 forPersonID:(id)a4 defaultValue:(int64_t)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v14;
  id v15;
  __int16 v16;
  id v17;
  __int16 v18;
  int64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  MSPlatform();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "theDaemon");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "serverSideConfigurationForPersonID:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      a5 = objc_msgSend(v12, "longValue");
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        v14 = 138412802;
        v15 = v8;
        v16 = 2114;
        v17 = v7;
        v18 = 2048;
        v19 = a5;
        _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "PersonID %@ using server-side value for parameter %{public}@. Value: %ld", (uint8_t *)&v14, 0x20u);
      }
    }
  }

  return a5;
}

+ (int64_t)longLongValueForParameter:(id)a3 forPersonID:(id)a4 defaultValue:(int64_t)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v14;
  id v15;
  __int16 v16;
  id v17;
  __int16 v18;
  int64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  MSPlatform();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "theDaemon");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "serverSideConfigurationForPersonID:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      a5 = objc_msgSend(v12, "longLongValue");
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        v14 = 138412802;
        v15 = v8;
        v16 = 2114;
        v17 = v7;
        v18 = 2048;
        v19 = a5;
        _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "PersonID %@ using server-side value for parameter %{public}@. Value: %lld", (uint8_t *)&v14, 0x20u);
      }
    }
  }

  return a5;
}

+ (id)objectForKey:(id)a3 forPersonID:(id)a4 defaultValue:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  id v16;
  int v18;
  id v19;
  __int16 v20;
  id v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  MSPlatform();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "theDaemon");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "serverSideConfigurationForPersonID:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = v9;
  if (v13)
  {
    v15 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
    v14 = v13;
    if (v15)
    {
      v18 = 138412802;
      v19 = v8;
      v20 = 2114;
      v21 = v7;
      v22 = 2114;
      v23 = v13;
      _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "PersonID %@ using server-side value for key %{public}@. Value: %{public}@", (uint8_t *)&v18, 0x20u);
      v14 = v13;
    }
  }
  v16 = v14;

  return v16;
}

@end
