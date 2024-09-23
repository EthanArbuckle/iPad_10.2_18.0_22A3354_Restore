@implementation NSMutableURLRequest(CDP)

- (void)cdp_addAuthHeaderWithContext:()CDP
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  NSObject *v13;

  v4 = a3;
  objc_msgSend(v4, "appleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "passwordEquivToken");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v4, "appleID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("%@:%@"), v8, v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v9 = 0;
    }
    if (objc_msgSend(v4, "idmsRecovery"))
      v10 = CFSTR("true");
    else
      v10 = CFSTR("false");
    objc_msgSend(a1, "setValue:forHTTPHeaderField:", v10, CFSTR("X-Apple-Account-Recovery"));
    if (v9)
    {
      objc_msgSend(v9, "aaf_toBase64EncodedString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Basic %@"), v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "setValue:forHTTPHeaderField:", v12, CFSTR("Authorization"));

    }
    else
    {
      _CDPLogSystem();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[NSMutableURLRequest(CDP) cdp_addAuthHeaderWithContext:].cold.1(v13);

    }
  }

}

- (void)cdp_addClientInfoHeader
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BE0AD68], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "serverFriendlyDescription");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v3 = v4;
  if (v4)
  {
    objc_msgSend(a1, "setValue:forHTTPHeaderField:", v4, CFSTR("X-MMe-Client-Info"));
    v3 = v4;
  }

}

- (void)cdp_addAuthHeaderWithContext:()CDP .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20DB2C000, log, OS_LOG_TYPE_ERROR, "\"Failed to add auth header\", v1, 2u);
}

@end
