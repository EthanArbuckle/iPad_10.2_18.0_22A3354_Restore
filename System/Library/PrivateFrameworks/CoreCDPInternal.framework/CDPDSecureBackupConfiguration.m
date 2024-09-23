@implementation CDPDSecureBackupConfiguration

+ (CDPDSecureBackupConfiguration)configurationWithContext:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;

  v4 = _SharedURLSession_onceToken;
  v5 = a3;
  if (v4 != -1)
    dispatch_once(&_SharedURLSession_onceToken, &__block_literal_global_10);
  objc_msgSend(a1, "configurationWithContext:andSession:", v5, _SharedURLSession_sharedURLSession);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (CDPDSecureBackupConfiguration *)v6;
}

+ (CDPDSecureBackupConfiguration)configurationWithContext:(id)a3 andSession:(id)a4
{
  id v5;
  id v6;
  _QWORD *v7;
  void *v8;
  id v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init((Class)objc_opt_class());
  v8 = (void *)v7[1];
  v7[1] = v5;
  v9 = v5;

  v10 = (void *)v7[4];
  v7[4] = v6;

  return (CDPDSecureBackupConfiguration *)v7;
}

- (id)escrowAuthInfo
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  _CDPLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[CDPDSecureBackupConfiguration escrowAuthInfo].cold.6();

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CDPContext guestMode](self->_context, "guestMode"))
  {
    -[CDPDSecureBackupConfiguration _iCloudEnvironment](self, "_iCloudEnvironment");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, *MEMORY[0x24BE17BD0]);
    }
    else
    {
      _CDPLogSystem();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        -[CDPDSecureBackupConfiguration escrowAuthInfo].cold.2();

    }
    -[CDPDSecureBackupConfiguration _escrowProxyURL](self, "_escrowProxyURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, *MEMORY[0x24BE17BC0]);
      goto LABEL_29;
    }
    _CDPLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[CDPDSecureBackupConfiguration escrowAuthInfo].cold.1();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE1A3D0], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "iCloudEnv");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, *MEMORY[0x24BE17BD0]);
    }
    else
    {
      _CDPLogSystem();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[CDPDSecureBackupConfiguration escrowAuthInfo].cold.5();

    }
    objc_msgSend(MEMORY[0x24BE1A3D0], "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "authToken");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, *MEMORY[0x24BE17BB0]);
    }
    else
    {
      _CDPLogSystem();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[CDPDSecureBackupConfiguration escrowAuthInfo].cold.4();

    }
    objc_msgSend(MEMORY[0x24BE1A3D0], "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "escrowURL");
    v11 = objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, *MEMORY[0x24BE17BC0]);
    }
    else
    {
      _CDPLogSystem();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[CDPDSecureBackupConfiguration escrowAuthInfo].cold.3();

    }
  }

LABEL_29:
  if (-[CDPContext idmsRecovery](self->_context, "idmsRecovery"))
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE17C48]);
  }
  else
  {
    -[CDPContext findMyiPhoneUUID](self->_context, "findMyiPhoneUUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE17C20]);
      -[CDPContext findMyiPhoneUUID](self->_context, "findMyiPhoneUUID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, *MEMORY[0x24BE17C28]);

    }
  }
  -[CDPContext appleID](self->_context, "appleID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[CDPContext appleID](self->_context, "appleID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v18, *MEMORY[0x24BE17BA8]);

  }
  -[CDPContext dsid](self->_context, "dsid");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringValue");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[CDPContext dsid](self->_context, "dsid");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringValue");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v22, *MEMORY[0x24BE17BB8]);

  }
  -[CDPContext passwordEquivToken](self->_context, "passwordEquivToken");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    -[CDPContext passwordEquivToken](self->_context, "passwordEquivToken");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v24, *MEMORY[0x24BE17BC8]);

  }
  v25 = (void *)objc_msgSend(v4, "copy");

  return v25;
}

- (id)accountInfoFetchSetupDictionary
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint8_t v8[16];

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[CDPContext guestMode](self->_context, "guestMode") & 1) == 0)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE17CB8]);
  if (-[CDPContext type](self->_context, "type") == 3
    || -[CDPContext type](self->_context, "type") == 6
    || -[CDPContext type](self->_context, "type") == 7)
  {
    _CDPLogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_20DB2C000, v4, OS_LOG_TYPE_DEFAULT, "\"Requesting the server suppress filtering\", v8, 2u);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE17CB0]);
  }
  -[CDPDSecureBackupConfiguration escrowAuthInfo](self, "escrowAuthInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addEntriesFromDictionary:", v5);

  v6 = (void *)objc_msgSend(v3, "copy");
  return v6;
}

- (id)_iCloudEnvironment
{
  void *v2;
  void *v3;

  -[CDPDSecureBackupConfiguration _escrowConfigurationBag](self, "_escrowConfigurationBag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("iCloudEnv"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_escrowProxyURL
{
  void *v2;
  void *v3;

  -[CDPDSecureBackupConfiguration _escrowConfigurationBag](self, "_escrowConfigurationBag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("escrowProxyUrl"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_escrowProxyConfigurationURL
{
  void *v2;
  void *v3;

  -[CDPDSecureBackupConfiguration _setupConfigurationURLs](self, "_setupConfigurationURLs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("getRecoverySettings"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_escrowConfigurationBag
{
  void *v2;
  void *v3;
  void *v4;

  -[CDPDSecureBackupConfiguration _escrowConfigurationBagFull](self, "_escrowConfigurationBagFull");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("com.apple.mobileme"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("com.apple.Dataclass.KeychainSync"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_setupConfigurationURLs
{
  NSDictionary *configurationURLs;
  NSDictionary *v4;
  NSDictionary *v5;

  configurationURLs = self->_configurationURLs;
  if (!configurationURLs)
  {
    -[CDPDSecureBackupConfiguration _fetchConfigurationDictionary](self, "_fetchConfigurationDictionary");
    v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v5 = self->_configurationURLs;
    self->_configurationURLs = v4;

    configurationURLs = self->_configurationURLs;
  }
  return -[NSDictionary objectForKeyedSubscript:](configurationURLs, "objectForKeyedSubscript:", CFSTR("urls"));
}

- (id)_escrowConfigurationBagFull
{
  NSDictionary *escrowConfigurationURLs;
  NSDictionary *v4;
  NSDictionary *v5;

  escrowConfigurationURLs = self->_escrowConfigurationURLs;
  if (!escrowConfigurationURLs)
  {
    -[CDPDSecureBackupConfiguration _fetchEscrowConfigurationBag](self, "_fetchEscrowConfigurationBag");
    v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v5 = self->_escrowConfigurationURLs;
    self->_escrowConfigurationURLs = v4;

    escrowConfigurationURLs = self->_escrowConfigurationURLs;
  }
  return escrowConfigurationURLs;
}

- (id)_escrowProxyConfigurationURLRequest
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_class();
  -[CDPDSecureBackupConfiguration _escrowProxyConfigurationURL](self, "_escrowProxyConfigurationURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_configurationRequestWithURLString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "cdp_addClientInfoHeader");
  objc_msgSend(v5, "cdp_addAuthHeaderWithContext:", self->_context);
  objc_msgSend(v5, "setValue:forHTTPHeaderField:", CFSTR("en-us"), CFSTR("Accept-Language"));
  objc_msgSend(v5, "setValue:forHTTPHeaderField:", CFSTR("application/xml"), CFSTR("Accept"));
  return v5;
}

- (id)_configurationInfoURLRequest
{
  return (id)objc_msgSend((id)objc_opt_class(), "_configurationRequestWithURLString:", CFSTR("https://setup.icloud.com/configurations/init?context=settings"));
}

+ (id)_configurationRequestWithURLString:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)MEMORY[0x24BDD16B0];
  v4 = a3;
  v5 = [v3 alloc];
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v5, "initWithURL:", v6);
  objc_msgSend(v7, "cdp_addClientInfoHeader");
  return v7;
}

- (id)_fetchEscrowConfigurationBag
{
  void *v3;
  void *v4;

  -[CDPDSecureBackupConfiguration _escrowProxyConfigurationURLRequest](self, "_escrowProxyConfigurationURLRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPDSecureBackupConfiguration _fetchConfigurationWithRequest:](self, "_fetchConfigurationWithRequest:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_fetchConfigurationDictionary
{
  void *v3;
  void *v4;

  -[CDPDSecureBackupConfiguration _configurationInfoURLRequest](self, "_configurationInfoURLRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPDSecureBackupConfiguration _fetchConfigurationWithRequest:](self, "_fetchConfigurationWithRequest:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_fetchConfigurationWithRequest:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  dispatch_semaphore_t v8;
  NSURLSession *session;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  NSObject *v21;
  _QWORD v23[4];
  NSObject *v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  _QWORD v33[4];
  id v34;
  uint8_t buf[4];
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    v32 = 0;
    v33[0] = &v32;
    v33[1] = 0x3032000000;
    v33[2] = __Block_byref_object_copy__7;
    v33[3] = __Block_byref_object_dispose__7;
    v34 = 0;
    v28 = 0;
    v29 = &v28;
    v30 = 0x2020000000;
    v31 = 0;
    v5 = 1;
    v6 = MEMORY[0x24BDAC760];
    do
    {
      _CDPLogSystem();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v36 = v4;
        _os_log_debug_impl(&dword_20DB2C000, v7, OS_LOG_TYPE_DEBUG, "\"Attempting to fetch configuration using request: %@\", buf, 0xCu);
      }

      v8 = dispatch_semaphore_create(0);
      session = self->_session;
      v23[0] = v6;
      v23[1] = 3221225472;
      v23[2] = __64__CDPDSecureBackupConfiguration__fetchConfigurationWithRequest___block_invoke;
      v23[3] = &unk_24C81DBD8;
      v26 = &v32;
      v27 = v5;
      v25 = &v28;
      v10 = v8;
      v24 = v10;
      -[NSURLSession dataTaskWithRequest:completionHandler:](session, "dataTaskWithRequest:completionHandler:", v4, v23);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "resume");
      dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);

      ++v5;
    }
    while (*((_BYTE *)v29 + 24));
    v12 = *(void **)(v33[0] + 40);
    if (v12)
    {
      _CDPLogSystem();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        -[CDPDSecureBackupConfiguration _fetchConfigurationWithRequest:].cold.2((uint64_t)v33, v13, v14, v15, v16, v17, v18, v19);

      v12 = *(void **)(v33[0] + 40);
    }
    v20 = v12;
    _Block_object_dispose(&v28, 8);
    _Block_object_dispose(&v32, 8);

  }
  else
  {
    _CDPLogSystem();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[CDPDSecureBackupConfiguration _fetchConfigurationWithRequest:].cold.1();

    v20 = 0;
  }

  return v20;
}

void __64__CDPDSecureBackupConfiguration__fetchConfigurationWithRequest___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  _CDPLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    __64__CDPDSecureBackupConfiguration__fetchConfigurationWithRequest___block_invoke_cold_3((uint64_t)v8, v10, v11, v12, v13, v14, v15, v16);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v8, "statusCode") == 500)
  {
    _CDPLogSystem();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      __64__CDPDSecureBackupConfiguration__fetchConfigurationWithRequest___block_invoke_cold_1();

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(_QWORD *)(a1 + 56) < 4;
  }
  else if (v9)
  {
    _CDPLogSystem();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      __64__CDPDSecureBackupConfiguration__fetchConfigurationWithRequest___block_invoke_cold_2((uint64_t)v9, v18);

  }
  else
  {
    v22 = 0;
    objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v7, 0, 0, &v22);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v21 = *(void **)(v20 + 40);
    *(_QWORD *)(v20 + 40) = v19;

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_escrowConfigurationURLs, 0);
  objc_storeStrong((id *)&self->_configurationURLs, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

- (void)escrowAuthInfo
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"Creating SecureBackup auth info\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)_fetchConfigurationWithRequest:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_1(&dword_20DB2C000, v0, v1, "\"Invalid configuration request detected\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)_fetchConfigurationWithRequest:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_20DB2C000, a2, a3, "\"Configuration Fetched: %@\", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

void __64__CDPDSecureBackupConfiguration__fetchConfigurationWithRequest___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_1(&dword_20DB2C000, v0, v1, "\"Server Indicated that a retry attempt is needed\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __64__CDPDSecureBackupConfiguration__fetchConfigurationWithRequest___block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_20DB2C000, a2, OS_LOG_TYPE_ERROR, "\"Failed to load configuraiton: %@\", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_4();
}

void __64__CDPDSecureBackupConfiguration__fetchConfigurationWithRequest___block_invoke_cold_3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_20DB2C000, a2, a3, "\"Configuration Response: %@\", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

@end
