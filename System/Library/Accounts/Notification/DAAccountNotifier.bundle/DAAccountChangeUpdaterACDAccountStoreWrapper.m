@implementation DAAccountChangeUpdaterACDAccountStoreWrapper

- (DAAccountChangeUpdaterACDAccountStoreWrapper)initWithAccount:(id)a3 store:(id)a4
{
  id v7;
  id v8;
  DAAccountChangeUpdaterACDAccountStoreWrapper *v9;
  DAAccountChangeUpdaterACDAccountStoreWrapper *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)DAAccountChangeUpdaterACDAccountStoreWrapper;
  v9 = -[DAAccountChangeUpdaterACDAccountStoreWrapper init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_account, a3);
    objc_storeStrong((id *)&v10->_store, a4);
  }

  return v10;
}

- (void)addAccount:(id)a3 withCompletionHandler:(id)a4
{
  ACDAccountStore *store;
  void (**v6)(id, BOOL, id);
  const char *v7;
  id v8;
  id v9;

  store = self->_store;
  v9 = 0;
  v6 = (void (**)(id, BOOL, id))a4;
  objc_msgSend_addAccountNoSave_error_(store, v7, (uint64_t)a3, (uint64_t)&v9);
  v8 = v9;
  v6[2](v6, v8 == 0, v8);

}

- (void)updateAccount:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  int isEqualToString;
  const char *v19;
  ACDAccountStore *store;
  id v21;
  id v22;

  v6 = a3;
  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  objc_msgSend_identifier(v6, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_identifier(self->_account, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v11, v16, (uint64_t)v15, v17);

  if (isEqualToString)
  {
    v7[2](v7, 1, 0);
  }
  else
  {
    store = self->_store;
    v22 = 0;
    objc_msgSend_updateAccountNoSave_error_(store, v19, (uint64_t)v6, (uint64_t)&v22);
    v21 = v22;
    ((void (**)(id, uint64_t, id))v7)[2](v7, v21 == 0, v21);

  }
}

- (void)removeAccount:(id)a3 completion:(id)a4
{
  ACDAccountStore *store;
  void (**v6)(id, BOOL, id);
  const char *v7;
  id v8;
  id v9;

  store = self->_store;
  v9 = 0;
  v6 = (void (**)(id, BOOL, id))a4;
  objc_msgSend_deleteAccountNoSave_error_(store, v7, (uint64_t)a3, (uint64_t)&v9);
  v8 = v9;
  v6[2](v6, v8 == 0, v8);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
