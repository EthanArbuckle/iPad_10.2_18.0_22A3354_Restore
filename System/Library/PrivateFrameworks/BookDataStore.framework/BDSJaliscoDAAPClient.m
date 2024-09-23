@implementation BDSJaliscoDAAPClient

+ (BDSJaliscoDAAPClient)sharedClient
{
  if (qword_253F3B158 != -1)
    dispatch_once(&qword_253F3B158, &unk_24F089FC8);
  return (BDSJaliscoDAAPClient *)(id)qword_253F3B160;
}

- (BDSJaliscoDAAPClient)init
{
  BDSJaliscoDAAPClient *v2;
  BDSServiceProxy *v3;
  BDSServiceProxy *serviceProxy;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BDSJaliscoDAAPClient;
  v2 = -[BDSJaliscoDAAPClient init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(BDSServiceProxy);
    serviceProxy = v2->_serviceProxy;
    v2->_serviceProxy = v3;

    v2->_familyUpdateInProgress = 0;
  }
  return v2;
}

- (void)updatePolitely:(BOOL)a3 reason:(int64_t)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  id v14;

  v6 = a3;
  v8 = a5;
  objc_msgSend_serviceProxy(self, v9, v10, v11, v12);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_updatePolitely_reason_completion_(v14, v13, v6, a4, (uint64_t)v8);

}

- (void)updatePolitely:(BOOL)a3 reason:(int64_t)a4 completionWithError:(id)a5
{
  _BOOL8 v6;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  id v14;

  v6 = a3;
  v8 = a5;
  objc_msgSend_serviceProxy(self, v9, v10, v11, v12);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_updatePolitely_reason_completionWithError_(v14, v13, v6, a4, (uint64_t)v8);

}

- (void)updatePolitelyAfterSignOut:(BOOL)a3 reason:(int64_t)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  id v14;

  v6 = a3;
  v8 = a5;
  objc_msgSend_serviceProxy(self, v9, v10, v11, v12);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_updatePolitelyAfterSignOut_reason_completion_(v14, v13, v6, a4, (uint64_t)v8);

}

- (void)updatePolitelyAfterSignIn:(BOOL)a3 reason:(int64_t)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  id v14;

  v6 = a3;
  v8 = a5;
  objc_msgSend_serviceProxy(self, v9, v10, v11, v12);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_updatePolitelyAfterSignIn_reason_completion_(v14, v13, v6, a4, (uint64_t)v8);

}

- (void)updateFamilyPolitely:(BOOL)a3 reason:(int64_t)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, const char *, uint64_t, uint64_t, uint64_t);
  void *v23;
  BDSJaliscoDAAPClient *v24;
  id v25;

  v6 = a3;
  v8 = a5;
  objc_msgSend_setFamilyUpdateInProgress_(self, v9, 1, v10, v11);
  v20 = MEMORY[0x24BDAC760];
  v21 = 3221225472;
  v22 = sub_227D899B4;
  v23 = &unk_24F089FF0;
  v24 = self;
  v25 = v8;
  v12 = v8;
  v13 = _Block_copy(&v20);
  objc_msgSend_serviceProxy(self, v14, v15, v16, v17, v20, v21, v22, v23, v24);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_updateFamilyPolitely_reason_completion_(v18, v19, v6, a4, (uint64_t)v13);

}

- (void)updateFamilyPolitely:(BOOL)a3 reason:(int64_t)a4 completionWithError:(id)a5
{
  _BOOL8 v6;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t, void *);
  void *v23;
  BDSJaliscoDAAPClient *v24;
  id v25;

  v6 = a3;
  v8 = a5;
  objc_msgSend_setFamilyUpdateInProgress_(self, v9, 1, v10, v11);
  v20 = MEMORY[0x24BDAC760];
  v21 = 3221225472;
  v22 = sub_227D89AD0;
  v23 = &unk_24F089E78;
  v24 = self;
  v25 = v8;
  v12 = v8;
  v13 = _Block_copy(&v20);
  objc_msgSend_serviceProxy(self, v14, v15, v16, v17, v20, v21, v22, v23, v24);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_updateFamilyPolitely_reason_completionWithError_(v18, v19, v6, a4, (uint64_t)v13);

}

- (void)setItemHidden:(BOOL)a3 forStoreID:(id)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  id v15;

  v6 = a3;
  v8 = a5;
  v9 = a4;
  objc_msgSend_serviceProxy(self, v10, v11, v12, v13);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setItemHidden_forStoreID_completion_(v15, v14, v6, (uint64_t)v9, (uint64_t)v8);

}

- (void)fetchAllHiddenItemStoreIDsWithCompletion:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v4 = a3;
  objc_msgSend_serviceProxy(self, v5, v6, v7, v8);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fetchAllHiddenItemStoreIDsWithCompletion_(v12, v9, (uint64_t)v4, v10, v11);

}

- (void)resetPurchasedTokenForStoreIDs:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  id v14;

  v6 = a4;
  v7 = a3;
  objc_msgSend_serviceProxy(self, v8, v9, v10, v11);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_resetPurchasedTokenForStoreIDs_completion_(v14, v12, (uint64_t)v7, (uint64_t)v6, v13);

}

- (void)hideItemsWithStoreIDs:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  id v14;

  v6 = a4;
  v7 = a3;
  objc_msgSend_serviceProxy(self, v8, v9, v10, v11);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_hideItemsWithStoreIDs_completion_(v14, v12, (uint64_t)v7, (uint64_t)v6, v13);

}

- (void)deleteItemsWithStoreIDs:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  id v14;

  v6 = a4;
  v7 = a3;
  objc_msgSend_serviceProxy(self, v8, v9, v10, v11);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deleteItemsWithStoreIDs_completion_(v14, v12, (uint64_t)v7, (uint64_t)v6, v13);

}

- (void)resetStaleJaliscoDatabaseWithCompletion:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v4 = a3;
  objc_msgSend_serviceProxy(self, v5, v6, v7, v8);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_resetStaleJaliscoDatabaseWithCompletion_(v12, v9, (uint64_t)v4, v10, v11);

}

- (BOOL)familyUpdateInProgress
{
  return self->_familyUpdateInProgress;
}

- (void)setFamilyUpdateInProgress:(BOOL)a3
{
  self->_familyUpdateInProgress = a3;
}

- (BOOL)storeAuthenticationRequired
{
  return self->_storeAuthenticationRequired;
}

- (void)setStoreAuthenticationRequired:(BOOL)a3
{
  self->_storeAuthenticationRequired = a3;
}

- (BDSServiceProxy)serviceProxy
{
  return self->_serviceProxy;
}

- (void)setServiceProxy:(id)a3
{
  objc_storeStrong((id *)&self->_serviceProxy, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceProxy, 0);
}

@end
