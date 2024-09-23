@implementation AppleIDAuthenticationPlugin

- (BOOL)_clientHasEntitlement:(id)a3
{
  id v3;
  NSObject *v4;
  char v5;

  v3 = a3;
  _ACDLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_230E6B600();

  if ((objc_msgSend(v3, "hasEntitlement:", *MEMORY[0x24BDB4450]) & 1) != 0)
    v5 = 1;
  else
    v5 = objc_msgSend(v3, "hasEntitlement:", *MEMORY[0x24BDB4458]);

  return v5;
}

- (id)credentialForAccount:(id)a3 client:(id)a4 store:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  int v18;
  NSObject *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _BOOL4 v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id *v33;
  void *v34;
  NSObject *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  char v46;
  NSObject *v47;
  void *v48;
  NSObject *v49;
  char v50;
  id *v51;
  void *v52;
  AppleIDAuthenticationPlugin *v53;
  _BOOL4 v54;
  id v55;
  id v56;
  uint8_t buf[4];
  id v58;
  __int16 v59;
  NSObject *v60;
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v54 = -[AppleIDAuthenticationPlugin _clientHasEntitlement:](self, "_clientHasEntitlement:", v11);
  objc_msgSend(v11, "bundleID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    +[AppleIDAuthenticationPlugin _grayModeWhitelist](AppleIDAuthenticationPlugin, "_grayModeWhitelist");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "containsObject:", v13);

    if (!a6)
      goto LABEL_4;
    goto LABEL_3;
  }
  v15 = 0;
  if (a6)
LABEL_3:
    *a6 = 0;
LABEL_4:
  objc_msgSend(v10, "accountType");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "identifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isEqualToString:", *MEMORY[0x24BDB3FD8]);

  if (!v18)
  {
    v53 = self;
    v20 = v11;
    objc_msgSend(v10, "accountType");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "identifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v22, "isEqualToString:", *MEMORY[0x24BDB4020]) & 1) == 0)
    {
      objc_msgSend(v10, "accountType");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "identifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v24, "isEqualToString:", *MEMORY[0x24BDB4028]) & 1) == 0)
      {
        objc_msgSend(v10, "accountType");
        v52 = v13;
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "identifier");
        v51 = a6;
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = objc_msgSend(v32, "isEqualToString:", *MEMORY[0x24BDB4050]);

        a6 = v51;
        v13 = v52;

        v11 = v20;
        self = v53;
        if ((v50 & 1) == 0)
          goto LABEL_24;
        goto LABEL_13;
      }

    }
    v11 = v20;
    self = v53;
LABEL_13:
    objc_msgSend(v10, "parentAccount");
    v25 = v13;
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = -[AppleIDAuthenticationPlugin _isAccountInGrayMode:](self, "_isAccountInGrayMode:", v26);

    v13 = v25;
    if (((!v27 | v15) & 1) != 0)
      goto LABEL_24;
    _AALogSystem();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v11, "bundleID");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v58 = v29;
      _os_log_impl(&dword_230E5F000, v28, OS_LOG_TYPE_DEFAULT, "%@ was denied credential access due to account being in Gray Mode", buf, 0xCu);

      v13 = v25;
    }
    goto LABEL_21;
  }
  if (!v15)
  {
    if (!-[AppleIDAuthenticationPlugin _isAccountInGrayMode:](self, "_isAccountInGrayMode:", v10))
      goto LABEL_24;
    _AALogSystem();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v11, "bundleID");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v58 = v30;
      _os_log_impl(&dword_230E5F000, v28, OS_LOG_TYPE_DEFAULT, "%@ was denied credential access due to account being in Gray Mode", buf, 0xCu);

    }
LABEL_21:

    if (a6)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.appleaccount"), -10, 0);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_30;
  }
  _AALogSystem();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_230E5F000, v19, OS_LOG_TYPE_DEFAULT, "Allowing whitelisted client free access to AppleAccount credential without checking for Gray Mode.", buf, 2u);
  }

LABEL_24:
  if (!v54)
  {
LABEL_30:
    _ACDLogSystem();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v58 = v10;
      _os_log_impl(&dword_230E5F000, v35, OS_LOG_TYPE_DEFAULT, "\"AppleIDAuthenticationPlugin is withholding the credential for account %@.\", buf, 0xCu);
    }
    goto LABEL_32;
  }
  v33 = a6;
  v56 = 0;
  objc_msgSend(MEMORY[0x24BE00E88], "credentialForAccount:clientID:error:", v10, 0, &v56);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v56;
  if (v35)
  {
    _AALogSystem();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v10, "accountType");
      v37 = v13;
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "accountTypeDescription");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v58 = v39;
      v59 = 2112;
      v60 = v35;
      _os_log_impl(&dword_230E5F000, v36, OS_LOG_TYPE_DEFAULT, "Unable to get credential for %@ account! Error = %@", buf, 0x16u);

      v13 = v37;
    }

    if (v33)
    {
      v35 = objc_retainAutorelease(v35);
      *v33 = v35;

LABEL_32:
      v40 = 0;
      goto LABEL_33;
    }
LABEL_36:
    v40 = v34;
    goto LABEL_33;
  }
  objc_msgSend(v34, "token");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  if (v42)
  {

    goto LABEL_36;
  }
  v43 = v13;
  objc_msgSend(v10, "accountType");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "identifier");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend(v45, "isEqualToString:", *MEMORY[0x24BDB4050]);

  if ((v46 & 1) != 0)
  {
    v40 = v34;
  }
  else
  {
    _AALogSystem();
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_230E5F000, v47, OS_LOG_TYPE_DEFAULT, "Try to migrate the credential", buf, 2u);
    }

    -[AppleIDAuthenticationPlugin _migrateiCloudTokenIfNeededForAccount:credential:](self, "_migrateiCloudTokenIfNeededForAccount:credential:", v10, v34);
    -[AppleIDAuthenticationPlugin _migrateFMIPTokenIfNeededForAccount:credential:](self, "_migrateFMIPTokenIfNeededForAccount:credential:", v10, v34);
    v55 = v34;
    -[AppleIDAuthenticationPlugin _migrateAppleIDTokensIfNeededForAccount:credential:store:](self, "_migrateAppleIDTokensIfNeededForAccount:credential:store:", v10, &v55, v12);
    v40 = v55;

    objc_msgSend(v40, "token");
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v48)
    {
      _AALogSystem();
      v49 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_230E5F000, v49, OS_LOG_TYPE_DEFAULT, "We tried migrating the credentials for this account, it just doesn't exist", buf, 2u);
      }

    }
  }
  v13 = v43;
LABEL_33:

  return v40;
}

- (BOOL)_isAccountInGrayMode:(id)a3
{
  return MEMORY[0x24BEDD108](a3, sel_aa_isSuspended);
}

+ (id)_grayModeWhitelist
{
  if (qword_25414ADD8 != -1)
    dispatch_once(&qword_25414ADD8, &unk_24FF93E40);
  return (id)qword_25414ADD0;
}

- (AppleIDAuthenticationPlugin)init
{
  AppleIDAuthenticationPlugin *v2;
  NSMutableSet *v3;
  NSMutableSet *accountsAwaitingRemotePasswordEntry;
  AAFollowUpController *v5;
  AAFollowUpController *followUpController;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AppleIDAuthenticationPlugin;
  v2 = -[AppleIDAuthenticationPlugin init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    accountsAwaitingRemotePasswordEntry = v2->_accountsAwaitingRemotePasswordEntry;
    v2->_accountsAwaitingRemotePasswordEntry = v3;

    v5 = (AAFollowUpController *)objc_alloc_init(MEMORY[0x24BE049A0]);
    followUpController = v2->_followUpController;
    v2->_followUpController = v5;

  }
  return v2;
}

- (void)_isAccountReallyInGreyMode:(id)a3 accountStore:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  dispatch_source_t v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  dispatch_time_t v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  NSObject *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  NSObject *v30;
  id v31;
  uint8_t *v32;
  uint8_t buf[8];
  uint8_t *v34;
  uint64_t v35;
  char v36;
  _QWORD handler[4];
  id v38;
  NSObject *v39;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  _AALogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_230E5F000, v10, OS_LOG_TYPE_DEFAULT, "Make a quick round-trip to the server to see if we really need to accept new terms", buf, 2u);
  }

  v11 = objc_alloc_init(MEMORY[0x24BDD1710]);
  v12 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, MEMORY[0x24BDAC9B8]);
  v13 = MEMORY[0x24BDAC760];
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = sub_230E626D0;
  handler[3] = &unk_24FF93D70;
  v14 = v11;
  v38 = v14;
  v15 = v12;
  v39 = v15;
  dispatch_source_set_event_handler(v15, handler);
  v16 = dispatch_time(0, 10000000000);
  dispatch_source_set_timer(v15, v16, 0xFFFFFFFFFFFFFFFFLL, 0);
  *(_QWORD *)buf = 0;
  v34 = buf;
  v35 = 0x2020000000;
  v36 = 1;
  objc_msgSend(MEMORY[0x24BE00E88], "credentialForAccount:clientID:", v7, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_alloc(MEMORY[0x24BE04A88]);
  objc_msgSend(v17, "token");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v18, "initWithAccount:token:", v7, v19);

  v21 = objc_alloc(MEMORY[0x24BE04A18]);
  v27[0] = v13;
  v27[1] = 3221225472;
  v27[2] = sub_230E62748;
  v27[3] = &unk_24FF93DC0;
  v22 = v9;
  v31 = v22;
  v32 = buf;
  v23 = v7;
  v28 = v23;
  v24 = v8;
  v29 = v24;
  v25 = v15;
  v30 = v25;
  v26 = (void *)objc_msgSend(v21, "initWithRequest:handler:", v20, v27);
  objc_msgSend(v14, "addOperation:", v26);
  dispatch_resume(v25);

  _Block_object_dispose(buf, 8);
}

- (void)_showUserAlertWithTitle:(id)a3 message:(id)a4 cancelButtonTitle:(id)a5 otherButtonTitle:(id)a6 textFieldTitle:(id)a7 withCompletionBlock:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  uint64_t v24;
  id v25;
  id v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void (**v30)(_QWORD, _QWORD, _QWORD);
  const __CFAllocator *v31;
  CFOptionFlags v32;
  void *v33;
  __CFUserNotification *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  CFOptionFlags responseFlags;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v19 = v18;
  v20 = (void *)MEMORY[0x24BDBCED8];
  v21 = *MEMORY[0x24BDBD6D8];
  if (v17)
  {
    v38 = v18;
    v37 = *MEMORY[0x24BDBD720];
    v22 = v17;
    v23 = v13;
    v24 = *MEMORY[0x24BDBD6F8];
    v25 = v14;
    v26 = v15;
    v27 = *MEMORY[0x24BDBD6F0];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v27;
    v15 = v26;
    v14 = v25;
    v35 = v24;
    v13 = v23;
    v17 = v22;
    objc_msgSend(v20, "dictionaryWithObjectsAndKeys:", v13, v21, v22, v37, v15, v35, v16, v36, v28, *MEMORY[0x24BEB0E40], 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
      objc_msgSend(v29, "setObject:forKey:", v25, *MEMORY[0x24BDBD6E0]);
    v30 = (void (**)(_QWORD, _QWORD, _QWORD))objc_msgSend(v38, "copy");

    v31 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    v32 = 0x10000;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithObjectsAndKeys:", v13, v21, v15, *MEMORY[0x24BDBD6F8], v16, *MEMORY[0x24BDBD6F0], 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v33;
    if (v14)
      objc_msgSend(v33, "setObject:forKey:", v14, *MEMORY[0x24BDBD6E0]);
    v30 = (void (**)(_QWORD, _QWORD, _QWORD))objc_msgSend(v19, "copy");

    v31 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    v32 = 0;
  }
  v34 = CFUserNotificationCreate(v31, 0.0, v32, 0, (CFDictionaryRef)v29);

  responseFlags = 0;
  CFUserNotificationReceiveResponse(v34, 0.0, &responseFlags);
  if (v30)
    ((void (**)(_QWORD, __CFUserNotification *, CFOptionFlags))v30)[2](v30, v34, responseFlags);
  if (v34)
    CFRelease(v34);

}

- (BOOL)isPushSupportedForAccount:(id)a3
{
  return 1;
}

- (id)_findAndRemoveOldiCloudTokenForAccount:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint8_t v19[16];
  uint8_t buf[16];

  v3 = a3;
  v4 = (void *)MEMORY[0x24BE049B8];
  objc_msgSend(v3, "username");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "passwordForServiceName:username:accessGroup:", CFSTR("com.apple.account.AppleID.appleid-token-icloud"), v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    _AALogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_230E5F000, v7, OS_LOG_TYPE_DEFAULT, "Found an Apple ID iCloud token we can use", buf, 2u);
    }

    v8 = (void *)MEMORY[0x24BE049B8];
    objc_msgSend(v3, "username");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = CFSTR("com.apple.account.AppleID.appleid-token-icloud");
    v11 = v8;
    v12 = v9;
    v13 = 0;
LABEL_9:
    objc_msgSend(v11, "removePasswordForService:username:accessGroup:", v10, v12, v13);

    goto LABEL_10;
  }
  v14 = (void *)MEMORY[0x24BE049B8];
  objc_msgSend(v3, "username");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "passwordForServiceName:username:accessGroup:", CFSTR("Apple-token-sync"), v15, CFSTR("appleaccount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    _AALogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_230E5F000, v16, OS_LOG_TYPE_DEFAULT, "Found an old iCloud token we can use", v19, 2u);
    }

    v17 = (void *)MEMORY[0x24BE049B8];
    objc_msgSend(v3, "username");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = CFSTR("Apple-token-sync");
    v13 = CFSTR("appleaccount");
    v11 = v17;
    v12 = v9;
    goto LABEL_9;
  }
LABEL_10:

  return v6;
}

- (id)_findAndRemoveOldFMIPTokenForAccount:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint8_t v18[16];
  uint8_t buf[16];

  v3 = a3;
  v4 = (void *)MEMORY[0x24BE00E88];
  objc_msgSend(v3, "parentAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "credentialForAccount:clientID:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "findMyiPhoneToken");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    _AALogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_230E5F000, v9, OS_LOG_TYPE_DEFAULT, "Found an old FMIP token we can use, from the iCloud account", buf, 2u);
    }

    objc_msgSend(v6, "setFindMyiPhoneToken:", 0);
    objc_msgSend(v3, "parentAccount");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setCredential:", v6);

    v11 = (void *)MEMORY[0x24BE00E88];
    objc_msgSend(v3, "parentAccount");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setCredentialForAccount:", v12);
LABEL_9:

    goto LABEL_10;
  }
  v13 = (void *)MEMORY[0x24BE049B8];
  objc_msgSend(v3, "username");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "passwordForServiceName:username:accessGroup:", CFSTR("Apple-token-fmip"), v14, CFSTR("appleaccount"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    _AALogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_230E5F000, v15, OS_LOG_TYPE_DEFAULT, "Found an old FMIP token we can use", v18, 2u);
    }

    v16 = (void *)MEMORY[0x24BE049B8];
    objc_msgSend(v3, "username");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "removePasswordForService:username:accessGroup:", CFSTR("Apple-token-fmip"), v12, CFSTR("appleaccount"));
    goto LABEL_9;
  }
LABEL_10:

  return v8;
}

- (void)_migrateiCloudTokenIfNeededForAccount:(id)a3 credential:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  NSObject *v12;
  uint8_t v13[16];

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "accountType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BDB3FD8]);

  if (v10)
  {
    objc_msgSend(v7, "token");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      _AALogSystem();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_230E5F000, v12, OS_LOG_TYPE_DEFAULT, "Couldn't find the AppleAccount token in our keychain. Looking elsewhere.", v13, 2u);
      }

      -[AppleIDAuthenticationPlugin _findAndRemoveOldiCloudTokenForAccount:](self, "_findAndRemoveOldiCloudTokenForAccount:", v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        objc_msgSend(v7, "setToken:", v11);
        objc_msgSend(v6, "setCredential:", v7);
        objc_msgSend(MEMORY[0x24BE00E88], "setCredentialForAccount:", v6);
      }
    }

  }
}

- (void)_migrateFMIPTokenIfNeededForAccount:(id)a3 credential:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  NSObject *v12;
  uint8_t v13[16];

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "accountType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BDB4028]);

  if (v10)
  {
    objc_msgSend(v7, "token");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      _AALogSystem();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_230E5F000, v12, OS_LOG_TYPE_DEFAULT, "Couldn't find the FMIP token in our keychain. Looking elsewhere.", v13, 2u);
      }

      -[AppleIDAuthenticationPlugin _findAndRemoveOldFMIPTokenForAccount:](self, "_findAndRemoveOldFMIPTokenForAccount:", v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        objc_msgSend(v7, "setToken:", v11);
        objc_msgSend(v6, "setCredential:", v7);
        objc_msgSend(MEMORY[0x24BE00E88], "setCredentialForAccount:error:", v6, 0);
        objc_msgSend(v6, "setAuthenticated:", 1);
      }
    }

  }
}

- (void)_migrateAppleIDTokensIfNeededForAccount:(id)a3 credential:(id *)a4 store:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  -[AppleIDAuthenticationPlugin _accountTypeIDsThatReplacedAppleIDAccountType](self, "_accountTypeIDsThatReplacedAppleIDAccountType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "accountType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v10, "containsObject:", v12);

  if (v13)
  {
    _AALogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "accountType");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "identifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138412290;
      v26 = v16;
      _os_log_impl(&dword_230E5F000, v14, OS_LOG_TYPE_DEFAULT, "The %@ account we're dealing with is a successor of Apple ID accounts. We'll check to see if its credential is still associated with the Apple ID account, and we'll migrate it if necessary.", (uint8_t *)&v25, 0xCu);

    }
    v17 = *MEMORY[0x24BE04C40];
    objc_msgSend(v8, "accountPropertyForKey:", *MEMORY[0x24BE04C40]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      v19 = (void *)objc_opt_new();
      objc_msgSend(v19, "migrateAppleIDBasedCredentialForAccount:", v8);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      _AALogSystem();
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
      if (v20)
      {
        if (v22)
        {
          objc_msgSend(v8, "shortDebugName");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = 138412290;
          v26 = v23;
          _os_log_impl(&dword_230E5F000, v21, OS_LOG_TYPE_DEFAULT, "Success! We managed to find a credential for %@ that was associated with a stale AppleID account.", (uint8_t *)&v25, 0xCu);

        }
        *a4 = objc_retainAutorelease(v20);
        objc_msgSend(v8, "setAccountProperty:forKey:", 0, v17);
        objc_msgSend(v9, "saveVerifiedAccount:withCompletionHandler:", v8, &unk_24FF93E00);
      }
      else
      {
        if (v22)
        {
          objc_msgSend(v8, "shortDebugName");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = 138412290;
          v26 = v24;
          _os_log_impl(&dword_230E5F000, v21, OS_LOG_TYPE_DEFAULT, "Well, that didn't work. I guess the token for %@ really isn't there.", (uint8_t *)&v25, 0xCu);

        }
      }

    }
  }

}

- (id)_accountTypeIDsThatReplacedAppleIDAccountType
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[5];

  v5[4] = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BDB4060];
  v5[0] = *MEMORY[0x24BDB40A0];
  v5[1] = v2;
  v3 = *MEMORY[0x24BDB40E0];
  v5[2] = *MEMORY[0x24BDB4038];
  v5[3] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)discoverPropertiesForAccount:(id)a3 accountStore:(id)a4 options:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  os_signpost_id_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  AppleIDAuthenticationPlugin *v31;
  id v32;
  void *v33;
  uint64_t v34;
  id v35;
  void (**v36)(_QWORD, _QWORD, _QWORD);
  void *v37;
  BOOL v38;
  void *v39;
  void *v40;
  char v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  AppleIDAuthenticationPlugin *v52;
  id v53;
  id v54;
  id v55;
  _QWORD v56[4];
  id v57;
  id v58;
  id v59;
  void (**v60)(_QWORD, _QWORD, _QWORD);
  _QWORD v61[4];
  id v62;
  os_signpost_id_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  const __CFString *v68;
  uint64_t v69;
  const __CFString *v70;
  uint8_t buf[4];
  os_signpost_id_t v72;
  __int16 v73;
  void *v74;
  __int16 v75;
  void *v76;
  uint64_t v77;

  v77 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  _AASignpostLogSystem();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = _AASignpostCreate();
  v17 = v16;

  _AASignpostLogSystem();
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    objc_msgSend(v11, "client");
    v54 = v12;
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "bundleID");
    v52 = self;
    v21 = v10;
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "accountType");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "identifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v72 = (os_signpost_id_t)v22;
    v73 = 2114;
    v74 = v24;
    _os_signpost_emit_with_name_impl(&dword_230E5F000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v15, "DiscoverProperties", " Client=%{public,signpost.telemetry:string1,name=Client}@  AccountType=%{public,signpost.telemetry:string2,name=AccountType}@  enableTelemetry=YES ", buf, 0x16u);

    v10 = v21;
    self = v52;

    v12 = v54;
  }

  _AASignpostLogSystem();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v11, "client");
    v53 = v11;
    v55 = v12;
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "bundleID");
    v27 = v17;
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "accountType");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "identifier");
    v30 = v13;
    v31 = self;
    v32 = v10;
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v72 = v15;
    v73 = 2114;
    v74 = v28;
    v75 = 2114;
    v76 = v33;
    _os_log_impl(&dword_230E5F000, v25, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: DiscoverProperties  Client=%{public,signpost.telemetry:string1,name=Client}@  AccountType=%{public,signpost.telemetry:string2,name=AccountType}@  enableTelemetry=YES ", buf, 0x20u);

    v10 = v32;
    self = v31;
    v13 = v30;

    v17 = v27;
    v11 = v53;
    v12 = v55;
  }

  v34 = MEMORY[0x24BDAC760];
  v61[0] = MEMORY[0x24BDAC760];
  v61[1] = 3221225472;
  v61[2] = sub_230E63B0C;
  v61[3] = &unk_24FF93E68;
  v63 = v15;
  v64 = v17;
  v35 = v13;
  v62 = v35;
  v36 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x2348C5488](v61);
  objc_msgSend(v11, "client");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = -[AppleIDAuthenticationPlugin _clientHasEntitlement:](self, "_clientHasEntitlement:", v37);

  if (!v38)
  {
    v44 = (void *)MEMORY[0x24BDD1540];
    v45 = *MEMORY[0x24BDB4200];
    v69 = *MEMORY[0x24BDD0FC8];
    v70 = CFSTR("The application is not permitted to verify Apple ID accounts");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v70, &v69, 1);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v44;
    v48 = v45;
    v49 = 7;
LABEL_11:
    objc_msgSend(v47, "errorWithDomain:code:userInfo:", v48, v49, v46);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    ((void (**)(_QWORD, _QWORD, void *))v36)[2](v36, 0, v43);
    goto LABEL_12;
  }
  objc_msgSend(v10, "accountType");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "identifier");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "isEqualToString:", *MEMORY[0x24BDB3FD8]);

  if ((v41 & 1) == 0)
  {
    v50 = (void *)MEMORY[0x24BDD1540];
    v51 = *MEMORY[0x24BDB4200];
    v67 = *MEMORY[0x24BDD0FC8];
    v68 = CFSTR("Unsupported account type provided to -discoverPropertiesForAccount:accountStore:options:completion:");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v68, &v67, 1);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v50;
    v48 = v51;
    v49 = 4;
    goto LABEL_11;
  }
  v65 = *MEMORY[0x24BDB4528];
  v66 = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v66, &v65, 1);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v56[0] = v34;
  v56[1] = 3221225472;
  v56[2] = sub_230E63CD8;
  v56[3] = &unk_24FF93EB8;
  v57 = v12;
  v60 = v36;
  v58 = v10;
  v59 = v11;
  objc_msgSend(v59, "aa_updatePropertiesForAppleAccount:options:completion:", v58, v42, v56);

  v43 = v57;
LABEL_12:

}

- (void)verifyCredentialsForAccount:(id)a3 accountStore:(id)a4 options:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  void *v12;
  os_signpost_id_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  void (**v29)(_QWORD, _QWORD, _QWORD);
  void *v30;
  BOOL v31;
  _BOOL4 v32;
  NSObject *v33;
  _BOOL4 v34;
  AppleIDAuthenticationPlugin *v35;
  NSMutableSet *accountsAwaitingRemotePasswordEntry;
  void *v37;
  NSObject *v38;
  id v39;
  void *v40;
  void *v41;
  NSString *passwordlessToken;
  NSString *idmsDataToken;
  NSObject *v44;
  uint64_t v45;
  uint64_t v46;
  NSObject *v47;
  id v48;
  id v49;
  _QWORD v50[4];
  id v51;
  void (**v52)(_QWORD, _QWORD, _QWORD);
  _QWORD v53[4];
  id v54;
  void (**v55)(_QWORD, _QWORD, _QWORD);
  _QWORD v56[4];
  id v57;
  os_signpost_id_t v58;
  uint64_t v59;
  uint64_t v60;
  const __CFString *v61;
  uint8_t buf[4];
  os_signpost_id_t v63;
  __int16 v64;
  void *v65;
  __int16 v66;
  void *v67;
  uint64_t v68;

  v68 = *MEMORY[0x24BDAC8D0];
  v49 = a3;
  v10 = a4;
  v48 = a5;
  v11 = a6;
  _AASignpostLogSystem();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = _AASignpostCreate();
  v15 = v14;

  _AASignpostLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    objc_msgSend(v10, "client");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "bundleID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "accountType");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "identifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v63 = (os_signpost_id_t)v19;
    v64 = 2114;
    v65 = v21;
    _os_signpost_emit_with_name_impl(&dword_230E5F000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v13, "VerifyCredentials", " Client=%{public,signpost.telemetry:string1,name=Client}@  AccountType=%{public,signpost.telemetry:string2,name=AccountType}@  enableTelemetry=YES ", buf, 0x16u);

  }
  _AASignpostLogSystem();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v10, "client");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "bundleID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "accountType");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "identifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v63 = v13;
    v64 = 2114;
    v65 = v24;
    v66 = 2114;
    v67 = v26;
    _os_log_impl(&dword_230E5F000, v22, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: VerifyCredentials  Client=%{public,signpost.telemetry:string1,name=Client}@  AccountType=%{public,signpost.telemetry:string2,name=AccountType}@  enableTelemetry=YES ", buf, 0x20u);

  }
  v27 = MEMORY[0x24BDAC760];
  v56[0] = MEMORY[0x24BDAC760];
  v56[1] = 3221225472;
  v56[2] = sub_230E645B8;
  v56[3] = &unk_24FF93E68;
  v58 = v13;
  v59 = v15;
  v28 = v11;
  v57 = v28;
  v29 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x2348C5488](v56);
  objc_msgSend(v10, "client");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = -[AppleIDAuthenticationPlugin _clientHasEntitlement:](self, "_clientHasEntitlement:", v30);

  if (v31)
  {
    v32 = +[AppleIDAuthenticationUtil doesRelyOnCompanionAccounts](AppleIDAuthenticationUtil, "doesRelyOnCompanionAccounts");
    _AALogSystem();
    v33 = objc_claimAutoreleasedReturnValue();
    v34 = os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT);
    if (v32)
    {
      if (v34)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_230E5F000, v33, OS_LOG_TYPE_DEFAULT, "Device relies on companion auth, proceeding...", buf, 2u);
      }

      v35 = self;
      objc_sync_enter(v35);
      accountsAwaitingRemotePasswordEntry = v35->_accountsAwaitingRemotePasswordEntry;
      objc_msgSend(v49, "identifier");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(accountsAwaitingRemotePasswordEntry) = -[NSMutableSet containsObject:](accountsAwaitingRemotePasswordEntry, "containsObject:", v37);

      objc_sync_exit(v35);
      if ((_DWORD)accountsAwaitingRemotePasswordEntry)
      {
        _AALogSystem();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v63 = (os_signpost_id_t)v49;
          _os_log_impl(&dword_230E5F000, v38, OS_LOG_TYPE_DEFAULT, "Warning! verifyCredentials is ignoring request for account %@ because we are waiting for a password for that account from ACRemoteDeviceProxy", buf, 0xCu);
        }

        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.appleaccount"), -4, 0);
        v39 = (id)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, _QWORD, id))v29)[2](v29, 0, v39);
      }
      else
      {
        passwordlessToken = v35->_passwordlessToken;
        v35->_passwordlessToken = 0;

        idmsDataToken = v35->_idmsDataToken;
        v35->_idmsDataToken = 0;

        if (v48)
        {
          _AALogSystem();
          v44 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_230E5F000, v44, OS_LOG_TYPE_DEFAULT, "AppleIDAuthenticationPlugin will use provided options for login.", buf, 2u);
          }

          objc_msgSend(v48, "objectForKeyedSubscript:", *MEMORY[0x24BE04C10]);
          v45 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "objectForKeyedSubscript:", *MEMORY[0x24BE04C18]);
          v46 = objc_claimAutoreleasedReturnValue();
          if (v45 | v46)
          {
            v39 = objc_alloc_init(MEMORY[0x24BE0AD68]);
            objc_msgSend(v39, "setServerFriendlyDescription:", v45);
            objc_msgSend(v39, "setUniqueDeviceIdentifier:", v46);
            objc_msgSend(v39, "setLinkType:", 2);
          }
          else
          {
            v39 = 0;
          }

        }
        else
        {
          v39 = 0;
        }
        _AALogSystem();
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v63 = (os_signpost_id_t)v49;
          _os_log_impl(&dword_230E5F000, v47, OS_LOG_TYPE_DEFAULT, "Logging in with account %@....", buf, 0xCu);
        }

        v53[0] = v27;
        v53[1] = 3221225472;
        v53[2] = sub_230E64784;
        v53[3] = &unk_24FF93EE0;
        v55 = v29;
        v54 = v49;
        -[AppleIDAuthenticationPlugin _loginWithAccount:store:companionDevice:options:completion:](v35, "_loginWithAccount:store:companionDevice:options:completion:", v54, v10, v39, v48, v53);

      }
    }
    else
    {
      if (v34)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_230E5F000, v33, OS_LOG_TYPE_DEFAULT, "Device suppoprts standalone auth, proceeding...", buf, 2u);
      }

      v50[0] = v27;
      v50[1] = 3221225472;
      v50[2] = sub_230E647A4;
      v50[3] = &unk_24FF93EE0;
      v52 = v29;
      v51 = v49;
      -[AppleIDAuthenticationPlugin _fetchTokenForAccount:accountStore:withHandler:](self, "_fetchTokenForAccount:accountStore:withHandler:", v51, v10, v50);

      v39 = v52;
    }
  }
  else
  {
    v40 = (void *)MEMORY[0x24BDD1540];
    v60 = *MEMORY[0x24BDD0FC8];
    v61 = CFSTR("The application is not permitted to verify Apple ID accounts");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v61, &v60, 1);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB4200], 7, v41);
    v39 = (id)objc_claimAutoreleasedReturnValue();

    ((void (**)(_QWORD, _QWORD, id))v29)[2](v29, 0, v39);
  }

}

- (void)_loginWithAccount:(id)a3 store:(id)a4 companionDevice:(id)a5 options:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;
  id v28;
  id v29;
  uint8_t buf[4];
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a7;
  v15 = *MEMORY[0x24BDB4520];
  v16 = a5;
  objc_msgSend(a6, "objectForKeyedSubscript:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  _AALogSystem();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v31 = v12;
    _os_log_impl(&dword_230E5F000, v18, OS_LOG_TYPE_DEFAULT, "Trying password-less login with account %@ with the help of Companion's Anisette data.", buf, 0xCu);
  }

  objc_msgSend(v12, "username");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "aa_altDSID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = sub_230E6499C;
  v25[3] = &unk_24FF93F08;
  v25[4] = self;
  v26 = v12;
  v27 = v13;
  v28 = v17;
  v29 = v14;
  v21 = v14;
  v22 = v17;
  v23 = v13;
  v24 = v12;
  -[AppleIDAuthenticationPlugin _silentlyAuthenticateAppleID:altDSID:companionDevice:services:completion:](self, "_silentlyAuthenticateAppleID:altDSID:companionDevice:services:completion:", v19, v20, v16, v22, v25);

}

- (void)_tryPasswordLoginWithAccount:(id)a3 store:(id)a4 services:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  uint8_t buf[4];
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(v10, "credential");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "credentialItemForKey:", *MEMORY[0x24BDB42F8]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
    goto LABEL_5;
  _AALogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    sub_230E6B7B0();

  objc_msgSend(v10, "credential");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "credentialItemForKey:", *MEMORY[0x24BDB4280]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
LABEL_5:
    _AALogSystem();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v29 = v10;
      _os_log_impl(&dword_230E5F000, v18, OS_LOG_TYPE_DEFAULT, "Trying password-based login for account %@...", buf, 0xCu);
    }

    objc_msgSend(v10, "username");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "aa_altDSID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = sub_230E64EF0;
    v24[3] = &unk_24FF93F30;
    v24[4] = self;
    v25 = v10;
    v26 = v11;
    v27 = v13;
    -[AppleIDAuthenticationPlugin _convertPasswordToPETForAppleID:altDSID:password:services:completion:](self, "_convertPasswordToPETForAppleID:altDSID:password:services:completion:", v19, v20, v15, v12, v24);

  }
  else
  {
    _AALogSystem();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v29 = v10;
      _os_log_impl(&dword_230E5F000, v21, OS_LOG_TYPE_DEFAULT, "_tryPasswordLoginWithAccount: we do not have a password for %@. Login has officially failed.", buf, 0xCu);
    }

    v22 = (void *)MEMORY[0x24BDD1540];
    -[AppleIDAuthenticationPlugin _parametersForProxiedAuthentication](self, "_parametersForProxiedAuthentication");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "errorWithDomain:code:userInfo:", CFSTR("com.apple.appleaccount"), -7, v15);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v13 + 2))(v13, 0, v23);

  }
}

- (void)_silentlyAuthenticateAppleID:(id)a3 altDSID:(id)a4 companionDevice:(id)a5 services:(id)a6 completion:(id)a7
{
  objc_class *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;

  v11 = (objc_class *)MEMORY[0x24BE0ACB8];
  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v18 = objc_alloc_init(v11);
  objc_msgSend(v18, "setAltDSID:", v15);

  objc_msgSend(v18, "setCompanionDevice:", v14);
  objc_msgSend(v18, "setIsUsernameEditable:", 0);
  objc_msgSend(v18, "setAuthenticationType:", 1);
  objc_msgSend(v18, "setShouldUpdatePersistentServiceTokens:", 1);
  objc_msgSend(v18, "setServiceIdentifiers:", v13);

  objc_msgSend(v18, "setUsername:", v16);
  v17 = objc_alloc_init(MEMORY[0x24BE0ACC0]);
  objc_msgSend(v17, "authenticateWithContext:completion:", v18, v12);

}

- (void)_convertPasswordToPETForAppleID:(id)a3 altDSID:(id)a4 password:(id)a5 services:(id)a6 completion:(id)a7
{
  id v11;
  id v12;
  objc_class *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;

  v11 = a3;
  v12 = a7;
  v13 = (objc_class *)MEMORY[0x24BE0ACB8];
  v14 = a6;
  v15 = a5;
  v16 = a4;
  v17 = objc_alloc_init(v13);
  objc_msgSend(v17, "setAltDSID:", v16);

  objc_msgSend(v17, "setIsUsernameEditable:", 0);
  objc_msgSend(v17, "setServiceIdentifiers:", v14);

  objc_msgSend(v17, "setAuthenticationType:", 1);
  objc_msgSend(v17, "setShouldUpdatePersistentServiceTokens:", 1);
  objc_msgSend(v17, "setUsername:", v11);
  objc_msgSend(v17, "_setPassword:", v15);

  objc_msgSend(v17, "_setProxyingForApp:", 1);
  v18 = objc_alloc_init(MEMORY[0x24BE0ACC0]);
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = sub_230E6524C;
  v21[3] = &unk_24FF93F58;
  v22 = v11;
  v23 = v12;
  v19 = v11;
  v20 = v12;
  objc_msgSend(v18, "authenticateWithContext:completion:", v17, v21);

}

- (id)_parametersForProxiedAuthentication
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint8_t v8[8];
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE0AD68], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLinkType:", 2);
  objc_msgSend(v2, "serializedData");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    v9 = *MEMORY[0x24BE04B98];
    v10[0] = v3;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _AALogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_230E5F000, v6, OS_LOG_TYPE_DEFAULT, "Failed to encode AKDevice! Proxied auth is doomed.", v8, 2u);
    }

    v5 = 0;
  }

  return v5;
}

- (void)_beginPETBasedLoginWithAccount:(id)a3 PET:(id)a4 store:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  char v15;
  NSObject *v16;
  _BOOL4 v17;
  int v18;
  void *v19;
  os_signpost_id_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  _QWORD v28[5];
  id v29;
  id v30;
  id v31;
  os_signpost_id_t v32;
  uint64_t v33;
  _QWORD v34[5];
  id v35;
  id v36;
  id v37;
  os_signpost_id_t v38;
  uint64_t v39;
  uint8_t buf[4];
  os_signpost_id_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  objc_msgSend(v10, "aa_setPassword:", a4);
  objc_msgSend(v10, "accountType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isEqual:", *MEMORY[0x24BDB3FD8]);

  _AALogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
  if ((v15 & 1) != 0)
  {
    if (v17)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_230E5F000, v16, OS_LOG_TYPE_DEFAULT, "iCloud account. Will talk to SetupService now...", buf, 2u);
    }

    v18 = objc_msgSend(MEMORY[0x24BE049F8], "shouldUseUnifiedLoginEndpoint");
    _AASignpostLogSystem();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = _AASignpostCreate();
    v22 = v21;

    _AASignpostLogSystem();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v18)
    {
      if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_230E5F000, v24, OS_SIGNPOST_INTERVAL_BEGIN, v20, "LoginAndUpdateAccount", " enableTelemetry=YES ", buf, 2u);
      }

      _AASignpostLogSystem();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v41 = v20;
        _os_log_impl(&dword_230E5F000, v25, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: LoginAndUpdateAccount  enableTelemetry=YES ", buf, 0xCu);
      }

      -[AppleIDAuthenticationPlugin _loginDelegatesParameters](self, "_loginDelegatesParameters");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v34[0] = MEMORY[0x24BDAC760];
      v34[1] = 3221225472;
      v34[2] = sub_230E658B4;
      v34[3] = &unk_24FF93F80;
      v38 = v20;
      v39 = v22;
      v34[4] = self;
      v35 = v10;
      v36 = v11;
      v37 = v12;
      objc_msgSend(v36, "aa_loginAndUpdateiCloudAccount:delegateParams:withCompletion:", v35, v26, v34);

    }
    else
    {
      if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_230E5F000, v24, OS_SIGNPOST_INTERVAL_BEGIN, v20, "SignInRegisterAccount", " enableTelemetry=YES ", buf, 2u);
      }

      _AASignpostLogSystem();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v41 = v20;
        _os_log_impl(&dword_230E5F000, v27, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: SignInRegisterAccount  enableTelemetry=YES ", buf, 0xCu);
      }

      v28[0] = MEMORY[0x24BDAC760];
      v28[1] = 3221225472;
      v28[2] = sub_230E65A8C;
      v28[3] = &unk_24FF93FA8;
      v32 = v20;
      v33 = v22;
      v28[4] = self;
      v29 = v10;
      v30 = v11;
      v31 = v12;
      objc_msgSend(v30, "aa_registerAppleAccountWithHSA:completion:", v29, v28);

    }
  }
  else
  {
    if (v17)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_230E5F000, v16, OS_LOG_TYPE_DEFAULT, "Not an iCloud account. Going straight to delegate login...", buf, 2u);
    }

    -[AppleIDAuthenticationPlugin _fetchTokenForAccount:accountStore:withHandler:](self, "_fetchTokenForAccount:accountStore:withHandler:", v10, v11, v12);
  }

}

- (void)renewCredentialsForAccount:(id)a3 accountStore:(id)a4 options:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  os_signpost_id_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  AppleIDAuthenticationPlugin *v22;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  os_signpost_id_t v31;
  id v32;
  id v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  id v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  id v53;
  AppleIDAuthenticationPlugin *v54;
  _QWORD v55[5];
  id v56;
  id v57;
  id v58;
  id v59;
  os_signpost_id_t v60;
  uint64_t v61;
  uint8_t buf[4];
  os_signpost_id_t v63;
  __int16 v64;
  void *v65;
  __int16 v66;
  void *v67;
  __int16 v68;
  int v69;
  uint64_t v70;

  v70 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  _AASignpostLogSystem();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = _AASignpostCreate();
  v17 = v16;

  _AASignpostLogSystem();
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    objc_msgSend(v11, "client");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "bundleID");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "accountType");
    v51 = v17;
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "identifier");
    v53 = v13;
    v21 = v12;
    v22 = self;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = *MEMORY[0x24BDB4530];
    v25 = v21;
    objc_msgSend(v25, "objectForKeyedSubscript:", v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "BOOLValue");

    objc_msgSend(v25, "objectForKeyedSubscript:", *MEMORY[0x24BDB4528]);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "BOOLValue");

    objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("AARenewShouldForceInteraction"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v28, "BOOLValue");
    *(_DWORD *)buf = 138543874;
    v63 = (os_signpost_id_t)v47;
    v64 = 2114;
    v65 = v23;
    v66 = 1026;
    LODWORD(v67) = 0;
    _os_signpost_emit_with_name_impl(&dword_230E5F000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v15, "RenewCredentials", " Client=%{public,signpost.telemetry:string1,name=Client}@  AccountType=%{public,signpost.telemetry:string2,name=AccountType}@  Options=%{public,signpost.telemetry:number1,name=Options}d  enableTelemetry=YES ", buf, 0x1Cu);

    self = v22;
    v12 = v21;
    v13 = v53;

    v17 = v51;
  }

  _AASignpostLogSystem();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v11, "client");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "bundleID");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "accountType");
    v54 = self;
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "identifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v15;
    v32 = v13;
    v33 = v11;
    v34 = v10;
    v35 = *MEMORY[0x24BDB4530];
    v36 = v17;
    v37 = v12;
    v38 = v12;
    objc_msgSend(v38, "objectForKeyedSubscript:", v35);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "BOOLValue");

    objc_msgSend(v38, "objectForKeyedSubscript:", *MEMORY[0x24BDB4528]);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "BOOLValue");

    objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("AARenewShouldForceInteraction"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = v37;
    v17 = v36;
    objc_msgSend(v41, "BOOLValue");

    v10 = v34;
    v11 = v33;
    v13 = v32;
    v15 = v31;
    *(_DWORD *)buf = 134218754;
    v63 = v31;
    v64 = 2114;
    v65 = v48;
    v66 = 2114;
    v67 = v30;
    v68 = 1026;
    v69 = 0;
    _os_log_impl(&dword_230E5F000, v29, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: RenewCredentials  Client=%{public,signpost.telemetry:string1,name=Client}@  AccountType=%{public,signpost.telemetry:string2,name=AccountType}@  Options=%{public,signpost.telemetry:number1,name=Options}d  enableTelemetry=YES ", buf, 0x26u);

    self = v54;
  }

  v55[0] = MEMORY[0x24BDAC760];
  v55[1] = 3221225472;
  v55[2] = sub_230E660B8;
  v55[3] = &unk_24FF93FD0;
  v60 = v15;
  v61 = v17;
  v55[4] = self;
  v56 = v10;
  v57 = v11;
  v58 = v12;
  v59 = v13;
  v42 = v13;
  v43 = v12;
  v44 = v11;
  v45 = v10;
  v46 = (void *)MEMORY[0x2348C5488](v55);
  -[AppleIDAuthenticationPlugin _renewCredentialsForAccount:accountStore:options:errorMessage:completion:](self, "_renewCredentialsForAccount:accountStore:options:errorMessage:completion:", v45, v44, v43, 0, v46);

}

- (void)_handleRenewFailure:(id)a3 forAccount:(id)a4 accountStore:(id)a5 options:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void (**v16)(id, uint64_t, id);
  NSObject *v17;
  id v18;
  void (**v19)(id, uint64_t, id);
  void *v20;
  NSObject *v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  AppleIDAuthenticationPlugin *v26;
  id v27;
  void (**v28)(id, uint64_t, id);
  id v29;
  _QWORD v30[5];
  id v31;
  id v32;
  void (**v33)(id, uint64_t, id);
  uint8_t buf[4];
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = (void (**)(id, uint64_t, id))a7;
  if (!+[AppleIDAuthenticationUtil doesRelyOnCompanionAccounts](AppleIDAuthenticationUtil, "doesRelyOnCompanionAccounts"))goto LABEL_10;
  if (objc_msgSend(v12, "ak_isAuthenticationErrorWithCode:", -7026))
  {
    _AALogSystem();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_230E6B7DC();
LABEL_9:

LABEL_10:
    v16[2](v16, 2, v12);
    goto LABEL_11;
  }
  if ((objc_msgSend(v12, "ak_isServiceError") & 1) != 0
    || objc_msgSend(v12, "ak_isAuthenticationErrorWithCode:", -7065))
  {
    _AALogSystem();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_230E6B814();
    goto LABEL_9;
  }
  v30[0] = MEMORY[0x24BDAC760];
  v30[1] = 3221225472;
  v30[2] = sub_230E6654C;
  v30[3] = &unk_24FF94020;
  v30[4] = self;
  v18 = v13;
  v31 = v18;
  v23 = v14;
  v32 = v23;
  v19 = v16;
  v33 = v19;
  v20 = (void *)MEMORY[0x2348C5488](v30);
  _AALogSystem();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v35 = v18;
    _os_log_impl(&dword_230E5F000, v21, OS_LOG_TYPE_DEFAULT, "AppleIDAuthenticationPlugin: could not silently obtain PET for account %@", buf, 0xCu);
  }

  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = sub_230E665F4;
  v24[3] = &unk_24FF94070;
  v28 = v19;
  v25 = v15;
  v26 = self;
  v27 = v18;
  v29 = v20;
  v22 = v20;
  -[AppleIDAuthenticationPlugin _getPasswordFromCompanionForAccount:store:options:completion:](self, "_getPasswordFromCompanionForAccount:store:options:completion:", v27, v23, v25, v24);

LABEL_11:
}

- (void)_getPasswordFromCompanionForAccount:(id)a3 store:(id)a4 options:(id)a5 completion:(id)a6
{
  id v10;
  void (**v11)(id, _QWORD, const __CFDictionary *);
  void *v12;
  NSObject *v13;
  const __CFDictionary *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  CFUserNotificationRef v21;
  NSObject *v22;
  _BOOL4 v23;
  const char *v24;
  void *v25;
  void *v26;
  AppleIDAuthenticationPlugin *v27;
  NSMutableSet *accountsAwaitingRemotePasswordEntry;
  void *v29;
  NSObject *v30;
  void *v31;
  uint64_t v32;
  id v33;
  id v34;
  _QWORD v35[5];
  id v36;
  void (**v37)(id, _QWORD, const __CFDictionary *);
  CFUserNotificationRef v38;
  uint8_t buf[4];
  id v40;
  __int16 v41;
  void *v42;
  _QWORD v43[4];
  _QWORD v44[6];

  v44[4] = *MEMORY[0x24BDAC8D0];
  v34 = a3;
  v33 = a4;
  v10 = a5;
  v11 = (void (**)(id, _QWORD, const __CFDictionary *))a6;
  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BDB4528]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a5) = objc_msgSend(v12, "BOOLValue");

  if ((_DWORD)a5)
  {
    _AALogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_230E5F000, v13, OS_LOG_TYPE_DEFAULT, "Can't get password from companion, told to avoid UI", buf, 2u);
    }

    objc_msgSend(MEMORY[0x24BDD1540], "aa_errorWithCode:underlyingError:", -4405, 0);
    v14 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    v11[2](v11, 0, v14);
    goto LABEL_16;
  }
  v43[0] = *MEMORY[0x24BDBD6D8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("PASSWORD_ENTRY_REQUIRED_TITLE"), &stru_24FF94758, CFSTR("Localizable"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = v16;
  v43[1] = *MEMORY[0x24BDBD6E0];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("PASSWORD_ENTRY_REQUIRED_MESSAGE"), &stru_24FF94758, CFSTR("Localizable"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v44[1] = v18;
  v43[2] = *MEMORY[0x24BDBD6F8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("PASSWORD_ENTRY_DISMISS_BUTTON"), &stru_24FF94758, CFSTR("Localizable"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v44[2] = v20;
  v43[3] = *MEMORY[0x24BDBD6E8];
  v44[3] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v44, v43, 4);
  v14 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  v21 = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], 0.0, 0, 0, v14);
  _AALogSystem();
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
  if (v21)
  {
    if (v23)
    {
      *(_WORD *)buf = 0;
      v24 = "Showing renew-credentials prompt...";
LABEL_10:
      _os_log_impl(&dword_230E5F000, v22, OS_LOG_TYPE_DEFAULT, v24, buf, 2u);
    }
  }
  else if (v23)
  {
    *(_WORD *)buf = 0;
    v24 = "CFUserNotificationCreate in renewCredentials!";
    goto LABEL_10;
  }

  v25 = (void *)objc_msgSend(v10, "mutableCopy");
  -[AppleIDAuthenticationPlugin _parametersForProxiedAuthentication](self, "_parametersForProxiedAuthentication");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
    objc_msgSend(v25, "addEntriesFromDictionary:", v26);
  v27 = self;
  objc_sync_enter(v27);
  accountsAwaitingRemotePasswordEntry = v27->_accountsAwaitingRemotePasswordEntry;
  objc_msgSend(v34, "identifier");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet addObject:](accountsAwaitingRemotePasswordEntry, "addObject:", v29);

  objc_sync_exit(v27);
  _AALogSystem();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v40 = v34;
    v41 = 2112;
    v42 = v25;
    _os_log_impl(&dword_230E5F000, v30, OS_LOG_TYPE_DEFAULT, "Asking ACRemoteDeviceProxy to obtain password for account %@ with options: %@", buf, 0x16u);
  }

  objc_msgSend(v33, "remoteDeviceProxy");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = *MEMORY[0x24BDB4500];
  v35[0] = MEMORY[0x24BDAC760];
  v35[1] = 3221225472;
  v35[2] = sub_230E66CE0;
  v35[3] = &unk_24FF94098;
  v38 = v21;
  v35[4] = v27;
  v36 = v34;
  v37 = v11;
  objc_msgSend(v31, "sendCommand:withAccount:options:completion:", v32, v36, v25, v35);

LABEL_16:
}

- (void)_renewCredentialsForAccount:(id)a3 accountStore:(id)a4 options:(id)a5 errorMessage:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void (**v16)(id, uint64_t, void *);
  void *v17;
  BOOL v18;
  unsigned int (*v19)(void);
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _BOOL4 v28;
  void *v29;
  _QWORD v30[5];
  id v31;
  id v32;
  id v33;
  id v34;
  void (**v35)(id, uint64_t, void *);
  _QWORD v36[5];
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  const __CFString *v42;
  uint64_t v43;
  const __CFString *v44;
  uint64_t v45;
  _QWORD v46[3];

  v46[1] = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = (void (**)(id, uint64_t, void *))a7;
  objc_msgSend(v13, "client");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[AppleIDAuthenticationPlugin _clientHasEntitlement:](self, "_clientHasEntitlement:", v17);

  if (v18)
  {
    v37 = 0;
    v38 = &v37;
    v39 = 0x2020000000;
    v19 = (unsigned int (*)(void))off_25414ADC8;
    v40 = off_25414ADC8;
    if (!off_25414ADC8)
    {
      v36[0] = MEMORY[0x24BDAC760];
      v36[1] = 3221225472;
      v36[2] = sub_230E6B4E0;
      v36[3] = &unk_24FF94400;
      v36[4] = &v37;
      sub_230E6B4E0((uint64_t)v36);
      v19 = (unsigned int (*)(void))v38[3];
    }
    _Block_object_dispose(&v37, 8);
    if (!v19)
      sub_230E6B874();
    if (v19())
    {
      v20 = (void *)MEMORY[0x24BDD1540];
      v43 = *MEMORY[0x24BDD0FC8];
      v44 = CFSTR("SetupAssistant is running SLT upgrade, force-failing credential renewal.");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB4200], 17, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v16[2](v16, 2, v22);
    }
    else if (DMIsMigrationNeeded())
    {
      v25 = (void *)MEMORY[0x24BDD1540];
      v41 = *MEMORY[0x24BDD0FC8];
      v42 = CFSTR("DataMigration is needed, force-failing credential renewal.");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB4200], 17, v26);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v16[2](v16, 2, v22);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BE00E88], "credentialForAccount:clientID:", v12, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "token");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (v27)
      {
        v28 = 0;
      }
      else
      {
        objc_msgSend(v22, "password");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v29 == 0;

      }
      if (!-[AppleIDAuthenticationPlugin _isAccountInGrayMode:](self, "_isAccountInGrayMode:", v12) || v28)
      {
        -[AppleIDAuthenticationPlugin _authenticateAccount:inStore:options:errorMessage:completion:](self, "_authenticateAccount:inStore:options:errorMessage:completion:", v12, v13, v14, v15, v16);
      }
      else
      {
        v30[0] = MEMORY[0x24BDAC760];
        v30[1] = 3221225472;
        v30[2] = sub_230E6742C;
        v30[3] = &unk_24FF940C0;
        v35 = v16;
        v30[4] = self;
        v31 = v12;
        v32 = v13;
        v33 = v14;
        v34 = v15;
        -[AppleIDAuthenticationPlugin _isAccountReallyInGreyMode:accountStore:completion:](self, "_isAccountReallyInGreyMode:accountStore:completion:", v31, v32, v30);

      }
    }
  }
  else
  {
    v23 = (void *)MEMORY[0x24BDD1540];
    v45 = *MEMORY[0x24BDD0FC8];
    v46[0] = CFSTR("The application is not permitted to renew Apple ID account credentials.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v46, &v45, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB4200], 7, v24);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v16[2](v16, 2, v22);
  }

}

- (id)_frontmostApplicationId
{
  return (id)SBSCopyFrontmostApplicationDisplayIdentifier();
}

- (void)_authenticateAccount:(id)a3 inStore:(id)a4 options:(id)a5 errorMessage:(id)a6 completion:(id)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  NSObject *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  char v29;
  void *v30;
  void *v31;
  char v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  void (**v42)(_QWORD);
  void *v43;
  char v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  id v50;
  _QWORD v52[4];
  void (**v53)(_QWORD);
  _QWORD v54[4];
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  AppleIDAuthenticationPlugin *v61;
  id v62;
  id v63;
  id v64;
  uint64_t v65;
  char v66;
  char v67;
  char v68;
  char v69;
  uint8_t buf[4];
  void *v71;
  __int16 v72;
  void *v73;
  uint64_t v74;

  v74 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v49 = a6;
  v50 = a7;
  objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x24BDB4518]);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("AARenewShouldForceInteraction"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v12;
  if ((objc_msgSend(v14, "BOOLValue") & 1) == 0)
  {

    goto LABEL_7;
  }
  objc_msgSend(v12, "client");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "name");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("findmydeviced"));

  if (!v17)
  {
LABEL_7:
    v21 = 0;
    goto LABEL_8;
  }
  _AALogSystem();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v12, "client");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "name");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v71 = v20;
    _os_log_impl(&dword_230E5F000, v18, OS_LOG_TYPE_DEFAULT, "Allow %@ to force interactive auth.", buf, 0xCu);

  }
  v21 = 1;
LABEL_8:
  objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x24BDB4528]);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v22, "BOOLValue");

  objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x24BDB4510]);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)*MEMORY[0x24BDB4508];
  objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x24BDB4508]);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x24BDB4520]);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x24BE04B98]);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE0AD68], "deviceWithSerializedData:");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v25;
  if (v25 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    _AALogSystem();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v71 = v24;
      v72 = 2112;
      v73 = v25;
      _os_log_impl(&dword_230E5F000, v28, OS_LOG_TYPE_DEFAULT, "Error! Invalid value type for key %@ in renewCredentials options: %@.", buf, 0x16u);
    }

    v27 = 0;
  }
  else
  {
    v27 = objc_msgSend(v25, "integerValue");
  }
  v29 = objc_msgSend(v11, "isAuthenticated");
  objc_msgSend(v11, "accountType");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "identifier");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "isEqualToString:", *MEMORY[0x24BDB3FD8]);

  v54[0] = MEMORY[0x24BDAC760];
  v54[1] = 3221225472;
  v54[2] = sub_230E67AE8;
  v54[3] = &unk_24FF941B0;
  v33 = v11;
  v55 = v33;
  v34 = v46;
  v56 = v34;
  v66 = v21;
  v35 = v48;
  v57 = v35;
  v36 = v23;
  v58 = v36;
  v37 = v26;
  v67 = v44;
  v59 = v37;
  v65 = v27;
  v68 = v32;
  v38 = v43;
  v60 = v38;
  v61 = self;
  v39 = v13;
  v62 = v39;
  v40 = v49;
  v63 = v40;
  v41 = v50;
  v64 = v41;
  v69 = v29;
  v42 = (void (**)(_QWORD))MEMORY[0x2348C5488](v54);
  if (objc_msgSend(v33, "isAuthenticated"))
  {
    objc_msgSend(v33, "setAuthenticated:", 0);
    v52[0] = MEMORY[0x24BDAC760];
    v52[1] = 3221225472;
    v52[2] = sub_230E68660;
    v52[3] = &unk_24FF941D8;
    v53 = v42;
    objc_msgSend(v35, "saveAccount:withHandler:", v33, v52);

  }
  else
  {
    v42[2](v42);
  }

}

- (id)_userInfoForRenewCredentialsFollowUpWithAccountStore:(id)a3 proxiedDevice:(id)a4
{
  id v5;
  objc_class *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint8_t v15[16];

  v5 = a4;
  v6 = (objc_class *)MEMORY[0x24BDBCED8];
  v7 = a3;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithCapacity:", 1);
  objc_msgSend(v7, "client");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "adamOrDisplayID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, *MEMORY[0x24BE04860]);
  objc_msgSend(v5, "serializedData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    _AALogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_230E5F000, v12, OS_LOG_TYPE_DEFAULT, "Adding proxied device identifier to renew follow up user info.", v15, 2u);
    }

    objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, *MEMORY[0x24BE04868]);
  }
  v13 = (void *)objc_msgSend(v8, "copy");

  return v13;
}

- (void)_validateAuthenticationResults:(id)a3 error:(id)a4 forContext:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, BOOL);
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  const char *v18;
  BOOL v19;
  void *v21;
  NSObject *v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  AppleIDAuthenticationPlugin *v28;
  _QWORD v29[4];
  id v30;
  void (**v31)(id, BOOL);
  uint8_t buf[4];
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a5;
  v12 = (void (**)(id, BOOL))a6;
  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BE0ABD0]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "clientInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("account"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("accountStore"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "serviceType") == 2)
  {
    _AALogSystem();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v18 = "AppleIDAuthenticationPlugin: will not try to log in delegates, because this is an iTunes login.";
LABEL_14:
      _os_log_impl(&dword_230E5F000, v17, OS_LOG_TYPE_DEFAULT, v18, buf, 2u);
      goto LABEL_15;
    }
    goto LABEL_15;
  }
  if (v13)
    v19 = v15 == 0;
  else
    v19 = 1;
  if (v19 || v16 == 0)
  {
    _AALogSystem();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v18 = "AppleIDAuthenticationPlugin: will not call loginDelegates, because we are missing critical info.";
      goto LABEL_14;
    }
LABEL_15:

LABEL_16:
    v12[2](v12, a4 == 0);
    goto LABEL_17;
  }
  v28 = self;
  objc_msgSend(v11, "proxiedDevice");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  _AALogSystem();
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
  if (v21)
  {
    if (v23)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_230E5F000, v22, OS_LOG_TYPE_DEFAULT, "AppleIDAuthenticationPlugin: will not call loginDelegates, because this is a proxied device authentication.", buf, 2u);
    }

    goto LABEL_16;
  }
  if (v23)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_230E5F000, v22, OS_LOG_TYPE_DEFAULT, "AppleIDAuthenticationPlugin: will attempt loginDelegates...", buf, 2u);
  }

  objc_msgSend(v15, "credential");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    objc_msgSend(v15, "credential");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setPassword:", v13);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDB4388], "credentialWithPassword:", v13);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setCredential:", v25);
  }

  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BE0ABD8]);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  _AALogSystem();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v33 = v15;
    _os_log_impl(&dword_230E5F000, v27, OS_LOG_TYPE_DEFAULT, "AppleIDAuthenticationPlugin: will set raw password for account %@ so that our plugins will be happy.", buf, 0xCu);
  }

  if (v26)
    objc_msgSend(v15, "_aa_setRawPassword:", v26);
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = sub_230E68B28;
  v29[3] = &unk_24FF94200;
  v30 = v15;
  v31 = v12;
  -[AppleIDAuthenticationPlugin _fetchTokenForAccount:accountStore:withHandler:](v28, "_fetchTokenForAccount:accountStore:withHandler:", v30, v16, v29);

LABEL_17:
}

- (void)_handleAuthenticationResults:(id)a3 error:(id)a4 forAccount:(id)a5 inStore:(id)a6 resetAuthenticatedOnAlertFailure:(BOOL)a7 completion:(id)a8
{
  _BOOL8 v9;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id v29;

  v9 = a7;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a8;
  if (v15 && !objc_msgSend(v15, "ak_isAuthenticationErrorWithCode:", -7033))
  {
    v22 = (void *)MEMORY[0x24BE04908];
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = sub_230E69378;
    v23[3] = &unk_24FF942C8;
    v24 = v18;
    v19 = v18;
    objc_msgSend(v22, "handleAuthenticationError:resetAuthenticatedOnAlertFailure:forAccount:inStore:completion:", v15, v9, v16, v17, v23);
    v20 = v24;
  }
  else
  {
    objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x24BE0ABD8]);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x24BE0AB70]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = sub_230E68E0C;
    v25[3] = &unk_24FF942A0;
    v26 = v14;
    v27 = v16;
    v28 = v17;
    v29 = v18;
    v21 = v18;
    -[AppleIDAuthenticationPlugin _updateDSID:withRawPassword:suggestedAccount:store:completion:](self, "_updateDSID:withRawPassword:suggestedAccount:store:completion:", v20, v19, v27, v28, v25);

  }
}

- (void)_updateDSID:(id)a3 withRawPassword:(id)a4 suggestedAccount:(id)a5 store:(id)a6 completion:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void (**v15)(_QWORD);
  void *v16;
  void *v17;
  char v18;
  NSObject *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  id v23;
  NSObject *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  void (**v29)(_QWORD);
  uint8_t buf[4];
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = (void (**)(_QWORD))a7;
  if (v12)
  {
    objc_msgSend(v13, "accountType");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isEqualToString:", *MEMORY[0x24BDB3FD8]);

    if ((v18 & 1) != 0)
      goto LABEL_7;
    _AALogSystem();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v31 = v11;
      _os_log_impl(&dword_230E5F000, v19, OS_LOG_TYPE_DEFAULT, "AppleIDAuthenticationPlugin: Looking for iCloud account with DSID %@ for raw password update.", buf, 0xCu);
    }

    if (!v11)
    {
LABEL_7:
      v21 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%llu"), objc_msgSend(v11, "longLongValue"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "aa_appleAccountWithPersonID:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

    }
    _AALogSystem();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v31 = v13;
      _os_log_impl(&dword_230E5F000, v22, OS_LOG_TYPE_DEFAULT, "AppleIDAuthenticationPlugin setting raw password for account %@", buf, 0xCu);
    }

    objc_msgSend(v13, "_aa_setRawPassword:", v12);
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = sub_230E6964C;
    v25[3] = &unk_24FF942F0;
    v26 = v21;
    v27 = v12;
    v28 = v14;
    v29 = v15;
    v23 = v21;
    objc_msgSend(v28, "saveVerifiedAccount:withCompletionHandler:", v13, v25);

  }
  else
  {
    _AALogSystem();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_230E5F000, v24, OS_LOG_TYPE_DEFAULT, "Error: AppleIDAuthenticationPlugin did not get raw password back from AuthKit.", buf, 2u);
    }

    v15[2](v15);
  }

}

- (void)_invokeDelegatesWithAuthenticationResponse:(id)a3 password:(id)a4 store:(id)a5 account:(id)a6 completion:(id)a7
{
  id v11;
  void (**v12)(_QWORD);
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  id v21;
  __int128 v22;
  uint64_t j;
  void *v24;
  __CFString *v25;
  void *v26;
  id v27;
  NSObject *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  id v35;
  void *v36;
  os_signpost_id_t v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  NSObject *v41;
  void *v42;
  __CFString *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  NSObject *v49;
  __int128 v50;
  uint64_t v51;
  id obj;
  void (**v53)(_QWORD);
  id v54;
  uint64_t v55;
  void *v56;
  id v57;
  id v58;
  uint64_t v59;
  id v60;
  _QWORD v61[5];
  id v62;
  id v63;
  void (**v64)(_QWORD);
  os_signpost_id_t v65;
  uint64_t v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  uint8_t buf[4];
  os_signpost_id_t v76;
  __int16 v77;
  __CFString *v78;
  __int16 v79;
  void *v80;
  _BYTE v81[128];
  _BYTE v82[128];
  uint64_t v83;

  v83 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v58 = a4;
  v57 = a5;
  v60 = a6;
  v12 = (void (**)(_QWORD))a7;
  _AALogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_230E5F000, v13, OS_LOG_TYPE_DEFAULT, "_invokeDelegatesWithAuthenticationResponse start", buf, 2u);
  }

  if (qword_25414ADC0 != -1)
    dispatch_once(&qword_25414ADC0, &unk_24FF94310);
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend((id)qword_25414ADB8, "count"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend((id)qword_25414ADB8, "count"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  v16 = (id)qword_25414ADB8;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v71, v82, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v72;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v72 != v19)
          objc_enumerationMutation(v16);
        v21 = objc_alloc_init(*(Class *)(*((_QWORD *)&v71 + 1) + 8 * i));
        objc_msgSend(v14, "addObject:", v21);
        objc_msgSend(v15, "addObject:", objc_opt_class());

      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v71, v82, 16);
    }
    while (v18);
  }

  if (objc_msgSend(v14, "count"))
  {
    v69 = 0u;
    v70 = 0u;
    v67 = 0u;
    v68 = 0u;
    obj = v14;
    v59 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v81, 16);
    if (v59)
    {
      v55 = *(_QWORD *)v68;
      v51 = *MEMORY[0x24BE04BD8];
      *(_QWORD *)&v22 = 138412546;
      v50 = v22;
      v53 = v12;
      v54 = v11;
      v56 = v14;
      do
      {
        for (j = 0; j != v59; ++j)
        {
          if (*(_QWORD *)v68 != v55)
            objc_enumerationMutation(obj);
          v24 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * j);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(v24, "delegateServiceIdentifier");
            v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "responseParametersForServiceIdentifier:", v25);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("service-data"));
            v27 = (id)objc_claimAutoreleasedReturnValue();
            if (v27
              || -[__CFString isEqualToString:](v25, "isEqualToString:", v51)
              && (v27 = v26) != 0)
            {
              _AALogSystem();
              v28 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
              {
                v29 = (void *)objc_opt_class();
                *(_DWORD *)buf = v50;
                v76 = (os_signpost_id_t)v29;
                v77 = 2112;
                v78 = v25;
                v30 = v29;
                _os_log_impl(&dword_230E5F000, v28, OS_LOG_TYPE_DEFAULT, "%@ wants just the dictionary for delegateIdentifier %@", buf, 0x16u);

              }
              v31 = (void *)objc_msgSend(v27, "mutableCopy");
              objc_msgSend(v11, "dsid");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "setObject:forKey:", v32, CFSTR("dsid"));

            }
            else
            {
              objc_msgSend(v11, "responseParameters", v50);
              v27 = (id)objc_claimAutoreleasedReturnValue();
              v31 = (void *)objc_msgSend(v27, "mutableCopy");
            }

          }
          else
          {
            objc_msgSend(v11, "responseParameters");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = (void *)objc_msgSend(v26, "mutableCopy");
            v25 = CFSTR("Unknown");
          }

          objc_msgSend(v31, "setObject:forKey:", v58, CFSTR("password"));
          _AALogSystem();
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            v34 = (void *)objc_opt_class();
            *(_DWORD *)buf = 138412290;
            v76 = (os_signpost_id_t)v34;
            v35 = v34;
            _os_log_impl(&dword_230E5F000, v33, OS_LOG_TYPE_DEFAULT, "calling delegate %@", buf, 0xCu);

          }
          _AASignpostLogSystem();
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = _AASignpostCreate();
          v39 = v38;

          _AASignpostLogSystem();
          v40 = objc_claimAutoreleasedReturnValue();
          v41 = v40;
          if (v37 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
          {
            objc_msgSend(v60, "accountType");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "identifier");
            v43 = (__CFString *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v76 = (os_signpost_id_t)v25;
            v77 = 2114;
            v78 = v43;
            _os_signpost_emit_with_name_impl(&dword_230E5F000, v41, OS_SIGNPOST_INTERVAL_BEGIN, v37, "InvokeDelegateWithAuthResponse", " DelegateIdentifier=%{public,signpost.telemetry:string1,name=DelegateIdentifier}@  AccountType=%{public,signpost.telemetry:string2,name=AccountType}@  enableTelemetry=YES ", buf, 0x16u);

            v11 = v54;
            v12 = v53;
          }

          _AASignpostLogSystem();
          v44 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v60, "accountType");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "identifier");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 134218498;
            v76 = v37;
            v77 = 2114;
            v78 = v25;
            v79 = 2114;
            v80 = v46;
            _os_log_impl(&dword_230E5F000, v44, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: InvokeDelegateWithAuthResponse  DelegateIdentifier=%{public,signpost.telemetry:string1,name=DelegateIdentifier}@  AccountType=%{public,signpost.telemetry:string2,name=AccountType}@  enableTelemetry=YES ", buf, 0x20u);

            v12 = v53;
            v11 = v54;
          }

          v61[0] = MEMORY[0x24BDAC760];
          v61[1] = 3221225472;
          v61[2] = sub_230E6A1FC;
          v61[3] = &unk_24FF94338;
          v61[4] = v24;
          v65 = v37;
          v66 = v39;
          v47 = v31;
          v62 = v47;
          v63 = v15;
          v64 = v12;
          v48 = (void *)MEMORY[0x2348C5488](v61);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v24, "didReceiveAuthenticationResponseParameters:accountStore:account:completion:", v47, v57, v60, v48);
          else
            objc_msgSend(v24, "didReceiveAuthenticationResponseParameters:accountStore:completion:", v47, v57, v48);
          v14 = v56;

        }
        v59 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v81, 16);
      }
      while (v59);
    }

  }
  else
  {
    _AALogSystem();
    v49 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_230E5F000, v49, OS_LOG_TYPE_DEFAULT, "_invokeDelegatesWithAuthenticationResponse completing – no delegates to call", buf, 2u);
    }

    v12[2](v12);
  }

}

- (void)_fetchTokenForAccount:(id)a3 accountStore:(id)a4 withHandler:(id)a5
{
  -[AppleIDAuthenticationPlugin _fetchTokenForAccount:accountStore:forceFetch:withHandler:](self, "_fetchTokenForAccount:accountStore:forceFetch:withHandler:", a3, a4, 0, a5);
}

- (void)_fetchTokenForAccount:(id)a3 accountStore:(id)a4 forceFetch:(BOOL)a5 withHandler:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void (**v16)(_QWORD, _QWORD, _QWORD);
  NSObject *v17;
  _BOOL4 v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *, void *);
  void *v23;
  AppleIDAuthenticationPlugin *v24;
  id v25;
  id v26;
  id v27;
  uint8_t buf[4];
  id v29;
  uint64_t v30;

  v7 = a5;
  v30 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v20 = MEMORY[0x24BDAC760];
  v21 = 3221225472;
  v22 = sub_230E6A688;
  v23 = &unk_24FF94388;
  v24 = self;
  v13 = v10;
  v25 = v13;
  v14 = v11;
  v26 = v14;
  v15 = v12;
  v27 = v15;
  v16 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x2348C5488](&v20);
  _AALogSystem();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v18)
    {
      *(_DWORD *)buf = 138412290;
      v29 = v13;
      _os_log_impl(&dword_230E5F000, v17, OS_LOG_TYPE_DEFAULT, "Being forced to skip cached login for account (%@)", buf, 0xCu);
    }

    v16[2](v16, 0, 0);
  }
  else
  {
    if (v18)
    {
      *(_DWORD *)buf = 138412290;
      v29 = v13;
      _os_log_impl(&dword_230E5F000, v17, OS_LOG_TYPE_DEFAULT, "Attempting to fetch cached login response for account (%@)", buf, 0xCu);
    }

    v19 = objc_alloc_init(MEMORY[0x24BE04940]);
    objc_msgSend(v19, "fetchCachedLoginResponseForAccount:completion:", v13, v16, v20, v21, v22, v23, v24, v25, v26);

  }
}

- (void)_performLoginDelegatesRequestForAccount:(id)a3 store:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  os_signpost_id_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  void *v37;
  void *v38;
  uint64_t v39;
  AppleIDAuthenticationPlugin *v40;
  id v41;
  void *v42;
  _QWORD v43[5];
  id v44;
  id v45;
  id v46;
  os_signpost_id_t v47;
  uint64_t v48;
  uint8_t buf[4];
  os_signpost_id_t v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[AppleIDAuthenticationPlugin _loginDelegatesParameters](self, "_loginDelegatesParameters");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE049C8]), "initWithAccount:parameters:", v8, v11);
  objc_msgSend(v8, "aa_personID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = objc_alloc(MEMORY[0x24BE04970]);
    objc_msgSend(v8, "aa_personID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v14, "initWithDSID:", v15);

    objc_msgSend(v16, "addProvisioningInfoToAARequest:", v12);
  }
  _AASignpostLogSystem();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = _AASignpostCreate();
  v20 = v19;

  _AASignpostLogSystem();
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    objc_msgSend(v9, "client");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "bundleID");
    v41 = v10;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "accountType");
    v39 = v20;
    v24 = v11;
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "identifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v50 = (os_signpost_id_t)v23;
    v51 = 2114;
    v52 = v26;
    _os_signpost_emit_with_name_impl(&dword_230E5F000, v22, OS_SIGNPOST_INTERVAL_BEGIN, v18, "LoginDelegates", " Client=%{public,signpost.telemetry:string1,name=Client}@  AccountType=%{public,signpost.telemetry:string2,name=AccountType}@  enableTelemetry=YES ", buf, 0x16u);

    v11 = v24;
    v20 = v39;

    v10 = v41;
  }

  _AASignpostLogSystem();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v9, "client");
    v40 = self;
    v42 = v12;
    v38 = v11;
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "bundleID");
    v29 = v10;
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "accountType");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "identifier");
    v32 = v20;
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v50 = v18;
    v51 = 2114;
    v52 = v30;
    v53 = 2114;
    v54 = v33;
    _os_log_impl(&dword_230E5F000, v27, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: LoginDelegates  Client=%{public,signpost.telemetry:string1,name=Client}@  AccountType=%{public,signpost.telemetry:string2,name=AccountType}@  enableTelemetry=YES ", buf, 0x20u);

    v20 = v32;
    v10 = v29;

    v11 = v38;
    self = v40;
    v12 = v42;
  }

  v43[0] = MEMORY[0x24BDAC760];
  v43[1] = 3221225472;
  v43[2] = sub_230E6AD5C;
  v43[3] = &unk_24FF943B0;
  v47 = v18;
  v48 = v20;
  v43[4] = self;
  v44 = v8;
  v45 = v9;
  v46 = v10;
  v34 = v10;
  v35 = v9;
  v36 = v8;
  objc_msgSend(v12, "performRequestWithHandler:", v43);

}

- (void)_handleDelegatesResponseForAccount:(id)a3 store:(id)a4 response:(id)a5 error:(id)a6 handler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void (**v16)(id, _QWORD, id);
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  AppleIDAuthenticationPlugin *v30;
  id v31;
  id v32;
  void (**v33)(id, _QWORD, id);
  uint64_t v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = (void (**)(id, _QWORD, id))a7;
  objc_msgSend(v14, "status");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "integerValue");

  if (v15 || v18)
  {
    objc_msgSend(v14, "statusMessage");
    v22 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)v22;
    if (v22)
    {
      v23 = (void *)MEMORY[0x24BDD1540];
      v34 = *MEMORY[0x24BDD0FC8];
      v35[0] = v22;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("com.apple.appleaccount"), v18, v24);
      v25 = objc_claimAutoreleasedReturnValue();

      v15 = (id)v25;
    }
    objc_msgSend(v12, "credential");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setPassword:", 0);

    v16[2](v16, 0, v15);
  }
  else
  {
    objc_msgSend(v12, "credential");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "password");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = sub_230E6B170;
    v27[3] = &unk_24FF943D8;
    v28 = v12;
    v29 = v20;
    v30 = self;
    v31 = v14;
    v32 = 0;
    v33 = v16;
    v15 = v20;
    -[AppleIDAuthenticationPlugin _invokeDelegatesWithAuthenticationResponse:password:store:account:completion:](self, "_invokeDelegatesWithAuthenticationResponse:password:store:account:completion:", v31, v15, v13, v28, v27);

    v21 = v28;
  }

}

- (id)_loginDelegatesParameters
{
  void *v2;
  int v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint8_t v9[8];
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE31CC0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "needsLostModeExitAuth");

  v4 = MEMORY[0x24BDBD1B8];
  v5 = (void *)MEMORY[0x24BDBD1B8];
  if (v3)
  {
    _AALogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_230E5F000, v6, OS_LOG_TYPE_DEFAULT, "FMDFMIPManager says we need a lost-mode exit token.", v9, 2u);
    }

    v5 = &unk_24FF95918;
  }
  v7 = *MEMORY[0x24BE04BD8];
  v10[0] = *MEMORY[0x24BE04BC0];
  v10[1] = v7;
  v11[0] = v4;
  v11[1] = v5;
  v10[2] = *MEMORY[0x24BE04BD0];
  v11[2] = &unk_24FF95940;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_parametersForIDSAlertFromLoginResponse:(id)a3
{
  return 0;
}

- (id)_authController
{
  AKAppleIDAuthenticationController *authController;
  AKAppleIDAuthenticationController *v4;
  AKAppleIDAuthenticationController *v5;

  authController = self->_authController;
  if (!authController)
  {
    v4 = (AKAppleIDAuthenticationController *)objc_alloc_init(MEMORY[0x24BE0ACC0]);
    v5 = self->_authController;
    self->_authController = v4;

    authController = self->_authController;
  }
  return authController;
}

- (NSString)passwordlessToken
{
  return self->_passwordlessToken;
}

- (void)setPasswordlessToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)idmsDataToken
{
  return self->_idmsDataToken;
}

- (void)setIdmsDataToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idmsDataToken, 0);
  objc_storeStrong((id *)&self->_passwordlessToken, 0);
  objc_storeStrong((id *)&self->_followUpController, 0);
  objc_storeStrong((id *)&self->_authController, 0);
  objc_storeStrong((id *)&self->_accountsAwaitingRemotePasswordEntry, 0);
}

@end
