@implementation BMStorePublisherManagerProtectedState

- (BMStreamDatastoreReader)localDatastore
{
  return self->_localDatastore;
}

- (void)setLocalDatastore:(id)a3
{
  objc_storeStrong((id *)&self->_localDatastore, a3);
}

- (BMStorePublisherManagerProtectedState)init
{
  BMStorePublisherManagerProtectedState *v2;
  BMStorePublisherManagerProtectedState *v3;
  BMStreamDatastoreReader *localDatastore;
  uint64_t v5;
  NSMutableDictionary *remoteDatastores;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BMStorePublisherManagerProtectedState;
  v2 = -[BMStorePublisherManagerProtectedState init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    localDatastore = v2->_localDatastore;
    v2->_localDatastore = 0;

    v5 = objc_opt_new();
    remoteDatastores = v3->_remoteDatastores;
    v3->_remoteDatastores = (NSMutableDictionary *)v5;

  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteDatastores, 0);
  objc_storeStrong((id *)&self->_localDatastore, 0);
}

- (NSMutableDictionary)remoteDatastores
{
  return self->_remoteDatastores;
}

- (void)setRemoteDatastores:(id)a3
{
  objc_storeStrong((id *)&self->_remoteDatastores, a3);
}

@end
