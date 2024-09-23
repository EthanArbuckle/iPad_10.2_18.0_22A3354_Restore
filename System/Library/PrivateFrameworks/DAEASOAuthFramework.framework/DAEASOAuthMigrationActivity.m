@implementation DAEASOAuthMigrationActivity

- (void)scheduleActivity
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  double v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  id v18;

  -[DAEASOAuthMigrationActivity scheduler](self, "scheduler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1470]), "initWithIdentifier:", CFSTR("com.apple.exchangesync.DAEASOAuthMigrationActivity"));
    -[DAEASOAuthMigrationActivity setScheduler:](self, "setScheduler:", v4);

    -[DAEASOAuthMigrationActivity scheduler](self, "scheduler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setRepeats:", 1);

    if (+[DAEASOAuthMigrationActivity profileMigrationEnabled](DAEASOAuthMigrationActivity, "profileMigrationEnabled"))
    {
      v6 = *MEMORY[0x24BE2FD48];
      -[DAEASOAuthMigrationActivity scheduler](self, "scheduler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setInterval:", v6);

      v8 = *MEMORY[0x24BE2FD58];
      -[DAEASOAuthMigrationActivity scheduler](self, "scheduler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setTolerance:", v8);

      -[DAEASOAuthMigrationActivity scheduler](self, "scheduler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      v12 = 33;
    }
    else
    {
      v13 = *MEMORY[0x24BE2FD40];
      -[DAEASOAuthMigrationActivity scheduler](self, "scheduler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setInterval:", v13);

      v15 = *MEMORY[0x24BE2FD50];
      -[DAEASOAuthMigrationActivity scheduler](self, "scheduler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setTolerance:", v15);

      -[DAEASOAuthMigrationActivity scheduler](self, "scheduler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      v12 = 9;
    }
    objc_msgSend(v10, "setQualityOfService:", v12);

    -[DAEASOAuthMigrationActivity scheduler](self, "scheduler");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    -[DAEASOAuthMigrationActivity _triggerAccountMigration](self, "_triggerAccountMigration");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "scheduleWithBlock:", v17);

  }
}

- (void)invalidateActivity
{
  void *v3;
  void *v4;

  -[DAEASOAuthMigrationActivity scheduler](self, "scheduler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[DAEASOAuthMigrationActivity scheduler](self, "scheduler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidate");

    -[DAEASOAuthMigrationActivity setScheduler:](self, "setScheduler:", 0);
  }
}

- (void)_retrieveMigrationStatusFromConfigurationURI:(id)a3 withCompletion:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a3;
  v6 = a4;
  dispatch_get_global_queue(25, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __91__DAEASOAuthMigrationActivity__retrieveMigrationStatusFromConfigurationURI_withCompletion___block_invoke;
  v10[3] = &unk_24E3706A0;
  v11 = v5;
  v12 = v6;
  v8 = v6;
  v9 = v5;
  dispatch_async(v7, v10);

}

void __91__DAEASOAuthMigrationActivity__retrieveMigrationStatusFromConfigurationURI_withCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v2 = (void *)MEMORY[0x24BDD16B0];
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestWithURL:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "_setNonAppInitiated:", 1);
  objc_msgSend(MEMORY[0x24BDD1858], "ephemeralSessionConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1850], "sessionWithConfiguration:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __91__DAEASOAuthMigrationActivity__retrieveMigrationStatusFromConfigurationURI_withCompletion___block_invoke_2;
  v8[3] = &unk_24E370678;
  v9 = *(id *)(a1 + 40);
  objc_msgSend(v6, "dataTaskWithRequest:completionHandler:", v4, v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resume");

}

void __91__DAEASOAuthMigrationActivity__retrieveMigrationStatusFromConfigurationURI_withCompletion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  char isKindOfClass;
  void *v13;
  os_log_type_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  os_log_type_t v18;
  const char *v19;
  void *v20;
  char v21;
  void *v22;
  char v23;
  os_log_type_t v24;
  id v25;
  uint8_t buf[4];
  NSObject *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a4;
  v8 = v7;
  if (v6 && !v7)
  {
    v25 = 0;
    objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v6, 0, 0, &v25);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v25;
    if (v9)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[NSObject objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", CFSTR("iOSExchangeAccountAuthMigrationEnabled-v2"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          -[NSObject objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", CFSTR("iOSExchangeAccountAuthMigrationEnabled-v2"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "isEqualToString:", CFSTR("YES"));

        }
        -[NSObject objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", CFSTR("iOSExchangeAccountAuthMigrationDisallowedDomains"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v21 = objc_opt_isKindOfClass();

        if ((v21 & 1) != 0)
        {
          -[NSObject objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", CFSTR("iOSExchangeAccountAuthMigrationDisallowedDomains"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v16 = 0;
        }
        -[NSObject objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", CFSTR("iOSExchangeAccountAuthMigrationDisallowedHosts"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v23 = objc_opt_isKindOfClass();

        if ((v23 & 1) != 0)
        {
          -[NSObject objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", CFSTR("iOSExchangeAccountAuthMigrationDisallowedHosts"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v15 = 0;
        }
        DALoggingwithCategory();
        v17 = objc_claimAutoreleasedReturnValue();
        v24 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 6);
        if (os_log_type_enabled(v17, v24))
        {
          *(_DWORD *)buf = 138412290;
          v27 = v9;
          _os_log_impl(&dword_21EC86000, v17, v24, "DAEASOAuthMigrationActivity: Configuration set to: %@", buf, 0xCu);
        }
        goto LABEL_16;
      }
      DALoggingwithCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 3);
      if (os_log_type_enabled(v17, v18))
      {
        *(_DWORD *)buf = 138412290;
        v27 = v9;
        v19 = "DAEASOAuthMigrationActivity: Invalid configuration data: %@";
        goto LABEL_14;
      }
    }
    else
    {
      DALoggingwithCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 3);
      if (os_log_type_enabled(v17, v18))
      {
        *(_DWORD *)buf = 138412290;
        v27 = v10;
        v19 = "DAEASOAuthMigrationActivity: Unable to decode configuration data. Error: %@";
LABEL_14:
        _os_log_impl(&dword_21EC86000, v17, v18, v19, buf, 0xCu);
      }
    }
    v15 = 0;
    v16 = 0;
LABEL_16:

    goto LABEL_17;
  }
  DALoggingwithCategory();
  v10 = objc_claimAutoreleasedReturnValue();
  v14 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 3);
  if (os_log_type_enabled(v10, v14))
  {
    *(_DWORD *)buf = 138412546;
    v27 = v8;
    v28 = 2112;
    v29 = v6;
    _os_log_impl(&dword_21EC86000, v10, v14, "DAEASOAuthMigrationActivity: Could not retrieve configuration. Error: %@. Data: %@", buf, 0x16u);
  }
  v15 = 0;
  v16 = 0;
LABEL_17:

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_serverMigrationStatus
{
  dispatch_semaphore_t v3;
  NSObject *v4;
  id v5;
  _QWORD v7[4];
  NSObject *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy_;
  v14 = __Block_byref_object_dispose_;
  v15 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v3 = dispatch_semaphore_create(0);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __53__DAEASOAuthMigrationActivity__serverMigrationStatus__block_invoke;
  v7[3] = &unk_24E3706C8;
  v9 = &v10;
  v4 = v3;
  v8 = v4;
  -[DAEASOAuthMigrationActivity _retrieveMigrationStatusFromConfigurationURI:withCompletion:](self, "_retrieveMigrationStatusFromConfigurationURI:withCompletion:", CFSTR("https://configuration.apple.com/configurations/internetservices/exchangesync/oauth-migration-configuration.plist"), v7);
  dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
  v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v5;
}

intptr_t __53__DAEASOAuthMigrationActivity__serverMigrationStatus__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  objc_class *v7;
  id v8;
  id v9;
  void *v10;

  v7 = (objc_class *)MEMORY[0x24BDD16E0];
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_msgSend([v7 alloc], "initWithBool:", a2);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:forKeyedSubscript:", v10, CFSTR("migrationEnabled"));

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:forKeyedSubscript:", v9, CFSTR("disallowedDomains"));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:forKeyedSubscript:", v8, CFSTR("disallowedHosts"));

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (BOOL)profileMigrationEnabled
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  os_log_type_t v6;
  _BOOL4 v7;
  const char *v8;
  uint8_t *v9;
  __int16 v11;
  __int16 v12;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKey:", CFSTR("ExchangeAccountEnableMigration"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  DALoggingwithCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 7);
  v7 = os_log_type_enabled(v5, v6);
  if (v4)
  {
    if (v7)
    {
      v12 = 0;
      v8 = "profileMigrationEnabled: YES";
      v9 = (uint8_t *)&v12;
LABEL_6:
      _os_log_impl(&dword_21EC86000, v5, v6, v8, v9, 2u);
    }
  }
  else if (v7)
  {
    v11 = 0;
    v8 = "profileMigrationEnabled: NO";
    v9 = (uint8_t *)&v11;
    goto LABEL_6;
  }

  return v4 != 0;
}

+ (BOOL)profileMigrationDisabled
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  os_log_type_t v6;
  _BOOL4 v7;
  const char *v8;
  uint8_t *v9;
  __int16 v11;
  __int16 v12;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKey:", CFSTR("ExchangeAccountDisableMigration"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  DALoggingwithCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 7);
  v7 = os_log_type_enabled(v5, v6);
  if (v4)
  {
    if (v7)
    {
      v12 = 0;
      v8 = "profileMigrationDisabled: YES";
      v9 = (uint8_t *)&v12;
LABEL_6:
      _os_log_impl(&dword_21EC86000, v5, v6, v8, v9, 2u);
    }
  }
  else if (v7)
  {
    v11 = 0;
    v8 = "profileMigrationDisabled: NO";
    v9 = (uint8_t *)&v11;
    goto LABEL_6;
  }

  return v4 != 0;
}

- (BOOL)_isExchangeBasicAccount:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  os_log_type_t v14;
  const __CFString *v15;
  id v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v17 = 0;
  objc_msgSend(MEMORY[0x24BE00E88], "credentialForAccount:clientID:error:", v3, 0, &v17);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v17;
  objc_msgSend(v3, "accountType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BDB4030]);

  objc_msgSend(v3, "username");
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v9
    || (v10 = (void *)v9,
        objc_msgSend(v4, "password"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v11,
        v10,
        !v11))
  {
    v8 = 0;
  }
  objc_msgSend(v4, "oauthRefreshToken");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    v8 = 0;
  DALoggingwithCategory();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 7);
  if (os_log_type_enabled(v13, v14))
  {
    v15 = CFSTR("No");
    if (v8)
      v15 = CFSTR("Yes");
    *(_DWORD *)buf = 138412546;
    v19 = v3;
    v20 = 2112;
    v21 = v15;
    _os_log_impl(&dword_21EC86000, v13, v14, "_isExchangeBasicAccount: Account %@ is a basic exchange account? %@", buf, 0x16u);
  }

  return v8;
}

- (void)_sendAnalyticsForMigratingAccount:(id)a3 withStatus:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;

  v5 = a3;
  v8 = a4;
  v6 = v8;
  v7 = v5;
  AnalyticsSendEventLazy();

}

id __76__DAEASOAuthMigrationActivity__sendAnalyticsForMigratingAccount_withStatus___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  const __CFString *v4;

  v2 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("accountIdentifier"));

  objc_msgSend(v2, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), CFSTR("migrationStatus"));
  if (objc_msgSend(*(id *)(a1 + 48), "_isExchangeBasicAccount:", *(_QWORD *)(a1 + 32)))
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, CFSTR("accountIsExchangeBasic"));
  return v2;
}

- (id)_migrationDecisionString:(unint64_t)a3
{
  if (a3 - 1 > 6)
    return CFSTR("Not basic account");
  else
    return off_24E370760[a3 - 1];
}

- (unint64_t)_migrateExchangeAccountToOAuthDecision:(id)a3 disallowedDomains:(id)a4 disallowedHosts:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  NSObject *v33;
  os_log_type_t v34;
  const char *v35;
  unint64_t v36;
  NSObject *v37;
  os_log_type_t v38;
  const char *Name;
  NSObject *v40;
  os_log_type_t v41;
  const char *v42;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  double v49;
  double *v50;
  uint64_t v51;
  uint64_t v52;
  NSObject *v53;
  os_log_type_t v54;
  const char *v55;
  void *v56;
  NSObject *v57;
  os_log_type_t v58;
  const char *v59;
  DAEASOAuthMigrationActivity *v60;
  const char *sel;
  id v62;
  id v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  uint8_t v72[128];
  uint8_t buf[4];
  const char *v74;
  __int16 v75;
  void *v76;
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!-[DAEASOAuthMigrationActivity _isExchangeBasicAccount:](self, "_isExchangeBasicAccount:", v9))
  {
    v36 = 0;
    goto LABEL_32;
  }
  v60 = self;
  sel = a2;
  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  v63 = v10;
  v12 = v10;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v68, v77, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v69;
    v16 = *MEMORY[0x24BE2AB80];
    v62 = v11;
    while (2)
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v69 != v15)
          objc_enumerationMutation(v12);
        v18 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * i);
        objc_msgSend(v9, "username", v60);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v19, "hasSuffix:", v18))
        {

LABEL_26:
          DALoggingwithCategory();
          v37 = objc_claimAutoreleasedReturnValue();
          v38 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 7);
          if (os_log_type_enabled(v37, v38))
          {
            Name = sel_getName(sel);
            *(_DWORD *)buf = 136315394;
            v74 = Name;
            v75 = 2114;
            v76 = v18;
            _os_log_impl(&dword_21EC86000, v37, v38, "In %s: No because it ends with %{public}@ domain (consumer account).", buf, 0x16u);
          }

          v36 = 1;
          v11 = v62;
          v10 = v63;
          goto LABEL_32;
        }
        objc_msgSend(v9, "objectForKeyedSubscript:", v16);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "hasSuffix:", v18);

        if (v21)
          goto LABEL_26;
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v68, v77, 16);
      v11 = v62;
      if (v14)
        continue;
      break;
    }
  }

  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  v22 = v11;
  v23 = v11;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v64, v72, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v65;
    v27 = *MEMORY[0x24BE2AB88];
    while (2)
    {
      for (j = 0; j != v25; ++j)
      {
        if (*(_QWORD *)v65 != v26)
          objc_enumerationMutation(v23);
        v29 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * j);
        objc_msgSend(v9, "objectForKeyedSubscript:", v27, v60);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "isEqualToString:", v29);

        if (v31)
        {
          DALoggingwithCategory();
          v40 = objc_claimAutoreleasedReturnValue();
          v41 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 7);
          if (os_log_type_enabled(v40, v41))
          {
            v42 = sel_getName(sel);
            *(_DWORD *)buf = 136315394;
            v74 = v42;
            v75 = 2114;
            v76 = v29;
            _os_log_impl(&dword_21EC86000, v40, v41, "In %s: No because the host is %{public}@ (consumer account).", buf, 0x16u);
          }

          v36 = 2;
          v10 = v63;
          v11 = v22;
          goto LABEL_32;
        }
      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v64, v72, 16);
      if (v25)
        continue;
      break;
    }
  }

  objc_msgSend(v9, "managingOwnerIdentifier");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (v32
    || (objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BDB3EE8]),
        (v32 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    DALoggingwithCategory();
    v33 = objc_claimAutoreleasedReturnValue();
    v34 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 7);
    v10 = v63;
    v11 = v22;
    if (os_log_type_enabled(v33, v34))
    {
      v35 = sel_getName(sel);
      *(_DWORD *)buf = 136315138;
      v74 = v35;
      _os_log_impl(&dword_21EC86000, v33, v34, "In %s: No because it is being managed.", buf, 0xCu);
    }

    v36 = 3;
    goto LABEL_32;
  }
  v44 = *MEMORY[0x24BE2FD60];
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BE2FD60]);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v63;
  v11 = v22;
  if (!v45)
    goto LABEL_39;
  v46 = (void *)MEMORY[0x24BDBCE60];
  objc_msgSend(v9, "objectForKeyedSubscript:", v44);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "doubleValue");
  objc_msgSend(v46, "dateWithTimeIntervalSince1970:");
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v46) = objc_msgSend((id)objc_opt_class(), "profileMigrationEnabled");
  objc_msgSend(v48, "timeIntervalSinceNow");
  if ((_DWORD)v46)
    v50 = (double *)MEMORY[0x24BE2FD70];
  else
    v50 = (double *)MEMORY[0x24BE2FD68];
  if (v49 < -*v50)
  {

LABEL_39:
    v51 = objc_msgSend(v9, "migrationStatus", v60);
    v36 = 7;
    if (v51 != 3)
    {
      v52 = v51;
      if (v51 != 5)
      {
        DALoggingwithCategory();
        v53 = objc_claimAutoreleasedReturnValue();
        v54 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 7);
        if (os_log_type_enabled(v53, v54))
        {
          v55 = sel_getName(sel);
          objc_msgSend(v9, "migrationStatusString");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v74 = v55;
          v75 = 2112;
          v76 = v56;
          _os_log_impl(&dword_21EC86000, v53, v54, "In %s: No because migration status is %@.", buf, 0x16u);

        }
        if (v52 == 1)
          v36 = 5;
        else
          v36 = 6;
      }
    }
    goto LABEL_32;
  }
  DALoggingwithCategory();
  v57 = objc_claimAutoreleasedReturnValue();
  v58 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 7);
  if (os_log_type_enabled(v57, v58))
  {
    v59 = sel_getName(sel);
    *(_DWORD *)buf = 136315394;
    v74 = v59;
    v75 = 2112;
    v76 = v48;
    _os_log_impl(&dword_21EC86000, v57, v58, "In %s: No because last attempt was very recent: %@).", buf, 0x16u);
  }

  v36 = 4;
LABEL_32:

  return v36;
}

- (id)_triggerAccountMigration
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __55__DAEASOAuthMigrationActivity__triggerAccountMigration__block_invoke;
  v3[3] = &unk_24E370740;
  v3[4] = self;
  return (id)MEMORY[0x2207BAC80](v3, a2);
}

void __55__DAEASOAuthMigrationActivity__triggerAccountMigration__block_invoke(uint64_t a1, void *a2)
{
  void (**v3)(id, uint64_t);
  NSObject *v4;
  os_log_type_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;
  void *v16;
  os_log_type_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void (**v35)(id, uint64_t);
  os_log_type_t type;
  id obj;
  _QWORD v38[6];
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  uint64_t v44;
  const __CFString *v45;
  uint64_t v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  DALoggingwithCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 7);
  if (os_log_type_enabled(v4, v5))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21EC86000, v4, v5, "DAEASOAuthMigrationActivity: Starting.", buf, 2u);
  }

  if (!objc_msgSend((id)objc_opt_class(), "profileMigrationDisabled"))
  {
    type = v5;
    objc_msgSend(*(id *)(a1 + 32), "_serverMigrationStatus");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("migrationEnabled"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "BOOLValue");

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("disallowedDomains"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("disallowedHosts"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "scheduler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v12, "shouldDefer") & 1) != 0)
    {

    }
    else
    {
      v13 = objc_msgSend((id)objc_opt_class(), "profileMigrationEnabled") | v9;

      if (v13 == 1)
      {
        v14 = (void *)objc_opt_new();
        objc_msgSend(v14, "accountTypeWithAccountTypeIdentifier:", *MEMORY[0x24BDB4030]);
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = (void *)v15;
        v17 = type;
        if (v15)
        {
          v34 = v7;
          v35 = v3;
          v32 = (void *)v15;
          v33 = v14;
          objc_msgSend(v14, "accountsWithAccountType:", v15);
          v39 = 0u;
          v40 = 0u;
          v41 = 0u;
          v42 = 0u;
          obj = (id)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
          if (v18)
          {
            v19 = v18;
            v20 = *(_QWORD *)v40;
            do
            {
              for (i = 0; i != v19; ++i)
              {
                if (*(_QWORD *)v40 != v20)
                  objc_enumerationMutation(obj);
                v22 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i);
                v23 = objc_msgSend(*(id *)(a1 + 32), "_migrateExchangeAccountToOAuthDecision:disallowedDomains:disallowedHosts:", v22, v10, v11);
                if (v23 == 7)
                {
                  v45 = CFSTR("DAEASRenewCredentialsShouldTriggerMigrationKey");
                  v46 = MEMORY[0x24BDBD1C8];
                  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1);
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  DALoggingwithCategory();
                  v25 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v25, v17))
                  {
                    *(_DWORD *)buf = 138412290;
                    v44 = v22;
                    _os_log_impl(&dword_21EC86000, v25, v17, "DAEASOAuthMigrationActivity: Calling renewCredentialsForAccount for account: %@.", buf, 0xCu);
                  }

                  sharedDAAccountStore();
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  v38[0] = MEMORY[0x24BDAC760];
                  v38[1] = 3221225472;
                  v38[2] = __55__DAEASOAuthMigrationActivity__triggerAccountMigration__block_invoke_70;
                  v38[3] = &unk_24E370718;
                  v27 = *(_QWORD *)(a1 + 32);
                  v38[4] = v22;
                  v38[5] = v27;
                  objc_msgSend(v26, "renewCredentialsForAccount:options:completion:", v22, v24, v38);

                }
                else
                {
                  objc_msgSend(*(id *)(a1 + 32), "_migrationDecisionString:", v23);
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  v28 = *(void **)(a1 + 32);
                  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Skipped: %@"), v24);
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v28, "_sendAnalyticsForMigratingAccount:withStatus:", v22, v29);

                  v17 = type;
                }

              }
              v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
            }
            while (v19);
          }

          v7 = v34;
          v3 = v35;
          v16 = v32;
          v14 = v33;
        }
        DALoggingwithCategory();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, v17))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21EC86000, v30, v17, "DAEASOAuthMigrationActivity: Finished.", buf, 2u);
        }

        v3[2](v3, 1);
        goto LABEL_30;
      }
    }
    DALoggingwithCategory();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, type))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21EC86000, v31, type, "DAEASOAuthMigrationActivity: Deferred.", buf, 2u);
    }

    v3[2](v3, 2);
LABEL_30:

    goto LABEL_31;
  }
  DALoggingwithCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, v5))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21EC86000, v6, v5, "DAEASOAuthMigrationActivity: Profile says we should not proceed, exiting.", buf, 2u);
  }

  v3[2](v3, 1);
LABEL_31:

}

void __55__DAEASOAuthMigrationActivity__triggerAccountMigration__block_invoke_70(uint64_t a1)
{
  NSObject *v2;
  os_log_type_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "reload");
  DALoggingwithCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 7);
  if (os_log_type_enabled(v2, v3))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v9 = 138412290;
    v10 = v4;
    _os_log_impl(&dword_21EC86000, v2, v3, "DAEASOAuthMigrationActivity: Finished calling renewCredentialsForAccount for account: %@.", (uint8_t *)&v9, 0xCu);
  }

  v7 = a1 + 32;
  v5 = *(void **)(a1 + 32);
  v6 = *(void **)(v7 + 8);
  objc_msgSend(v5, "migrationStatusString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_sendAnalyticsForMigratingAccount:withStatus:", v5, v8);

}

- (NSBackgroundActivityScheduler)scheduler
{
  return self->_scheduler;
}

- (void)setScheduler:(id)a3
{
  objc_storeStrong((id *)&self->_scheduler, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduler, 0);
}

@end
