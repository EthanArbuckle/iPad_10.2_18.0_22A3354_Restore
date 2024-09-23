@implementation BDSCloudSyncDiagnosticServiceClient

+ (id)sharedServiceProxy
{
  if (qword_253F3C710 != -1)
    dispatch_once(&qword_253F3C710, &unk_24F08A4D8);
  return (id)qword_253F3C6E0;
}

- (BDSCloudSyncDiagnosticServiceClient)init
{
  BDSCloudSyncDiagnosticServiceClient *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  BDSCloudSyncDiagnosticServiceClient *v7;
  uint64_t v8;
  BDSServiceProtocol *serviceProxy;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)BDSCloudSyncDiagnosticServiceClient;
  v2 = -[BDSCloudSyncDiagnosticServiceClient init](&v11, sel_init);
  v7 = v2;
  if (v2)
  {
    v2->_accessLock._os_unfair_lock_opaque = 0;
    objc_msgSend_sharedServiceProxy(BDSCloudSyncDiagnosticServiceClient, v3, v4, v5, v6);
    v8 = objc_claimAutoreleasedReturnValue();
    serviceProxy = v7->_serviceProxy;
    v7->_serviceProxy = (BDSServiceProtocol *)v8;

  }
  return v7;
}

- (void)clearSyncMetadata:(id)a3
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
  objc_msgSend_clearSyncMetadata_(v12, v9, (uint64_t)v4, v10, v11);

}

- (void)forceFetchRemoteChanges:(id)a3
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
  objc_msgSend_forceFetchRemoteChanges_(v12, v9, (uint64_t)v4, v10, v11);

}

- (void)detachWithCompletionHandler:(id)a3
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
  objc_msgSend_cloudSyncDiagnosticDetachWithCompletionHandler_(v12, v9, (uint64_t)v4, v10, v11);

}

- (void)findLocalIdDupesWithCompletionHandler:(id)a3
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
  objc_msgSend_cloudSyncDiagnosticFindLocalIdDupesWithCompletionHandler_(v12, v9, (uint64_t)v4, v10, v11);

}

- (void)diagnosticInfoWithCompletionHandler:(id)a3
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
  objc_msgSend_cloudSyncDiagnosticInfoWithCompletionHandler_(v12, v9, (uint64_t)v4, v10, v11);

}

- (BDSServiceProtocol)serviceProxy
{
  return self->_serviceProxy;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceProxy, 0);
}

@end
