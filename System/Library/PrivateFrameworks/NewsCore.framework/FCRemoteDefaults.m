@implementation FCRemoteDefaults

- (BOOL)isAvailable
{
  void *v2;
  BOOL v3;

  -[FCThreadSafeMutableDictionary objectForKey:](self->_remoteDefaults, "objectForKey:", CFSTR("FCRemoteDefaults"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (FCRemoteDefaults)initWithBackgroundTaskable:(id)a3
{
  id v4;
  FCRemoteDefaults *v5;
  FCRemoteDefaults *v6;
  FCThreadSafeMutableDictionary *v7;
  FCThreadSafeMutableDictionary *remoteDefaults;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)FCRemoteDefaults;
  v5 = -[FCRemoteDefaults init](&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_backgroundTaskable, v4);
    v7 = objc_alloc_init(FCThreadSafeMutableDictionary);
    remoteDefaults = v6->_remoteDefaults;
    v6->_remoteDefaults = v7;

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", CFSTR("FCRemoteDefaults"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      -[FCThreadSafeMutableDictionary setObject:forKey:](v6->_remoteDefaults, "setObject:forKey:", v10, CFSTR("FCRemoteDefaults"));
    else
      -[FCRemoteDefaults checkForUpdate](v6, "checkForUpdate");

  }
  return v6;
}

- (id)dictionaryForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_opt_class();
  -[FCRemoteDefaults objectForKey:](self, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  return v7;
}

- (id)objectForKey:(id)a3
{
  FCThreadSafeMutableDictionary *remoteDefaults;
  id v4;
  void *v5;
  void *v6;
  void *v8;
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
  remoteDefaults = self->_remoteDefaults;
  v4 = a3;
  -[FCThreadSafeMutableDictionary objectForKey:](remoteDefaults, "objectForKey:", CFSTR("FCRemoteDefaults"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "object");
    *(_DWORD *)buf = 136315906;
    v10 = "-[FCRemoteDefaults objectForKey:]";
    v11 = 2080;
    v12 = "FCRemoteDefaults.m";
    v13 = 1024;
    v14 = 68;
    v15 = 2114;
    v16 = v8;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  return v6;
}

- (FCRemoteDefaults)init
{
  void *v4;
  int v5;
  const char *v6;
  __int16 v7;
  char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Case unsupported"));
    v5 = 136315906;
    v6 = "-[FCRemoteDefaults init]";
    v7 = 2080;
    v8 = "FCRemoteDefaults.m";
    v9 = 1024;
    v10 = 58;
    v11 = 2114;
    v12 = v4;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v5, 0x26u);

  }
  return -[FCRemoteDefaults initWithBackgroundTaskable:](self, "initWithBackgroundTaskable:", 0);
}

- (id)stringForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_opt_class();
  -[FCRemoteDefaults objectForKey:](self, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  return v7;
}

- (id)URLForKey:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  -[FCRemoteDefaults objectForKey:](self, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v3;
    else
      v4 = 0;
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;
  if (!v5 && v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v3;
    else
      v6 = 0;
    v7 = v6;
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v7);
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }

  }
  return v5;
}

- (void)checkForUpdate
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("FCRemoteDefaultsLastUpdate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateByAddingTimeInterval:", 86400.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3 || objc_msgSend(v4, "fc_isLaterThan:", v5))
    -[FCRemoteDefaults updateRemoteDefaults](self, "updateRemoteDefaults");

}

- (void)updateRemoteDefaults
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  -[FCRemoteDefaults URLRequest](self, "URLRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCRemoteDefaults backgroundTaskable](self, "backgroundTaskable");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v5 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __40__FCRemoteDefaults_updateRemoteDefaults__block_invoke;
  v14[3] = &unk_1E463DF90;
  v6 = v4;
  v15 = v6;
  v16 = &v17;
  v7 = objc_msgSend(v6, "fc_beginBackgroundTaskWithName:expirationHandler:", CFSTR("Remote Defaults Update"), v14);
  v18[3] = v7;
  objc_msgSend(MEMORY[0x1E0C92C98], "sharedSession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v11[1] = 3221225472;
  v11[2] = __40__FCRemoteDefaults_updateRemoteDefaults__block_invoke_2;
  v11[3] = &unk_1E4647B58;
  v11[4] = self;
  v9 = v6;
  v12 = v9;
  v13 = &v17;
  objc_msgSend(v8, "dataTaskWithRequest:completionHandler:", v3, v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "resume");

  _Block_object_dispose(&v17, 8);
}

uint64_t __40__FCRemoteDefaults_updateRemoteDefaults__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "fc_endBackgroundTask:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
}

void __40__FCRemoteDefaults_updateRemoteDefaults__block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  objc_class *v10;
  void *v11;
  id v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;

  v7 = a4;
  v8 = a3;
  v9 = a2;
  v10 = (objc_class *)objc_opt_class();
  FCCheckedDynamicCast(v10, (uint64_t)v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "processResponse:data:error:", v11, v9, v7);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __40__FCRemoteDefaults_updateRemoteDefaults__block_invoke_3;
  v14[3] = &unk_1E463DF90;
  v12 = *(id *)(a1 + 40);
  v13 = *(_QWORD *)(a1 + 48);
  v15 = v12;
  v16 = v13;
  FCPerformBlockOnMainThread(v14);

}

uint64_t __40__FCRemoteDefaults_updateRemoteDefaults__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "fc_endBackgroundTask:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
}

- (id)URLRequest
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringForKey:", CFSTR("FCRemoteDefaultsDownloadURL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "length")
    || (objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v3),
        (v4 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://configuration.apple.com/configurations/internetservices/tectosilicate/RemoteDefaults.plist"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0C92C28], "requestWithURL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTimeoutInterval:", 20.0);
  objc_msgSend(v5, "setCachePolicy:", 1);
  objc_msgSend(v2, "stringForKey:", CFSTR("FCRemoteDefaultsETag"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
    objc_msgSend(v5, "setValue:forHTTPHeaderField:", v6, CFSTR("If-None-Match"));

  return v5;
}

- (void)processResponse:(id)a3 data:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  id v21;
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(v8, "statusCode");
  v12 = v11;
  if (v11 == 304 || v11 == 200)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v14, CFSTR("FCRemoteDefaultsLastUpdate"));

    if (v12 == 200 && objc_msgSend(v9, "length"))
    {
      v21 = 0;
      objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v9, 0, 0, &v21);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v21;

      if (v15 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        -[FCThreadSafeMutableDictionary setObject:forKey:](self->_remoteDefaults, "setObject:forKey:", v15, CFSTR("FCRemoteDefaults"));
        objc_msgSend(v13, "setObject:forKey:", v15, CFSTR("FCRemoteDefaults"));
        v17 = FCAppConfigurationLog;
        if (os_log_type_enabled((os_log_t)FCAppConfigurationLog, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v23 = v15;
          _os_log_impl(&dword_1A1B90000, v17, OS_LOG_TYPE_INFO, "Received configuration file: %@", buf, 0xCu);
        }
        objc_msgSend(v8, "allHeaderFields");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectForKey:", CFSTR("Etag"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "setObject:forKey:", v19, CFSTR("FCRemoteDefaultsETag"));
      }
      else
      {
        v20 = FCDefaultLog;
        if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v23 = v16;
          _os_log_error_impl(&dword_1A1B90000, v20, OS_LOG_TYPE_ERROR, "Could not create property list from data. Error: %{public}@", buf, 0xCu);
        }
      }

    }
    else
    {
      v16 = v10;
    }

    v10 = v16;
  }

}

- (FCBackgroundTaskable)backgroundTaskable
{
  return (FCBackgroundTaskable *)objc_loadWeakRetained((id *)&self->_backgroundTaskable);
}

- (FCThreadSafeMutableDictionary)remoteDefaults
{
  return self->_remoteDefaults;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteDefaults, 0);
  objc_destroyWeak((id *)&self->_backgroundTaskable);
}

@end
