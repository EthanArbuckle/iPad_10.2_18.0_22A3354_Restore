@implementation _GDSManager

- (_GDSManager)initWithID:(id)a3 locationBundlePath:(id)a4
{
  id v7;
  id v8;
  _GDSManager *v9;
  os_log_t v10;
  OS_os_log *log;
  uint64_t v12;
  NSUserDefaults *fakeDataDefaults;
  uint64_t v14;
  NSXPCConnection *connection;
  void *v16;
  NSString **p_clientID;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  char v22;
  NSObject *v23;
  NSString *v24;
  objc_super v26;
  uint8_t buf[4];
  NSString *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v26.receiver = self;
  v26.super_class = (Class)_GDSManager;
  v9 = -[_GDSManager init](&v26, sel_init);
  if (v9)
  {
    v10 = os_log_create("com.apple.gds", "manager");
    log = v9->_log;
    v9->_log = (OS_os_log *)v10;

    v12 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.gridDataServices.fakeData"));
    fakeDataDefaults = v9->_fakeDataDefaults;
    v9->_fakeDataDefaults = (NSUserDefaults *)v12;

    v14 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.griddatad.registration"), 4096);
    connection = v9->_connection;
    v9->_connection = (NSXPCConnection *)v14;

    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_256C3FD80);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v9->_connection, "setRemoteObjectInterface:", v16);

    -[NSXPCConnection resume](v9->_connection, "resume");
    p_clientID = &v9->_clientID;
    objc_storeStrong((id *)&v9->_clientID, a3);
    objc_storeStrong((id *)&v9->_locBundlePath, a4);
    +[_GDSBalancingAuthority loadRegistrations](_GDSBalancingAuthority, "loadRegistrations");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKeyedSubscript:", v9->_clientID);
    v19 = objc_claimAutoreleasedReturnValue();
    if (!v19
      || (v20 = (void *)v19,
          objc_msgSend(v18, "objectForKeyedSubscript:", *p_clientID),
          v21 = (void *)objc_claimAutoreleasedReturnValue(),
          v22 = objc_msgSend(v21, "isEqualToString:", v8),
          v21,
          v20,
          (v22 & 1) == 0))
    {
      -[_GDSManager log](v9, "log");
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v24 = *p_clientID;
        *(_DWORD *)buf = 138412290;
        v28 = v24;
        _os_log_impl(&dword_23D1EF000, v23, OS_LOG_TYPE_DEFAULT, "Registering client %@", buf, 0xCu);
      }

      -[_GDSManager registerClientID:locationBundlePath:](v9, "registerClientID:locationBundlePath:", v7, v8);
    }

  }
  return v9;
}

+ (id)managerWithID:(id)a3 locationBundlePath:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v5 = a3;
  v6 = a4;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __48___GDSManager_managerWithID_locationBundlePath___block_invoke;
  v12[3] = &unk_250E0CE70;
  v13 = v5;
  v14 = v6;
  v7 = managerWithID_locationBundlePath__once;
  v8 = v6;
  v9 = v5;
  if (v7 != -1)
    dispatch_once(&managerWithID_locationBundlePath__once, v12);
  v10 = (id)managerWithID_locationBundlePath__instance;

  return v10;
}

- (void)registerClientID:(id)a3 locationBundlePath:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  NSXPCConnection *connection;
  uint64_t v11;
  void *v12;
  _QWORD v13[6];
  _QWORD v14[6];
  uint8_t buf[16];

  v7 = a4;
  v8 = a3;
  -[_GDSManager log](self, "log");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23D1EF000, v9, OS_LOG_TYPE_DEFAULT, "Calling registration with griddatad", buf, 2u);
  }

  connection = self->_connection;
  v11 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __51___GDSManager_registerClientID_locationBundlePath___block_invoke;
  v14[3] = &unk_250E0CE98;
  v14[4] = self;
  v14[5] = a2;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v11;
  v13[1] = 3221225472;
  v13[2] = __51___GDSManager_registerClientID_locationBundlePath___block_invoke_60;
  v13[3] = &unk_250E0CE98;
  v13[4] = self;
  v13[5] = a2;
  objc_msgSend(v12, "registerClientID:locationBundlePath:handler:", v8, v7, v13);

}

- (void)triggerBAUpdateWithHandler:(id)a3
{
  id v5;
  NSObject *v6;
  NSXPCConnection *connection;
  uint64_t v8;
  void *v9;
  NSString *clientID;
  id v11;
  _QWORD v12[5];
  id v13;
  SEL v14;
  _QWORD v15[6];
  uint8_t buf[16];

  v5 = a3;
  -[_GDSManager log](self, "log");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23D1EF000, v6, OS_LOG_TYPE_DEFAULT, "Calling fetch BA with griddatad", buf, 2u);
  }

  connection = self->_connection;
  v8 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __42___GDSManager_triggerBAUpdateWithHandler___block_invoke;
  v15[3] = &unk_250E0CE98;
  v15[4] = self;
  v15[5] = a2;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  clientID = self->_clientID;
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __42___GDSManager_triggerBAUpdateWithHandler___block_invoke_61;
  v12[3] = &unk_250E0CEC0;
  v13 = v5;
  v14 = a2;
  v12[4] = self;
  v11 = v5;
  objc_msgSend(v9, "updateBAClientID:handler:", clientID, v12);

}

- (id)latestBalancingAuthority
{
  void *v3;
  id v4;
  NSObject *v5;
  id v7;

  v7 = 0;
  -[_GDSManager latestBalancingAuthorityWithError:](self, "latestBalancingAuthorityWithError:", &v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v7;
  if (v4)
  {
    -[_GDSManager log](self, "log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[_GDSManager latestBalancingAuthority].cold.1(v4, v5);

  }
  return v3;
}

- (id)latestBalancingAuthorityWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  NSObject *log;
  void *v36;
  void *v37;
  NSObject *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  int v44;
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;
  uint64_t v50;
  const __CFString *v51;
  uint64_t v52;
  const __CFString *v53;
  uint64_t v54;
  const __CFString *v55;
  uint64_t v56;
  _QWORD v57[2];

  v57[1] = *MEMORY[0x24BDAC8D0];
  +[_GDSBalancingAuthority loadBalancingAuthorityStatus](_GDSBalancingAuthority, "loadBalancingAuthorityStatus");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "count"))
  {
    -[_GDSManager log](self, "log");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[_GDSManager latestBalancingAuthorityWithError:].cold.1(v22, v23, v24, v25, v26, v27, v28, v29);

    v30 = (void *)MEMORY[0x24BDD1540];
    v56 = *MEMORY[0x24BDD0FC8];
    v57[0] = CFSTR("Failed to get latest BA. Location availability status not found");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v57, &v56, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "errorWithDomain:code:userInfo:", CFSTR("com.apple.gds"), 2, v31);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_17;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", self->_clientID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[_GDSManager log](self, "log");
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      -[_GDSManager latestBalancingAuthorityWithError:].cold.2((uint64_t *)&self->_clientID, (uint64_t)self, v32);

    v33 = (void *)MEMORY[0x24BDD1540];
    v54 = *MEMORY[0x24BDD0FC8];
    v55 = CFSTR("Failed to get latest BA. Location availability status not found for client");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "errorWithDomain:code:userInfo:", CFSTR("com.apple.gds"), 1, v34);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_17;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", self->_clientID);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  if ((v8 & 1) == 0)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v44) = 0;
      _os_log_impl(&dword_23D1EF000, log, OS_LOG_TYPE_DEFAULT, "Location not available", (uint8_t *)&v44, 2u);
    }
    v36 = (void *)MEMORY[0x24BDD1540];
    v52 = *MEMORY[0x24BDD0FC8];
    v53 = CFSTR("Failed to get latest BA. Location authorization not available for client");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v53, &v52, 1);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "errorWithDomain:code:userInfo:", CFSTR("com.apple.gds"), 2, v37);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

LABEL_17:
    AnalyticsSendEventLazy();
    v9 = 0;
    goto LABEL_18;
  }
  +[_GDSBalancingAuthority currentBalancingAuthority](_GDSBalancingAuthority, "currentBalancingAuthority");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("Unkown"));

  if (v11)
  {
    -[_GDSManager log](self, "log");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[_GDSManager latestBalancingAuthorityWithError:].cold.3(v12, v13, v14, v15, v16, v17, v18, v19);

    v20 = (void *)MEMORY[0x24BDD1540];
    v50 = *MEMORY[0x24BDD0FC8];
    v51 = CFSTR("Failed to get latest BA. Unable to find BA name");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("com.apple.gds"), 3, v21);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  AnalyticsSendEventLazy();
  v39 = self->_log;
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    v40 = v39;
    objc_msgSend(v9, "name");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lastUpdatedDate");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = 138412802;
    v45 = v41;
    v46 = 2112;
    v47 = v42;
    v48 = 2112;
    v49 = v43;
    _os_log_impl(&dword_23D1EF000, v40, OS_LOG_TYPE_DEFAULT, "Balancing Authority Output Name:%@, ID:%@, Date:%@", (uint8_t *)&v44, 0x20u);

  }
LABEL_18:

  return v9;
}

- (id)latestMarginalEmissionForecast
{
  void *v3;
  void *v4;
  NSObject *log;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint8_t v11[16];

  -[_GDSManager latestBalancingAuthority](self, "latestBalancingAuthority");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_GDSManager getFakeMarginalEmissionForecast](self, "getFakeMarginalEmissionForecast");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_23D1EF000, log, OS_LOG_TYPE_DEFAULT, "Returning the fake forecast set in defaults.", v11, 2u);
    }
    v6 = v4;
  }
  else
  {
    objc_msgSend(v3, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      +[_GDSServerConnection sharedInstance](_GDSServerConnection, "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "fetchMarginalEmissionForecastFor:", v3);
      v6 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v9 = self->_log;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[_GDSManager latestMarginalEmissionForecast].cold.1(v9, v3);
      v6 = 0;
    }
  }

  return v6;
}

- (id)carbonIntensityHistoryForBA:(id)a3 from:(id)a4 to:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *log;
  int v16;
  id v17;
  __int16 v18;
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v8 && v9 && v10)
  {
    +[_GDSServerConnection sharedInstance](_GDSServerConnection, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "fetchCarbonIntensityHistoryForBA:from:to:", v8, v9, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      v16 = 138412802;
      v17 = v8;
      v18 = 2112;
      v19 = v9;
      v20 = 2112;
      v21 = v11;
      _os_log_error_impl(&dword_23D1EF000, log, OS_LOG_TYPE_ERROR, "Parameters not specified BA:%@ startDate:%@ endDate:%@", (uint8_t *)&v16, 0x20u);
    }
    v13 = 0;
  }

  return v13;
}

- (void)fixMarginalEmissionForecast:(id)a3
{
  id v4;
  NSObject *log;
  void *v6;
  uint8_t v7[16];

  v4 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_23D1EF000, log, OS_LOG_TYPE_DEFAULT, "Fixing the marginal emission forecast.", v7, 2u);
  }
  -[_GDSManager fakeDataDefaults](self, "fakeDataDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v4, CFSTR("fakeForecast"));

}

- (void)unFixMarginalEmissionForecast
{
  NSObject *log;
  void *v4;
  uint8_t v5[16];

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_23D1EF000, log, OS_LOG_TYPE_DEFAULT, "Unfixing the marginal emission forecast.", v5, 2u);
  }
  -[_GDSManager fakeDataDefaults](self, "fakeDataDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObjectForKey:", CFSTR("fakeForecast"));

}

- (void)setFakeSecret:(id)a3
{
  id v4;
  NSObject *log;
  void *v6;
  uint8_t v7[16];

  v4 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_23D1EF000, log, OS_LOG_TYPE_DEFAULT, "Setting the HMAC secret.", v7, 2u);
  }
  -[_GDSManager fakeDataDefaults](self, "fakeDataDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v4, CFSTR("fakeSecret"));

}

- (void)unSetFakeSecret
{
  NSObject *log;
  void *v4;
  uint8_t v5[16];

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_23D1EF000, log, OS_LOG_TYPE_DEFAULT, "Unsetting the HMAC secret.", v5, 2u);
  }
  -[_GDSManager fakeDataDefaults](self, "fakeDataDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObjectForKey:", CFSTR("fakeSecret"));

}

- (void)setFakeSecretVersion:(id)a3
{
  id v4;
  NSObject *log;
  void *v6;
  uint8_t v7[16];

  v4 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_23D1EF000, log, OS_LOG_TYPE_DEFAULT, "Setting the HMAC secret version.", v7, 2u);
  }
  -[_GDSManager fakeDataDefaults](self, "fakeDataDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v4, CFSTR("fakeSecretVersion"));

}

- (void)unSetFakeSecretVersion
{
  NSObject *log;
  void *v4;
  uint8_t v5[16];

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_23D1EF000, log, OS_LOG_TYPE_DEFAULT, "Unsetting the HMAC secret version", v5, 2u);
  }
  -[_GDSManager fakeDataDefaults](self, "fakeDataDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObjectForKey:", CFSTR("fakeSecretVersion"));

}

- (void)setFakeConfigURL:(id)a3
{
  id v4;
  NSObject *log;
  void *v6;
  uint8_t v7[16];

  v4 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_23D1EF000, log, OS_LOG_TYPE_DEFAULT, "Setting the configURL.", v7, 2u);
  }
  -[_GDSManager fakeDataDefaults](self, "fakeDataDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v4, CFSTR("fakeConfigURL"));

}

- (void)unSetFakeConfigURL
{
  NSObject *log;
  void *v4;
  uint8_t v5[16];

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_23D1EF000, log, OS_LOG_TYPE_DEFAULT, "Unsetting the configURL.", v5, 2u);
  }
  -[_GDSManager fakeDataDefaults](self, "fakeDataDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObjectForKey:", CFSTR("fakeConfigURL"));

}

- (void)setFakeServerURL:(id)a3
{
  id v4;
  NSObject *log;
  void *v6;
  uint8_t v7[16];

  v4 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_23D1EF000, log, OS_LOG_TYPE_DEFAULT, "Setting the serverURL.", v7, 2u);
  }
  -[_GDSManager fakeDataDefaults](self, "fakeDataDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v4, CFSTR("fakeServerURL"));

}

- (void)unSetFakeServerURL
{
  NSObject *log;
  void *v4;
  uint8_t v5[16];

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_23D1EF000, log, OS_LOG_TYPE_DEFAULT, "Unsetting the serverURL.", v5, 2u);
  }
  -[_GDSManager fakeDataDefaults](self, "fakeDataDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObjectForKey:", CFSTR("fakeServerURL"));

}

- (id)getFakeMarginalEmissionForecast
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  unsigned int v17;
  void *v18;
  _GDSEmissionForecast *v19;
  NSObject *log;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[16];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  -[_GDSManager fakeDataDefaults](self, "fakeDataDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayForKey:", CFSTR("fakeForecast"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v7 = objc_claimAutoreleasedReturnValue();
    v24 = v5;
    objc_msgSend(v5, "components:fromDate:", 192, v7);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)v7;
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE60]), "initWithTimeInterval:sinceDate:", v7, (double)-fmod((double)(objc_msgSend(v22, "second") + 60 * objc_msgSend(v22, "minute")), 900.0));
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v25 = v4;
    v9 = v4;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v10)
    {
      v11 = v10;
      v12 = 0;
      v13 = *(_QWORD *)v27;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v27 != v13)
            objc_enumerationMutation(v9);
          v15 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v14);
          v16 = objc_alloc(MEMORY[0x24BDBCE60]);
          v17 = v12++;
          v18 = (void *)objc_msgSend(v16, "initWithTimeInterval:sinceDate:", v8, (double)v17 * 900.0);
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v15, v18);

          ++v14;
        }
        while (v11 != v14);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v11);
    }

    v19 = -[_GDSEmissionForecast initWithForecast:generatedAt:fetchedAt:refetchInterval:]([_GDSEmissionForecast alloc], "initWithForecast:generatedAt:fetchedAt:refetchInterval:", v6, v8, v23, 14400.0);
    v4 = v25;
  }
  else
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23D1EF000, log, OS_LOG_TYPE_DEFAULT, "Found no fakeForecast values.", buf, 2u);
    }
    v19 = 0;
  }

  return v19;
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)_GDSManager;
  -[_GDSManager dealloc](&v3, sel_dealloc);
}

- (NSDictionary)currentMarginalForecast
{
  return self->_currentMarginalForecast;
}

- (void)setCurrentMarginalForecast:(id)a3
{
  objc_storeStrong((id *)&self->_currentMarginalForecast, a3);
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (NSString)clientID
{
  return self->_clientID;
}

- (void)setClientID:(id)a3
{
  objc_storeStrong((id *)&self->_clientID, a3);
}

- (NSString)locBundlePath
{
  return self->_locBundlePath;
}

- (void)setLocBundlePath:(id)a3
{
  objc_storeStrong((id *)&self->_locBundlePath, a3);
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
  objc_storeStrong((id *)&self->_locBundlePath, 0);
  objc_storeStrong((id *)&self->_clientID, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_currentMarginalForecast, 0);
}

- (void)latestBalancingAuthority
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_5(&dword_23D1EF000, a2, v4, "Error getting BA. Error information %@", (uint8_t *)&v5);

  OUTLINED_FUNCTION_6();
}

- (void)latestBalancingAuthorityWithError:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_23D1EF000, a1, a3, "Location availability status not found", a5, a6, a7, a8, 0);
}

- (void)latestBalancingAuthorityWithError:(os_log_t)log .cold.2(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = *(_QWORD *)(a2 + 40);
  v5 = 138412546;
  v6 = v3;
  v7 = 2112;
  v8 = v4;
  _os_log_error_impl(&dword_23D1EF000, log, OS_LOG_TYPE_ERROR, "Location availability status not found for clientID %@, bundlePath %@", (uint8_t *)&v5, 0x16u);
}

- (void)latestBalancingAuthorityWithError:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_23D1EF000, a1, a3, "Unable to find BA name", a5, a6, a7, a8, 0);
}

- (void)latestMarginalEmissionForecast
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412290;
  v7 = v4;
  OUTLINED_FUNCTION_5(&dword_23D1EF000, v3, v5, "Parameter not specified BA:%@", (uint8_t *)&v6);

  OUTLINED_FUNCTION_6();
}

@end
