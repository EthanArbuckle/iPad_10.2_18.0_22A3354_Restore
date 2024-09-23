@implementation CLSUtilityService

+ (Class)endpointClass
{
  return (Class)objc_opt_class();
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D40A6EE4;
  block[3] = &unk_1E9749D50;
  block[4] = a1;
  if (qword_1ED0FB7E0 != -1)
    dispatch_once(&qword_1ED0FB7E0, block);
  return (id)qword_1ED0FB7D8;
}

- (CLSUtilityService)initWithEndpoint:(id)a3
{
  id v4;
  const char *v5;
  CLSUtilityService *v6;
  void *v7;
  id v8;
  const char *v9;
  void *v10;
  CLSUtilityService *v11;
  int v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  CLSEndpointConnection *endpointConnection;
  void *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  NSObject *v25;
  NSObject *v26;
  dispatch_queue_t v27;
  OS_dispatch_queue *queue;
  objc_super v30;
  uint64_t v31;
  id v32;

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)CLSUtilityService;
  v6 = -[CLSUtilityService init](&v30, sel_init);
  if (!v6)
  {
LABEL_9:
    v11 = v6;
    goto LABEL_10;
  }
  v32 = 0;
  objc_msgSend_entitlementsForCurrentTaskWithError_(CLSEntitlements, v5, (uint64_t)&v32);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v32;
  if (v8)
  {
    v10 = v8;

    v11 = 0;
    goto LABEL_10;
  }
  v31 = 0;
  v12 = objc_msgSend_BOOLValueForEntitlement_error_(v7, v9, (uint64_t)CFSTR("com.apple.private.ClassKit.internal"), &v31);
  v13 = v31;

  v11 = 0;
  if (!v13 && v12)
  {
    v14 = (void *)objc_opt_class();
    v17 = (void *)objc_msgSend_endpointClass(v14, v15, v16);
    objc_msgSend_instanceForEndpoint_(v17, v18, (uint64_t)v4);
    v19 = objc_claimAutoreleasedReturnValue();
    endpointConnection = v6->_endpointConnection;
    v6->_endpointConnection = (CLSEndpointConnection *)v19;

    CLSDispatchQueueName(v6, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (const char *)objc_msgSend_UTF8String(v21, v22, v23);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v25 = objc_claimAutoreleasedReturnValue();
    if (qword_1ED0FB7F0 != -1)
      dispatch_once(&qword_1ED0FB7F0, &unk_1E974B908);
    v26 = (id)qword_1ED0FB7E8;
    v27 = dispatch_queue_create_with_target_V2(v24, v25, v26);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v27;

    goto LABEL_9;
  }
LABEL_10:

  return v11;
}

- (id)utilityServer:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;

  v4 = a3;
  objc_msgSend_endpointConnection(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_utilityServer_(v7, v8, (uint64_t)v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)syncUtilityServer:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;

  v4 = a3;
  objc_msgSend_endpointConnection(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_syncUtilityServer_(v7, v8, (uint64_t)v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)databasePathWithCompletion:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  void *v7;
  const char *v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1D40A71E4;
  v9[3] = &unk_1E9749F88;
  v10 = v4;
  v5 = v4;
  objc_msgSend_utilityServer_(self, v6, (uint64_t)v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_remote_databasePathWithCompletion_(v7, v8, (uint64_t)v5);

}

- (void)recreateDatabaseWithCompletion:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  id v10;
  const char *v11;
  void *v12;
  id v13;
  const char *v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[4];
  id v18;

  v4 = a3;
  objc_msgSend_endpointConnection(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addBarrierBlock_(v7, v8, (uint64_t)&unk_1E9749B10);

  v9 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = sub_1D40A72F0;
  v17[3] = &unk_1E9749F88;
  v10 = v4;
  v18 = v10;
  objc_msgSend_utilityServer_(self, v11, (uint64_t)v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = sub_1D40A7304;
  v15[3] = &unk_1E974B388;
  v15[4] = self;
  v16 = v10;
  v13 = v10;
  objc_msgSend_remote_recreateDatabaseWithCompletion_(v12, v14, (uint64_t)v15);

}

- (void)recreateDatabase:(BOOL)a3 andTerminateDaemonWithCompletion:(id)a4
{
  _BOOL8 v4;
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  id v12;
  const char *v13;
  void *v14;
  id v15;
  const char *v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[4];
  id v20;

  v4 = a3;
  v6 = a4;
  objc_msgSend_endpointConnection(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addBarrierBlock_(v9, v10, (uint64_t)&unk_1E974B868);

  v11 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = sub_1D40A74F0;
  v19[3] = &unk_1E9749F88;
  v12 = v6;
  v20 = v12;
  objc_msgSend_utilityServer_(self, v13, (uint64_t)v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v11;
  v17[1] = 3221225472;
  v17[2] = sub_1D40A7504;
  v17[3] = &unk_1E974B388;
  v17[4] = self;
  v18 = v12;
  v15 = v12;
  objc_msgSend_remote_recreateDatabase_andTerminateDaemonWithCompletion_(v14, v16, v4, v17);

}

- (void)recreateDevelopmentDatabaseWithCompletion:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  id v10;
  const char *v11;
  void *v12;
  id v13;
  const char *v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[4];
  id v18;

  v4 = a3;
  objc_msgSend_endpointConnection(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addBarrierBlock_(v7, v8, (uint64_t)&unk_1E974B888);

  v9 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = sub_1D40A76B0;
  v17[3] = &unk_1E9749F88;
  v10 = v4;
  v18 = v10;
  objc_msgSend_utilityServer_(self, v11, (uint64_t)v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = sub_1D40A76C4;
  v15[3] = &unk_1E974B388;
  v15[4] = self;
  v16 = v10;
  v13 = v10;
  objc_msgSend_remote_recreateDevelopmentDatabaseWithCompletion_(v12, v14, (uint64_t)v15);

}

- (void)syncRecreateDevelopmentDatabaseWithCompletion:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  id v10;
  const char *v11;
  void *v12;
  id v13;
  const char *v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[4];
  id v18;

  v4 = a3;
  objc_msgSend_endpointConnection(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addBarrierBlock_(v7, v8, (uint64_t)&unk_1E974B8A8);

  v9 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = sub_1D40A78A0;
  v17[3] = &unk_1E9749F88;
  v10 = v4;
  v18 = v10;
  objc_msgSend_syncUtilityServer_(self, v11, (uint64_t)v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = sub_1D40A78B4;
  v15[3] = &unk_1E974B388;
  v15[4] = self;
  v16 = v10;
  v13 = v10;
  objc_msgSend_remote_recreateDevelopmentDatabaseWithCompletion_(v12, v14, (uint64_t)v15);

}

- (void)getDevModeWithCompletion:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  void *v7;
  const char *v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1D40A7A24;
  v9[3] = &unk_1E9749F88;
  v10 = v4;
  v5 = v4;
  objc_msgSend_utilityServer_(self, v6, (uint64_t)v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_remote_getDevModeWithCompletion_(v7, v8, (uint64_t)v5);

}

- (void)syncGetDevModeWithCompletion:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  void *v7;
  const char *v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1D40A7AC4;
  v9[3] = &unk_1E9749F88;
  v10 = v4;
  v5 = v4;
  objc_msgSend_syncUtilityServer_(self, v6, (uint64_t)v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_remote_getDevModeWithCompletion_(v7, v8, (uint64_t)v5);

}

- (void)setDevMode:(int)a3 completion:(id)a4
{
  uint64_t v4;
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  const char *v11;
  const char *v12;
  id v13;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  objc_msgSend_endpointConnection(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addBarrierBlock_(v9, v10, (uint64_t)&unk_1E974B8C8);

  objc_msgSend_utilityServer_(self, v11, (uint64_t)v6);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_remote_setDevMode_completion_(v13, v12, v4, v6);

}

- (void)syncSetDevMode:(int)a3 completion:(id)a4
{
  uint64_t v4;
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  const char *v11;
  const char *v12;
  id v13;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  objc_msgSend_endpointConnection(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addBarrierBlock_(v9, v10, (uint64_t)&unk_1E974B8E8);

  objc_msgSend_syncUtilityServer_(self, v11, (uint64_t)v6);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_remote_setDevMode_completion_(v13, v12, v4, v6);

}

- (void)getClassKitCatalogEnvironmentWithCompletion:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  void *v7;
  const char *v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1D40A7C6C;
  v9[3] = &unk_1E9749F88;
  v10 = v4;
  v5 = v4;
  objc_msgSend_utilityServer_(self, v6, (uint64_t)v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_remote_getClassKitCatalogEnvironmentWithCompletion_(v7, v8, (uint64_t)v5);

}

- (void)syncGetClassKitCatalogEnvironmentWithCompletion:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  void *v7;
  const char *v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1D40A7D0C;
  v9[3] = &unk_1E9749F88;
  v10 = v4;
  v5 = v4;
  objc_msgSend_syncUtilityServer_(self, v6, (uint64_t)v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_remote_getClassKitCatalogEnvironmentWithCompletion_(v7, v8, (uint64_t)v5);

}

- (void)setClassKitCatalogEnvironment:(int64_t)a3 completion:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  void *v9;
  const char *v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_1D40A7DBC;
  v11[3] = &unk_1E9749F88;
  v12 = v6;
  v7 = v6;
  objc_msgSend_utilityServer_(self, v8, (uint64_t)v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_remote_setClassKitCatalogEnvironment_completion_(v9, v10, a3, v7);

}

- (void)syncSetClassKitCatalogEnvironment:(int64_t)a3 completion:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  void *v9;
  const char *v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_1D40A7E64;
  v11[3] = &unk_1E9749F88;
  v12 = v6;
  v7 = v6;
  objc_msgSend_syncUtilityServer_(self, v8, (uint64_t)v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_remote_setClassKitCatalogEnvironment_completion_(v9, v10, a3, v7);

}

- (void)syncStatsWithCompletion:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  void *v7;
  const char *v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1D40A7EFC;
  v9[3] = &unk_1E9749F88;
  v10 = v4;
  v5 = v4;
  objc_msgSend_utilityServer_(self, v6, (uint64_t)v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_remote_syncStatsWithCompletion_(v7, v8, (uint64_t)v5);

}

- (void)syncPushWithCompletion:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  void *v7;
  const char *v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1D40A7F9C;
  v9[3] = &unk_1E9749F88;
  v10 = v4;
  v5 = v4;
  objc_msgSend_utilityServer_(self, v6, (uint64_t)v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_remote_syncPushWithCompletion_(v7, v8, (uint64_t)v5);

}

- (void)syncFetchWithCompletion:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  void *v7;
  const char *v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1D40A803C;
  v9[3] = &unk_1E9749F88;
  v10 = v4;
  v5 = v4;
  objc_msgSend_utilityServer_(self, v6, (uint64_t)v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_remote_syncFetchWithCompletion_(v7, v8, (uint64_t)v5);

}

- (void)syncBootstrapWithCompletion:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  void *v7;
  const char *v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1D40A80DC;
  v9[3] = &unk_1E9749F88;
  v10 = v4;
  v5 = v4;
  objc_msgSend_utilityServer_(self, v6, (uint64_t)v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_remote_syncBootstrapWithCompletion_(v7, v8, (uint64_t)v5);

}

- (void)fetchReportsWithPredicate:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  const char *v9;
  void *v10;
  const char *v11;
  _QWORD v12[4];
  id v13;

  v6 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_1D40A8198;
  v12[3] = &unk_1E9749F88;
  v13 = v6;
  v7 = v6;
  v8 = a3;
  objc_msgSend_utilityServer_(self, v9, (uint64_t)v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_remote_fetchReportsWithPredicate_completion_(v10, v11, (uint64_t)v8, v7);

}

- (void)statusWithCompletion:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  void *v7;
  const char *v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1D40A8238;
  v9[3] = &unk_1E9749F88;
  v10 = v4;
  v5 = v4;
  objc_msgSend_utilityServer_(self, v6, (uint64_t)v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_remote_statusWithCompletion_(v7, v8, (uint64_t)v5);

}

- (void)renewCredentialsWithCompletion:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  void *v7;
  const char *v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1D40A82D8;
  v9[3] = &unk_1E9749F88;
  v10 = v4;
  v5 = v4;
  objc_msgSend_utilityServer_(self, v6, (uint64_t)v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_remote_renewCredentialsWithCompletion_(v7, v8, (uint64_t)v5);

}

- (void)addAuthorizationStatus:(unint64_t)a3 forContextAtPath:(id)a4 completion:(id)a5
{
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  const char *v12;
  void *v13;
  id v14;
  const char *v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[4];
  id v19;

  v8 = a5;
  v9 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = sub_1D40A83E4;
  v18[3] = &unk_1E9749F88;
  v10 = v8;
  v19 = v10;
  v11 = a4;
  objc_msgSend_utilityServer_(self, v12, (uint64_t)v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v9;
  v16[1] = 3221225472;
  v16[2] = sub_1D40A83F8;
  v16[3] = &unk_1E974B388;
  v16[4] = self;
  v17 = v10;
  v14 = v10;
  objc_msgSend_remote_addAuthorizationStatus_forContextAtPath_completion_(v13, v15, a3, v11, v16);

}

- (void)addAuthorizationStatus:(unint64_t)a3 forHandoutAssignedItem:(id)a4 completion:(id)a5
{
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  const char *v12;
  void *v13;
  id v14;
  const char *v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[4];
  id v19;

  v8 = a5;
  v9 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = sub_1D40A85D0;
  v18[3] = &unk_1E9749F88;
  v10 = v8;
  v19 = v10;
  v11 = a4;
  objc_msgSend_utilityServer_(self, v12, (uint64_t)v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v9;
  v16[1] = 3221225472;
  v16[2] = sub_1D40A85E4;
  v16[3] = &unk_1E974B388;
  v16[4] = self;
  v17 = v10;
  v14 = v10;
  objc_msgSend_remote_addAuthorizationStatus_forHandoutAssignedItem_completion_(v13, v15, a3, v11, v16);

}

- (void)removeAuthorizationStatus:(unint64_t)a3 forContextAtPath:(id)a4 completion:(id)a5
{
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  const char *v12;
  void *v13;
  id v14;
  const char *v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[4];
  id v19;

  v8 = a5;
  v9 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = sub_1D40A87BC;
  v18[3] = &unk_1E9749F88;
  v10 = v8;
  v19 = v10;
  v11 = a4;
  objc_msgSend_utilityServer_(self, v12, (uint64_t)v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v9;
  v16[1] = 3221225472;
  v16[2] = sub_1D40A87D0;
  v16[3] = &unk_1E974B388;
  v16[4] = self;
  v17 = v10;
  v14 = v10;
  objc_msgSend_remote_removeAuthorizationStatus_forContextAtPath_completion_(v13, v15, a3, v11, v16);

}

- (void)removeAuthorizationStatus:(unint64_t)a3 forHandoutAssignedItem:(id)a4 completion:(id)a5
{
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  const char *v12;
  void *v13;
  id v14;
  const char *v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[4];
  id v19;

  v8 = a5;
  v9 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = sub_1D40A89A8;
  v18[3] = &unk_1E9749F88;
  v10 = v8;
  v19 = v10;
  v11 = a4;
  objc_msgSend_utilityServer_(self, v12, (uint64_t)v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v9;
  v16[1] = 3221225472;
  v16[2] = sub_1D40A89BC;
  v16[3] = &unk_1E974B388;
  v16[4] = self;
  v17 = v10;
  v14 = v10;
  objc_msgSend_remote_removeAuthorizationStatus_forHandoutAssignedItem_completion_(v13, v15, a3, v11, v16);

}

- (void)authorizationStatusForContextAtPath:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  const char *v9;
  void *v10;
  const char *v11;
  _QWORD v12[4];
  id v13;

  v6 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_1D40A8B48;
  v12[3] = &unk_1E9749F88;
  v13 = v6;
  v7 = v6;
  v8 = a3;
  objc_msgSend_utilityServer_(self, v9, (uint64_t)v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_remote_authorizationStatusForContextAtPath_completion_(v10, v11, (uint64_t)v8, v7);

}

- (void)authorizationStatusForHandoutAssignedItem:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  const char *v9;
  void *v10;
  const char *v11;
  _QWORD v12[4];
  id v13;

  v6 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_1D40A8C04;
  v12[3] = &unk_1E9749F88;
  v13 = v6;
  v7 = v6;
  v8 = a3;
  objc_msgSend_utilityServer_(self, v9, (uint64_t)v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_remote_authorizationStatusForHandoutAssignedItem_completion_(v10, v11, (uint64_t)v8, v7);

}

- (void)addAdminRequestor:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  const char *v9;
  void *v10;
  const char *v11;
  _QWORD v12[4];
  id v13;

  v6 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_1D40A8CC0;
  v12[3] = &unk_1E9749F88;
  v13 = v6;
  v7 = v6;
  v8 = a3;
  objc_msgSend_utilityServer_(self, v9, (uint64_t)v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_remote_addAdminRequestor_completion_(v10, v11, (uint64_t)v8, v7);

}

- (void)addOrganization:(id)a3 withLocations:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  const char *v12;
  void *v13;
  const char *v14;
  _QWORD v15[4];
  id v16;

  v8 = a5;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_1D40A8D90;
  v15[3] = &unk_1E9749F88;
  v16 = v8;
  v9 = v8;
  v10 = a4;
  v11 = a3;
  objc_msgSend_utilityServer_(self, v12, (uint64_t)v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_remote_addOrganization_withLocations_completion_(v13, v14, (uint64_t)v11, v10, v9);

}

- (void)deleteOrganization:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  const char *v9;
  void *v10;
  const char *v11;
  _QWORD v12[4];
  id v13;

  v6 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_1D40A8E4C;
  v12[3] = &unk_1E9749F88;
  v13 = v6;
  v7 = v6;
  v8 = a3;
  objc_msgSend_utilityServer_(self, v9, (uint64_t)v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_remote_deleteOrganization_completion_(v10, v11, (uint64_t)v8, v7);

}

- (void)topLevelContentStoreCacheDirectoryURLWithCompletion:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  void *v7;
  const char *v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1D40A8EEC;
  v9[3] = &unk_1E9749F88;
  v10 = v4;
  v5 = v4;
  objc_msgSend_utilityServer_(self, v6, (uint64_t)v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_remote_topLevelContentStoreCacheDirectoryURLWithCompletion_(v7, v8, (uint64_t)v5);

}

- (void)currentUserContentStoreCacheDirectoryURLWithCompletion:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  void *v7;
  const char *v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1D40A8F8C;
  v9[3] = &unk_1E9749F88;
  v10 = v4;
  v5 = v4;
  objc_msgSend_utilityServer_(self, v6, (uint64_t)v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_remote_currentUserContentStoreCacheDirectoryURLWithCompletion_(v7, v8, (uint64_t)v5);

}

- (void)accountChangedTrigger:(id)a3
{
  id v4;
  void (**v5)(id, uint64_t, _QWORD);
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1D40A903C;
  v10[3] = &unk_1E9749F88;
  v11 = v4;
  v5 = (void (**)(id, uint64_t, _QWORD))v4;
  objc_msgSend_utilityServer_(self, v6, (uint64_t)v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_remote_accountChanged(v7, v8, v9);

  v5[2](v5, 1, 0);
}

- (void)getBootstrapMode:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  void *v7;
  const char *v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1D40A90DC;
  v9[3] = &unk_1E9749F88;
  v10 = v4;
  v5 = v4;
  objc_msgSend_utilityServer_(self, v6, (uint64_t)v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_remote_getBootstrapMode_(v7, v8, (uint64_t)v5);

}

- (void)setBootstrapMode:(int)a3 url:(id)a4 completion:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  id v10;
  const char *v11;
  void *v12;
  const char *v13;
  _QWORD v14[4];
  id v15;

  v6 = *(_QWORD *)&a3;
  v8 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_1D40A91A4;
  v14[3] = &unk_1E9749F88;
  v15 = v8;
  v9 = v8;
  v10 = a4;
  objc_msgSend_utilityServer_(self, v11, (uint64_t)v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_remote_setBootstrapMode_url_completion_(v12, v13, v6, v10, v9);

}

- (CLSEndpointConnection)endpointConnection
{
  return self->_endpointConnection;
}

- (void)setEndpointConnection:(id)a3
{
  objc_storeStrong((id *)&self->_endpointConnection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endpointConnection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
