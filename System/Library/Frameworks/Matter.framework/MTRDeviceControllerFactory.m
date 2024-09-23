@implementation MTRDeviceControllerFactory

+ (void)initialize
{
  if (qword_2561589B0 != -1)
    dispatch_once(&qword_2561589B0, &unk_2504EE680);
}

+ (MTRDeviceControllerFactory)sharedInstance
{
  if (qword_2561591B0 != -1)
    dispatch_once(&qword_2561591B0, &unk_2504EE830);
  return (MTRDeviceControllerFactory *)(id)qword_2561591A8;
}

- (MTRDeviceControllerFactory)init
{
  MTRDeviceControllerFactory *v2;
  NSMutableArray *v3;
  NSMutableArray *controllers;
  NSMutableArray *v5;
  NSMutableArray *serverEndpoints;
  MTRDeviceControllerFactory *v7;
  NSObject *v9;
  char *v10;
  __int128 v11;
  uint64_t v12;
  objc_super v13;
  __int128 v14;
  uint64_t v15;
  uint8_t buf[4];
  char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v13.receiver = self;
  v13.super_class = (Class)MTRDeviceControllerFactory;
  v2 = -[MTRDeviceControllerFactory init](&v13, sel_init);
  if (v2)
  {
    if (qword_254253100 != -1)
      dispatch_once_f(&qword_254253100, &byte_2542530C0, (dispatch_function_t)sub_233C0BA78);
    sub_2341BE614((uint64_t)&byte_2542530C0, (uint64_t)&v14);
    if (qword_254253100 != -1)
      dispatch_once_f(&qword_254253100, &byte_2542530C0, (dispatch_function_t)sub_233C0BA78);
    objc_storeStrong((id *)&v2->_chipWorkQueue, (id)qword_2542530E8);
    v2->_controllerFactory = (DeviceControllerFactory *)sub_233C06318();
    sub_2341E9E90((uint64_t)&v2->_groupDataProvider, (uint64_t)&v2->_groupStorageDelegate);
    v2->_groupDataProvider.mSessionKeystore = (SessionKeystore *)&v2->_sessionKeystore;
    v12 = 0;
    v11 = 0uLL;
    (*((void (**)(__int128 *__return_ptr, GroupDataProviderImpl *))v2->_groupDataProvider._vptr$GroupDataProvider
     + 2))(&v11, &v2->_groupDataProvider);
    if ((_DWORD)v11)
    {
      sub_234117B80(0, "NotSpecified");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v14 = v11;
        v15 = v12;
        v10 = sub_2341083CC((const char **)&v14, 1);
        *(_DWORD *)buf = 136315138;
        v17 = v10;
        _os_log_impl(&dword_233BF3000, v9, OS_LOG_TYPE_ERROR, "GroupDataProviderImpl::Init() failed: %s", buf, 0xCu);
      }

      if (sub_234114844(1u))
      {
        v14 = v11;
        v15 = v12;
        sub_2341083CC((const char **)&v14, 1);
        sub_2341147D0(0, 1);
      }
      abort();
    }
    v2->_controllersLock._os_unfair_lock_opaque = 0;
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    controllers = v2->_controllers;
    v2->_controllers = v3;

    v2->_serverEndpointsLock._os_unfair_lock_opaque = 0;
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    serverEndpoints = v2->_serverEndpoints;
    v2->_serverEndpoints = v5;

    v7 = v2;
  }

  return v2;
}

- (void)dealloc
{
  uint64_t v2;
  objc_super v4;

  objc_msgSend_stopControllerFactory(self, a2, v2);
  (*((void (**)(GroupDataProviderImpl *))self->_groupDataProvider._vptr$GroupDataProvider + 3))(&self->_groupDataProvider);
  v4.receiver = self;
  v4.super_class = (Class)MTRDeviceControllerFactory;
  -[MTRDeviceControllerFactory dealloc](&v4, sel_dealloc);
}

- (NSArray)knownFabrics
{
  NSObject *chipWorkQueue;
  id v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  sub_233C06408((_BOOL8)self);
  if (!self->_running)
    return (NSArray *)0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = sub_233C0673C;
  v15 = sub_233C0674C;
  v16 = 0;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  chipWorkQueue = self->_chipWorkQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_233C06754;
  block[3] = &unk_2504EE858;
  block[4] = self;
  block[5] = &v11;
  block[6] = &v7;
  dispatch_sync(chipWorkQueue, block);
  if (*((_BYTE *)v8 + 24))
    v4 = (id)v12[5];
  else
    v4 = 0;
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(&v11, 8);

  return (NSArray *)v4;
}

- (BOOL)startControllerFactory:(MTRDeviceControllerFactoryParams *)startupParams error:(NSError *)error
{
  return sub_233C06A30((uint64_t)self, startupParams, 0, error);
}

- (void)stopControllerFactory
{
  const char *v3;
  uint64_t v4;
  const char *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  NSObject *chipWorkQueue;
  _QWORD block[5];

  sub_233C06408((_BOOL8)self);
  while (objc_msgSend_count(self->_controllers, v3, v4))
  {
    objc_msgSend_objectAtIndexedSubscript_(self->_controllers, v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_shutdown(v6, v7, v8);

  }
  chipWorkQueue = self->_chipWorkQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_233C073F8;
  block[3] = &unk_2504EE8C0;
  block[4] = self;
  dispatch_sync(chipWorkQueue, block);
}

- (MTRDeviceController)createControllerOnExistingFabric:(MTRDeviceControllerStartupParams *)startupParams error:(NSError *)error
{
  MTRDeviceControllerStartupParams *v6;
  NSObject *v7;
  void *v8;
  MTRDeviceController *v9;
  _QWORD v11[5];
  MTRDeviceControllerStartupParams *v12;
  __int128 v13;
  int v14;
  uint8_t buf[16];

  v6 = startupParams;
  sub_233C06408((_BOOL8)self);
  if (self->_usingPerControllerStorage)
  {
    sub_234117B80(0, "NotSpecified");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_233BF3000, v7, OS_LOG_TYPE_ERROR, "Can't createControllerOnExistingFabric when using per-controller data store", buf, 2u);
    }

    if (sub_234114844(1u))
      sub_2341147D0(0, 1);
    if (error)
    {
      LODWORD(v13) = 3;
      *((_QWORD *)&v13 + 1) = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/C"
                              "HIP/MTRDeviceControllerFactory.mm";
      v14 = 658;
      sub_2340017F0((uint64_t)MTRError, &v13);
      v8 = 0;
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    v9 = [MTRDeviceController alloc];
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = sub_233C08EDC;
    v11[3] = &unk_2504EE928;
    v11[4] = self;
    v12 = v6;
    sub_233C074BC(self, v9, v12, v11, error);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (MTRDeviceController *)v8;
}

- (MTRDeviceController)createControllerOnNewFabric:(MTRDeviceControllerStartupParams *)startupParams error:(NSError *)error
{
  MTRDeviceControllerStartupParams *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  MTRDeviceController *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  _QWORD v22[5];
  MTRDeviceControllerStartupParams *v23;
  __int128 v24;
  int v25;
  __int128 v26;
  int v27;
  uint8_t buf[16];

  v6 = startupParams;
  sub_233C06408((_BOOL8)self);
  objc_msgSend_vendorID(v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    sub_234117B80(0, "NotSpecified");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_233BF3000, v18, OS_LOG_TYPE_ERROR, "Must provide vendor id when starting controller on new fabric", buf, 2u);
    }

    if (sub_234114844(1u))
      sub_2341147D0(0, 1);
    if (error)
    {
      LODWORD(v26) = 47;
      *((_QWORD *)&v26 + 1) = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/C"
                              "HIP/MTRDeviceControllerFactory.mm";
      v27 = 722;
      sub_2340017F0((uint64_t)MTRError, &v26);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:
      v17 = 0;
      *error = (NSError *)v19;
      goto LABEL_19;
    }
LABEL_18:
    v17 = 0;
    goto LABEL_19;
  }
  objc_msgSend_intermediateCertificate(v6, v10, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend_rootCertificate(v6, v12, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      sub_234117B80(0, "NotSpecified");
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_233BF3000, v20, OS_LOG_TYPE_ERROR, "Must provide a root certificate when using an intermediate certificate", buf, 2u);
      }

      if (sub_234114844(1u))
        sub_2341147D0(0, 1);
      if (error)
      {
        LODWORD(v24) = 47;
        *((_QWORD *)&v24 + 1) = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework"
                                "/CHIP/MTRDeviceControllerFactory.mm";
        v25 = 730;
        sub_2340017F0((uint64_t)MTRError, &v24);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_17;
      }
      goto LABEL_18;
    }
  }
  v16 = [MTRDeviceController alloc];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = sub_233C09924;
  v22[3] = &unk_2504EE928;
  v22[4] = self;
  v23 = v6;
  sub_233C074BC(self, v16, v23, v22, error);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_19:
  return (MTRDeviceController *)v17;
}

- (void)preWarmCommissioningSession
{
  NSObject *chipWorkQueue;
  _QWORD block[5];

  chipWorkQueue = self->_chipWorkQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_233C09B28;
  block[3] = &unk_2504EE8C0;
  block[4] = self;
  dispatch_async(chipWorkQueue, block);
}

- (id)accessGrantsForFabricIndex:(unsigned __int8)a3 clusterPath:(id)a4
{
  int v4;
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  int isEqual;
  const char *v15;
  uint64_t v16;
  MTRServerEndpoint *otaProviderEndpoint;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  void *v23;

  v4 = a3;
  v6 = a4;
  sub_2341B1F64("/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/MTRDeviceControllerFactory.mm", 1046);
  objc_msgSend_endpoint(v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self->_otaProviderEndpoint, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  isEqual = objc_msgSend_isEqual_(v9, v13, (uint64_t)v12);

  if (isEqual)
  {
    otaProviderEndpoint = self->_otaProviderEndpoint;
    objc_msgSend_cluster(v6, v15, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_matterAccessGrantsForCluster_(otaProviderEndpoint, v19, (uint64_t)v18);
    v20 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    sub_233C0A580((unsigned __int8 *)self, v4, 0, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v21;
    if (!v21)
    {
      v23 = (void *)MEMORY[0x24BDBD1A8];
      goto LABEL_6;
    }
    objc_msgSend_accessGrantsForClusterPath_(v21, v22, (uint64_t)v6);
    v20 = objc_claimAutoreleasedReturnValue();
  }
  v23 = (void *)v20;
LABEL_6:

  return v23;
}

- (id)neededReadPrivilegeForClusterID:(id)a3 attributeID:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  const char *v17;
  char isEqual;
  void *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  const char *v28;
  char v29;
  const char *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t Privilege;
  const char *v38;
  os_unfair_lock_s *v40;
  uint64_t v41;
  uint64_t v42;
  id obj;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  sub_2341B1F64("/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/MTRDeviceControllerFactory.mm", 1068);
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v40 = (os_unfair_lock_s *)self;
  objc_msgSend_serverClusters(self->_otaProviderEndpoint, v8, v9);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v10, (uint64_t)&v52, v58, 16);
  if (v11)
  {
    v42 = *(_QWORD *)v53;
    do
    {
      v41 = v11;
      for (i = 0; i != v41; ++i)
      {
        if (*(_QWORD *)v53 != v42)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
        objc_msgSend_clusterID(v15, v12, v13);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        isEqual = objc_msgSend_isEqual_(v16, v17, (uint64_t)v6);

        if ((isEqual & 1) != 0)
        {
          v50 = 0u;
          v51 = 0u;
          v48 = 0u;
          v49 = 0u;
          objc_msgSend_attributes(v15, v12, v13);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v20, (uint64_t)&v48, v57, 16);
          if (v23)
          {
            v24 = *(_QWORD *)v49;
            while (2)
            {
              for (j = 0; j != v23; ++j)
              {
                if (*(_QWORD *)v49 != v24)
                  objc_enumerationMutation(v19);
                v26 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * j);
                objc_msgSend_attributeID(v26, v21, v22);
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                v29 = objc_msgSend_isEqual_(v27, v28, (uint64_t)v7);

                if ((v29 & 1) != 0)
                {
                  v36 = (void *)MEMORY[0x24BDD16E0];
                  Privilege = objc_msgSend_requiredReadPrivilege(v26, v21, v22);
                  objc_msgSend_numberWithUnsignedChar_(v36, v38, Privilege);
                  v35 = (void *)objc_claimAutoreleasedReturnValue();

                  goto LABEL_28;
                }
              }
              v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v21, (uint64_t)&v48, v57, 16);
              if (v23)
                continue;
              break;
            }
          }

        }
      }
      v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v12, (uint64_t)&v52, v58, 16);
    }
    while (v11);
  }

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  sub_233C087E8(v40);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v30, (uint64_t)&v44, v56, 16);
  if (v32)
  {
    v33 = *(_QWORD *)v45;
LABEL_20:
    v34 = 0;
    while (1)
    {
      if (*(_QWORD *)v45 != v33)
        objc_enumerationMutation(obj);
      objc_msgSend_neededReadPrivilegeForClusterID_attributeID_(*(void **)(*((_QWORD *)&v44 + 1) + 8 * v34), v31, (uint64_t)v6, v7);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if (v35)
        break;
      if (v32 == ++v34)
      {
        v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v31, (uint64_t)&v44, v56, 16);
        if (v32)
          goto LABEL_20;
        goto LABEL_26;
      }
    }
  }
  else
  {
LABEL_26:
    v35 = 0;
  }
LABEL_28:

  return v35;
}

- (BOOL)isRunning
{
  return self->_running;
}

- (void).cxx_destruct
{
  MTROTAProviderDelegateBridge *value;

  objc_storeStrong((id *)&self->_serverEndpoints, 0);
  objc_storeStrong((id *)&self->_diagnosticLogsDownloader, 0);
  value = self->_otaProviderDelegateBridge.__ptr_.__value_;
  self->_otaProviderDelegateBridge.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(MTROTAProviderDelegateBridge *))(*(_QWORD *)value + 32))(value);
  objc_storeStrong((id *)&self->_otaProviderEndpoint, 0);
  objc_storeStrong((id *)&self->_otaProviderDelegateQueue, 0);
  objc_storeStrong((id *)&self->_otaProviderDelegate, 0);
  objc_storeStrong((id *)&self->_controllerBeingShutDown, 0);
  objc_storeStrong((id *)&self->_controllerBeingStarted, 0);
  objc_storeStrong((id *)&self->_controllers, 0);
  objc_storeStrong((id *)&self->_certificationDeclarationCertificates, 0);
  objc_storeStrong((id *)&self->_productAttestationAuthorityCertificates, 0);
  sub_233C0BEE4(&self->_groupDataProvider._vptr$GroupDataProvider);
  self->_groupStorageDelegate._vptr$PersistentStorageDelegate = (void **)&off_2504EE9C8;
  sub_233C0D7AC((uint64_t)&self->_groupStorageDelegate.mPoisonKeys, (char *)self->_groupStorageDelegate.mPoisonKeys.__tree_.__pair1_.__value_.__left_);
  sub_233C0D7FC((uint64_t)&self->_groupStorageDelegate.mStorage, (_QWORD *)self->_groupStorageDelegate.mStorage.__tree_.__pair1_.__value_.__left_);
  objc_storeStrong((id *)&self->_chipWorkQueue, 0);
}

- (id).cxx_construct
{
  self->_groupStorageDelegate.mStorage.__tree_.__pair1_.__value_.__left_ = 0;
  self->_certificateValidityPolicy._vptr$CertificateValidityPolicy = (void **)&off_2504EEA80;
  self->_sessionKeystore._vptr$SessionKeystore = (void **)&unk_250505060;
  self->_groupStorageDelegate._vptr$PersistentStorageDelegate = (void **)&off_2504EE9C8;
  self->_groupStorageDelegate.mStorage.__tree_.__begin_node_ = &self->_groupStorageDelegate.mStorage.__tree_.__pair1_;
  self->_groupStorageDelegate.mPoisonKeys.__tree_.__pair1_.__value_.__left_ = 0;
  self->_groupStorageDelegate.mPoisonKeys.__tree_.__pair3_.__value_ = 0;
  self->_groupStorageDelegate.mStorage.__tree_.__pair3_.__value_ = 0;
  self->_groupStorageDelegate.mPoisonKeys.__tree_.__begin_node_ = &self->_groupStorageDelegate.mPoisonKeys.__tree_.__pair1_;
  self->_groupStorageDelegate.mRejectWrites = 0;
  self->_groupStorageDelegate.mLoggingLevel = 0;
  sub_233C0FCA8((uint64_t)&self->_groupDataProvider);
  self->_otaProviderDelegateBridge.__ptr_.__value_ = 0;
  self->_preWarmingDelegate._vptr$BleScannerDelegate = (void **)&off_2504EEAD0;
  return self;
}

@end
