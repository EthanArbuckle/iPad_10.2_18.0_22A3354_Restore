@implementation CDPDAccount

- (CDPDAccount)initWithContext:(id)a3
{
  id v5;
  CDPDAccount *v6;
  CDPDAccount *v7;
  CDPDAccount *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CDPDAccount;
  v6 = -[CDPDAccount init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_context, a3);
    v8 = v7;
  }

  return v7;
}

- (BOOL)hasDisabledKeychainExplicitly
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  objc_msgSend(MEMORY[0x24BDB4398], "defaultStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPDAccount context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "altDSID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "aa_appleAccountWithAltDSID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    _CDPLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[CDPDAccount hasDisabledKeychainExplicitly].cold.2(self);

  }
  objc_msgSend(v6, "accountPropertyForKey:", CFSTR("userDisabledICK"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  _CDPLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[CDPDAccount hasDisabledKeychainExplicitly].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);

  return v9;
}

- (void)setHasDisabledKeychainExplicitly:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  char v19;
  id v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;

  v3 = a3;
  _CDPLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[CDPDAccount setHasDisabledKeychainExplicitly:].cold.3(v3, v5, v6, v7, v8, v9, v10, v11);

  objc_msgSend(MEMORY[0x24BDB4398], "defaultStore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPDAccount context](self, "context");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "altDSID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "aa_appleAccountWithAltDSID:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    _CDPLogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[CDPDAccount setHasDisabledKeychainExplicitly:].cold.2(self);

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAccountProperty:forKey:", v17, CFSTR("userDisabledICK"));

  objc_msgSend(MEMORY[0x24BDB4398], "defaultStore");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  v19 = objc_msgSend(v18, "saveVerifiedAccount:error:", v15, &v28);
  v20 = v28;

  if ((v19 & 1) == 0)
  {
    _CDPLogSystem();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[CDPDAccount setHasDisabledKeychainExplicitly:].cold.1((uint64_t)v20, v21, v22, v23, v24, v25, v26, v27);

  }
}

- (BOOL)isICDPEnabledForDSID:(id)a3 checkWithServer:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  const void *v9;
  char IsICDPNetwork;
  BOOL v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  CFTypeRef cf;
  CFTypeRef v21;
  uint64_t v22;
  _QWORD v23[2];

  v4 = a4;
  v23[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v22 = *MEMORY[0x24BE7AEB8];
    v23[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    v8 = PCSIdentitySetCreate();
    if (v8)
    {
      v9 = (const void *)v8;
      cf = 0;
      if (v4)
        IsICDPNetwork = PCSIdentitySetIsICDPNetwork();
      else
        IsICDPNetwork = PCSIdentitySetIsICDP();
      v11 = IsICDPNetwork;
      CFRelease(v9);
    }
    else
    {
      _CDPLogSystem();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[CDPDAccount isICDPEnabledForDSID:checkWithServer:].cold.1((uint64_t)&v21, v12, v13, v14, v15, v16, v17, v18);

      v11 = 0;
    }
    if (v21)
      CFRelease(v21);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)isOTEnabledForContext:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v16;

  v3 = (objc_class *)MEMORY[0x24BE1A3E8];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithContext:", v4);

  v16 = 0;
  v6 = objc_msgSend(v5, "cachedCliqueStatus:", &v16);
  v7 = v16;
  if (v7)
  {
    _CDPLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[CDPDAccount isOTEnabledForContext:].cold.1((uint64_t)v7, v8, v9, v10, v11, v12, v13, v14);

  }
  return v6 == 1;
}

- (unint64_t)recoveryContactCountForAltDSID:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  unsigned int v11;
  id v13;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BE0AC98], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "authKitAccountWithAltDSID:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v13 = v3;
    objc_msgSend(v4, "custodianInfosForAccount:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count"))
    {
      v7 = 0;
      v8 = 0;
      do
      {
        objc_msgSend(v6, "objectAtIndexedSubscript:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("status"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("APPROVED"));

        v8 += v11;
        ++v7;
      }
      while (objc_msgSend(v6, "count") > v7);
    }
    else
    {
      v8 = 0;
    }

    v3 = v13;
  }
  else
  {
    v8 = -1;
  }

  return v8;
}

- (CDPContext)context
{
  return self->_context;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
}

- (void)hasDisabledKeychainExplicitly
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a1, "context");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "altDSID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2(&dword_20DB2C000, v3, v4, "\"hasDisabledKeychainExplicitly: Failed to find ACAccount for altDSID: %{mask.hash}@\", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_3_0();
}

- (void)setHasDisabledKeychainExplicitly:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20DB2C000, a2, a3, "\"setHasDisabledKeychainExplicitly: Failed to set user preference for iCloud keychain disable: %@\", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)setHasDisabledKeychainExplicitly:(void *)a1 .cold.2(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a1, "context");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "altDSID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2(&dword_20DB2C000, v3, v4, "\"setHasDisabledKeychainExplicitly: Failed to find ACAccount for altDSID: %{mask.hash}@\", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_3_0();
}

- (void)setHasDisabledKeychainExplicitly:(uint64_t)a3 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_1(&dword_20DB2C000, a2, a3, "\"User disabled iCloud keychain: %{BOOL}d\", a5, a6, a7, a8, 0);
}

- (void)isICDPEnabledForDSID:(uint64_t)a3 checkWithServer:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20DB2C000, a2, a3, "\"Failed to call PCSIdentitySetIsICDP: %@\", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)isICDPEnabledForDSID:(uint64_t)a3 checkWithServer:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20DB2C000, a2, a3, "\"Error calling PCSIdentitySetIsICDP: %@\", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)isOTEnabledForContext:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20DB2C000, a2, a3, "\"CDPDAccount failed to fetch clique status with error: %@\", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

@end
