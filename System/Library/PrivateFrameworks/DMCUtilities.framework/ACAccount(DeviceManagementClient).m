@implementation ACAccount(DeviceManagementClient)

+ (id)dmc_createManagementAccountWithStore:()DeviceManagementClient
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)MEMORY[0x1E0C8F298];
  v4 = a3;
  v5 = [v3 alloc];
  objc_msgSend(v4, "dmc_RemoteManagementAccountType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v5, "initWithAccountType:", v6);
  objc_msgSend(v7, "dmc_setAccountScheme:", CFSTR("Bearer"));
  objc_msgSend(v7, "setAuthenticated:", 1);
  return v7;
}

- (uint64_t)dmc_accountScheme
{
  return objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("DMCAccountScheme"));
}

- (uint64_t)dmc_setAccountScheme:()DeviceManagementClient
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:", a3, CFSTR("DMCAccountScheme"));
}

- (uint64_t)dmc_altDSID
{
  return objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("altDSID"));
}

- (uint64_t)dmc_setAltDSID:()DeviceManagementClient
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:", a3, CFSTR("altDSID"));
}

- (uint64_t)dmc_bearerReauthURL
{
  return objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("DMCBearerReauthURL"));
}

- (uint64_t)dmc_setBearerReauthURL:()DeviceManagementClient
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:", a3, CFSTR("DMCBearerReauthURL"));
}

- (uint64_t)dmc_bearerReauthParams
{
  return objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("DMCBearerReauthParams"));
}

- (uint64_t)dmc_setBearerReauthParams:()DeviceManagementClient
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:", a3, CFSTR("DMCBearerReauthParams"));
}

- (id)dmc_bearerToken
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "credential");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "token");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)dmc_setBearerToken:()DeviceManagementClient
{
  void *v4;
  uint64_t v5;
  id v6;

  v6 = a3;
  objc_msgSend(a1, "credential");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v4 = (void *)objc_opt_new();
    v5 = *MEMORY[0x1E0C8F1B0];
    objc_msgSend(v4, "setCredentialType:", *MEMORY[0x1E0C8F1B0]);
    objc_msgSend(a1, "setCredential:", v4);
    objc_msgSend(a1, "setCredentialType:", v5);
  }
  objc_msgSend(v4, "setToken:", v6);

}

- (uint64_t)dmc_DSID
{
  return objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("DSID"));
}

- (uint64_t)dmc_setDSID:()DeviceManagementClient
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:", a3, CFSTR("DSID"));
}

- (uint64_t)dmc_enrollmentMethod
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("DMCEnrollmentMethod"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "unsignedIntValue");

  return v2;
}

- (void)dmc_setEnrollmentMethod:()DeviceManagementClient
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setObject:forKeyedSubscript:", v2, CFSTR("DMCEnrollmentMethod"));

}

- (uint64_t)dmc_enrollmentToken
{
  return objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("RMEnrollmentToken"));
}

- (uint64_t)dmc_setEnrollmentToken:()DeviceManagementClient
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:", a3, CFSTR("RMEnrollmentToken"));
}

- (uint64_t)dmc_enrollmentType
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("DMCEnrollmentType"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "unsignedIntValue");

  return v2;
}

- (void)dmc_setEnrollmentType:()DeviceManagementClient
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setObject:forKeyedSubscript:", v2, CFSTR("DMCEnrollmentType"));

}

- (uint64_t)dmc_enrollmentURL
{
  return objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("RMEnrollmentURL"));
}

- (uint64_t)dmc_setEnrollmentURL:()DeviceManagementClient
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:", a3, CFSTR("RMEnrollmentURL"));
}

- (uint64_t)dmc_managementProfileIdentifier
{
  return objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("RMManagementProfileIdentifier"));
}

- (uint64_t)dmc_setManagementProfileIdentifier:()DeviceManagementClient
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:", a3, CFSTR("RMManagementProfileIdentifier"));
}

- (uint64_t)dmc_isManagementProfileLocked
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("DMCIsManagementProfileLocked"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

- (void)dmc_setManagementProfileLocked:()DeviceManagementClient
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setObject:forKeyedSubscript:", v2, CFSTR("DMCIsManagementProfileLocked"));

}

- (uint64_t)dmc_remoteManagingAccountIdentifier
{
  return objc_msgSend(a1, "objectForKeyedSubscript:", *MEMORY[0x1E0C8EFE0]);
}

- (uint64_t)dmc_setRemoteManagingAccountIdentifier:()DeviceManagementClient
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:", a3, *MEMORY[0x1E0C8EFE0]);
}

- (id)dmc_remoteManagementAccount
{
  void *v2;
  void *v3;
  int v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a1, "accountType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C8F130]);

  if (v4)
  {
    v5 = a1;
  }
  else
  {
    objc_msgSend(a1, "dmc_remoteManagingAccountIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "dmc_remoteManagingAccountIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "accountWithIdentifier:", v8);
      v5 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v5 = 0;
    }
  }
  return v5;
}

- (uint64_t)dmc_personaIdentifier
{
  return objc_msgSend(a1, "objectForKeyedSubscript:", *MEMORY[0x1E0C8EFC8]);
}

- (uint64_t)dmc_setPersonaIdentifier:()DeviceManagementClient
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:", a3, *MEMORY[0x1E0C8EFC8]);
}

- (uint64_t)dmc_signInUserIdentifier
{
  return objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("DMCSignInUserIdentifier"));
}

- (uint64_t)dmc_setSignInUserIdentifier:()DeviceManagementClient
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:", a3, CFSTR("DMCSignInUserIdentifier"));
}

- (uint64_t)dmc_mdmServerToken
{
  AppleAccountLibrary();
  return objc_msgSend(a1, "aa_mdmServerToken");
}

- (BOOL)dmc_isVisibleRemoteManagementAccount
{
  void *v2;
  uint64_t v3;
  _BOOL4 v4;

  objc_msgSend(a1, "dmc_managementProfileIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
    return 0;
  v3 = objc_msgSend(a1, "dmc_enrollmentType");
  if (objc_msgSend(a1, "dmc_enrollmentMethod"))
    v4 = objc_msgSend(a1, "dmc_enrollmentMethod") != 3;
  else
    v4 = 0;
  return v3 && v4;
}

- (uint64_t)dmc_isPrimaryAccount
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("primaryAccount"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

- (id)dmc_accountQuotaString
{
  dispatch_semaphore_t v2;
  void *v3;
  uint64_t v4;
  objc_class *v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD v10[5];
  NSObject *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  __CFString *v18;
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  v18 = &stru_1E4D38200;
  v2 = dispatch_semaphore_create(0);
  v20 = 0;
  v21 = &v20;
  v22 = 0x2050000000;
  v3 = (void *)getAAQuotaInfoRequestClass_softClass;
  v23 = getAAQuotaInfoRequestClass_softClass;
  v4 = MEMORY[0x1E0C809B0];
  if (!getAAQuotaInfoRequestClass_softClass)
  {
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __getAAQuotaInfoRequestClass_block_invoke;
    v19[3] = &unk_1E4D36B88;
    v19[4] = &v20;
    __getAAQuotaInfoRequestClass_block_invoke((uint64_t)v19);
    v3 = (void *)v21[3];
  }
  v5 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v20, 8);
  v6 = (void *)objc_msgSend([v5 alloc], "initDetailedRequestWithAccount:", a1);
  v10[0] = v4;
  v10[1] = 3221225472;
  v10[2] = __59__ACAccount_DeviceManagementClient__dmc_accountQuotaString__block_invoke;
  v10[3] = &unk_1E4D36B48;
  v12 = &v13;
  v10[4] = a1;
  v7 = v2;
  v11 = v7;
  objc_msgSend(v6, "performRequestWithHandler:", v10);
  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

- (uint64_t)dmc_isAccountSchemeSharediPad
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "dmc_accountScheme");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("SharediPad"));

  return v2;
}

@end
