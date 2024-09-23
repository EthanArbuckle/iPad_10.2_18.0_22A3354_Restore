@implementation CKDServerConfigurationManager

- (CKDServerConfiguration)globalConfiguration
{
  return self->_globalConfiguration;
}

- (void)configurationForOperation:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  CKDServerConfigurationManager *v19;
  id v20;
  id v21;

  v6 = a3;
  v7 = a4;
  objc_msgSend_qualityOfService(v6, v8, v9);
  CKGetGlobalQueue();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_propertyQueue(self, v11, v12);
  v13 = objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = sub_1BE997494;
  v17[3] = &unk_1E7836210;
  v18 = v6;
  v19 = self;
  v20 = v10;
  v21 = v7;
  v14 = v10;
  v15 = v7;
  v16 = v6;
  dispatch_async(v13, v17);

}

- (OS_dispatch_queue)propertyQueue
{
  return self->_propertyQueue;
}

+ (id)sharedManager
{
  if (qword_1ED702B00 != -1)
    dispatch_once(&qword_1ED702B00, &unk_1E78360A8);
  return (id)qword_1ED702AF8;
}

- (NSMutableDictionary)containerSpecificInfos
{
  return self->_containerSpecificInfos;
}

- (void)containerServerInfoForOperation:(id)a3 requireUserIDs:(BOOL)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  void *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  NSObject *v20;
  id v21;
  NSObject *v22;
  _QWORD block[5];
  id v24;
  id v25;
  id v26;
  NSObject *v27;
  id v28;
  BOOL v29;
  _QWORD v30[4];
  id v31;
  id v32;
  uint8_t buf[4];
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  objc_msgSend_qualityOfService(v8, v10, v11);
  CKGetGlobalQueue();
  v12 = objc_claimAutoreleasedReturnValue();
  objc_msgSend_container(v8, v13, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    objc_msgSend__uniqueStringForContainer_(self, v15, (uint64_t)v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_propertyQueue(self, v18, v19);
    v20 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1BE9C00E0;
    block[3] = &unk_1E7836260;
    block[4] = self;
    v24 = v17;
    v25 = v16;
    v26 = v8;
    v29 = a4;
    v28 = v9;
    v27 = v12;
    v21 = v17;
    dispatch_async(v20, block);

LABEL_8:
    goto LABEL_9;
  }
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v22 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138412290;
    v34 = v8;
    _os_log_fault_impl(&dword_1BE990000, v22, OS_LOG_TYPE_FAULT, "Failed to get server info for container, operation unexpectedly missing container: %@ ", buf, 0xCu);
    if (!v9)
      goto LABEL_9;
    goto LABEL_7;
  }
  if (v9)
  {
LABEL_7:
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = sub_1BE9C0480;
    v30[3] = &unk_1E782F4D0;
    v31 = v8;
    v32 = v9;
    dispatch_async(v12, v30);

    v21 = v31;
    goto LABEL_8;
  }
LABEL_9:

}

- (id)_uniqueStringForContainer:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  __CFString *v16;
  __CFString *v17;
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
  const char *v28;
  void *v29;

  v3 = a3;
  objc_msgSend_containerID(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_account(v3, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deviceContext(v3, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_testDeviceReference(v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = CFSTR("UnitTest");
  if (!v15)
    v16 = CFSTR("Default");
  v17 = v16;

  v18 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_accountID(v9, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_containerIdentifier(v6, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_environment(v6, v25, v26);
  CKContainerEnvironmentString();
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v18, v28, (uint64_t)CFSTR("%@-%@-%@-%@"), v21, v24, v27, v17);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

- (BOOL)systemAvailabilityChanged:(unint64_t)a3
{
  char v3;
  const char *v5;
  uint64_t v6;

  v3 = a3;
  if ((a3 & 2) != 0 && objc_msgSend_shouldDropAllConfigurations(self, a2, a3))
    objc_msgSend__reallyDropAllConfigurations(self, v5, v6);
  return (v3 & 2) == 0;
}

- (CKDServerConfigurationManager)init
{
  CKDServerConfigurationManager *v2;
  uint64_t v3;
  NSOperationQueue *configurationQueue;
  uint64_t v5;
  NSMutableSet *globalConfigurationOps;
  uint64_t v7;
  NSOperationQueue *containerSpecificInfoQueue;
  uint64_t v9;
  NSMutableDictionary *containerSpecificInfos;
  uint64_t v11;
  NSMutableDictionary *containerSpecificInfoOperations;
  const char *v13;
  uint64_t v14;
  const char *v15;
  NSObject *v16;
  dispatch_queue_t v17;
  OS_dispatch_queue *notificationQueue;
  objc_class *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  NSObject *v24;
  dispatch_queue_t v25;
  OS_dispatch_queue *propertyQueue;
  void *v27;
  const char *v28;
  uint64_t v29;
  NSObject *v30;
  uint32_t v31;
  int v32;
  int out_token;
  _QWORD aBlock[4];
  id v36;
  id location;
  objc_super v38;

  v38.receiver = self;
  v38.super_class = (Class)CKDServerConfigurationManager;
  v2 = -[CKDServerConfigurationManager init](&v38, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    configurationQueue = v2->_configurationQueue;
    v2->_configurationQueue = (NSOperationQueue *)v3;

    v5 = objc_opt_new();
    globalConfigurationOps = v2->_globalConfigurationOps;
    v2->_globalConfigurationOps = (NSMutableSet *)v5;

    v7 = objc_opt_new();
    containerSpecificInfoQueue = v2->_containerSpecificInfoQueue;
    v2->_containerSpecificInfoQueue = (NSOperationQueue *)v7;

    v9 = objc_opt_new();
    containerSpecificInfos = v2->_containerSpecificInfos;
    v2->_containerSpecificInfos = (NSMutableDictionary *)v9;

    v11 = objc_opt_new();
    containerSpecificInfoOperations = v2->_containerSpecificInfoOperations;
    v2->_containerSpecificInfoOperations = (NSMutableDictionary *)v11;

    v15 = (const char *)objc_msgSend_UTF8String(CFSTR("com.apple.cloudkit.CKDServerConfigurationManager.notificationQueue"), v13, v14);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = dispatch_queue_create(v15, v16);
    notificationQueue = v2->_notificationQueue;
    v2->_notificationQueue = (OS_dispatch_queue *)v17;

    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (const char *)objc_msgSend_UTF8String(v20, v21, v22);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = dispatch_queue_create(v23, v24);
    propertyQueue = v2->_propertyQueue;
    v2->_propertyQueue = (OS_dispatch_queue *)v25;

    objc_initWeak(&location, v2);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = sub_1BEBA8398;
    aBlock[3] = &unk_1E7836088;
    objc_copyWeak(&v36, &location);
    v27 = _Block_copy(aBlock);
    out_token = -1;
    objc_msgSend_notificationQueue(v2, v28, v29);
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = notify_register_dispatch("com.apple.setmme.dnschanged", &out_token, v30, v27);

    v32 = out_token;
    if (v31)
      v32 = -1;
    v2->_iCloudEnvNotifToken = v32;

    objc_destroyWeak(&v36);
    objc_destroyWeak(&location);

  }
  return v2;
}

- (void)dealloc
{
  int iCloudEnvNotifToken;
  objc_super v4;

  iCloudEnvNotifToken = self->_iCloudEnvNotifToken;
  if (iCloudEnvNotifToken != -1)
    notify_cancel(iCloudEnvNotifToken);
  v4.receiver = self;
  v4.super_class = (Class)CKDServerConfigurationManager;
  -[CKDServerConfigurationManager dealloc](&v4, sel_dealloc);
}

- (void)_fetchGlobalConfigForOperation:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  const char *v16;
  id v17;
  uint64_t v18;
  void *i;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  NSObject *v29;
  const char *v30;
  uint64_t v31;
  NSObject *v32;
  const char *v33;
  uint64_t v34;
  NSObject *v35;
  id v36;
  id v37;
  id v38;
  uint64_t v39;
  _QWORD v40[4];
  id v41;
  CKDServerConfigurationManager *v42;
  id v43;
  id v44;
  __int128 *v45;
  _QWORD v46[5];
  id v47;
  __int128 *p_buf;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t v53[4];
  uint64_t v54;
  __int16 v55;
  id v56;
  __int128 buf;
  uint64_t v58;
  uint64_t (*v59)(uint64_t, uint64_t);
  void (*v60)(uint64_t);
  id v61;
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v8 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = v6;
    _os_log_debug_impl(&dword_1BE990000, v8, OS_LOG_TYPE_DEBUG, "Fetching Global Configuration for operation %p", (uint8_t *)&buf, 0xCu);
  }
  objc_msgSend_qualityOfService(v6, v9, v10);
  CKGetGlobalQueue();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  objc_msgSend_globalConfigurationOps(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v49, v62, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v50;
    while (2)
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(_QWORD *)v50 != v18)
          objc_enumerationMutation(v14);
        v20 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend_isNetworkingBehaviorEquivalentForOperation_(v20, v16, (uint64_t)v6))
        {
          v17 = v20;
          goto LABEL_15;
        }
      }
      v17 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v16, (uint64_t)&v49, v62, 16);
      if (v17)
        continue;
      break;
    }
  }
LABEL_15:

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v58 = 0x3032000000;
  v59 = sub_1BE9BB108;
  v60 = sub_1BE9BAE38;
  v21 = v17;
  v61 = v21;
  v22 = MEMORY[0x1E0C809B0];
  if (!v21)
  {
    v23 = (void *)objc_opt_new();
    v24 = objc_opt_class();
    objc_msgSend_configurationQueue(self, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = v22;
    v46[1] = 3221225472;
    v46[2] = sub_1BEBA8864;
    v46[3] = &unk_1E78360D0;
    p_buf = &buf;
    v46[4] = self;
    v47 = v11;
    objc_msgSend_spawnAndRunOperationOfClass_operationInfo_spawnQueue_operationConfigurationBlock_(v6, v28, v24, v23, v27, v46);

  }
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v29 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    v39 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
    *(_DWORD *)v53 = 134218240;
    v54 = v39;
    v55 = 2048;
    v56 = v6;
    _os_log_debug_impl(&dword_1BE990000, v29, OS_LOG_TYPE_DEBUG, "Waiting on global configuration operation %p for operation %p", v53, 0x16u);
  }
  objc_msgSend_configurationFetchedGroup(*(void **)(*((_QWORD *)&buf + 1) + 40), v30, v31);
  v32 = objc_claimAutoreleasedReturnValue();
  objc_msgSend_propertyQueue(self, v33, v34);
  v35 = objc_claimAutoreleasedReturnValue();
  v40[0] = v22;
  v40[1] = 3221225472;
  v40[2] = sub_1BEBA8EB0;
  v40[3] = &unk_1E78360F8;
  v44 = v7;
  v45 = &buf;
  v41 = v6;
  v42 = self;
  v43 = v11;
  v36 = v11;
  v37 = v7;
  v38 = v6;
  dispatch_group_notify(v32, v35, v40);

  _Block_object_dispose(&buf, 8);
}

- (void)_fetchContainerSpecificInfoForOperation:(id)a3 requireUserIDs:(BOOL)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  void *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  id v27;
  const char *v28;
  uint64_t v29;
  id v30;
  void *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  NSObject *v37;
  const char *v38;
  uint64_t v39;
  NSObject *v40;
  SEL v41;
  dispatch_queue_t queue;
  _QWORD block[5];
  id v45;
  NSObject *v46;
  id v47;
  uint64_t *v48;
  BOOL v49;
  _QWORD v50[5];
  id v51;
  id v52;
  NSObject *v53;
  uint64_t *v54;
  SEL v55;
  BOOL v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  id v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _QWORD v67[4];
  id v68;
  id v69;
  _BYTE v70[128];
  uint64_t v71;

  v41 = a2;
  v71 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  objc_msgSend_qualityOfService(v7, v9, v10);
  CKGetGlobalQueue();
  queue = (dispatch_queue_t)objc_claimAutoreleasedReturnValue();
  objc_msgSend_container(v7, v11, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend__uniqueStringForContainer_(self, v13, (uint64_t)v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = 0u;
    v66 = 0u;
    v63 = 0u;
    v64 = 0u;
    objc_msgSend_containerSpecificInfoOperations(self, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v18, v19, (uint64_t)v15);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v21, (uint64_t)&v63, v70, 16);
    if (v23)
    {
      v24 = *(_QWORD *)v64;
      while (2)
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v64 != v24)
            objc_enumerationMutation(v20);
          v26 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * i);
          if (objc_msgSend_isNetworkingBehaviorEquivalentForOperation_(v26, v22, (uint64_t)v7, v41))
          {
            v27 = v26;
            goto LABEL_12;
          }
        }
        v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v22, (uint64_t)&v63, v70, 16);
        if (v23)
          continue;
        break;
      }
    }
    v27 = 0;
LABEL_12:

    v57 = 0;
    v58 = &v57;
    v59 = 0x3032000000;
    v60 = sub_1BE9BB108;
    v61 = sub_1BE9BAE38;
    v30 = v27;
    v62 = v30;
    if (!v30)
    {
      v31 = (void *)objc_opt_new();
      v32 = objc_opt_class();
      objc_msgSend_containerSpecificInfoQueue(self, v33, v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v50[0] = MEMORY[0x1E0C809B0];
      v50[1] = 3221225472;
      v50[2] = sub_1BEBA94F8;
      v50[3] = &unk_1E7836170;
      v56 = a4;
      v54 = &v57;
      v50[4] = self;
      v51 = v14;
      v55 = v41;
      v52 = v15;
      v53 = queue;
      objc_msgSend_spawnAndRunOperationOfClass_operationInfo_spawnQueue_operationConfigurationBlock_(v7, v36, v32, v31, v35, v50);

    }
    if (v8)
    {
      objc_msgSend_infoFetchedGroup((void *)v58[5], v28, v29);
      v37 = objc_claimAutoreleasedReturnValue();
      objc_msgSend_propertyQueue(self, v38, v39);
      v40 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = sub_1BEBA9FBC;
      block[3] = &unk_1E78361C0;
      block[4] = self;
      v45 = v15;
      v49 = a4;
      v46 = queue;
      v47 = v8;
      v48 = &v57;
      dispatch_group_notify(v37, v40, block);

    }
    _Block_object_dispose(&v57, 8);

    goto LABEL_19;
  }
  if (v8)
  {
    v67[0] = MEMORY[0x1E0C809B0];
    v67[1] = 3221225472;
    v67[2] = sub_1BEBA9488;
    v67[3] = &unk_1E782EC68;
    v69 = v8;
    v68 = v7;
    dispatch_async(queue, v67);

    v15 = v69;
LABEL_19:

  }
}

- (void)_reallyDropAllConfigurations
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  NSObject *v6;
  _QWORD block[5];
  uint8_t buf[16];

  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v3 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE990000, v3, OS_LOG_TYPE_INFO, "Warn: Dropping all config bags and forcing a re-fetch of our config.", buf, 2u);
  }
  objc_msgSend_propertyQueue(self, v4, v5);
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BEBAA5A4;
  block[3] = &unk_1E782EA40;
  block[4] = self;
  dispatch_sync(v6, block);

}

- (void)wipeAllConfigurations
{
  const char *v3;
  uint64_t v4;
  const char *v5;
  id v6;

  objc_msgSend_setShouldDropAllConfigurations_(self, a2, 1);
  objc_msgSend_sharedMonitor(CKDSystemAvailabilityMonitor, v3, v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_registerWatcher_(v6, v5, (uint64_t)self);

}

- (void)_writeOutiCloudAppSiteAssociationData:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  void *v20;
  id v21;
  const char *v22;
  const char *v23;
  void *v24;
  NSObject *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  char isEqualToDictionary;
  NSObject *v31;
  NSObject *v32;
  const char *v33;
  void *v34;
  void *v35;
  const char *v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  uint64_t v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend_count(v3, v4, v5))
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v37 = v3;
    v7 = v3;
    v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v38, v44, 16);
    if (v9)
    {
      v11 = v9;
      v12 = *(_QWORD *)v39;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v39 != v12)
            objc_enumerationMutation(v7);
          v14 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * v13);
          objc_msgSend_objectForKeyedSubscript_(v7, v10, v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_whitespaceAndNewlineCharacterSet(MEMORY[0x1E0CB3500], v16, v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_stringByTrimmingCharactersInSet_(v15, v19, (uint64_t)v18);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          v21 = objc_alloc(MEMORY[0x1E0C99D50]);
          v24 = (void *)objc_msgSend_initWithBase64EncodedString_options_(v21, v22, (uint64_t)v20, 1);
          if (v24)
          {
            objc_msgSend_setObject_forKeyedSubscript_(v6, v23, (uint64_t)v24, v14);
          }
          else
          {
            if (*MEMORY[0x1E0C95300] != -1)
              dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
            v25 = *MEMORY[0x1E0C952B0];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v43 = v14;
              _os_log_debug_impl(&dword_1BE990000, v25, OS_LOG_TYPE_DEBUG, "Could not get app site association data for hostname %@", buf, 0xCu);
            }
          }

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v38, v44, 16);
      }
      while (v11);
    }

    if (objc_msgSend_count(v6, v26, v27)
      && (sub_1BEC100AC(),
          v28 = (void *)objc_claimAutoreleasedReturnValue(),
          isEqualToDictionary = objc_msgSend_isEqualToDictionary_(v6, v29, (uint64_t)v28),
          v28,
          (isEqualToDictionary & 1) == 0))
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v3 = v37;
      v32 = *MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v43 = (uint64_t)v6;
        _os_log_debug_impl(&dword_1BE990000, v32, OS_LOG_TYPE_DEBUG, "Registering valid app site association data with LS: %@", buf, 0xCu);
      }
      v34 = (void *)MEMORY[0x1E0D96E48];
      objc_msgSend_setWithObject_(MEMORY[0x1E0C99E60], v33, (uint64_t)CFSTR("com.apple.CloudKit.ShareBear"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setAdditionalServiceDetailsForApplicationIdentifiers_usingContentsOfDictionary_completionHandler_(v34, v36, (uint64_t)v35, v6, &unk_1E78362A0);

    }
    else
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v3 = v37;
      v31 = *MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v43 = (uint64_t)v6;
        _os_log_debug_impl(&dword_1BE990000, v31, OS_LOG_TYPE_DEBUG, "Found ineligible or unchanged app site association data, not registering with LS: %@", buf, 0xCu);
      }
    }

  }
}

- (void)setGlobalConfiguration:(id)a3
{
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  id v15;

  v15 = a3;
  objc_storeStrong((id *)&self->_globalConfiguration, a3);
  objc_msgSend_iCloudAppSiteAssociationData(v15, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_count(v7, v8, v9);

  if (v10)
  {
    objc_msgSend_iCloudAppSiteAssociationData(v15, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__writeOutiCloudAppSiteAssociationData_(self, v14, (uint64_t)v13);

  }
}

- (void)expireGlobalConfiguration
{
  uint64_t v2;
  NSObject *v4;
  _QWORD block[5];

  objc_msgSend_propertyQueue(self, a2, v2);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BEBAAC3C;
  block[3] = &unk_1E782EA40;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)expireConfigurationForContainer:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  objc_msgSend_propertyQueue(self, v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1BEBAACE0;
  v9[3] = &unk_1E782EE20;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_async(v7, v9);

}

- (id)lastKnownServerConfiguration
{
  uint64_t v2;
  NSObject *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = sub_1BE9BB108;
  v12 = sub_1BE9BAE38;
  v13 = 0;
  objc_msgSend_propertyQueue(self, a2, v2);
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1BEBAAFD8;
  v7[3] = &unk_1E78303D8;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (id)CKStatusReportArray
{
  void *v3;
  const char *v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  id v12;

  v3 = (void *)objc_opt_new();
  objc_msgSend_propertyQueue(self, v4, v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_1BEBAB0C4;
  v11[3] = &unk_1E782EE20;
  v11[4] = self;
  v7 = v3;
  v12 = v7;
  dispatch_sync(v6, v11);

  v8 = v12;
  v9 = v7;

  return v9;
}

- (NSOperationQueue)configurationQueue
{
  return self->_configurationQueue;
}

- (OS_dispatch_queue)notificationQueue
{
  return self->_notificationQueue;
}

- (NSMutableSet)globalConfigurationOps
{
  return self->_globalConfigurationOps;
}

- (NSOperationQueue)containerSpecificInfoQueue
{
  return self->_containerSpecificInfoQueue;
}

- (void)setContainerSpecificInfos:(id)a3
{
  objc_storeStrong((id *)&self->_containerSpecificInfos, a3);
}

- (NSMutableDictionary)containerSpecificInfoOperations
{
  return self->_containerSpecificInfoOperations;
}

- (int)iCloudEnvNotifToken
{
  return self->_iCloudEnvNotifToken;
}

- (BOOL)shouldDropAllConfigurations
{
  return self->_shouldDropAllConfigurations;
}

- (void)setShouldDropAllConfigurations:(BOOL)a3
{
  self->_shouldDropAllConfigurations = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertyQueue, 0);
  objc_storeStrong((id *)&self->_containerSpecificInfoOperations, 0);
  objc_storeStrong((id *)&self->_containerSpecificInfos, 0);
  objc_storeStrong((id *)&self->_containerSpecificInfoQueue, 0);
  objc_storeStrong((id *)&self->_globalConfigurationOps, 0);
  objc_storeStrong((id *)&self->_globalConfiguration, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_configurationQueue, 0);
}

@end
