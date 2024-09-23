@implementation CDPContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adpCohort, 0);
  objc_storeStrong((id *)&self->_followUpType, 0);
  objc_storeStrong((id *)&self->_telemetryFlowID, 0);
  objc_storeStrong((id *)&self->_telemetryDeviceSessionID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_beneficiaryWrappedKeyData, 0);
  objc_storeStrong((id *)&self->_custodianRecoveryInfo, 0);
  objc_storeStrong((id *)&self->_sharingChannel, 0);
  objc_storeStrong((id *)&self->_accountType, 0);
  objc_storeStrong((id *)&self->_resumeContext, 0);
  objc_storeStrong((id *)&self->_duplexSession, 0);
  objc_storeStrong((id *)&self->__authProvider, 0);
  objc_storeStrong((id *)&self->_beneficiaryIdentifier, 0);
  objc_storeStrong((id *)&self->_findMyiPhoneUUID, 0);
  objc_storeStrong((id *)&self->_cachedLocalSecret, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_dsid, 0);
  objc_storeStrong((id *)&self->_passwordEquivToken, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_appleID, 0);
  objc_storeStrong((id *)&self->_keychainSyncAllowedByServerInternal, 0);
  objc_storeStrong((id *)&self->_isPrimaryAccountInternal, 0);
}

- (void)updateDemoAttributesWithAccount:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  int v7;

  v4 = (void *)MEMORY[0x24BE0AC98];
  v5 = a3;
  objc_msgSend(v4, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "demoAccountForAccount:", v5);

  if (v7)
    -[CDPContext setAccountType:](self, "setAccountType:", CFSTR("Demo"));
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)telemetryFlowID
{
  return self->_telemetryFlowID;
}

- (NSString)telemetryDeviceSessionID
{
  NSString *telemetryDeviceSessionID;
  void *v4;
  void *v5;
  NSString *v6;
  NSString *v7;

  telemetryDeviceSessionID = self->_telemetryDeviceSessionID;
  if (!telemetryDeviceSessionID)
  {
    objc_msgSend(MEMORY[0x24BE0AC98], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "authKitAccountWithAltDSID:", self->_altDSID);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v4, "telemetryDeviceSessionIDForAccount:", v5);
      v6 = (NSString *)objc_claimAutoreleasedReturnValue();
      v7 = self->_telemetryDeviceSessionID;
      self->_telemetryDeviceSessionID = v6;

    }
    telemetryDeviceSessionID = self->_telemetryDeviceSessionID;
  }
  return telemetryDeviceSessionID;
}

- (void)stoptObservingTrustedDeviceList
{
  id v3;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

}

- (BOOL)needsPreflight
{
  return self->_needsPreflight;
}

- (BOOL)isiCDPEligibleWithError:(id *)a3
{
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  BOOL result;
  _BOOL4 v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  const char *v13;
  uint8_t *v14;
  const char *v15;
  uint8_t *v16;
  id v17;
  __int16 v18;
  uint8_t v19[2];
  uint8_t v20[16];
  uint8_t v21[2];
  uint8_t v22[16];
  __int16 v23;
  uint8_t buf[16];

  if (-[CDPContext isSharediPad](self, "isSharediPad"))
  {
    _CDPLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D7E6000, v5, OS_LOG_TYPE_DEFAULT, "\"isiCDPEligible: managed accounts on shared iPad is not manatee eligible, returning NO\", buf, 2u);
    }

    if (a3)
    {
      v6 = -5004;
LABEL_33:
      _CDPStateError(v6, 0);
      v17 = (id)objc_claimAutoreleasedReturnValue();
      result = 0;
      *a3 = v17;
      return result;
    }
    return 0;
  }
  if (-[CDPContext isHSA2Account](self, "isHSA2Account"))
  {
    if (-[CDPContext isPrimaryAccount](self, "isPrimaryAccount")
      || -[CDPContext multiUserManateeAllowed](self, "multiUserManateeAllowed"))
    {
      _CDPLogSystem();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v22 = 0;
        _os_log_impl(&dword_20D7E6000, v7, OS_LOG_TYPE_DEFAULT, "\"isiCDPEligible: Account is HSA2 and primary: returning YES\", v22, 2u);
      }

      return 1;
    }
    _CDPLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v23 = 0;
      v15 = "\"isiCDPEligible: Account is HSA2 and non-primary, and multi-user is not allowed: returning NO\";
      v16 = (uint8_t *)&v23;
LABEL_30:
      _os_log_impl(&dword_20D7E6000, v10, OS_LOG_TYPE_DEFAULT, v15, v16, 2u);
      goto LABEL_31;
    }
    goto LABEL_31;
  }
  if (!-[CDPContext isManagedAccount](self, "isManagedAccount"))
  {
    _CDPLogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      goto LABEL_26;
    v18 = 0;
    v13 = "\"isiCDPEligible: Account is not HSA or Managed, returning NO\";
    v14 = (uint8_t *)&v18;
    goto LABEL_25;
  }
  if (-[CDPContext managedAccountsAllowedInCDP](self, "managedAccountsAllowedInCDP"))
  {
    v9 = -[CDPContext isPrimaryAccount](self, "isPrimaryAccount");
    _CDPLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v11)
      {
        *(_WORD *)v20 = 0;
        _os_log_impl(&dword_20D7E6000, v10, OS_LOG_TYPE_DEFAULT, "\"isiCDPEligible: Account is managed and primary: returning YES\", v20, 2u);
      }

      return 1;
    }
    if (v11)
    {
      *(_WORD *)v19 = 0;
      v15 = "\"isiCDPEligible: Account is managed but non-primary: returning NO\";
      v16 = v19;
      goto LABEL_30;
    }
LABEL_31:

    if (a3)
    {
      v6 = -5111;
      goto LABEL_33;
    }
    return 0;
  }
  _CDPLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v21 = 0;
    v13 = "\"isiCDPEligible: Account is managed, but managed accounts are not allowed in CDP: returning NO\";
    v14 = v21;
LABEL_25:
    _os_log_impl(&dword_20D7E6000, v12, OS_LOG_TYPE_DEFAULT, v13, v14, 2u);
  }
LABEL_26:

  if (a3)
  {
    v6 = -5110;
    goto LABEL_33;
  }
  return 0;
}

- (BOOL)isSharediPad
{
  return self->_isSharediPad;
}

- (BOOL)isManagedAccount
{
  return self->_isManagedAccount;
}

- (BOOL)isHSA2Account
{
  return self->_isHSA2Account;
}

- (CDPContext)initWithAccount:(id)a3
{
  id v4;
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  int v16;
  NSObject *v17;
  void *v18;
  int v19;
  NSObject *v20;
  CDPContext *v21;
  NSObject *v22;

  v4 = a3;
  v5 = -[CDPContext initNeedingPreflight:](self, "initNeedingPreflight:", 0);
  v6 = v5;
  if (!v5)
  {
    _CDPLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[CDPContext initWithAccount:].cold.1();
    goto LABEL_28;
  }

  objc_msgSend(MEMORY[0x24BE0AC98], "sharedInstance");
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "username");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    _CDPLogSystem();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[CDPContext initWithAccount:].cold.2();
    goto LABEL_27;
  }
  v9 = v8;
  objc_storeStrong((id *)v6 + 9, v8);

  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE0AC38]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE0AC30]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      -[NSObject DSIDForAccount:](v7, "DSIDForAccount:", v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v10)
      {
        _CDPLogSystem();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          -[CDPContext initWithAccount:].cold.3();
        goto LABEL_27;
      }
    }
  }
  objc_storeStrong((id *)v6 + 12, v10);

  -[NSObject altDSIDForAccount:](v7, "altDSIDForAccount:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    _CDPLogSystem();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[CDPContext initWithAccount:].cold.4();
LABEL_27:

LABEL_28:
    v21 = 0;
    goto LABEL_29;
  }
  v12 = v11;
  objc_storeStrong((id *)v6 + 13, v11);

  v13 = -[NSObject securityLevelForAccount:](v7, "securityLevelForAccount:", v4);
  *((_QWORD *)v6 + 28) = v13;
  if (!v13)
  {
    _CDPLogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[CDPContext initWithAccount:].cold.7();

    v13 = *((_QWORD *)v6 + 28);
  }
  *((_BYTE *)v6 + 32) = v13 == 4;
  *((_BYTE *)v6 + 40) = v13 == 5;
  *((_BYTE *)v6 + 33) = -[NSObject authenticationModeForAccount:](v7, "authenticationModeForAccount:", v4) == 2;
  *((_BYTE *)v6 + 34) = -[NSObject isBeneficiaryForAccount:](v7, "isBeneficiaryForAccount:", v4);
  *((_QWORD *)v6 + 35) = 0;
  -[NSObject hasSOSActiveDeviceForAccount:](v7, "hasSOSActiveDeviceForAccount:", v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "BOOLValue");

  if (v16)
  {
    _CDPLogSystem();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      -[CDPContext initWithAccount:].cold.6();

    *((_QWORD *)v6 + 35) |= 1uLL;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[NSObject isSOSNeededForAccount:](v7, "isSOSNeededForAccount:", v4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "BOOLValue");

    if (v19)
    {
      _CDPLogSystem();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        -[CDPContext initWithAccount:].cold.5();

      *((_QWORD *)v6 + 35) |= 2uLL;
    }
  }
  objc_msgSend(v6, "_fakeSOSFlagsWithUserDefaults");
  objc_msgSend(v6, "updateDemoAttributesWithAccount:", v4);
  v21 = (CDPContext *)v6;
LABEL_29:

  return v21;
}

- (id)initNeedingPreflight:(BOOL)a3
{
  CDPContext *v4;
  void *v5;
  uint64_t v6;
  NSString *bundleID;
  void *UMUserManagerClass;
  void *v9;
  CDPContext *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CDPContext;
  v4 = -[CDPContext init](&v12, sel_init);
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleIdentifier");
    v6 = objc_claimAutoreleasedReturnValue();
    bundleID = v4->_bundleID;
    v4->_bundleID = (NSString *)v6;

    UMUserManagerClass = (void *)UserManagementLibraryCore();
    if (UMUserManagerClass)
      UMUserManagerClass = getUMUserManagerClass();
    objc_msgSend(UMUserManagerClass, "sharedManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v4->_isSharediPad = objc_msgSend(v9, "isSharedIPad");

    v4->_cachedPassphraseMissing = 0;
    v4->_needsPreflight = a3;
    v4->_managedAccountsAllowedInCDP = _os_feature_enabled_impl();
    v4->_multiUserManateeAllowed = +[CDPUtilities canEnableMultiUserManatee](CDPUtilities, "canEnableMultiUserManatee");
    v4->_keychainSyncSystem = 0;
    v4->_keychainSyncAllowedByMDM = objc_msgSend((id)objc_opt_class(), "_isKeychainSyncAllowedByMDM");
    v10 = v4;
  }

  return v4;
}

- (NSNumber)dsid
{
  return self->_dsid;
}

- (void)dealloc
{
  objc_super v3;

  -[CDPContext stoptObservingTrustedDeviceList](self, "stoptObservingTrustedDeviceList");
  v3.receiver = self;
  v3.super_class = (Class)CDPContext;
  -[CDPContext dealloc](&v3, sel_dealloc);
}

- (id)cliqueConfiguration
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc_init(MEMORY[0x24BDE84B8]);
  objc_msgSend(v3, "setContext:", *MEMORY[0x24BDE8508]);
  -[CDPContext dsid](self, "dsid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDsid:", v5);

  -[CDPContext altDSID](self, "altDSID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAltDSID:", v6);

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[CDPContext telemetryFlowID](self, "telemetryFlowID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setFlowID:", v7);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[CDPContext telemetryDeviceSessionID](self, "telemetryDeviceSessionID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setDeviceSessionID:", v8);

  }
  return v3;
}

- (NSString)appleID
{
  return self->_appleID;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)_fakeSOSFlagsWithUserDefaults
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_20D7E6000, v0, v1, "\"**** DEBUG **** FakeSOSNeeded mode is ENABLED\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (id)preflightContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  id v30;
  NSObject *v31;
  NSObject *v33;
  int v34;
  uint64_t v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = v3;
  if (!v3)
  {
    _CDPLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      +[CDPContext(Account) preflightContext:].cold.1();

    +[CDPContext contextForPrimaryAccount](CDPContext, "contextForPrimaryAccount");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  if ((objc_msgSend(v3, "needsPreflight") & 1) == 0)
  {
    _CDPLogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      +[CDPContext(Account) preflightContext:].cold.8();

    v14 = v4;
LABEL_16:
    v16 = v14;
    goto LABEL_42;
  }
  objc_msgSend(v4, "altDSID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    _CDPLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "altDSID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = 141558274;
      v35 = 1752392040;
      v36 = 2112;
      v37 = v7;
      _os_log_impl(&dword_20D7E6000, v6, OS_LOG_TYPE_DEFAULT, "\"preflightContext: Attempting to backfill context for altDSID %{mask.hash}@ . Please use +[CDPContext contextForAccountWithAltDSID:] to do this in the future.\", (uint8_t *)&v34, 0x16u);

    }
    objc_msgSend(MEMORY[0x24BE0AC98], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "altDSID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "authKitAccountWithAltDSID:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      goto LABEL_34;
    _CDPLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      +[CDPContext(Account) preflightContext:].cold.7(v4, v11);

    v12 = 1;
  }
  else
  {
    v12 = 0;
  }
  objc_msgSend(v4, "dsid");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    _CDPLogSystem();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "dsid");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = 141558274;
      v35 = 1752392040;
      v36 = 2112;
      v37 = v19;
      _os_log_impl(&dword_20D7E6000, v18, OS_LOG_TYPE_DEFAULT, "\"preflightContext: Attempting to find account for dsid %{mask.hash}@ . Please use +[CDPContext contextForAccountWithAltDSID:] to do this in the future.\", (uint8_t *)&v34, 0x16u);

    }
    objc_msgSend(MEMORY[0x24BE0AC98], "sharedInstance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dsid");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "authKitAccountWithDSID:", v21);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      goto LABEL_34;
    _CDPLogSystem();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      +[CDPContext(Account) preflightContext:].cold.6(v4, v22);

    v12 = 1;
  }
  objc_msgSend(v4, "appleID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    _CDPLogSystem();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "appleID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = 141558274;
      v35 = 1752392040;
      v36 = 2112;
      v37 = v25;
      _os_log_impl(&dword_20D7E6000, v24, OS_LOG_TYPE_DEFAULT, "\"preflightContext: Attempting to find account for appleID %{mask.hash}@ . Please use +[CDPContext contextForAccountWithAppleID:] to do this in the future.\", (uint8_t *)&v34, 0x16u);

    }
    objc_msgSend(MEMORY[0x24BE0AC98], "sharedInstance");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appleID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "authKitAccountWithAppleID:", v27);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      goto LABEL_34;
    _CDPLogSystem();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      +[CDPContext(Account) preflightContext:].cold.5(v4, v28);

  }
  else if (!v12)
  {
    _CDPLogSystem();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      +[CDPContext(Account) preflightContext:].cold.3();

    objc_msgSend(MEMORY[0x24BE0AC98], "sharedInstance");
    v29 = objc_claimAutoreleasedReturnValue();
    -[NSObject primaryAuthKitAccount](v29, "primaryAuthKitAccount");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_36;
  }
  v10 = 0;
LABEL_34:
  _CDPLogSystem();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    +[CDPContext(Account) preflightContext:].cold.4();
LABEL_36:

  if (v10)
  {
    v30 = (id)objc_msgSend(v4, "initWithAccount:", v10);
  }
  else
  {
    _CDPLogSystem();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      +[CDPContext(Account) preflightContext:].cold.2();

    v30 = v4;
  }
  v16 = v30;

LABEL_42:
  return v16;
}

+ (id)contextForPrimaryAccount
{
  void *v2;
  void *v3;
  CDPContext *v4;
  NSObject *v5;

  objc_msgSend(MEMORY[0x24BE0AC98], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "primaryAuthKitAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = -[CDPContext initWithAccount:]([CDPContext alloc], "initWithAccount:", v3);
  }
  else
  {
    _CDPLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      +[CDPContext contextForPrimaryAccount].cold.1();

    v4 = 0;
  }

  return v4;
}

+ (BOOL)_isKeychainSyncAllowedByMDM
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isBoolSettingLockedDownByRestrictions:", *MEMORY[0x24BE638C8]) ^ 1;

  return v3;
}

- (void)setAppleID:(id)a3
{
  objc_storeStrong((id *)&self->_appleID, a3);
}

- (void)setDsid:(id)a3
{
  objc_storeStrong((id *)&self->_dsid, a3);
}

- (void)setAltDSID:(id)a3
{
  objc_storeStrong((id *)&self->_altDSID, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)contextForAccountWithAppleID:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  CDPContext *v7;
  NSObject *v8;

  v3 = a3;
  _CDPLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    +[CDPContext contextForAccountWithAppleID:].cold.2();

  objc_msgSend(MEMORY[0x24BE0AC98], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "authKitAccountWithAppleID:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = -[CDPContext initWithAccount:]([CDPContext alloc], "initWithAccount:", v6);
  }
  else
  {
    _CDPLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[CDPContext contextForAccountWithAppleID:].cold.1();

    v7 = 0;
  }

  return v7;
}

+ (id)contextForAccountWithAltDSID:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  CDPContext *v7;
  NSObject *v8;

  v3 = a3;
  _CDPLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    +[CDPContext contextForAccountWithAltDSID:].cold.2();

  objc_msgSend(MEMORY[0x24BE0AC98], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "authKitAccountWithAltDSID:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = -[CDPContext initWithAccount:]([CDPContext alloc], "initWithAccount:", v6);
  }
  else
  {
    _CDPLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[CDPContext contextForAccountWithAltDSID:].cold.1();

    v7 = 0;
  }

  return v7;
}

+ (CDPContext)contextWithAuthenticationResults:(id)a3
{
  id v3;
  CDPContext *v4;

  v3 = a3;
  v4 = -[CDPContext initWithAuthenticationResults:]([CDPContext alloc], "initWithAuthenticationResults:", v3);

  return v4;
}

+ (BOOL)isSubsetOfContextTypeSignIn:(int64_t)a3
{
  return ((unint64_t)a3 < 0xD) & (0x1802u >> a3);
}

- (CDPContext)init
{
  NSObject *v3;

  _CDPLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[CDPContext init].cold.1();

  return (CDPContext *)-[CDPContext initNeedingPreflight:](self, "initNeedingPreflight:", 1);
}

- (CDPContext)initWithAuthenticationResults:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  _QWORD *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  id v30;
  id v31;
  NSObject *v32;
  id v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  void *v46;
  int v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  NSObject *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  CDPContext *v60;
  int v62;
  void *v63;
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count"))
  {
    _CDPLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "ak_redactedCopy");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = 138412290;
      v63 = v7;
      _os_log_impl(&dword_20D7E6000, v6, OS_LOG_TYPE_DEFAULT, "\"Starting with auth results:\\n%@\", (uint8_t *)&v62, 0xCu);

    }
    v8 = -[CDPContext initNeedingPreflight:](self, "initNeedingPreflight:", 0);
    if (v8)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE0ABF0]);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)v8[9];
      v8[9] = v9;

      objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE0ABD8]);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)v8[10];
      v8[10] = v11;

      objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE0ABD0]);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)v8[11];
      v8[11] = v13;

      objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE0AB70]);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = (void *)v8[12];
      v8[12] = v15;

      objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE0AB50]);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *((_BYTE *)v8 + 33) = objc_msgSend(v17, "unsignedIntegerValue") == 2;

      v18 = *MEMORY[0x24BE0ABA8];
      objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE0ABA8]);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *((_BYTE *)v8 + 34) = v19 != 0;

      objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE0AB80]);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *((_BYTE *)v8 + 35) = objc_msgSend(v20, "BOOLValue");

      objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE0AB88]);
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = (void *)v8[20];
      v8[20] = v21;

      objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE0AB60]);
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = (void *)v8[21];
      v8[21] = v23;

      objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE0AB48]);
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = (void *)v8[13];
      v8[13] = v25;

      objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE0ABE0]);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v8[28] = objc_msgSend(v27, "unsignedIntegerValue");

      v28 = v8[28];
      if (!v28)
      {
        _CDPLogSystem();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          -[CDPContext initWithAccount:].cold.7();

        v28 = v8[28];
      }
      *((_BYTE *)v8 + 32) = v28 == 4;
      *((_BYTE *)v8 + 40) = v28 == 5;
      objc_opt_class();
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("AKNewAccountCreated"));
      v30 = (id)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v31 = v30;
      else
        v31 = 0;

      *((_BYTE *)v8 + 38) = objc_msgSend(v31, "unsignedIntegerValue") == 1;
      v33 = objc_alloc(MEMORY[0x24BDD1880]);
      objc_msgSend(v5, "objectForKeyedSubscript:", v18);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v33, "initWithUUIDString:", v34);
      v36 = (void *)v8[18];
      v8[18] = v35;

      v8[22] = -1;
      objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE0ABB0]);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = (void *)objc_msgSend(v37, "copy");

      if (v38)
      {
        objc_msgSend(v38, "aaf_toBase64DecodedData");
        v39 = objc_claimAutoreleasedReturnValue();
        v40 = (void *)v8[32];
        v8[32] = v39;

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE0ABE8]);
      v41 = objc_claimAutoreleasedReturnValue();
      v42 = (void *)v8[37];
      v8[37] = v41;

      v8[35] = 0;
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("SOSCompatibilityOptInNeeded"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v43, "BOOLValue"))
      {

      }
      else
      {
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("hasSOSActiveDevice"));
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = objc_msgSend(v44, "BOOLValue");

        if (!v45)
        {
LABEL_22:
          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("SOSNeeded"));
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = objc_msgSend(v46, "BOOLValue");

          if (v47)
            v8[35] |= 2uLL;
          objc_msgSend(v8, "_fakeSOSFlagsWithUserDefaults");
          objc_msgSend(MEMORY[0x24BE0AC98], "sharedInstance");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "authKitAccountWithAltDSID:", v8[13]);
          v49 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v8, "updateDemoAttributesWithAccount:", v49);
          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("adpCh"));
          v50 = objc_claimAutoreleasedReturnValue();
          v51 = (void *)v8[39];
          v8[39] = v50;

          if (*((_BYTE *)v8 + 38))
          {
            _CDPLogSystem();
            v52 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
              -[CDPContext initWithAuthenticationResults:].cold.2(v52, v53, v54, v55, v56, v57, v58, v59);

            v8[14] = 12;
          }

          goto LABEL_29;
        }
      }
      v8[35] |= 1uLL;
      goto LABEL_22;
    }
  }
  else
  {
    _CDPLogSystem();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      -[CDPContext initWithAuthenticationResults:].cold.1();

    v8 = -[CDPContext initNeedingPreflight:](self, "initNeedingPreflight:", 1);
  }
LABEL_29:
  v60 = v8;

  return v60;
}

- (NSNumber)adpCohort
{
  NSNumber *adpCohort;
  void *v4;
  void *v5;
  NSNumber *v6;
  NSNumber *v7;
  NSObject *v8;
  NSNumber *v9;
  NSObject *v11;
  int v12;
  CDPContext *v13;
  __int16 v14;
  NSNumber *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  adpCohort = self->_adpCohort;
  if (adpCohort)
    return adpCohort;
  objc_msgSend(MEMORY[0x24BE0AC98], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "authKitAccountWithAltDSID:", self->_altDSID);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "adpCohortForAccount:", v5);
    v6 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v7 = self->_adpCohort;
    self->_adpCohort = v6;

    _CDPLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = self->_adpCohort;
      v12 = 138412546;
      v13 = self;
      v14 = 2112;
      v15 = v9;
      _os_log_impl(&dword_20D7E6000, v8, OS_LOG_TYPE_DEFAULT, "\"%@: ADP Cohort type is %@\", (uint8_t *)&v12, 0x16u);
    }

    adpCohort = self->_adpCohort;
    return adpCohort;
  }
  _CDPLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    -[CDPContext adpCohort].cold.1();

  return (NSNumber *)0;
}

- (void)startObservingTrustedDeviceList
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_20D7E6000, v0, v1, "\"Started to observe new devices list\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)akTrustedDeviceListChanged:(id)a3
{
  NSObject *v4;

  _CDPLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[CDPContext akTrustedDeviceListChanged:].cold.1();

  self->_numberOfTrustedDevices = -[CDPContext getNumberOfTrustedDevices](self, "getNumberOfTrustedDevices");
}

- (int64_t)getNumberOfTrustedDevices
{
  return 0;
}

- (int64_t)numberOfTrustedDevices
{
  int64_t *p_numberOfTrustedDevices;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  p_numberOfTrustedDevices = &self->_numberOfTrustedDevices;
  if (!self->_numberOfTrustedDevices)
    self->_numberOfTrustedDevices = -[CDPContext getNumberOfTrustedDevices](self, "getNumberOfTrustedDevices");
  _CDPLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[CDPContext numberOfTrustedDevices].cold.1((uint64_t)p_numberOfTrustedDevices, v3, v4, v5, v6, v7, v8, v9);

  return *p_numberOfTrustedDevices;
}

- (BOOL)isPrimaryAccount
{
  NSNumber *v3;
  NSNumber *isPrimaryAccountInternal;
  void *v5;
  void *v6;
  void *v7;
  NSNumber *v8;
  NSNumber *v9;
  NSObject *p_super;
  void *v11;
  _BOOL4 v12;
  NSObject *v13;
  void *v14;
  BOOL v15;
  int v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  _BOOL4 v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = self->_isPrimaryAccountInternal;
  objc_sync_enter(v3);
  isPrimaryAccountInternal = self->_isPrimaryAccountInternal;
  if (!isPrimaryAccountInternal)
  {
    objc_msgSend(MEMORY[0x24BDB4398], "defaultStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPContext altDSID](self, "altDSID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "aa_appleAccountWithAltDSID:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v7, "aa_isAccountClass:", *MEMORY[0x24BE047F0]));
      v8 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      v9 = self->_isPrimaryAccountInternal;
      self->_isPrimaryAccountInternal = v8;

      _CDPLogSystem();
      p_super = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
      {
        -[CDPContext altDSID](self, "altDSID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = -[NSNumber BOOLValue](self->_isPrimaryAccountInternal, "BOOLValue");
        v17 = 141558530;
        v18 = 1752392040;
        v19 = 2112;
        v20 = v11;
        v21 = 1024;
        v22 = v12;
        _os_log_impl(&dword_20D7E6000, p_super, OS_LOG_TYPE_DEFAULT, "\"isPrimaryAccount: Account for %{mask.hash}@ account primary: %{BOOL}d\", (uint8_t *)&v17, 0x1Cu);

      }
    }
    else
    {
      _CDPLogSystem();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        -[CDPContext altDSID](self, "altDSID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[CDPContext isPrimaryAccount].cold.1(v14, (uint64_t)&v17);
      }

      p_super = &self->_isPrimaryAccountInternal->super.super;
      self->_isPrimaryAccountInternal = (NSNumber *)MEMORY[0x24BDBD1C0];
    }

    isPrimaryAccountInternal = self->_isPrimaryAccountInternal;
  }
  v15 = -[NSNumber BOOLValue](isPrimaryAccountInternal, "BOOLValue");
  objc_sync_exit(v3);

  return v15;
}

- (void)setIsPrimaryAccount:(BOOL)a3
{
  _BOOL8 v3;
  NSNumber *v5;
  NSNumber *isPrimaryAccountInternal;
  NSNumber *obj;

  v3 = a3;
  obj = self->_isPrimaryAccountInternal;
  objc_sync_enter(obj);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
  v5 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  isPrimaryAccountInternal = self->_isPrimaryAccountInternal;
  self->_isPrimaryAccountInternal = v5;

  objc_sync_exit(obj);
}

- (BOOL)keychainSyncAllowedByServer
{
  NSNumber *v3;
  NSNumber *keychainSyncAllowedByServerInternal;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  NSNumber *v12;
  NSNumber *v13;
  NSObject *p_super;
  void *v15;
  NSObject *v16;
  void *v17;
  BOOL v18;
  int v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = self->_keychainSyncAllowedByServerInternal;
  objc_sync_enter(v3);
  keychainSyncAllowedByServerInternal = self->_keychainSyncAllowedByServerInternal;
  if (!keychainSyncAllowedByServerInternal)
  {
    objc_msgSend(MEMORY[0x24BDB4398], "defaultStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPContext altDSID](self, "altDSID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "aa_appleAccountWithAltDSID:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = *MEMORY[0x24BDB3E30];
      if ((objc_msgSend(v7, "isProvisionedForDataclass:", *MEMORY[0x24BDB3E30]) & 1) != 0
        || !-[CDPContext isManagedAccount](self, "isManagedAccount"))
      {
        v10 = 1;
      }
      else
      {
        _CDPLogSystem();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          -[CDPContext keychainSyncAllowedByServer].cold.3();

        v10 = 0;
      }
      if (objc_msgSend(v7, "aa_serverDisabledDataclass:", v8))
      {
        _CDPLogSystem();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          -[CDPContext keychainSyncAllowedByServer].cold.2();

        v10 = 0;
      }
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v10);
      v12 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      v13 = self->_keychainSyncAllowedByServerInternal;
      self->_keychainSyncAllowedByServerInternal = v12;

      _CDPLogSystem();
      p_super = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
      {
        -[CDPContext altDSID](self, "altDSID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 141558530;
        v21 = 1752392040;
        v22 = 2112;
        v23 = v15;
        v24 = 1024;
        v25 = v10;
        _os_log_impl(&dword_20D7E6000, p_super, OS_LOG_TYPE_DEFAULT, "\"keychainSyncAllowedByServer: Account for %{mask.hash}@ account primary: %{BOOL}d\", (uint8_t *)&v20, 0x1Cu);

      }
    }
    else
    {
      _CDPLogSystem();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        -[CDPContext altDSID](self, "altDSID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[CDPContext keychainSyncAllowedByServer].cold.1(v17, (uint64_t)&v20);
      }

      p_super = &self->_keychainSyncAllowedByServerInternal->super.super;
      self->_keychainSyncAllowedByServerInternal = (NSNumber *)MEMORY[0x24BDBD1C0];
    }

    keychainSyncAllowedByServerInternal = self->_keychainSyncAllowedByServerInternal;
  }
  v18 = -[NSNumber BOOLValue](keychainSyncAllowedByServerInternal, "BOOLValue");
  objc_sync_exit(v3);

  return v18;
}

- (void)setKeychainSyncAllowedByServer:(BOOL)a3
{
  _BOOL8 v3;
  NSNumber *v5;
  NSNumber *keychainSyncAllowedByServerInternal;
  NSNumber *obj;

  v3 = a3;
  obj = self->_keychainSyncAllowedByServerInternal;
  objc_sync_enter(obj);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
  v5 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  keychainSyncAllowedByServerInternal = self->_keychainSyncAllowedByServerInternal;
  self->_keychainSyncAllowedByServerInternal = v5;

  objc_sync_exit(obj);
}

- (void)purgeResumeData
{
  AKCircleRequestContext *resumeContext;
  KCAESGCMDuplexSession *duplexSession;
  CUMessageSession *sharingChannel;

  resumeContext = self->_resumeContext;
  self->_resumeContext = 0;

  duplexSession = self->_duplexSession;
  self->_duplexSession = 0;

  sharingChannel = self->_sharingChannel;
  self->_sharingChannel = 0;

}

- (BOOL)desiresAllRecords
{
  BOOL v3;
  void *v4;

  if (-[CDPContext idmsRecovery](self, "idmsRecovery"))
    return 1;
  -[CDPContext findMyiPhoneUUID](self, "findMyiPhoneUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v4 != 0;

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *appleID;
  void *v5;
  id v6;

  appleID = self->_appleID;
  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", appleID, CFSTR("_appleID"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_password, CFSTR("_password"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_passwordEquivToken, CFSTR("_passwordEquivToken"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_dsid, CFSTR("_dsid"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_isHSA2Account, CFSTR("_isHSA2Account"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_isManagedAccount, CFSTR("_isManagedAccount"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_didUseSMSVerification, CFSTR("_didUseSMSVerification"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_cachedLocalSecret, CFSTR("_cachedLocalSecret"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_cachedLocalSecretType, CFSTR("_cachedLocalSecretType"));
  objc_msgSend(v6, "encodeBool:forKey:", self->__alwaysCreateEscrowRecord, CFSTR("__alwaysCreateEscrowRecord"));
  objc_msgSend(v6, "encodeBool:forKey:", self->__skipEscrowFetches, CFSTR("__skipEscrowFetches"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_guestMode, CFSTR("_guestMode"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_idmsRecovery, CFSTR("_idmsRecovery"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_idmsMasterKeyRecovery, CFSTR("_idmsMasterKeyRecovery"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_duplexSession, CFSTR("_duplexSession"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_resumeContext, CFSTR("_resumeContext"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_sharingChannel, CFSTR("_sharingChannel"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_type, CFSTR("_type"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_isAttemptingBackupRestore, CFSTR("_isAttemptingBackupRestore"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_findMyiPhoneUUID, CFSTR("_findMyiPhoneUUID"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_altDSID, CFSTR("_altDSID"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_isFederatedAccount, CFSTR("_isFederatedAccount"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_isBeneficiaryAccount, CFSTR("_isBeneficiaryAccount"));
  objc_msgSend(v6, "encodeBool:forKey:", self->__ignoreLockAssertErrors, CFSTR("__ignoreLockAssertErrors"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_custodianRecoveryInfo, CFSTR("_custodianRecoveryInfo"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_beneficiaryIdentifier, CFSTR("_beneficiaryAccount"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_beneficiaryWrappedKeyData, CFSTR("_beneficiaryWrappedKeyData"));
  objc_msgSend(v6, "encodeBool:forKey:", self->__supportsCustodianRecovery, CFSTR("__supportsCustodianRecovery"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_bundleID, CFSTR("_bundleID"));
  objc_msgSend(v6, "encodeBool:forKey:", self->__disableAsyncSecureBackupEnrollment, CFSTR("__disableAsyncSecureBackupEnrollment"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_mandatesRecoveryKey, CFSTR("_mandatesRecoveryKey"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_walrusStatus);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("_walrusStatus"));

  objc_msgSend(v6, "encodeBool:forKey:", self->__forceReset, CFSTR("__forceReset"));
  objc_msgSend(v6, "encodeBool:forKey:", self->__recoveryMethodAvailable, CFSTR("__recoveryMethodAvailable"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_isSOSCFUFlow, CFSTR("_isSOSCFUFlow"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_sosCompatibilityType, CFSTR("_sosCompatibilityType"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_keychainSyncSystem, CFSTR("_keychainSyncSystem"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_telemetryFlowID, CFSTR("_telemetryFlowID"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_telemetryDeviceSessionID, CFSTR("_telemetryDeviceSessionID"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_needsPreflight, CFSTR("_needsPreflight"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_isSharediPad, CFSTR("_isSharediPad"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_securityLevel, CFSTR("_securityLevel"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_followUpType, CFSTR("_followUpType"));
  objc_msgSend(v6, "encodeBool:forKey:", self->__useSecureBackupCachedPassphrase, CFSTR("__useSecureBackupCachedPassphrase"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_cachedPassphraseMissing, CFSTR("_cachedPassphraseMissing"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_adpCohort, CFSTR("_adpCohort"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_newAccountCreated, CFSTR("_newAccountCreated"));

}

- (CDPContext)initWithCoder:(id)a3
{
  id v4;
  CDPContext *v5;
  uint64_t v6;
  NSString *appleID;
  uint64_t v8;
  NSString *password;
  uint64_t v10;
  NSString *passwordEquivToken;
  uint64_t v12;
  NSNumber *dsid;
  uint64_t v14;
  NSString *cachedLocalSecret;
  uint64_t v16;
  KCAESGCMDuplexSession *duplexSession;
  uint64_t v18;
  AKCircleRequestContext *resumeContext;
  uint64_t v20;
  CUMessageSession *sharingChannel;
  uint64_t v22;
  NSString *findMyiPhoneUUID;
  uint64_t v24;
  NSString *altDSID;
  uint64_t v26;
  CDPCustodianRecoveryInfo *custodianRecoveryInfo;
  uint64_t v28;
  NSUUID *beneficiaryIdentifier;
  uint64_t v30;
  NSData *beneficiaryWrappedKeyData;
  uint64_t v32;
  NSString *bundleID;
  void *v34;
  uint64_t v35;
  NSString *telemetryFlowID;
  uint64_t v37;
  NSString *telemetryDeviceSessionID;
  uint64_t v39;
  NSString *followUpType;
  uint64_t v41;
  NSNumber *adpCohort;

  v4 = a3;
  v5 = -[CDPContext initNeedingPreflight:](self, "initNeedingPreflight:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_needsPreflight")));
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_appleID"));
    v6 = objc_claimAutoreleasedReturnValue();
    appleID = v5->_appleID;
    v5->_appleID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_password"));
    v8 = objc_claimAutoreleasedReturnValue();
    password = v5->_password;
    v5->_password = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_passwordEquivToken"));
    v10 = objc_claimAutoreleasedReturnValue();
    passwordEquivToken = v5->_passwordEquivToken;
    v5->_passwordEquivToken = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_dsid"));
    v12 = objc_claimAutoreleasedReturnValue();
    dsid = v5->_dsid;
    v5->_dsid = (NSNumber *)v12;

    v5->_isHSA2Account = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isHSA2Account"));
    v5->_isManagedAccount = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isManagedAccount"));
    v5->_didUseSMSVerification = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_didUseSMSVerification"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_cachedLocalSecret"));
    v14 = objc_claimAutoreleasedReturnValue();
    cachedLocalSecret = v5->_cachedLocalSecret;
    v5->_cachedLocalSecret = (NSString *)v14;

    v5->_cachedLocalSecretType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_cachedLocalSecretType"));
    v5->__alwaysCreateEscrowRecord = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("__alwaysCreateEscrowRecord"));
    v5->__skipEscrowFetches = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("__skipEscrowFetches"));
    v5->_guestMode = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_guestMode"));
    v5->_idmsRecovery = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_idmsRecovery"));
    v5->_idmsMasterKeyRecovery = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_idmsMasterKeyRecovery"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_duplexSession"));
    v16 = objc_claimAutoreleasedReturnValue();
    duplexSession = v5->_duplexSession;
    v5->_duplexSession = (KCAESGCMDuplexSession *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_resumeContext"));
    v18 = objc_claimAutoreleasedReturnValue();
    resumeContext = v5->_resumeContext;
    v5->_resumeContext = (AKCircleRequestContext *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_sharingChannel"));
    v20 = objc_claimAutoreleasedReturnValue();
    sharingChannel = v5->_sharingChannel;
    v5->_sharingChannel = (CUMessageSession *)v20;

    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_type"));
    v5->_isAttemptingBackupRestore = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isAttemptingBackupRestore"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_findMyiPhoneUUID"));
    v22 = objc_claimAutoreleasedReturnValue();
    findMyiPhoneUUID = v5->_findMyiPhoneUUID;
    v5->_findMyiPhoneUUID = (NSString *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_altDSID"));
    v24 = objc_claimAutoreleasedReturnValue();
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v24;

    v5->_isFederatedAccount = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isFederatedAccount"));
    v5->_isBeneficiaryAccount = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isBeneficiaryAccount"));
    v5->__ignoreLockAssertErrors = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("__ignoreLockAssertErrors"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_custodianRecoveryInfo"));
    v26 = objc_claimAutoreleasedReturnValue();
    custodianRecoveryInfo = v5->_custodianRecoveryInfo;
    v5->_custodianRecoveryInfo = (CDPCustodianRecoveryInfo *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_beneficiaryAccount"));
    v28 = objc_claimAutoreleasedReturnValue();
    beneficiaryIdentifier = v5->_beneficiaryIdentifier;
    v5->_beneficiaryIdentifier = (NSUUID *)v28;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_beneficiaryWrappedKeyData"));
    v30 = objc_claimAutoreleasedReturnValue();
    beneficiaryWrappedKeyData = v5->_beneficiaryWrappedKeyData;
    v5->_beneficiaryWrappedKeyData = (NSData *)v30;

    v5->__supportsCustodianRecovery = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("__supportsCustodianRecovery"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_bundleID"));
    v32 = objc_claimAutoreleasedReturnValue();
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v32;

    v5->__disableAsyncSecureBackupEnrollment = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("__disableAsyncSecureBackupEnrollment"));
    v5->_mandatesRecoveryKey = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_mandatesRecoveryKey"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_walrusStatus"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_walrusStatus = objc_msgSend(v34, "unsignedIntValue");

    v5->__forceReset = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("__forceReset"));
    v5->__recoveryMethodAvailable = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("__recoveryMethodAvailable"));
    v5->_isSOSCFUFlow = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isSOSCFUFlow"));
    v5->_sosCompatibilityType = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("_sosCompatibilityType"));
    v5->_keychainSyncSystem = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_keychainSyncSystem"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_telemetryFlowID"));
    v35 = objc_claimAutoreleasedReturnValue();
    telemetryFlowID = v5->_telemetryFlowID;
    v5->_telemetryFlowID = (NSString *)v35;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_telemetryDeviceSessionID"));
    v37 = objc_claimAutoreleasedReturnValue();
    telemetryDeviceSessionID = v5->_telemetryDeviceSessionID;
    v5->_telemetryDeviceSessionID = (NSString *)v37;

    v5->_isSharediPad = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isSharediPad"));
    v5->_securityLevel = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_securityLevel"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_followUpType"));
    v39 = objc_claimAutoreleasedReturnValue();
    followUpType = v5->_followUpType;
    v5->_followUpType = (NSString *)v39;

    v5->__useSecureBackupCachedPassphrase = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("__useSecureBackupCachedPassphrase"));
    v5->_cachedPassphraseMissing = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_cachedPassphraseMissing"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_adpCohort"));
    v41 = objc_claimAutoreleasedReturnValue();
    adpCohort = v5->_adpCohort;
    v5->_adpCohort = (NSNumber *)v41;

    v5->_newAccountCreated = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_newAccountCreated"));
  }

  return v5;
}

- (void)updateWithAuthenticationResults:(id)a3
{
  uint64_t v4;
  id v5;
  NSString *v6;
  NSString *passwordEquivToken;
  NSString *v8;
  NSString *password;
  NSNumber *v10;
  NSNumber *dsid;
  void *v12;
  void *v13;
  NSString *v14;
  NSString *altDSID;
  void *v16;
  unint64_t securityLevel;

  v4 = *MEMORY[0x24BE0ABD0];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  passwordEquivToken = self->_passwordEquivToken;
  self->_passwordEquivToken = v6;

  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE0ABD8]);
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  password = self->_password;
  self->_password = v8;

  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE0AB70]);
  v10 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  dsid = self->_dsid;
  self->_dsid = v10;

  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE0AB50]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  self->_isFederatedAccount = objc_msgSend(v12, "unsignedIntegerValue") == 2;

  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE0ABA8]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  self->_isBeneficiaryAccount = objc_msgSend(v13, "BOOLValue");

  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE0AB48]);
  v14 = (NSString *)objc_claimAutoreleasedReturnValue();
  altDSID = self->_altDSID;
  self->_altDSID = v14;

  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE0ABE0]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  self->_securityLevel = objc_msgSend(v16, "unsignedIntegerValue");
  securityLevel = self->_securityLevel;
  self->_isHSA2Account = securityLevel == 4;
  self->_isManagedAccount = securityLevel == 5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CDPContext *v4;
  uint64_t v5;
  NSString *appleID;
  uint64_t v7;
  NSString *password;
  uint64_t v9;
  NSString *passwordEquivToken;
  uint64_t v11;
  NSNumber *dsid;
  uint64_t v13;
  NSString *cachedLocalSecret;
  uint64_t v15;
  CDPCustodianRecoveryInfo *custodianRecoveryInfo;
  uint64_t v17;
  NSUUID *beneficiaryIdentifier;
  uint64_t v19;
  NSData *beneficiaryWrappedKeyData;

  v4 = objc_alloc_init(CDPContext);
  v5 = -[NSString copy](self->_appleID, "copy");
  appleID = v4->_appleID;
  v4->_appleID = (NSString *)v5;

  v7 = -[NSString copy](self->_password, "copy");
  password = v4->_password;
  v4->_password = (NSString *)v7;

  v9 = -[NSString copy](self->_passwordEquivToken, "copy");
  passwordEquivToken = v4->_passwordEquivToken;
  v4->_passwordEquivToken = (NSString *)v9;

  v11 = -[NSNumber copy](self->_dsid, "copy");
  dsid = v4->_dsid;
  v4->_dsid = (NSNumber *)v11;

  v4->_isHSA2Account = self->_isHSA2Account;
  v4->_isManagedAccount = self->_isManagedAccount;
  objc_storeStrong((id *)&v4->_isPrimaryAccountInternal, self->_isPrimaryAccountInternal);
  v4->_didUseSMSVerification = self->_didUseSMSVerification;
  v13 = -[NSString copy](self->_cachedLocalSecret, "copy");
  cachedLocalSecret = v4->_cachedLocalSecret;
  v4->_cachedLocalSecret = (NSString *)v13;

  v4->_cachedLocalSecretType = self->_cachedLocalSecretType;
  v4->__alwaysCreateEscrowRecord = self->__alwaysCreateEscrowRecord;
  v4->__skipEscrowFetches = self->__skipEscrowFetches;
  v4->_guestMode = self->_guestMode;
  v4->_idmsRecovery = self->_idmsRecovery;
  v4->_idmsMasterKeyRecovery = self->_idmsMasterKeyRecovery;
  v4->_type = self->_type;
  v4->_isAttemptingBackupRestore = self->_isAttemptingBackupRestore;
  objc_storeStrong((id *)&v4->_findMyiPhoneUUID, self->_findMyiPhoneUUID);
  objc_storeStrong((id *)&v4->_altDSID, self->_altDSID);
  objc_storeStrong((id *)&v4->_sharingChannel, self->_sharingChannel);
  v4->_isFederatedAccount = self->_isFederatedAccount;
  v4->_isBeneficiaryAccount = self->_isBeneficiaryAccount;
  v15 = -[CDPCustodianRecoveryInfo copy](self->_custodianRecoveryInfo, "copy");
  custodianRecoveryInfo = v4->_custodianRecoveryInfo;
  v4->_custodianRecoveryInfo = (CDPCustodianRecoveryInfo *)v15;

  v17 = -[NSUUID copy](self->_beneficiaryIdentifier, "copy");
  beneficiaryIdentifier = v4->_beneficiaryIdentifier;
  v4->_beneficiaryIdentifier = (NSUUID *)v17;

  v19 = -[NSData copy](self->_beneficiaryWrappedKeyData, "copy");
  beneficiaryWrappedKeyData = v4->_beneficiaryWrappedKeyData;
  v4->_beneficiaryWrappedKeyData = (NSData *)v19;

  v4->__supportsCustodianRecovery = self->__supportsCustodianRecovery;
  objc_storeStrong((id *)&v4->_bundleID, self->_bundleID);
  v4->__disableAsyncSecureBackupEnrollment = self->__disableAsyncSecureBackupEnrollment;
  v4->_mandatesRecoveryKey = self->_mandatesRecoveryKey;
  v4->_walrusStatus = self->_walrusStatus;
  v4->__forceReset = self->__forceReset;
  v4->__recoveryMethodAvailable = self->__recoveryMethodAvailable;
  v4->_isSOSCFUFlow = self->_isSOSCFUFlow;
  v4->_sosCompatibilityType = self->_sosCompatibilityType;
  v4->_keychainSyncSystem = self->_keychainSyncSystem;
  objc_storeStrong((id *)&v4->_telemetryFlowID, self->_telemetryFlowID);
  objc_storeStrong((id *)&v4->_telemetryDeviceSessionID, self->_telemetryDeviceSessionID);
  v4->_isSharediPad = self->_isSharediPad;
  v4->_securityLevel = self->_securityLevel;
  objc_storeStrong((id *)&v4->_followUpType, self->_followUpType);
  v4->__useSecureBackupCachedPassphrase = self->__useSecureBackupCachedPassphrase;
  v4->_cachedPassphraseMissing = self->_cachedPassphraseMissing;
  objc_storeStrong((id *)&v4->_adpCohort, self->_adpCohort);
  return v4;
}

- (id)description
{
  id v3;
  const __CFString *v4;

  v3 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  objc_msgSend(v3, "appendString:", CFSTR("CDPContext: \n"));
  objc_msgSend(v3, "appendFormat:", CFSTR("\tdsid: %@\n"), self->_dsid);
  objc_msgSend(v3, "appendFormat:", CFSTR("\tisHSA2Account: %d\n"), self->_isHSA2Account);
  objc_msgSend(v3, "appendFormat:", CFSTR("\tisManagedAccount: %d\n"), self->_isManagedAccount);
  objc_msgSend(v3, "appendFormat:", CFSTR("\tisPrimaryAccountInternal: %@\n"), self->_isPrimaryAccountInternal);
  objc_msgSend(v3, "appendFormat:", CFSTR("\tdidUseSMSVerification: %d\n"), self->_didUseSMSVerification);
  objc_msgSend(v3, "appendFormat:", CFSTR("\tisPrimaryAccountInternal: %@\n"), self->_isPrimaryAccountInternal);
  objc_msgSend(v3, "appendFormat:", CFSTR("\tisSOSCFUFlow: %d\n"), self->_isSOSCFUFlow);
  objc_msgSend(v3, "appendFormat:", CFSTR("\tsosCompatibilityType: %lu\n"), self->_sosCompatibilityType);
  if (self->_keychainSyncSystem)
    v4 = CFSTR("SOS");
  else
    v4 = CFSTR("Octagon");
  objc_msgSend(v3, "appendFormat:", CFSTR("\tkeychainSyncSystem: %@\n"), v4);
  objc_msgSend(v3, "appendFormat:", CFSTR("\tisTTSURecovery: %d\n"), -[CDPContext isTTSURecovery](self, "isTTSURecovery"));
  objc_msgSend(v3, "appendFormat:", CFSTR("\tisSharediPad: %d\n"), -[CDPContext isSharediPad](self, "isSharediPad"));
  objc_msgSend(v3, "appendFormat:", CFSTR("\tnewAccountCreated: %d\n"), -[CDPContext newAccountCreated](self, "newAccountCreated"));
  objc_msgSend(v3, "appendFormat:", CFSTR("\tcontextType: %ld"), -[CDPContext type](self, "type"));
  return v3;
}

- (void)augmentWithCredentialsFromContext:(id)a3
{
  NSString *v4;
  NSString *appleID;
  NSString *v6;
  NSString *password;
  NSString *v8;
  NSString *passwordEquivToken;
  NSNumber *v10;
  NSNumber *dsid;
  NSString *v12;
  NSString *altDSID;
  NSString *v14;
  NSString *telemetryDeviceSessionID;
  NSString *v16;
  NSString *telemetryFlowID;
  id v18;

  v18 = a3;
  if (!self->_appleID)
  {
    objc_msgSend(v18, "appleID");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    appleID = self->_appleID;
    self->_appleID = v4;

  }
  if (!self->_password)
  {
    objc_msgSend(v18, "password");
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    password = self->_password;
    self->_password = v6;

  }
  if (!self->_passwordEquivToken)
  {
    objc_msgSend(v18, "passwordEquivToken");
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    passwordEquivToken = self->_passwordEquivToken;
    self->_passwordEquivToken = v8;

  }
  if (!self->_dsid)
  {
    objc_msgSend(v18, "dsid");
    v10 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    dsid = self->_dsid;
    self->_dsid = v10;

  }
  if (!self->_altDSID)
  {
    objc_msgSend(v18, "altDSID");
    v12 = (NSString *)objc_claimAutoreleasedReturnValue();
    altDSID = self->_altDSID;
    self->_altDSID = v12;

  }
  if (!self->_telemetryDeviceSessionID)
  {
    objc_msgSend(v18, "telemetryDeviceSessionID");
    v14 = (NSString *)objc_claimAutoreleasedReturnValue();
    telemetryDeviceSessionID = self->_telemetryDeviceSessionID;
    self->_telemetryDeviceSessionID = v14;

  }
  if (!self->_telemetryFlowID)
  {
    objc_msgSend(v18, "telemetryFlowID");
    v16 = (NSString *)objc_claimAutoreleasedReturnValue();
    telemetryFlowID = self->_telemetryFlowID;
    self->_telemetryFlowID = v16;

  }
  if (!self->_securityLevel)
    self->_securityLevel = objc_msgSend(v18, "securityLevel");

}

- (BOOL)isPiggybackingRecovery
{
  void *v3;
  void *v4;
  BOOL v5;

  -[CDPContext duplexSession](self, "duplexSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[CDPContext resumeContext](self, "resumeContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isTTSURecovery
{
  void *v2;
  BOOL v3;

  -[CDPContext sharingChannel](self, "sharingChannel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)isiCDPEligible
{
  return -[CDPContext isiCDPEligibleWithError:](self, "isiCDPEligibleWithError:", 0);
}

- (void)setValidEscrowDeviceCount:(int64_t)a3
{
  self->_validEscrowDeviceCount = a3;
}

- (BOOL)isSOSNeeded
{
  return (LOBYTE(self->_sosCompatibilityType) >> 1) & 1;
}

- (BOOL)isSOSCompatibilityOptInNeeded
{
  return self->_sosCompatibilityType & 1;
}

- (BOOL)isLocalSecretCached
{
  BOOL v4;
  void *v5;

  if (+[CDPUtilities useCDPContextSecretInsteadOfSBDSecretFeatureEnabled](CDPUtilities, "useCDPContextSecretInsteadOfSBDSecretFeatureEnabled"))
  {
    return -[CDPContext _isLocalSecretCachedAcknowledgingInMemoryValue](self, "_isLocalSecretCachedAcknowledgingInMemoryValue");
  }
  if (-[CDPContext cachedPassphraseMissing](self, "cachedPassphraseMissing"))
    return 0;
  -[CDPContext cachedLocalSecret](self, "cachedLocalSecret");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v4 = 1;
  else
    v4 = -[CDPContext _useSecureBackupCachedPassphrase](self, "_useSecureBackupCachedPassphrase");

  return v4;
}

- (BOOL)_isLocalSecretCachedAcknowledgingInMemoryValue
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  _BOOL4 v9;

  -[CDPContext cachedLocalSecret](self, "cachedLocalSecret");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CDPContext cachedLocalSecret](self, "cachedLocalSecret");
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (void *)v4;
      -[CDPContext cachedLocalSecret](self, "cachedLocalSecret");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "length");

      if (!v7)
      {
        _CDPLogSystem();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
          -[CDPContext _isLocalSecretCachedAcknowledgingInMemoryValue].cold.1(v8);

      }
    }
    LOBYTE(v9) = 1;
  }
  else
  {
    v9 = -[CDPContext _useSecureBackupCachedPassphrase](self, "_useSecureBackupCachedPassphrase");
    if (v9)
      LOBYTE(v9) = !-[CDPContext cachedPassphraseMissing](self, "cachedPassphraseMissing");
  }
  return v9;
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)passwordEquivToken
{
  return self->_passwordEquivToken;
}

- (void)setPasswordEquivToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void)setIsHSA2Account:(BOOL)a3
{
  self->_isHSA2Account = a3;
}

- (BOOL)isFederatedAccount
{
  return self->_isFederatedAccount;
}

- (void)setIsFederatedAccount:(BOOL)a3
{
  self->_isFederatedAccount = a3;
}

- (BOOL)isBeneficiaryAccount
{
  return self->_isBeneficiaryAccount;
}

- (void)setIsBeneficiaryAccount:(BOOL)a3
{
  self->_isBeneficiaryAccount = a3;
}

- (BOOL)didUseSMSVerification
{
  return self->_didUseSMSVerification;
}

- (void)setDidUseSMSVerification:(BOOL)a3
{
  self->_didUseSMSVerification = a3;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (BOOL)isAttemptingBackupRestore
{
  return self->_isAttemptingBackupRestore;
}

- (void)setIsAttemptingBackupRestore:(BOOL)a3
{
  self->_isAttemptingBackupRestore = a3;
}

- (NSString)cachedLocalSecret
{
  return self->_cachedLocalSecret;
}

- (void)setCachedLocalSecret:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (unint64_t)cachedLocalSecretType
{
  return self->_cachedLocalSecretType;
}

- (void)setCachedLocalSecretType:(unint64_t)a3
{
  self->_cachedLocalSecretType = a3;
}

- (BOOL)guestMode
{
  return self->_guestMode;
}

- (void)setGuestMode:(BOOL)a3
{
  self->_guestMode = a3;
}

- (NSString)findMyiPhoneUUID
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (void)setFindMyiPhoneUUID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 136);
}

- (NSUUID)beneficiaryIdentifier
{
  return self->_beneficiaryIdentifier;
}

- (void)setBeneficiaryIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (BOOL)newAccountCreated
{
  return self->_newAccountCreated;
}

- (CDPAuthProviderInternal)_authProvider
{
  return self->__authProvider;
}

- (void)set_authProvider:(id)a3
{
  objc_storeStrong((id *)&self->__authProvider, a3);
}

- (KCAESGCMDuplexSession)duplexSession
{
  return self->_duplexSession;
}

- (void)setDuplexSession:(id)a3
{
  objc_storeStrong((id *)&self->_duplexSession, a3);
}

- (AKCircleRequestContext)resumeContext
{
  return self->_resumeContext;
}

- (void)setResumeContext:(id)a3
{
  objc_storeStrong((id *)&self->_resumeContext, a3);
}

- (BOOL)failSignInOnError
{
  return self->_failSignInOnError;
}

- (void)setFailSignInOnError:(BOOL)a3
{
  self->_failSignInOnError = a3;
}

- (int64_t)validEscrowDeviceCount
{
  return self->_validEscrowDeviceCount;
}

- (int64_t)totalEscrowDeviceCount
{
  return self->_totalEscrowDeviceCount;
}

- (void)setTotalEscrowDeviceCount:(int64_t)a3
{
  self->_totalEscrowDeviceCount = a3;
}

- (int64_t)totalRecoveryAttempts
{
  return self->_totalRecoveryAttempts;
}

- (void)setTotalRecoveryAttempts:(int64_t)a3
{
  self->_totalRecoveryAttempts = a3;
}

- (int64_t)maxDeviceRecoveryAttempts
{
  return self->_maxDeviceRecoveryAttempts;
}

- (void)setMaxDeviceRecoveryAttempts:(int64_t)a3
{
  self->_maxDeviceRecoveryAttempts = a3;
}

- (double)newestEscrowRecordAge
{
  return self->_newestEscrowRecordAge;
}

- (void)setNewestEscrowRecordAge:(double)a3
{
  self->_newestEscrowRecordAge = a3;
}

- (void)setIsManagedAccount:(BOOL)a3
{
  self->_isManagedAccount = a3;
}

- (BOOL)multiUserManateeAllowed
{
  return self->_multiUserManateeAllowed;
}

- (void)setMultiUserManateeAllowed:(BOOL)a3
{
  self->_multiUserManateeAllowed = a3;
}

- (BOOL)managedAccountsAllowedInCDP
{
  return self->_managedAccountsAllowedInCDP;
}

- (void)setManagedAccountsAllowedInCDP:(BOOL)a3
{
  self->_managedAccountsAllowedInCDP = a3;
}

- (BOOL)keychainSyncAllowedByMDM
{
  return self->_keychainSyncAllowedByMDM;
}

- (void)setKeychainSyncAllowedByMDM:(BOOL)a3
{
  self->_keychainSyncAllowedByMDM = a3;
}

- (unsigned)endpoint
{
  return self->_endpoint;
}

- (void)setEndpoint:(unsigned int)a3
{
  self->_endpoint = a3;
}

- (unsigned)backupActivity
{
  return self->_backupActivity;
}

- (void)setBackupActivity:(unsigned int)a3
{
  self->_backupActivity = a3;
}

- (unint64_t)walrusStatus
{
  return self->_walrusStatus;
}

- (void)setWalrusStatus:(unint64_t)a3
{
  self->_walrusStatus = a3;
}

- (unint64_t)securityLevel
{
  return self->_securityLevel;
}

- (void)setSecurityLevel:(unint64_t)a3
{
  self->_securityLevel = a3;
}

- (void)setIsSharediPad:(BOOL)a3
{
  self->_isSharediPad = a3;
}

- (NSString)accountType
{
  return self->_accountType;
}

- (void)setAccountType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (BOOL)willAttemptAsyncSecureBackupEnablement
{
  return self->_willAttemptAsyncSecureBackupEnablement;
}

- (void)setWillAttemptAsyncSecureBackupEnablement:(BOOL)a3
{
  self->_willAttemptAsyncSecureBackupEnablement = a3;
}

- (BOOL)didAttemptSecureBackupEnablement
{
  return self->_didAttemptSecureBackupEnablement;
}

- (void)setDidAttemptSecureBackupEnablement:(BOOL)a3
{
  self->_didAttemptSecureBackupEnablement = a3;
}

- (BOOL)_supportsCustodianRecovery
{
  return self->__supportsCustodianRecovery;
}

- (void)set_supportsCustodianRecovery:(BOOL)a3
{
  self->__supportsCustodianRecovery = a3;
}

- (CUMessageSession)sharingChannel
{
  return self->_sharingChannel;
}

- (void)setSharingChannel:(id)a3
{
  objc_storeStrong((id *)&self->_sharingChannel, a3);
}

- (BOOL)_forceReset
{
  return self->__forceReset;
}

- (void)set_forceReset:(BOOL)a3
{
  self->__forceReset = a3;
}

- (BOOL)_recoveryMethodAvailable
{
  return self->__recoveryMethodAvailable;
}

- (void)set_recoveryMethodAvailable:(BOOL)a3
{
  self->__recoveryMethodAvailable = a3;
}

- (BOOL)_disableAsyncSecureBackupEnrollment
{
  return self->__disableAsyncSecureBackupEnrollment;
}

- (void)set_disableAsyncSecureBackupEnrollment:(BOOL)a3
{
  self->__disableAsyncSecureBackupEnrollment = a3;
}

- (BOOL)_useSecureBackupCachedPassphrase
{
  return self->__useSecureBackupCachedPassphrase;
}

- (void)set_useSecureBackupCachedPassphrase:(BOOL)a3
{
  self->__useSecureBackupCachedPassphrase = a3;
}

- (BOOL)_alwaysCreateEscrowRecord
{
  return self->__alwaysCreateEscrowRecord;
}

- (void)set_alwaysCreateEscrowRecord:(BOOL)a3
{
  self->__alwaysCreateEscrowRecord = a3;
}

- (BOOL)_skipEscrowFetches
{
  return self->__skipEscrowFetches;
}

- (void)set_skipEscrowFetches:(BOOL)a3
{
  self->__skipEscrowFetches = a3;
}

- (BOOL)_ignoreLockAssertErrors
{
  return self->__ignoreLockAssertErrors;
}

- (void)set_ignoreLockAssertErrors:(BOOL)a3
{
  self->__ignoreLockAssertErrors = a3;
}

- (BOOL)idmsRecovery
{
  return self->_idmsRecovery;
}

- (void)setIdmsRecovery:(BOOL)a3
{
  self->_idmsRecovery = a3;
}

- (BOOL)idmsMasterKeyRecovery
{
  return self->_idmsMasterKeyRecovery;
}

- (void)setIdmsMasterKeyRecovery:(BOOL)a3
{
  self->_idmsMasterKeyRecovery = a3;
}

- (BOOL)mandatesRecoveryKey
{
  return self->_mandatesRecoveryKey;
}

- (void)setMandatesRecoveryKey:(BOOL)a3
{
  self->_mandatesRecoveryKey = a3;
}

- (BOOL)cachedPassphraseMissing
{
  return self->_cachedPassphraseMissing;
}

- (void)setCachedPassphraseMissing:(BOOL)a3
{
  self->_cachedPassphraseMissing = a3;
}

- (CDPCustodianRecoveryInfo)custodianRecoveryInfo
{
  return self->_custodianRecoveryInfo;
}

- (void)setCustodianRecoveryInfo:(id)a3
{
  objc_storeStrong((id *)&self->_custodianRecoveryInfo, a3);
}

- (NSData)beneficiaryWrappedKeyData
{
  return self->_beneficiaryWrappedKeyData;
}

- (void)setBeneficiaryWrappedKeyData:(id)a3
{
  objc_storeStrong((id *)&self->_beneficiaryWrappedKeyData, a3);
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (BOOL)isSOSCFUFlow
{
  return self->_isSOSCFUFlow;
}

- (void)setIsSOSCFUFlow:(BOOL)a3
{
  self->_isSOSCFUFlow = a3;
}

- (int64_t)keychainSyncSystem
{
  return self->_keychainSyncSystem;
}

- (void)setKeychainSyncSystem:(int64_t)a3
{
  self->_keychainSyncSystem = a3;
}

- (unint64_t)sosCompatibilityType
{
  return self->_sosCompatibilityType;
}

- (void)setSosCompatibilityType:(unint64_t)a3
{
  self->_sosCompatibilityType = a3;
}

- (void)setTelemetryDeviceSessionID:(id)a3
{
  objc_storeStrong((id *)&self->_telemetryDeviceSessionID, a3);
}

- (void)setTelemetryFlowID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (NSString)followUpType
{
  return self->_followUpType;
}

- (void)setFollowUpType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 304);
}

- (void)setAdpCohort:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 312);
}

+ (void)contextForPrimaryAccount
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_16(&dword_20D7E6000, v0, v1, "\"No primary account found\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)contextForAccountWithAppleID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_6(&dword_20D7E6000, v0, v1, "\"No account found for username %{mask.hash}@\", v2);
  OUTLINED_FUNCTION_5();
}

+ (void)contextForAccountWithAppleID:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_17(&dword_20D7E6000, v0, v1, "\"Creating context for username %{mask.hash}@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

+ (void)contextForAccountWithAltDSID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_6(&dword_20D7E6000, v0, v1, "\"No account found for altDSID %{mask.hash}@\", v2);
  OUTLINED_FUNCTION_5();
}

+ (void)contextForAccountWithAltDSID:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_17(&dword_20D7E6000, v0, v1, "\"Creating context for altDSID %{mask.hash}@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)init
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_20D7E6000, v0, v1, "@\"[CDPContext init] called directly. Please use one of the class initializers instead.\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithAccount:.cold.1()
{
  void *v0;
  void *v1;
  const char *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  v1 = (void *)objc_opt_class();
  OUTLINED_FUNCTION_11(v1);
  v2 = (const char *)OUTLINED_FUNCTION_12();
  NSStringFromSelector(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_6_0(&dword_20D7E6000, v4, v5, "\"[%{public}@ %{public}@]: Value for '%{public}s' was nil, failing init\", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_8();
}

- (void)initWithAccount:.cold.2()
{
  void *v0;
  void *v1;
  const char *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_18();
  v1 = (void *)OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_11(v1);
  v2 = (const char *)OUTLINED_FUNCTION_12();
  NSStringFromSelector(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_6_0(&dword_20D7E6000, v4, v5, "\"[%{public}@ %{public}@]: Value for '%{public}s' was nil, failing init\", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_8();
}

- (void)initWithAccount:.cold.3()
{
  void *v0;
  void *v1;
  const char *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_18();
  v1 = (void *)OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_11(v1);
  v2 = (const char *)OUTLINED_FUNCTION_12();
  NSStringFromSelector(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_6_0(&dword_20D7E6000, v4, v5, "\"[%{public}@ %{public}@]: Value for '%{public}s' was nil, failing init\", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_8();
}

- (void)initWithAccount:.cold.4()
{
  void *v0;
  void *v1;
  const char *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_18();
  v1 = (void *)OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_11(v1);
  v2 = (const char *)OUTLINED_FUNCTION_12();
  NSStringFromSelector(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_6_0(&dword_20D7E6000, v4, v5, "\"[%{public}@ %{public}@]: Value for '%{public}s' was nil, failing init\", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_8();
}

- (void)initWithAccount:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_20D7E6000, v0, v1, "@\"SOS Compat: AKAccountManager isSOSNeededForAccount is True. Setting it in CDPContext.\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithAccount:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_20D7E6000, v0, v1, "@\"SOS Compat: AKAccountManager hasSOSActiveDeviceForAccount is True. Setting it in CDPContext.\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithAccount:.cold.7()
{
  NSObject *v0;
  void *v1;
  void *v2;
  const char *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  OUTLINED_FUNCTION_18();
  v7 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_opt_class();
  OUTLINED_FUNCTION_11(v2);
  v3 = (const char *)OUTLINED_FUNCTION_12();
  NSStringFromSelector(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_6(&dword_20D7E6000, v0, v5, "@\"[%{pulbic}@ %{public}@]: Unknown security level. iCDP will not be available.\", v6);

  OUTLINED_FUNCTION_2();
}

- (void)initWithAuthenticationResults:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_5();
}

- (void)initWithAuthenticationResults:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7(&dword_20D7E6000, a1, a3, "\"CDPContext: a new account was just created, setting up CDPContext=%ld\", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

- (void)adpCohort
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_19();
  v3 = 2112;
  v4 = v0;
  _os_log_fault_impl(&dword_20D7E6000, v1, OS_LOG_TYPE_FAULT, "\"%@: Unable to obtain the adpCohortForAccount because AKAccountManager (%@) doesn't respond to selector.\", v2, 0x16u);
  OUTLINED_FUNCTION_5();
}

- (void)akTrustedDeviceListChanged:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_7(&dword_20D7E6000, v0, v1, "\"Received trusted device list notification for obj %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)numberOfTrustedDevices
{
  OUTLINED_FUNCTION_7(&dword_20D7E6000, a2, a3, "\"Received number of trusted devices = %zd\", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

- (void)isPrimaryAccount
{
  NSObject *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_10_0((uint64_t)a1, a2, 7.2225e-34);
  OUTLINED_FUNCTION_6(&dword_20D7E6000, v3, (uint64_t)v3, "\"isPrimaryAccount: Did not find account for %{mask.hash}@ we can't determine if the account is primary!\", v4);

}

- (void)keychainSyncAllowedByServer
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_20D7E6000, v0, v1, "\"keychainSyncAllowedByServer: Keychain sync is not provisioned by server\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_isLocalSecretCachedAcknowledgingInMemoryValue
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136315138;
  v2 = "-[CDPContext _isLocalSecretCachedAcknowledgingInMemoryValue]";
  _os_log_fault_impl(&dword_20D7E6000, log, OS_LOG_TYPE_FAULT, "\"%s: Found a cached secret that was just an empty string.\", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_5();
}

@end
