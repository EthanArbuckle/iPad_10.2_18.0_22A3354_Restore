@implementation CDPAccountRepresentation

- (CDPAccountRepresentation)initWithAltDSID:(id)a3 accountStore:(id)a4 accountManager:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  CDPAccountRepresentation *v15;
  id *p_isa;
  CDPAccountRepresentation *v17;
  NSObject *v18;
  objc_super v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(v10, "aa_appleAccountWithAltDSID:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "authKitAccountWithAltDSID:", v9);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v12 && v13)
  {
    v20.receiver = self;
    v20.super_class = (Class)CDPAccountRepresentation;
    v15 = -[CDPAccountRepresentation init](&v20, sel_init);
    p_isa = (id *)&v15->super.isa;
    if (v15)
    {
      objc_storeStrong((id *)&v15->_altDSID, a3);
      objc_storeStrong(p_isa + 1, v12);
      objc_storeStrong(p_isa + 2, v14);
      objc_storeStrong(p_isa + 4, a4);
      objc_storeStrong(p_isa + 5, a5);
    }
    self = p_isa;
    v17 = self;
  }
  else
  {
    _CDPLogSystem();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[CDPAccountRepresentation initWithAltDSID:accountStore:accountManager:].cold.1();

    v17 = 0;
  }

  return v17;
}

- (CDPAccountRepresentation)initWithAltDSID:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  CDPAccountRepresentation *v8;

  v4 = (void *)MEMORY[0x24BDB4398];
  v5 = a3;
  objc_msgSend(v4, "defaultStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE0AC98], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CDPAccountRepresentation initWithAltDSID:accountStore:accountManager:](self, "initWithAltDSID:accountStore:accountManager:", v5, v6, v7);

  return v8;
}

- (CDPAccountRepresentation)initWithAccount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CDPAccountRepresentation *v9;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BE0AC98], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "altDSIDForAccount:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v4, "accountStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE0AC98], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[CDPAccountRepresentation initWithAltDSID:accountStore:accountManager:](self, "initWithAltDSID:accountStore:accountManager:", v6, v7, v8);

    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)representationForAltDSID:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithAltDSID:", v4);

  return v5;
}

+ (id)representationForAccount:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithAccount:", v4);

  return v5;
}

+ (id)representationForPrimaryAccount
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDB4398], "defaultStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "aa_primaryAppleAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(a1, "representationForAccount:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NSString)username
{
  void *v2;
  void *v3;

  -[CDPAccountRepresentation appleAccount](self, "appleAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "username");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)DSID
{
  void *v2;
  void *v3;

  -[CDPAccountRepresentation appleAccount](self, "appleAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "aa_personID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)authenticationToken
{
  void *v2;
  void *v3;

  -[CDPAccountRepresentation appleAccount](self, "appleAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "aa_authToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)escrowURLString
{
  void *v2;
  void *v3;
  void *v4;

  -[CDPAccountRepresentation appleAccount](self, "appleAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "propertiesForDataclass:", *MEMORY[0x24BDB45D8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("escrowProxyUrl"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)iCloudEnvironment
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[CDPAccountRepresentation appleAccount](self, "appleAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataclassProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("com.apple.Dataclass.Account"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("iCloudEnv"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (NSString)firstName
{
  void *v2;
  void *v3;

  -[CDPAccountRepresentation appleAccount](self, "appleAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "aa_firstName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)fullName
{
  void *v2;
  void *v3;

  -[CDPAccountRepresentation appleAccount](self, "appleAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "aa_fullName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)stashedPRK
{
  void *v3;
  void *v4;
  void *v5;

  -[CDPAccountRepresentation accountManager](self, "accountManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPAccountRepresentation authKitAccount](self, "authKitAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "passwordResetTokenBackupForAccount:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (unint64_t)securityLevel
{
  void *v3;
  void *v4;
  unint64_t v5;

  -[CDPAccountRepresentation accountManager](self, "accountManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPAccountRepresentation authKitAccount](self, "authKitAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "securityLevelForAccount:", v4);

  return v5;
}

- (BOOL)isBeneficiary
{
  void *v3;
  void *v4;
  char v5;

  -[CDPAccountRepresentation accountManager](self, "accountManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPAccountRepresentation authKitAccount](self, "authKitAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isBeneficiaryForAccount:", v4);

  return v5;
}

- (BOOL)isICDPEnabled
{
  return -[CDPAccountRepresentation isICDPEnabledByCheckingWithServer:](self, "isICDPEnabledByCheckingWithServer:", 0);
}

- (BOOL)isSilentEscrowRecordRepairEnabled
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  _BOOL4 v7;
  char v8;
  int v10;
  CDPAccountRepresentation *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  -[CDPAccountRepresentation accountManager](self, "accountManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPAccountRepresentation authKitAccount](self, "authKitAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "isSilentEscrowRecordRepairEnabledForAccount:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  _CDPLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      v10 = 138412546;
      v11 = self;
      v12 = 2112;
      v13 = v5;
      _os_log_impl(&dword_20D7E6000, v6, OS_LOG_TYPE_DEFAULT, "\"%@: Returning %@ for 'isSilentEscrowRecordRepairEnabled'\", (uint8_t *)&v10, 0x16u);
    }

    v8 = objc_msgSend(v5, "BOOLValue");
  }
  else
  {
    if (v7)
    {
      v10 = 138412290;
      v11 = self;
      _os_log_impl(&dword_20D7E6000, v6, OS_LOG_TYPE_DEFAULT, "\"%@: Assuming silent escrow record repair is disabled\", (uint8_t *)&v10, 0xCu);
    }

    v8 = 0;
  }

  return v8;
}

- (BOOL)isSilentEscrowRecordRepairEnabledV2
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  _BOOL4 v7;
  char v8;
  int v10;
  CDPAccountRepresentation *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  -[CDPAccountRepresentation accountManager](self, "accountManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPAccountRepresentation authKitAccount](self, "authKitAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "isSilentEscrowRecordRepairEnabledForAccountV2:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  _CDPLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      v10 = 138412546;
      v11 = self;
      v12 = 2112;
      v13 = v5;
      _os_log_impl(&dword_20D7E6000, v6, OS_LOG_TYPE_DEFAULT, "\"%@: Returning %@ for 'isSilentEscrowRecordRepairEnabledV2'\", (uint8_t *)&v10, 0x16u);
    }

    v8 = objc_msgSend(v5, "BOOLValue");
  }
  else
  {
    if (v7)
    {
      v10 = 138412290;
      v11 = self;
      _os_log_impl(&dword_20D7E6000, v6, OS_LOG_TYPE_DEFAULT, "\"%@: Assuming silent escrow record repair V2 is disabled\", (uint8_t *)&v10, 0xCu);
    }

    v8 = 0;
  }

  return v8;
}

- (BOOL)isSilentBurnCDPRepairEnabled
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  _BOOL4 v9;
  char v10;
  int v12;
  CDPAccountRepresentation *v13;
  __int16 v14;
  NSObject *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[CDPAccountRepresentation accountManager](self, "accountManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0)
  {
    _CDPLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[CDPAccountRepresentation isSilentBurnCDPRepairEnabled].cold.1(self, v7);
    goto LABEL_11;
  }
  -[CDPAccountRepresentation accountManager](self, "accountManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPAccountRepresentation authKitAccount](self, "authKitAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "isSilentBurnCDPRepairEnabledForAccount:", v6);
  v7 = objc_claimAutoreleasedReturnValue();

  _CDPLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (!v7)
  {
    if (v9)
    {
      v12 = 138412290;
      v13 = self;
      _os_log_impl(&dword_20D7E6000, v8, OS_LOG_TYPE_DEFAULT, "\"%@: Assuming silent burn in mini-buddy is disabled\", (uint8_t *)&v12, 0xCu);
    }

LABEL_11:
    v10 = 0;
    goto LABEL_12;
  }
  if (v9)
  {
    v12 = 138412546;
    v13 = self;
    v14 = 2112;
    v15 = v7;
    _os_log_impl(&dword_20D7E6000, v8, OS_LOG_TYPE_DEFAULT, "\"%@: Returning %@ for 'isSilentBurnCDPRepairEnabled'\", (uint8_t *)&v12, 0x16u);
  }

  v10 = -[NSObject BOOLValue](v7, "BOOLValue");
LABEL_12:

  return v10;
}

- (BOOL)shouldPerformSilentEscrowRecordRepair
{
  NSObject *v3;
  CDPStateController *v4;
  _BOOL4 v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v10;
  uint8_t buf[4];
  CDPAccountRepresentation *v12;
  __int16 v13;
  _BOOL4 v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (-[CDPAccountRepresentation isSilentEscrowRecordRepairEnabledV2](self, "isSilentEscrowRecordRepairEnabledV2"))
  {
    -[CDPAccountRepresentation generatedContext](self, "generatedContext");
    v3 = objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = -[CDPController initWithContext:]([CDPStateController alloc], "initWithContext:", v3);
      v10 = 0;
      v5 = -[CDPStateController shouldPerformSilentEscrowRecordRepairUsingCache:error:](v4, "shouldPerformSilentEscrowRecordRepairUsingCache:error:", 1, &v10);
      v6 = v10;
      _CDPLogSystem();
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v6)
      {
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          -[CDPAccountRepresentation shouldPerformSilentEscrowRecordRepair].cold.2();
        LOBYTE(v5) = 0;
      }
      else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v12 = self;
        v13 = 1024;
        v14 = v5;
        _os_log_impl(&dword_20D7E6000, v8, OS_LOG_TYPE_DEFAULT, "\"%@: Checked if escrow record repair is needed (%{BOOL}d)\", buf, 0x12u);
      }

    }
    else
    {
      _CDPLogSystem();
      v4 = (CDPStateController *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v4->super.super, OS_LOG_TYPE_ERROR))
        -[CDPAccountRepresentation shouldPerformSilentEscrowRecordRepair].cold.1((uint64_t)self, &v4->super.super);
      LOBYTE(v5) = 0;
    }

  }
  else
  {
    _CDPLogSystem();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v12 = self;
      _os_log_impl(&dword_20D7E6000, v3, OS_LOG_TYPE_DEFAULT, "\"%@: Silent escrow record repair is disabled by server, returning NO\", buf, 0xCu);
    }
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (CDPContext)generatedContext
{
  void *v3;
  CDPContext *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v10;
  CDPAccountRepresentation *v11;
  __int16 v12;
  CDPContext *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[CDPAccountRepresentation DSID](self, "DSID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = objc_alloc_init(CDPContext);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(v3, "longLongValue"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPContext setDsid:](v4, "setDsid:", v5);

    -[CDPAccountRepresentation altDSID](self, "altDSID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPContext setAltDSID:](v4, "setAltDSID:", v6);

    -[CDPAccountRepresentation username](self, "username");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPContext setAppleID:](v4, "setAppleID:", v7);

    -[CDPContext setIsBeneficiaryAccount:](v4, "setIsBeneficiaryAccount:", -[CDPAccountRepresentation isBeneficiary](self, "isBeneficiary"));
    _CDPLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138413058;
      v11 = self;
      v12 = 2112;
      v13 = v4;
      v14 = 2160;
      v15 = 1752392040;
      v16 = 2112;
      v17 = v3;
      _os_log_impl(&dword_20D7E6000, v8, OS_LOG_TYPE_DEFAULT, "\"%@: Generated context (%@) for account with DSID (%{mask.hash}@)\", (uint8_t *)&v10, 0x2Au);
    }
  }
  else
  {
    _CDPLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[CDPAccountRepresentation generatedContext].cold.1(self, v8);
    v4 = 0;
  }

  return v4;
}

- (BOOL)isICDPEnabledByCheckingWithServer:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  CDPDaemonConnection *v7;
  uint64_t v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  BOOL v13;
  _QWORD v15[5];
  id v16;
  _BYTE *v17;
  _QWORD v18[5];
  id v19;
  os_activity_scope_state_s state;
  _BYTE buf[24];
  id v22;
  __int16 v23;
  _BOOL4 v24;
  uint64_t v25;

  v3 = a3;
  v25 = *MEMORY[0x24BDAC8D0];
  v5 = _os_activity_create(&dword_20D7E6000, "cdp/enabled-status-check", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  -[CDPAccountRepresentation DSID](self, "DSID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = objc_alloc_init(CDPDaemonConnection);
    v8 = MEMORY[0x24BDAC760];
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __62__CDPAccountRepresentation_isICDPEnabledByCheckingWithServer___block_invoke;
    v18[3] = &unk_24C7C0DB8;
    v18[4] = self;
    v9 = v6;
    v19 = v9;
    -[CDPDaemonConnection synchronousDaemonWithErrorHandler:](v7, "synchronousDaemonWithErrorHandler:", v18);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    _CDPLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2160;
      *(_QWORD *)&buf[14] = 1752392040;
      *(_WORD *)&buf[22] = 2112;
      v22 = v9;
      v23 = 1024;
      v24 = v3;
      _os_log_impl(&dword_20D7E6000, v11, OS_LOG_TYPE_DEFAULT, "\"%@: Checking iCDP status for account with DSID (%{mask.hash}@), will check with server (%{BOOL}d)\", buf, 0x26u);
    }

    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    LOBYTE(v22) = 0;
    v15[0] = v8;
    v15[1] = 3221225472;
    v15[2] = __62__CDPAccountRepresentation_isICDPEnabledByCheckingWithServer___block_invoke_41;
    v15[3] = &unk_24C7C0DE0;
    v15[4] = self;
    v16 = v9;
    v17 = buf;
    objc_msgSend(v10, "isICDPEnabledForDSID:checkWithServer:completion:", v16, v3, v15);
    -[CDPDaemonConnection connection](v7, "connection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "invalidate");

    v13 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24) != 0;
    _Block_object_dispose(buf, 8);

  }
  else
  {
    v13 = 0;
  }

  os_activity_scope_leave(&state);
  return v13;
}

void __62__CDPAccountRepresentation_isICDPEnabledByCheckingWithServer___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _CDPLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __62__CDPAccountRepresentation_isICDPEnabledByCheckingWithServer___block_invoke_cold_1(a1, (uint64_t)v3, v4);

}

void __62__CDPAccountRepresentation_isICDPEnabledByCheckingWithServer___block_invoke_41(_QWORD *a1, int a2)
{
  NSObject *v4;
  const __CFString *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  _CDPLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = CFSTR("DISABLED");
    v6 = a1[4];
    v7 = a1[5];
    if (a2)
      v5 = CFSTR("ENABLED");
    v8 = 138413058;
    v9 = v6;
    v10 = 2160;
    v11 = 1752392040;
    v12 = 2112;
    v13 = v7;
    v14 = 2112;
    v15 = v5;
    _os_log_impl(&dword_20D7E6000, v4, OS_LOG_TYPE_DEFAULT, "\"%@: iCDP status for account with DSID (%{mask.hash}@) is %@\", (uint8_t *)&v8, 0x2Au);
  }

  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = a2;
}

- (void)silentEscrowRecordRepairEnabledWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  NSObject *v19;
  _QWORD v20[4];
  id v21;
  CDPAccountRepresentation *v22;
  void (**v23)(id, uint64_t, _QWORD);
  uint8_t buf[4];
  CDPAccountRepresentation *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  -[CDPAccountRepresentation accountManager](self, "accountManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[CDPAccountRepresentation accountManager](self, "accountManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPAccountRepresentation authKitAccount](self, "authKitAccount");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "isSilentEscrowRecordRepairEnabledForAccount:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    _CDPLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v11)
      {
        -[CDPAccountRepresentation authKitAccount](self, "authKitAccount");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v25 = self;
        v26 = 2112;
        v27 = (uint64_t)v9;
        v28 = 2112;
        v29 = v12;
        _os_log_impl(&dword_20D7E6000, v10, OS_LOG_TYPE_DEFAULT, "\"%@: Returning cached 'silentEscrowRecordRepairEnabled' value (%@) from account (%@)\", buf, 0x20u);

      }
      if (v4)
        v4[2](v4, objc_msgSend(v9, "BOOLValue"), 0);
      goto LABEL_21;
    }
    if (v11)
    {
      -[CDPAccountRepresentation altDSID](self, "altDSID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v25 = self;
      v26 = 2160;
      v27 = 1752392040;
      v28 = 2112;
      v29 = v14;
      _os_log_impl(&dword_20D7E6000, v10, OS_LOG_TYPE_DEFAULT, "\"%@: Calling to fetch user info for altDSID (%{mask.hash}@) for 'silentEscrowRecordRepairEnabled' value\", buf, 0x20u);

    }
    v15 = objc_alloc_init(MEMORY[0x24BE0ACB8]);
    -[CDPAccountRepresentation altDSID](self, "altDSID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setAltDSID:", v16);

    objc_msgSend(v15, "setAppProvidedContext:", CFSTR("silentEscrowRecordRepair"));
    v17 = objc_alloc_init(MEMORY[0x24BE0ACC0]);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __74__CDPAccountRepresentation_silentEscrowRecordRepairEnabledWithCompletion___block_invoke;
      v20[3] = &unk_24C7C0E08;
      v21 = v15;
      v22 = self;
      v23 = v4;
      objc_msgSend(v17, "getUserInformationWithContext:completion:", v21, v20);

      v18 = v21;
    }
    else
    {
      _CDPLogSystem();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
        -[CDPAccountRepresentation silentEscrowRecordRepairEnabledWithCompletion:].cold.1();

      if (!v4)
        goto LABEL_20;
      objc_msgSend(MEMORY[0x24BDD1540], "cdp_errorWithCode:", 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, uint64_t, void *))v4)[2](v4, 0, v18);
    }

LABEL_20:
    goto LABEL_21;
  }
  _CDPLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    -[CDPAccountRepresentation silentEscrowRecordRepairEnabledWithCompletion:].cold.2(self, v13);

  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "cdp_errorWithCode:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, uint64_t, void *))v4)[2](v4, 0, v9);
LABEL_21:

  }
}

void __74__CDPAccountRepresentation_silentEscrowRecordRepairEnabledWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  int v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _CDPLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __74__CDPAccountRepresentation_silentEscrowRecordRepairEnabledWithCompletion___block_invoke_cold_2(a1, (uint64_t)v6, v7);

    v8 = *(_QWORD *)(a1 + 48);
    if (v8)
      (*(void (**)(uint64_t, _QWORD, id))(v8 + 16))(v8, 0, v6);
    goto LABEL_16;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "silentEscrowRecordRepairEnabled");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    _CDPLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "altDSID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412802;
      v16 = v9;
      v17 = 2160;
      v18 = 1752392040;
      v19 = 2112;
      v20 = v11;
      _os_log_impl(&dword_20D7E6000, v10, OS_LOG_TYPE_DEFAULT, "\"Returning server fetched 'silentEscrowRecordRepairEnabled' value (%@) for altDSID (%{mask.hash}@)\", (uint8_t *)&v15, 0x20u);

    }
    v12 = *(_QWORD *)(a1 + 48);
    if (v12)
      (*(void (**)(uint64_t, uint64_t, _QWORD))(v12 + 16))(v12, objc_msgSend(v9, "BOOLValue"), 0);
    goto LABEL_15;
  }
  _CDPLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    __74__CDPAccountRepresentation_silentEscrowRecordRepairEnabledWithCompletion___block_invoke_cold_1(a1, (uint64_t)v5, v13);

  v14 = *(_QWORD *)(a1 + 48);
  if (v14)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "cdp_errorWithCode:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v14 + 16))(v14, 0, v9);
LABEL_15:

  }
LABEL_16:

}

- (id)_cachedPropertyValueOfClass:(Class)a3 forKey:(id)a4 valueProducer:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  -[CDPAccountRepresentation appleAccount](self, "appleAccount");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPAccountRepresentation _cachedPropertyValueOfClass:forKey:valueProducer:checkForStale:account:saveHandler:](self, "_cachedPropertyValueOfClass:forKey:valueProducer:checkForStale:account:saveHandler:", a3, v9, v8, 1, v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_cachedPropertyValueOfClass:(Class)a3 forKey:(id)a4 valueProducer:(id)a5 saveHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  -[CDPAccountRepresentation appleAccount](self, "appleAccount");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPAccountRepresentation _cachedPropertyValueOfClass:forKey:valueProducer:checkForStale:account:saveHandler:](self, "_cachedPropertyValueOfClass:forKey:valueProducer:checkForStale:account:saveHandler:", a3, v12, v11, 1, v13, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)_cachedPropertyValueOfClass:(Class)a3 forKey:(id)a4 valueProducer:(id)a5 checkForStale:(BOOL)a6 account:(id)a7
{
  return -[CDPAccountRepresentation _cachedPropertyValueOfClass:forKey:valueProducer:checkForStale:account:saveHandler:](self, "_cachedPropertyValueOfClass:forKey:valueProducer:checkForStale:account:saveHandler:", a3, a4, a5, a6, a7, 0);
}

- (id)_cachedPropertyValueOfClass:(Class)a3 forKey:(id)a4 valueProducer:(id)a5 checkForStale:(BOOL)a6 account:(id)a7 saveHandler:(id)a8
{
  _BOOL4 v10;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;

  v10 = a6;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  v17 = a8;
  if (v10)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", -86400.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
  }
  -[CDPAccountRepresentation _cachedPropertyValueOfClass:forKey:valueProducer:staleModifiedDate:account:saveHandler:](self, "_cachedPropertyValueOfClass:forKey:valueProducer:staleModifiedDate:account:saveHandler:", a3, v14, v15, v18, v16, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)_cachedPropertyValueOfClass:(Class)a3 forKey:(id)a4 valueProducer:(id)a5 staleModifiedDate:(id)a6 account:(id)a7 saveHandler:(id)a8
{
  id v14;
  void (**v15)(_QWORD);
  id v16;
  id v17;
  void *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  id v23;
  char v25;
  uint8_t buf[4];
  CDPAccountRepresentation *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v14 = a4;
  v15 = (void (**)(_QWORD))a5;
  v16 = a7;
  v17 = a8;
  v25 = 0;
  -[CDPAccountRepresentation _cachedPropertyValueOfClass:forKey:staleModifiedDate:account:isStale:](self, "_cachedPropertyValueOfClass:forKey:staleModifiedDate:account:isStale:", a3, v14, a6, v16, &v25);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v18 || v25)
  {
    _CDPLogSystem();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      -[CDPAccountRepresentation _cachedPropertyValueOfClass:forKey:valueProducer:staleModifiedDate:account:saveHandler:].cold.1();

    v15[2](v15);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    _CDPLogSystem();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      v27 = self;
      v28 = 2112;
      v29 = v14;
      v30 = 2112;
      v31 = v20;
      _os_log_debug_impl(&dword_20D7E6000, v21, OS_LOG_TYPE_DEBUG, "\"%@: Called value producer for key (%@) and received value (%@)\", buf, 0x20u);
    }

    if (v20)
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[CDPAccountRepresentation _cachePropertyValue:forKey:lastModifiedDate:account:saveHandler:](self, "_cachePropertyValue:forKey:lastModifiedDate:account:saveHandler:", v20, v14, v22, v16, v17);

      v23 = v20;
      v18 = v23;
    }

  }
  return v18;
}

- (id)_cachedPropertyValueOfClass:(Class)a3 forKey:(id)a4 staleModifiedDate:(id)a5 account:(id)a6 isStale:(BOOL *)a7
{
  __CFString *v12;
  id v13;
  __CFString *v14;
  id v15;
  __CFString *v16;
  __CFString *v17;
  NSObject *v18;
  id v19;
  NSObject *v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  BOOL *v28;
  id v29;
  uint8_t buf[4];
  CDPAccountRepresentation *v31;
  __int16 v32;
  const __CFString *v33;
  __int16 v34;
  __CFString *v35;
  __int16 v36;
  NSObject *v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v12 = (__CFString *)a4;
  v13 = a5;
  v14 = (__CFString *)a6;
  -[__CFString refresh](v14, "refresh");
  objc_opt_class();
  -[__CFString accountPropertyForKey:](v14, "accountPropertyForKey:", v12);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v16 = (__CFString *)v15;
  else
    v16 = 0;

  if (v16)
  {
    v29 = 0;
    -[CDPAccountRepresentation _deserializedPropertyDictionaryForData:withPropertyValueOfClass:error:](self, "_deserializedPropertyDictionaryForData:withPropertyValueOfClass:error:", v16, a3, &v29);
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v18 = v29;
    if (v17)
    {
      v28 = a7;
      objc_opt_class();
      -[__CFString objectForKeyedSubscript:](v17, "objectForKeyedSubscript:", CFSTR("com.apple.cdp.appleaccount.property.last-modified-date"));
      v19 = (id)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v20 = v19;
      else
        v20 = 0;

      if (v20)
      {
        -[__CFString objectForKeyedSubscript:](v17, "objectForKeyedSubscript:", CFSTR("com.apple.cdp.appleaccount.property"));
        v22 = (id)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v23 = v22;
        else
          v23 = 0;

        if (v23)
        {
          if (v13 && -[NSObject compare:](v20, "compare:", v13) == -1)
          {
            _CDPLogSystem();
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138413314;
              v31 = self;
              v32 = 2112;
              v33 = CFSTR("com.apple.cdp.appleaccount.property");
              v34 = 2112;
              v35 = v12;
              v36 = 2112;
              v37 = v20;
              v38 = 2112;
              v39 = v13;
              _os_log_debug_impl(&dword_20D7E6000, v26, OS_LOG_TYPE_DEBUG, "\"%@: Cached property value (%@) for key (%@) is stale (lastModifiedDate [%@] < staleModifiedDate [%@])\", buf, 0x34u);
            }

            if (v28)
              *v28 = 1;
          }
          else
          {
            _CDPLogSystem();
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
              -[CDPAccountRepresentation _cachedPropertyValueOfClass:forKey:staleModifiedDate:account:isStale:].cold.1((uint64_t)self, (uint64_t)v12, v24);

            if (v28)
              *v28 = 0;
          }
          v23 = v23;
          v21 = v23;
        }
        else
        {
          _CDPLogSystem();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412802;
            v31 = self;
            v32 = 2112;
            v33 = v17;
            v34 = 2112;
            v35 = v12;
            _os_log_debug_impl(&dword_20D7E6000, v25, OS_LOG_TYPE_DEBUG, "\"%@: Found nil property value in cached property dictionary (%@) for key (%@)\", buf, 0x20u);
          }

          v21 = 0;
        }
      }
      else
      {
        _CDPLogSystem();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412802;
          v31 = self;
          v32 = 2112;
          v33 = v17;
          v34 = 2112;
          v35 = v12;
          _os_log_fault_impl(&dword_20D7E6000, v23, OS_LOG_TYPE_FAULT, "\"%@: Expected lastModifiedDate value in cached property dictionary (%@) for key (%@)\", buf, 0x20u);
        }
        v21 = 0;
      }

    }
    else
    {
      _CDPLogSystem();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138413058;
        v31 = self;
        v32 = 2112;
        v33 = v12;
        v34 = 2112;
        v35 = v16;
        v36 = 2112;
        v37 = v18;
        _os_log_fault_impl(&dword_20D7E6000, v20, OS_LOG_TYPE_FAULT, "\"%@: Failed to deserialize property dictionary for key (%@) from data (%@) with error (%@)\", buf, 0x2Au);
      }
      v21 = 0;
    }

  }
  else
  {
    _CDPLogSystem();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      v31 = self;
      v32 = 2112;
      v33 = v12;
      v34 = 2112;
      v35 = v14;
      _os_log_debug_impl(&dword_20D7E6000, v18, OS_LOG_TYPE_DEBUG, "\"%@: No cached property for key (%@) was found on account (%@)\", buf, 0x20u);
    }
    v21 = 0;
  }

  return v21;
}

- (void)_cachePropertyValue:(id)a3 forKey:(id)a4 lastModifiedDate:(id)a5 account:(id)a6 saveHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  uint8_t buf[4];
  CDPAccountRepresentation *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v25 = 0;
  -[CDPAccountRepresentation _serializedPropertyDictionaryWithValue:lastModifiedDate:error:](self, "_serializedPropertyDictionaryWithValue:lastModifiedDate:error:", v12, a5, &v25);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v25;
  if (!v12 || v16)
  {
    objc_msgSend(v14, "setAccountProperty:forKey:", v16, v13);
    objc_msgSend(v14, "accountStore");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __92__CDPAccountRepresentation__cachePropertyValue_forKey_lastModifiedDate_account_saveHandler___block_invoke;
    v20[3] = &unk_24C7C0E30;
    v21 = v12;
    v22 = v13;
    v23 = v14;
    v24 = v15;
    objc_msgSend(v19, "saveAccount:withCompletionHandler:", v23, v20);

  }
  else
  {
    _CDPLogSystem();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412802;
      v27 = self;
      v28 = 2112;
      v29 = v13;
      v30 = 2112;
      v31 = v17;
      _os_log_fault_impl(&dword_20D7E6000, v18, OS_LOG_TYPE_FAULT, "\"%@: Failed to serialize property dictionary for key (%@) with error (%@)\", buf, 0x20u);
    }

    if (v15)
      (*((void (**)(id, _QWORD, id))v15 + 2))(v15, 0, v17);
  }

}

void __92__CDPAccountRepresentation__cachePropertyValue_forKey_lastModifiedDate_account_saveHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;

  v5 = a3;
  _CDPLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((_DWORD)a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __92__CDPAccountRepresentation__cachePropertyValue_forKey_lastModifiedDate_account_saveHandler___block_invoke_cold_1();
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __92__CDPAccountRepresentation__cachePropertyValue_forKey_lastModifiedDate_account_saveHandler___block_invoke_cold_2();
  }

  v8 = *(_QWORD *)(a1 + 56);
  if (v8)
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, a2, v5);

}

- (id)_serializedPropertyDictionaryWithValue:(id)a3 lastModifiedDate:(id)a4 error:(id *)a5
{
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  id v16;
  uint8_t buf[4];
  CDPAccountRepresentation *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v8 = (void *)MEMORY[0x24BDBCED8];
    v9 = a4;
    v10 = a3;
    objc_msgSend(v8, "dictionaryWithCapacity:", 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, CFSTR("com.apple.cdp.appleaccount.property"));

    objc_msgSend(v11, "setObject:forKeyedSubscript:", v9, CFSTR("com.apple.cdp.appleaccount.property.last-modified-date"));
    v16 = 0;
    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v11, 1, &v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v16;
    if (v13)
    {
      _CDPLogSystem();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        v18 = self;
        v19 = 2112;
        v20 = v11;
        v21 = 2112;
        v22 = v13;
        _os_log_error_impl(&dword_20D7E6000, v14, OS_LOG_TYPE_ERROR, "\"%@: Failed to archive property dictionary (%@) with error (%@)\", buf, 0x20u);
      }

      if (a5)
        *a5 = objc_retainAutorelease(v13);
    }

  }
  else
  {
    v12 = 0;
  }
  return v12;
}

- (id)_deserializedPropertyDictionaryForData:(id)a3 withPropertyValueOfClass:(Class)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v15;
  uint8_t buf[4];
  CDPAccountRepresentation *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", a4, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    objc_msgSend(MEMORY[0x24BDD1620], "unarchivedDictionaryWithKeysOfClasses:objectsOfClasses:fromData:error:", v9, v10, v8, &v15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v15;
    if (v12)
    {
      _CDPLogSystem();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        v17 = self;
        v18 = 2112;
        v19 = v8;
        v20 = 2112;
        v21 = v12;
        _os_log_error_impl(&dword_20D7E6000, v13, OS_LOG_TYPE_ERROR, "\"%@: Failed to unarchive data (%@) with error (%@)\", buf, 0x20u);
      }

      if (a5)
        *a5 = objc_retainAutorelease(v12);
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (ACAccount)appleAccount
{
  return self->_appleAccount;
}

- (ACAccount)authKitAccount
{
  return self->_authKitAccount;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

- (void)setAccountStore:(id)a3
{
  objc_storeStrong((id *)&self->_accountStore, a3);
}

- (AKAccountManager)accountManager
{
  return self->_accountManager;
}

- (void)setAccountManager:(id)a3
{
  objc_storeStrong((id *)&self->_accountManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_authKitAccount, 0);
  objc_storeStrong((id *)&self->_appleAccount, 0);
}

- (void)initWithAltDSID:accountStore:accountManager:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_6(&dword_20D7E6000, v0, (uint64_t)v0, "\"Unable to create CDPAccountRepresentation instance due to nil Apple account (%@) or AuthKit account (%@)\", v1);
  OUTLINED_FUNCTION_5();
}

- (void)isSilentBurnCDPRepairEnabled
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "accountManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_3(&dword_20D7E6000, a2, v4, "\"%@: Unable to check 'isSilentBurnCDPRepairEnabled' because AKAccountManager (%@) doesn't respond to selector\", v5);

  OUTLINED_FUNCTION_2();
}

- (void)shouldPerformSilentEscrowRecordRepair
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_6(&dword_20D7E6000, v0, (uint64_t)v0, "\"%@: Failed to check if escrow record repair is needed with error (%@)\", v1);
  OUTLINED_FUNCTION_5();
}

- (void)generatedContext
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "appleAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_6(&dword_20D7E6000, a2, v4, "\"%@: Unable to generate context for account (%@) with no DSID\", v5);

  OUTLINED_FUNCTION_2();
}

void __62__CDPAccountRepresentation_isICDPEnabledByCheckingWithServer___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];
  __int128 v4;

  *(_DWORD *)v3 = 138413058;
  *(_QWORD *)&v3[4] = *(_QWORD *)(a1 + 32);
  *(_WORD *)&v3[12] = 2160;
  *(_QWORD *)&v3[14] = 1752392040;
  *(_WORD *)&v3[22] = 2112;
  LOWORD(v4) = 2112;
  *(_QWORD *)((char *)&v4 + 2) = a2;
  OUTLINED_FUNCTION_7_1(&dword_20D7E6000, a2, a3, "\"%@: Failed to check if iCDP is enabled for account with DSID (%{mask.hash}@) with error (%@)\", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16], *(_QWORD *)(a1 + 40), (_QWORD)v4, WORD4(v4));
}

- (void)silentEscrowRecordRepairEnabledWithCompletion:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_3(&dword_20D7E6000, v0, (uint64_t)v0, "\"%@: Unable to fetch user info with context because AKAppleIDAuthenticationController (%@) doesn't respond to selector\", v1);
  OUTLINED_FUNCTION_5();
}

- (void)silentEscrowRecordRepairEnabledWithCompletion:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "accountManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_3(&dword_20D7E6000, a2, v4, "\"%@: Unable to check 'silentEscrowRecordRepairEnabled' because AKAccountManager (%@) doesn't respond to selector\", v5);

  OUTLINED_FUNCTION_2();
}

void __74__CDPAccountRepresentation_silentEscrowRecordRepairEnabledWithCompletion___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 40);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  OUTLINED_FUNCTION_3(&dword_20D7E6000, a3, (uint64_t)a3, "\"%@: Unable to check 'silentEscrowRecordRepairEnabled' because AKUserInformation (%@) doesn't respond to selector\", (uint8_t *)&v4);
  OUTLINED_FUNCTION_5();
}

void __74__CDPAccountRepresentation_silentEscrowRecordRepairEnabledWithCompletion___block_invoke_cold_2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "altDSID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 141558530;
  v7 = 1752392040;
  v8 = 2112;
  v9 = v5;
  v10 = 2112;
  v11 = a2;
  _os_log_error_impl(&dword_20D7E6000, a3, OS_LOG_TYPE_ERROR, "\"Failed to fetch user info for altDSID (%{mask.hash}@) with error (%@)\", (uint8_t *)&v6, 0x20u);

}

- (void)_cachedPropertyValueOfClass:forKey:valueProducer:staleModifiedDate:account:saveHandler:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_0_1();
  _os_log_debug_impl(&dword_20D7E6000, v0, OS_LOG_TYPE_DEBUG, "\"%@: Calling value producer for key (%@)\", v1, 0x16u);
  OUTLINED_FUNCTION_5();
}

- (void)_cachedPropertyValueOfClass:(NSObject *)a3 forKey:staleModifiedDate:account:isStale:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  const __CFString *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = 138412802;
  v4 = a1;
  v5 = 2112;
  v6 = CFSTR("com.apple.cdp.appleaccount.property");
  v7 = 2112;
  v8 = a2;
  OUTLINED_FUNCTION_8_0(&dword_20D7E6000, a3, (uint64_t)a3, "\"%@: Returned cached property value (%@) for key (%@)\", (uint8_t *)&v3);
}

void __92__CDPAccountRepresentation__cachePropertyValue_forKey_lastModifiedDate_account_saveHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[40];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8_0(&dword_20D7E6000, v0, v1, "\"Successfully saved cached property value (%@) for key (%@) on account (%@)\", v2);
}

void __92__CDPAccountRepresentation__cachePropertyValue_forKey_lastModifiedDate_account_saveHandler___block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7_1(&dword_20D7E6000, v0, v1, "\"Failed to save cached property value (%@) for key (%@) on account (%@) with error (%@)\");
}

@end
