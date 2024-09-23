@implementation SLAccountNotificationPlugin

- (SLAccountNotificationPlugin)init
{
  SLAccountNotificationPlugin *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SLAccountNotificationPlugin;
  result = -[SLAccountNotificationPlugin init](&v3, sel_init);
  if (result)
    result->_accountState = 0;
  return result;
}

- (BOOL)_accountExistsForAccountTypeIdentifier:(id)a3 inStore:(id)a4
{
  id v5;
  id v6;
  int v7;
  BOOL v8;
  dispatch_semaphore_t v9;
  NSObject *v10;
  _QWORD v12[4];
  id v13;
  NSObject *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(MEMORY[0x24BDB4398], "accountsWithAccountTypeIdentifierExist:", v5);
  if (v7 == 1)
  {
    v8 = 1;
  }
  else if (v7 == 2)
  {
    v8 = 0;
  }
  else
  {
    v16 = 0;
    v17 = &v16;
    v18 = 0x2020000000;
    v19 = 0;
    v9 = dispatch_semaphore_create(0);
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = sub_230F6ADE8;
    v12[3] = &unk_24FFC06F0;
    v13 = v6;
    v15 = &v16;
    v10 = v9;
    v14 = v10;
    objc_msgSend(v13, "accountTypeWithIdentifier:handler:", v5, v12);
    dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
    v8 = *((_BYTE *)v17 + 24) != 0;

    _Block_object_dispose(&v16, 8);
  }

  return v8;
}

- (void)cleanupTwitterPushDestinationsForAccount:(id)a3 accountStore:(id)a4
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  id v21;
  void *v22;
  _QWORD block[4];
  id v24;
  id v25;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x24BE08738]);
  v6 = (void *)objc_msgSend(v5, "initWithEnvironmentName:", *MEMORY[0x24BE08720]);
  objc_msgSend(MEMORY[0x24BDBCF18], "mainRunLoop");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scheduleInRunLoop:", v7);

  objc_msgSend(v6, "publicToken");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "base64Encoding");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "username");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  _SLLog();

  v10 = (void *)MEMORY[0x24BDD16B0];
  objc_msgSend(MEMORY[0x24BDBCF48], "SLTwitterCleanupPushDestinationsURL", v22);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "requestWithURL:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setHTTPMethod:", CFSTR("POST"));
  v13 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v9, "_urlEncodedString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("token=%@"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "dataUsingEncoding:", 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setHTTPBody:", v16);

  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB43E8]), "initWithAccount:", v4);
  v18 = v17;
  if (v17)
  {
    objc_msgSend(v17, "signedURLRequestWithURLRequest:", v12);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = dispatch_queue_create("performRequestQueue", 0);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_230F6B0F0;
    block[3] = &unk_24FFC0718;
    v24 = v19;
    v25 = v4;
    v21 = v19;
    dispatch_async(v20, block);

  }
}

- (BOOL)account:(id)a3 willChangeWithType:(int)a4 inStore:(id)a5 oldAccount:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;

  v9 = a5;
  v10 = a6;
  v11 = v10;
  if (a4 == 3)
  {
    objc_msgSend(v10, "accountType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqualToString:", *MEMORY[0x24BDB4148]);

    if (v14)
      -[SLAccountNotificationPlugin cleanupTwitterPushDestinationsForAccount:accountStore:](self, "cleanupTwitterPushDestinationsForAccount:accountStore:", v11, v9);
  }

  return 0;
}

@end
