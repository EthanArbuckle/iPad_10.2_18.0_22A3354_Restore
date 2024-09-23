@implementation BDSServiceProxy

- (void)userDatumForKey:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  void (**v20)(void *, _QWORD, void *);
  void *v21;
  _QWORD v22[4];
  id v23;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend_connectionHealthy(self, v8, v9, v10, v11))
  {
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = sub_227D7EBD8;
    v22[3] = &unk_24F089380;
    v12 = v7;
    v23 = v12;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v13, (uint64_t)v22, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_userDatumForKey_completion_(v16, v17, (uint64_t)v6, (uint64_t)v12, v18);

  }
  else
  {
    v20 = (void (**)(void *, _QWORD, void *))_Block_copy(v7);
    if (v20)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v19, (uint64_t)CFSTR("BDSErrorDomain"), 1000, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v20[2](v20, 0, v21);

    }
  }

}

- (BDSServiceProxy)initWithConnectionDelegate:(id)a3
{
  id v4;
  BDSServiceProxy *v5;
  BDSServiceProxy *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *notifyQueue;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  id v20;
  id location;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)BDSServiceProxy;
  v5 = -[BDSServiceProxy init](&v22, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_connectionDelegate, v4);
    objc_initWeak(&location, v6);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("BDSService Notify Queue", v7);
    notifyQueue = v6->_notifyQueue;
    v6->_notifyQueue = (OS_dispatch_queue *)v8;

    v10 = v6->_notifyQueue;
    v16 = MEMORY[0x24BDAC760];
    v17 = 3221225472;
    v18 = sub_227D76FC4;
    v19 = &unk_24F089318;
    objc_copyWeak(&v20, &location);
    notify_register_dispatch("com.apple.iBooks.BookDataStoreService.Started", &v6->_notifyToken, v10, &v16);
    objc_msgSend_formXPCConnection(v6, v11, v12, v13, v14, v16, v17, v18, v19);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

  return v6;
}

- (void)formXPCConnection
{
  NSObject *v3;
  id v4;
  const char *v5;
  uint64_t v6;
  NSXPCConnection *v7;
  NSXPCConnection *connection;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  BDSClientSideListener *v16;
  BDSClientSideListener *clientSideListener;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  BDSServiceProtocol *v48;
  BDSServiceProtocol *remoteObjectProxy;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  int v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  NSObject *v71;
  BDSServiceProtocol *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  void (*v84)(uint64_t);
  void *v85;
  id v86;
  id location;
  uint8_t buf[4];
  BDSServiceProtocol *v89;
  uint64_t v90;

  v90 = *MEMORY[0x24BDAC8D0];
  BDSCloudKitLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_227D4F000, v3, OS_LOG_TYPE_INFO, "Starting up BDSServiceProxy.", buf, 2u);
  }

  v4 = objc_alloc(MEMORY[0x24BDD1988]);
  v7 = (NSXPCConnection *)objc_msgSend_initWithMachServiceName_options_(v4, v5, (uint64_t)CFSTR("com.apple.iBooks.BookDataStoreService"), 0, v6);
  connection = self->_connection;
  self->_connection = v7;

  objc_msgSend_interfaceWithProtocol_(MEMORY[0x24BDD1990], v9, (uint64_t)&unk_255932E90, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_configureInterface_(BDSServiceProtocolInterface, v13, (uint64_t)v12, v14, v15);
  v16 = objc_alloc_init(BDSClientSideListener);
  clientSideListener = self->_clientSideListener;
  self->_clientSideListener = v16;

  objc_msgSend_connectionDelegate(self, v18, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDelegate_(self->_clientSideListener, v23, (uint64_t)v22, v24, v25);

  objc_msgSend_setRemoteObjectInterface_(self->_connection, v26, (uint64_t)v12, v27, v28);
  objc_msgSend_interfaceWithProtocol_(MEMORY[0x24BDD1990], v29, (uint64_t)&unk_2559334A0, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setExportedInterface_(self->_connection, v33, (uint64_t)v32, v34, v35);

  objc_msgSend_setExportedObject_(self->_connection, v36, (uint64_t)self->_clientSideListener, v37, v38);
  objc_initWeak(&location, self);
  objc_msgSend_setInterruptionHandler_(self->_connection, v39, (uint64_t)&unk_24F089338, v40, v41);
  v82 = MEMORY[0x24BDAC760];
  v83 = 3221225472;
  v84 = sub_227D7706C;
  v85 = &unk_24F089258;
  objc_copyWeak(&v86, &location);
  objc_msgSend_setInvalidationHandler_(self->_connection, v42, (uint64_t)&v82, v43, v44);
  objc_msgSend_remoteObjectProxyWithErrorHandler_(self->_connection, v45, (uint64_t)&unk_24F089358, v46, v47, v82, v83, v84, v85);
  v48 = (BDSServiceProtocol *)objc_claimAutoreleasedReturnValue();
  remoteObjectProxy = self->_remoteObjectProxy;
  self->_remoteObjectProxy = v48;

  objc_msgSend_setConnectionHealthy_(self, v50, self->_remoteObjectProxy != 0, v51, v52);
  if (objc_msgSend_connectionHealthy(self, v53, v54, v55, v56))
  {
    objc_msgSend_shared(MEMORY[0x24BE0FC08], v57, v58, v59, v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = objc_msgSend_verboseLoggingEnabled(v61, v62, v63, v64, v65);

    if (v66)
    {
      BDSCloudKitDevelopmentLog();
      v71 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
      {
        v72 = self->_remoteObjectProxy;
        *(_DWORD *)buf = 138543362;
        v89 = v72;
        _os_log_impl(&dword_227D4F000, v71, OS_LOG_TYPE_DEFAULT, "\"\\\"Connection made to remote service with %{public}@\\\"\", buf, 0xCu);
      }

    }
  }
  else
  {
    objc_msgSend_scheduleRestart(self, v57, v58, v59, v60);
  }
  objc_msgSend_resume(self->_connection, v67, v68, v69, v70);
  objc_msgSend_connectionDelegate(self, v73, v74, v75, v76);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_serviceConnectionDidResume(v77, v78, v79, v80, v81);

  objc_destroyWeak(&v86);
  objc_destroyWeak(&location);

}

- (BDSServiceProxyConnectionDelegate)connectionDelegate
{
  return (BDSServiceProxyConnectionDelegate *)objc_loadWeakRetained((id *)&self->_connectionDelegate);
}

- (BOOL)connectionHealthy
{
  return self->_connectionHealthy;
}

- (void)setConnectionHealthy:(BOOL)a3
{
  self->_connectionHealthy = a3;
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  id v4;
  BDSServiceProtocol *remoteObjectProxy;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  remoteObjectProxy = self->_remoteObjectProxy;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = sub_227D772B0;
  v12[3] = &unk_24F089380;
  v13 = v4;
  v6 = v4;
  objc_msgSend_remoteObjectProxyWithErrorHandler_(remoteObjectProxy, v7, (uint64_t)v12, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)monitorServiceNotificationsWithChangeToken:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  const char *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD aBlock[4];
  id v25;

  v6 = a3;
  v7 = a4;
  if (v7)
    v12 = v7;
  else
    v12 = &unk_24F0899C8;
  if (objc_msgSend_connectionHealthy(self, v8, v9, v10, v11))
  {
    v13 = MEMORY[0x24BDAC760];
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = sub_227D69934;
    aBlock[3] = &unk_24F089380;
    v25 = v12;
    v14 = _Block_copy(aBlock);
    v21[0] = v13;
    v21[1] = 3221225472;
    v21[2] = sub_227D81D94;
    v21[3] = &unk_24F0899F0;
    v22 = v6;
    v23 = v14;
    v15 = v14;
    bds_dispatch_service(self, v21, v15);

    v16 = v25;
  }
  else
  {
    BDSServiceLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_227E59564();

    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v18, (uint64_t)CFSTR("BDSErrorDomain"), 1000, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = _Block_copy(v12);
    v20 = v19;
    if (v19)
      (*((void (**)(void *, void *))v19 + 2))(v19, v16);

  }
}

- (BDSServiceProxy)init
{
  uint64_t v2;
  uint64_t v3;

  return (BDSServiceProxy *)objc_msgSend_initWithConnectionDelegate_(self, a2, 0, v2, v3);
}

- (void)getEngagementDataChangesSince:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  const char *v21;
  void *v22;
  _QWORD v23[4];
  id v24;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend_connectionHealthy(self, v8, v9, v10, v11))
  {
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = sub_227D7FB1C;
    v23[3] = &unk_24F089380;
    v12 = v7;
    v24 = v12;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v13, (uint64_t)v23, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_getEngagementDataChangesSince_completion_(v16, v17, (uint64_t)v6, (uint64_t)v12, v18);

    v19 = v24;
  }
  else
  {
    BDSServiceLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_227E58B6C();

    v19 = _Block_copy(v7);
    if (v19)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v21, (uint64_t)CFSTR("BDSErrorDomain"), 1000, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(void *, _QWORD, _QWORD, _QWORD, void *, _QWORD))v19 + 2))(v19, 0, 0, 0, v22, 0);

    }
  }

}

- (void)getCollectionMemberChangesSince:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend_connectionHealthy(self, v8, v9, v10, v11))
  {
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = sub_227D7D5BC;
    v22[3] = &unk_24F089380;
    v12 = v7;
    v23 = v12;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v13, (uint64_t)v22, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_getCollectionMemberChangesSince_completion_(v16, v17, (uint64_t)v6, (uint64_t)v12, v18);

  }
  else
  {
    v20 = _Block_copy(v7);
    if (v20)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v19, (uint64_t)CFSTR("BDSErrorDomain"), 1000, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(void *, _QWORD, _QWORD, _QWORD, void *, _QWORD))v20 + 2))(v20, 0, 0, 0, v21, 0);

    }
  }

}

- (void)getCollectionDetailChangesSince:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend_connectionHealthy(self, v8, v9, v10, v11))
  {
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = sub_227D7C75C;
    v22[3] = &unk_24F089380;
    v12 = v7;
    v23 = v12;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v13, (uint64_t)v22, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_getCollectionDetailChangesSince_completion_(v16, v17, (uint64_t)v6, (uint64_t)v12, v18);

  }
  else
  {
    v20 = _Block_copy(v7);
    if (v20)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v19, (uint64_t)CFSTR("BDSErrorDomain"), 1000, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(void *, _QWORD, _QWORD, _QWORD, void *, _QWORD))v20 + 2))(v20, 0, 0, 0, v21, 0);

    }
  }

}

- (void)getAssetDetailChangesSince:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend_connectionHealthy(self, v8, v9, v10, v11))
  {
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = sub_227D78378;
    v22[3] = &unk_24F089380;
    v12 = v7;
    v23 = v12;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v13, (uint64_t)v22, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_getAssetDetailChangesSince_completion_(v16, v17, (uint64_t)v6, (uint64_t)v12, v18);

  }
  else
  {
    v20 = _Block_copy(v7);
    if (v20)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v19, (uint64_t)CFSTR("BDSErrorDomain"), 1000, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(void *, _QWORD, _QWORD, _QWORD, void *, _QWORD))v20 + 2))(v20, 0, 0, 0, v21, 0);

    }
  }

}

- (void)currentReadingNowDetailCloudSyncVersions:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;

  v4 = a3;
  if (objc_msgSend_connectionHealthy(self, v5, v6, v7, v8))
  {
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = sub_227D792F0;
    v19[3] = &unk_24F089380;
    v9 = v4;
    v20 = v9;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v10, (uint64_t)v19, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_currentReadingNowDetailCloudSyncVersions_(v13, v14, (uint64_t)v9, v15, v16);

  }
  else
  {
    v17 = _Block_copy(v4);
    v18 = v17;
    if (v17)
      (*((void (**)(void *, _QWORD))v17 + 2))(v17, 0);

  }
}

- (void)currentCollectionMemberCloudSyncVersions:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;

  v4 = a3;
  if (objc_msgSend_connectionHealthy(self, v5, v6, v7, v8))
  {
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = sub_227D7CF98;
    v19[3] = &unk_24F089380;
    v9 = v4;
    v20 = v9;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v10, (uint64_t)v19, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_currentCollectionMemberCloudSyncVersions_(v13, v14, (uint64_t)v9, v15, v16);

  }
  else
  {
    v17 = _Block_copy(v4);
    v18 = v17;
    if (v17)
      (*((void (**)(void *, _QWORD))v17 + 2))(v17, 0);

  }
}

- (void)currentCollectionDetailCloudSyncVersions:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;

  v4 = a3;
  if (objc_msgSend_connectionHealthy(self, v5, v6, v7, v8))
  {
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = sub_227D7C2A8;
    v19[3] = &unk_24F089380;
    v9 = v4;
    v20 = v9;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v10, (uint64_t)v19, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_currentCollectionDetailCloudSyncVersions_(v13, v14, (uint64_t)v9, v15, v16);

  }
  else
  {
    v17 = _Block_copy(v4);
    v18 = v17;
    if (v17)
      (*((void (**)(void *, _QWORD))v17 + 2))(v17, 0);

  }
}

- (void)currentAssetDetailCloudSyncVersions:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;

  v4 = a3;
  if (objc_msgSend_connectionHealthy(self, v5, v6, v7, v8))
  {
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = sub_227D78058;
    v19[3] = &unk_24F089380;
    v9 = v4;
    v20 = v9;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v10, (uint64_t)v19, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_currentAssetDetailCloudSyncVersions_(v13, v14, (uint64_t)v9, v15, v16);

  }
  else
  {
    v17 = _Block_copy(v4);
    v18 = v17;
    if (v17)
      (*((void (**)(void *, _QWORD))v17 + 2))(v17, 0);

  }
}

- (void)scheduleRestart
{
  dispatch_time_t v2;
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v2 = dispatch_time(0, 60000000000);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = sub_227D771F4;
  v3[3] = &unk_24F089258;
  objc_copyWeak(&v4, &location);
  dispatch_after(v2, MEMORY[0x24BDAC9B8], v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  id v4;
  BDSServiceProtocol *remoteObjectProxy;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  remoteObjectProxy = self->_remoteObjectProxy;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = sub_227D773B8;
  v12[3] = &unk_24F089380;
  v13 = v4;
  v6 = v4;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(remoteObjectProxy, v7, (uint64_t)v12, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  objc_super v6;

  objc_msgSend_shutdown(self, a2, v2, v3, v4);
  v6.receiver = self;
  v6.super_class = (Class)BDSServiceProxy;
  -[BDSServiceProxy dealloc](&v6, sel_dealloc);
}

- (void)shutdown
{
  NSObject *v3;
  BDSClientSideListener *clientSideListener;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9[16];

  notify_cancel(self->_notifyToken);
  if (self->_connection)
  {
    BDSCloudKitLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_227D4F000, v3, OS_LOG_TYPE_INFO, "[ServiceProxy]:  Shutting down service proxy.", v9, 2u);
    }

    clientSideListener = self->_clientSideListener;
    self->_clientSideListener = 0;

    objc_msgSend_invalidate(self->_connection, v5, v6, v7, v8);
  }
}

- (void)setEnableCollectionSync:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  _BOOL8 v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v5 = a3;
  objc_msgSend_remoteObjectProxy(self, a2, a3, v3, v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setEnableCollectionSync_(v9, v6, v5, v7, v8);

}

- (void)setEnableCloudSync:(BOOL)a3 enableReadingNowSync:(BOOL)a4
{
  uint64_t v4;
  _BOOL8 v5;
  _BOOL8 v6;
  const char *v7;
  uint64_t v8;
  id v9;

  v5 = a4;
  v6 = a3;
  objc_msgSend_remoteObjectProxy(self, a2, a3, a4, v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setEnableCloudSync_enableReadingNowSync_(v9, v7, v6, v5, v8);

}

- (void)setEnableSecureCloudSync:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  _BOOL8 v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v5 = a3;
  objc_msgSend_remoteObjectProxy(self, a2, a3, v3, v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setEnableSecureCloudSync_(v9, v6, v5, v7, v8);

}

- (void)setCloudSyncPaused:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  _BOOL8 v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v5 = a3;
  objc_msgSend_remoteObjectProxy(self, a2, a3, v3, v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setCloudSyncPaused_(v9, v6, v5, v7, v8);

}

- (void)dissociateCloudDataFromSyncWithCompletion:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  void (**v18)(void *, _QWORD, void *);
  void *v19;
  _QWORD v20[4];
  id v21;

  v4 = a3;
  if (objc_msgSend_connectionHealthy(self, v5, v6, v7, v8))
  {
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = sub_227D776FC;
    v20[3] = &unk_24F089380;
    v9 = v4;
    v21 = v9;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v10, (uint64_t)v20, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_dissociateCloudDataFromSyncWithCompletion_(v13, v14, (uint64_t)v9, v15, v16);

  }
  else
  {
    v18 = (void (**)(void *, _QWORD, void *))_Block_copy(v4);
    if (v18)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v17, (uint64_t)CFSTR("BDSErrorDomain"), 1000, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v18[2](v18, 0, v19);

    }
  }

}

- (void)signalFetchChangesTransaction:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD aBlock[4];
  id v17;

  v4 = a3;
  if ((objc_msgSend_connectionHealthy(self, v5, v6, v7, v8) & 1) == 0)
  {
    BDSServiceLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_227E5886C();

  }
  v10 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_227D7785C;
  aBlock[3] = &unk_24F0893A8;
  v11 = v4;
  v17 = v11;
  v12 = _Block_copy(aBlock);
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = sub_227D778BC;
  v14[3] = &unk_24F0893D0;
  v15 = v11;
  v13 = v11;
  bds_dispatch_service(self, v14, v12);

}

- (void)assetDetailForAssetID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  void (**v20)(void *, _QWORD, void *);
  void *v21;
  _QWORD v22[4];
  id v23;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend_connectionHealthy(self, v8, v9, v10, v11))
  {
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = sub_227D779D8;
    v22[3] = &unk_24F089380;
    v12 = v7;
    v23 = v12;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v13, (uint64_t)v22, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_assetDetailForAssetID_completion_(v16, v17, (uint64_t)v6, (uint64_t)v12, v18);

  }
  else
  {
    v20 = (void (**)(void *, _QWORD, void *))_Block_copy(v7);
    if (v20)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v19, (uint64_t)CFSTR("BDSErrorDomain"), 1000, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v20[2](v20, 0, v21);

    }
  }

}

- (void)assetDetailsForAssetIDs:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  dispatch_group_t v13;
  uint64_t v14;
  NSObject *v15;
  id v16;
  const char *v17;
  uint64_t v18;
  NSObject *v19;
  id v20;
  const char *v21;
  void *v22;
  void *v23;
  _QWORD block[4];
  id v25;
  id v26;
  _QWORD *v27;
  _QWORD *v28;
  _QWORD v29[4];
  NSObject *v30;
  BDSServiceProxy *v31;
  id v32;
  _QWORD *v33;
  _QWORD *v34;
  _QWORD v35[5];
  id v36;
  _QWORD v37[5];
  id v38;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend_connectionHealthy(self, v8, v9, v10, v11))
  {
    v12 = (void *)objc_opt_new();
    v37[0] = 0;
    v37[1] = v37;
    v37[2] = 0x3032000000;
    v37[3] = sub_227D77C7C;
    v37[4] = sub_227D77C8C;
    v38 = 0;
    v35[0] = 0;
    v35[1] = v35;
    v35[2] = 0x3032000000;
    v35[3] = sub_227D77C7C;
    v35[4] = sub_227D77C8C;
    v36 = 0;
    v13 = dispatch_group_create();
    v14 = MEMORY[0x24BDAC760];
    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = sub_227D77C94;
    v29[3] = &unk_24F089448;
    v15 = v13;
    v30 = v15;
    v31 = self;
    v33 = v35;
    v16 = v12;
    v32 = v16;
    v34 = v37;
    objc_msgSend_bds_traverseBatchesOfSize_block_(v6, v17, 64, (uint64_t)v29, v18);
    dispatch_get_global_queue(2, 0);
    v19 = objc_claimAutoreleasedReturnValue();
    block[0] = v14;
    block[1] = 3221225472;
    block[2] = sub_227D77E98;
    block[3] = &unk_24F089470;
    v25 = v16;
    v26 = v7;
    v27 = v37;
    v28 = v35;
    v20 = v16;
    dispatch_group_notify(v15, v19, block);

    _Block_object_dispose(v35, 8);
    _Block_object_dispose(v37, 8);

  }
  else
  {
    v22 = _Block_copy(v7);
    if (v22)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v21, (uint64_t)CFSTR("BDSErrorDomain"), 1000, 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(void *, _QWORD, _QWORD, void *))v22 + 2))(v22, 0, 0, v23);

    }
  }

}

- (void)resolvedAssetDetailForAssetID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  void (**v20)(void *, _QWORD, void *);
  void *v21;
  _QWORD v22[4];
  id v23;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend_connectionHealthy(self, v8, v9, v10, v11))
  {
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = sub_227D78000;
    v22[3] = &unk_24F089380;
    v12 = v7;
    v23 = v12;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v13, (uint64_t)v22, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_resolvedAssetDetailForAssetID_completion_(v16, v17, (uint64_t)v6, (uint64_t)v12, v18);

  }
  else
  {
    v20 = (void (**)(void *, _QWORD, void *))_Block_copy(v7);
    if (v20)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v19, (uint64_t)CFSTR("BDSErrorDomain"), 1000, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v20[2](v20, 0, v21);

    }
  }

}

- (void)deleteAssetDetailForAssetID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const void *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  void (**v21)(void *, _QWORD, void *);
  void *v22;
  _QWORD v23[4];
  id v24;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend_connectionHealthy(self, v8, v9, v10, v11))
  {
    if (v7)
      v12 = v7;
    else
      v12 = &unk_24F0894B0;
    v13 = _Block_copy(v12);
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = sub_227D781BC;
    v23[3] = &unk_24F089380;
    v24 = v7;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v14, (uint64_t)v23, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_deleteAssetDetailForAssetID_completion_(v17, v18, (uint64_t)v6, (uint64_t)v13, v19);

  }
  else
  {
    v21 = (void (**)(void *, _QWORD, void *))_Block_copy(v7);
    if (v21)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v20, (uint64_t)CFSTR("BDSErrorDomain"), 1000, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v21[2](v21, 0, v22);

    }
  }

}

- (void)fetchAssetDetailsIncludingDeleted:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;

  v4 = a3;
  v6 = a4;
  if (objc_msgSend_connectionHealthy(self, v7, v8, v9, v10))
  {
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = sub_227D7831C;
    v21[3] = &unk_24F089380;
    v11 = v6;
    v22 = v11;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v12, (uint64_t)v21, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_fetchAssetDetailsIncludingDeleted_completion_(v15, v16, v4, (uint64_t)v11, v17);

  }
  else
  {
    v19 = _Block_copy(v6);
    if (v19)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v18, (uint64_t)CFSTR("BDSErrorDomain"), 1000, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(void *, _QWORD, _QWORD, void *))v19 + 2))(v19, 0, 0, v20);

    }
  }

}

- (void)setAssetDetail:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const void *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend_connectionHealthy(self, v8, v9, v10, v11))
  {
    if (v7)
      v12 = v7;
    else
      v12 = &unk_24F0894F0;
    v13 = _Block_copy(v12);
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = sub_227D7850C;
    v23[3] = &unk_24F089380;
    v24 = v7;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v14, (uint64_t)v23, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setAssetDetail_completion_(v17, v18, (uint64_t)v6, (uint64_t)v13, v19);

  }
  else
  {
    v21 = _Block_copy(v7);
    if (v21)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v20, (uint64_t)CFSTR("BDSErrorDomain"), 1000, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(void *, _QWORD, _QWORD, void *))v21 + 2))(v21, 0, 0, v22);

    }
  }

}

- (void)setAssetDetails:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  dispatch_group_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  const char *v20;
  uint64_t v21;
  NSObject *v22;
  const char *v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  _QWORD *v28;
  _QWORD *v29;
  _QWORD *v30;
  _QWORD v31[4];
  NSObject *v32;
  id v33;
  BDSServiceProxy *v34;
  _QWORD *v35;
  _QWORD *v36;
  _QWORD *v37;
  _QWORD v38[3];
  char v39;
  _QWORD v40[3];
  char v41;
  _QWORD v42[5];
  id v43;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend_connectionHealthy(self, v8, v9, v10, v11))
  {
    v42[0] = 0;
    v42[1] = v42;
    v42[2] = 0x3032000000;
    v42[3] = sub_227D77C7C;
    v42[4] = sub_227D77C8C;
    v43 = 0;
    v40[0] = 0;
    v40[1] = v40;
    v40[2] = 0x2020000000;
    v41 = 1;
    v38[0] = 0;
    v38[1] = v38;
    v38[2] = 0x2020000000;
    v39 = 0;
    v12 = dispatch_group_create();
    objc_msgSend_allKeys(v6, v13, v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = MEMORY[0x24BDAC760];
    v31[0] = MEMORY[0x24BDAC760];
    v31[1] = 3221225472;
    v31[2] = sub_227D787D8;
    v31[3] = &unk_24F089568;
    v19 = v12;
    v32 = v19;
    v33 = v6;
    v34 = self;
    v35 = v42;
    v36 = v40;
    v37 = v38;
    objc_msgSend_bds_traverseBatchesOfSize_block_(v17, v20, 64, (uint64_t)v31, v21);

    dispatch_get_global_queue(2, 0);
    v22 = objc_claimAutoreleasedReturnValue();
    v26[0] = v18;
    v26[1] = 3221225472;
    v26[2] = sub_227D789E4;
    v26[3] = &unk_24F089590;
    v27 = v7;
    v28 = v40;
    v29 = v38;
    v30 = v42;
    dispatch_group_notify(v19, v22, v26);

    _Block_object_dispose(v38, 8);
    _Block_object_dispose(v40, 8);
    _Block_object_dispose(v42, 8);

  }
  else
  {
    v24 = _Block_copy(v7);
    if (v24)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v23, (uint64_t)CFSTR("BDSErrorDomain"), 1000, 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(void *, _QWORD, _QWORD, void *))v24 + 2))(v24, 0, 0, v25);

    }
  }

}

- (void)fetchAssetDetailsForUnsyncedTastes:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  void (**v18)(void *, _QWORD, void *);
  void *v19;
  _QWORD v20[4];
  id v21;

  v4 = a3;
  if (objc_msgSend_connectionHealthy(self, v5, v6, v7, v8))
  {
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = sub_227D78B40;
    v20[3] = &unk_24F089380;
    v9 = v4;
    v21 = v9;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v10, (uint64_t)v20, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_fetchAssetDetailsForUnsyncedTastes_(v13, v14, (uint64_t)v9, v15, v16);

  }
  else
  {
    v18 = (void (**)(void *, _QWORD, void *))_Block_copy(v4);
    if (v18)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v17, (uint64_t)CFSTR("BDSErrorDomain"), 1000, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v18[2](v18, 0, v19);

    }
  }

}

- (void)fetchFinishedDatesByAssetIDForYear:(int64_t)a3 completion:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  void (**v19)(void *, _QWORD, void *);
  void *v20;
  _QWORD v21[4];
  id v22;

  v6 = a4;
  if (objc_msgSend_connectionHealthy(self, v7, v8, v9, v10))
  {
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = sub_227D78C9C;
    v21[3] = &unk_24F089380;
    v11 = v6;
    v22 = v11;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v12, (uint64_t)v21, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_fetchFinishedDatesByAssetIDForYear_completion_(v15, v16, a3, (uint64_t)v11, v17);

  }
  else
  {
    v19 = (void (**)(void *, _QWORD, void *))_Block_copy(v6);
    if (v19)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v18, (uint64_t)CFSTR("BDSErrorDomain"), 1000, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v19[2](v19, 0, v20);

    }
  }

}

- (void)fetchFinishedAssetCountByYearWithCompletion:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  void (**v18)(void *, _QWORD, void *);
  void *v19;
  _QWORD v20[4];
  id v21;

  v4 = a3;
  if (objc_msgSend_connectionHealthy(self, v5, v6, v7, v8))
  {
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = sub_227D78DF0;
    v20[3] = &unk_24F089380;
    v9 = v4;
    v21 = v9;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v10, (uint64_t)v20, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_fetchFinishedAssetCountByYearWithCompletion_(v13, v14, (uint64_t)v9, v15, v16);

  }
  else
  {
    v18 = (void (**)(void *, _QWORD, void *))_Block_copy(v4);
    if (v18)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v17, (uint64_t)CFSTR("BDSErrorDomain"), 1000, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v18[2](v18, 0, v19);

    }
  }

}

- (void)readingNowDetailsForAssetIDs:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  dispatch_group_t v13;
  uint64_t v14;
  NSObject *v15;
  id v16;
  const char *v17;
  uint64_t v18;
  NSObject *v19;
  id v20;
  const char *v21;
  void *v22;
  void *v23;
  _QWORD block[4];
  id v25;
  id v26;
  _QWORD *v27;
  _QWORD *v28;
  _QWORD v29[4];
  NSObject *v30;
  BDSServiceProxy *v31;
  id v32;
  _QWORD *v33;
  _QWORD *v34;
  _QWORD v35[5];
  id v36;
  _QWORD v37[5];
  id v38;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend_connectionHealthy(self, v8, v9, v10, v11))
  {
    v12 = (void *)objc_opt_new();
    v37[0] = 0;
    v37[1] = v37;
    v37[2] = 0x3032000000;
    v37[3] = sub_227D77C7C;
    v37[4] = sub_227D77C8C;
    v38 = 0;
    v35[0] = 0;
    v35[1] = v35;
    v35[2] = 0x3032000000;
    v35[3] = sub_227D77C7C;
    v35[4] = sub_227D77C8C;
    v36 = 0;
    v13 = dispatch_group_create();
    v14 = MEMORY[0x24BDAC760];
    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = sub_227D79094;
    v29[3] = &unk_24F089448;
    v15 = v13;
    v30 = v15;
    v31 = self;
    v33 = v35;
    v16 = v12;
    v32 = v16;
    v34 = v37;
    objc_msgSend_bds_traverseBatchesOfSize_block_(v6, v17, 64, (uint64_t)v29, v18);
    dispatch_get_global_queue(2, 0);
    v19 = objc_claimAutoreleasedReturnValue();
    block[0] = v14;
    block[1] = 3221225472;
    block[2] = sub_227D79298;
    block[3] = &unk_24F089470;
    v25 = v16;
    v26 = v7;
    v27 = v37;
    v28 = v35;
    v20 = v16;
    dispatch_group_notify(v15, v19, block);

    _Block_object_dispose(v35, 8);
    _Block_object_dispose(v37, 8);

  }
  else
  {
    v22 = _Block_copy(v7);
    if (v22)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v21, (uint64_t)CFSTR("BDSErrorDomain"), 1000, 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(void *, _QWORD, _QWORD, void *))v22 + 2))(v22, 0, 0, v23);

    }
  }

}

- (void)deleteReadingNowDetailForAssetID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const void *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  void (**v21)(void *, _QWORD, void *);
  void *v22;
  _QWORD v23[4];
  id v24;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend_connectionHealthy(self, v8, v9, v10, v11))
  {
    if (v7)
      v12 = v7;
    else
      v12 = &unk_24F0895B0;
    v13 = _Block_copy(v12);
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = sub_227D79454;
    v23[3] = &unk_24F089380;
    v24 = v7;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v14, (uint64_t)v23, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_deleteReadingNowDetailForAssetID_completion_(v17, v18, (uint64_t)v6, (uint64_t)v13, v19);

  }
  else
  {
    v21 = (void (**)(void *, _QWORD, void *))_Block_copy(v7);
    if (v21)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v20, (uint64_t)CFSTR("BDSErrorDomain"), 1000, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v21[2](v21, 0, v22);

    }
  }

}

- (void)getReadingNowDetailChangesSince:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend_connectionHealthy(self, v8, v9, v10, v11))
  {
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = sub_227D795C8;
    v22[3] = &unk_24F089380;
    v12 = v7;
    v23 = v12;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v13, (uint64_t)v22, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_getReadingNowDetailChangesSince_completion_(v16, v17, (uint64_t)v6, (uint64_t)v12, v18);

  }
  else
  {
    v20 = _Block_copy(v7);
    if (v20)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v19, (uint64_t)CFSTR("BDSErrorDomain"), 1000, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(void *, _QWORD, _QWORD, _QWORD, void *, _QWORD))v20 + 2))(v20, 0, 0, 0, v21, 0);

    }
  }

}

- (void)setReadingNowDetails:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  dispatch_group_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  const char *v20;
  uint64_t v21;
  NSObject *v22;
  const char *v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  _QWORD *v28;
  _QWORD *v29;
  _QWORD *v30;
  _QWORD v31[4];
  NSObject *v32;
  id v33;
  BDSServiceProxy *v34;
  _QWORD *v35;
  _QWORD *v36;
  _QWORD *v37;
  _QWORD v38[3];
  char v39;
  _QWORD v40[3];
  char v41;
  _QWORD v42[5];
  id v43;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend_connectionHealthy(self, v8, v9, v10, v11))
  {
    v42[0] = 0;
    v42[1] = v42;
    v42[2] = 0x3032000000;
    v42[3] = sub_227D77C7C;
    v42[4] = sub_227D77C8C;
    v43 = 0;
    v40[0] = 0;
    v40[1] = v40;
    v40[2] = 0x2020000000;
    v41 = 1;
    v38[0] = 0;
    v38[1] = v38;
    v38[2] = 0x2020000000;
    v39 = 0;
    v12 = dispatch_group_create();
    objc_msgSend_allKeys(v6, v13, v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = MEMORY[0x24BDAC760];
    v31[0] = MEMORY[0x24BDAC760];
    v31[1] = 3221225472;
    v31[2] = sub_227D7989C;
    v31[3] = &unk_24F089568;
    v19 = v12;
    v32 = v19;
    v33 = v6;
    v34 = self;
    v35 = v42;
    v36 = v40;
    v37 = v38;
    objc_msgSend_bds_traverseBatchesOfSize_block_(v17, v20, 64, (uint64_t)v31, v21);

    dispatch_get_global_queue(2, 0);
    v22 = objc_claimAutoreleasedReturnValue();
    v26[0] = v18;
    v26[1] = 3221225472;
    v26[2] = sub_227D79AA8;
    v26[3] = &unk_24F089590;
    v27 = v7;
    v28 = v40;
    v29 = v38;
    v30 = v42;
    dispatch_group_notify(v19, v22, v26);

    _Block_object_dispose(v38, 8);
    _Block_object_dispose(v40, 8);
    _Block_object_dispose(v42, 8);

  }
  else
  {
    v24 = _Block_copy(v7);
    if (v24)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v23, (uint64_t)CFSTR("BDSErrorDomain"), 1000, 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(void *, _QWORD, _QWORD, void *))v24 + 2))(v24, 0, 0, v25);

    }
  }

}

- (void)needsReadingNowAssetTypePopulation:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  void (**v18)(void *, _QWORD, void *);
  void *v19;
  _QWORD v20[4];
  id v21;

  v4 = a3;
  if (objc_msgSend_connectionHealthy(self, v5, v6, v7, v8))
  {
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = sub_227D79C04;
    v20[3] = &unk_24F089380;
    v9 = v4;
    v21 = v9;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v10, (uint64_t)v20, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_needsReadingNowAssetTypePopulation_(v13, v14, (uint64_t)v9, v15, v16);

  }
  else
  {
    v18 = (void (**)(void *, _QWORD, void *))_Block_copy(v4);
    if (v18)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v17, (uint64_t)CFSTR("BDSErrorDomain"), 1000, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v18[2](v18, 0, v19);

    }
  }

}

- (void)assetReviewForAssetReviewID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  void (**v20)(void *, _QWORD, void *);
  void *v21;
  _QWORD v22[4];
  id v23;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend_connectionHealthy(self, v8, v9, v10, v11))
  {
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = sub_227D79D6C;
    v22[3] = &unk_24F089380;
    v12 = v7;
    v23 = v12;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v13, (uint64_t)v22, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_assetReviewForAssetReviewID_completion_(v16, v17, (uint64_t)v6, (uint64_t)v12, v18);

  }
  else
  {
    v20 = (void (**)(void *, _QWORD, void *))_Block_copy(v7);
    if (v20)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v19, (uint64_t)CFSTR("BDSErrorDomain"), 1000, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v20[2](v20, 0, v21);

    }
  }

}

- (void)assetReviewsForAssetReviewIDs:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  dispatch_group_t v13;
  uint64_t v14;
  NSObject *v15;
  id v16;
  const char *v17;
  uint64_t v18;
  NSObject *v19;
  id v20;
  const char *v21;
  void *v22;
  void *v23;
  _QWORD block[4];
  id v25;
  id v26;
  _QWORD *v27;
  _QWORD *v28;
  _QWORD v29[4];
  NSObject *v30;
  BDSServiceProxy *v31;
  id v32;
  _QWORD *v33;
  _QWORD *v34;
  _QWORD v35[5];
  id v36;
  _QWORD v37[5];
  id v38;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend_connectionHealthy(self, v8, v9, v10, v11))
  {
    v12 = (void *)objc_opt_new();
    v37[0] = 0;
    v37[1] = v37;
    v37[2] = 0x3032000000;
    v37[3] = sub_227D77C7C;
    v37[4] = sub_227D77C8C;
    v38 = 0;
    v35[0] = 0;
    v35[1] = v35;
    v35[2] = 0x3032000000;
    v35[3] = sub_227D77C7C;
    v35[4] = sub_227D77C8C;
    v36 = 0;
    v13 = dispatch_group_create();
    v14 = MEMORY[0x24BDAC760];
    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = sub_227D7A010;
    v29[3] = &unk_24F089448;
    v15 = v13;
    v30 = v15;
    v31 = self;
    v33 = v35;
    v16 = v12;
    v32 = v16;
    v34 = v37;
    objc_msgSend_bds_traverseBatchesOfSize_block_(v6, v17, 64, (uint64_t)v29, v18);
    dispatch_get_global_queue(2, 0);
    v19 = objc_claimAutoreleasedReturnValue();
    block[0] = v14;
    block[1] = 3221225472;
    block[2] = sub_227D7A214;
    block[3] = &unk_24F089470;
    v25 = v16;
    v26 = v7;
    v27 = v37;
    v28 = v35;
    v20 = v16;
    dispatch_group_notify(v15, v19, block);

    _Block_object_dispose(v35, 8);
    _Block_object_dispose(v37, 8);

  }
  else
  {
    v22 = _Block_copy(v7);
    if (v22)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v21, (uint64_t)CFSTR("BDSErrorDomain"), 1000, 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(void *, _QWORD, _QWORD, void *))v22 + 2))(v22, 0, 0, v23);

    }
  }

}

- (void)deleteAssetReviewForAssetReviewID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const void *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  void (**v21)(void *, _QWORD, void *);
  void *v22;
  _QWORD v23[4];
  id v24;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend_connectionHealthy(self, v8, v9, v10, v11))
  {
    if (v7)
      v12 = v7;
    else
      v12 = &unk_24F0895D0;
    v13 = _Block_copy(v12);
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = sub_227D7A398;
    v23[3] = &unk_24F089380;
    v24 = v7;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v14, (uint64_t)v23, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_deleteAssetReviewForAssetReviewID_completion_(v17, v18, (uint64_t)v6, (uint64_t)v13, v19);

  }
  else
  {
    v21 = (void (**)(void *, _QWORD, void *))_Block_copy(v7);
    if (v21)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v20, (uint64_t)CFSTR("BDSErrorDomain"), 1000, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v21[2](v21, 0, v22);

    }
  }

}

- (void)deleteAssetReviewForAssetReviewIDs:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const void *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  void (**v21)(void *, _QWORD, void *);
  void *v22;
  _QWORD v23[4];
  id v24;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend_connectionHealthy(self, v8, v9, v10, v11))
  {
    if (v7)
      v12 = v7;
    else
      v12 = &unk_24F0895F0;
    v13 = _Block_copy(v12);
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = sub_227D7A51C;
    v23[3] = &unk_24F089380;
    v24 = v7;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v14, (uint64_t)v23, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_deleteAssetReviewForAssetReviewIDs_completion_(v17, v18, (uint64_t)v6, (uint64_t)v13, v19);

  }
  else
  {
    v21 = (void (**)(void *, _QWORD, void *))_Block_copy(v7);
    if (v21)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v20, (uint64_t)CFSTR("BDSErrorDomain"), 1000, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v21[2](v21, 0, v22);

    }
  }

}

- (void)fetchAssetReviewsForUserID:(id)a3 includingDeleted:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  const char *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  if (objc_msgSend_connectionHealthy(self, v10, v11, v12, v13))
  {
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = sub_227D7A698;
    v23[3] = &unk_24F089380;
    v14 = v9;
    v24 = v14;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v15, (uint64_t)v23, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_fetchAssetReviewsForUserID_includingDeleted_completion_(v18, v19, (uint64_t)v8, v6, (uint64_t)v14);

  }
  else
  {
    v21 = _Block_copy(v9);
    if (v21)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v20, (uint64_t)CFSTR("BDSErrorDomain"), 1000, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(void *, _QWORD, _QWORD, void *))v21 + 2))(v21, 0, 0, v22);

    }
  }

}

- (void)getAssetReviewChangesSince:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend_connectionHealthy(self, v8, v9, v10, v11))
  {
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = sub_227D7A810;
    v22[3] = &unk_24F089380;
    v12 = v7;
    v23 = v12;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v13, (uint64_t)v22, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_getAssetReviewChangesSince_completion_(v16, v17, (uint64_t)v6, (uint64_t)v12, v18);

  }
  else
  {
    v20 = _Block_copy(v7);
    if (v20)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v19, (uint64_t)CFSTR("BDSErrorDomain"), 1000, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(void *, _QWORD, _QWORD, _QWORD, void *, _QWORD))v20 + 2))(v20, 0, 0, 0, v21, 0);

    }
  }

}

- (void)setAssetReview:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const void *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend_connectionHealthy(self, v8, v9, v10, v11))
  {
    if (v7)
      v12 = v7;
    else
      v12 = &unk_24F089610;
    v13 = _Block_copy(v12);
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = sub_227D7A9A4;
    v23[3] = &unk_24F089380;
    v24 = v7;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v14, (uint64_t)v23, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setAssetReview_completion_(v17, v18, (uint64_t)v6, (uint64_t)v13, v19);

  }
  else
  {
    v21 = _Block_copy(v7);
    if (v21)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v20, (uint64_t)CFSTR("BDSErrorDomain"), 1000, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(void *, _QWORD, _QWORD, void *))v21 + 2))(v21, 0, 0, v22);

    }
  }

}

- (void)setAssetReviews:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  dispatch_group_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  const char *v20;
  uint64_t v21;
  NSObject *v22;
  const char *v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  _QWORD *v28;
  _QWORD *v29;
  _QWORD *v30;
  _QWORD v31[4];
  NSObject *v32;
  id v33;
  BDSServiceProxy *v34;
  _QWORD *v35;
  _QWORD *v36;
  _QWORD *v37;
  _QWORD v38[3];
  char v39;
  _QWORD v40[3];
  char v41;
  _QWORD v42[5];
  id v43;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend_connectionHealthy(self, v8, v9, v10, v11))
  {
    v42[0] = 0;
    v42[1] = v42;
    v42[2] = 0x3032000000;
    v42[3] = sub_227D77C7C;
    v42[4] = sub_227D77C8C;
    v43 = 0;
    v40[0] = 0;
    v40[1] = v40;
    v40[2] = 0x2020000000;
    v41 = 1;
    v38[0] = 0;
    v38[1] = v38;
    v38[2] = 0x2020000000;
    v39 = 0;
    v12 = dispatch_group_create();
    objc_msgSend_allKeys(v6, v13, v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = MEMORY[0x24BDAC760];
    v31[0] = MEMORY[0x24BDAC760];
    v31[1] = 3221225472;
    v31[2] = sub_227D7AC70;
    v31[3] = &unk_24F089568;
    v19 = v12;
    v32 = v19;
    v33 = v6;
    v34 = self;
    v35 = v42;
    v36 = v40;
    v37 = v38;
    objc_msgSend_bds_traverseBatchesOfSize_block_(v17, v20, 64, (uint64_t)v31, v21);

    dispatch_get_global_queue(2, 0);
    v22 = objc_claimAutoreleasedReturnValue();
    v26[0] = v18;
    v26[1] = 3221225472;
    v26[2] = sub_227D7AE7C;
    v26[3] = &unk_24F089590;
    v27 = v7;
    v28 = v40;
    v29 = v38;
    v30 = v42;
    dispatch_group_notify(v19, v22, v26);

    _Block_object_dispose(v38, 8);
    _Block_object_dispose(v40, 8);
    _Block_object_dispose(v42, 8);

  }
  else
  {
    v24 = _Block_copy(v7);
    if (v24)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v23, (uint64_t)CFSTR("BDSErrorDomain"), 1000, 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(void *, _QWORD, _QWORD, void *))v24 + 2))(v24, 0, 0, v25);

    }
  }

}

- (void)addStoreItem:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const void *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend_connectionHealthy(self, v8, v9, v10, v11))
  {
    if (v7)
      v12 = v7;
    else
      v12 = &unk_24F089630;
    v13 = _Block_copy(v12);
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = sub_227D7B00C;
    v23[3] = &unk_24F089380;
    v24 = v7;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v14, (uint64_t)v23, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addStoreItem_completion_(v17, v18, (uint64_t)v6, (uint64_t)v13, v19);

  }
  else
  {
    v21 = _Block_copy(v7);
    if (v21)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v20, (uint64_t)CFSTR("BDSErrorDomain"), 1000, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(void *, _QWORD, _QWORD, void *))v21 + 2))(v21, 0, 0, v22);

    }
  }

}

- (void)addStoreItems:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  dispatch_group_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  const char *v20;
  uint64_t v21;
  NSObject *v22;
  const char *v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  _QWORD *v28;
  _QWORD *v29;
  _QWORD *v30;
  _QWORD v31[4];
  NSObject *v32;
  id v33;
  BDSServiceProxy *v34;
  _QWORD *v35;
  _QWORD *v36;
  _QWORD *v37;
  _QWORD v38[3];
  char v39;
  _QWORD v40[3];
  char v41;
  _QWORD v42[5];
  id v43;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend_connectionHealthy(self, v8, v9, v10, v11))
  {
    v42[0] = 0;
    v42[1] = v42;
    v42[2] = 0x3032000000;
    v42[3] = sub_227D77C7C;
    v42[4] = sub_227D77C8C;
    v43 = 0;
    v40[0] = 0;
    v40[1] = v40;
    v40[2] = 0x2020000000;
    v41 = 1;
    v38[0] = 0;
    v38[1] = v38;
    v38[2] = 0x2020000000;
    v39 = 0;
    v12 = dispatch_group_create();
    objc_msgSend_allKeys(v6, v13, v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = MEMORY[0x24BDAC760];
    v31[0] = MEMORY[0x24BDAC760];
    v31[1] = 3221225472;
    v31[2] = sub_227D7B2D8;
    v31[3] = &unk_24F089568;
    v19 = v12;
    v32 = v19;
    v33 = v6;
    v34 = self;
    v35 = v42;
    v36 = v40;
    v37 = v38;
    objc_msgSend_bds_traverseBatchesOfSize_block_(v17, v20, 64, (uint64_t)v31, v21);

    dispatch_get_global_queue(2, 0);
    v22 = objc_claimAutoreleasedReturnValue();
    v26[0] = v18;
    v26[1] = 3221225472;
    v26[2] = sub_227D7B4E4;
    v26[3] = &unk_24F089590;
    v27 = v7;
    v28 = v40;
    v29 = v38;
    v30 = v42;
    dispatch_group_notify(v19, v22, v26);

    _Block_object_dispose(v38, 8);
    _Block_object_dispose(v40, 8);
    _Block_object_dispose(v42, 8);

  }
  else
  {
    v24 = _Block_copy(v7);
    if (v24)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v23, (uint64_t)CFSTR("BDSErrorDomain"), 1000, 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(void *, _QWORD, _QWORD, void *))v24 + 2))(v24, 0, 0, v25);

    }
  }

}

- (void)deleteStoreItemWithStoreID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const void *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  void (**v21)(void *, _QWORD, void *);
  void *v22;
  _QWORD v23[4];
  id v24;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend_connectionHealthy(self, v8, v9, v10, v11))
  {
    if (v7)
      v12 = v7;
    else
      v12 = &unk_24F089650;
    v13 = _Block_copy(v12);
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = sub_227D7B670;
    v23[3] = &unk_24F089380;
    v24 = v7;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v14, (uint64_t)v23, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_deleteStoreItemWithStoreID_completion_(v17, v18, (uint64_t)v6, (uint64_t)v13, v19);

  }
  else
  {
    v21 = (void (**)(void *, _QWORD, void *))_Block_copy(v7);
    if (v21)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v20, (uint64_t)CFSTR("BDSErrorDomain"), 1000, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v21[2](v21, 0, v22);

    }
  }

}

- (void)deleteStoreItemsWithStoreIDs:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const void *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  void (**v21)(void *, _QWORD, void *);
  void *v22;
  _QWORD v23[4];
  id v24;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend_connectionHealthy(self, v8, v9, v10, v11))
  {
    if (v7)
      v12 = v7;
    else
      v12 = &unk_24F089670;
    v13 = _Block_copy(v12);
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = sub_227D7B7F4;
    v23[3] = &unk_24F089380;
    v24 = v7;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v14, (uint64_t)v23, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_deleteStoreItemsWithStoreIDs_completion_(v17, v18, (uint64_t)v6, (uint64_t)v13, v19);

  }
  else
  {
    v21 = (void (**)(void *, _QWORD, void *))_Block_copy(v7);
    if (v21)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v20, (uint64_t)CFSTR("BDSErrorDomain"), 1000, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v21[2](v21, 0, v22);

    }
  }

}

- (void)fetchStoreItemsIncludingDeleted:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;

  v4 = a3;
  v6 = a4;
  if (objc_msgSend_connectionHealthy(self, v7, v8, v9, v10))
  {
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = sub_227D7B954;
    v21[3] = &unk_24F089380;
    v11 = v6;
    v22 = v11;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v12, (uint64_t)v21, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_fetchStoreItemsIncludingDeleted_completion_(v15, v16, v4, (uint64_t)v11, v17);

  }
  else
  {
    v19 = _Block_copy(v6);
    if (v19)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v18, (uint64_t)CFSTR("BDSErrorDomain"), 1000, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(void *, _QWORD, _QWORD, void *))v19 + 2))(v19, 0, 0, v20);

    }
  }

}

- (void)getStoreItemChangesSince:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend_connectionHealthy(self, v8, v9, v10, v11))
  {
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = sub_227D7BACC;
    v22[3] = &unk_24F089380;
    v12 = v7;
    v23 = v12;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v13, (uint64_t)v22, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_getStoreItemChangesSince_completion_(v16, v17, (uint64_t)v6, (uint64_t)v12, v18);

  }
  else
  {
    v20 = _Block_copy(v7);
    if (v20)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v19, (uint64_t)CFSTR("BDSErrorDomain"), 1000, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(void *, _QWORD, _QWORD, _QWORD, void *, _QWORD))v20 + 2))(v20, 0, 0, 0, v21, 0);

    }
  }

}

- (void)storeItemForStoreID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  void (**v20)(void *, _QWORD, void *);
  void *v21;
  _QWORD v22[4];
  id v23;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend_connectionHealthy(self, v8, v9, v10, v11))
  {
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = sub_227D7BC40;
    v22[3] = &unk_24F089380;
    v12 = v7;
    v23 = v12;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v13, (uint64_t)v22, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_storeItemForStoreID_completion_(v16, v17, (uint64_t)v6, (uint64_t)v12, v18);

  }
  else
  {
    v20 = (void (**)(void *, _QWORD, void *))_Block_copy(v7);
    if (v20)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v19, (uint64_t)CFSTR("BDSErrorDomain"), 1000, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v20[2](v20, 0, v21);

    }
  }

}

- (void)collectionDetailForCollectionID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  void (**v20)(void *, _QWORD, void *);
  void *v21;
  _QWORD v22[4];
  id v23;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend_connectionHealthy(self, v8, v9, v10, v11))
  {
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = sub_227D7BDA8;
    v22[3] = &unk_24F089380;
    v12 = v7;
    v23 = v12;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v13, (uint64_t)v22, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_collectionDetailForCollectionID_completion_(v16, v17, (uint64_t)v6, (uint64_t)v12, v18);

  }
  else
  {
    v20 = (void (**)(void *, _QWORD, void *))_Block_copy(v7);
    if (v20)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v19, (uint64_t)CFSTR("BDSErrorDomain"), 1000, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v20[2](v20, 0, v21);

    }
  }

}

- (void)collectionDetailsForCollectionIDs:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  dispatch_group_t v13;
  uint64_t v14;
  NSObject *v15;
  id v16;
  const char *v17;
  uint64_t v18;
  NSObject *v19;
  id v20;
  const char *v21;
  void *v22;
  void *v23;
  _QWORD block[4];
  id v25;
  id v26;
  _QWORD *v27;
  _QWORD *v28;
  _QWORD v29[4];
  NSObject *v30;
  BDSServiceProxy *v31;
  id v32;
  _QWORD *v33;
  _QWORD *v34;
  _QWORD v35[5];
  id v36;
  _QWORD v37[5];
  id v38;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend_connectionHealthy(self, v8, v9, v10, v11))
  {
    v12 = (void *)objc_opt_new();
    v37[0] = 0;
    v37[1] = v37;
    v37[2] = 0x3032000000;
    v37[3] = sub_227D77C7C;
    v37[4] = sub_227D77C8C;
    v38 = 0;
    v35[0] = 0;
    v35[1] = v35;
    v35[2] = 0x3032000000;
    v35[3] = sub_227D77C7C;
    v35[4] = sub_227D77C8C;
    v36 = 0;
    v13 = dispatch_group_create();
    v14 = MEMORY[0x24BDAC760];
    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = sub_227D7C04C;
    v29[3] = &unk_24F089448;
    v15 = v13;
    v30 = v15;
    v31 = self;
    v33 = v35;
    v16 = v12;
    v32 = v16;
    v34 = v37;
    objc_msgSend_bds_traverseBatchesOfSize_block_(v6, v17, 64, (uint64_t)v29, v18);
    dispatch_get_global_queue(2, 0);
    v19 = objc_claimAutoreleasedReturnValue();
    block[0] = v14;
    block[1] = 3221225472;
    block[2] = sub_227D7C250;
    block[3] = &unk_24F089470;
    v25 = v16;
    v26 = v7;
    v27 = v37;
    v28 = v35;
    v20 = v16;
    dispatch_group_notify(v15, v19, block);

    _Block_object_dispose(v35, 8);
    _Block_object_dispose(v37, 8);

  }
  else
  {
    v22 = _Block_copy(v7);
    if (v22)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v21, (uint64_t)CFSTR("BDSErrorDomain"), 1000, 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(void *, _QWORD, _QWORD, void *))v22 + 2))(v22, 0, 0, v23);

    }
  }

}

- (void)deleteCollectionDetailForCollectionID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  void (**v21)(void *, _QWORD, void *);
  void *v22;
  _QWORD v23[4];
  id v24;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v7)
    v7 = &unk_24F089690;
  v9 = _Block_copy(v7);
  if (objc_msgSend_connectionHealthy(self, v10, v11, v12, v13))
  {
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = sub_227D7C414;
    v23[3] = &unk_24F089380;
    v24 = v8;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v14, (uint64_t)v23, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_deleteCollectionDetailForCollectionID_completion_(v17, v18, (uint64_t)v6, (uint64_t)v9, v19);

  }
  else
  {
    v21 = (void (**)(void *, _QWORD, void *))_Block_copy(v8);
    if (v21)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v20, (uint64_t)CFSTR("BDSErrorDomain"), 1000, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v21[2](v21, 0, v22);

    }
  }

}

- (void)deleteCollectionDetailForCollectionIDs:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  void (**v21)(void *, _QWORD, void *);
  void *v22;
  _QWORD v23[4];
  id v24;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v7)
    v7 = &unk_24F0896B0;
  v9 = _Block_copy(v7);
  if (objc_msgSend_connectionHealthy(self, v10, v11, v12, v13))
  {
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = sub_227D7C5A0;
    v23[3] = &unk_24F089380;
    v24 = v8;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v14, (uint64_t)v23, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_deleteCollectionDetailForCollectionIDs_completion_(v17, v18, (uint64_t)v6, (uint64_t)v9, v19);

  }
  else
  {
    v21 = (void (**)(void *, _QWORD, void *))_Block_copy(v8);
    if (v21)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v20, (uint64_t)CFSTR("BDSErrorDomain"), 1000, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v21[2](v21, 0, v22);

    }
  }

}

- (void)fetchCollectionDetailsIncludingDeleted:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;

  v4 = a3;
  v6 = a4;
  if (objc_msgSend_connectionHealthy(self, v7, v8, v9, v10))
  {
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = sub_227D7C700;
    v21[3] = &unk_24F089380;
    v11 = v6;
    v22 = v11;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v12, (uint64_t)v21, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_fetchCollectionDetailsIncludingDeleted_completion_(v15, v16, v4, (uint64_t)v11, v17);

  }
  else
  {
    v19 = _Block_copy(v6);
    if (v19)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v18, (uint64_t)CFSTR("BDSErrorDomain"), 1000, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(void *, _QWORD, _QWORD, void *))v19 + 2))(v19, 0, 0, v20);

    }
  }

}

- (void)setCollectionDetail:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v7)
    v7 = &unk_24F0896D0;
  v9 = _Block_copy(v7);
  if (objc_msgSend_connectionHealthy(self, v10, v11, v12, v13))
  {
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = sub_227D7C8F8;
    v23[3] = &unk_24F089380;
    v24 = v8;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v14, (uint64_t)v23, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setCollectionDetail_completion_(v17, v18, (uint64_t)v6, (uint64_t)v9, v19);

  }
  else
  {
    v21 = _Block_copy(v8);
    if (v21)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v20, (uint64_t)CFSTR("BDSErrorDomain"), 1000, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(void *, _QWORD, _QWORD, void *))v21 + 2))(v21, 0, 0, v22);

    }
  }

}

- (void)setCollectionDetails:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  dispatch_group_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  const char *v20;
  uint64_t v21;
  NSObject *v22;
  const char *v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  _QWORD *v28;
  _QWORD *v29;
  _QWORD *v30;
  _QWORD v31[4];
  NSObject *v32;
  id v33;
  BDSServiceProxy *v34;
  _QWORD *v35;
  _QWORD *v36;
  _QWORD *v37;
  _QWORD v38[3];
  char v39;
  _QWORD v40[3];
  char v41;
  _QWORD v42[5];
  id v43;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend_connectionHealthy(self, v8, v9, v10, v11))
  {
    v42[0] = 0;
    v42[1] = v42;
    v42[2] = 0x3032000000;
    v42[3] = sub_227D77C7C;
    v42[4] = sub_227D77C8C;
    v43 = 0;
    v40[0] = 0;
    v40[1] = v40;
    v40[2] = 0x2020000000;
    v41 = 1;
    v38[0] = 0;
    v38[1] = v38;
    v38[2] = 0x2020000000;
    v39 = 0;
    v12 = dispatch_group_create();
    objc_msgSend_allKeys(v6, v13, v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = MEMORY[0x24BDAC760];
    v31[0] = MEMORY[0x24BDAC760];
    v31[1] = 3221225472;
    v31[2] = sub_227D7CBC4;
    v31[3] = &unk_24F089568;
    v19 = v12;
    v32 = v19;
    v33 = v6;
    v34 = self;
    v35 = v42;
    v36 = v40;
    v37 = v38;
    objc_msgSend_bds_traverseBatchesOfSize_block_(v17, v20, 64, (uint64_t)v31, v21);

    dispatch_get_global_queue(2, 0);
    v22 = objc_claimAutoreleasedReturnValue();
    v26[0] = v18;
    v26[1] = 3221225472;
    v26[2] = sub_227D7CDD0;
    v26[3] = &unk_24F089590;
    v27 = v7;
    v28 = v40;
    v29 = v38;
    v30 = v42;
    dispatch_group_notify(v19, v22, v26);

    _Block_object_dispose(v38, 8);
    _Block_object_dispose(v40, 8);
    _Block_object_dispose(v42, 8);

  }
  else
  {
    v24 = _Block_copy(v7);
    if (v24)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v23, (uint64_t)CFSTR("BDSErrorDomain"), 1000, 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(void *, _QWORD, _QWORD, void *))v24 + 2))(v24, 0, 0, v25);

    }
  }

}

- (void)collectionMemberForCollectionMemberID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  void (**v20)(void *, _QWORD, void *);
  void *v21;
  _QWORD v22[4];
  id v23;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend_connectionHealthy(self, v8, v9, v10, v11))
  {
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = sub_227D7CF40;
    v22[3] = &unk_24F089380;
    v12 = v7;
    v23 = v12;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v13, (uint64_t)v22, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_collectionMemberForCollectionMemberID_completion_(v16, v17, (uint64_t)v6, (uint64_t)v12, v18);

  }
  else
  {
    v20 = (void (**)(void *, _QWORD, void *))_Block_copy(v7);
    if (v20)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v19, (uint64_t)CFSTR("BDSErrorDomain"), 1000, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v20[2](v20, 0, v21);

    }
  }

}

- (void)deleteCollectionMemberForCollectionMemberID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  void (**v21)(void *, _QWORD, void *);
  void *v22;
  _QWORD v23[4];
  id v24;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v7)
    v7 = &unk_24F0896F0;
  v9 = _Block_copy(v7);
  if (objc_msgSend_connectionHealthy(self, v10, v11, v12, v13))
  {
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = sub_227D7D104;
    v23[3] = &unk_24F089380;
    v24 = v8;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v14, (uint64_t)v23, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_deleteCollectionMemberForCollectionMemberID_completion_(v17, v18, (uint64_t)v6, (uint64_t)v9, v19);

  }
  else
  {
    v21 = (void (**)(void *, _QWORD, void *))_Block_copy(v8);
    if (v21)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v20, (uint64_t)CFSTR("BDSErrorDomain"), 1000, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v21[2](v21, 0, v22);

    }
  }

}

- (void)deleteCollectionMemberForCollectionMemberIDs:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  void (**v21)(void *, _QWORD, void *);
  void *v22;
  _QWORD v23[4];
  id v24;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v7)
    v7 = &unk_24F089710;
  v9 = _Block_copy(v7);
  if (objc_msgSend_connectionHealthy(self, v10, v11, v12, v13))
  {
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = sub_227D7D290;
    v23[3] = &unk_24F089380;
    v24 = v8;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v14, (uint64_t)v23, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_deleteCollectionMemberForCollectionMemberIDs_completion_(v17, v18, (uint64_t)v6, (uint64_t)v9, v19);

  }
  else
  {
    v21 = (void (**)(void *, _QWORD, void *))_Block_copy(v8);
    if (v21)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v20, (uint64_t)CFSTR("BDSErrorDomain"), 1000, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v21[2](v21, 0, v22);

    }
  }

}

- (void)fetchCollectionMembersIncludingDeleted:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;

  v4 = a3;
  v6 = a4;
  if (objc_msgSend_connectionHealthy(self, v7, v8, v9, v10))
  {
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = sub_227D7D3F0;
    v21[3] = &unk_24F089380;
    v11 = v6;
    v22 = v11;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v12, (uint64_t)v21, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_fetchCollectionMembersIncludingDeleted_completion_(v15, v16, v4, (uint64_t)v11, v17);

  }
  else
  {
    v19 = _Block_copy(v6);
    if (v19)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v18, (uint64_t)CFSTR("BDSErrorDomain"), 1000, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(void *, _QWORD, _QWORD, void *))v19 + 2))(v19, 0, 0, v20);

    }
  }

}

- (void)fetchCollectionMembersInCollectionID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend_connectionHealthy(self, v8, v9, v10, v11))
  {
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = sub_227D7D560;
    v22[3] = &unk_24F089380;
    v12 = v7;
    v23 = v12;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v13, (uint64_t)v22, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_fetchCollectionMembersInCollectionID_completion_(v16, v17, (uint64_t)v6, (uint64_t)v12, v18);

  }
  else
  {
    v20 = _Block_copy(v7);
    if (v20)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v19, (uint64_t)CFSTR("BDSErrorDomain"), 1000, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(void *, _QWORD, _QWORD, void *))v20 + 2))(v20, 0, 0, v21);

    }
  }

}

- (void)setCollectionMember:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v7)
    v7 = &unk_24F089730;
  v9 = _Block_copy(v7);
  if (objc_msgSend_connectionHealthy(self, v10, v11, v12, v13))
  {
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = sub_227D7D758;
    v23[3] = &unk_24F089380;
    v24 = v8;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v14, (uint64_t)v23, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setCollectionMember_completion_(v17, v18, (uint64_t)v6, (uint64_t)v9, v19);

  }
  else
  {
    v21 = _Block_copy(v8);
    if (v21)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v20, (uint64_t)CFSTR("BDSErrorDomain"), 1000, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(void *, _QWORD, _QWORD, void *))v21 + 2))(v21, 0, 0, v22);

    }
  }

}

- (void)setCollectionMembers:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  dispatch_group_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  const char *v20;
  uint64_t v21;
  NSObject *v22;
  const char *v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  _QWORD *v28;
  _QWORD *v29;
  _QWORD *v30;
  _QWORD v31[4];
  NSObject *v32;
  id v33;
  BDSServiceProxy *v34;
  _QWORD *v35;
  _QWORD *v36;
  _QWORD *v37;
  _QWORD v38[3];
  char v39;
  _QWORD v40[3];
  char v41;
  _QWORD v42[5];
  id v43;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend_connectionHealthy(self, v8, v9, v10, v11))
  {
    v42[0] = 0;
    v42[1] = v42;
    v42[2] = 0x3032000000;
    v42[3] = sub_227D77C7C;
    v42[4] = sub_227D77C8C;
    v43 = 0;
    v40[0] = 0;
    v40[1] = v40;
    v40[2] = 0x2020000000;
    v41 = 1;
    v38[0] = 0;
    v38[1] = v38;
    v38[2] = 0x2020000000;
    v39 = 0;
    v12 = dispatch_group_create();
    objc_msgSend_allKeys(v6, v13, v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = MEMORY[0x24BDAC760];
    v31[0] = MEMORY[0x24BDAC760];
    v31[1] = 3221225472;
    v31[2] = sub_227D7DA24;
    v31[3] = &unk_24F089568;
    v19 = v12;
    v32 = v19;
    v33 = v6;
    v34 = self;
    v35 = v42;
    v36 = v40;
    v37 = v38;
    objc_msgSend_bds_traverseBatchesOfSize_block_(v17, v20, 64, (uint64_t)v31, v21);

    dispatch_get_global_queue(2, 0);
    v22 = objc_claimAutoreleasedReturnValue();
    v26[0] = v18;
    v26[1] = 3221225472;
    v26[2] = sub_227D7DC30;
    v26[3] = &unk_24F089590;
    v27 = v7;
    v28 = v40;
    v29 = v38;
    v30 = v42;
    dispatch_group_notify(v19, v22, v26);

    _Block_object_dispose(v38, 8);
    _Block_object_dispose(v40, 8);
    _Block_object_dispose(v42, 8);

  }
  else
  {
    v24 = _Block_copy(v7);
    if (v24)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v23, (uint64_t)CFSTR("BDSErrorDomain"), 1000, 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(void *, _QWORD, _QWORD, void *))v24 + 2))(v24, 0, 0, v25);

    }
  }

}

- (void)fetchMaxSortOrderInCollectionID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  void (**v20)(void *, _QWORD, void *);
  void *v21;
  _QWORD v22[4];
  id v23;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend_connectionHealthy(self, v8, v9, v10, v11))
  {
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = sub_227D7DDA0;
    v22[3] = &unk_24F089380;
    v12 = v7;
    v23 = v12;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v13, (uint64_t)v22, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_fetchMaxSortOrderInCollectionID_completion_(v16, v17, (uint64_t)v6, (uint64_t)v12, v18);

  }
  else
  {
    v20 = (void (**)(void *, _QWORD, void *))_Block_copy(v7);
    if (v20)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v19, (uint64_t)CFSTR("BDSErrorDomain"), 1000, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v20[2](v20, 0, v21);

    }
  }

}

- (void)fetchMostRecentAudiobookWithCompletion:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  void (**v18)(void *, _QWORD, void *);
  void *v19;
  _QWORD v20[4];
  id v21;

  v4 = a3;
  if (objc_msgSend_connectionHealthy(self, v5, v6, v7, v8))
  {
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = sub_227D7DEF4;
    v20[3] = &unk_24F089380;
    v9 = v4;
    v21 = v9;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v10, (uint64_t)v20, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_fetchMostRecentAudiobookWithCompletion_(v13, v14, (uint64_t)v9, v15, v16);

  }
  else
  {
    v18 = (void (**)(void *, _QWORD, void *))_Block_copy(v4);
    if (v18)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v17, (uint64_t)CFSTR("BDSErrorDomain"), 1000, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v18[2](v18, 0, v19);

    }
  }

}

- (id)updateWantToReadAndReadingNowWithJaliscoUpdateSuccessful:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  void (**v20)(void *, void *);
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v29[4];
  id v30;

  v4 = a3;
  v6 = a4;
  if (objc_msgSend_connectionHealthy(self, v7, v8, v9, v10))
  {
    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = sub_227D7E078;
    v29[3] = &unk_24F089380;
    v11 = v6;
    v30 = v11;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v12, (uint64_t)v29, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_updateWantToReadAndReadingNowWithJaliscoUpdateSuccessful_completion_(v15, v16, v4, (uint64_t)v11, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v20 = (void (**)(void *, void *))_Block_copy(v6);
    if (v20)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v19, (uint64_t)CFSTR("BDSErrorDomain"), 1000, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v20[2](v20, v21);

    }
    objc_msgSend_progressWithTotalUnitCount_(MEMORY[0x24BDD1768], v22, 1, v23, v24);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setTotalUnitCount_(v18, v25, 1, v26, v27);
  }

  return v18;
}

- (id)updateWantToReadWithCompletion:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  void (**v19)(void *, void *);
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v28[4];
  id v29;

  v4 = a3;
  if (objc_msgSend_connectionHealthy(self, v5, v6, v7, v8))
  {
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = sub_227D7E1F0;
    v28[3] = &unk_24F089380;
    v9 = v4;
    v29 = v9;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v10, (uint64_t)v28, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_updateWantToReadWithCompletion_(v13, v14, (uint64_t)v9, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v19 = (void (**)(void *, void *))_Block_copy(v4);
    if (v19)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v18, (uint64_t)CFSTR("BDSErrorDomain"), 1000, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v19[2](v19, v20);

    }
    objc_msgSend_progressWithTotalUnitCount_(MEMORY[0x24BDD1768], v21, 1, v22, v23);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setTotalUnitCount_(v17, v24, 1, v25, v26);
  }

  return v17;
}

- (id)updateReadingNowWithCompletion:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  void (**v19)(void *, void *);
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v28[4];
  id v29;

  v4 = a3;
  if (objc_msgSend_connectionHealthy(self, v5, v6, v7, v8))
  {
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = sub_227D7E368;
    v28[3] = &unk_24F089380;
    v9 = v4;
    v29 = v9;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v10, (uint64_t)v28, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_updateReadingNowWithCompletion_(v13, v14, (uint64_t)v9, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v19 = (void (**)(void *, void *))_Block_copy(v4);
    if (v19)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v18, (uint64_t)CFSTR("BDSErrorDomain"), 1000, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v19[2](v19, v20);

    }
    objc_msgSend_progressWithTotalUnitCount_(MEMORY[0x24BDD1768], v21, 1, v22, v23);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setTotalUnitCount_(v17, v24, 1, v25, v26);
  }

  return v17;
}

- (void)updateBitrateForItemWithAdamID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  void (**v20)(void *, void *);
  void *v21;
  _QWORD v22[4];
  id v23;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend_connectionHealthy(self, v8, v9, v10, v11))
  {
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = sub_227D7E4C8;
    v22[3] = &unk_24F089380;
    v12 = v7;
    v23 = v12;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v13, (uint64_t)v22, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_updateBitrateForItemWithAdamID_completion_(v16, v17, (uint64_t)v6, (uint64_t)v12, v18);

  }
  else
  {
    v20 = (void (**)(void *, void *))_Block_copy(v7);
    if (v20)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v19, (uint64_t)CFSTR("BDSErrorDomain"), 1000, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v20[2](v20, v21);

    }
  }

}

- (void)audiobookStoreEnabledWithCompletion:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  void (**v18)(void *, _QWORD, void *);
  void *v19;
  _QWORD v20[4];
  id v21;

  v4 = a3;
  if (objc_msgSend_connectionHealthy(self, v5, v6, v7, v8))
  {
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = sub_227D7E618;
    v20[3] = &unk_24F089380;
    v9 = v4;
    v21 = v9;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v10, (uint64_t)v20, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_audiobookStoreEnabledWithCompletion_(v13, v14, (uint64_t)v9, v15, v16);

  }
  else
  {
    v18 = (void (**)(void *, _QWORD, void *))_Block_copy(v4);
    if (v18)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v17, (uint64_t)CFSTR("BDSErrorDomain"), 1000, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v18[2](v18, 0, v19);

    }
  }

}

- (void)currentCloudSyncVersions:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;

  v4 = a3;
  if (objc_msgSend_connectionHealthy(self, v5, v6, v7, v8))
  {
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = sub_227D7E758;
    v19[3] = &unk_24F089380;
    v9 = v4;
    v20 = v9;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v10, (uint64_t)v19, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_currentCloudSyncVersions_(v13, v14, (uint64_t)v9, v15, v16);

  }
  else
  {
    v17 = _Block_copy(v4);
    v18 = v17;
    if (v17)
      (*((void (**)(void *, _QWORD))v17 + 2))(v17, 0);

  }
}

- (void)setUserDatum:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend_connectionHealthy(self, v8, v9, v10, v11))
  {
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = sub_227D7E8A4;
    v22[3] = &unk_24F089380;
    v12 = v7;
    v23 = v12;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v13, (uint64_t)v22, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setUserDatum_completion_(v16, v17, (uint64_t)v6, (uint64_t)v12, v18);

  }
  else
  {
    v20 = _Block_copy(v7);
    if (v20)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v19, (uint64_t)CFSTR("BDSErrorDomain"), 1000, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(void *, _QWORD, _QWORD, void *))v20 + 2))(v20, 0, 0, v21);

    }
  }

}

- (void)setUserData:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend_connectionHealthy(self, v8, v9, v10, v11))
  {
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = sub_227D7EA14;
    v22[3] = &unk_24F089380;
    v12 = v7;
    v23 = v12;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v13, (uint64_t)v22, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setUserData_completion_(v16, v17, (uint64_t)v6, (uint64_t)v12, v18);

  }
  else
  {
    v20 = _Block_copy(v7);
    if (v20)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v19, (uint64_t)CFSTR("BDSErrorDomain"), 1000, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(void *, _QWORD, _QWORD, void *))v20 + 2))(v20, 0, 0, v21);

    }
  }

}

- (void)deleteUserDatumForKey:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  void (**v20)(void *, _QWORD, void *);
  void *v21;
  _QWORD v22[4];
  id v23;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend_connectionHealthy(self, v8, v9, v10, v11))
  {
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = sub_227D7EB80;
    v22[3] = &unk_24F089380;
    v12 = v7;
    v23 = v12;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v13, (uint64_t)v22, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_deleteUserDatumForKey_completion_(v16, v17, (uint64_t)v6, (uint64_t)v12, v18);

  }
  else
  {
    v20 = (void (**)(void *, _QWORD, void *))_Block_copy(v7);
    if (v20)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v19, (uint64_t)CFSTR("BDSErrorDomain"), 1000, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v20[2](v20, 0, v21);

    }
  }

}

- (void)userDatumIncludingDeleted:(BOOL)a3 forKey:(id)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (**v17)(_QWORD, _QWORD, _QWORD);
  const char *v18;
  const char *v19;
  void *v20;
  id v21;

  v6 = a3;
  v21 = a4;
  v8 = a5;
  if (objc_msgSend_connectionHealthy(self, v9, v10, v11, v12))
  {
    objc_msgSend_remoteObjectProxy(self, v13, v14, v15, v16);
    v17 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend_userDatumIncludingDeleted_forKey_completion_(v17, v18, v6, (uint64_t)v21, (uint64_t)v8);
  }
  else
  {
    v17 = (void (**)(_QWORD, _QWORD, _QWORD))_Block_copy(v8);
    if (v17)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v19, (uint64_t)CFSTR("BDSErrorDomain"), 1000, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, void *))v17)[2](v17, 0, v20);

    }
  }

}

- (void)fetchUserDataIncludingDeleted:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;

  v4 = a3;
  v6 = a4;
  if (objc_msgSend_connectionHealthy(self, v7, v8, v9, v10))
  {
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = sub_227D7EE08;
    v21[3] = &unk_24F089380;
    v11 = v6;
    v22 = v11;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v12, (uint64_t)v21, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_fetchUserDataIncludingDeleted_completion_(v15, v16, v4, (uint64_t)v11, v17);

  }
  else
  {
    v19 = _Block_copy(v6);
    if (v19)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v18, (uint64_t)CFSTR("BDSErrorDomain"), 1000, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(void *, _QWORD, _QWORD, void *))v19 + 2))(v19, 0, 0, v20);

    }
  }

}

- (void)getUserDataChangesSince:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend_connectionHealthy(self, v8, v9, v10, v11))
  {
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = sub_227D7EF80;
    v22[3] = &unk_24F089380;
    v12 = v7;
    v23 = v12;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v13, (uint64_t)v22, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_getUserDataChangesSince_completion_(v16, v17, (uint64_t)v6, (uint64_t)v12, v18);

  }
  else
  {
    v20 = _Block_copy(v7);
    if (v20)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v19, (uint64_t)CFSTR("BDSErrorDomain"), 1000, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(void *, _QWORD, _QWORD, _QWORD, void *, _QWORD))v20 + 2))(v20, 0, 0, 0, v21, 0);

    }
  }

}

- (void)resolvedUserDataValueForKey:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  void (**v20)(void *, _QWORD, void *);
  void *v21;
  _QWORD v22[4];
  id v23;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend_connectionHealthy(self, v8, v9, v10, v11))
  {
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = sub_227D7F0F4;
    v22[3] = &unk_24F089380;
    v12 = v7;
    v23 = v12;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v13, (uint64_t)v22, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_resolvedUserDataValueForKey_completion_(v16, v17, (uint64_t)v6, (uint64_t)v12, v18);

  }
  else
  {
    v20 = (void (**)(void *, _QWORD, void *))_Block_copy(v7);
    if (v20)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v19, (uint64_t)CFSTR("BDSErrorDomain"), 1000, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v20[2](v20, 0, v21);

    }
  }

}

- (void)userDataValueForKey:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  void (**v20)(void *, _QWORD, void *);
  void *v21;
  _QWORD v22[4];
  id v23;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend_connectionHealthy(self, v8, v9, v10, v11))
  {
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = sub_227D7F25C;
    v22[3] = &unk_24F089380;
    v12 = v7;
    v23 = v12;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v13, (uint64_t)v22, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_userDataValueForKey_completion_(v16, v17, (uint64_t)v6, (uint64_t)v12, v18);

  }
  else
  {
    v20 = (void (**)(void *, _QWORD, void *))_Block_copy(v7);
    if (v20)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v19, (uint64_t)CFSTR("BDSErrorDomain"), 1000, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v20[2](v20, 0, v21);

    }
  }

}

- (void)setUserDataValue:(id)a3 forKey:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  const char *v21;
  void (**v22)(void *, void *);
  void *v23;
  _QWORD v24[4];
  id v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend_connectionHealthy(self, v11, v12, v13, v14))
  {
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = sub_227D7F3DC;
    v24[3] = &unk_24F089380;
    v15 = v10;
    v25 = v15;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v16, (uint64_t)v24, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setUserDataValue_forKey_completion_(v19, v20, (uint64_t)v8, (uint64_t)v9, (uint64_t)v15);

  }
  else
  {
    v22 = (void (**)(void *, void *))_Block_copy(v10);
    if (v22)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v21, (uint64_t)CFSTR("BDSErrorDomain"), 1000, 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v22[2](v22, v23);

    }
  }

}

- (void)deleteEngagementDataForKey:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (**v12)(void *, _QWORD, void *);
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void (**v19)(void *, _QWORD, void *);
  NSObject *v20;
  const char *v21;
  void *v22;
  _QWORD v23[4];
  void (**v24)(void *, _QWORD, void *);

  v6 = a3;
  v7 = a4;
  if (objc_msgSend_connectionHealthy(self, v8, v9, v10, v11))
  {
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = sub_227D7F564;
    v23[3] = &unk_24F089380;
    v12 = (void (**)(void *, _QWORD, void *))v7;
    v24 = v12;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v13, (uint64_t)v23, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_deleteEngagementDataForKey_completion_(v16, v17, (uint64_t)v6, (uint64_t)v12, v18);

    v19 = v24;
  }
  else
  {
    BDSServiceLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_227E5893C();

    v19 = (void (**)(void *, _QWORD, void *))_Block_copy(v7);
    if (v19)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v21, (uint64_t)CFSTR("BDSErrorDomain"), 1000, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v19[2](v19, 0, v22);

    }
  }

}

- (void)engagementDataForKey:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (**v12)(void *, _QWORD, void *);
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void (**v19)(void *, _QWORD, void *);
  NSObject *v20;
  const char *v21;
  void *v22;
  _QWORD v23[4];
  void (**v24)(void *, _QWORD, void *);

  v6 = a3;
  v7 = a4;
  if (objc_msgSend_connectionHealthy(self, v8, v9, v10, v11))
  {
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = sub_227D7F71C;
    v23[3] = &unk_24F089380;
    v12 = (void (**)(void *, _QWORD, void *))v7;
    v24 = v12;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v13, (uint64_t)v23, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_engagementDataForKey_completion_(v16, v17, (uint64_t)v6, (uint64_t)v12, v18);

    v19 = v24;
  }
  else
  {
    BDSServiceLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_227E589C8();

    v19 = (void (**)(void *, _QWORD, void *))_Block_copy(v7);
    if (v19)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v21, (uint64_t)CFSTR("BDSErrorDomain"), 1000, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v19[2](v19, 0, v22);

    }
  }

}

- (void)engagementDataIncludingDeleted:(BOOL)a3 forKey:(id)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (**v14)(void *, _QWORD, void *);
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  void (**v20)(void *, _QWORD, void *);
  NSObject *v21;
  const char *v22;
  void *v23;
  _QWORD v24[4];
  void (**v25)(void *, _QWORD, void *);

  v6 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend_connectionHealthy(self, v10, v11, v12, v13))
  {
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = sub_227D7F8E4;
    v24[3] = &unk_24F089380;
    v14 = (void (**)(void *, _QWORD, void *))v9;
    v25 = v14;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v15, (uint64_t)v24, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_engagementDataIncludingDeleted_forKey_completion_(v18, v19, v6, (uint64_t)v8, (uint64_t)v14);

    v20 = v25;
  }
  else
  {
    BDSServiceLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      sub_227E58A54();

    v20 = (void (**)(void *, _QWORD, void *))_Block_copy(v9);
    if (v20)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v22, (uint64_t)CFSTR("BDSErrorDomain"), 1000, 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v20[2](v20, 0, v23);

    }
  }

}

- (void)fetchEngagementDatasIncludingDeleted:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  const char *v20;
  void *v21;
  _QWORD v22[4];
  id v23;

  v4 = a3;
  v6 = a4;
  if (objc_msgSend_connectionHealthy(self, v7, v8, v9, v10))
  {
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = sub_227D7FA94;
    v22[3] = &unk_24F089380;
    v11 = v6;
    v23 = v11;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v12, (uint64_t)v22, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_fetchEngagementDatasIncludingDeleted_completion_(v15, v16, v4, (uint64_t)v11, v17);

    v18 = v23;
  }
  else
  {
    BDSServiceLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      sub_227E58AE0();

    v18 = _Block_copy(v6);
    if (v18)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v20, (uint64_t)CFSTR("BDSErrorDomain"), 1000, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(void *, _QWORD, _QWORD, void *))v18 + 2))(v18, 0, 0, v21);

    }
  }

}

- (void)setEngagementDatas:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  const char *v21;
  void *v22;
  _QWORD v23[4];
  id v24;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend_connectionHealthy(self, v8, v9, v10, v11))
  {
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = sub_227D7FCE4;
    v23[3] = &unk_24F089380;
    v12 = v7;
    v24 = v12;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v13, (uint64_t)v23, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setEngagementDatas_completion_(v16, v17, (uint64_t)v6, (uint64_t)v12, v18);

    v19 = v24;
  }
  else
  {
    BDSServiceLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_227E58BF8();

    v19 = _Block_copy(v7);
    if (v19)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v21, (uint64_t)CFSTR("BDSErrorDomain"), 1000, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(void *, _QWORD, _QWORD, void *))v19 + 2))(v19, 0, 0, v22);

    }
  }

}

- (void)setEngagementData:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  const char *v21;
  void *v22;
  _QWORD v23[4];
  id v24;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend_connectionHealthy(self, v8, v9, v10, v11))
  {
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = sub_227D7FEA4;
    v23[3] = &unk_24F089380;
    v12 = v7;
    v24 = v12;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v13, (uint64_t)v23, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setEngagementData_completion_(v16, v17, (uint64_t)v6, (uint64_t)v12, v18);

    v19 = v24;
  }
  else
  {
    BDSServiceLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_227E58C84();

    v19 = _Block_copy(v7);
    if (v19)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v21, (uint64_t)CFSTR("BDSErrorDomain"), 1000, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(void *, _QWORD, _QWORD, void *))v19 + 2))(v19, 0, 0, v22);

    }
  }

}

- (void)clearSyncMetadata:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (**v9)(void *, void *);
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void (**v17)(void *, void *);
  NSObject *v18;
  const char *v19;
  void *v20;
  _QWORD v21[4];
  void (**v22)(void *, void *);

  v4 = a3;
  if (objc_msgSend_connectionHealthy(self, v5, v6, v7, v8))
  {
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = sub_227D80048;
    v21[3] = &unk_24F089380;
    v9 = (void (**)(void *, void *))v4;
    v22 = v9;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v10, (uint64_t)v21, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_clearSyncMetadata_(v13, v14, (uint64_t)v9, v15, v16);

    v17 = v22;
  }
  else
  {
    BDSServiceLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_227E58D10();

    v17 = (void (**)(void *, void *))_Block_copy(v4);
    if (v17)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v19, (uint64_t)CFSTR("BDSErrorDomain"), 1000, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v17[2](v17, v20);

    }
  }

}

- (void)forceFetchRemoteChanges:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (**v9)(void *, void *);
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void (**v17)(void *, void *);
  NSObject *v18;
  const char *v19;
  void *v20;
  _QWORD v21[4];
  void (**v22)(void *, void *);

  v4 = a3;
  if (objc_msgSend_connectionHealthy(self, v5, v6, v7, v8))
  {
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = sub_227D801E4;
    v21[3] = &unk_24F089380;
    v9 = (void (**)(void *, void *))v4;
    v22 = v9;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v10, (uint64_t)v21, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_forceFetchRemoteChanges_(v13, v14, (uint64_t)v9, v15, v16);

    v17 = v22;
  }
  else
  {
    BDSServiceLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_227E58D9C();

    v17 = (void (**)(void *, void *))_Block_copy(v4);
    if (v17)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v19, (uint64_t)CFSTR("BDSErrorDomain"), 1000, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v17[2](v17, v20);

    }
  }

}

- (void)cloudSyncDiagnosticDetachWithCompletionHandler:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (**v9)(void *, void *);
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void (**v17)(void *, void *);
  NSObject *v18;
  const char *v19;
  void *v20;
  _QWORD v21[4];
  void (**v22)(void *, void *);

  v4 = a3;
  if (objc_msgSend_connectionHealthy(self, v5, v6, v7, v8))
  {
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = sub_227D80380;
    v21[3] = &unk_24F089380;
    v9 = (void (**)(void *, void *))v4;
    v22 = v9;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v10, (uint64_t)v21, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_cloudSyncDiagnosticDetachWithCompletionHandler_(v13, v14, (uint64_t)v9, v15, v16);

    v17 = v22;
  }
  else
  {
    BDSServiceLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_227E58E28();

    v17 = (void (**)(void *, void *))_Block_copy(v4);
    if (v17)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v19, (uint64_t)CFSTR("BDSErrorDomain"), 1000, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v17[2](v17, v20);

    }
  }

}

- (void)cloudSyncDiagnosticFindLocalIdDupesWithCompletionHandler:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (**v9)(void *, void *);
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void (**v17)(void *, void *);
  NSObject *v18;
  const char *v19;
  void *v20;
  _QWORD v21[4];
  void (**v22)(void *, void *);

  v4 = a3;
  if (objc_msgSend_connectionHealthy(self, v5, v6, v7, v8))
  {
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = sub_227D8051C;
    v21[3] = &unk_24F089380;
    v9 = (void (**)(void *, void *))v4;
    v22 = v9;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v10, (uint64_t)v21, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_cloudSyncDiagnosticFindLocalIdDupesWithCompletionHandler_(v13, v14, (uint64_t)v9, v15, v16);

    v17 = v22;
  }
  else
  {
    BDSServiceLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_227E58EB4();

    v17 = (void (**)(void *, void *))_Block_copy(v4);
    if (v17)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v19, (uint64_t)CFSTR("BDSErrorDomain"), 1000, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v17[2](v17, v20);

    }
  }

}

- (void)cloudSyncDiagnosticInfoWithCompletionHandler:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void (**v10)(void *, _QWORD, void *);
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void (**v18)(void *, _QWORD, void *);
  NSObject *v19;
  const char *v20;
  void *v21;
  _QWORD v22[4];
  void (**v23)(void *, _QWORD, void *);

  v4 = a3;
  if (v4)
    v9 = v4;
  else
    v9 = &unk_24F089770;
  if (objc_msgSend_connectionHealthy(self, v5, v6, v7, v8))
  {
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = sub_227D806CC;
    v22[3] = &unk_24F089380;
    v10 = v9;
    v23 = v10;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v11, (uint64_t)v22, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_cloudSyncDiagnosticInfoWithCompletionHandler_(v14, v15, (uint64_t)v10, v16, v17);

    v18 = v23;
  }
  else
  {
    BDSServiceLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      sub_227E58F40();

    v18 = (void (**)(void *, _QWORD, void *))_Block_copy(v9);
    if (v18)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v20, (uint64_t)CFSTR("BDSErrorDomain"), 1000, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v18[2](v18, 0, v21);

    }
  }

}

- (void)updatePolitely:(BOOL)a3 reason:(int64_t)a4 completionWithError:(id)a5
{
  _BOOL8 v6;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void (**v14)(void *, _QWORD, void *);
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  void (**v20)(void *, _QWORD, void *);
  NSObject *v21;
  const char *v22;
  void *v23;
  _QWORD v24[4];
  void (**v25)(void *, _QWORD, void *);
  int64_t v26;
  BOOL v27;

  v6 = a3;
  v8 = a5;
  if (v8)
    v13 = v8;
  else
    v13 = &unk_24F089790;
  if (objc_msgSend_connectionHealthy(self, v9, v10, v11, v12))
  {
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = sub_227D808A0;
    v24[3] = &unk_24F0897B8;
    v27 = v6;
    v26 = a4;
    v14 = v13;
    v25 = v14;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v15, (uint64_t)v24, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_updatePolitely_reason_completionWithError_(v18, v19, v6, a4, (uint64_t)v14);

    v20 = v25;
  }
  else
  {
    BDSServiceLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      sub_227E58FCC();

    v20 = (void (**)(void *, _QWORD, void *))_Block_copy(v13);
    if (v20)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v22, (uint64_t)CFSTR("BDSErrorDomain"), 1000, 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v20[2](v20, 0, v23);

    }
  }

}

- (void)updatePolitely:(BOOL)a3 reason:(int64_t)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  int64_t v25;
  BOOL v26;

  v6 = a3;
  v8 = a5;
  if (v8)
    v13 = v8;
  else
    v13 = &unk_24F0897F8;
  if (objc_msgSend_connectionHealthy(self, v9, v10, v11, v12))
  {
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = sub_227D80A48;
    v23[3] = &unk_24F0897B8;
    v26 = v6;
    v25 = a4;
    v14 = v13;
    v24 = v14;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v15, (uint64_t)v23, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_updatePolitely_reason_completion_(v18, v19, v6, a4, (uint64_t)v14);

    v20 = v24;
  }
  else
  {
    BDSServiceLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      sub_227E58FCC();

    v22 = _Block_copy(v13);
    v20 = v22;
    if (v22)
      (*((void (**)(void *, _QWORD))v22 + 2))(v22, 0);
  }

}

- (void)updateFamilyPolitely:(BOOL)a3 reason:(int64_t)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  int64_t v24;
  BOOL v25;

  v6 = a3;
  v8 = a5;
  if (objc_msgSend_connectionHealthy(self, v9, v10, v11, v12))
  {
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = sub_227D80BDC;
    v22[3] = &unk_24F0897B8;
    v25 = v6;
    v24 = a4;
    v13 = v8;
    v23 = v13;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v14, (uint64_t)v22, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_updateFamilyPolitely_reason_completion_(v17, v18, v6, a4, (uint64_t)v13);

    v19 = v23;
  }
  else
  {
    BDSServiceLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_227E59058();

    v21 = _Block_copy(v8);
    v19 = v21;
    if (v21)
      (*((void (**)(void *, _QWORD))v21 + 2))(v21, 0);
  }

}

- (void)updateFamilyPolitely:(BOOL)a3 reason:(int64_t)a4 completionWithError:(id)a5
{
  _BOOL8 v6;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (**v13)(void *, _QWORD, void *);
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  void (**v19)(void *, _QWORD, void *);
  NSObject *v20;
  const char *v21;
  void *v22;
  _QWORD v23[4];
  void (**v24)(void *, _QWORD, void *);
  int64_t v25;
  BOOL v26;

  v6 = a3;
  v8 = a5;
  if (objc_msgSend_connectionHealthy(self, v9, v10, v11, v12))
  {
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = sub_227D80DA0;
    v23[3] = &unk_24F0897B8;
    v26 = v6;
    v25 = a4;
    v13 = (void (**)(void *, _QWORD, void *))v8;
    v24 = v13;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v14, (uint64_t)v23, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_updateFamilyPolitely_reason_completionWithError_(v17, v18, v6, a4, (uint64_t)v13);

    v19 = v24;
  }
  else
  {
    BDSServiceLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_227E59058();

    v19 = (void (**)(void *, _QWORD, void *))_Block_copy(v8);
    if (v19)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v21, (uint64_t)CFSTR("BDSErrorDomain"), 1000, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v19[2](v19, 0, v22);

    }
  }

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
  void *v14;
  id v15;
  id v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  BOOL v28;

  v6 = a3;
  v8 = a4;
  v9 = a5;
  if (v9)
    v14 = v9;
  else
    v14 = &unk_24F089818;
  if (objc_msgSend_connectionHealthy(self, v10, v11, v12, v13))
  {
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = sub_227D80F64;
    v25[3] = &unk_24F089840;
    v28 = v6;
    v15 = v8;
    v26 = v15;
    v16 = v14;
    v27 = v16;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v17, (uint64_t)v25, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setItemHidden_forStoreID_completion_(v20, v21, v6, (uint64_t)v15, (uint64_t)v16);

    v22 = v26;
  }
  else
  {
    BDSServiceLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      sub_227E590E4();

    v24 = _Block_copy(v14);
    v22 = v24;
    if (v24)
      (*((void (**)(void *, _QWORD))v24 + 2))(v24, 0);
  }

}

- (void)hideItemsWithStoreIDs:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, void *);
  void *v27;
  id v28;
  id v29;

  v6 = a3;
  v7 = a4;
  if (v7)
    v12 = v7;
  else
    v12 = &unk_24F089880;
  if (objc_msgSend_connectionHealthy(self, v8, v9, v10, v11))
  {
    v24 = MEMORY[0x24BDAC760];
    v25 = 3221225472;
    v26 = sub_227D81118;
    v27 = &unk_24F0898A8;
    v13 = v6;
    v28 = v13;
    v14 = v12;
    v29 = v14;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v15, (uint64_t)&v24, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_hideItemsWithStoreIDs_completion_(v18, v19, (uint64_t)v13, (uint64_t)v14, v20, v24, v25, v26, v27);

    v21 = v28;
  }
  else
  {
    BDSServiceLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      sub_227E59190();

    v23 = _Block_copy(v12);
    v21 = v23;
    if (v23)
      (*((void (**)(void *, _QWORD))v23 + 2))(v23, 0);
  }

}

- (void)resetPurchasedTokenForStoreIDs:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, void *);
  void *v27;
  id v28;
  id v29;

  v6 = a3;
  v7 = a4;
  if (v7)
    v12 = v7;
  else
    v12 = &unk_24F0898C8;
  if (objc_msgSend_connectionHealthy(self, v8, v9, v10, v11))
  {
    v24 = MEMORY[0x24BDAC760];
    v25 = 3221225472;
    v26 = sub_227D812CC;
    v27 = &unk_24F0898A8;
    v13 = v6;
    v28 = v13;
    v14 = v12;
    v29 = v14;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v15, (uint64_t)&v24, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_resetPurchasedTokenForStoreIDs_completion_(v18, v19, (uint64_t)v13, (uint64_t)v14, v20, v24, v25, v26, v27);

    v21 = v28;
  }
  else
  {
    BDSServiceLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      sub_227E5921C();

    v23 = _Block_copy(v12);
    v21 = v23;
    if (v23)
      (*((void (**)(void *, _QWORD))v23 + 2))(v23, 0);
  }

}

- (void)deleteItemsWithStoreIDs:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void (**v13)(void *, void *);
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void (**v21)(void *, void *);
  NSObject *v22;
  const char *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t, void *);
  void *v28;
  void (**v29)(void *, void *);
  id v30;

  v6 = a3;
  v7 = a4;
  if (v7)
    v12 = v7;
  else
    v12 = &unk_24F0898E8;
  if (objc_msgSend_connectionHealthy(self, v8, v9, v10, v11))
  {
    v25 = MEMORY[0x24BDAC760];
    v26 = 3221225472;
    v27 = sub_227D814AC;
    v28 = &unk_24F0898A8;
    v13 = (void (**)(void *, void *))v6;
    v29 = v13;
    v14 = v12;
    v30 = v14;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v15, (uint64_t)&v25, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_deleteItemsWithStoreIDs_completion_(v18, v19, (uint64_t)v13, (uint64_t)v14, v20, v25, v26, v27, v28);

    v21 = v29;
  }
  else
  {
    BDSServiceLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      sub_227E59190();

    v21 = (void (**)(void *, void *))_Block_copy(v12);
    if (v21)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v23, (uint64_t)CFSTR("BDSErrorDomain"), 1000, 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v21[2](v21, v24);

    }
  }

}

- (void)resetStaleJaliscoDatabaseWithCompletion:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void (**v10)(void *, void *);
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void (**v18)(void *, void *);
  NSObject *v19;
  const char *v20;
  void *v21;
  _QWORD v22[4];
  void (**v23)(void *, void *);

  v4 = a3;
  if (v4)
    v9 = v4;
  else
    v9 = &unk_24F089908;
  if (objc_msgSend_connectionHealthy(self, v5, v6, v7, v8))
  {
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = sub_227D8165C;
    v22[3] = &unk_24F089380;
    v10 = v9;
    v23 = v10;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v11, (uint64_t)v22, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_resetStaleJaliscoDatabaseWithCompletion_(v14, v15, (uint64_t)v10, v16, v17);

    v18 = v23;
  }
  else
  {
    BDSServiceLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      sub_227E592A8();

    v18 = (void (**)(void *, void *))_Block_copy(v9);
    if (v18)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v20, (uint64_t)CFSTR("BDSErrorDomain"), 1000, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v18[2](v18, v21);

    }
  }

}

- (void)fetchAllHiddenItemStoreIDsWithCompletion:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void (**v10)(void *, _QWORD, void *);
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void (**v18)(void *, _QWORD, void *);
  NSObject *v19;
  const char *v20;
  void *v21;
  _QWORD v22[4];
  void (**v23)(void *, _QWORD, void *);

  v4 = a3;
  if (v4)
    v9 = v4;
  else
    v9 = &unk_24F089948;
  if (objc_msgSend_connectionHealthy(self, v5, v6, v7, v8))
  {
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = sub_227D8180C;
    v22[3] = &unk_24F089380;
    v10 = v9;
    v23 = v10;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v11, (uint64_t)v22, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_fetchAllHiddenItemStoreIDsWithCompletion_(v14, v15, (uint64_t)v10, v16, v17);

    v18 = v23;
  }
  else
  {
    BDSServiceLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      sub_227E59334();

    v18 = (void (**)(void *, _QWORD, void *))_Block_copy(v9);
    if (v18)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v20, (uint64_t)CFSTR("BDSErrorDomain"), 1000, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v18[2](v18, 0, v21);

    }
  }

}

- (void)updatePolitelyAfterSignIn:(BOOL)a3 reason:(int64_t)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  int64_t v25;
  BOOL v26;

  v6 = a3;
  v8 = a5;
  if (v8)
    v13 = v8;
  else
    v13 = &unk_24F089968;
  if (objc_msgSend_connectionHealthy(self, v9, v10, v11, v12))
  {
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = sub_227D819B0;
    v23[3] = &unk_24F0897B8;
    v26 = v6;
    v25 = a4;
    v14 = v13;
    v24 = v14;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v15, (uint64_t)v23, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_updatePolitelyAfterSignIn_reason_completion_(v18, v19, v6, a4, (uint64_t)v14);

    v20 = v24;
  }
  else
  {
    BDSServiceLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      sub_227E593C0();

    v22 = _Block_copy(v13);
    v20 = v22;
    if (v22)
      (*((void (**)(void *, _QWORD))v22 + 2))(v22, 0);
  }

}

- (void)updatePolitelyAfterSignOut:(BOOL)a3 reason:(int64_t)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  int64_t v25;
  BOOL v26;

  v6 = a3;
  v8 = a5;
  if (v8)
    v13 = v8;
  else
    v13 = &unk_24F089988;
  if (objc_msgSend_connectionHealthy(self, v9, v10, v11, v12))
  {
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = sub_227D81B54;
    v23[3] = &unk_24F0897B8;
    v26 = v6;
    v25 = a4;
    v14 = v13;
    v24 = v14;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v15, (uint64_t)v23, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_updatePolitelyAfterSignOut_reason_completion_(v18, v19, v6, a4, (uint64_t)v14);

    v20 = v24;
  }
  else
  {
    BDSServiceLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      sub_227E5944C();

    v22 = _Block_copy(v13);
    v20 = v22;
    if (v22)
      (*((void (**)(void *, _QWORD))v22 + 2))(v22, 0);
  }

}

- (void)updatePolitely:(BOOL)a3 uiManager:(id)a4 reason:(int64_t)a5 completion:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  int64_t v28;
  BOOL v29;

  v8 = a3;
  v10 = a4;
  v11 = a6;
  if (v11)
    v16 = v11;
  else
    v16 = &unk_24F0899A8;
  if (objc_msgSend_connectionHealthy(self, v12, v13, v14, v15))
  {
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = sub_227D81D0C;
    v26[3] = &unk_24F0897B8;
    v29 = v8;
    v28 = a5;
    v17 = v16;
    v27 = v17;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v18, (uint64_t)v26, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_updatePolitely_uiManager_reason_completion_(v21, v22, v8, (uint64_t)v10, a5, v17);

    v23 = v27;
  }
  else
  {
    BDSServiceLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      sub_227E594D8();

    v25 = _Block_copy(v16);
    v23 = v25;
    if (v25)
      (*((void (**)(void *, _QWORD))v25 + 2))(v25, 0);
  }

}

- (void)setBookWidgetInfo:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void (**v13)(void *, void *);
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void (**v21)(void *, void *);
  NSObject *v22;
  const char *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t, void *);
  void *v28;
  void (**v29)(void *, void *);
  id v30;

  v6 = a3;
  v7 = a4;
  if (v7)
    v12 = v7;
  else
    v12 = &unk_24F089A10;
  if (objc_msgSend_connectionHealthy(self, v8, v9, v10, v11))
  {
    v25 = MEMORY[0x24BDAC760];
    v26 = 3221225472;
    v27 = sub_227D81EFC;
    v28 = &unk_24F0898A8;
    v13 = (void (**)(void *, void *))v6;
    v29 = v13;
    v14 = v12;
    v30 = v14;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v15, (uint64_t)&v25, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setBookWidgetInfo_completion_(v18, v19, (uint64_t)v13, (uint64_t)v14, v20, v25, v26, v27, v28);

    v21 = v29;
  }
  else
  {
    BDSServiceLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      sub_227E59590();

    v21 = (void (**)(void *, void *))_Block_copy(v12);
    if (v21)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v23, (uint64_t)CFSTR("BDSErrorDomain"), 1000, 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v21[2](v21, v24);

    }
  }

}

- (void)getBookWidgetDataWithLimit:(int64_t)a3 completion:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (**v11)(void *, _QWORD, void *);
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void (**v18)(void *, _QWORD, void *);
  NSObject *v19;
  const char *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, void *);
  void *v25;
  void (**v26)(void *, _QWORD, void *);
  int64_t v27;

  v6 = a4;
  if (objc_msgSend_connectionHealthy(self, v7, v8, v9, v10))
  {
    v22 = MEMORY[0x24BDAC760];
    v23 = 3221225472;
    v24 = sub_227D820AC;
    v25 = &unk_24F089A38;
    v27 = a3;
    v11 = (void (**)(void *, _QWORD, void *))v6;
    v26 = v11;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v12, (uint64_t)&v22, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_getBookWidgetDataWithLimit_completion_(v15, v16, a3, (uint64_t)v11, v17, v22, v23, v24, v25);

    v18 = v26;
  }
  else
  {
    BDSServiceLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      sub_227E5961C();

    v18 = (void (**)(void *, _QWORD, void *))_Block_copy(v6);
    if (v18)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v20, (uint64_t)CFSTR("BDSErrorDomain"), 1000, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v18[2](v18, 0, v21);

    }
  }

}

- (void)getBookWidgetInfoWithLimit:(int64_t)a3 completion:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (**v11)(void *, _QWORD, void *);
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void (**v18)(void *, _QWORD, void *);
  NSObject *v19;
  const char *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, void *);
  void *v25;
  void (**v26)(void *, _QWORD, void *);
  int64_t v27;

  v6 = a4;
  if (objc_msgSend_connectionHealthy(self, v7, v8, v9, v10))
  {
    v22 = MEMORY[0x24BDAC760];
    v23 = 3221225472;
    v24 = sub_227D82260;
    v25 = &unk_24F089A38;
    v27 = a3;
    v11 = (void (**)(void *, _QWORD, void *))v6;
    v26 = v11;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v12, (uint64_t)&v22, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_getBookWidgetInfoWithLimit_completion_(v15, v16, a3, (uint64_t)v11, v17, v22, v23, v24, v25);

    v18 = v26;
  }
  else
  {
    BDSServiceLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      sub_227E596A8();

    v18 = (void (**)(void *, _QWORD, void *))_Block_copy(v6);
    if (v18)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v20, (uint64_t)CFSTR("BDSErrorDomain"), 1000, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v18[2](v18, 0, v21);

    }
  }

}

- (void)readingGoalsChangeBooksFinishedGoalTo:(int64_t)a3 withCompletion:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, void *);
  void *v25;
  id v26;
  int64_t v27;

  v6 = a4;
  if (v6)
    v11 = v6;
  else
    v11 = &unk_24F089A58;
  if (objc_msgSend_connectionHealthy(self, v7, v8, v9, v10))
  {
    v22 = MEMORY[0x24BDAC760];
    v23 = 3221225472;
    v24 = sub_227D823F4;
    v25 = &unk_24F089A38;
    v27 = a3;
    v12 = v11;
    v26 = v12;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v13, (uint64_t)&v22, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_readingGoalsChangeBooksFinishedGoalTo_withCompletion_(v16, v17, a3, (uint64_t)v12, v18, v22, v23, v24, v25);

    v19 = v26;
  }
  else
  {
    BDSServiceLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_227E59734();

    v21 = _Block_copy(v11);
    v19 = v21;
    if (v21)
      (*((void (**)(void *, _QWORD))v21 + 2))(v21, 0);
  }

}

- (void)readingGoalsChangeDailyGoalTo:(double)a3 withCompletion:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, void *);
  void *v26;
  id v27;
  double v28;

  v6 = a4;
  if (v6)
    v11 = v6;
  else
    v11 = &unk_24F089A78;
  if (objc_msgSend_connectionHealthy(self, v7, v8, v9, v10))
  {
    v23 = MEMORY[0x24BDAC760];
    v24 = 3221225472;
    v25 = sub_227D8258C;
    v26 = &unk_24F089A38;
    v28 = a3;
    v12 = v11;
    v27 = v12;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v13, (uint64_t)&v23, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_readingGoalsChangeDailyGoalTo_withCompletion_(v16, v17, (uint64_t)v12, v18, v19, a3, v23, v24, v25, v26);

    v20 = v27;
  }
  else
  {
    BDSServiceLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      sub_227E597C0();

    v22 = _Block_copy(v11);
    v20 = v22;
    if (v22)
      (*((void (**)(void *, _QWORD))v22 + 2))(v22, 0);
  }

}

- (void)readingGoalsClearDataWithCompletion:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  void *v20;
  _QWORD v21[4];
  id v22;

  v4 = a3;
  if (v4)
    v9 = v4;
  else
    v9 = &unk_24F089A98;
  if (objc_msgSend_connectionHealthy(self, v5, v6, v7, v8))
  {
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = sub_227D82710;
    v21[3] = &unk_24F089380;
    v10 = v9;
    v22 = v10;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v11, (uint64_t)v21, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_readingGoalsClearDataWithCompletion_(v14, v15, (uint64_t)v10, v16, v17);

    v18 = v22;
  }
  else
  {
    BDSServiceLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      sub_227E5984C();

    v20 = _Block_copy(v9);
    v18 = v20;
    if (v20)
      (*((void (**)(void *, _QWORD))v20 + 2))(v20, 0);
  }

}

- (void)readingGoalsClearLocalCachedDataWithCompletion:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  void *v20;
  _QWORD v21[4];
  id v22;

  v4 = a3;
  if (v4)
    v9 = v4;
  else
    v9 = &unk_24F089AB8;
  if (objc_msgSend_connectionHealthy(self, v5, v6, v7, v8))
  {
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = sub_227D82890;
    v21[3] = &unk_24F089380;
    v10 = v9;
    v22 = v10;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v11, (uint64_t)v21, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_readingGoalsClearLocalCachedDataWithCompletion_(v14, v15, (uint64_t)v10, v16, v17);

    v18 = v22;
  }
  else
  {
    BDSServiceLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      sub_227E598D8();

    v20 = _Block_copy(v9);
    v18 = v20;
    if (v20)
      (*((void (**)(void *, _QWORD))v20 + 2))(v20, 0);
  }

}

- (void)readingGoalsStateInfoWithCompletion:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  void *v20;
  _QWORD v21[4];
  id v22;

  v4 = a3;
  if (v4)
    v9 = v4;
  else
    v9 = &unk_24F089AF8;
  if (objc_msgSend_connectionHealthy(self, v5, v6, v7, v8))
  {
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = sub_227D82A14;
    v21[3] = &unk_24F089380;
    v10 = v9;
    v22 = v10;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v11, (uint64_t)v21, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_readingGoalsStateInfoWithCompletion_(v14, v15, (uint64_t)v10, v16, v17);

    v18 = v22;
  }
  else
  {
    BDSServiceLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      sub_227E59964();

    v20 = _Block_copy(v9);
    v18 = v20;
    if (v20)
      (*((void (**)(void *, _QWORD, _QWORD))v20 + 2))(v20, 0, 0);
  }

}

- (void)readingHistoryClearDataWithCompletion:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  void *v20;
  _QWORD v21[4];
  id v22;

  v4 = a3;
  if (v4)
    v9 = v4;
  else
    v9 = &unk_24F089B18;
  if (objc_msgSend_connectionHealthy(self, v5, v6, v7, v8))
  {
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = sub_227D82B98;
    v21[3] = &unk_24F089380;
    v10 = v9;
    v22 = v10;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v11, (uint64_t)v21, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_readingHistoryClearDataWithCompletion_(v14, v15, (uint64_t)v10, v16, v17);

    v18 = v22;
  }
  else
  {
    BDSServiceLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      sub_227E599F0();

    v20 = _Block_copy(v9);
    v18 = v20;
    if (v20)
      (*((void (**)(void *, _QWORD))v20 + 2))(v20, 0);
  }

}

- (void)readingHistoryClearDefaultsCachedDataWithCompletion:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  void *v20;
  _QWORD v21[4];
  id v22;

  v4 = a3;
  if (v4)
    v9 = v4;
  else
    v9 = &unk_24F089B38;
  if (objc_msgSend_connectionHealthy(self, v5, v6, v7, v8))
  {
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = sub_227D82D18;
    v21[3] = &unk_24F089380;
    v10 = v9;
    v22 = v10;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v11, (uint64_t)v21, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_readingHistoryClearDefaultsCachedDataWithCompletion_(v14, v15, (uint64_t)v10, v16, v17);

    v18 = v22;
  }
  else
  {
    BDSServiceLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      sub_227E59A7C();

    v20 = _Block_copy(v9);
    v18 = v20;
    if (v20)
      (*((void (**)(void *, _QWORD))v20 + 2))(v20, 0);
  }

}

- (void)readingHistoryClearDate:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  void *v22;
  _QWORD v23[4];
  id v24;

  v6 = a3;
  v7 = a4;
  if (v7)
    v12 = v7;
  else
    v12 = &unk_24F089B58;
  if (objc_msgSend_connectionHealthy(self, v8, v9, v10, v11))
  {
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = sub_227D82EAC;
    v23[3] = &unk_24F089380;
    v13 = v12;
    v24 = v13;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v14, (uint64_t)v23, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_readingHistoryClearDate_withCompletion_(v17, v18, (uint64_t)v6, (uint64_t)v13, v19);

    v20 = v24;
  }
  else
  {
    BDSServiceLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      sub_227E59B08();

    v22 = _Block_copy(v12);
    v20 = v22;
    if (v22)
      (*((void (**)(void *, _QWORD))v22 + 2))(v22, 0);
  }

}

- (void)readingHistoryClearTodayWithCompletion:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  void *v20;
  _QWORD v21[4];
  id v22;

  v4 = a3;
  if (v4)
    v9 = v4;
  else
    v9 = &unk_24F089B78;
  if (objc_msgSend_connectionHealthy(self, v5, v6, v7, v8))
  {
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = sub_227D8302C;
    v21[3] = &unk_24F089380;
    v10 = v9;
    v22 = v10;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v11, (uint64_t)v21, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_readingHistoryClearTodayWithCompletion_(v14, v15, (uint64_t)v10, v16, v17);

    v18 = v22;
  }
  else
  {
    BDSServiceLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      sub_227E59B94();

    v20 = _Block_copy(v9);
    v18 = v20;
    if (v20)
      (*((void (**)(void *, _QWORD))v20 + 2))(v20, 0);
  }

}

- (void)readingHistoryHandleSyncFileChangeWithSyncVersionInfo:(id)a3 updateInfo:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  _QWORD aBlock[4];
  id v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
    v15 = v10;
  else
    v15 = &unk_24F089B98;
  if (objc_msgSend_connectionHealthy(self, v11, v12, v13, v14))
  {
    v16 = MEMORY[0x24BDAC760];
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = sub_227D83230;
    aBlock[3] = &unk_24F089380;
    v17 = v15;
    v27 = v17;
    v18 = _Block_copy(aBlock);
    v22[0] = v16;
    v22[1] = 3221225472;
    v22[2] = sub_227D832B0;
    v22[3] = &unk_24F089BC0;
    v23 = v8;
    v24 = v9;
    v25 = v17;
    bds_dispatch_service(self, v22, v18);

    v19 = v27;
  }
  else
  {
    BDSServiceLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_227E59C20();

    v21 = _Block_copy(v15);
    v19 = v21;
    if (v21)
      (*((void (**)(void *, _QWORD))v21 + 2))(v21, 0);
  }

}

- (void)readingHistoryIncrementWithDate:(id)a3 by:(int64_t)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  int64_t v28;

  v8 = a3;
  v9 = a5;
  if (v9)
    v14 = v9;
  else
    v14 = &unk_24F089BE0;
  if (objc_msgSend_connectionHealthy(self, v10, v11, v12, v13))
  {
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = sub_227D833FC;
    v25[3] = &unk_24F089C08;
    v15 = v8;
    v26 = v15;
    v28 = a4;
    v16 = v14;
    v27 = v16;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v17, (uint64_t)v25, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_readingHistoryIncrementWithDate_by_withCompletion_(v20, v21, (uint64_t)v15, a4, (uint64_t)v16);

    v22 = v26;
  }
  else
  {
    BDSServiceLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      sub_227E59CAC();

    v24 = _Block_copy(v14);
    v22 = v24;
    if (v24)
      (*((void (**)(void *, _QWORD))v24 + 2))(v24, 0);
  }

}

- (void)readingHistoryReadingHistoryStateInfoWithRangeStart:(id)a3 rangeEnd:(id)a4 currentTime:(id)a5 withCompletion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  _QWORD v28[4];
  id v29;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v13)
    v18 = v13;
  else
    v18 = &unk_24F089C48;
  if (objc_msgSend_connectionHealthy(self, v14, v15, v16, v17))
  {
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = sub_227D835C8;
    v28[3] = &unk_24F089380;
    v19 = v18;
    v29 = v19;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v20, (uint64_t)v28, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_readingHistoryReadingHistoryStateInfoWithRangeStart_rangeEnd_currentTime_withCompletion_(v23, v24, (uint64_t)v10, (uint64_t)v11, (uint64_t)v12, v19);

    v25 = v29;
  }
  else
  {
    BDSServiceLog();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      sub_227E59D68();

    v27 = _Block_copy(v18);
    v25 = v27;
    if (v27)
      (*((void (**)(void *, _QWORD, _QWORD))v27 + 2))(v27, 0, 0);
  }

}

- (void)readingHistoryServiceStatusInfoWithCompletion:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void (**v10)(void *, _QWORD, void *);
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void (**v18)(void *, _QWORD, void *);
  NSObject *v19;
  const char *v20;
  void *v21;
  _QWORD v22[4];
  void (**v23)(void *, _QWORD, void *);

  v4 = a3;
  if (v4)
    v9 = v4;
  else
    v9 = &unk_24F089C88;
  if (objc_msgSend_connectionHealthy(self, v5, v6, v7, v8))
  {
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = sub_227D8377C;
    v22[3] = &unk_24F089380;
    v10 = v9;
    v23 = v10;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v11, (uint64_t)v22, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_readingHistoryServiceStatusInfoWithCompletion_(v14, v15, (uint64_t)v10, v16, v17);

    v18 = v23;
  }
  else
  {
    BDSServiceLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      sub_227E59DF4();

    v18 = (void (**)(void *, _QWORD, void *))_Block_copy(v9);
    if (v18)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v20, (uint64_t)CFSTR("BDSErrorDomain"), 1000, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v18[2](v18, 0, v21);

    }
  }

}

- (void)priceTrackingSetConfiguration:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  NSObject *v21;
  const char *v22;
  void (**v23)(void *, void *);
  void *v24;
  _QWORD v25[5];
  id v26;
  SEL v27;

  v7 = a3;
  v8 = a4;
  if (v8)
    v13 = v8;
  else
    v13 = &unk_24F089CA8;
  if (objc_msgSend_connectionHealthy(self, v9, v10, v11, v12))
  {
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = sub_227D83960;
    v25[3] = &unk_24F089C08;
    v25[4] = self;
    v27 = a2;
    v14 = v13;
    v26 = v14;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v15, (uint64_t)v25, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_priceTrackingSetConfiguration_completion_(v18, v19, (uint64_t)v7, (uint64_t)v14, v20);

  }
  else
  {
    BDSServiceLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      sub_227E59E80();

    v23 = (void (**)(void *, void *))_Block_copy(v13);
    if (v23)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v22, (uint64_t)CFSTR("BDSErrorDomain"), 1000, 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v23[2](v23, v24);

    }
  }

}

- (void)priceTrackingCtlRefreshTrackedPricesIgnoringSchedule:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  NSObject *v20;
  const char *v21;
  void (**v22)(void *, void *);
  void *v23;
  _QWORD v24[5];
  id v25;
  SEL v26;

  v4 = a3;
  v7 = a4;
  if (v7)
    v12 = v7;
  else
    v12 = &unk_24F089CC8;
  if (objc_msgSend_connectionHealthy(self, v8, v9, v10, v11))
  {
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = sub_227D83B30;
    v24[3] = &unk_24F089C08;
    v24[4] = self;
    v26 = a2;
    v13 = v12;
    v25 = v13;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v14, (uint64_t)v24, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_priceTrackingCtlRefreshTrackedPricesIgnoringSchedule_completion_(v17, v18, v4, (uint64_t)v13, v19);

  }
  else
  {
    BDSServiceLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_227E59E80();

    v22 = (void (**)(void *, void *))_Block_copy(v12);
    if (v22)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v21, (uint64_t)CFSTR("BDSErrorDomain"), 1000, 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v22[2](v22, v23);

    }
  }

}

- (void)priceTrackingCtlGetStateWithCompletion:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  const char *v20;
  void (**v21)(void *, _QWORD, void *);
  void *v22;
  _QWORD v23[5];
  id v24;
  SEL v25;

  v5 = a3;
  if (v5)
    v10 = v5;
  else
    v10 = &unk_24F089D08;
  if (objc_msgSend_connectionHealthy(self, v6, v7, v8, v9))
  {
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = sub_227D83CFC;
    v23[3] = &unk_24F089C08;
    v23[4] = self;
    v25 = a2;
    v11 = v10;
    v24 = v11;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v12, (uint64_t)v23, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_priceTrackingCtlGetStateWithCompletion_(v15, v16, (uint64_t)v11, v17, v18);

  }
  else
  {
    BDSServiceLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      sub_227E59E80();

    v21 = (void (**)(void *, _QWORD, void *))_Block_copy(v10);
    if (v21)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v20, (uint64_t)CFSTR("BDSErrorDomain"), 1000, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v21[2](v21, 0, v22);

    }
  }

}

- (void)priceTrackingCtlAddTrackedItems:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  NSObject *v21;
  const char *v22;
  void (**v23)(void *, void *);
  void *v24;
  _QWORD v25[5];
  id v26;
  SEL v27;

  v7 = a3;
  v8 = a4;
  if (v8)
    v13 = v8;
  else
    v13 = &unk_24F089D28;
  if (objc_msgSend_connectionHealthy(self, v9, v10, v11, v12))
  {
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = sub_227D83EE4;
    v25[3] = &unk_24F089C08;
    v25[4] = self;
    v27 = a2;
    v14 = v13;
    v26 = v14;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v15, (uint64_t)v25, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_priceTrackingCtlAddTrackedItems_completion_(v18, v19, (uint64_t)v7, (uint64_t)v14, v20);

  }
  else
  {
    BDSServiceLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      sub_227E59E80();

    v23 = (void (**)(void *, void *))_Block_copy(v13);
    if (v23)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v22, (uint64_t)CFSTR("BDSErrorDomain"), 1000, 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v23[2](v23, v24);

    }
  }

}

- (void)priceTrackingCtlOverrideReferencePrices:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  NSObject *v21;
  const char *v22;
  void (**v23)(void *, void *);
  void *v24;
  _QWORD v25[5];
  id v26;
  SEL v27;

  v7 = a3;
  v8 = a4;
  if (v8)
    v13 = v8;
  else
    v13 = &unk_24F089D48;
  if (objc_msgSend_connectionHealthy(self, v9, v10, v11, v12))
  {
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = sub_227D840C8;
    v25[3] = &unk_24F089C08;
    v25[4] = self;
    v27 = a2;
    v14 = v13;
    v26 = v14;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v15, (uint64_t)v25, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_priceTrackingCtlOverrideReferencePrices_completion_(v18, v19, (uint64_t)v7, (uint64_t)v14, v20);

  }
  else
  {
    BDSServiceLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      sub_227E59E80();

    v23 = (void (**)(void *, void *))_Block_copy(v13);
    if (v23)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v22, (uint64_t)CFSTR("BDSErrorDomain"), 1000, 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v23[2](v23, v24);

    }
  }

}

- (void)readingHistoryBackupWithName:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void (**v13)(void *, _QWORD, void *);
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void (**v21)(void *, _QWORD, void *);
  NSObject *v22;
  const char *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t, void *);
  void *v28;
  void (**v29)(void *, _QWORD, void *);
  id v30;

  v6 = a3;
  v7 = a4;
  if (v7)
    v12 = v7;
  else
    v12 = &unk_24F089D68;
  if (objc_msgSend_connectionHealthy(self, v8, v9, v10, v11))
  {
    v25 = MEMORY[0x24BDAC760];
    v26 = 3221225472;
    v27 = sub_227D842AC;
    v28 = &unk_24F0898A8;
    v13 = (void (**)(void *, _QWORD, void *))v6;
    v29 = v13;
    v14 = v12;
    v30 = v14;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v15, (uint64_t)&v25, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_readingHistoryBackupWithName_completion_(v18, v19, (uint64_t)v13, (uint64_t)v14, v20, v25, v26, v27, v28);

    v21 = v29;
  }
  else
  {
    BDSServiceLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      sub_227E59FA0();

    v21 = (void (**)(void *, _QWORD, void *))_Block_copy(v12);
    if (v21)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v23, (uint64_t)CFSTR("BDSErrorDomain"), 1000, 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v21[2](v21, 0, v24);

    }
  }

}

- (void)readingHistoryListBackupWithCompletion:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  const char *v20;
  void *v21;
  _QWORD v22[4];
  id v23;

  v4 = a3;
  if (v4)
    v9 = v4;
  else
    v9 = &unk_24F089DA8;
  if (objc_msgSend_connectionHealthy(self, v5, v6, v7, v8))
  {
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = sub_227D84468;
    v22[3] = &unk_24F089380;
    v10 = v9;
    v23 = v10;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v11, (uint64_t)v22, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_readingHistoryListBackupWithCompletion_(v14, v15, (uint64_t)v10, v16, v17);

    v18 = v23;
  }
  else
  {
    BDSServiceLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      sub_227E5A02C();

    v18 = _Block_copy(v9);
    if (v18)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v20, (uint64_t)CFSTR("BDSErrorDomain"), 1000, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(void *, _QWORD, _QWORD, void *))v18 + 2))(v18, 0, 0, v21);

    }
  }

}

- (void)readingHistoryRestoreWithName:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void (**v13)(void *, _QWORD, void *);
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void (**v21)(void *, _QWORD, void *);
  NSObject *v22;
  const char *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t, void *);
  void *v28;
  void (**v29)(void *, _QWORD, void *);
  id v30;

  v6 = a3;
  v7 = a4;
  if (v7)
    v12 = v7;
  else
    v12 = &unk_24F089DC8;
  if (objc_msgSend_connectionHealthy(self, v8, v9, v10, v11))
  {
    v25 = MEMORY[0x24BDAC760];
    v26 = 3221225472;
    v27 = sub_227D84650;
    v28 = &unk_24F0898A8;
    v13 = (void (**)(void *, _QWORD, void *))v6;
    v29 = v13;
    v14 = v12;
    v30 = v14;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v15, (uint64_t)&v25, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_readingHistoryRestoreWithName_completion_(v18, v19, (uint64_t)v13, (uint64_t)v14, v20, v25, v26, v27, v28);

    v21 = v29;
  }
  else
  {
    BDSServiceLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      sub_227E5A0B8();

    v21 = (void (**)(void *, _QWORD, void *))_Block_copy(v12);
    if (v21)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v23, (uint64_t)CFSTR("BDSErrorDomain"), 1000, 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v21[2](v21, 0, v24);

    }
  }

}

- (void)bookWidgetReadingHistoryStateInfoWithCompletion:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  void *v20;
  _QWORD v21[4];
  id v22;

  v4 = a3;
  if (v4)
    v9 = v4;
  else
    v9 = &unk_24F089DE8;
  if (objc_msgSend_connectionHealthy(self, v5, v6, v7, v8))
  {
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = sub_227D847DC;
    v21[3] = &unk_24F089380;
    v10 = v9;
    v22 = v10;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v11, (uint64_t)v21, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_bookWidgetReadingHistoryStateInfoWithCompletion_(v14, v15, (uint64_t)v10, v16, v17);

    v18 = v22;
  }
  else
  {
    BDSServiceLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      sub_227E5A144();

    v20 = _Block_copy(v9);
    v18 = v20;
    if (v20)
      (*((void (**)(void *, _QWORD, _QWORD))v20 + 2))(v20, 0, 0);
  }

}

- (void)mergeMovedReadingHistoryDataWithCompletionHandler:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (**v9)(void *, _QWORD, void *);
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void (**v17)(void *, _QWORD, void *);
  NSObject *v18;
  const char *v19;
  void *v20;
  _QWORD v21[4];
  void (**v22)(void *, _QWORD, void *);

  v4 = a3;
  if (objc_msgSend_connectionHealthy(self, v5, v6, v7, v8))
  {
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = sub_227D84980;
    v21[3] = &unk_24F089380;
    v9 = (void (**)(void *, _QWORD, void *))v4;
    v22 = v9;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v10, (uint64_t)v21, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_mergeMovedReadingHistoryDataWithCompletionHandler_(v13, v14, (uint64_t)v9, v15, v16);

    v17 = v22;
  }
  else
  {
    BDSServiceLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_227E5A1D0();

    v17 = (void (**)(void *, _QWORD, void *))_Block_copy(v4);
    if (v17)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v19, (uint64_t)CFSTR("BDSErrorDomain"), 1000, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v17[2](v17, 0, v20);

    }
  }

}

- (void)hasSaltChangedWithCompletion:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (**v9)(void *, _QWORD, void *);
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void (**v17)(void *, _QWORD, void *);
  NSObject *v18;
  const char *v19;
  void *v20;
  _QWORD v21[4];
  void (**v22)(void *, _QWORD, void *);

  v4 = a3;
  if (objc_msgSend_connectionHealthy(self, v5, v6, v7, v8))
  {
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = sub_227D84B24;
    v21[3] = &unk_24F089380;
    v9 = (void (**)(void *, _QWORD, void *))v4;
    v22 = v9;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v10, (uint64_t)v21, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_hasSaltChangedWithCompletion_(v13, v14, (uint64_t)v9, v15, v16);

    v17 = v22;
  }
  else
  {
    BDSServiceLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_227E5A25C();

    v17 = (void (**)(void *, _QWORD, void *))_Block_copy(v4);
    if (v17)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v19, (uint64_t)CFSTR("BDSErrorDomain"), 1000, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v17[2](v17, 0, v20);

    }
  }

}

- (BDSServiceProtocol)remoteObjectProxy
{
  return self->_remoteObjectProxy;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (BDSClientSideListener)clientSideListener
{
  return self->_clientSideListener;
}

- (void)setClientSideListener:(id)a3
{
  objc_storeStrong((id *)&self->_clientSideListener, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientSideListener, 0);
  objc_destroyWeak((id *)&self->_connectionDelegate);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_remoteObjectProxy, 0);
  objc_storeStrong((id *)&self->_notifyQueue, 0);
}

@end
