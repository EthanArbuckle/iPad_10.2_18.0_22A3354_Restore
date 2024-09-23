@implementation CDPAccount

+ (BOOL)isICDPEnabledForDSID:(id)a3
{
  return objc_msgSend(a1, "isICDPEnabledForDSID:checkWithServer:", a3, 0);
}

+ (BOOL)isICDPEnabledForDSID:(id)a3 checkWithServer:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  NSObject *v6;
  CDPDaemonConnection *v7;
  uint64_t v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  _BYTE *v17;
  _QWORD v18[4];
  id v19;
  os_activity_scope_state_s state;
  _BYTE buf[24];
  _BOOL4 v22;
  uint64_t v23;

  v4 = a4;
  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = _os_activity_create(&dword_20D7E6000, "cdp: enabled status check", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  v7 = objc_alloc_init(CDPDaemonConnection);
  v8 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __51__CDPAccount_isICDPEnabledForDSID_checkWithServer___block_invoke;
  v18[3] = &unk_24C7C1030;
  v9 = v5;
  v19 = v9;
  -[CDPDaemonConnection synchronousDaemonWithErrorHandler:](v7, "synchronousDaemonWithErrorHandler:", v18);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  _CDPLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 141558530;
    *(_QWORD *)&buf[4] = 1752392040;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v9;
    *(_WORD *)&buf[22] = 1024;
    v22 = v4;
    _os_log_impl(&dword_20D7E6000, v11, OS_LOG_TYPE_DEFAULT, "\"Checking iCDP status for DSID %{mask.hash}@ (checkWithServer=%{BOOL}d)\", buf, 0x1Cu);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  LOBYTE(v22) = 0;
  v15[0] = v8;
  v15[1] = 3221225472;
  v15[2] = __51__CDPAccount_isICDPEnabledForDSID_checkWithServer___block_invoke_20;
  v15[3] = &unk_24C7C1058;
  v12 = v9;
  v16 = v12;
  v17 = buf;
  objc_msgSend(v10, "isICDPEnabledForDSID:checkWithServer:completion:", v12, v4, v15);
  -[CDPDaemonConnection connection](v7, "connection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "invalidate");

  LOBYTE(v13) = *(_BYTE *)(*(_QWORD *)&buf[8] + 24) != 0;
  _Block_object_dispose(buf, 8);

  os_activity_scope_leave(&state);
  return (char)v13;
}

void __51__CDPAccount_isICDPEnabledForDSID_checkWithServer___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _CDPLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __51__CDPAccount_isICDPEnabledForDSID_checkWithServer___block_invoke_cold_1(a1, (uint64_t)v3, v4);

}

void __51__CDPAccount_isICDPEnabledForDSID_checkWithServer___block_invoke_20(uint64_t a1, int a2)
{
  NSObject *v4;
  uint64_t v5;
  const __CFString *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  _CDPLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = CFSTR("DISABLED");
    v8 = 1752392040;
    v7 = 141558530;
    if (a2)
      v6 = CFSTR("ENABLED");
    v9 = 2112;
    v10 = v5;
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_20D7E6000, v4, OS_LOG_TYPE_DEFAULT, "\"iCDP status for DSID %{mask.hash}@ is %@\", (uint8_t *)&v7, 0x20u);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_0);
  return (id)sharedInstance_account;
}

void __28__CDPAccount_sharedInstance__block_invoke()
{
  CDPAccount *v0;
  void *v1;

  v0 = objc_alloc_init(CDPAccount);
  v1 = (void *)sharedInstance_account;
  sharedInstance_account = (uint64_t)v0;

}

- (BOOL)isOTEnabledForContext:(id)a3
{
  id v3;
  NSObject *v4;
  os_signpost_id_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  CDPDaemonConnection *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  _QWORD v16[7];
  __int128 buf;
  uint64_t v18;
  char v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  _CDPSignpostLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = _CDPSignpostCreate(v4);
  v7 = v6;

  _CDPSignpostLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_20D7E6000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v5, "OctagonStatus", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  _CDPSignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = v5;
    _os_log_impl(&dword_20D7E6000, v10, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: OctagonStatus  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  v11 = objc_alloc_init(CDPDaemonConnection);
  -[CDPDaemonConnection synchronousDaemonWithErrorHandler:](v11, "synchronousDaemonWithErrorHandler:", &__block_literal_global_28);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  _CDPLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_20D7E6000, v13, OS_LOG_TYPE_DEFAULT, "\"Checking OT status\", (uint8_t *)&buf, 2u);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v18 = 0x2020000000;
  v19 = 0;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __36__CDPAccount_isOTEnabledForContext___block_invoke_29;
  v16[3] = &unk_24C7C10C0;
  v16[5] = v5;
  v16[6] = v7;
  v16[4] = &buf;
  objc_msgSend(v12, "isOTEnabledForContext:completion:", v3, v16);
  -[CDPDaemonConnection connection](v11, "connection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "invalidate");

  LOBYTE(v14) = *(_BYTE *)(*((_QWORD *)&buf + 1) + 24) != 0;
  _Block_object_dispose(&buf, 8);

  return (char)v14;
}

void __36__CDPAccount_isOTEnabledForContext___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  _CDPLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __36__CDPAccount_isOTEnabledForContext___block_invoke_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

}

void __36__CDPAccount_isOTEnabledForContext___block_invoke_29(_QWORD *a1, char a2, void *a3)
{
  id v5;
  unint64_t Nanoseconds;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  double v11;
  uint64_t v12;
  int v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  double v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  Nanoseconds = _CDPSignpostGetNanoseconds(a1[5], a1[6]);
  _CDPSignpostLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = a1[5];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    v14 = 67240192;
    LODWORD(v15) = objc_msgSend(v5, "code");
    _os_signpost_emit_with_name_impl(&dword_20D7E6000, v8, OS_SIGNPOST_INTERVAL_END, v9, "OctagonStatus", " Error=%{public,signpost.telemetry:number1,name=Error}d ", (uint8_t *)&v14, 8u);
  }

  _CDPSignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (double)Nanoseconds / 1000000000.0;
    v12 = a1[5];
    v13 = objc_msgSend(v5, "code");
    v14 = 134218496;
    v15 = v12;
    v16 = 2048;
    v17 = v11;
    v18 = 1026;
    v19 = v13;
    _os_log_impl(&dword_20D7E6000, v10, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: OctagonStatus  Error=%{public,signpost.telemetry:number1,name=Error}d ", (uint8_t *)&v14, 0x1Cu);
  }

  *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = a2;
}

- (id)primaryAccountUsername
{
  void *v2;
  void *v3;

  -[CDPAccount primaryAppleAccount](self, "primaryAppleAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "username");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)primaryAccountDSID
{
  void *v2;
  void *v3;
  void *v4;

  -[CDPAccount primaryAppleAccount](self, "primaryAppleAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accountProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("personID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)primaryAccountAltDSID
{
  void *v2;
  void *v3;
  void *v4;

  -[CDPAccount primaryAppleAccount](self, "primaryAppleAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE0AC98], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "altDSIDForAccount:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)primaryAccountSecurityLevel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;

  objc_msgSend(MEMORY[0x24BE0AC98], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPAccount primaryAccountAltDSID](self, "primaryAccountAltDSID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "authKitAccountWithAltDSID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE0AC98], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "securityLevelForAccount:", v5);

  return v7;
}

- (BOOL)primaryAccountIsBeneficiary
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(MEMORY[0x24BE0AC98], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "primaryAuthKitAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE0AC98], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isBeneficiaryForAccount:", v3);

  return v5;
}

- (id)authToken
{
  void *v2;
  void *v3;

  -[CDPAccount primaryAppleAccount](self, "primaryAppleAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "aa_authToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)escrowURL
{
  void *v2;
  void *v3;
  void *v4;

  -[CDPAccount primaryAppleAccount](self, "primaryAppleAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "propertiesForDataclass:", *MEMORY[0x24BDB45D8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("escrowProxyUrl"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)iCloudEnv
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[CDPAccount primaryAppleAccount](self, "primaryAppleAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataclassProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("com.apple.Dataclass.Account"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("iCloudEnv"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)contextForPrimaryAccount
{
  return +[CDPContext contextForPrimaryAccount](CDPContext, "contextForPrimaryAccount");
}

- (id)primaryAccountFirstName
{
  void *v2;
  void *v3;

  -[CDPAccount primaryAppleAccount](self, "primaryAppleAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "aa_firstName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)primaryAccountFullName
{
  void *v2;
  void *v3;

  -[CDPAccount primaryAppleAccount](self, "primaryAppleAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "aa_fullName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)primaryAppleAccount
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDB4398], "defaultStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "aa_primaryAppleAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)primaryAuthKitAccount
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BE0AC98], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPAccount primaryAccountAltDSID](self, "primaryAccountAltDSID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "authKitAccountWithAltDSID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)primaryAccountStashedPRK
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v27;

  _CDPLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[CDPAccount primaryAccountStashedPRK].cold.3(v3, v4, v5, v6, v7, v8, v9, v10);

  -[CDPAccount primaryAuthKitAccount](self, "primaryAuthKitAccount");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(MEMORY[0x24BDB4398], "defaultStore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    objc_msgSend(v12, "credentialForAccount:error:", v11, &v27);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v27;

    objc_msgSend(v13, "credentialItemForKey:", *MEMORY[0x24BDB4288]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      v17 = v15;
      _CDPLogSystem();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        -[CDPAccount primaryAccountStashedPRK].cold.2(v18, v19, v20, v21, v22, v23, v24, v25);
    }
    else
    {
      _CDPLogSystem();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[CDPAccount primaryAccountStashedPRK].cold.1((uint64_t)v14, self, v18);
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (BOOL)primaryAccountNeedsEscrowRecordRepair
{
  void *v2;
  char v3;

  +[CDPAccountRepresentation representationForPrimaryAccount](CDPAccountRepresentation, "representationForPrimaryAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldPerformSilentEscrowRecordRepair");

  return v3;
}

+ (BOOL)saveVerifiedAccount:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  void *v7;

  if (!a3)
    return 0;
  v5 = (void *)MEMORY[0x24BDB4398];
  v6 = a3;
  objc_msgSend(v5, "defaultStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "saveVerifiedAccount:error:", v6, a4);

  return (char)a4;
}

+ (id)_authKitAccountWith:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  if (a3)
  {
    v3 = (void *)MEMORY[0x24BE0AC98];
    v4 = a3;
    objc_msgSend(v3, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "authKitAccountWithAltDSID:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

+ (BOOL)checkIfAltDSIDIsBeneficiary:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(a1, "_authKitAccountWith:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE0AC98], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isBeneficiaryForAccount:", v3);

  return v5;
}

+ (id)appleAccountForAltDSID:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDB4398];
  v4 = a3;
  objc_msgSend(v3, "defaultStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "aa_appleAccountWithAltDSID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)personIDForAltDSID:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "appleAccountForAltDSID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v4, "aa_personID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberWithLongLong:", objc_msgSend(v6, "longLongValue"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)altDSIDForPersonID:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDB4398];
  v4 = a3;
  objc_msgSend(v3, "defaultStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "aa_appleAccountWithPersonID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "aa_altDSID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)contextForAccountWithAltDSID:(id)a3
{
  return +[CDPContext contextForAccountWithAltDSID:](CDPContext, "contextForAccountWithAltDSID:", a3);
}

+ (BOOL)isHSA2Enabled:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a1, "_authKitAccountWith:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE0AC98], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "securityLevelForAccount:", v3);

  return v5 == 4;
}

- (void)octagonStatusForContext:(id)a3 withCompletion:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  CDPDaemonConnection *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  os_activity_scope_state_s state;

  v5 = a3;
  v6 = a4;
  v7 = _os_activity_create(&dword_20D7E6000, "cdp/statemachine-clique-status", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  v8 = objc_alloc_init(CDPDaemonConnection);
  v9 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __67__CDPAccount_CircleStatus__octagonStatusForContext_withCompletion___block_invoke;
  v15[3] = &unk_24C7C10E8;
  v10 = v6;
  v16 = v10;
  -[CDPDaemonConnection daemonWithErrorHandler:](v8, "daemonWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __67__CDPAccount_CircleStatus__octagonStatusForContext_withCompletion___block_invoke_2;
  v13[3] = &unk_24C7C1110;
  v12 = v10;
  v14 = v12;
  objc_msgSend(v11, "cliqueStatusForContext:completion:", v5, v13);

  os_activity_scope_leave(&state);
}

uint64_t __67__CDPAccount_CircleStatus__octagonStatusForContext_withCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, -1, a2);
  return result;
}

void __67__CDPAccount_CircleStatus__octagonStatusForContext_withCompletion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(void);
  uint64_t v14;

  v4 = a3;
  if (v4)
  {
    _CDPLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __67__CDPAccount_CircleStatus__octagonStatusForContext_withCompletion___block_invoke_2_cold_1((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);

    v12 = *(_QWORD *)(a1 + 32);
    if (v12)
    {
      v13 = *(void (**)(void))(v12 + 16);
LABEL_8:
      v13();
    }
  }
  else
  {
    v14 = *(_QWORD *)(a1 + 32);
    if (v14)
    {
      v13 = *(void (**)(void))(v14 + 16);
      goto LABEL_8;
    }
  }

}

- (void)sosStatusForContext:(id)a3 withCompletion:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  CDPDaemonConnection *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  os_activity_scope_state_s state;

  v5 = a3;
  v6 = a4;
  v7 = _os_activity_create(&dword_20D7E6000, "cdp/statemachine-circle-status", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  v8 = objc_alloc_init(CDPDaemonConnection);
  v9 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __63__CDPAccount_CircleStatus__sosStatusForContext_withCompletion___block_invoke;
  v15[3] = &unk_24C7C10E8;
  v10 = v6;
  v16 = v10;
  -[CDPDaemonConnection daemonWithErrorHandler:](v8, "daemonWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __63__CDPAccount_CircleStatus__sosStatusForContext_withCompletion___block_invoke_2;
  v13[3] = &unk_24C7C1138;
  v12 = v10;
  v14 = v12;
  objc_msgSend(v11, "circleStatusForContext:completion:", v5, v13);

  os_activity_scope_leave(&state);
}

uint64_t __63__CDPAccount_CircleStatus__sosStatusForContext_withCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, 0xFFFFFFFFLL, a2);
  return result;
}

void __63__CDPAccount_CircleStatus__sosStatusForContext_withCompletion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(void);
  uint64_t v14;

  v4 = a3;
  if (v4)
  {
    _CDPLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __63__CDPAccount_CircleStatus__sosStatusForContext_withCompletion___block_invoke_2_cold_1((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);

    v12 = *(_QWORD *)(a1 + 32);
    if (v12)
    {
      v13 = *(void (**)(void))(v12 + 16);
LABEL_8:
      v13();
    }
  }
  else
  {
    v14 = *(_QWORD *)(a1 + 32);
    if (v14)
    {
      v13 = *(void (**)(void))(v14 + 16);
      goto LABEL_8;
    }
  }

}

- (NSDate)rpdProbationFirstSeenDate
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;

  +[CDPAccount sharedInstance](CDPAccount, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "primaryAppleAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "accountPropertyForKey:", CFSTR("rpdProbationFirstSeenDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _CDPLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[CDPAccount(Probation) rpdProbationFirstSeenDate].cold.1((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);

  -[CDPAccount _serverFriendlyDateFormatter](self, "_serverFriendlyDateFormatter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "dateFromString:", v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v14;
}

- (void)setRpdProbationFirstSeenDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  BOOL v16;
  id v17;
  id v18;
  NSObject *v19;
  id v20;

  v4 = a3;
  -[CDPAccount _serverFriendlyDateFormatter](self, "_serverFriendlyDateFormatter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringFromDate:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  _CDPLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[CDPAccount(Probation) setRpdProbationFirstSeenDate:].cold.2((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);

  +[CDPAccount sharedInstance](CDPAccount, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "primaryAppleAccount");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setAccountProperty:forKey:", v6, CFSTR("rpdProbationFirstSeenDate"));
  v20 = 0;
  v16 = +[CDPAccount saveVerifiedAccount:error:](CDPAccount, "saveVerifiedAccount:error:", v15, &v20);
  v17 = v20;
  if (v16)
  {
    v18 = -[CDPAccount rpdProbationFirstSeenDate](self, "rpdProbationFirstSeenDate");
  }
  else
  {
    _CDPLogSystem();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[CDPAccount(Probation) setRpdProbationFirstSeenDate:].cold.1((uint64_t)v17, v19);

  }
}

- (id)_serverFriendlyDateFormatter
{
  void *v2;
  id v3;
  void *v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEA0]), "initWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  v3 = objc_alloc_init(MEMORY[0x24BDD1500]);
  objc_msgSend(v3, "setDateFormat:", CFSTR("yyyy'-'MM'-'dd'T'HH':'mm':'ss'Z'"));
  objc_msgSend(v3, "setLocale:", v2);
  objc_msgSend(MEMORY[0x24BDBCF38], "timeZoneForSecondsFromGMT:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTimeZone:", v4);

  return v3;
}

- (BOOL)rpdProbationIsInEffectForDuration:(double)a3 context:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  BOOL v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  void *v30;
  void *v32;
  void *v33;
  int v34;
  double v35;
  __int16 v36;
  double v37;
  __int16 v38;
  _BOOL4 v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDFC2A0], "analyticsEventWithContext:eventName:category:", a4, CFSTR("com.apple.corecdp.rpdProbation"), 0x24C7D2420);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPAccount rpdProbationFirstSeenDate](self, "rpdProbationFirstSeenDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeIntervalSinceDate:", v7);
    v10 = v9;

    v11 = v10 >= a3;
    if (v10 < a3)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3 - v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, CFSTR("remainingProbationTime"));

    }
    else
    {
      objc_msgSend(v6, "setObject:forKeyedSubscript:", &unk_24C7D23D8, CFSTR("remainingProbationTime"));
    }
    _CDPLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[CDPAccount(Probation) rpdProbationIsInEffectForDuration:context:].cold.2(v13, v14, v15, v16, v17, v18, v19, v20);

    _CDPLogSystem();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      -[CDPAccount(Probation) rpdProbationIsInEffectForDuration:context:].cold.1(v21, v22, v23, v24, v25, v26, v27, v28);

    _CDPLogSystem();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      v34 = 134218496;
      v35 = v10;
      v36 = 2048;
      v37 = a3;
      v38 = 1024;
      v39 = v10 >= a3;
      _os_log_debug_impl(&dword_20D7E6000, v29, OS_LOG_TYPE_DEBUG, "\"RPD Probation: Can show RPD option: %f >= %f = %{BOOL}d\", (uint8_t *)&v34, 0x1Cu);
    }

  }
  else if (a3 == 0.0)
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", &unk_24C7D23D8, CFSTR("remainingProbationTime"));
    v11 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPAccount setRpdProbationFirstSeenDate:](self, "setRpdProbationFirstSeenDate:", v32);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v33, CFSTR("remainingProbationTime"));

    v11 = 0;
  }
  +[CDPAnalyticsReporterRTC rtcAnalyticsReporter](CDPAnalyticsReporterRTC, "rtcAnalyticsReporter");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "sendEvent:", v6);

  return v11;
}

void __51__CDPAccount_isICDPEnabledForDSID_checkWithServer___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
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
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 141558530;
  v5 = 1752392040;
  v6 = 2112;
  v7 = v3;
  v8 = 2112;
  v9 = a2;
  OUTLINED_FUNCTION_2_2(&dword_20D7E6000, a3, (uint64_t)a3, "\"XPC Error while checking if iCDP is enabled for DSID %{mask.hash}@: %@\", (uint8_t *)&v4);
}

void __36__CDPAccount_isOTEnabledForContext___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_20D7E6000, a2, a3, "\"XPC Error while checking if OT is enabled: %@\", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

- (void)primaryAccountStashedPRK
{
  OUTLINED_FUNCTION_0(&dword_20D7E6000, a1, a3, "\"Fetching PRK for primary Account\", a5, a6, a7, a8, 0);
}

void __67__CDPAccount_CircleStatus__octagonStatusForContext_withCompletion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_20D7E6000, a2, a3, "\"Error while checking clique status: %@\", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void __63__CDPAccount_CircleStatus__sosStatusForContext_withCompletion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_20D7E6000, a2, a3, "\"Error while checking circle status: %@\", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

@end
