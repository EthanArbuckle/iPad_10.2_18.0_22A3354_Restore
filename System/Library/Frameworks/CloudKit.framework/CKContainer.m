@implementation CKContainer

+ (CKContainer)containerWithIdentifier:(NSString *)containerIdentifier
{
  NSString *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  CKContainer *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;

  v4 = containerIdentifier;
  objc_msgSend_containersByIdentifier(a1, v5, v6, v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v8);
  objc_msgSend_objectForKeyedSubscript_(v8, v9, (uint64_t)v4, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    v12 = [CKContainer alloc];
    v11 = (void *)objc_msgSend__initWithContainerIdentifier_(v12, v13, (uint64_t)v4, v14);
    objc_msgSend_setObject_forKeyedSubscript_(v8, v15, (uint64_t)v11, (uint64_t)v4);
  }
  objc_sync_exit(v8);

  return (CKContainer *)v11;
}

+ (id)containersByIdentifier
{
  if (qword_1ECD96AD0 != -1)
    dispatch_once(&qword_1ECD96AD0, &unk_1E1F61348);
  return (id)qword_1ECD96AC8;
}

- (void)setSourceApplicationBundleIdentifier:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  id v10;

  v4 = a3;
  objc_msgSend_implementation(self, v5, v6, v7);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSourceApplicationBundleIdentifier_(v10, v8, (uint64_t)v4, v9);

}

+ (BOOL)currentProcessCanUseCloudKit
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  void *v19;
  const char *v20;
  uint64_t v21;

  objc_msgSend_sharedManager(CKProcessScopedStateManager, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_untrustedEntitlements(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_cloudServices(v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_containsObject_(v12, v13, (uint64_t)CFSTR("CloudKit"), v14) & 1) != 0)
  {
    v18 = 1;
  }
  else
  {
    objc_msgSend_cloudServices(v8, v15, v16, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend_containsObject_(v19, v20, (uint64_t)CFSTR("CloudKit-Anonymous"), v21);

  }
  return v18;
}

+ (int64_t)containerEnvironmentForContainerID:(id)a3 entitlements:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  int v29;
  void *v30;
  NSObject *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  NSObject *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  int v49;
  id v50;
  __int16 v51;
  id v52;
  __int16 v53;
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend_hasEnvironmentEntitlement(v7, v8, v9, v10))
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v14 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_INFO))
    {
      v49 = 138412290;
      v50 = a1;
      _os_log_impl(&dword_18A5C5000, v14, OS_LOG_TYPE_INFO, "Allowing %@ to set any environment", (uint8_t *)&v49, 0xCu);
    }
    v21 = objc_msgSend_environment(v6, v15, v16, v17);
  }
  else
  {
    v21 = objc_msgSend_containerEnvironment(v7, v11, v12, v13);
    if (v21 == 1)
    {
      objc_msgSend_developmentContainerEnvironmentOverrides(v7, v18, v19, v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_containerIdentifier(v6, v23, v24, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend_containsObject_(v22, v27, (uint64_t)v26, v28);

      if (v29)
      {
        if (ck_log_initialization_predicate != -1)
          dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
        v30 = (void *)ck_log_facility_ck;
        if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_INFO))
        {
          v31 = v30;
          objc_msgSend_applicationBundleID(v7, v32, v33, v34);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = 138543618;
          v50 = v35;
          v51 = 2114;
          v52 = v6;
          _os_log_impl(&dword_18A5C5000, v31, OS_LOG_TYPE_INFO, "Client \"%{public}@\" requested sandbox environment for container id %{public}@", (uint8_t *)&v49, 0x16u);

        }
        v21 = 2;
      }
      else
      {
        v21 = 1;
      }
    }
  }
  if (v21 != objc_msgSend_environment(v6, v18, v19, v20))
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v36 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
    {
      v38 = v36;
      objc_msgSend_applicationBundleID(v7, v39, v40, v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = objc_msgSend_environment(v6, v43, v44, v45);
      CKContainerEnvironmentString(v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      CKContainerEnvironmentString(v21);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = 138543874;
      v50 = v42;
      v51 = 2114;
      v52 = v47;
      v53 = 2114;
      v54 = v48;
      _os_log_error_impl(&dword_18A5C5000, v38, OS_LOG_TYPE_ERROR, "Client \"%{public}@\" tried to access environment \"%{public}@\", even though the entitlements specified \"%{public}@\", (uint8_t *)&v49, 0x20u);

    }
  }

  return v21;
}

- (id)_initUnconfiguredContainerWithImplementation:(id)a3
{
  id v4;
  const char *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  NSObject *v50;
  int v51;
  void *v52;
  void *v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  NSObject *v62;
  id v63;
  int v64;
  uint64_t IsManatee;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  _QWORD v73[4];
  id v74;
  id v75;
  _QWORD handler[4];
  id v77;
  id v78;
  id location;
  int out_token[3];

  v4 = a3;
  v9 = objc_msgSend_initWithImplementation_convenienceConfiguration_(self, v5, (uint64_t)v4, 0);
  if (v9)
  {
    objc_msgSend_sharedManager(CKProcessScopedStateManager, v6, v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18A5FA318(v10, (void *)v9);

    out_token[0] = -1;
    *(_QWORD *)(v9 + 8) = -1;
    objc_msgSend_options((void *)v9, v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_encryptionServiceName(v14, v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v18;
    if (v18)
    {
      v23 = v18;
    }
    else
    {
      objc_msgSend_untrustedEntitlements((void *)v9, v19, v20, v21);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_serviceNameForContainerIdentifierMapEntitlement(v24, v25, v26, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_containerIdentifier((void *)v9, v29, v30, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v28, v33, (uint64_t)v32, v34);
      v23 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend_options((void *)v9, v35, v36, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setIsServiceManatee_(v38, v39, 0, v40);

    if (v23)
    {
      objc_initWeak(&location, (id)v9);
      v41 = (void *)MEMORY[0x1E0CB3940];
      CKTestNotificationPrefix();
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v41, v43, (uint64_t)CFSTR("%@%@-%@"), v44, v42, CFSTR("com.apple.cloudd.pcsIdentityUpdate"), v23);
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      v49 = (const char *)objc_msgSend_UTF8String(v45, v46, v47, v48);
      CKGetGlobalQueue(-1);
      v50 = objc_claimAutoreleasedReturnValue();
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = sub_18A6E01AC;
      handler[3] = &unk_1E1F61370;
      v77 = v23;
      objc_copyWeak(&v78, &location);
      LODWORD(v49) = notify_register_dispatch(v49, out_token, v50, handler);

      v51 = out_token[0];
      if ((_DWORD)v49)
        v51 = -1;
      *(_DWORD *)(v9 + 8) = v51;
      out_token[0] = -1;
      PCSServiceItemGetCKKSViewByName();
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = (void *)MEMORY[0x1E0CB3940];
      CKTestNotificationPrefix();
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v53, v55, (uint64_t)CFSTR("%@%@-%@"), v56, v54, CFSTR("com.apple.cloudd.pcsIdentityUpdate"), v52);
      v57 = (void *)objc_claimAutoreleasedReturnValue();

      v61 = (const char *)objc_msgSend_UTF8String(v57, v58, v59, v60);
      CKGetGlobalQueue(-1);
      v62 = objc_claimAutoreleasedReturnValue();
      v73[0] = MEMORY[0x1E0C809B0];
      v73[1] = 3221225472;
      v73[2] = sub_18A6E02C0;
      v73[3] = &unk_1E1F61370;
      v63 = v52;
      v74 = v63;
      objc_copyWeak(&v75, &location);
      LODWORD(v61) = notify_register_dispatch(v61, out_token, v62, v73);

      v64 = out_token[0];
      if ((_DWORD)v61)
        v64 = -1;
      *(_DWORD *)(v9 + 12) = v64;
      IsManatee = PCSServiceItemTypeIsManatee();
      objc_msgSend_options((void *)v9, v66, v67, v68);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setIsServiceManatee_(v69, v70, IsManatee, v71);

      objc_destroyWeak(&v75);
      objc_destroyWeak(&v78);

      objc_destroyWeak(&location);
    }

  }
  return (id)v9;
}

- (CKContainerID)containerID
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend_implementation(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_containerID(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (CKContainerID *)v8;
}

- (void)fetchUserRecordIDWithCompletionHandler:(void *)completionHandler
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  id v10;

  v4 = completionHandler;
  objc_msgSend_implementation(self, v5, v6, v7);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fetchUserRecordIDWithCompletionHandler_(v10, v8, (uint64_t)v4, v9);

}

- (void)accountInfoWithCompletionHandler:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  id v10;

  v4 = a3;
  objc_msgSend_implementation(self, v5, v6, v7);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_accountInfoWithCompletionHandler_(v10, v8, (uint64_t)v4, v9);

}

- (CKContainerOptions)options
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend_implementation(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_options(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (CKContainerOptions *)v8;
}

- (CKContainerImplementation)implementation
{
  return self->_implementation;
}

- (void)submitEventMetric:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  id v10;

  v4 = a3;
  objc_msgSend_implementation(self, v5, v6, v7);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_submitEventMetric_(v10, v8, (uint64_t)v4, v9);

}

- (CKDatabase)publicCloudDatabase
{
  CKContainer *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  CKDatabase *v11;
  const char *v12;
  uint64_t inited;
  CKDatabase *publicCloudDatabase;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_publicCloudDatabase)
  {
    objc_msgSend_implementation(v2, v3, v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_publicCloudDatabaseImplementation(v6, v7, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = [CKDatabase alloc];
    inited = objc_msgSend_initInternalWithImplementation_container_(v11, v12, (uint64_t)v10, (uint64_t)v2);
    publicCloudDatabase = v2->_publicCloudDatabase;
    v2->_publicCloudDatabase = (CKDatabase *)inited;

  }
  objc_sync_exit(v2);

  return v2->_publicCloudDatabase;
}

- (CKDatabase)privateCloudDatabase
{
  CKContainer *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  CKDatabase *v11;
  const char *v12;
  uint64_t inited;
  CKDatabase *privateCloudDatabase;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_privateCloudDatabase)
  {
    objc_msgSend_implementation(v2, v3, v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_privateCloudDatabaseImplementation(v6, v7, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = [CKDatabase alloc];
    inited = objc_msgSend_initInternalWithImplementation_container_(v11, v12, (uint64_t)v10, (uint64_t)v2);
    privateCloudDatabase = v2->_privateCloudDatabase;
    v2->_privateCloudDatabase = (CKDatabase *)inited;

  }
  objc_sync_exit(v2);

  return v2->_privateCloudDatabase;
}

- (CKContainer)initWithImplementation:(id)a3 convenienceConfiguration:(id)a4
{
  id v7;
  id v8;
  CKContainer *v9;
  CKContainer *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CKContainer;
  v9 = -[CKContainer init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_convenienceConfiguration, a4);
    objc_storeStrong((id *)&v10->_implementation, a3);
  }

  return v10;
}

- (CKContainer)initWithContainerID:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  CKContainerImplementation *v8;
  const char *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  CKContainer *inited;

  v6 = a4;
  v7 = a3;
  v8 = [CKContainerImplementation alloc];
  v10 = (void *)objc_msgSend_initWithContainerID_options_unconfiguredWrappingContainer_(v8, v9, (uint64_t)v7, (uint64_t)v6, self);

  inited = (CKContainer *)objc_msgSend__initUnconfiguredContainerWithImplementation_(self, v11, (uint64_t)v10, v12);
  return inited;
}

- (CKContainer)initWithContainerID:(id)a3
{
  id v4;
  CKContainerImplementation *v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  CKContainer *inited;

  v4 = a3;
  v5 = [CKContainerImplementation alloc];
  v7 = (void *)objc_msgSend_initWithContainerID_options_unconfiguredWrappingContainer_(v5, v6, (uint64_t)v4, 0, self);

  inited = (CKContainer *)objc_msgSend__initUnconfiguredContainerWithImplementation_(self, v8, (uint64_t)v7, v9);
  return inited;
}

- (void)getContainerScopedDaemonProxyWithRetryHandler:(id)a3 errorHandler:(id)a4 daemonProxyHandler:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend_implementation(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
    sub_18A5ECA88(v13, 0, (void *)1, v15, v8, v9);

}

- (void)fetchCurrentDeviceIDWithCompletionHandler:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  id v10;

  v4 = a3;
  objc_msgSend_implementation(self, v5, v6, v7);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fetchCurrentDeviceIDWithCompletionHandler_(v10, v8, (uint64_t)v4, v9);

}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  int pcsServiceScopedIdentityUpdateToken;
  int keychainViewScopedIdentityUpdateToken;
  void *v7;
  objc_super v8;

  pcsServiceScopedIdentityUpdateToken = self->_pcsServiceScopedIdentityUpdateToken;
  if (pcsServiceScopedIdentityUpdateToken != -1)
    notify_cancel(pcsServiceScopedIdentityUpdateToken);
  keychainViewScopedIdentityUpdateToken = self->_keychainViewScopedIdentityUpdateToken;
  if (keychainViewScopedIdentityUpdateToken != -1)
    notify_cancel(keychainViewScopedIdentityUpdateToken);
  objc_msgSend_sharedManager(CKProcessScopedStateManager, a2, v2, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18A5FA1B4(v7, self);

  v8.receiver = self;
  v8.super_class = (Class)CKContainer;
  -[CKContainer dealloc](&v8, sel_dealloc);
}

- (CKConvenienceConfiguration)convenienceConfiguration
{
  return self->_convenienceConfiguration;
}

- (NSString)containerIdentifier
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend_implementation(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_containerIdentifier(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (void)accountStatusWithCompletionHandler:(void *)completionHandler
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  id v10;

  v4 = completionHandler;
  objc_msgSend_implementation(self, v5, v6, v7);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_accountStatusWithCompletionHandler_(v10, v8, (uint64_t)v4, v9);

}

- (id)_initWithContainerIdentifier:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  CKContainerImplementation *v9;
  const char *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *inited;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  objc_msgSend_containerIDForContainerIdentifier_(v5, v6, (uint64_t)v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = [CKContainerImplementation alloc];
  v11 = (void *)objc_msgSend_initWithContainerID_options_unconfiguredWrappingContainer_(v9, v10, (uint64_t)v8, 0, self);
  inited = (void *)objc_msgSend__initUnconfiguredContainerWithImplementation_(self, v12, (uint64_t)v11, v13);

  return inited;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_convenienceConfiguration, 0);
  objc_storeStrong((id *)&self->_implementation, 0);
  objc_storeStrong((id *)&self->_codeServices, 0);
  objc_storeStrong((id *)&self->_organizationCloudDatabase, 0);
  objc_storeStrong((id *)&self->_sharedCloudDatabase, 0);
  objc_storeStrong((id *)&self->_publicCloudDatabase, 0);
  objc_storeStrong((id *)&self->_privateCloudDatabase, 0);
}

+ (void)initialize
{
  objc_class *v3;

  v3 = (objc_class *)objc_opt_class();
  sub_18A5CEF4C((uint64_t)a1, v3, 0, &unk_1E1FC4040, 0);
}

+ (id)containerIDForContainerIdentifier:(id)a3 environment:(int64_t)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  CKContainerID *v36;
  const char *v37;
  void *v38;

  v5 = a3;
  if (!v5)
  {
    objc_opt_self();
    sub_18A6DA5EC();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v6, (uint64_t)CFSTR("iCloud.%@"), v8, v9);
      v5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_9:

      goto LABEL_10;
    }
    objc_msgSend_sharedManager(CKProcessScopedStateManager, v6, v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_untrustedEntitlements(v10, v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend_hasMasqueradingEntitlement(v14, v15, v16, v17))
    {
      objc_msgSend_sharedManager(CKProcessScopedStateManager, v18, v19, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_untrustedEntitlements(v21, v22, v23, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_clientPrefixEntitlement(v25, v26, v27, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (v29)
      {
LABEL_8:
        v5 = 0;
        goto LABEL_9;
      }
      objc_msgSend_processInfo(MEMORY[0x1E0CB3898], v30, v31, v32);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_processName(v10, v33, v34, v35);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      CKWarnForInvalidApplicationIdentifier(0, v14);
    }

    goto LABEL_8;
  }
LABEL_10:
  v36 = [CKContainerID alloc];
  v38 = (void *)objc_msgSend_initWithContainerIdentifier_environment_(v36, v37, (uint64_t)v5, a4);

  return v38;
}

+ (id)containerIDForContainerIdentifier:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  CKContainerID *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  void *v27;

  v4 = a3;
  objc_msgSend_sharedManager(CKProcessScopedStateManager, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_untrustedEntitlements(v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_msgSend_containerEnvironment(v12, v13, v14, v15);
  objc_msgSend_containerIDForContainerIdentifier_environment_(a1, v17, (uint64_t)v4, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = objc_msgSend_containerEnvironmentForContainerID_entitlements_(a1, v19, (uint64_t)v18, (uint64_t)v12);
  v21 = [CKContainerID alloc];
  objc_msgSend_containerIdentifier(v18, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_msgSend_initWithContainerIdentifier_environment_(v21, v26, (uint64_t)v25, v20);

  return v27;
}

+ (CKContainer)allocWithZone:(_NSZone *)a3
{
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v11;
  const char *v12;
  objc_super v14;

  if ((id)objc_opt_class() == a1 && __sTestOverridesAvailable != 0 && byte_1EDF6A0E0 == 0)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v6, v7, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v11, v12, (uint64_t)a2, (uint64_t)a1, CFSTR("CKContainer.m"), 2408, CFSTR("Why is partlycloudd initting a CKContainer directly"));

  }
  v14.receiver = a1;
  v14.super_class = (Class)&OBJC_METACLASS___CKContainer;
  return (CKContainer *)objc_msgSendSuper2(&v14, sel_allocWithZone_, a3);
}

+ (CKContainer)defaultContainer
{
  if (qword_1ECD96AB8 != -1)
    dispatch_once(&qword_1ECD96AB8, &unk_1E1F61328);
  return (CKContainer *)(id)qword_1ECD96AC0;
}

+ (void)removeIdentifierFromContainersWithIdentifier:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  const char *v8;
  id v9;

  v9 = a3;
  objc_msgSend_containersByIdentifier(a1, v4, v5, v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v7);
  objc_msgSend_setObject_forKeyedSubscript_(v7, v8, 0, (uint64_t)v9);
  objc_sync_exit(v7);

}

- (CKContainer)initWithContainerSetupInfo:(id)a3
{
  id v4;
  CKContainerImplementation *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  CKContainer *inited;

  v4 = a3;
  v5 = [CKContainerImplementation alloc];
  objc_msgSend_containerID(v4, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_containerOptions(v4, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)objc_msgSend_initWithContainerID_options_unconfiguredWrappingContainer_(v5, v14, (uint64_t)v9, (uint64_t)v13, self);
  inited = (CKContainer *)objc_msgSend__initUnconfiguredContainerWithImplementation_(self, v16, (uint64_t)v15, v17);

  return inited;
}

- (void)getSynchronousContainerScopedDaemonProxyWithErrorHandler:(id)a3 daemonProxyHandler:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  objc_msgSend_implementation(self, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
    sub_18A5ECA88(v10, 1, (void *)1, 0, v12, v6);

}

+ (id)matterhornName
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  return CKLocalizedString(CFSTR("ICLOUD"), &stru_1E1F66ED0, v2, v3, v4, v5, v6, v7, v9);
}

+ (id)uploadRequestFetchAllNotificationName
{
  return CFSTR("com.apple.cloudkit.uploadrequest.fetchall");
}

+ (id)_CKXPCClientToDiscretionaryDaemonInterface
{
  if (qword_1ECD96B10 != -1)
    dispatch_once(&qword_1ECD96B10, &unk_1E1F613D0);
  return (id)qword_1ECD96B08;
}

+ (id)importantUserRecordAccessQueue
{
  return (id)qword_1ECD96A88;
}

- (CKDatabase)sharedCloudDatabase
{
  CKContainer *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  CKDatabase *v11;
  const char *v12;
  uint64_t inited;
  CKDatabase *sharedCloudDatabase;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_sharedCloudDatabase)
  {
    objc_msgSend_implementation(v2, v3, v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_sharedCloudDatabaseImplementation(v6, v7, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = [CKDatabase alloc];
    inited = objc_msgSend_initInternalWithImplementation_container_(v11, v12, (uint64_t)v10, (uint64_t)v2);
    sharedCloudDatabase = v2->_sharedCloudDatabase;
    v2->_sharedCloudDatabase = (CKDatabase *)inited;

  }
  objc_sync_exit(v2);

  return v2->_sharedCloudDatabase;
}

- (CKDatabase)organizationCloudDatabase
{
  CKContainer *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  CKDatabase *v11;
  const char *v12;
  uint64_t inited;
  CKDatabase *organizationCloudDatabase;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_organizationCloudDatabase)
  {
    objc_msgSend_implementation(v2, v3, v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_organizationCloudDatabaseImplementation(v6, v7, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = [CKDatabase alloc];
    inited = objc_msgSend_initInternalWithImplementation_container_(v11, v12, (uint64_t)v10, (uint64_t)v2);
    organizationCloudDatabase = v2->_organizationCloudDatabase;
    v2->_organizationCloudDatabase = (CKDatabase *)inited;

  }
  objc_sync_exit(v2);

  return v2->_organizationCloudDatabase;
}

- (CKDatabase)databaseWithDatabaseScope:(CKDatabaseScope)databaseScope
{
  uint64_t v3;
  void *v6;
  const char *v7;
  void *v8;

  switch(databaseScope)
  {
    case 0:
      objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, databaseScope, v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v6, v7, (uint64_t)a2, (uint64_t)self, CFSTR("CKContainer.m"), 2794, CFSTR("You must provide a valid database scope when getting a database from a container."));

      v8 = 0;
      break;
    case 1:
      objc_msgSend_publicCloudDatabase(self, a2, databaseScope, v3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      objc_msgSend_privateCloudDatabase(self, a2, databaseScope, v3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      objc_msgSend_sharedCloudDatabase(self, a2, databaseScope, v3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 4:
      objc_msgSend_organizationCloudDatabase(self, a2, databaseScope, v3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v8 = 0;
      break;
  }
  return (CKDatabase *)v8;
}

- (id)codeServiceWithName:(id)a3
{
  return sub_18A6E076C(self, a3, 0, 0);
}

- (id)codeServiceWithName:(id)a3 databaseScope:(int64_t)a4
{
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  const char *v16;

  v10 = a3;
  if (!a4)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v7, v8, v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_codeServiceWithName_);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v14, v16, (uint64_t)a2, (uint64_t)self, CFSTR("CKContainer.m"), 2841, CFSTR("You must provide a valid database scope when getting a code service bound to a database.  Did you mean to use %@?"), v15);

  }
  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v7, a4, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18A6E076C(self, v10, v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)codeServiceWithName:(id)a3 serviceInstanceURL:(id)a4
{
  return sub_18A6E076C(self, a3, 0, a4);
}

- (id)codeServiceWithName:(id)a3 databaseScope:(int64_t)a4 serviceInstanceURL:(id)a5
{
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  const char *v19;

  v9 = a3;
  v13 = a5;
  if (!a4)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v10, v11, v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_codeServiceWithName_serviceInstanceURL_);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v17, v19, (uint64_t)a2, (uint64_t)self, CFSTR("CKContainer.m"), 2848, CFSTR("You must provide a valid database scope when getting a code service bound to a database.  Did you mean to use %@?"), v18);

  }
  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v10, a4, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18A6E076C(self, v9, v14, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)instanceMethodSignatureForSelector:(SEL)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___CKContainer;
  objc_msgSendSuper2(&v8, sel_instanceMethodSignatureForSelector_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend_instanceMethodSignatureForSelector_(CKContainerImplementation, v5, (uint64_t)a3, v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (NSString)sourceApplicationBundleIdentifier
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend_implementation(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sourceApplicationBundleIdentifier(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (NSString)sourceApplicationSecondaryIdentifier
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend_implementation(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sourceApplicationSecondaryIdentifier(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (void)setSourceApplicationSecondaryIdentifier:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  id v10;

  v4 = a3;
  objc_msgSend_implementation(self, v5, v6, v7);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSourceApplicationSecondaryIdentifier_(v10, v8, (uint64_t)v4, v9);

}

- (CKContainerSetupInfo)setupInfo
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend_implementation(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setupInfo(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (CKContainerSetupInfo *)v8;
}

- (void)addOperation:(CKOperation *)operation
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  int isOutstandingOperation;
  CKOperation *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  CKOperation *v26;

  v26 = operation;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_6;
  objc_msgSend_configuration(v26, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_isLongLived(v7, v8, v9, v10) & 1) == 0)
  {

    goto LABEL_6;
  }
  isOutstandingOperation = objc_msgSend_isOutstandingOperation(v26, v11, v12, v13);

  if (!isOutstandingOperation)
  {
LABEL_6:
    objc_msgSend_implementation(self, v4, v5, v6);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_convenienceConfiguration(self, v22, v23, v24);
    v15 = (CKOperation *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addOperation_wrappingContainer_convenienceConfiguration_(v19, v25, (uint64_t)v26, (uint64_t)self, v15);
    goto LABEL_7;
  }
  v15 = v26;
  objc_msgSend_database(v15, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addOperation_(v19, v20, (uint64_t)v15, v21);
LABEL_7:

}

- (void)statusForApplicationPermission:(CKApplicationPermissions)applicationPermission completionHandler:(CKApplicationPermissionBlock)completionHandler
{
  CKApplicationPermissionBlock v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  id v11;

  v6 = completionHandler;
  objc_msgSend_implementation(self, v7, v8, v9);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_statusForApplicationPermission_completionHandler_(v11, v10, applicationPermission, (uint64_t)v6);

}

- (void)requestApplicationPermission:(CKApplicationPermissions)applicationPermission completionHandler:(CKApplicationPermissionBlock)completionHandler
{
  CKApplicationPermissionBlock v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  id v11;

  v6 = completionHandler;
  objc_msgSend_implementation(self, v7, v8, v9);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_requestApplicationPermission_completionHandler_(v11, v10, applicationPermission, (uint64_t)v6);

}

- (void)discoverAllIdentitiesWithCompletionHandler:(void *)completionHandler
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  id v13;

  v4 = completionHandler;
  objc_msgSend_implementation(self, v5, v6, v7);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_convenienceConfiguration(self, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_discoverAllIdentitiesWithWrappingContainer_convenienceConfiguration_completionHandler_(v13, v12, (uint64_t)self, (uint64_t)v11, v4);

}

- (void)discoverUserIdentityWithEmailAddress:(NSString *)email completionHandler:(void *)completionHandler
{
  void *v6;
  NSString *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  id v16;

  v6 = completionHandler;
  v7 = email;
  objc_msgSend_implementation(self, v8, v9, v10);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_convenienceConfiguration(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_discoverUserIdentityWithEmailAddress_wrappingContainer_convenienceConfiguration_completionHandler_(v16, v15, (uint64_t)v7, (uint64_t)self, v14, v6);

}

- (void)discoverUserIdentityWithPhoneNumber:(NSString *)phoneNumber completionHandler:(void *)completionHandler
{
  void *v6;
  NSString *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  id v16;

  v6 = completionHandler;
  v7 = phoneNumber;
  objc_msgSend_implementation(self, v8, v9, v10);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_convenienceConfiguration(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_discoverUserIdentityWithPhoneNumber_wrappingContainer_convenienceConfiguration_completionHandler_(v16, v15, (uint64_t)v7, (uint64_t)self, v14, v6);

}

- (void)discoverUserIdentityWithUserRecordID:(CKRecordID *)userRecordID completionHandler:(void *)completionHandler
{
  void *v6;
  CKRecordID *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  id v16;

  v6 = completionHandler;
  v7 = userRecordID;
  objc_msgSend_implementation(self, v8, v9, v10);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_convenienceConfiguration(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_discoverUserIdentityWithUserRecordID_wrappingContainer_convenienceConfiguration_completionHandler_(v16, v15, (uint64_t)v7, (uint64_t)self, v14, v6);

}

- (void)fetchShareParticipantWithEmailAddress:(NSString *)emailAddress completionHandler:(void *)completionHandler
{
  void *v6;
  NSString *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  id v16;

  v6 = completionHandler;
  v7 = emailAddress;
  objc_msgSend_implementation(self, v8, v9, v10);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_convenienceConfiguration(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fetchShareParticipantWithEmailAddress_wrappingContainer_convenienceConfiguration_completionHandler_(v16, v15, (uint64_t)v7, (uint64_t)self, v14, v6);

}

- (void)fetchShareParticipantWithPhoneNumber:(NSString *)phoneNumber completionHandler:(void *)completionHandler
{
  void *v6;
  NSString *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  id v16;

  v6 = completionHandler;
  v7 = phoneNumber;
  objc_msgSend_implementation(self, v8, v9, v10);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_convenienceConfiguration(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fetchShareParticipantWithPhoneNumber_wrappingContainer_convenienceConfiguration_completionHandler_(v16, v15, (uint64_t)v7, (uint64_t)self, v14, v6);

}

- (void)fetchShareParticipantWithUserRecordID:(CKRecordID *)userRecordID completionHandler:(void *)completionHandler
{
  void *v6;
  CKRecordID *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  id v16;

  v6 = completionHandler;
  v7 = userRecordID;
  objc_msgSend_implementation(self, v8, v9, v10);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_convenienceConfiguration(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fetchShareParticipantWithUserRecordID_wrappingContainer_convenienceConfiguration_completionHandler_(v16, v15, (uint64_t)v7, (uint64_t)self, v14, v6);

}

- (void)fetchShareMetadataWithURL:(NSURL *)url completionHandler:(void *)completionHandler
{
  void *v6;
  NSURL *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  id v16;

  v6 = completionHandler;
  v7 = url;
  objc_msgSend_implementation(self, v8, v9, v10);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_convenienceConfiguration(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fetchShareMetadataWithURL_wrappingContainer_convenienceConfiguration_completionHandler_(v16, v15, (uint64_t)v7, (uint64_t)self, v14, v6);

}

- (void)acceptShareMetadata:(CKShareMetadata *)metadata completionHandler:(void *)completionHandler
{
  void *v6;
  CKShareMetadata *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  id v16;

  v6 = completionHandler;
  v7 = metadata;
  objc_msgSend_implementation(self, v8, v9, v10);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_convenienceConfiguration(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_acceptShareMetadata_wrappingContainer_convenienceConfiguration_completionHandler_(v16, v15, (uint64_t)v7, (uint64_t)self, v14, v6);

}

- (void)registerSystemSharingUIObserver:(id)a3
{
  id v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  os_activity_scope_state_s state;

  v4 = a3;
  v5 = _os_activity_create(&dword_18A5C5000, "client/register-system-sharing-ui-observer", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  objc_msgSend_implementation(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v9);
  objc_msgSend_implementation(self, v10, v11, v12);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v13)
    v15 = *(void **)(v13 + 248);
  else
    v15 = 0;
  v16 = v15;
  objc_msgSend_addObject_(v16, v17, (uint64_t)v4, v18);

  objc_sync_exit(v9);
  v19 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = sub_18A6E165C;
  v23[3] = &unk_1E1F5F958;
  v24 = v4;
  v21[0] = v19;
  v21[1] = 3221225472;
  v21[2] = sub_18A6E1778;
  v21[3] = &unk_1E1F60BB8;
  v20 = v24;
  v22 = v20;
  sub_18A6E03D4(self, v23, v21);

  os_activity_scope_leave(&state);
}

- (void)fetchAllLongLivedOperationIDsWithCompletionHandler:(void *)completionHandler
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  id v10;

  v4 = completionHandler;
  objc_msgSend_implementation(self, v5, v6, v7);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fetchAllLongLivedOperationIDsWithCompletionHandler_(v10, v8, (uint64_t)v4, v9);

}

- (void)fetchLongLivedOperationWithID:(CKOperationID)operationID completionHandler:(void *)completionHandler
{
  void *v6;
  NSString *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  id v12;

  v6 = completionHandler;
  v7 = operationID;
  objc_msgSend_implementation(self, v8, v9, v10);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fetchLongLivedOperationWithID_wrappingContainer_completionHandler_(v12, v11, (uint64_t)v7, (uint64_t)self, v6);

}

- (void)getNewWebSharingIdentityDataWithCompletionHandler:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  id v10;

  v4 = a3;
  objc_msgSend_implementation(self, v5, v6, v7);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_getNewWebSharingIdentityDataWithCompletionHandler_(v10, v8, (uint64_t)v4, v9);

}

- (void)fetchShareParticipantWithLookupInfo:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  id v16;

  v6 = a4;
  v7 = a3;
  objc_msgSend_implementation(self, v8, v9, v10);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_convenienceConfiguration(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fetchShareParticipantWithLookupInfo_wrappingContainer_convenienceConfiguration_completionHandler_(v16, v15, (uint64_t)v7, (uint64_t)self, v14, v6);

}

- (void)submitEventMetric:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  id v12;

  v6 = a4;
  v7 = a3;
  objc_msgSend_implementation(self, v8, v9, v10);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_submitEventMetric_completionHandler_(v12, v11, (uint64_t)v7, (uint64_t)v6);

}

- (void)setApplicationPermission:(unint64_t)a3 enabled:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL8 v5;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  id v13;

  v5 = a4;
  v8 = a5;
  objc_msgSend_implementation(self, v9, v10, v11);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setApplicationPermission_enabled_completionHandler_(v13, v12, a3, v5, v8);

}

- (void)statusGroupsForApplicationPermission:(unint64_t)a3 completionHandler:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  id v11;

  v6 = a4;
  objc_msgSend_implementation(self, v7, v8, v9);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_statusGroupsForApplicationPermission_completionHandler_(v11, v10, a3, (uint64_t)v6);

}

- (void)pushEnvironmentWithCompletionHandler:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  id v10;

  v4 = a3;
  objc_msgSend_implementation(self, v5, v6, v7);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pushEnvironmentWithCompletionHandler_(v10, v8, (uint64_t)v4, v9);

}

- (void)serverPreferredPushEnvironmentWithCompletionHandler:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  id v10;

  v4 = a3;
  objc_msgSend_implementation(self, v5, v6, v7);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_serverPreferredPushEnvironmentWithCompletionHandler_(v10, v8, (uint64_t)v4, v9);

}

- (id)serverPreferredPushEnvironmentWithError:(id *)a3
{
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;

  objc_msgSend_implementation(self, a2, (uint64_t)a3, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_serverPreferredPushEnvironmentWithError_(v5, v6, (uint64_t)a3, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)wipeAllCachesAndDie
{
  uint64_t v2;
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  objc_msgSend_implementation(self, a2, v2, v3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_wipeAllCachesAndDie(v7, v4, v5, v6);

}

- (void)fetchSignatureGeneratorForCurrentUserBoundaryKeyWithCompletionHandler:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  id v10;

  v4 = a3;
  objc_msgSend_implementation(self, v5, v6, v7);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fetchSignatureGeneratorForCurrentUserBoundaryKeyWithCompletionHandler_(v10, v8, (uint64_t)v4, v9);

}

- (void)fetchFullNameAndPrimaryEmailOnAccountWithCompletionHandler:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  id v10;

  v4 = a3;
  objc_msgSend_implementation(self, v5, v6, v7);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fetchFullNameAndPrimaryEmailOnAccountWithCompletionHandler_(v10, v8, (uint64_t)v4, v9);

}

- (void)fetchFullNameAndFormattedUsernameOfAccountWithCompletionHandler:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  id v10;

  v4 = a3;
  objc_msgSend_implementation(self, v5, v6, v7);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fetchFullNameAndFormattedUsernameOfAccountWithCompletionHandler_(v10, v8, (uint64_t)v4, v9);

}

- (void)setFakeError:(id)a3 forNextRequestOfClassName:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  id v12;

  v6 = a4;
  v7 = a3;
  objc_msgSend_implementation(self, v8, v9, v10);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFakeError_forNextRequestOfClassName_(v12, v11, (uint64_t)v7, (uint64_t)v6);

}

- (void)fetchOrgAdminUserRecordIDWithCompletionHandler:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  id v10;

  v4 = a3;
  objc_msgSend_implementation(self, v5, v6, v7);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fetchOrgAdminUserRecordIDWithCompletionHandler_(v10, v8, (uint64_t)v4, v9);

}

- (void)registerForAssetUploadRequests:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  id v10;

  v4 = a3;
  objc_msgSend_implementation(self, v5, v6, v7);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_registerForAssetUploadRequests_(v10, v8, (uint64_t)v4, v9);

}

- (void)registerForAssetUploadRequests:(id)a3 machServiceName:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  id v12;

  v6 = a4;
  v7 = a3;
  objc_msgSend_implementation(self, v8, v9, v10);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_registerForAssetUploadRequests_machServiceName_(v12, v11, (uint64_t)v7, (uint64_t)v6);

}

- (void)registerForPackageUploadRequests:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  id v10;

  v4 = a3;
  objc_msgSend_implementation(self, v5, v6, v7);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_registerForPackageUploadRequests_(v10, v8, (uint64_t)v4, v9);

}

- (void)registerForPackageUploadRequests:(id)a3 machServiceName:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  id v12;

  v6 = a4;
  v7 = a3;
  objc_msgSend_implementation(self, v8, v9, v10);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_registerForPackageUploadRequests_machServiceName_(v12, v11, (uint64_t)v7, (uint64_t)v6);

}

- (void)unregisterFromUploadRequests
{
  uint64_t v2;
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  objc_msgSend_implementation(self, a2, v2, v3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_unregisterFromUploadRequests(v7, v4, v5, v6);

}

- (void)unregisterFromUploadRequestsWithMachServiceName:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  id v10;

  v4 = a3;
  objc_msgSend_implementation(self, v5, v6, v7);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_unregisterFromUploadRequestsWithMachServiceName_(v10, v8, (uint64_t)v4, v9);

}

- (void)manuallyTriggerUploadRequests
{
  uint64_t v2;
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  objc_msgSend_implementation(self, a2, v2, v3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_manuallyTriggerUploadRequests(v7, v4, v5, v6);

}

- (void)cancelUploadRequests
{
  uint64_t v2;
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  objc_msgSend_implementation(self, a2, v2, v3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_cancelUploadRequests(v7, v4, v5, v6);

}

- (void)withUploadManager:(int)a3 performBlock:(id)a4
{
  uint64_t v4;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  id v11;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  objc_msgSend_implementation(self, v7, v8, v9);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_withUploadManager_performBlock_(v11, v10, v4, (uint64_t)v6);

}

- (id)CKStatusReportArray
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend_implementation(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKStatusReportArray(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSMutableArray)codeServices
{
  return self->_codeServices;
}

- (void)setCodeServices:(id)a3
{
  objc_storeStrong((id *)&self->_codeServices, a3);
}

- (int)pcsServiceScopedIdentityUpdateToken
{
  return self->_pcsServiceScopedIdentityUpdateToken;
}

- (int)keychainViewScopedIdentityUpdateToken
{
  return self->_keychainViewScopedIdentityUpdateToken;
}

- (void)discoverAllContactUserInfosWithCompletionHandler:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  void *v5;
  void *v6;
  const char *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD, void *))a3;
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v5 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_FAULT))
  {
    v13 = v5;
    NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v16 = v14;
    _os_log_fault_impl(&dword_18A5C5000, v13, OS_LOG_TYPE_FAULT, "%{public}@ is deprecated, and will be removed in a future release.", buf, 0xCu);

    if (!v4)
      goto LABEL_6;
    goto LABEL_5;
  }
  if (v4)
  {
LABEL_5:
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v7, (uint64_t)CFSTR("CKInternalErrorDomain"), 1001, CFSTR("%@ is deprecated, and will be removed in a future release."), v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_CKClientSuitableError(v8, v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, 0, v12);

  }
LABEL_6:

}

- (void)discoverUserInfoWithEmailAddress:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  void *v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v8 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_FAULT))
  {
    v16 = v8;
    NSStringFromSelector(a2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v19 = v17;
    _os_log_fault_impl(&dword_18A5C5000, v16, OS_LOG_TYPE_FAULT, "%{public}@ is deprecated, and will be removed in a future release.", buf, 0xCu);

    if (!v7)
      goto LABEL_6;
    goto LABEL_5;
  }
  if (v7)
  {
LABEL_5:
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v10, (uint64_t)CFSTR("CKInternalErrorDomain"), 1001, CFSTR("%@ is deprecated, and will be removed in a future release."), v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_CKClientSuitableError(v11, v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v15);

  }
LABEL_6:

}

- (void)discoverUserInfoWithUserRecordID:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  void *v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v8 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_FAULT))
  {
    v16 = v8;
    NSStringFromSelector(a2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v19 = v17;
    _os_log_fault_impl(&dword_18A5C5000, v16, OS_LOG_TYPE_FAULT, "%{public}@ is deprecated, and will be removed in a future release.", buf, 0xCu);

    if (!v7)
      goto LABEL_6;
    goto LABEL_5;
  }
  if (v7)
  {
LABEL_5:
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v10, (uint64_t)CFSTR("CKInternalErrorDomain"), 1001, CFSTR("%@ is deprecated, and will be removed in a future release."), v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_CKClientSuitableError(v11, v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v15);

  }
LABEL_6:

}

@end
