@implementation BDSReadingDataMigrationManagerClient

- (BDSReadingDataMigrationManagerClient)init
{
  BDSReadingDataMigrationManagerClient *v2;
  BDSServiceProxy *v3;
  BDSServiceProxy *serviceProxy;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BDSReadingDataMigrationManagerClient;
  v2 = -[BDSReadingDataMigrationManagerClient init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(BDSServiceProxy);
    serviceProxy = v2->_serviceProxy;
    v2->_serviceProxy = v3;

  }
  return v2;
}

- (void)mergeMovedReadingHistoryDataWithCompletionHandler:(id)a3
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
  objc_msgSend_mergeMovedReadingHistoryDataWithCompletionHandler_(v12, v9, (uint64_t)v4, v10, v11);

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
