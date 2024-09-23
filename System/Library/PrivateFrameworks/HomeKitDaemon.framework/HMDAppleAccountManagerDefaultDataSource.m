@implementation HMDAppleAccountManagerDefaultDataSource

- (HMDAppleAccountManagerDefaultDataSource)initWithQueue:(id)a3
{
  id v5;
  HMDAppleAccountManagerDefaultDataSource *v6;
  HMDAppleAccountManagerDefaultDataSource *v7;
  id v8;
  uint64_t v9;
  HMDAPSConnection *apsConnection;
  uint64_t v11;
  NSNotificationCenter *notificationCenter;
  HMDACAccountStore *v13;
  HMDACAccountStore *accountStore;
  HMDAccountChangeObserver *v15;
  id accountChangeObserver;
  objc_super v18;

  v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)HMDAppleAccountManagerDefaultDataSource;
  v6 = -[HMDAppleAccountManagerDefaultDataSource init](&v18, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    v8 = objc_alloc(MEMORY[0x24BE08738]);
    v9 = objc_msgSend(v8, "initWithEnvironmentName:namedDelegatePort:queue:", *MEMORY[0x24BE08720], *MEMORY[0x24BE08708], v5);
    apsConnection = v7->_apsConnection;
    v7->_apsConnection = (HMDAPSConnection *)v9;

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v11 = objc_claimAutoreleasedReturnValue();
    notificationCenter = v7->_notificationCenter;
    v7->_notificationCenter = (NSNotificationCenter *)v11;

    v13 = (HMDACAccountStore *)objc_alloc_init(MEMORY[0x24BDB4398]);
    accountStore = v7->_accountStore;
    v7->_accountStore = v13;

    v15 = objc_alloc_init(HMDAccountChangeObserver);
    accountChangeObserver = v7->_accountChangeObserver;
    v7->_accountChangeObserver = v15;

  }
  return v7;
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8, 1);
}

- (HMDAPSConnection)apsConnection
{
  return (HMDAPSConnection *)objc_getProperty(self, a2, 16, 1);
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 24, 1);
}

- (HMDACAccountStore)accountStore
{
  return (HMDACAccountStore *)objc_getProperty(self, a2, 32, 1);
}

- (id)accountChangeObserver
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_accountChangeObserver, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_apsConnection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
