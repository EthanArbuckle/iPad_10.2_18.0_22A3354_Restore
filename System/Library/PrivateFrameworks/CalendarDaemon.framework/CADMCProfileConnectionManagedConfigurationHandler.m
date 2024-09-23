@implementation CADMCProfileConnectionManagedConfigurationHandler

- (BOOL)isOpenInRestrictionInEffect
{
  void *v2;
  char v3;

  -[CADMCProfileConnectionManagedConfigurationHandler connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isOpenInRestrictionInEffect");

  return v3;
}

- (MCProfileConnection)connection
{
  return self->_connection;
}

- (CADMCProfileConnectionManagedConfigurationHandler)initWithMCProfileConnection:(id)a3
{
  id v5;
  CADMCProfileConnectionManagedConfigurationHandler *v6;
  CADMCProfileConnectionManagedConfigurationHandler *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CADMCProfileConnectionManagedConfigurationHandler;
  v6 = -[CADMCProfileConnectionManagedConfigurationHandler init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_connection, a3);

  return v7;
}

- (BOOL)mayShowLocalAccountsForBundleID:(id)a3 sourceAccountManagement:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  -[CADMCProfileConnectionManagedConfigurationHandler connection](self, "connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v7, "mayShowLocalAccountsForBundleID:sourceAccountManagement:", v6, v4);

  return v4;
}

- (BOOL)mayShowLocalAccountsForTargetBundleID:(id)a3 targetAccountManagement:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  -[CADMCProfileConnectionManagedConfigurationHandler connection](self, "connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v7, "mayShowLocalAccountsForTargetBundleID:targetAccountManagement:", v6, v4);

  return v4;
}

- (id)filteredOpenInAccounts:(id)a3 originatingAppBundleID:(id)a4 sourceAccountManagement:(int)a5
{
  uint64_t v5;
  id v8;
  id v9;
  void *v10;
  void *v11;

  v5 = *(_QWORD *)&a5;
  v8 = a4;
  v9 = a3;
  -[CADMCProfileConnectionManagedConfigurationHandler connection](self, "connection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "filteredOpenInAccounts:originatingAppBundleID:sourceAccountManagement:", v9, v8, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)filteredOpenInOriginatingAccounts:(id)a3 targetAppBundleID:(id)a4 targetAccountManagement:(int)a5
{
  uint64_t v5;
  id v8;
  id v9;
  void *v10;
  void *v11;

  v5 = *(_QWORD *)&a5;
  v8 = a4;
  v9 = a3;
  -[CADMCProfileConnectionManagedConfigurationHandler connection](self, "connection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "filteredOpenInOriginatingAccounts:targetAppBundleID:targetAccountManagement:", v9, v8, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
