@implementation SLGoogleAuthenticationPlugin

+ (BOOL)supportsAccountType:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDB4068]);

  return v4;
}

- (void)showUserAlertWithTitle:(id)a3 message:(id)a4 cancelButtonTitle:(id)a5 otherButtonTitle:(id)a6 withCompletionBlock:(id)a7
{
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  id v25;
  id v26;
  _QWORD block[4];
  id v28;
  _QWORD *v29;
  _QWORD v30[3];
  CFUserNotificationRef v31;

  v26 = a4;
  v11 = a7;
  v12 = (void *)MEMORY[0x24BDBCED8];
  v13 = *MEMORY[0x24BDBD6D8];
  v14 = *MEMORY[0x24BDBD6F8];
  v15 = *MEMORY[0x24BDBD6F0];
  v16 = (void *)MEMORY[0x24BDD1488];
  v17 = a6;
  v18 = a5;
  v19 = a3;
  objc_msgSend(v16, "bundleForClass:", objc_opt_class());
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "resourceURL");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dictionaryWithObjectsAndKeys:", v19, v13, v18, v14, v17, v15, v21, *MEMORY[0x24BDBD710], 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
    objc_msgSend(v22, "setObject:forKey:", v26, *MEMORY[0x24BDBD6E0]);
  v23 = (void *)objc_msgSend(v11, "copy");

  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x2020000000;
  v31 = 0;
  v31 = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], 0.0, 0, 0, (CFDictionaryRef)v22);
  dispatch_get_global_queue(2, 0);
  v24 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_230E8EEE0;
  block[3] = &unk_24FF99470;
  v28 = v23;
  v29 = v30;
  v25 = v23;
  dispatch_async(v24, block);

  _Block_object_dispose(v30, 8);
}

- (id)credentialForAccount:(id)a3 client:(id)a4 store:(id)a5 error:(id *)a6
{
  id v8;
  id v9;
  int v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = objc_msgSend(v9, "hasEntitlement:", *MEMORY[0x24BDB4450]);
  _ACDLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v12)
    {
      v15 = 138412290;
      v16 = v9;
      _os_log_impl(&dword_230E8D000, v11, OS_LOG_TYPE_DEFAULT, "\"%@ is entitled for all-account access. Returning Google credentials.\", (uint8_t *)&v15, 0xCu);
    }

    objc_msgSend(MEMORY[0x24BE00E88], "credentialForAccount:clientID:error:", v8, 0, a6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v12)
    {
      v15 = 138412290;
      v16 = v9;
      _os_log_impl(&dword_230E8D000, v11, OS_LOG_TYPE_DEFAULT, "\"%@ is a non-entitled client. No Google credential for you.\", (uint8_t *)&v15, 0xCu);
    }

    v13 = 0;
  }

  return v13;
}

- (void)verifyCredentialsForAccount:(id)a3 accountStore:(id)a4 options:(id)a5 completion:(id)a6
{
  id v7;
  void (**v8)(id, _QWORD, void *);
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  const __CFString *v24;
  uint8_t buf[4];
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = (void (**)(id, _QWORD, void *))a6;
  objc_msgSend(v7, "username");
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v9)
    goto LABEL_10;
  v10 = (void *)v9;
  objc_msgSend(v7, "credential");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "credentialType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v12, "isEqualToString:", *MEMORY[0x24BDB41C0]))
    goto LABEL_9;
  objc_msgSend(v7, "credential");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "oauthToken");
  v14 = objc_claimAutoreleasedReturnValue();
  if (!v14)
  {

LABEL_9:
    goto LABEL_10;
  }
  v15 = (void *)v14;
  objc_msgSend(v7, "credential");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "oauthRefreshToken");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
LABEL_10:
    v19 = (void *)MEMORY[0x24BDD1540];
    v20 = *MEMORY[0x24BDB4200];
    v23 = *MEMORY[0x24BDD0FC8];
    v24 = CFSTR("The account could not be verified because it does not have the necessary credentials.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "errorWithDomain:code:userInfo:", v20, 3, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v8[2](v8, 0, v22);
    goto LABEL_11;
  }
  _ACDLogSystem();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v26 = v7;
    _os_log_impl(&dword_230E8D000, v18, OS_LOG_TYPE_DEFAULT, "\"%@ is an OAuth account. we're good!\", buf, 0xCu);
  }

  ((void (**)(id, id, void *))v8)[2](v8, v7, 0);
LABEL_11:

}

- (id)renewalIDsForAccount:(id)a3 accountStore:(id)a4 options:(id)a5
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x24BDB4528]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  if (v8)
  {
    v9 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v6, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("%@.AvoidUI"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v11;
    objc_msgSend(v6, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = v12;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v6, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v15, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (void)renewCredentialsForAccount:(id)a3 accountStore:(id)a4 options:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  char v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  SLGoogleAuthenticationPlugin *v24;
  id v25;
  id v26;
  char v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  _ACDLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v29 = v10;
    v30 = 2114;
    v31 = v12;
    _os_log_impl(&dword_230E8D000, v14, OS_LOG_TYPE_DEFAULT, "\"Google plugin got renewCredentialsForAccount: %@ options: %{public}@ completion:\", buf, 0x16u);
  }

  objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x24BDB4528]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "BOOLValue");

  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = sub_230E8F5B8;
  v21[3] = &unk_24FF994E8;
  v25 = v11;
  v26 = v13;
  v22 = v10;
  v23 = v12;
  v24 = self;
  v27 = v16;
  v17 = v11;
  v18 = v12;
  v19 = v13;
  v20 = v10;
  -[SLGoogleAuthenticationPlugin _refreshTokenForAccount:store:completion:](self, "_refreshTokenForAccount:store:completion:", v20, v17, v21);

}

- (void)_refreshTokenForAccount:(id)a3 store:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  BOOL v24;
  id v25;
  uint64_t v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  uint8_t buf[8];
  id v32;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v32 = 0;
  objc_msgSend(MEMORY[0x24BE00E88], "credentialForAccount:clientID:error:", v8, 0, &v32);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v32;
  if (v11
    && (objc_msgSend(v11, "oauthRefreshToken"), v13 = (void *)objc_claimAutoreleasedReturnValue(),
                                                v13,
                                                v13))
  {
    _ACDLogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_230E8D000, v14, OS_LOG_TYPE_DEFAULT, "\"refreshing Google access token\", buf, 2u);
    }

    v15 = objc_alloc_init(MEMORY[0x24BDE98D0]);
    v16 = (void *)MEMORY[0x24BDE98B8];
    objc_msgSend(v15, "clientID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "oauthRefreshToken");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "tokenURL");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "urlRequestForClientID:secret:refreshToken:tokenURL:", v17, 0, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1858], "ephemeralSessionConfiguration");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1850], "sessionWithConfiguration:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = sub_230E8FBF0;
    v27[3] = &unk_24FF99510;
    v28 = v11;
    v29 = v8;
    v30 = v10;
    objc_msgSend(v22, "dataTaskWithRequest:completionHandler:", v20, v27);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "resume");

  }
  else
  {
    objc_msgSend(v9, "clientTokenForAccount:", v8);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "password");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
      v24 = v15 == 0;
    else
      v24 = 1;
    if (v24)
    {
      if (objc_msgSend(v12, "code") == 10)
      {
        v25 = v10;
        v26 = 3;
      }
      else
      {
        v25 = v10;
        v26 = 0;
      }
      (*((void (**)(id, uint64_t, _QWORD))v10 + 2))(v25, v26, 0);
    }
    else
    {
      -[SLGoogleAuthenticationPlugin _migrateLegacyToken:account:password:completion:](self, "_migrateLegacyToken:account:password:completion:", v15, v8, v20, v10);
    }
  }

}

- (void)_migrateLegacyToken:(id)a3 account:(id)a4 password:(id)a5 completion:(id)a6
{
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *, void *, void *);
  void *v23;
  id v24;
  id v25;

  v9 = a6;
  v10 = (void *)MEMORY[0x24BDE98A8];
  v11 = a5;
  v12 = a3;
  objc_msgSend(a4, "username");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "urlRequestForAuthTokenFromLegacyClientToken:username:password:", v12, v13, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1858], "ephemeralSessionConfiguration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1850], "sessionWithConfiguration:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = MEMORY[0x24BDAC760];
  v21 = 3221225472;
  v22 = sub_230E90120;
  v23 = &unk_24FF99588;
  v24 = v16;
  v25 = v9;
  v17 = v16;
  v18 = v9;
  objc_msgSend(v17, "dataTaskWithRequest:completionHandler:", v14, &v20);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "resume", v20, v21, v22, v23);

}

- (id)_titleForBadCredentialsAlertForAccount:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (void *)MEMORY[0x24BDD1488];
  v5 = a3;
  objc_msgSend(v4, "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("GOOGLE_AUTH_ALERT_TITLE_IOS"), &stru_24FF99658, CFSTR("Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "username");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "stringWithFormat:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_otherButtonTitleForBadCredentialsAlert
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("GOOGLE_AUTH_ALERT_SETTINGS_IOS"), &stru_24FF99658, CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_cancelButtonTitleForBadCredentialsAlert
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("GOOGLE_AUTH_ALERT_CANCEL"), &stru_24FF99658, CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_messageForBadCredentialsAlertWithReason:(id)a3 account:(id)a4
{
  return a3;
}

- (void)_displayBadCredentialsAlertForAccount:(id)a3 clientName:(id)a4 reason:(id)a5 accountStore:(id)a6 resetAuthenticatedOnAlertFailure:(BOOL)a7 handler:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  BOOL v28;

  v13 = a3;
  v14 = a6;
  v15 = a8;
  v16 = a5;
  -[SLGoogleAuthenticationPlugin _titleForBadCredentialsAlertForAccount:](self, "_titleForBadCredentialsAlertForAccount:", v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLGoogleAuthenticationPlugin _otherButtonTitleForBadCredentialsAlert](self, "_otherButtonTitleForBadCredentialsAlert");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLGoogleAuthenticationPlugin _cancelButtonTitleForBadCredentialsAlert](self, "_cancelButtonTitleForBadCredentialsAlert");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLGoogleAuthenticationPlugin _messageForBadCredentialsAlertWithReason:account:](self, "_messageForBadCredentialsAlertWithReason:account:", v16, v13);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = sub_230E90BE0;
  v24[3] = &unk_24FF995D8;
  v28 = a7;
  v25 = v13;
  v26 = v14;
  v27 = v15;
  v21 = v15;
  v22 = v14;
  v23 = v13;
  -[SLGoogleAuthenticationPlugin showUserAlertWithTitle:message:cancelButtonTitle:otherButtonTitle:withCompletionBlock:](self, "showUserAlertWithTitle:message:cancelButtonTitle:otherButtonTitle:withCompletionBlock:", v17, v20, v19, v18, v24);

}

@end
