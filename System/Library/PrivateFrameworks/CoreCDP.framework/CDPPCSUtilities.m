@implementation CDPPCSUtilities

+ (id)setupDictionaryWithContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v3, "appleID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, *MEMORY[0x24BE7AEE0]);

  }
  objc_msgSend(v3, "dsid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v3, "dsid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, *MEMORY[0x24BE7AEB8]);

  }
  objc_msgSend(v3, "passwordEquivToken");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v3, "passwordEquivToken");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, *MEMORY[0x24BE7AEC8]);

  }
  objc_msgSend((id)objc_opt_class(), "_pcsConfigForPrimaryAccount");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addEntriesFromDictionary:", v12);

  v13 = (void *)objc_msgSend(v4, "copy");
  return v13;
}

+ (id)_pcsConfigForPrimaryAccount
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v2 = (void *)objc_msgSend(MEMORY[0x24BDBD1B8], "mutableCopy");
  +[CDPAccount sharedInstance](CDPAccount, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "iCloudEnv");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, *MEMORY[0x24BE7AEE8]);
  }
  else
  {
    _CDPLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      +[CDPPCSUtilities _pcsConfigForPrimaryAccount].cold.3(v5, v6, v7, v8, v9, v10, v11, v12);

  }
  +[CDPAccount sharedInstance](CDPAccount, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "authToken");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v14, *MEMORY[0x24BE7AEB0]);
  }
  else
  {
    _CDPLogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      +[CDPPCSUtilities _pcsConfigForPrimaryAccount].cold.2(v15, v16, v17, v18, v19, v20, v21, v22);

  }
  +[CDPAccount sharedInstance](CDPAccount, "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "escrowURL");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v24, *MEMORY[0x24BE7AEC0]);
  }
  else
  {
    _CDPLogSystem();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      +[CDPPCSUtilities _pcsConfigForPrimaryAccount].cold.1(v25, v26, v27, v28, v29, v30, v31, v32);

  }
  return v2;
}

+ (void)_pcsConfigForPrimaryAccount
{
  OUTLINED_FUNCTION_16(&dword_20D7E6000, a1, a3, "\"iCloud Env missing, bad things to come...\", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

@end
