@implementation CKDTokenRegistrationScheduler

- (NSMutableDictionary)unitTestingPushTokens
{
  return self->_unitTestingPushTokens;
}

- (void)registerTokenForAdopterContainer:(id)a3 completionBlock:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  char v38;
  id v39;
  const char *v40;
  uint64_t v41;
  NSObject *v42;
  NSObject *v43;
  id v44;
  id v45;
  NSObject *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  _QWORD block[5];
  id v51;
  id v52;
  id v53;
  id v54;
  void (**v55)(id, _QWORD);
  id v56;
  uint8_t buf[4];
  void *v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  objc_msgSend_deviceContext(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_account(v6, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dsid(v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend_metadataCache(v10, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_account(v6, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_accountID(v22, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setCachedDSID_forAccountID_(v19, v26, (uint64_t)v16, v25);

  }
  if (CKIsRunningInSyncBubble())
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v29 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      v46 = v29;
      objc_msgSend_appContainerTuple(v6, v47, v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v58 = v49;
      _os_log_debug_impl(&dword_1BE990000, v46, OS_LOG_TYPE_DEBUG, "Running in sync bubble. Ignoring token refresh for tuple %@", buf, 0xCu);

    }
    v7[2](v7, 0);
  }
  else
  {
    objc_msgSend_appContainerAccountTuple(v6, v27, v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appContainerTuple(v6, v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_sharedClient(CKDPDSClient, v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = 0;
    v38 = objc_msgSend_ensureRegistrationForContainer_outError_(v36, v37, (uint64_t)v6, &v56);
    v39 = v56;

    if ((v38 & 1) == 0 && v39)
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v42 = *MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v58 = v33;
        _os_log_error_impl(&dword_1BE990000, v42, OS_LOG_TYPE_ERROR, "Failed to ensure PDS registration, but continuing with CKDeviceService registration for %@", buf, 0xCu);
      }
    }
    objc_msgSend_queue(self, v40, v41);
    v43 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1BE9C1180;
    block[3] = &unk_1E7834BB0;
    block[4] = self;
    v51 = v30;
    v55 = v7;
    v52 = v33;
    v53 = v6;
    v54 = v10;
    v44 = v33;
    v45 = v30;
    dispatch_async(v43, block);

  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (CKDLogicalDeviceContext)deviceContext
{
  return (CKDLogicalDeviceContext *)objc_loadWeakRetained((id *)&self->_deviceContext);
}

- (NSMutableDictionary)callbackBlocks
{
  return self->_callbackBlocks;
}

- (CKDTokenRegistrationScheduler)initWithDeviceContext:(id)a3
{
  id v4;
  CKDTokenRegistrationScheduler *v5;
  CKDTokenRegistrationScheduler *v6;
  objc_class *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *queue;
  uint64_t v15;
  NSMutableDictionary *callbackBlocks;
  uint64_t v17;
  NSMutableDictionary *callbackTimers;
  uint64_t v19;
  NSMutableSet *operations;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  NSMutableDictionary *unitTestingPushTokens;
  objc_super v31;

  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)CKDTokenRegistrationScheduler;
  v5 = -[CKDTokenRegistrationScheduler init](&v31, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_deviceContext, v4);
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (const char *)objc_msgSend_UTF8String(v8, v9, v10);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = dispatch_queue_create(v11, v12);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v13;

    v15 = objc_opt_new();
    callbackBlocks = v6->_callbackBlocks;
    v6->_callbackBlocks = (NSMutableDictionary *)v15;

    v17 = objc_opt_new();
    callbackTimers = v6->_callbackTimers;
    v6->_callbackTimers = (NSMutableDictionary *)v17;

    v19 = objc_opt_new();
    operations = v6->_operations;
    v6->_operations = (NSMutableSet *)v19;

    objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObserver_selector_name_object_(v23, v24, (uint64_t)v6, sel_handlePublicPushTokenDidUpdate_, CFSTR("CKDPushConnectionDidReceivePublicTokenNotification"), 0);

    objc_msgSend_testDeviceReference(v4, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      v28 = objc_opt_new();
      unitTestingPushTokens = v6->_unitTestingPushTokens;
      v6->_unitTestingPushTokens = (NSMutableDictionary *)v28;

    }
  }

  return v6;
}

- (void)dealloc
{
  uint64_t v2;
  void *v4;
  const char *v5;
  objc_super v6;

  objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObserver_(v4, v5, (uint64_t)self);

  v6.receiver = self;
  v6.super_class = (Class)CKDTokenRegistrationScheduler;
  -[CKDTokenRegistrationScheduler dealloc](&v6, sel_dealloc);
}

- (void)registerTokenRefreshActivity
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  os_activity_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  void *v32;
  const char *v33;
  void *v34;
  id v35;
  uint8_t buf[8];
  void *v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend_unitTestingPushTokens(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend_currentProcess(CKDDaemonProcess, v5, v6);
    v35 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend_isSystemInstalledBinary(v35, v7, v8) & 1) != 0)
    {
      objc_msgSend_currentProcess(CKDDaemonProcess, v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend_processType(v11, v12, v13);

      if (v14 != 2)
      {
        if (CKIsRunningInSyncBubble())
        {
          if (*MEMORY[0x1E0C95300] != -1)
            dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
          v17 = *MEMORY[0x1E0C952B0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_debug_impl(&dword_1BE990000, v17, OS_LOG_TYPE_DEBUG, "Running in sync bubble. Ignoring registerTokenRefreshActivity", buf, 2u);
          }
        }
        else
        {
          objc_msgSend_deviceContext(self, v15, v16);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_metadataCache(v18, v19, v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_globalConfiguration(v21, v22, v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend_tokenRegisterDays_(v24, v25, 0);

          if (v26 <= 1)
            v27 = 1;
          else
            v27 = v26;
          v28 = _os_activity_create(&dword_1BE990000, "tokenRegistration", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
          v29 = *MEMORY[0x1E0C807B8];
          v30 = *MEMORY[0x1E0C807B8] * v27;
          objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v31, *MEMORY[0x1E0C808D0]);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = v32;
          v38[0] = MEMORY[0x1E0C9AAB0];
          objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v33, (uint64_t)v38, &v37, 1);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          CKRegisterRepeatingXPCActivity("com.apple.cloudkit.tokenregistration", v28, v30, v29, v34, &unk_1E7834A98);

        }
      }
    }
    else
    {

    }
  }
}

- (void)tokenRefreshChanged
{
  ((void (*)(CKDTokenRegistrationScheduler *, char *))MEMORY[0x1E0DE7D20])(self, sel_registerTokenRefreshActivity);
}

- (void)_refreshApsToken:(id)a3 container:(id)a4 completionBlock:(id)a5
{
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  NSObject *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  void *v27;
  const char *v28;
  const char *v29;
  void *v30;
  const char *v31;
  CKDOperationInfoHolderOperation *v32;
  const char *v33;
  void *v34;
  CKDTokenRegistrationURLRequest *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  _BOOL8 v44;
  const char *v45;
  void *v46;
  const char *v47;
  id v48;
  const char *v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  const char *v57;
  void *v58;
  const char *v59;
  _QWORD v60[5];
  id v61;
  id v62;
  uint8_t buf[4];
  id v64;
  __int16 v65;
  id v66;
  __int16 v67;
  void *v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v13 = a5;
  if (!v9)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v11, v12);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v58, v59, (uint64_t)a2, self, CFSTR("CKDTokenRegistrationScheduler.m"), 108, CFSTR("token must not be nil"));

  }
  objc_msgSend_unitTestingPushTokens(self, v11, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)*MEMORY[0x1E0C952F8];
  if (v14)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], v15);
    v16 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      v19 = v16;
      objc_msgSend_account(v10, v20, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_accountID(v22, v23, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v64 = v9;
      v65 = 2112;
      v66 = v10;
      v67 = 2112;
      v68 = v25;
      _os_log_debug_impl(&dword_1BE990000, v19, OS_LOG_TYPE_DEBUG, "Refreshing token %{public}@ for container %@ using unit test account ID %@", buf, 0x20u);

    }
  }
  else
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], v15);
    v26 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      v64 = v9;
      v65 = 2112;
      v66 = v10;
      _os_log_debug_impl(&dword_1BE990000, v26, OS_LOG_TYPE_DEBUG, "Refreshing token %@ for container %@", buf, 0x16u);
    }
  }
  objc_msgSend_defaultConvenienceOperationConfiguration(MEMORY[0x1E0C94F80], v17, v18);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDiscretionaryNetworkBehavior_(v27, v28, 1);
  objc_msgSend_setQualityOfService_(v27, v29, 17);
  v30 = (void *)objc_opt_new();
  objc_msgSend_setResolvedConfiguration_(v30, v31, (uint64_t)v27);
  v32 = [CKDOperationInfoHolderOperation alloc];
  v34 = (void *)objc_msgSend_initWithOperationInfo_container_operationType_(v32, v33, (uint64_t)v30, v10, 800);
  v35 = [CKDTokenRegistrationURLRequest alloc];
  objc_msgSend_apsEnvironmentString(v10, v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_applicationBundleIdentifierForPush(v10, v39, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend_adopterProcessType(v10, v42, v43) == 3;
  v46 = (void *)objc_msgSend_initWithOperation_apsToken_apsEnvironmentString_bundleID_skipBundleIDCheck_(v35, v45, (uint64_t)v34, v9, v38, v41, v44);

  objc_msgSend_setRequest_(v34, v47, (uint64_t)v46);
  objc_initWeak((id *)buf, v46);
  v60[0] = MEMORY[0x1E0C809B0];
  v60[1] = 3221225472;
  v60[2] = sub_1BEB5DF30;
  v60[3] = &unk_1E78335D0;
  objc_copyWeak(&v62, (id *)buf);
  v60[4] = self;
  v48 = v13;
  v61 = v48;
  objc_msgSend_setCompletionBlock_(v46, v49, (uint64_t)v60);
  objc_msgSend_operations(self, v50, v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v52);
  objc_msgSend_operations(self, v53, v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v55, v56, (uint64_t)v34);

  objc_sync_exit(v52);
  objc_msgSend_performRequest_(v10, v57, (uint64_t)v46);

  objc_destroyWeak(&v62);
  objc_destroyWeak((id *)buf);

}

- (void)_removeApsToken:(id)a3 appContainerAccountTuple:(id)a4 completionBlock:(id)a5
{
  id v9;
  const char *v10;
  uint64_t v11;
  id v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  void *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  const char *v24;
  CKDOperationInfoHolderOperation *v25;
  const char *v26;
  void *v27;
  CKDTokenDeletionURLRequest *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  void *v36;
  const char *v37;
  id v38;
  const char *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  const char *v47;
  NSObject *v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  const char *v53;
  id v54;
  void *v55;
  _QWORD v56[5];
  id v57;
  id v58;
  _BYTE location[12];
  __int16 v60;
  void *v61;
  __int16 v62;
  void *v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v54 = a4;
  v12 = a5;
  if (!v9)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v10, v11);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v52, v53, (uint64_t)a2, self, CFSTR("CKDTokenRegistrationScheduler.m"), 158, CFSTR("token must not be nil"));

  }
  objc_msgSend_deviceContext(self, v10, v11, v54);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sharedInternalUseContainers(CKDContainer, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_containerWithAppContainerAccountTuple_deviceContext_sharedContainerTable_(CKDContainer, v17, (uint64_t)v55, v13, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v19 = (void *)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    v48 = v19;
    objc_msgSend_applicationBundleIdentifierForPush(v18, v49, v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)location = 138412802;
    *(_QWORD *)&location[4] = v9;
    v60 = 2112;
    v61 = v55;
    v62 = 2114;
    v63 = v51;
    _os_log_debug_impl(&dword_1BE990000, v48, OS_LOG_TYPE_DEBUG, "Removing token %@ for container %@ push bundle identifier %{public}@", location, 0x20u);

  }
  objc_msgSend_defaultConvenienceOperationConfiguration(MEMORY[0x1E0C94F80], v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_opt_new();
  objc_msgSend_setResolvedConfiguration_(v23, v24, (uint64_t)v22);
  v25 = [CKDOperationInfoHolderOperation alloc];
  v27 = (void *)objc_msgSend_initWithOperationInfo_container_operationType_(v25, v26, (uint64_t)v23, v18, 801);
  v28 = [CKDTokenDeletionURLRequest alloc];
  objc_msgSend_apsEnvironmentString(v18, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_applicationBundleIdentifierForPush(v18, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)objc_msgSend_initWithOperation_apsToken_apsEnvironmentString_bundleID_(v28, v35, (uint64_t)v27, v9, v31, v34);

  objc_msgSend_setRequest_(v27, v37, (uint64_t)v36);
  objc_initWeak((id *)location, v36);
  v56[0] = MEMORY[0x1E0C809B0];
  v56[1] = 3221225472;
  v56[2] = sub_1BEB5E4AC;
  v56[3] = &unk_1E78335D0;
  objc_copyWeak(&v58, (id *)location);
  v56[4] = self;
  v38 = v12;
  v57 = v38;
  objc_msgSend_setCompletionBlock_(v36, v39, (uint64_t)v56);
  objc_msgSend_operations(self, v40, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v42);
  objc_msgSend_operations(self, v43, v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v45, v46, (uint64_t)v27);

  objc_sync_exit(v42);
  objc_msgSend_performRequest_(v18, v47, (uint64_t)v36);

  objc_destroyWeak(&v58);
  objc_destroyWeak((id *)location);

}

- (void)refreshAllClientsNow:(BOOL)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  BOOL v16;
  NSObject *v17;
  NSObject *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  NSObject *v29;
  NSObject *v30;
  dispatch_time_t v31;
  const char *v32;
  const char *v33;
  uint64_t v34;
  NSObject *v35;
  id v36;
  id v37;
  void *v38;
  id obj;
  _QWORD v40[4];
  id v41;
  id v42;
  _QWORD block[5];
  NSObject *v44;
  id v45;
  CKDTokenRegistrationScheduler *v46;
  BOOL v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t v52[128];
  uint8_t buf[4];
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  objc_msgSend_unitTestingPushTokens(self, a2, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    if (CKIsRunningInSyncBubble())
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v8 = *MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1BE990000, v8, OS_LOG_TYPE_DEBUG, "Ignoring refresh of all clients", buf, 2u);
      }
    }
    else
    {
      objc_msgSend_deviceContext(self, v6, v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_metadataCache(v9, v10, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_knownAppContainerAccountTuples(v12, v13, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = a3;
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v17 = *MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v54 = v15;
        _os_log_debug_impl(&dword_1BE990000, v17, OS_LOG_TYPE_DEBUG, "Refreshing all client push tokens. Known app containers are %@", buf, 0xCu);
      }
      v18 = dispatch_group_create();
      objc_msgSend_date(MEMORY[0x1E0C99D68], v19, v20);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = 0u;
      v49 = 0u;
      v50 = 0u;
      v51 = 0u;
      obj = v15;
      v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v21, (uint64_t)&v48, v52, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v49;
        do
        {
          for (i = 0; i != v23; ++i)
          {
            if (*(_QWORD *)v49 != v24)
              objc_enumerationMutation(obj);
            v26 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * i);
            dispatch_group_enter(v18);
            objc_msgSend_queue(self, v27, v28);
            v29 = objc_claimAutoreleasedReturnValue();
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = sub_1BEB5E9A4;
            block[3] = &unk_1E7834AE8;
            block[4] = v26;
            v30 = v18;
            v44 = v30;
            v45 = v9;
            v46 = self;
            v47 = v16;
            dispatch_async(v29, block);

            v31 = dispatch_time(0, 60000000000);
            dispatch_group_wait(v30, v31);

          }
          v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v32, (uint64_t)&v48, v52, 16);
        }
        while (v23);
      }

      objc_msgSend_queue(self, v33, v34);
      v35 = objc_claimAutoreleasedReturnValue();
      v40[0] = MEMORY[0x1E0C809B0];
      v40[1] = 3221225472;
      v40[2] = sub_1BEB5F0A4;
      v40[3] = &unk_1E782EE20;
      v41 = v9;
      v42 = v38;
      v36 = v38;
      v37 = v9;
      dispatch_async(v35, v40);

    }
  }
}

- (void)_handlePushToken:(id)a3 forContainer:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  CKDPushToken *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  void *v33;
  NSObject *v34;
  const char *v35;
  uint64_t v36;
  NSObject *v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  NSObject *v44;
  id v45;
  void *v46;
  void *v47;
  _QWORD block[5];
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  id v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  void *v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = _os_activity_create(&dword_1BE990000, "tokenRegistrationScheduler/handlePushTokenDidUpdate", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  objc_msgSend_appContainerTuple(v9, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appContainerAccountTuple(v9, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v11;
  v18 = [CKDPushToken alloc];
  objc_msgSend_apsEnvironmentString(v9, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend_initWithAPSEnvironmentString_apsToken_(v18, v22, (uint64_t)v21, v8);
  v46 = v8;

  objc_msgSend_applicationBundleIdentifierForPush(v9, v24, v25);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deviceContext(self, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_metadataCache(v28, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appContainerAccountMetadataForAppContainerAccountTuple_(v31, v32, (uint64_t)v17);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v34 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v57 = v8;
    v58 = 2112;
    v59 = v14;
    v60 = 2114;
    v61 = v47;
    _os_log_debug_impl(&dword_1BE990000, v34, OS_LOG_TYPE_DEBUG, "Handling token %@ for container tuple %@, push bundle identifier %{public}@", buf, 0x20u);
  }
  objc_msgSend_queue(self, v35, v36, v44);
  v37 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BEB5F470;
  block[3] = &unk_1E7834B38;
  block[4] = self;
  v49 = v17;
  v50 = v14;
  v51 = v23;
  v53 = v9;
  v54 = v10;
  v52 = v33;
  v38 = v9;
  v39 = v10;
  v40 = v33;
  v41 = v23;
  v42 = v14;
  v43 = v17;
  dispatch_async(v37, block);

  os_activity_scope_leave(&state);
}

- (void)unregisterTokenForAppContainerAccountTuple:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  char v21;
  id v22;
  const char *v23;
  uint64_t v24;
  NSObject *v25;
  NSObject *v26;
  _QWORD block[5];
  id v28;
  id v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_unitTestingPushTokens(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    if (CKIsRunningInSyncBubble())
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v10 = *MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v31 = v4;
        _os_log_debug_impl(&dword_1BE990000, v10, OS_LOG_TYPE_DEBUG, "Running in sync bubble. Ignoring unregister for container %@", buf, 0xCu);
      }
    }
    else
    {
      objc_msgSend_deviceContext(self, v8, v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_sharedInternalUseContainers(CKDContainer, v12, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_containerWithAppContainerAccountTuple_deviceContext_sharedContainerTable_(CKDContainer, v15, (uint64_t)v4, v11, v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_sharedClient(CKDPDSClient, v17, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 0;
      v21 = objc_msgSend_unregisterTokenForContainer_outError_(v19, v20, (uint64_t)v16, &v29);
      v22 = v29;

      if ((v21 & 1) == 0)
      {
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v25 = *MEMORY[0x1E0C952B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v31 = v4;
          v32 = 2112;
          v33 = v22;
          _os_log_error_impl(&dword_1BE990000, v25, OS_LOG_TYPE_ERROR, "Failed to unregister with PDS, but continuing with CKDeviceService unregistration for %@: %@", buf, 0x16u);
        }
      }
      objc_msgSend_queue(self, v23, v24);
      v26 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = sub_1BEB5FEAC;
      block[3] = &unk_1E782EE20;
      block[4] = self;
      v28 = v4;
      dispatch_async(v26, block);

    }
  }

}

- (void)unregisterAllTokensForAccountID:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  const char *v15;
  char v16;
  id v17;
  const char *v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  _QWORD v22[5];
  id v23;
  void (**v24)(id, _QWORD);
  id v25;
  uint8_t buf[4];
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  objc_msgSend_unitTestingPushTokens(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    if (!v7)
      goto LABEL_16;
    goto LABEL_9;
  }
  if (CKIsRunningInSyncBubble())
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v13 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1BE990000, v13, OS_LOG_TYPE_DEBUG, "Running in sync bubble. Ignoring unregister", buf, 2u);
    }
LABEL_9:
    v7[2](v7, 0);
    goto LABEL_16;
  }
  objc_msgSend_sharedClient(CKDPDSClient, v11, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  v16 = objc_msgSend_unregisterAllTokensForAccountID_outError_(v14, v15, (uint64_t)v6, &v25);
  v17 = v25;

  if ((v16 & 1) == 0)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v20 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v27 = v6;
      _os_log_error_impl(&dword_1BE990000, v20, OS_LOG_TYPE_ERROR, "Failed to unregister with PDS, but continuing with CKDeviceService unregistration for %@", buf, 0xCu);
    }
  }
  objc_msgSend_queue(self, v18, v19);
  v21 = objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = sub_1BEB60384;
  v22[3] = &unk_1E782F678;
  v22[4] = self;
  v23 = v6;
  v24 = v7;
  dispatch_async(v21, v22);

LABEL_16:
}

- (void)forceTokenRefreshForAllClients
{
  NSObject *v3;
  const char *v4;
  uint8_t v5[16];

  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v3 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1BE990000, v3, OS_LOG_TYPE_INFO, "Refreshing all push tokens", v5, 2u);
  }
  objc_msgSend_refreshAllClientsNow_(self, v4, 1);
}

- (void)handlePublicPushTokenDidUpdate:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  os_activity_scope_state_s v17;

  v4 = a3;
  objc_msgSend_currentProcess(CKDDaemonProcess, v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_isSystemInstalledBinary(v7, v8, v9) & 1) == 0)
    goto LABEL_4;
  objc_msgSend_currentProcess(CKDDaemonProcess, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend_processType(v12, v13, v14);

  if (v15 != 2)
  {
    v7 = _os_activity_create(&dword_1BE990000, "tokenRegistrationScheduler/handlePublicPushTokenDidUpdate", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v17.opaque[0] = 0;
    v17.opaque[1] = 0;
    os_activity_scope_enter(v7, &v17);
    objc_msgSend_refreshAllClientsNow_(self, v16, 0);
    os_activity_scope_leave(&v17);
LABEL_4:

  }
}

- (NSMutableDictionary)callbackTimers
{
  return self->_callbackTimers;
}

- (NSMutableSet)operations
{
  return self->_operations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitTestingPushTokens, 0);
  objc_destroyWeak((id *)&self->_deviceContext);
  objc_storeStrong((id *)&self->_operations, 0);
  objc_storeStrong((id *)&self->_callbackTimers, 0);
  objc_storeStrong((id *)&self->_callbackBlocks, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
