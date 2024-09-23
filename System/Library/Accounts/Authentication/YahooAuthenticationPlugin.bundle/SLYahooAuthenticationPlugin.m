@implementation SLYahooAuthenticationPlugin

+ (id)webClientForAccount:(id)a3
{
  void *v3;
  void *v4;
  int v5;
  Class *v6;
  id v7;

  objc_msgSend(a3, "accountType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDB3FD0]);
  v6 = (Class *)0x24BDE9888;
  if (!v5)
    v6 = (Class *)0x24BDE9908;
  v7 = objc_alloc_init(*v6);

  return v7;
}

+ (BOOL)supportsAccountType:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDB4160]) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(v3, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDB3FD0]);

  }
  return v5;
}

- (BOOL)isPushSupportedForAccount:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  BOOL v9;
  char v10;
  id v12;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v3 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2050000000;
  v4 = (void *)qword_255EAA2D8;
  v17 = qword_255EAA2D8;
  if (!qword_255EAA2D8)
  {
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = sub_230EA058C;
    v13[3] = &unk_24FF9C020;
    v13[4] = &v14;
    sub_230EA058C((uint64_t)v13);
    v4 = (void *)v15[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v14, 8);
  v12 = 0;
  objc_msgSend(v5, "accountWithPersistentAccount:error:", v3, &v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v12;
  v8 = v7;
  if (v6)
    v9 = v7 == 0;
  else
    v9 = 0;
  if (v9 && (objc_opt_respondsToSelector() & 1) != 0)
    v10 = objc_msgSend(v6, "canReceiveNewMailNotifications");
  else
    v10 = 0;

  return v10;
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
  block[2] = sub_230E9E3F8;
  block[3] = &unk_24FF9BE40;
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;

  v8 = a3;
  v9 = a4;
  v10 = objc_msgSend(v9, "hasEntitlement:", *MEMORY[0x24BDB4450]);
  _ACDLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
  if (v10)
  {
    if (v12)
      sub_230EA06FC((uint64_t)v9, v11, v13, v14, v15, v16, v17, v18);

    objc_msgSend(MEMORY[0x24BE00E88], "credentialForAccount:clientID:error:", v8, 0, a6);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v12)
      sub_230EA0760((uint64_t)v9, v11, v13, v14, v15, v16, v17, v18);

    v19 = 0;
  }

  return v19;
}

- (void)verifyCredentialsForAccount:(id)a3 accountStore:(id)a4 options:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  void (**v11)(id, id, _QWORD);
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  void (**v31)(id, id, _QWORD);
  _QWORD v32[4];
  id v33;
  void (**v34)(id, id, _QWORD);
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = (void (**)(id, id, _QWORD))a6;
  objc_msgSend(v9, "username");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v12, "hasSuffix:", CFSTR("yahoo.co.jp")) & 1) == 0)
  {

LABEL_5:
    objc_msgSend(v9, "username");
    v21 = objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      v22 = (void *)v21;
      objc_msgSend(v9, "credential");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "oauthToken");
      v24 = objc_claimAutoreleasedReturnValue();
      if (v24)
      {
        v25 = (void *)v24;
        objc_msgSend(v9, "credential");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "oauthRefreshToken");
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (v27)
        {
          v11[2](v11, v9, 0);
          goto LABEL_11;
        }
      }
      else
      {

      }
    }
    v35 = *MEMORY[0x24BDB4528];
    v36 = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = sub_230E9E89C;
    v29[3] = &unk_24FF9BE90;
    v31 = v11;
    v30 = v9;
    -[SLYahooAuthenticationPlugin renewCredentialsForAccount:accountStore:options:completion:](self, "renewCredentialsForAccount:accountStore:options:completion:", v30, v10, v28, v29);

    goto LABEL_11;
  }
  objc_msgSend(v9, "credential");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "password");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
    goto LABEL_5;
  v15 = objc_alloc(MEMORY[0x24BDB4380]);
  objc_msgSend(v10, "accountTypeWithIdentifier:", *MEMORY[0x24BDB4088]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v15, "initWithAccountType:", v16);

  objc_msgSend(v9, "username");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setUsername:", v18);

  objc_msgSend(v9, "credential");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setCredential:", v19);

  v37 = *MEMORY[0x24BDB4540];
  v38[0] = MEMORY[0x24BDBD1C0];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v38, &v37, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = sub_230E9E874;
  v32[3] = &unk_24FF9BE68;
  v34 = v11;
  v33 = v9;
  objc_msgSend(v10, "verifyCredentialsForAccount:options:completion:", v17, v20, v32);

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
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  SLYahooAuthenticationPlugin *v24;
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
    _os_log_impl(&dword_230E9D000, v14, OS_LOG_TYPE_DEFAULT, "\"Yahoo! plugin got renewCredentialsForAccount: %@ options: %{public}@ completion:\", buf, 0x16u);
  }

  objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x24BDB4528]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "BOOLValue");

  objc_msgSend(v10, "username");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v17, "hasSuffix:", CFSTR("yahoo.co.jp")) & 1) == 0)
  {

    goto LABEL_9;
  }
  objc_msgSend(v10, "credential");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "password");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
  {
LABEL_9:
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = sub_230E9ED40;
    v21[3] = &unk_24FF9BF08;
    v22 = v10;
    v26 = v13;
    v23 = v12;
    v24 = self;
    v25 = v11;
    v27 = v16;
    -[SLYahooAuthenticationPlugin _refreshTokenForAccount:store:completion:](self, "_refreshTokenForAccount:store:completion:", v22, v25, v21);

    goto LABEL_10;
  }
  _ACLogSystem();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    sub_230EA07C4(v20);

  (*((void (**)(id, _QWORD, _QWORD))v13 + 2))(v13, 0, 0);
LABEL_10:

}

- (id)_getLegacyTokenForAccount:(id)a3 password:(id)a4 username:(id)a5
{
  id v7;
  id v8;
  id v9;
  dispatch_semaphore_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  dispatch_time_t v19;
  id v20;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, void *, void *, void *);
  void *v25;
  NSObject *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = dispatch_semaphore_create(0);
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = sub_230E9F2D0;
  v32 = sub_230E9F2E0;
  v33 = 0;
  +[SLYahooAuthenticationPlugin webClientForAccount:](SLYahooAuthenticationPlugin, "webClientForAccount:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x24BDE98E8];
  objc_msgSend(v11, "source");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "urlRequestForLoginTokenFromUsername:password:src:", v9, v8, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1858], "ephemeralSessionConfiguration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1850], "sessionWithConfiguration:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = MEMORY[0x24BDAC760];
  v23 = 3221225472;
  v24 = sub_230E9F2E8;
  v25 = &unk_24FF9BF30;
  v27 = &v28;
  v17 = v10;
  v26 = v17;
  objc_msgSend(v16, "dataTaskWithRequest:completionHandler:", v14, &v22);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "resume", v22, v23, v24, v25);
  v19 = dispatch_time(0, 20000000000);
  dispatch_semaphore_wait(v17, v19);
  v20 = (id)v29[5];

  _Block_object_dispose(&v28, 8);
  return v20;
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  BOOL v26;
  void *v27;
  id v28;
  uint64_t v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  id v35;
  uint8_t buf[8];
  id v37;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v37 = 0;
  objc_msgSend(MEMORY[0x24BE00E88], "credentialForAccount:clientID:error:", v8, 0, &v37);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v37;
  if (v11
    && (objc_msgSend(v11, "oauthRefreshToken"), v13 = (void *)objc_claimAutoreleasedReturnValue(),
                                                v13,
                                                v13))
  {
    v30 = v9;
    _ACDLogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_230E9D000, v14, OS_LOG_TYPE_DEFAULT, "\"refreshing Yahoo! access token\", buf, 2u);
    }

    +[SLYahooAuthenticationPlugin webClientForAccount:](SLYahooAuthenticationPlugin, "webClientForAccount:", v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x24BDE9910];
    objc_msgSend(v15, "clientID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "clientSecret");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "oauthRefreshToken");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "tokenURL");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "urlRequestForClientID:secret:refreshToken:tokenURL:", v17, v18, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1858], "ephemeralSessionConfiguration");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1850], "sessionWithConfiguration:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = MEMORY[0x24BDAC760];
    v31[1] = 3221225472;
    v31[2] = sub_230E9F780;
    v31[3] = &unk_24FF9BF80;
    v32 = v11;
    v35 = v10;
    v33 = v8;
    v9 = v30;
    v34 = v30;
    objc_msgSend(v23, "dataTaskWithRequest:completionHandler:", v21, v31);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "resume");

  }
  else
  {
    objc_msgSend(v11, "password");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "credentialItemForKey:", *MEMORY[0x24BDB4378]);
    v25 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)v25;
    if (v15)
      v26 = v25 == 0;
    else
      v26 = 0;
    if (v26)
    {
      objc_msgSend(v8, "username");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[SLYahooAuthenticationPlugin _getLegacyTokenForAccount:password:username:](self, "_getLegacyTokenForAccount:password:username:", v8, v15, v27);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

    }
    if (v21)
    {
      -[SLYahooAuthenticationPlugin _migrateLegacyToken:account:completion:](self, "_migrateLegacyToken:account:completion:", v21, v8, v10);
    }
    else
    {
      if (objc_msgSend(v12, "code") == 10)
      {
        v28 = v10;
        v29 = 3;
      }
      else
      {
        v28 = v10;
        v29 = 0;
      }
      (*((void (**)(id, uint64_t, _QWORD))v10 + 2))(v28, v29, 0);
    }
  }

}

- (void)_migrateLegacyToken:(id)a3 account:(id)a4 completion:(id)a5
{
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  _QWORD v21[4];
  id v22;

  v7 = a5;
  v8 = (void *)MEMORY[0x24BDD1858];
  v9 = a4;
  v10 = a3;
  objc_msgSend(v8, "ephemeralSessionConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1850], "sessionWithConfiguration:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[SLYahooAuthenticationPlugin webClientForAccount:](SLYahooAuthenticationPlugin, "webClientForAccount:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x24BDE98F8];
  objc_msgSend(v13, "clientID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "clientSecret");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "source");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "urlRequestForOAuthTokenFromLoginToken:clientID:clientSecret:src:", v10, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = sub_230E9FE88;
  v21[3] = &unk_24FF9BFA8;
  v22 = v7;
  v19 = v7;
  objc_msgSend(v12, "dataTaskWithRequest:completionHandler:", v18, v21);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "resume");

}

- (void)_displayBadCredentialsAlertForAccount:(id)a3 clientName:(id)a4 reason:(id)a5 accountStore:(id)a6 resetAuthenticatedOnAlertFailure:(BOOL)a7 handler:(id)a8
{
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  _QWORD v35[4];
  id v36;
  id v37;
  id v38;
  BOOL v39;

  v11 = a3;
  v31 = a6;
  v30 = a8;
  v12 = (void *)MEMORY[0x24BDD1488];
  v32 = a5;
  objc_msgSend(v12, "bundleForClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "accountType");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "isEqualToString:", *MEMORY[0x24BDB3FD0]))
    v16 = CFSTR("YAHOO_AUTH_ACCOUNT_TYPE_AOL");
  else
    v16 = CFSTR("YAHOO_AUTH_ACCOUNT_TYPE_YAHOO");
  objc_msgSend(v13, "localizedStringForKey:value:table:", v16, &stru_24FF9C0F8, CFSTR("Localizable"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("YAHOO_AUTH_ALERT_TITLE_IOS"), &stru_24FF9C0F8, CFSTR("Localizable"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "username");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringWithFormat:", v19, v29, v20);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("YAHOO_AUTH_ALERT_SETTINGS_IOS"), &stru_24FF9C0F8, CFSTR("Localizable"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("YAHOO_AUTH_ALERT_CANCEL"), &stru_24FF9C0F8, CFSTR("Localizable"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = MEMORY[0x24BDAC760];
  v35[1] = 3221225472;
  v35[2] = sub_230EA039C;
  v35[3] = &unk_24FF9BFF8;
  v39 = a7;
  v36 = v11;
  v37 = v31;
  v38 = v30;
  v25 = v11;
  v26 = v31;
  v27 = v30;
  -[SLYahooAuthenticationPlugin showUserAlertWithTitle:message:cancelButtonTitle:otherButtonTitle:withCompletionBlock:](self, "showUserAlertWithTitle:message:cancelButtonTitle:otherButtonTitle:withCompletionBlock:", v28, v32, v24, v22, v35);

}

@end
