@implementation _GDSServerConnection

- (_GDSServerConnection)init
{
  _GDSServerConnection *v2;
  os_log_t v3;
  OS_os_log *log;
  uint64_t v5;
  NSUserDefaults *defaults;
  uint64_t v7;
  NSUserDefaults *fakeDataDefaults;
  uint64_t v9;
  NSDate *configFetchDate;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSDate *v20;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)_GDSServerConnection;
  v2 = -[_GDSServerConnection init](&v22, sel_init);
  if (v2)
  {
    v3 = os_log_create("com.apple.gds", "serverConnection");
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    v5 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.gridDataServices.config"));
    defaults = v2->_defaults;
    v2->_defaults = (NSUserDefaults *)v5;

    v7 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.gridDataServices.fakeData"));
    fakeDataDefaults = v2->_fakeDataDefaults;
    v2->_fakeDataDefaults = (NSUserDefaults *)v7;

    -[NSUserDefaults objectForKey:](v2->_defaults, "objectForKey:", CFSTR("configDate"));
    v9 = objc_claimAutoreleasedReturnValue();
    configFetchDate = v2->_configFetchDate;
    v2->_configFetchDate = (NSDate *)v9;

    if (!v2->_configFetchDate)
    {
      v11 = v2->_log;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[_GDSServerConnection init].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);
      objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = v2->_configFetchDate;
      v2->_configFetchDate = (NSDate *)v19;

    }
    -[_GDSServerConnection checkServerConfiguration](v2, "checkServerConfiguration");
    -[_GDSServerConnection loadConfigState](v2, "loadConfigState");
  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance_once != -1)
    dispatch_once(&sharedInstance_once, &__block_literal_global_0);
  return (id)sharedInstance_instance;
}

+ (id)dateFormatter
{
  if (dateFormatter_once != -1)
    dispatch_once(&dateFormatter_once, &__block_literal_global_62);
  return (id)dateFormatter_dateFormatter;
}

+ (id)dateFromString:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[_GDSServerConnection dateFormatter](_GDSServerConnection, "dateFormatter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateFromString:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)dateStringFromDate:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[_GDSServerConnection dateFormatter](_GDSServerConnection, "dateFormatter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringFromDate:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)fetchEstimatedCountryCode
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BE7D058], "currentEstimates");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    v3 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE7D058], "lastKnownEstimates");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v3, "count"))
    {
      v5 = 0;
      goto LABEL_6;
    }
    v2 = v3;
  }
  objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "countryCode");
  v5 = (id)objc_claimAutoreleasedReturnValue();

LABEL_6:
  return v5;
}

+ (id)queryItemsMetaParams
{
  __CFString *v2;
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  +[_GDSServerConnection fetchEstimatedCountryCode](_GDSServerConnection, "fetchEstimatedCountryCode");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2 || -[__CFString length](v2, "length") != 2)
  {
    AnalyticsSendEventLazy();

    v3 = CFSTR("US");
  }
  +[_GDSServerConnection platform](_GDSServerConnection, "platform");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[_GDSServerConnection osBuildVersion](_GDSServerConnection, "osBuildVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("country"), v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v7);

  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("platform"), v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v8);

  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("build"), v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v9);

  return v6;
}

+ (id)fetchConfigWithError:(id *)a3
{
  os_log_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  dispatch_semaphore_t v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  dispatch_time_t v23;
  void *v24;
  id v25;
  id v26;
  void *v28;
  void *v29;
  _QWORD v30[4];
  NSObject *v31;
  NSObject *v32;
  uint64_t *v33;
  uint64_t *v34;
  id *v35;
  _QWORD block[4];
  NSObject *v37;
  __CFString *v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  uint8_t buf[4];
  id v52;
  __int16 v53;
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v4 = os_log_create("com.apple.gds", "serverConnection");
  v45 = 0;
  v46 = &v45;
  v47 = 0x3032000000;
  v48 = __Block_byref_object_copy_;
  v49 = __Block_byref_object_dispose_;
  v50 = 0;
  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = __Block_byref_object_copy_;
  v43 = __Block_byref_object_dispose_;
  v44 = 0;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.gridDataServices.fakeData"));
  objc_msgSend(v5, "stringForKey:", CFSTR("fakeConfigURL"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  v28 = v5;
  v8 = MEMORY[0x24BDAC760];
  if (v6)
  {
    v9 = v6;
    block[0] = v8;
    block[1] = 3221225472;
    block[2] = __45___GDSServerConnection_fetchConfigWithError___block_invoke;
    block[3] = &unk_250E0CE70;
    v37 = v4;
    v10 = (__CFString *)v9;
    v38 = v10;
    if (fetchConfigWithError__once != -1)
      dispatch_once(&fetchConfigWithError__once, block);

  }
  else
  {
    v10 = CFSTR("https://cabana-config.cdn-apple.com/static/v1/bootstrap-31e8c871-9a82-4a76-af31-7857bae5b03e.json");
  }
  objc_msgSend(MEMORY[0x24BDD1808], "componentsWithString:", v10, v28);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[_GDSServerConnection queryItemsMetaParams](_GDSServerConnection, "queryItemsMetaParams");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setQueryItems:", v12);

  v13 = (void *)MEMORY[0x24BDD16B0];
  objc_msgSend(v11, "URL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "requestWithURL:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setHTTPMethod:", CFSTR("GET"));
  objc_msgSend(v15, "addValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
  objc_msgSend(v15, "addValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Accept"));
  v16 = v4;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v15, "allHTTPHeaderFields");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v52 = v15;
    v53 = 2112;
    v54 = v17;
    _os_log_impl(&dword_23D1EF000, v16, OS_LOG_TYPE_DEFAULT, "Request: %@, Header: %@", buf, 0x16u);

  }
  +[_GDSServerConnection createSessionConfiguration](_GDSServerConnection, "createSessionConfiguration");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = dispatch_semaphore_create(0);
  v30[0] = MEMORY[0x24BDAC760];
  v30[1] = 3221225472;
  v30[2] = __45___GDSServerConnection_fetchConfigWithError___block_invoke_101;
  v30[3] = &unk_250E0D080;
  v20 = v16;
  v31 = v20;
  v33 = &v39;
  v21 = v19;
  v32 = v21;
  v34 = &v45;
  v35 = a3;
  objc_msgSend(v18, "dataTaskWithRequest:completionHandler:", v15, v30);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "resume");
  objc_msgSend(v18, "finishTasksAndInvalidate");
  v23 = dispatch_time(0, 10000000000);
  dispatch_semaphore_wait(v21, v23);
  if (a3)
  {
    v24 = (void *)v40[5];
    if (v24)
    {
      *a3 = objc_retainAutorelease(v24);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v25 = *a3;
        *(_DWORD *)buf = 138412290;
        v52 = v25;
        _os_log_impl(&dword_23D1EF000, v20, OS_LOG_TYPE_DEFAULT, "Reporting error %@", buf, 0xCu);
      }
    }
  }
  v26 = (id)v46[5];

  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v45, 8);

  return v26;
}

- (void)checkServerConfiguration
{
  NSDate *configFetchDate;
  double v4;
  NSObject *log;
  NSDate *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  id v11;
  NSObject *v13;
  id v14;
  uint8_t buf[4];
  NSDate *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  configFetchDate = self->_configFetchDate;
  if (!configFetchDate || (-[NSDate timeIntervalSinceNow](configFetchDate, "timeIntervalSinceNow"), v4 < -1209600.0))
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      v6 = self->_configFetchDate;
      *(_DWORD *)buf = 138412290;
      v16 = v6;
      _os_log_impl(&dword_23D1EF000, log, OS_LOG_TYPE_DEFAULT, "Server connection config needs refresh (Config date %@)", buf, 0xCu);
    }
    v7 = 0;
    v8 = 0;
    v9 = 3;
    while (1)
    {
      v10 = v7;
      v14 = v8;
      +[_GDSServerConnection fetchConfigWithError:](_GDSServerConnection, "fetchConfigWithError:", &v14);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v14;

      if (!v11 && v7 != 0)
        break;
      v13 = self->_log;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_23D1EF000, v13, OS_LOG_TYPE_DEFAULT, "Config request failed. Retrying", buf, 2u);
      }
      v8 = v11;
      if (!--v9)
        goto LABEL_14;
    }
    v11 = 0;
LABEL_14:
    -[_GDSServerConnection handleNewConfig:](self, "handleNewConfig:", v7);

  }
}

- (void)handleNewConfig:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  NSObject *v9;
  double v10;
  NSUserDefaults *defaults;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSDate *v26;
  NSDate *configFetchDate;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("version"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "doubleValue");
    if (v7 > 1.0 || (objc_msgSend(v6, "doubleValue"), v8 < 0.0))
    {
      -[_GDSServerConnection log](self, "log");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[_GDSServerConnection handleNewConfig:].cold.2(v6, v9);

    }
    objc_msgSend(v6, "doubleValue");
    self->_configVersion = v10;
    defaults = self->_defaults;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSUserDefaults setObject:forKey:](defaults, "setObject:forKey:", v12, CFSTR("configVersion"));

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("serverUrl"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_storeStrong((id *)&self->_serverURL, v13);
    -[NSUserDefaults setObject:forKey:](self->_defaults, "setObject:forKey:", self->_serverURL, CFSTR("serverURL"));
  }
  else
  {
    -[_GDSServerConnection log](self, "log");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[_GDSServerConnection handleNewConfig:].cold.1(v14, v15, v16, v17, v18, v19, v20, v21);

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("configuration"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("cecEnabled"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v23)
  {
    self->_isCECSupported = objc_msgSend(v23, "BOOLValue");
    -[NSUserDefaults setObject:forKey:](self->_defaults, "setObject:forKey:", v24, CFSTR("CECSupported"));
  }
  objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("accountingEnabled"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    self->_isCASupported = objc_msgSend(v25, "BOOLValue");
    -[NSUserDefaults setObject:forKey:](self->_defaults, "setObject:forKey:", v25, CFSTR("AccountingSupported"));
  }
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v26 = (NSDate *)objc_claimAutoreleasedReturnValue();
  configFetchDate = self->_configFetchDate;
  self->_configFetchDate = v26;

  -[NSUserDefaults setObject:forKey:](self->_defaults, "setObject:forKey:", self->_configFetchDate, CFSTR("configDate"));
}

- (void)loadConfigState
{
  int v3;
  const __CFString *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = CFSTR("https://cabana-server.cdn-apple.com/v1/");
  OUTLINED_FUNCTION_5(&dword_23D1EF000, a1, a3, "Error loading server URL. Using default value %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_3_0();
}

- (id)postRequestForEndpoint:(id)a3 withData:(id)a4
{
  id v6;
  id v7;
  NSString *v8;
  NSString *serverURL;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  const __CFString *v19;
  void *v20;
  void *v21;

  v6 = a4;
  v7 = a3;
  -[_GDSServerConnection checkServerConfiguration](self, "checkServerConfiguration");
  -[_GDSServerConnection getFakeServerURL](self, "getFakeServerURL");
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  serverURL = v8;
  if (!v8)
    serverURL = self->_serverURL;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), serverURL, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1808], "componentsWithString:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x24BDD16B0];
  objc_msgSend(v11, "URL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "requestWithURL:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(v14, "setHTTPBody:", v6);

  objc_msgSend(v14, "addValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
  objc_msgSend(v14, "addValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Accept"));
  -[_GDSServerConnection getFakeSecret](self, "getFakeSecret");
  v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  -[_GDSServerConnection getFakeSecretVersion](self, "getFakeSecretVersion");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  if (v15)
    v18 = v15;
  else
    v18 = CFSTR("f971ea5835cead5eaf7e2750224fd8f4");
  if (v16)
    v19 = (const __CFString *)v16;
  else
    v19 = CFSTR("1");
  +[_GDSHMACGenerator HMACSignedRequest:secret:secretVersion:](_GDSHMACGenerator, "HMACSignedRequest:secret:secretVersion:", v14, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v20, "mutableCopy");

  return v21;
}

- (id)getRequestForEndpoint:(id)a3 withData:(id)a4 keySequence:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSString *serverURL;
  void *v23;
  void *v24;
  NSObject *log;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  __CFString *v31;
  uint64_t v32;
  void *v33;
  const __CFString *v34;
  const __CFString *v35;
  void *v36;
  void *v37;
  _GDSServerConnection *v39;
  NSString *v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t buf[4];
  void *v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v41 = a3;
  v8 = a4;
  v9 = a5;
  -[_GDSServerConnection checkServerConfiguration](self, "checkServerConfiguration");
  v39 = self;
  -[_GDSServerConnection getFakeServerURL](self, "getFakeServerURL");
  v40 = (NSString *)objc_claimAutoreleasedReturnValue();
  +[_GDSServerConnection queryItemsMetaParams](_GDSServerConnection, "queryItemsMetaParams");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v12 = v9;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v43 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i);
        objc_msgSend(v8, "objectForKeyedSubscript:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          v19 = (void *)MEMORY[0x24BDD1838];
          objc_msgSend(v8, "objectForKeyedSubscript:", v17);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "queryItemWithName:value:", v17, v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v21);

        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
    }
    while (v14);
  }

  serverURL = v40;
  if (!v40)
    serverURL = v39->_serverURL;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), serverURL, v41);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1808], "componentsWithString:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setQueryItems:", v11);
  log = v39->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    v26 = log;
    objc_msgSend(v24, "URL");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v47 = v27;
    _os_log_impl(&dword_23D1EF000, v26, OS_LOG_TYPE_DEFAULT, "URL: %@", buf, 0xCu);

  }
  v28 = (void *)MEMORY[0x24BDD16B0];
  objc_msgSend(v24, "URL");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "requestWithURL:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v30, "setHTTPMethod:", CFSTR("GET"));
  objc_msgSend(v30, "addValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
  objc_msgSend(v30, "addValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Accept"));
  -[_GDSServerConnection getFakeSecret](v39, "getFakeSecret");
  v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
  -[_GDSServerConnection getFakeSecretVersion](v39, "getFakeSecretVersion");
  v32 = objc_claimAutoreleasedReturnValue();
  v33 = (void *)v32;
  if (v31)
    v34 = v31;
  else
    v34 = CFSTR("f971ea5835cead5eaf7e2750224fd8f4");
  if (v32)
    v35 = (const __CFString *)v32;
  else
    v35 = CFSTR("1");
  +[_GDSHMACGenerator HMACSignedRequest:secret:secretVersion:](_GDSHMACGenerator, "HMACSignedRequest:secret:secretVersion:", v30, v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (void *)objc_msgSend(v36, "mutableCopy");

  return v37;
}

- (id)getFakeSecret
{
  void *v3;
  void *v4;
  NSObject *log;
  _BOOL4 v6;
  id v7;
  NSObject *v8;
  id v9;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  -[_GDSServerConnection fakeDataDefaults](self, "fakeDataDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringForKey:", CFSTR("fakeSecret"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  log = self->_log;
  v6 = os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      v7 = objc_retainAutorelease(v4);
      v8 = log;
      v11 = 136315138;
      v12 = objc_msgSend(v7, "UTF8String");
      _os_log_impl(&dword_23D1EF000, v8, OS_LOG_TYPE_DEFAULT, "Found fakeSecret: %s", (uint8_t *)&v11, 0xCu);

    }
    v9 = v4;
  }
  else if (v6)
  {
    LOWORD(v11) = 0;
    _os_log_impl(&dword_23D1EF000, log, OS_LOG_TYPE_DEFAULT, "Found no fakeSecret.", (uint8_t *)&v11, 2u);
  }

  return v4;
}

- (id)getFakeSecretVersion
{
  void *v3;
  void *v4;
  NSObject *log;
  _BOOL4 v6;
  id v7;
  NSObject *v8;
  id v9;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  -[_GDSServerConnection fakeDataDefaults](self, "fakeDataDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringForKey:", CFSTR("fakeSecretVersion"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  log = self->_log;
  v6 = os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      v7 = objc_retainAutorelease(v4);
      v8 = log;
      v11 = 136315138;
      v12 = objc_msgSend(v7, "UTF8String");
      _os_log_impl(&dword_23D1EF000, v8, OS_LOG_TYPE_DEFAULT, "Found fakeSecretVersion: %s", (uint8_t *)&v11, 0xCu);

    }
    v9 = v4;
  }
  else if (v6)
  {
    LOWORD(v11) = 0;
    _os_log_impl(&dword_23D1EF000, log, OS_LOG_TYPE_DEFAULT, "Found no fakeSecretVersion.", (uint8_t *)&v11, 2u);
  }

  return v4;
}

- (id)getFakeServerURL
{
  void *v3;
  void *v4;
  NSObject *log;
  _BOOL4 v6;
  id v7;
  NSObject *v8;
  id v9;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  -[_GDSServerConnection fakeDataDefaults](self, "fakeDataDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringForKey:", CFSTR("fakeServerURL"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  log = self->_log;
  v6 = os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      v7 = objc_retainAutorelease(v4);
      v8 = log;
      v11 = 136315138;
      v12 = objc_msgSend(v7, "UTF8String");
      _os_log_impl(&dword_23D1EF000, v8, OS_LOG_TYPE_DEFAULT, "Found fakeServerURL: %s", (uint8_t *)&v11, 0xCu);

    }
    v9 = v4;
  }
  else if (v6)
  {
    LOWORD(v11) = 0;
    _os_log_impl(&dword_23D1EF000, log, OS_LOG_TYPE_DEFAULT, "Found no fakeServerURL.", (uint8_t *)&v11, 2u);
  }

  return v4;
}

- (id)dataFromLocation:(id)a3
{
  void *v3;
  id v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v17;
  void *v18;
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x24BDAC8D0];
  v19[0] = CFSTR("longitude");
  v3 = (void *)MEMORY[0x24BDD16E0];
  v4 = a3;
  objc_msgSend(v4, "coordinate");
  objc_msgSend(v3, "numberWithDouble:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = CFSTR("latitude");
  v20[0] = v6;
  v7 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v4, "coordinate");
  v9 = v8;

  objc_msgSend(v7, "numberWithDouble:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObject:", v11);
  v13 = (void *)MEMORY[0x24BDD1608];
  v17 = CFSTR("locations");
  v18 = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "dataWithJSONObject:options:error:", v14, 0, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)createSessionConfiguration
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1858], "defaultSessionConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setRequestCachePolicy:", 5);
  objc_msgSend(MEMORY[0x24BDD1850], "sessionWithConfiguration:delegate:delegateQueue:", v2, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)fetchBalancingAuthorityFromLocation:(id)a3
{
  id v4;
  dispatch_semaphore_t v5;
  void *v6;
  void *v7;
  OS_os_log *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  dispatch_time_t v14;
  id v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *, void *, void *);
  void *v20;
  _GDSServerConnection *v21;
  NSObject *v22;
  id v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint8_t buf[24];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy_;
  v29 = __Block_byref_object_dispose_;
  v30 = 0;
  v5 = dispatch_semaphore_create(0);
  -[_GDSServerConnection dataFromLocation:](self, "dataFromLocation:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_GDSServerConnection postRequestForEndpoint:withData:](self, "postRequestForEndpoint:withData:", CFSTR("getBalancingAuthorities"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = self->_log;
  if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v7, "allHTTPHeaderFields");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_GDSServerConnection fetchBalancingAuthorityFromLocation:].cold.1((uint64_t)v7, v9, buf, (os_log_t)v8);
  }

  +[_GDSServerConnection createSessionConfiguration](_GDSServerConnection, "createSessionConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x24BDAC760];
  v18 = 3221225472;
  v19 = __60___GDSServerConnection_fetchBalancingAuthorityFromLocation___block_invoke;
  v20 = &unk_250E0D0A8;
  v21 = self;
  v11 = v5;
  v22 = v11;
  v12 = v4;
  v23 = v12;
  v24 = &v25;
  objc_msgSend(v10, "dataTaskWithRequest:completionHandler:", v7, &v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "resume", v17, v18, v19, v20, v21);
  objc_msgSend(v10, "finishTasksAndInvalidate");
  v14 = dispatch_time(0, 10000000000);
  dispatch_semaphore_wait(v11, v14);
  v15 = (id)v26[5];

  _Block_object_dispose(&v25, 8);
  return v15;
}

+ (id)osBuildVersion
{
  const __CFDictionary *v2;
  uint64_t v3;
  __CFString *v4;

  v2 = (const __CFDictionary *)_CFCopySystemVersionDictionary();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", CFDictionaryGetValue(v2, (const void *)*MEMORY[0x24BDBD1F0]));
  v3 = objc_claimAutoreleasedReturnValue();
  CFRelease(v2);
  if (v3)
    v4 = (__CFString *)v3;
  else
    v4 = CFSTR("UnknownBuildVersion");
  return v4;
}

+ (id)platform
{
  return CFSTR("iOS");
}

- (id)fetchBalancingAuthorityPolygons
{
  dispatch_semaphore_t v3;
  void *v4;
  void *v5;
  OS_os_log *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  dispatch_time_t v12;
  id v13;
  _QWORD v15[5];
  NSObject *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v3 = dispatch_semaphore_create(0);
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy_;
  v22 = __Block_byref_object_dispose_;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)os_transaction_create();
  -[_GDSServerConnection getRequestForEndpoint:withData:keySequence:](self, "getRequestForEndpoint:withData:keySequence:", CFSTR("getBaBoundaries"), 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = self->_log;
  if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "allHTTPHeaderFields");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v25 = v5;
    v26 = 2112;
    v27 = v7;
    _os_log_impl(&dword_23D1EF000, (os_log_t)v6, OS_LOG_TYPE_DEFAULT, "Request: %@, Header: %@", buf, 0x16u);

  }
  +[_GDSServerConnection createSessionConfiguration](_GDSServerConnection, "createSessionConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __55___GDSServerConnection_fetchBalancingAuthorityPolygons__block_invoke;
  v15[3] = &unk_250E0D0F0;
  v15[4] = self;
  v9 = v3;
  v16 = v9;
  v17 = &v18;
  objc_msgSend(v8, "dataTaskWithRequest:completionHandler:", v5, v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x242631E30]();
  objc_msgSend(v10, "resume");
  objc_msgSend(v8, "finishTasksAndInvalidate");
  objc_autoreleasePoolPop(v11);
  v12 = dispatch_time(0, 10000000000);
  dispatch_semaphore_wait(v9, v12);
  v13 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  return v13;
}

- (id)fetchMarginalEmissionForecastFor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  dispatch_semaphore_t v7;
  void *v8;
  OS_os_log *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  dispatch_time_t v14;
  id v15;
  NSObject *log;
  NSObject *v17;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *, void *, void *);
  void *v22;
  _GDSServerConnection *v23;
  NSObject *v24;
  id v25;
  _QWORD *v26;
  _QWORD *v27;
  uint8_t *v28;
  _QWORD v29[5];
  id v30;
  _QWORD v31[5];
  id v32;
  uint8_t v33[8];
  uint8_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (!self->_isCECSupported)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v33 = 0;
      _os_log_impl(&dword_23D1EF000, log, OS_LOG_TYPE_DEFAULT, "Fetching for CEC disabled. Returning nil", v33, 2u);
    }
    goto LABEL_10;
  }
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v17 = self->_log;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[_GDSServerConnection fetchMarginalEmissionForecastFor:].cold.1(v17, v5);
LABEL_10:
    v15 = 0;
    goto LABEL_11;
  }
  v7 = dispatch_semaphore_create(0);
  *(_QWORD *)v33 = 0;
  v34 = v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy_;
  v37 = __Block_byref_object_dispose_;
  v38 = 0;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = __Block_byref_object_copy_;
  v31[4] = __Block_byref_object_dispose_;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v32 = (id)objc_claimAutoreleasedReturnValue();
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = __Block_byref_object_copy_;
  v29[4] = __Block_byref_object_dispose_;
  v30 = 0;
  -[_GDSServerConnection getRequestForEndpoint:withData:keySequence:](self, "getRequestForEndpoint:withData:keySequence:", CFSTR("getEmissionsForecasts"), 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = self->_log;
  if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "allHTTPHeaderFields");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v40 = v8;
    v41 = 2112;
    v42 = v10;
    _os_log_impl(&dword_23D1EF000, (os_log_t)v9, OS_LOG_TYPE_DEFAULT, "Request: %@, Header: %@", buf, 0x16u);

  }
  +[_GDSServerConnection createSessionConfiguration](_GDSServerConnection, "createSessionConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = MEMORY[0x24BDAC760];
  v20 = 3221225472;
  v21 = __57___GDSServerConnection_fetchMarginalEmissionForecastFor___block_invoke;
  v22 = &unk_250E0D138;
  v23 = self;
  v12 = v7;
  v24 = v12;
  v25 = v5;
  v26 = v29;
  v27 = v31;
  v28 = v33;
  objc_msgSend(v11, "dataTaskWithRequest:completionHandler:", v8, &v19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "resume", v19, v20, v21, v22, v23);
  objc_msgSend(v11, "finishTasksAndInvalidate");
  v14 = dispatch_time(0, 10000000000);
  dispatch_semaphore_wait(v12, v14);
  v15 = *((id *)v34 + 5);

  _Block_object_dispose(v29, 8);
  _Block_object_dispose(v31, 8);

  _Block_object_dispose(v33, 8);
LABEL_11:

  return v15;
}

- (id)fetchCarbonIntensityHistoryForBA:(id)a3 from:(id)a4 to:(id)a5
{
  id v8;
  id v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  uint64_t (*v11)(uint64_t, uint64_t);
  dispatch_semaphore_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  OS_os_log *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  dispatch_time_t v22;
  id v23;
  NSObject *log;
  NSObject *v25;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, void *, void *, void *);
  void *v30;
  _GDSServerConnection *v31;
  NSObject *v32;
  _QWORD *v33;
  _BYTE *v34;
  _QWORD v35[5];
  id v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  _QWORD v41[3];
  _QWORD v42[3];
  _BYTE v43[24];
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (uint64_t (*)(uint64_t, uint64_t))a5;
  v11 = v10;
  if (!self->_isCASupported)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v43 = 0;
      _os_log_impl(&dword_23D1EF000, log, OS_LOG_TYPE_DEFAULT, "Fetching for Carbon Accounting disabled. Returning nil", v43, 2u);
    }
    goto LABEL_12;
  }
  if (!v8 || !v9 || !v10)
  {
    v25 = self->_log;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v43 = 138412802;
      *(_QWORD *)&v43[4] = v8;
      *(_WORD *)&v43[12] = 2112;
      *(_QWORD *)&v43[14] = v9;
      *(_WORD *)&v43[22] = 2112;
      v44 = v11;
      _os_log_error_impl(&dword_23D1EF000, v25, OS_LOG_TYPE_ERROR, "Parameters not specified BA:%@ startDate:%@ endDate:%@", v43, 0x20u);
    }
LABEL_12:
    v23 = 0;
    goto LABEL_13;
  }
  v12 = dispatch_semaphore_create(0);
  *(_QWORD *)v43 = 0;
  *(_QWORD *)&v43[8] = v43;
  *(_QWORD *)&v43[16] = 0x3032000000;
  v44 = __Block_byref_object_copy_;
  v45 = __Block_byref_object_dispose_;
  v46 = 0;
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x3032000000;
  v35[3] = __Block_byref_object_copy_;
  v35[4] = __Block_byref_object_dispose_;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v36 = (id)objc_claimAutoreleasedReturnValue();
  v42[0] = v8;
  v41[0] = CFSTR("balancingAuthorityId");
  v41[1] = CFSTR("startTime");
  +[_GDSServerConnection dateStringFromDate:](_GDSServerConnection, "dateStringFromDate:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v42[1] = v13;
  v41[2] = CFSTR("endTime");
  +[_GDSServerConnection dateStringFromDate:](_GDSServerConnection, "dateStringFromDate:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v42[2] = v14;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v42, v41, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[_GDSServerConnection getRequestForEndpoint:withData:keySequence:](self, "getRequestForEndpoint:withData:keySequence:", CFSTR("getEmissionsHistory"), v15, &unk_250E0F818);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = self->_log;
  if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v16, "allHTTPHeaderFields");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v38 = v16;
    v39 = 2112;
    v40 = v18;
    _os_log_impl(&dword_23D1EF000, (os_log_t)v17, OS_LOG_TYPE_DEFAULT, "Request: %@, Header: %@", buf, 0x16u);

  }
  +[_GDSServerConnection createSessionConfiguration](_GDSServerConnection, "createSessionConfiguration");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = MEMORY[0x24BDAC760];
  v28 = 3221225472;
  v29 = __65___GDSServerConnection_fetchCarbonIntensityHistoryForBA_from_to___block_invoke;
  v30 = &unk_250E0D180;
  v31 = self;
  v20 = v12;
  v32 = v20;
  v33 = v35;
  v34 = v43;
  objc_msgSend(v19, "dataTaskWithRequest:completionHandler:", v16, &v27);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "resume", v27, v28, v29, v30, v31);
  objc_msgSend(v19, "finishTasksAndInvalidate");
  v22 = dispatch_time(0, 10000000000);
  dispatch_semaphore_wait(v20, v22);
  v23 = *(id *)(*(_QWORD *)&v43[8] + 40);

  _Block_object_dispose(v35, 8);
  _Block_object_dispose(v43, 8);

LABEL_13:
  return v23;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (double)configVersion
{
  return self->_configVersion;
}

- (void)setConfigVersion:(double)a3
{
  self->_configVersion = a3;
}

- (NSDate)configFetchDate
{
  return self->_configFetchDate;
}

- (void)setConfigFetchDate:(id)a3
{
  objc_storeStrong((id *)&self->_configFetchDate, a3);
}

- (NSString)serverURL
{
  return self->_serverURL;
}

- (void)setServerURL:(id)a3
{
  objc_storeStrong((id *)&self->_serverURL, a3);
}

- (BOOL)isCASupported
{
  return self->_isCASupported;
}

- (void)setIsCASupported:(BOOL)a3
{
  self->_isCASupported = a3;
}

- (BOOL)isCECSupported
{
  return self->_isCECSupported;
}

- (void)setIsCECSupported:(BOOL)a3
{
  self->_isCECSupported = a3;
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_defaults, a3);
}

- (NSUserDefaults)fakeDataDefaults
{
  return self->_fakeDataDefaults;
}

- (void)setFakeDataDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_fakeDataDefaults, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fakeDataDefaults, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_serverURL, 0);
  objc_storeStrong((id *)&self->_configFetchDate, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

- (void)init
{
  OUTLINED_FUNCTION_3(&dword_23D1EF000, a1, a3, "Error loading config fetch date. Setting to distant past", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

- (void)handleNewConfig:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_23D1EF000, a1, a3, "Missing server URL", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

- (void)handleNewConfig:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "doubleValue");
  v4 = 134218496;
  v5 = v3;
  v6 = 2048;
  v7 = 0;
  v8 = 2048;
  v9 = 0x3FF0000000000000;
  _os_log_error_impl(&dword_23D1EF000, a2, OS_LOG_TYPE_ERROR, "Config version %lf not supported by OS versions (%lf - %lf)", (uint8_t *)&v4, 0x20u);
}

- (void)fetchBalancingAuthorityFromLocation:(uint8_t *)buf .cold.1(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_debug_impl(&dword_23D1EF000, log, OS_LOG_TYPE_DEBUG, "Request: %@, Header: %@", buf, 0x16u);

}

- (void)fetchMarginalEmissionForecastFor:(void *)a1 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412290;
  v7 = v4;
  OUTLINED_FUNCTION_5(&dword_23D1EF000, v3, v5, "Parameter not specified BA:%@", (uint8_t *)&v6);

}

@end
