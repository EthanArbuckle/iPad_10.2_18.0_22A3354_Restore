@implementation CNManagedProfileConnection

- (BOOL)isOpenInRestrictionInEffect
{
  void *v2;
  char v3;

  -[CNManagedProfileConnection profileConnection](self, "profileConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isOpenInRestrictionInEffect");

  return v3;
}

- (MCProfileConnection)profileConnection
{
  return self->_profileConnection;
}

+ (id)sharedConnection
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__CNManagedProfileConnection_sharedConnection__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedConnection_cn_once_token_2 != -1)
    dispatch_once(&sharedConnection_cn_once_token_2, block);
  return (id)sharedConnection_cn_once_object_2;
}

void __46__CNManagedProfileConnection_sharedConnection__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedConnection_cn_once_object_2;
  sharedConnection_cn_once_object_2 = (uint64_t)v1;

}

- (CNManagedProfileConnection)init
{
  void *v3;
  CNManagedProfileConnection *v4;

  -[objc_class sharedConnection](getMCProfileConnectionClass(), "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CNManagedProfileConnection initWithProfileConnection:](self, "initWithProfileConnection:", v3);

  return v4;
}

- (CNManagedProfileConnection)initWithProfileConnection:(id)a3
{
  id v5;
  CNManagedProfileConnection *v6;
  CNManagedProfileConnection *v7;
  CNManagedProfileConnection *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNManagedProfileConnection;
  v6 = -[CNManagedProfileConnection init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_profileConnection, a3);
    v8 = v7;
  }

  return v7;
}

- (BOOL)mayShowLocalContactsAccountsForBundleID:(id)a3 sourceAccountManagement:(int64_t)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[CNManagedProfileConnection profileConnection](self, "profileConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "mayShowLocalContactsAccountsForBundleID:sourceAccountManagement:", v6, a4);

  return a4;
}

- (BOOL)mayShowLocalContactsAccountsForTargetBundleID:(id)a3 targetAccountManagement:(int64_t)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[CNManagedProfileConnection profileConnection](self, "profileConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "mayShowLocalContactsAccountsForTargetBundleID:targetAccountManagement:", v6, a4);

  return a4;
}

- (id)filteredOpenInAccounts:(id)a3 originatingAppBundleID:(id)a4 sourceAccountManagement:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a4;
  v9 = a3;
  -[CNManagedProfileConnection profileConnection](self, "profileConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "filteredOpenInContactsAccounts:originatingAppBundleID:sourceAccountManagement:", v9, v8, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)filteredOpenInOriginatingAccounts:(id)a3 targetAppBundleID:(id)a4 targetAccountManagement:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a4;
  v9 = a3;
  -[CNManagedProfileConnection profileConnection](self, "profileConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "filteredOpenInOriginatingContactsAccounts:targetAppBundleID:targetAccountManagement:", v9, v8, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)setProfileConnection:(id)a3
{
  objc_storeStrong((id *)&self->_profileConnection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileConnection, 0);
}

@end
