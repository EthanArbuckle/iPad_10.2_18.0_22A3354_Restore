@implementation CKDLogicalDeviceContext

- (CKDMetadataCache)metadataCache
{
  uint64_t v2;
  CKDMetadataCache *metadataCache;
  void *v7;
  const char *v8;

  metadataCache = self->_metadataCache;
  if (!metadataCache)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, v2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v7, v8, (uint64_t)a2, self, CFSTR("CKDLogicalDeviceContext.m"), 225, CFSTR("Detached test servers don't have metadata caches"));

    metadataCache = self->_metadataCache;
  }
  return metadataCache;
}

- (CKDThrottleManager)throttleManager
{
  uint64_t v2;
  CKDThrottleManager *throttleManager;
  void *v7;
  const char *v8;

  throttleManager = self->_throttleManager;
  if (!throttleManager)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, v2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v7, v8, (uint64_t)a2, self, CFSTR("CKDLogicalDeviceContext.m"), 235, CFSTR("Detached test servers don't have throttle managers"));

    throttleManager = self->_throttleManager;
  }
  return throttleManager;
}

- (CKDTestDeviceProtocol)testDevice
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;

  objc_msgSend_testServer(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_testDeviceReference(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deviceID(v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deviceWithDeviceID_(v4, v11, (uint64_t)v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (CKDTestDeviceProtocol *)v12;
}

- (CKDTestServerProtocol)testServer
{
  uint64_t v2;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  id v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  char isEqual;
  CKDTestServerProtocol *v18;
  CKDLogicalDeviceContext *v19;
  const char *v20;
  uint64_t v21;
  _BOOL4 v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  Class v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  const char *v37;
  uint64_t v38;
  _BOOL4 v39;
  void *v41;
  const char *v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;

  objc_msgSend_testDeviceReference(self, a2, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    goto LABEL_3;
  objc_msgSend_testDeviceReference(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_serverReferenceProtocol(v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = sub_1BEABE374();
  objc_msgSend_detachedTestServerReference(v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  isEqual = objc_msgSend_isEqual_(v11, v16, (uint64_t)v15);

  if ((isEqual & 1) == 0)
  {
    v19 = self;
    objc_sync_enter(v19);
    v18 = v19->_testServer;
    if (!v18)
    {
      if ((CKRunningInClientProcess() & 1) != 0)
      {
        v22 = 0;
      }
      else
      {
        objc_msgSend_currentProcess(CKDDaemonProcess, v20, v21);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend_processType(v23, v24, v25) == 2;

      }
      if ((CKIsRunningInTestHost() | v22) == 1)
      {
        v28 = NSClassFromString(CFSTR("CloudKitTestingDaemon.CKDTestServerManager"));
        if (!v28)
        {
          objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v26, v27);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v41, v42, (uint64_t)a2, v19, CFSTR("CKDLogicalDeviceContext.m"), 177, CFSTR("Couldn't find CKDTestServerManager in test process"));

        }
        objc_msgSend_sharedManager(v28, v26, v27);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_testDeviceReference(v19, v30, v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_serverReferenceProtocol(v32, v33, v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_existingServerForReference_(v29, v36, (uint64_t)v35);
        v18 = (CKDTestServerProtocol *)objc_claimAutoreleasedReturnValue();

        if (v18)
          v39 = 0;
        else
          v39 = v22;
        if (v39)
        {
          objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v37, v38);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_testDeviceReference(v19, v44, v45);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v43, v47, (uint64_t)a2, v19, CFSTR("CKDLogicalDeviceContext.m"), 181, CFSTR("No such test device at %@"), v46);

        }
        objc_storeStrong((id *)&v19->_testServer, v18);

      }
      else
      {
        v18 = 0;
      }
    }
    objc_sync_exit(v19);

  }
  else
  {
LABEL_3:
    v18 = 0;
  }
  return v18;
}

- (CKTestDeviceReferenceProtocol)testDeviceReference
{
  return (CKTestDeviceReferenceProtocol *)objc_getProperty(self, a2, 64, 1);
}

- (CKDAccountDataSecurityObserver)accountDataSecurityObserver
{
  uint64_t v2;
  CKDAccountDataSecurityObserver *accountDataSecurityObserver;
  void *v7;
  const char *v8;

  accountDataSecurityObserver = self->_accountDataSecurityObserver;
  if (!accountDataSecurityObserver)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, v2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v7, v8, (uint64_t)a2, self, CFSTR("CKDLogicalDeviceContext.m"), 240, CFSTR("Detached test servers don't have throttle managers"));

    accountDataSecurityObserver = self->_accountDataSecurityObserver;
  }
  return accountDataSecurityObserver;
}

+ (id)deviceContextForTestDeviceReference:(id)a3
{
  const char *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  const char *v19;
  void *v20;
  CKDLogicalDeviceContext *v21;
  const char *v22;
  const char *v23;
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5 && *MEMORY[0x1E0C95280])
  {
    if (qword_1ED702C40 != -1)
      dispatch_once(&qword_1ED702C40, &unk_1E7838188);
    objc_msgSend_deviceID(v5, v3, v4);
    v6 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v6;
    v10 = CFSTR("NO_DEVICE_ID");
    if (v6)
      v10 = (const __CFString *)v6;
    v25[0] = v10;
    objc_msgSend_serverReferenceProtocol(v5, v7, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_dataDirectory(v11, v12, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (!v15)
    {
      objc_msgSend_fileURLWithPath_(MEMORY[0x1E0C99E98], v14, (uint64_t)CFSTR("/dev/null"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v25[1] = v16;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v14, (uint64_t)v25, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)

    v18 = (id)qword_1ED702C48;
    objc_sync_enter(v18);
    objc_msgSend_objectForKey_((void *)qword_1ED702C48, v19, (uint64_t)v17);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v20)
    {
      v21 = [CKDLogicalDeviceContext alloc];
      v20 = (void *)objc_msgSend__initWithTestDeviceReference_(v21, v22, (uint64_t)v5);
      objc_msgSend_setObject_forKey_((void *)qword_1ED702C48, v23, (uint64_t)v20, v17);
    }
    objc_sync_exit(v18);

  }
  else
  {
    objc_msgSend_defaultContext(CKDLogicalDeviceContext, v3, v4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v20;
}

+ (id)defaultContext
{
  if (qword_1ED702C38 != -1)
    dispatch_once(&qword_1ED702C38, &unk_1E7838168);
  return (id)qword_1ED702C30;
}

- (CKDTokenRegistrationScheduler)tokenRegistrationScheduler
{
  uint64_t v2;
  CKDTokenRegistrationScheduler *tokenRegistrationScheduler;
  void *v7;
  const char *v8;

  tokenRegistrationScheduler = self->_tokenRegistrationScheduler;
  if (!tokenRegistrationScheduler)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, v2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v7, v8, (uint64_t)a2, self, CFSTR("CKDLogicalDeviceContext.m"), 245, CFSTR("Detached test servers don't have token registration schedulers"));

    tokenRegistrationScheduler = self->_tokenRegistrationScheduler;
  }
  return tokenRegistrationScheduler;
}

- (int64_t)pushBehavior
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;
  int64_t v8;

  objc_msgSend_testDevice(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v3;
  if (v3)
  {
    v7 = objc_msgSend_pushBehavior(v3, v4, v5);
    if (v7 >= 3)
      v8 = 1;
    else
      v8 = v7;
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (BOOL)isLiveDevice
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  char isEqualToString;

  objc_msgSend_testDeviceReference(self, a2, v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend_testDeviceReference(self, v4, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_deviceID(v7, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    isEqualToString = objc_msgSend_isEqualToString_(v10, v11, (uint64_t)CFSTR("__live_device__"));

  }
  else
  {
    isEqualToString = 1;
  }

  return isEqualToString;
}

- (id)deviceScopedPushTopic:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  void *v25;

  v4 = a3;
  objc_msgSend_pushBehavior(self, v5, v6);
  objc_msgSend_testDeviceReference(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deviceID(v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_testDeviceReference(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_serverReferenceProtocol(v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dataDirectory(v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_path(v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  CKPushTopicForPushBehavior();
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

+ (id)existingDefaultContext
{
  id v2;

  os_unfair_lock_lock((os_unfair_lock_t)&unk_1ED702C28);
  v2 = (id)qword_1ED702C30;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1ED702C28);
  return v2;
}

- (id)pcsCacheForContainerID:(id)a3 accountOverrideInfo:(id)a4 accountID:(id)a5 encryptionServiceName:(id)a6
{
  uint64_t isEqual;
  id v11;
  id v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  id v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  id v37;
  const char *v38;
  int v39;
  const char *v40;
  uint64_t v41;
  id v42;
  const char *v43;
  int v44;
  const char *v45;
  uint64_t v46;
  id v47;
  const char *v48;
  int v49;
  NSObject *v50;
  CKDPCSCache *v51;
  const char *v52;
  id v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  char v58;
  NSObject *v59;
  CKDPCSCache *v60;
  const char *v61;
  NSObject *v62;
  id obj;
  CKDLogicalDeviceContext *v65;
  id v66;
  id v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  uint8_t buf[4];
  id v73;
  __int16 v74;
  void *v75;
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v67 = a5;
  v65 = self;
  v66 = a6;
  objc_msgSend_sharedPcsCaches(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v59 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      v73 = v11;
      _os_log_debug_impl(&dword_1BE990000, v59, OS_LOG_TYPE_DEBUG, "%{public}@ creating pcsCache", buf, 0xCu);
    }
    v60 = [CKDPCSCache alloc];
    v53 = (id)objc_msgSend_initWithDeviceContext_containerID_accountOverrideInfo_accountID_encryptionServiceName_(v60, v61, (uint64_t)v65, v11, v12, v67, v66);
LABEL_41:
    v53 = v53;
    isEqual = (uint64_t)v53;
    goto LABEL_42;
  }
  objc_msgSend_sharedPcsCaches(v65, v16, v17);
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  objc_msgSend_sharedPcsCaches(v65, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allObjects(v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v24 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    v73 = v11;
    _os_log_debug_impl(&dword_1BE990000, v24, OS_LOG_TYPE_DEBUG, "%{public}@ searching for eligible existing pcsCache", buf, 0xCu);
  }
  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  v25 = v23;
  v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v26, (uint64_t)&v68, v76, 16);
  if (v29)
  {
    v30 = *(_QWORD *)v69;
LABEL_8:
    v31 = 0;
    while (1)
    {
      if (*(_QWORD *)v69 != v30)
        objc_enumerationMutation(v25);
      v32 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * v31);
      objc_msgSend_containerID(v32, v27, v28, obj);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      isEqual = objc_msgSend_isEqual_(v33, v34, (uint64_t)v11);

      if ((isEqual & 1) == 0)
        goto LABEL_22;
      objc_msgSend_accountOverrideInfo(v32, v27, v28);
      v37 = (id)objc_claimAutoreleasedReturnValue();
      if (v37 == v12)
      {

      }
      else
      {
        objc_msgSend_accountOverrideInfo(v32, v35, v36);
        isEqual = objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend_isEqual_((void *)isEqual, v38, (uint64_t)v12);

        if (!v39)
          goto LABEL_22;
      }
      objc_msgSend_accountID(v32, v27, v28);
      v42 = (id)objc_claimAutoreleasedReturnValue();
      if (v42 == v67)
      {

LABEL_20:
        objc_msgSend_encryptionServiceName(v32, v27, v28);
        v47 = (id)objc_claimAutoreleasedReturnValue();
        if (v47 == v66)
        {

LABEL_35:
          if (*MEMORY[0x1E0C95300] != -1)
            dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
          v62 = *MEMORY[0x1E0C952B0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138543618;
            v73 = v11;
            v74 = 2114;
            v75 = v32;
            _os_log_debug_impl(&dword_1BE990000, v62, OS_LOG_TYPE_DEBUG, "%{public}@ found existing pcsCache %{public}@", buf, 0x16u);
          }
          isEqual = v32;
          v58 = 0;
          v53 = 0;
          v56 = v25;
          goto LABEL_40;
        }
        objc_msgSend_encryptionServiceName(v32, v45, v46);
        isEqual = objc_claimAutoreleasedReturnValue();
        v49 = objc_msgSend_isEqual_((void *)isEqual, v48, (uint64_t)v66);

        if (v49)
          goto LABEL_35;
        goto LABEL_22;
      }
      objc_msgSend_accountID(v32, v40, v41);
      isEqual = objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend_isEqual_((void *)isEqual, v43, (uint64_t)v67);

      if (v44)
        goto LABEL_20;
LABEL_22:
      if (v29 == ++v31)
      {
        v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v27, (uint64_t)&v68, v76, 16);
        if (v29)
          goto LABEL_8;
        break;
      }
    }
  }

  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v50 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    v73 = v11;
    _os_log_debug_impl(&dword_1BE990000, v50, OS_LOG_TYPE_DEBUG, "%{public}@ creating pcsCache", buf, 0xCu);
  }
  v51 = [CKDPCSCache alloc];
  v53 = (id)objc_msgSend_initWithDeviceContext_containerID_accountOverrideInfo_accountID_encryptionServiceName_(v51, v52, (uint64_t)v65, v11, v12, v67, v66);
  objc_msgSend_sharedPcsCaches(v65, v54, v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v56, v57, (uint64_t)v53);
  v58 = 1;
LABEL_40:

  objc_sync_exit(obj);
  if ((v58 & 1) != 0)
    goto LABEL_41;
LABEL_42:

  return (id)isEqual;
}

- (void)clearPCSMemoryCaches
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  id obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  objc_msgSend_sharedPcsCaches(self, a2, v2);
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  objc_msgSend_sharedPcsCaches(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v29, v41, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v30;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v30 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v10);
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v12 = (id)*MEMORY[0x1E0C952B0];
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend_containerID(v11, v13, v14);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_accountOverrideInfo(v11, v19, v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_accountID(v11, v22, v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_encryptionServiceName(v11, v25, v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v34 = v18;
          v35 = 2114;
          v36 = v21;
          v37 = 2112;
          v38 = v24;
          v39 = 2114;
          v40 = v27;
          _os_log_debug_impl(&dword_1BE990000, v12, OS_LOG_TYPE_DEBUG, "Clearing in-memory PCS cache for containerID %{public}@, accountOverrideInfo %{public}@, accountID %@, encryptionServiceName %{public}@", buf, 0x2Au);

        }
        objc_msgSend_clearPCSMemoryCaches(v11, v15, v16);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v17, (uint64_t)&v29, v41, 16);
    }
    while (v8);
  }

  objc_sync_exit(obj);
}

- (id)_initWithTestDeviceReference:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  CKDLogicalDeviceContext *v10;
  CKDLogicalDeviceContext *v11;
  CKDAccountDataSecurityObserver *v12;
  const char *v13;
  uint64_t v14;
  CKDAccountDataSecurityObserver *accountDataSecurityObserver;
  const char *v16;
  uint64_t v17;
  void *v18;
  id v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  char isEqual;
  CKDMetadataCache *v25;
  const char *v26;
  uint64_t v27;
  CKDMetadataCache *metadataCache;
  CKDOperationInfoCache *v29;
  const char *v30;
  uint64_t v31;
  CKDOperationInfoCache *operationInfoCache;
  CKDTokenRegistrationScheduler *v33;
  const char *v34;
  uint64_t v35;
  CKDTokenRegistrationScheduler *tokenRegistrationScheduler;
  CKDThrottleManager *v37;
  const char *v38;
  uint64_t v39;
  CKDThrottleManager *throttleManager;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  NSHashTable *sharedPcsCaches;
  objc_super v46;

  v5 = a3;
  objc_msgSend_sharedMonitor(CKDSystemAvailabilityMonitor, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_assertAvailability_(v8, v9, 2);

  v46.receiver = self;
  v46.super_class = (Class)CKDLogicalDeviceContext;
  v10 = -[CKDLogicalDeviceContext init](&v46, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_testDeviceReference, a3);
    v12 = [CKDAccountDataSecurityObserver alloc];
    v14 = objc_msgSend_initWithDeviceContext_(v12, v13, (uint64_t)v11);
    accountDataSecurityObserver = v11->_accountDataSecurityObserver;
    v11->_accountDataSecurityObserver = (CKDAccountDataSecurityObserver *)v14;

    if (!v5)
      goto LABEL_4;
    objc_msgSend_serverReferenceProtocol(v5, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = sub_1BEABE374();
    objc_msgSend_detachedTestServerReference(v19, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    isEqual = objc_msgSend_isEqual_(v18, v23, (uint64_t)v22);

    if ((isEqual & 1) == 0)
    {
LABEL_4:
      v25 = [CKDMetadataCache alloc];
      v27 = objc_msgSend_initWithDeviceContext_(v25, v26, (uint64_t)v11);
      metadataCache = v11->_metadataCache;
      v11->_metadataCache = (CKDMetadataCache *)v27;

      v29 = [CKDOperationInfoCache alloc];
      v31 = objc_msgSend_initWithDeviceContext_(v29, v30, (uint64_t)v11);
      operationInfoCache = v11->_operationInfoCache;
      v11->_operationInfoCache = (CKDOperationInfoCache *)v31;

      v33 = [CKDTokenRegistrationScheduler alloc];
      v35 = objc_msgSend_initWithDeviceContext_(v33, v34, (uint64_t)v11);
      tokenRegistrationScheduler = v11->_tokenRegistrationScheduler;
      v11->_tokenRegistrationScheduler = (CKDTokenRegistrationScheduler *)v35;

      v37 = [CKDThrottleManager alloc];
      v39 = objc_msgSend_initWithDeviceContext_(v37, v38, (uint64_t)v11);
      throttleManager = v11->_throttleManager;
      v11->_throttleManager = (CKDThrottleManager *)v39;

      objc_msgSend_weakObjectsHashTable(MEMORY[0x1E0CB3690], v41, v42);
      v43 = objc_claimAutoreleasedReturnValue();
      sharedPcsCaches = v11->_sharedPcsCaches;
      v11->_sharedPcsCaches = (NSHashTable *)v43;

    }
  }

  return v11;
}

- (NSURL)cacheDirectory
{
  uint64_t v2;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  id v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  int isEqual;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  void *v25;
  void *v26;
  const char *v27;
  void *v29;
  const char *v30;

  objc_msgSend_testDeviceReference(self, a2, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend_testDeviceReference(self, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_serverReferenceProtocol(v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = sub_1BEABE374();
    objc_msgSend_detachedTestServerReference(v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    isEqual = objc_msgSend_isEqual_(v11, v16, (uint64_t)v15);

    if (isEqual)
    {
      objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v18, v19);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v29, v30, (uint64_t)a2, self, CFSTR("CKDLogicalDeviceContext.m"), 206, CFSTR("Detached test servers don't have a filesystem presence"));

    }
    objc_msgSend_testDevice(self, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_deviceDirectory(v20, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_URLByAppendingPathComponent_isDirectory_(v23, v24, (uint64_t)CFSTR("CloudKitCaches"), 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v26 = (void *)MEMORY[0x1E0C99E98];
    CKGetHomeCacheDir();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_fileURLWithPath_isDirectory_(v26, v27, (uint64_t)v20, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSURL *)v25;
}

- (CKSQLiteDatabase)deviceScopedDatabase
{
  uint64_t v2;
  void *v3;
  const char *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  void *v10;
  id v11;
  const char *v12;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  const char *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend_cacheDirectory(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_URLByAppendingPathComponent_(v3, v4, (uint64_t)CFSTR("cloudd_db"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_path(v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = 0;
  objc_msgSend_databaseInDirectory_registryDatabase_options_error_(MEMORY[0x1E0C950E8], v9, (uint64_t)v8, 0, 8, &v28);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v28;
  if (v11)
  {
    v27 = v11;
    if ((objc_msgSend_CKIsDiskFullError_(MEMORY[0x1E0CB35C8], v12, (uint64_t)v11) & 1) != 0)
      goto LABEL_6;
    objc_msgSend_domain(v27, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend_isEqual_(v16, v17, *MEMORY[0x1E0CB28A8]) & 1) != 0)
    {
      v20 = objc_msgSend_code(v27, v18, v19);

      if (v20 == 640)
      {
LABEL_6:
        if (*MEMORY[0x1E0C95300] == -1)
          goto LABEL_7;
        goto LABEL_16;
      }
    }
    else
    {

    }
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v22 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v30 = v27;
      _os_log_error_impl(&dword_1BE990000, v22, OS_LOG_TYPE_ERROR, "failed to create database: %@", buf, 0xCu);
    }
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v23, (uint64_t)CFSTR("failed to create database: %@"), v27);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_UTF8String(v24, v25, v26);
    _os_crash();
    __break(1u);
LABEL_16:
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
LABEL_7:
    v21 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v30 = v27;
      _os_log_error_impl(&dword_1BE990000, v21, OS_LOG_TYPE_ERROR, "-deviceScopedDatabase failed due to disk full. Cloudd will now exit. error = %{public}@", buf, 0xCu);
    }
    exit(1);
  }

  return (CKSQLiteDatabase *)v10;
}

- (CKDOperationInfoCache)operationInfoCache
{
  uint64_t v2;
  CKDOperationInfoCache *operationInfoCache;
  void *v7;
  const char *v8;

  operationInfoCache = self->_operationInfoCache;
  if (!operationInfoCache)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, v2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v7, v8, (uint64_t)a2, self, CFSTR("CKDLogicalDeviceContext.m"), 230, CFSTR("Detached test servers don't have operation info caches"));

    operationInfoCache = self->_operationInfoCache;
  }
  return operationInfoCache;
}

- (CKDLogicalDeviceScopedStateManager)deviceScopedStateManager
{
  CKDLogicalDeviceContext *v2;
  void *WeakRetained;
  CKDLogicalDeviceScopedStateManager *v4;
  const char *v5;

  v2 = self;
  objc_sync_enter(v2);
  WeakRetained = objc_loadWeakRetained((id *)&v2->_deviceScopedStateManager);
  if (!WeakRetained)
  {
    v4 = [CKDLogicalDeviceScopedStateManager alloc];
    WeakRetained = (void *)objc_msgSend_initWithDeviceContext_(v4, v5, (uint64_t)v2);
    objc_storeWeak((id *)&v2->_deviceScopedStateManager, WeakRetained);
  }
  objc_sync_exit(v2);

  return (CKDLogicalDeviceScopedStateManager *)WeakRetained;
}

- (void)setAccountDataSecurityObserver:(id)a3
{
  objc_storeStrong((id *)&self->_accountDataSecurityObserver, a3);
}

- (NSHashTable)sharedPcsCaches
{
  return self->_sharedPcsCaches;
}

- (void)setSharedPcsCaches:(id)a3
{
  objc_storeStrong((id *)&self->_sharedPcsCaches, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedPcsCaches, 0);
  objc_storeStrong((id *)&self->_testDeviceReference, 0);
  objc_storeStrong((id *)&self->_accountDataSecurityObserver, 0);
  objc_storeStrong((id *)&self->_tokenRegistrationScheduler, 0);
  objc_destroyWeak((id *)&self->_deviceScopedStateManager);
  objc_storeStrong((id *)&self->_throttleManager, 0);
  objc_storeStrong((id *)&self->_operationInfoCache, 0);
  objc_storeStrong((id *)&self->_metadataCache, 0);
  objc_storeStrong((id *)&self->_testServer, 0);
}

@end
