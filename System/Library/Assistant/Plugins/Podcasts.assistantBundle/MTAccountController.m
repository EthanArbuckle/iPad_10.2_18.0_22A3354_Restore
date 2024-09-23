@implementation MTAccountController

- (MTAccountController)init
{
  MTAccountController *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *accountQueue;
  dispatch_queue_t v5;
  OS_dispatch_queue *callbackQueue;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSMutableSet *inFlightAuthRequests;
  uint64_t v13;
  NSMutableSet *declinedAuthRequests;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)MTAccountController;
  v2 = -[MTAccountController init](&v22, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.podcasts.MTAccountController.accountQueue", 0);
    accountQueue = v2->_accountQueue;
    v2->_accountQueue = (OS_dispatch_queue *)v3;

    v5 = dispatch_queue_create("com.apple.podcasts.MTAccountController.callbackQueue", 0);
    callbackQueue = v2->_callbackQueue;
    v2->_callbackQueue = (OS_dispatch_queue *)v5;

    objc_msgSend__updateActiveAccount(v2, v7, v8, v9, v10);
    v11 = objc_opt_new();
    inFlightAuthRequests = v2->_inFlightAuthRequests;
    v2->_inFlightAuthRequests = (NSMutableSet *)v11;

    v13 = objc_opt_new();
    declinedAuthRequests = v2->_declinedAuthRequests;
    v2->_declinedAuthRequests = (NSMutableSet *)v13;

    objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], v15, v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObserver_selector_name_object_(v19, v20, (uint64_t)v2, (uint64_t)sel_didChangeStoreAccount_, *MEMORY[0x24BDB41E0], 0);

  }
  return v2;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v10;

  objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObserver_(v6, v7, (uint64_t)self, v8, v9);

  v10.receiver = self;
  v10.super_class = (Class)MTAccountController;
  -[MTAccountController dealloc](&v10, sel_dealloc);
}

- (id)activeAccount
{
  NSObject *accountQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_21735A8B8;
  v10 = sub_21735A8C8;
  v11 = 0;
  accountQueue = self->_accountQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = sub_21735A8D0;
  v5[3] = &unk_24D744E48;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accountQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)setActiveAccount:(id)a3
{
  id v4;
  NSObject *accountQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  MTAccountController *v9;

  v4 = a3;
  accountQueue = self->_accountQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_21735A984;
  v7[3] = &unk_24D744E70;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(accountQueue, v7);

}

- (id)primaryUser
{
  return (id)((uint64_t (*)(MTAccountController *, char *))MEMORY[0x24BEDD108])(self, sel__activeAccount);
}

- (BOOL)isPrimaryUserActiveAccount
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  char isEqualToNumber;

  objc_msgSend_ams_DSID(self->__activeAccount, a2, v2, v3, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend_activeDsid(self, v6, v7, v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_ams_DSID(self->__activeAccount, v12, v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    isEqualToNumber = objc_msgSend_isEqualToNumber_(v11, v17, (uint64_t)v16, v18, v19);

  }
  else
  {
    isEqualToNumber = 0;
  }

  return isEqualToNumber;
}

- (void)fetchActiveAccountWithCompletion:(id)a3
{
  id v4;
  NSObject *accountQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  accountQueue = self->_accountQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_21735AB4C;
  v7[3] = &unk_24D744EC0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(accountQueue, v7);

}

- (id)activeDsid
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  objc_msgSend_activeAccount(self, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ams_DSID(v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)activeStorefront
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  objc_msgSend_activeAccount(self, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ams_storefront(v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)activeEmail
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  objc_msgSend_activeAccount(self, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_username(v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)activeFullName
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  objc_msgSend_activeAccount(self, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ams_fullName(v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)isUserLoggedIn
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  BOOL v11;

  objc_msgSend_activeAccount(self, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ams_DSID(v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10 != 0;

  return v11;
}

- (BOOL)activeAccountIsManagedAppleID
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char isManagedAppleID;

  objc_msgSend_activeAccount(self, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  isManagedAppleID = objc_msgSend_ams_isManagedAppleID(v5, v6, v7, v8, v9);

  return isManagedAppleID;
}

- (void)didChangeStoreAccount:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  id v20;

  if (objc_msgSend_iTunesAccountDidChangeForACAccountNotification_(MTAccountController, a2, (uint64_t)a3, v3, v4))
  {
    objc_msgSend__updateActiveAccount(self, v6, v7, v8, v9);
    if (objc_msgSend_isUserLoggedIn(self, v10, v11, v12, v13))
    {
      objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], v14, v15, v16, v17);
      v20 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_postNotificationName_object_(v20, v18, (uint64_t)CFSTR("MTShouldCheckShowWelcomeNotification"), 0, v19);

    }
  }
}

- (id)_activeAccountBlocking
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  objc_msgSend_ams_sharedAccountStore(MEMORY[0x24BDB4398], a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ams_activeiTunesAccount(v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)_updateActiveAccount
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *accountQueue;
  id v13;
  _QWORD v14[5];
  id v15;

  objc_msgSend_activeDsid(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringValue(v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  accountQueue = self->_accountQueue;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = sub_21735AEA8;
  v14[3] = &unk_24D744E70;
  v14[4] = self;
  v15 = v11;
  v13 = v11;
  dispatch_async(accountQueue, v14);

}

+ (BOOL)iTunesAccountDidChangeForACAccountNotification:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  char isEqualToString;

  v3 = a3;
  objc_msgSend_userInfo(v3, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x24BDB40B8];
  objc_msgSend_objectForKeyedSubscript_(v8, v10, *MEMORY[0x24BDB40B8], v11, v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    objc_msgSend_userInfo(v3, v13, v14, v15, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v18, v19, v9, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    isEqualToString = objc_msgSend_isEqualToString_(v22, v23, *MEMORY[0x24BDB4180], v24, v25);

  }
  else
  {
    isEqualToString = 1;
  }

  return isEqualToString;
}

- (BOOL)hasFetchedInitialAccount
{
  return self->_hasFetchedInitialAccount;
}

- (void)setHasFetchedInitialAccount:(BOOL)a3
{
  self->_hasFetchedInitialAccount = a3;
}

- (ACAccount)accountOverride
{
  return self->_accountOverride;
}

- (void)setAccountOverride:(id)a3
{
  objc_storeStrong((id *)&self->_accountOverride, a3);
}

- (NSMutableSet)inFlightAuthRequests
{
  return self->_inFlightAuthRequests;
}

- (void)setInFlightAuthRequests:(id)a3
{
  objc_storeStrong((id *)&self->_inFlightAuthRequests, a3);
}

- (NSMutableSet)declinedAuthRequests
{
  return self->_declinedAuthRequests;
}

- (void)setDeclinedAuthRequests:(id)a3
{
  objc_storeStrong((id *)&self->_declinedAuthRequests, a3);
}

- (ACAccount)_activeAccount
{
  return self->__activeAccount;
}

- (void)set_activeAccount:(id)a3
{
  objc_storeStrong((id *)&self->__activeAccount, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__activeAccount, 0);
  objc_storeStrong((id *)&self->_declinedAuthRequests, 0);
  objc_storeStrong((id *)&self->_inFlightAuthRequests, 0);
  objc_storeStrong((id *)&self->_accountOverride, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_accountQueue, 0);
}

@end
