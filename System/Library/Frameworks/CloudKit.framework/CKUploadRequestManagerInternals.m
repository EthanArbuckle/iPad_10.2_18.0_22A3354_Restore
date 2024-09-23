@implementation CKUploadRequestManagerInternals

- (double)recurringFetchPeriod
{
  double result;

  result = self->_recurringFetchPeriod;
  if (result == -1.0)
    return 604800.0;
  return result;
}

- (double)tryAgainLaterRetryTime
{
  double result;

  result = self->_tryAgainLaterRetryTime;
  if (result == -1.0)
    return 604800.0;
  return result;
}

- (double)retryableErrorRetryTime
{
  double result;

  result = self->_retryableErrorRetryTime;
  if (result == -1.0)
    return 259200.0;
  return result;
}

- (double)cancelledErrorRetryTime
{
  double result;

  result = self->_cancelledErrorRetryTime;
  if (result == -1.0)
    return 86400.0;
  return result;
}

- (double)retryableErrorMaxRetryCount
{
  double result;

  result = self->_retryableErrorMaxRetryCount;
  if (result == -1.0)
    return 10.0;
  return result;
}

- (double)notificationDebouncePeriod
{
  double result;

  result = self->_notificationDebouncePeriod;
  if (result == -1.0)
    return 0.2;
  return result;
}

- (CKUploadRequestManagerInternals)initWithContainer:(id)a3 repairContainerOverrides:(id)a4
{
  id v6;
  id v7;
  CKUploadRequestManagerInternals *v8;
  const char *v9;
  CKUploadRequestManagerInternals *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CKUploadRequestManagerInternals;
  v8 = -[CKUploadRequestManagerInternals init](&v12, sel_init);
  v10 = v8;
  if (v8)
    objc_msgSend_commonInitWithContainer_repairContainerOverrides_(v8, v9, (uint64_t)v6, (uint64_t)v7);

  return v10;
}

- (CKUploadRequestManagerInternals)initWithContainer:(id)a3 repairContainerOverrides:(id)a4 ignoringSystemConditions:(BOOL)a5
{
  id v8;
  id v9;
  CKUploadRequestManagerInternals *v10;
  const char *v11;
  CKUploadRequestManagerInternals *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CKUploadRequestManagerInternals;
  v10 = -[CKUploadRequestManagerInternals init](&v14, sel_init);
  v12 = v10;
  if (v10)
  {
    v10->_ignoringSystemConditions = a5;
    objc_msgSend_commonInitWithContainer_repairContainerOverrides_(v10, v11, (uint64_t)v8, (uint64_t)v9);
  }

  return v12;
}

- (void)commonInitWithContainer:(id)a3 repairContainerOverrides:(id)a4
{
  id v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  CKContainer *v30;
  id v31;
  CKContainer *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  CKContainer *container;
  CKContainer *v41;
  const char *v42;
  CKContainer *v43;
  CKContainer *repairContainer;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  CKUploadRequestConfiguration *v48;
  CKUploadRequestConfiguration *repairContainerOverrides;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  id v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  NSObject *v66;
  OS_dispatch_queue *v67;
  OS_dispatch_queue *stateMachineQueue;
  OS_dispatch_queue **p_stateMachineQueue;
  void *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  id v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  const char *v85;
  NSObject *v86;
  OS_dispatch_queue *v87;
  OS_dispatch_queue *stateQueue;
  OS_dispatch_queue **p_stateQueue;
  void *v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  const char *v99;
  uint64_t v100;
  id v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  const char *v105;
  NSObject *v106;
  dispatch_queue_t v107;
  dispatch_queue_t *p_callbackQueue;
  OS_dispatch_queue *callbackQueue;
  uint64_t v110;
  void *v111;
  const char *v112;
  uint64_t v113;
  void *v114;
  const char *v115;
  uint64_t v116;
  id v117;

  v117 = a3;
  __asm { FMOV            V0.2D, #-1.0 }
  *(_OWORD *)&self->_recurringFetchPeriod = _Q0;
  *(_OWORD *)&self->_retryableErrorRetryTime = _Q0;
  *(_OWORD *)&self->_retryableErrorMaxRetryCount = _Q0;
  self->_assetRepairSchedulerRepairBatchCountLimit = -1;
  self->_assetRepairSchedulerDefaultSuspensionTime = -1.0;
  self->_assetRepairSchedulerRepairRetryCount = -1;
  if (__sTestOverridesAvailable)
  {
    v11 = a4;
    v12 = objc_alloc((Class)sub_18A70E144());
    objc_msgSend_containerID(v117, v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_options(v117, v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_options(v117, v21, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_testDeviceReferenceProtocol(v24, v25, v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (CKContainer *)objc_msgSend_initWithContainerID_options_testDeviceReferenceProtocol_(v12, v29, (uint64_t)v16, (uint64_t)v20, v28);

  }
  else
  {
    v31 = a4;
    v32 = [CKContainer alloc];
    objc_msgSend_containerID(v117, v33, v34, v35);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_options(v117, v36, v37, v38);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (CKContainer *)objc_msgSend_initWithContainerID_options_(v32, v39, (uint64_t)v16, (uint64_t)v20);
  }

  container = self->_container;
  self->_container = v30;
  v41 = v30;

  objc_msgSend_createRepairContainerFromContainer_withOverrides_(CKAssetRepairOperationUtilities, v42, (uint64_t)v117, (uint64_t)a4);
  v43 = (CKContainer *)objc_claimAutoreleasedReturnValue();
  repairContainer = self->_repairContainer;
  self->_repairContainer = v43;

  v48 = (CKUploadRequestConfiguration *)objc_msgSend_copy(a4, v45, v46, v47);
  repairContainerOverrides = self->_repairContainerOverrides;
  self->_repairContainerOverrides = v48;

  v50 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_containerID(v117, v51, v52, v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_containerIdentifier(v54, v55, v56, v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v50, v59, (uint64_t)CFSTR("%@.%@"), v60, CFSTR("com.apple.cloudkit.uploadrequest.statemachine"), v58);
  v61 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v65 = (const char *)objc_msgSend_UTF8String(v61, v62, v63, v64);
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v66 = objc_claimAutoreleasedReturnValue();
  v67 = (OS_dispatch_queue *)dispatch_queue_create(v65, v66);
  p_stateMachineQueue = &self->_stateMachineQueue;
  stateMachineQueue = self->_stateMachineQueue;
  self->_stateMachineQueue = v67;

  v70 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_containerID(v117, v71, v72, v73);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_containerIdentifier(v74, v75, v76, v77);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v70, v79, (uint64_t)CFSTR("%@.%@"), v80, CFSTR("com.apple.cloudkit.uploadrequest.state"), v78);
  v81 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v85 = (const char *)objc_msgSend_UTF8String(v81, v82, v83, v84);
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v86 = objc_claimAutoreleasedReturnValue();
  v87 = (OS_dispatch_queue *)dispatch_queue_create(v85, v86);
  p_stateQueue = &self->_stateQueue;
  stateQueue = self->_stateQueue;
  self->_stateQueue = v87;

  v90 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_containerID(v117, v91, v92, v93);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_containerIdentifier(v94, v95, v96, v97);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v90, v99, (uint64_t)CFSTR("%@.%@"), v100, CFSTR("com.apple.cloudkit.uploadrequest.callback"), v98);
  v101 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v105 = (const char *)objc_msgSend_UTF8String(v101, v102, v103, v104);
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v106 = objc_claimAutoreleasedReturnValue();
  v107 = dispatch_queue_create(v105, v106);
  callbackQueue = self->_callbackQueue;
  p_callbackQueue = (dispatch_queue_t *)&self->_callbackQueue;
  *p_callbackQueue = v107;

  dispatch_queue_set_specific((dispatch_queue_t)*p_stateMachineQueue, p_stateMachineQueue, (void *)1, 0);
  dispatch_queue_set_specific((dispatch_queue_t)*p_stateQueue, p_stateQueue, (void *)1, 0);
  dispatch_queue_set_specific(*p_callbackQueue, p_callbackQueue, (void *)1, 0);
  v110 = objc_opt_new();
  v111 = *(p_callbackQueue - 3);
  *(p_callbackQueue - 3) = (dispatch_queue_t)v110;

  objc_msgSend_setWithArray_(MEMORY[0x1E0C99E60], v112, (uint64_t)&unk_1E1FC41F0, v113);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setActionsToThrottle_(*(p_callbackQueue - 3), v115, (uint64_t)v114, v116);

}

- (void)dealloc
{
  __SCNetworkReachability *reachability;
  objc_super v4;

  reachability = self->_reachability;
  if (reachability)
  {
    CFRelease(reachability);
    self->_reachability = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CKUploadRequestManagerInternals;
  -[CKUploadRequestManagerInternals dealloc](&v4, sel_dealloc);
}

- (NSString)activityIdentifierForSchedulingRepairs
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;

  objc_msgSend_container(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_activityIdentifierForSchedulingRepairsInContainer_(CKUploadRequestManager, v6, (uint64_t)v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend_ignoringSystemConditions(self, v9, v10, v11))
  {
    objc_msgSend_identifierWithImmediateInvocationForIdentifier_(CKScheduler, v12, (uint64_t)v8, v13);
    v14 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v14;
  }
  return (NSString *)v8;
}

- (NSString)machServiceName
{
  CKUploadRequestManagerInternals *v2;
  NSString *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_machServiceName;
  objc_sync_exit(v2);

  return v3;
}

- (void)setMachServiceName:(id)a3
{
  CKUploadRequestManagerInternals *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  char isEqualToString;
  uint64_t v18;
  NSString *machServiceName;
  CKException *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  id v26;
  id v27;

  v27 = a3;
  v4 = self;
  objc_sync_enter(v4);
  if ((objc_msgSend_isEqualToString_(v4->_machServiceName, v5, (uint64_t)v27, v6) & 1) == 0)
  {
    objc_msgSend_assignedMachServiceName(v4, v7, v8, v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend_assignedMachServiceName(v4, v10, v11, v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      isEqualToString = objc_msgSend_isEqualToString_(v27, v15, (uint64_t)v14, v16);

      if ((isEqualToString & 1) == 0)
      {
        v20 = [CKException alloc];
        objc_msgSend_assignedMachServiceName(v4, v21, v22, v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = (id)objc_msgSend_initWithCode_format_(v20, v25, 12, (uint64_t)CFSTR("Cannot assign new machServiceName %@ when previous port %@ is still being used"), v27, v24);

        objc_exception_throw(v26);
      }
    }
    v18 = objc_msgSend_copy(v27, v10, v11, v12);
    machServiceName = v4->_machServiceName;
    v4->_machServiceName = (NSString *)v18;

  }
  objc_sync_exit(v4);

}

- (id)repairZoneID
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  CKRecordZoneID *v11;
  const char *v12;
  void *v13;

  objc_msgSend_repairContainerOverrides(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_repairZoneID(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    v11 = [CKRecordZoneID alloc];
    v10 = (id)objc_msgSend_initWithZoneName_ownerName_(v11, v12, (uint64_t)CFSTR("RepairZone"), (uint64_t)CFSTR("__defaultOwner__"));
  }
  v13 = v10;

  return v13;
}

- (void)setRepairActivityHandler:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  id repairActivityHandler;
  NSObject *v11;
  const char *v12;
  uint8_t *v13;
  __int16 v14;
  __int16 v15;

  v4 = a3;
  objc_msgSend_stateQueue(self, v5, v6, v7);
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  if (self->_repairActivityHandler != v4)
  {
    v9 = _Block_copy(v4);
    repairActivityHandler = self->_repairActivityHandler;
    self->_repairActivityHandler = v9;

    if (v4)
    {
      if (ck_log_initialization_predicate != -1)
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      v11 = ck_log_facility_data_repair;
      if (os_log_type_enabled((os_log_t)ck_log_facility_data_repair, OS_LOG_TYPE_DEBUG))
      {
        v15 = 0;
        v12 = "Setting handler when entering repair activity";
        v13 = (uint8_t *)&v15;
LABEL_12:
        _os_log_debug_impl(&dword_18A5C5000, v11, OS_LOG_TYPE_DEBUG, v12, v13, 2u);
      }
    }
    else
    {
      if (ck_log_initialization_predicate != -1)
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      v11 = ck_log_facility_data_repair;
      if (os_log_type_enabled((os_log_t)ck_log_facility_data_repair, OS_LOG_TYPE_DEBUG))
      {
        v14 = 0;
        v12 = "Clearing handler when exiting repair activity";
        v13 = (uint8_t *)&v14;
        goto LABEL_12;
      }
    }
  }

}

- (CKUploadRequestManagerStateMachine)stateMachine
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  CKUploadRequestManagerStateMachine *stateMachine;
  CKUploadRequestManagerStateMachine *v10;
  CKUploadRequestManagerStateMachine *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;

  objc_msgSend_stateMachineQueue(self, a2, v2, v3);
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  stateMachine = self->_stateMachine;
  if (!stateMachine)
  {
    objc_msgSend_createStateMachine(self, v6, v7, v8);
    v10 = (CKUploadRequestManagerStateMachine *)objc_claimAutoreleasedReturnValue();
    v11 = self->_stateMachine;
    self->_stateMachine = v10;

    objc_msgSend_start(self->_stateMachine, v12, v13, v14);
    stateMachine = self->_stateMachine;
  }
  return stateMachine;
}

- (void)setStateMachine:(id)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  CKUploadRequestManagerStateMachine **p_stateMachine;
  CKUploadRequestManagerStateMachine *stateMachine;
  CKUploadRequestManagerStateMachine *v11;

  v11 = (CKUploadRequestManagerStateMachine *)a3;
  objc_msgSend_stateMachineQueue(self, v5, v6, v7);
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  stateMachine = self->_stateMachine;
  p_stateMachine = &self->_stateMachine;
  if (stateMachine != v11)
    objc_storeStrong((id *)p_stateMachine, a3);

}

- (id)createDatabase
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
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
  void *v17;
  CKUploadRequestPersistentStore *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;

  objc_msgSend_container(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_containerIdentifier(v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_CKSafeStringForPathComponent(v9, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v10, v15, (uint64_t)CFSTR("com.apple.cloudkit.uploadrequest.%@.cache"), v16, v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = [CKUploadRequestPersistentStore alloc];
  v19 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend_cachesDirectory(self, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAppendingPathComponent_(v23, v24, (uint64_t)v17, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fileURLWithPath_isDirectory_(v19, v27, (uint64_t)v26, 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)objc_msgSend_initWithDatabaseURL_(v18, v29, (uint64_t)v28, v30);

  return v31;
}

- (void)setReachability:(__SCNetworkReachability *)a3
{
  __SCNetworkReachability *reachability;

  reachability = self->_reachability;
  if (reachability != a3)
  {
    if (a3)
    {
      CFRetain(a3);
      reachability = self->_reachability;
    }
    self->_reachability = a3;
    if (reachability)
      CFRelease(reachability);
  }
}

- (void)fetchServerChanges:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  OS_dispatch_queue **p_stateQueue;
  id v10;
  _QWORD v11[5];
  id v12;

  v4 = a3;
  objc_msgSend_stateQueue(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  p_stateQueue = &self->_stateQueue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_18A72B914;
  v11[3] = &unk_1E1F5F730;
  v11[4] = self;
  v12 = v4;
  v10 = v4;
  ck_call_or_dispatch_sync_if_not_key(v8, p_stateQueue, v11);

}

- (void)manuallyTriggerUploadRequests
{
  uint64_t v2;
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = sub_18A72BBD8;
  v3[3] = &unk_1E1F5FAA8;
  v3[4] = self;
  objc_msgSend_fetchServerChanges_(self, a2, (uint64_t)v3, v2);
}

- (void)dispatchEvent:(int64_t)a3 synchronously:(BOOL)a4
{
  _BOOL4 v4;
  void (*v7)(void *, _QWORD *);
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  _QWORD v13[6];

  v4 = a4;
  if (a4)
    v7 = (void (*)(void *, _QWORD *))MEMORY[0x1E0C82F90];
  else
    v7 = (void (*)(void *, _QWORD *))MEMORY[0x1E0C82C00];
  objc_msgSend_stateQueue(self, a2, a3, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_18A72BCA0;
  v13[3] = &unk_1E1F62FA8;
  v13[4] = self;
  v13[5] = a3;
  v7(v8, v13);

  if (v4)
  {
    objc_msgSend_stateQueue(self, v9, v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    dispatch_sync(v12, &unk_1E1F585B8);

  }
}

- (void)dispatchAsyncOnStateQueue:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;

  v4 = a3;
  objc_msgSend_stateQueue(self, v5, v6, v7);
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v8, v4);

}

- (void)setCallback:(id)a3 forOverridePoint:(int64_t)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  int64_t v14;

  v6 = a3;
  objc_msgSend_stateQueue(self, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_18A72BDAC;
  v12[3] = &unk_1E1F62FD0;
  v13 = v6;
  v14 = a4;
  v12[4] = self;
  v11 = v6;
  ck_call_or_dispatch_sync_if_not_key(v10, &self->_stateQueue, v12);

}

- (void)invokeCallbackForOverridePoint:(int64_t)a3 withError:(id)a4 onCallbackQueue:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  _QWORD block[4];
  id v20;
  uint64_t *v21;
  _QWORD v22[7];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  void *(*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v5 = a5;
  v8 = a4;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = sub_18A72BFD4;
  v27 = sub_18A72BFFC;
  v28 = 0;
  objc_msgSend_stateQueue(self, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = sub_18A72C004;
  v22[3] = &unk_1E1F62FF8;
  v22[4] = self;
  v22[5] = &v23;
  v22[6] = a3;
  ck_call_or_dispatch_sync_if_not_key(v12, &self->_stateQueue, v22);

  v17 = v24[5];
  if (v17)
  {
    if (v5)
    {
      objc_msgSend_callbackQueue(self, v14, v15, v16);
      v18 = objc_claimAutoreleasedReturnValue();
      block[0] = v13;
      block[1] = 3221225472;
      block[2] = sub_18A72C07C;
      block[3] = &unk_1E1F5F758;
      v21 = &v23;
      v20 = v8;
      dispatch_async(v18, block);

    }
    else
    {
      (*(void (**)(uint64_t, id))(v17 + 16))(v17, v8);
    }
  }
  _Block_object_dispose(&v23, 8);

}

- (BOOL)ignoringSystemConditions
{
  return self->_ignoringSystemConditions;
}

- (void)setRecurringFetchPeriod:(double)a3
{
  self->_recurringFetchPeriod = a3;
}

- (void)setTryAgainLaterRetryTime:(double)a3
{
  self->_tryAgainLaterRetryTime = a3;
}

- (void)setRetryableErrorRetryTime:(double)a3
{
  self->_retryableErrorRetryTime = a3;
}

- (void)setCancelledErrorRetryTime:(double)a3
{
  self->_cancelledErrorRetryTime = a3;
}

- (void)setRetryableErrorMaxRetryCount:(double)a3
{
  self->_retryableErrorMaxRetryCount = a3;
}

- (void)setNotificationDebouncePeriod:(double)a3
{
  self->_notificationDebouncePeriod = a3;
}

- (int64_t)assetRepairSchedulerRepairBatchCountLimit
{
  return self->_assetRepairSchedulerRepairBatchCountLimit;
}

- (void)setAssetRepairSchedulerRepairBatchCountLimit:(int64_t)a3
{
  self->_assetRepairSchedulerRepairBatchCountLimit = a3;
}

- (double)assetRepairSchedulerDefaultSuspensionTime
{
  return self->_assetRepairSchedulerDefaultSuspensionTime;
}

- (void)setAssetRepairSchedulerDefaultSuspensionTime:(double)a3
{
  self->_assetRepairSchedulerDefaultSuspensionTime = a3;
}

- (int64_t)assetRepairSchedulerRepairRetryCount
{
  return self->_assetRepairSchedulerRepairRetryCount;
}

- (void)setAssetRepairSchedulerRepairRetryCount:(int64_t)a3
{
  self->_assetRepairSchedulerRepairRetryCount = a3;
}

- (CKContainer)container
{
  return self->_container;
}

- (CKContainer)repairContainer
{
  return self->_repairContainer;
}

- (CKUploadRequestConfiguration)repairContainerOverrides
{
  return self->_repairContainerOverrides;
}

- (CKSyncEngine)repairZoneSyncEngine
{
  return self->_repairZoneSyncEngine;
}

- (void)setRepairZoneSyncEngine:(id)a3
{
  objc_storeStrong((id *)&self->_repairZoneSyncEngine, a3);
}

- (NSString)assignedMachServiceName
{
  return self->_assignedMachServiceName;
}

- (void)setAssignedMachServiceName:(id)a3
{
  objc_storeStrong((id *)&self->_assignedMachServiceName, a3);
}

- (BOOL)hasRegisteredActivity
{
  return self->_hasRegisteredActivity;
}

- (void)setHasRegisteredActivity:(BOOL)a3
{
  self->_hasRegisteredActivity = a3;
}

- (CKAssetRepairScheduler)repairProcessor
{
  return self->_repairProcessor;
}

- (void)setRepairProcessor:(id)a3
{
  objc_storeStrong((id *)&self->_repairProcessor, a3);
}

- (CKUploadRequestPersistentStore)database
{
  return self->_database;
}

- (void)setDatabase:(id)a3
{
  objc_storeStrong((id *)&self->_database, a3);
}

- (NSString)deviceID
{
  return self->_deviceID;
}

- (void)setDeviceID:(id)a3
{
  objc_storeStrong((id *)&self->_deviceID, a3);
}

- (NSString)cachesDirectory
{
  return self->_cachesDirectory;
}

- (void)setCachesDirectory:(id)a3
{
  objc_storeStrong((id *)&self->_cachesDirectory, a3);
}

- (__SCNetworkReachability)reachability
{
  return self->_reachability;
}

- (NSObject)accountChangeObserver
{
  return self->_accountChangeObserver;
}

- (void)setAccountChangeObserver:(id)a3
{
  objc_storeStrong((id *)&self->_accountChangeObserver, a3);
}

- (id)scheduledAccountStatusCheck
{
  return self->_scheduledAccountStatusCheck;
}

- (void)setScheduledAccountStatusCheck:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (int)fetchAllToken
{
  return self->_fetchAllToken;
}

- (void)setFetchAllToken:(int)a3
{
  self->_fetchAllToken = a3;
}

- (id)repairActivityHandler
{
  return self->_repairActivityHandler;
}

- (CKSchedulerActivity)observedRepairActivity
{
  return self->_observedRepairActivity;
}

- (void)setObservedRepairActivity:(id)a3
{
  objc_storeStrong((id *)&self->_observedRepairActivity, a3);
}

- (CKUploadRequestManagerResponseActionThrottler)responseActionThrottler
{
  return self->_responseActionThrottler;
}

- (OS_dispatch_queue)stateMachineQueue
{
  return self->_stateMachineQueue;
}

- (OS_dispatch_queue)stateQueue
{
  return self->_stateQueue;
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (NSMutableDictionary)callbackForOverridePoint
{
  return self->_callbackForOverridePoint;
}

- (void)setCallbackForOverridePoint:(id)a3
{
  objc_storeStrong((id *)&self->_callbackForOverridePoint, a3);
}

- (id)assetRequestCallback
{
  return objc_getProperty(self, a2, 256, 1);
}

- (void)setAssetRequestCallback:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 256);
}

- (id)packageRequestCallback
{
  return objc_getProperty(self, a2, 264, 1);
}

- (void)setPackageRequestCallback:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 264);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_packageRequestCallback, 0);
  objc_storeStrong(&self->_assetRequestCallback, 0);
  objc_storeStrong((id *)&self->_callbackForOverridePoint, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_stateQueue, 0);
  objc_storeStrong((id *)&self->_stateMachineQueue, 0);
  objc_storeStrong((id *)&self->_responseActionThrottler, 0);
  objc_storeStrong((id *)&self->_observedRepairActivity, 0);
  objc_storeStrong(&self->_repairActivityHandler, 0);
  objc_storeStrong(&self->_scheduledAccountStatusCheck, 0);
  objc_storeStrong((id *)&self->_accountChangeObserver, 0);
  objc_storeStrong((id *)&self->_cachesDirectory, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_repairProcessor, 0);
  objc_storeStrong((id *)&self->_assignedMachServiceName, 0);
  objc_storeStrong((id *)&self->_repairZoneSyncEngine, 0);
  objc_storeStrong((id *)&self->_repairContainerOverrides, 0);
  objc_storeStrong((id *)&self->_repairContainer, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_machServiceName, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
}

- (void)assetRepairScheduler:(id)a3 completedRequestWithMetadata:(id)a4 result:(int64_t)a5
{
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  id v17;

  if (a5 == 2)
  {
    objc_msgSend_repairZoneRecordID(a4, a2, (uint64_t)a3, (uint64_t)a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_tryAgainLaterRetryTime(self, v7, v8, v9);
    objc_msgSend_scheduleRecordRepair_withDelay_increasingCount_(self, v10, (uint64_t)v6, 0);

    objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v11, (uint64_t)CFSTR("CKInternalErrorDomain"), 10003, CFSTR("Repair deferred by caller"));
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKClientSuitableError(v17, v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_invokeCallbackForOverridePoint_withError_onCallbackQueue_(self, v16, 4, (uint64_t)v15, 1);

  }
}

- (void)assetRepairScheduler:(id)a3 completedRepairWithMetadata:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  OS_dispatch_queue **p_stateQueue;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;

  v7 = a4;
  v8 = a5;
  objc_msgSend_stateQueue(self, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  p_stateQueue = &self->_stateQueue;
  v16[2] = sub_18A72C4E8;
  v16[3] = &unk_1E1F60DD8;
  v16[4] = self;
  v17 = v8;
  v18 = v7;
  v14 = v7;
  v15 = v8;
  ck_call_or_dispatch_sync_if_not_key(v12, p_stateQueue, v16);

}

- (void)assetRepairSchedulerAllRequestsComplete:(id)a3
{
  uint64_t v3;
  void *v5;
  _QWORD v6[5];

  objc_msgSend_stateQueue(self, a2, (uint64_t)a3, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_18A72CB44;
  v6[3] = &unk_1E1F5FAA8;
  v6[4] = self;
  ck_call_or_dispatch_sync_if_not_key(v5, &self->_stateQueue, v6);

}

- (void)syncEngine:(id)a3 didFetchRecord:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  OS_dispatch_queue **p_stateQueue;
  id v15;
  _QWORD v16[5];
  id v17;
  os_activity_scope_state_s state;

  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_18A5C5000, "client/data-repair-record-was-changed", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  objc_msgSend_invokeCallbackForOverridePoint_withError_onCallbackQueue_(self, v9, 3, 0, 1);
  objc_msgSend_stateQueue(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  p_stateQueue = &self->_stateQueue;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_18A72CC70;
  v16[3] = &unk_1E1F61A48;
  v16[4] = self;
  v15 = v7;
  v17 = v15;
  ck_call_or_dispatch_sync_if_not_key(v13, p_stateQueue, v16);

  os_activity_scope_leave(&state);
}

- (void)syncEngine:(id)a3 recordWithIDWasDeleted:(id)a4 recordType:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  OS_dispatch_queue **p_stateQueue;
  id v17;
  _QWORD v18[5];
  id v19;
  os_activity_scope_state_s state;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = _os_activity_create(&dword_18A5C5000, "client/data-repair-record-was-deleted", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  objc_msgSend_stateQueue(self, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  p_stateQueue = &self->_stateQueue;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = sub_18A72D088;
  v18[3] = &unk_1E1F61A48;
  v18[4] = self;
  v17 = v9;
  v19 = v17;
  ck_call_or_dispatch_sync_if_not_key(v15, p_stateQueue, v18);

  os_activity_scope_leave(&state);
}

- (void)syncEngine:(id)a3 didUpdateMetadata:(id)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  OS_dispatch_queue **p_stateQueue;
  id v11;
  _QWORD v12[5];
  id v13;

  v5 = a4;
  objc_msgSend_stateQueue(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  p_stateQueue = &self->_stateQueue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_18A72D2E0;
  v12[3] = &unk_1E1F61A48;
  v12[4] = self;
  v13 = v5;
  v11 = v5;
  ck_call_or_dispatch_sync_if_not_key(v9, p_stateQueue, v12);

}

- (void)syncEngine:(id)a3 zoneWithIDChanged:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  CKUploadRequestManagerInternals *v16;
  os_activity_scope_state_s state;

  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_18A5C5000, "client/data-repair-zone-was-changed", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  objc_msgSend_stateQueue(self, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_18A72D53C;
  v14[3] = &unk_1E1F61A48;
  v13 = v7;
  v15 = v13;
  v16 = self;
  ck_call_or_dispatch_sync_if_not_key(v12, &self->_stateQueue, v14);

  os_activity_scope_leave(&state);
}

- (void)syncEngine:(id)a3 zoneWithIDWasDeleted:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  OS_dispatch_queue **p_stateQueue;
  id v14;
  _QWORD v15[5];
  id v16;
  os_activity_scope_state_s state;

  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_18A5C5000, "client/data-repair-zone-was-deleted", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  objc_msgSend_stateQueue(self, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  p_stateQueue = &self->_stateQueue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_18A72D738;
  v15[3] = &unk_1E1F61A48;
  v15[4] = self;
  v14 = v7;
  v16 = v14;
  ck_call_or_dispatch_sync_if_not_key(v12, p_stateQueue, v15);

  os_activity_scope_leave(&state);
}

- (void)syncEngine:(id)a3 zoneWithIDWasPurged:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  OS_dispatch_queue **p_stateQueue;
  id v14;
  _QWORD v15[5];
  id v16;
  os_activity_scope_state_s state;

  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_18A5C5000, "client/data-repair-zone-was-purged", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  objc_msgSend_stateQueue(self, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  p_stateQueue = &self->_stateQueue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_18A72DA40;
  v15[3] = &unk_1E1F61A48;
  v15[4] = self;
  v14 = v7;
  v16 = v14;
  ck_call_or_dispatch_sync_if_not_key(v12, p_stateQueue, v15);

  os_activity_scope_leave(&state);
}

- (id)syncEngine:(id)a3 recordToSaveForRecordID:(id)a4
{
  return 0;
}

- (BOOL)isRepairRecordActionable:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  CKUploadRequestManagerInternals *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  objc_msgSend_stateQueue(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_18A72DD48;
  v11[3] = &unk_1E1F63020;
  v9 = v4;
  v13 = self;
  v14 = &v15;
  v12 = v9;
  ck_call_or_dispatch_sync_if_not_key(v8, &self->_stateQueue, v11);

  LOBYTE(self) = *((_BYTE *)v16 + 24);
  _Block_object_dispose(&v15, 8);

  return (char)self;
}

- (void)scheduleRepairsWithDelay:(double)a3
{
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[6];
  os_activity_scope_state_s state;

  v5 = _os_activity_create(&dword_18A5C5000, "client/data-repair-schedule-repairs", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  objc_msgSend_stateQueue(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_18A72E2D4;
  v10[3] = &unk_1E1F62FA8;
  v10[4] = self;
  *(double *)&v10[5] = a3;
  ck_call_or_dispatch_sync_if_not_key(v9, &self->_stateQueue, v10);

  os_activity_scope_leave(&state);
}

- (void)scheduleOrInvokeRepairsNow
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  _QWORD v6[5];

  objc_msgSend_stateQueue(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_18A72E5F0;
  v6[3] = &unk_1E1F5FAA8;
  v6[4] = self;
  ck_call_or_dispatch_sync_if_not_key(v5, &self->_stateQueue, v6);

}

- (void)scheduleRecordRepair:(id)a3 withDelay:(double)a4 increasingCount:(BOOL)a5
{
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  double v16;
  BOOL v17;

  v8 = a3;
  objc_msgSend_stateQueue(self, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_18A72E77C;
  v14[3] = &unk_1E1F63048;
  v14[4] = self;
  v15 = v8;
  v16 = a4;
  v17 = a5;
  v13 = v8;
  ck_call_or_dispatch_sync_if_not_key(v12, &self->_stateQueue, v14);

}

- (id)repairableAssetsForDate:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  OS_dispatch_queue **p_stateQueue;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v16[5];
  id v17;
  id v18;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend_stateQueue(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  p_stateQueue = &self->_stateQueue;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_18A72EAB4;
  v16[3] = &unk_1E1F60DD8;
  v16[4] = self;
  v17 = v4;
  v11 = v5;
  v18 = v11;
  v12 = v4;
  ck_call_or_dispatch_sync_if_not_key(v9, p_stateQueue, v16);

  v13 = v18;
  v14 = v11;

  return v14;
}

- (id)nextRepairDateForDate:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  OS_dispatch_queue **p_stateQueue;
  id v10;
  id v11;
  _QWORD v13[5];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v4 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = sub_18A72EE8C;
  v20 = sub_18A72EE9C;
  v21 = 0;
  objc_msgSend_stateQueue(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  p_stateQueue = &self->_stateQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_18A72EEA4;
  v13[3] = &unk_1E1F62670;
  v13[4] = self;
  v10 = v4;
  v14 = v10;
  v15 = &v16;
  ck_call_or_dispatch_sync_if_not_key(v8, p_stateQueue, v13);

  v11 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v11;
}

- (void)performRepairs
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  os_activity_scope_state_s state;

  v3 = _os_activity_create(&dword_18A5C5000, "client/data-repair-perform-repairs", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  objc_msgSend_stateQueue(self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_18A72F010;
  v8[3] = &unk_1E1F5FAA8;
  v8[4] = self;
  ck_call_or_dispatch_sync_if_not_key(v7, &self->_stateQueue, v8);

  os_activity_scope_leave(&state);
}

- (id)createStateMachine
{
  CKUploadRequestManagerStateMachine *v2;
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id location;

  objc_initWeak(&location, self);
  v2 = [CKUploadRequestManagerStateMachine alloc];
  v3 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_18A72F4A0;
  v16[3] = &unk_1E1F63098;
  objc_copyWeak(&v17, &location);
  v6 = (void *)objc_msgSend_initWithActionHandler_(v2, v4, (uint64_t)v16, v5);
  v14[0] = v3;
  v14[1] = 3221225472;
  v14[2] = sub_18A72F528;
  v14[3] = &unk_1E1F630C0;
  objc_copyWeak(&v15, &location);
  objc_msgSend_setEnterStateHandler_(v6, v7, (uint64_t)v14, v8);
  v12[0] = v3;
  v12[1] = 3221225472;
  v12[2] = sub_18A72F568;
  v12[3] = &unk_1E1F630C0;
  objc_copyWeak(&v13, &location);
  objc_msgSend_setExitStateHandler_(v6, v9, (uint64_t)v12, v10);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
  return v6;
}

- (void)respondToStateMachineAction:(int64_t)a3 isRetry:(BOOL)a4
{
  _BOOL8 v4;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  _QWORD v17[6];

  v4 = a4;
  objc_msgSend_stateMachineQueue(self, a2, a3, a4);
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  objc_msgSend_responseActionThrottler(self, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_gateResponseAction_isRetry_(v11, v12, a3, v4);

  objc_msgSend_stateQueue(self, v13, v14, v15);
  v16 = objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = sub_18A72F65C;
  v17[3] = &unk_1E1F62FA8;
  v17[4] = self;
  v17[5] = a3;
  dispatch_async(v16, v17);

}

- (void)respondToStateMachineChangeState:(int64_t)a3 enter:(BOOL)a4
{
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  _QWORD block[6];
  BOOL v13;

  objc_msgSend_stateMachineQueue(self, a2, a3, a4);
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  objc_msgSend_stateQueue(self, v8, v9, v10);
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18A730108;
  block[3] = &unk_1E1F63110;
  v13 = a4;
  block[4] = self;
  block[5] = a3;
  dispatch_async(v11, block);

}

- (void)dispatchEvent:(int64_t)a3
{
  uint64_t v3;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  _QWORD v11[6];

  objc_msgSend_stateQueue(self, a2, a3, v3);
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  objc_msgSend_stateMachineQueue(self, v7, v8, v9);
  v10 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_18A7301BC;
  v11[3] = &unk_1E1F62FA8;
  v11[4] = self;
  v11[5] = a3;
  dispatch_sync(v10, v11);

}

- (BOOL)canPerformFunction:(int64_t)a3
{
  uint64_t v3;
  int64_t v4;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  _QWORD block[7];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v4 = a3;
  objc_msgSend_stateQueue(self, a2, a3, v3);
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  objc_msgSend_stateMachineQueue(self, v7, v8, v9);
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18A7302D8;
  block[3] = &unk_1E1F62FF8;
  block[4] = self;
  block[5] = &v13;
  block[6] = v4;
  dispatch_sync(v10, block);

  LOBYTE(v4) = *((_BYTE *)v14 + 24);
  _Block_object_dispose(&v13, 8);
  return v4;
}

- (void)registerForRepairScheduler
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  _QWORD v22[4];
  id v23;
  id location;
  os_activity_scope_state_s state;

  v3 = _os_activity_create(&dword_18A5C5000, "client/data-repair-scheduler-callback", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  objc_msgSend_stateQueue(self, v4, v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  objc_initWeak(&location, self);
  if ((objc_msgSend_hasRegisteredActivity(self, v8, v9, v10) & 1) == 0)
  {
    objc_msgSend_setHasRegisteredActivity_(self, v11, 1, v12);
    objc_msgSend_sharedScheduler(CKScheduler, v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_activityIdentifierForSchedulingRepairs(self, v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = sub_18A730488;
    v22[3] = &unk_1E1F63160;
    objc_copyWeak(&v23, &location);
    objc_msgSend_registerActivityIdentifier_handler_(v16, v21, (uint64_t)v20, (uint64_t)v22);

    objc_destroyWeak(&v23);
  }
  objc_destroyWeak(&location);
  os_activity_scope_leave(&state);

}

- (void)finishSchedulerCallbackWithDeferral:(BOOL)a3
{
  uint64_t v3;
  _BOOL4 v4;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void (**v23)(_QWORD, _QWORD);
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const __CFString *v27;
  int v28;
  const __CFString *v29;
  uint64_t v30;

  v4 = a3;
  v30 = *MEMORY[0x1E0C80C00];
  objc_msgSend_stateQueue(self, a2, a3, v3);
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  objc_msgSend_repairActivityHandler(self, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v11 = ck_log_facility_data_repair;
    if (os_log_type_enabled((os_log_t)ck_log_facility_data_repair, OS_LOG_TYPE_DEBUG))
    {
      v27 = CFSTR("Finished");
      if (v4)
        v27 = CFSTR("Deferred");
      v28 = 138543362;
      v29 = v27;
      _os_log_debug_impl(&dword_18A5C5000, v11, OS_LOG_TYPE_DEBUG, "Invoking persisted repair handler with %{public}@ result", (uint8_t *)&v28, 0xCu);
    }
    objc_msgSend_observedRepairActivity(self, v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_shouldDefer);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_removeObserver_forKeyPath_context_(v15, v17, (uint64_t)self, (uint64_t)v16, qword_1EDF6DB00);

    objc_msgSend_setObservedRepairActivity_(self, v18, 0, v19);
    objc_msgSend_repairActivityHandler(self, v20, v21, v22);
    v23 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend_setRepairActivityHandler_(self, v24, 0, v25);
    if (v4)
      v26 = 2;
    else
      v26 = 1;
    v23[2](v23, v26);

  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  char shouldDefer;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  char v20;

  v8 = a4;
  v12 = v8;
  if ((void *)qword_1EDF6DB00 == a6)
  {
    shouldDefer = objc_msgSend_shouldDefer(v8, v9, v10, v11);
    objc_msgSend_stateQueue(self, v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_18A730A14;
    v18[3] = &unk_1E1F63188;
    v18[4] = self;
    v19 = v12;
    v20 = shouldDefer;
    ck_call_or_dispatch_async_if_not_key(v17, &self->_stateQueue, v18);

  }
}

- (void)cancelScheduledEvent
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  objc_msgSend_stateQueue(self, a2, v2, v3);
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend_sharedScheduler(CKScheduler, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_activityIdentifierForSchedulingRepairs(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_unregisterActivityIdentifier_(v9, v14, (uint64_t)v13, v15);

  MEMORY[0x1E0DE7D20](self, sel_registerForRepairScheduler, v16, v17);
}

- (void)openSyncEngine
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  CKSyncEngineConfiguration *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  xpc_object_t v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  CKSyncEngine *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  id v49;

  objc_msgSend_stateQueue(self, a2, v2, v3);
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend_repairZoneSyncEngine(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend_machServiceName(self, v10, v11, v12);
    v49 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setAssignedMachServiceName_(self, v13, (uint64_t)v49, v14);
    v15 = [CKSyncEngineConfiguration alloc];
    objc_msgSend_repairContainer(self, v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_privateCloudDatabase(v19, v20, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_database(self, v24, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_syncEngineMetadata(v27, v28, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)objc_msgSend_initWithDatabase_dataSource_metadata_(v15, v32, (uint64_t)v23, (uint64_t)self, v31);

    objc_msgSend_setApsMachServiceName_(v33, v34, (uint64_t)v49, v35);
    if (__sTestOverridesAvailable)
    {
      v38 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_int64(v38, (const char *)*MEMORY[0x1E0C80760], 5);
      objc_msgSend_setXpcActivityCriteriaOverrides_(v33, v39, (uint64_t)v38, v40);

    }
    objc_msgSend_setUseUniqueActivityIdentifiers_(v33, v36, 0, v37);
    objc_msgSend_setAutomaticSyncingEnabled_(v33, v41, 1, v42);
    v43 = [CKSyncEngine alloc];
    v46 = (void *)objc_msgSend_initWithConfiguration_(v43, v44, (uint64_t)v33, v45);
    objc_msgSend_setRepairZoneSyncEngine_(self, v47, (uint64_t)v46, v48);

  }
}

- (void)closeSyncEngine
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;

  objc_msgSend_stateQueue(self, a2, v2, v3);
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend_setRepairZoneSyncEngine_(self, v6, 0, v7);
  objc_msgSend_setAssignedMachServiceName_(self, v8, 0, v9);
}

- (void)fetchRepairContainerMetadata
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  id location;

  objc_msgSend_stateQueue(self, a2, v2, v3);
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_initWeak(&location, self);
  objc_msgSend_deviceID(self, v6, v7, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12
    && (objc_msgSend_cachesDirectory(self, v9, v10, v11),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v13,
        v12,
        v13))
  {
    objc_msgSend_dispatchEvent_(self, v9, 4, v11);
  }
  else
  {
    objc_msgSend_repairContainer(self, v9, v10, v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = sub_18A730E64;
    v17[3] = &unk_1E1F631B0;
    objc_copyWeak(&v18, &location);
    objc_msgSend_fetchCurrentDeviceIDWithCompletionHandler_(v14, v15, (uint64_t)v17, v16);

    objc_destroyWeak(&v18);
  }
  objc_destroyWeak(&location);
}

- (void)registerForNetworkReachability
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  const __SCNetworkReachability *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  const char *v18;
  uint64_t v19;
  SCNetworkReachabilityContext v20;

  objc_msgSend_stateQueue(self, a2, v2, v3);
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (!objc_msgSend_reachability(self, v6, v7, v8))
  {
    v12 = (const char *)objc_msgSend_UTF8String(CFSTR("https://gateway.icloud.com"), v9, v10, v11);
    v13 = SCNetworkReachabilityCreateWithName(0, v12);
    v20.version = 0;
    memset(&v20.retain, 0, 24);
    v20.info = self;
    SCNetworkReachabilitySetCallback(v13, (SCNetworkReachabilityCallBack)sub_18A7313B4, &v20);
    objc_msgSend_stateQueue(self, v14, v15, v16);
    v17 = objc_claimAutoreleasedReturnValue();
    SCNetworkReachabilitySetDispatchQueue(v13, v17);

    objc_msgSend_setReachability_(self, v18, (uint64_t)v13, v19);
    if (v13)
      CFRelease(v13);
  }
}

- (void)unregisterFromNetworkReachability
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const __SCNetworkReachability *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const __SCNetworkReachability *v16;
  const char *v17;
  uint64_t v18;

  objc_msgSend_stateQueue(self, a2, v2, v3);
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (objc_msgSend_reachability(self, v6, v7, v8))
  {
    v12 = (const __SCNetworkReachability *)objc_msgSend_reachability(self, v9, v10, v11);
    SCNetworkReachabilitySetDispatchQueue(v12, 0);
    v16 = (const __SCNetworkReachability *)objc_msgSend_reachability(self, v13, v14, v15);
    SCNetworkReachabilitySetCallback(v16, 0, 0);
    objc_msgSend_setReachability_(self, v17, 0, v18);
  }
}

- (void)checkNetworkReachability
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  const __SCNetworkReachability *v10;
  const __SCNetworkReachability *v11;
  uint64_t v12;
  SCNetworkReachabilityFlags flags;

  objc_msgSend_stateQueue(self, a2, v2, v3);
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  flags = 0;
  v9 = (const char *)objc_msgSend_UTF8String(CFSTR("https://gateway.icloud.com"), v6, v7, v8);
  v10 = SCNetworkReachabilityCreateWithName(0, v9);
  if (v10)
  {
    v11 = v10;
    v12 = SCNetworkReachabilityGetFlags(v10, &flags);
    sub_18A7313B4(v12, flags, self);
    CFRelease(v11);
  }
  else
  {
    sub_18A7313B4(0, 0, self);
  }
}

- (void)registerForAccountNotifications
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  _QWORD v22[4];
  id v23[2];
  id location;
  os_activity_scope_state_s state;

  v3 = _os_activity_create(&dword_18A5C5000, "client/data-repair-account-notification", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  objc_msgSend_stateQueue(self, v4, v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  objc_msgSend_notificationDebouncePeriod(self, v8, v9, v10);
  v12 = v11;
  objc_initWeak(&location, self);
  objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  CKAccountChangedNotificationName();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = sub_18A7316A0;
  v22[3] = &unk_1E1F63228;
  objc_copyWeak(v23, &location);
  v23[1] = v12;
  objc_msgSend_addObserverForName_object_queue_usingBlock_(v16, v18, (uint64_t)v17, 0, 0, v22);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAccountChangeObserver_(self, v20, (uint64_t)v19, v21);

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  os_activity_scope_leave(&state);

}

- (void)unregisterFromAccountNotifications
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint8_t v29[16];

  objc_msgSend_stateQueue(self, a2, v2, v3);
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_accountChangeObserver(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  CKAccountChangedNotificationName();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObserver_name_object_(v9, v15, (uint64_t)v13, (uint64_t)v14, 0);

  objc_msgSend_setAccountChangeObserver_(self, v16, 0, v17);
  objc_msgSend_scheduledAccountStatusCheck(self, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v22 = ck_log_facility_data_repair;
    if (os_log_type_enabled((os_log_t)ck_log_facility_data_repair, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v29 = 0;
      _os_log_debug_impl(&dword_18A5C5000, v22, OS_LOG_TYPE_DEBUG, "Cancelling enqueued account check", v29, 2u);
    }
    objc_msgSend_scheduledAccountStatusCheck(self, v23, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_block_cancel(v26);

    objc_msgSend_setScheduledAccountStatusCheck_(self, v27, 0, v28);
  }
}

- (void)checkAccountStatus
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  id location;

  objc_msgSend_stateQueue(self, a2, v2, v3);
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_initWeak(&location, self);
  objc_msgSend_repairContainer(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_18A731BE0;
  v12[3] = &unk_1E1F63278;
  objc_copyWeak(&v13, &location);
  objc_msgSend_accountStatusWithCompletionHandler_(v9, v10, (uint64_t)v12, v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)checkAccountID
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  _QWORD v12[5];
  id v13;
  id location;

  objc_msgSend_stateQueue(self, a2, v2, v3);
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_initWeak(&location, self);
  objc_msgSend_repairContainer(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_18A731EB8;
  v12[3] = &unk_1E1F632C8;
  objc_copyWeak(&v13, &location);
  v12[4] = self;
  objc_msgSend_fetchUserRecordIDWithCompletionHandler_(v9, v10, (uint64_t)v12, v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)registerForFetchAllNotifications
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  int AllToken;
  const char *v13;
  uint64_t v14;
  id v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  const char *v24;
  uint64_t v25;
  _QWORD handler[4];
  id v27;
  int out_token;
  id location;

  objc_msgSend_stateQueue(self, a2, v2, v3);
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_initWeak(&location, self);
  if (objc_msgSend_fetchAllToken(self, v6, v7, v8))
  {
    AllToken = objc_msgSend_fetchAllToken(self, v9, v10, v11);
    notify_cancel(AllToken);
    objc_msgSend_setFetchAllToken_(self, v13, 0xFFFFFFFFLL, v14);
  }
  out_token = -1;
  objc_msgSend_uploadRequestFetchAllNotificationName(CKContainer, v9, v10, v11);
  v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v19 = (const char *)objc_msgSend_UTF8String(v15, v16, v17, v18);
  objc_msgSend_stateQueue(self, v20, v21, v22);
  v23 = objc_claimAutoreleasedReturnValue();
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = sub_18A7323D0;
  handler[3] = &unk_1E1F607E0;
  objc_copyWeak(&v27, &location);
  LODWORD(v19) = notify_register_dispatch(v19, &out_token, v23, handler);

  if ((_DWORD)v19)
    objc_msgSend_setFetchAllToken_(self, v24, 0xFFFFFFFFLL, v25);
  else
    objc_msgSend_setFetchAllToken_(self, v24, out_token, v25);
  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);
}

- (void)unregisterFromFetchAllNotifications
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  int AllToken;
  const char *v13;
  uint64_t v14;

  objc_msgSend_stateQueue(self, a2, v2, v3);
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (objc_msgSend_fetchAllToken(self, v6, v7, v8))
  {
    AllToken = objc_msgSend_fetchAllToken(self, v9, v10, v11);
    notify_cancel(AllToken);
    objc_msgSend_setFetchAllToken_(self, v13, 0xFFFFFFFFLL, v14);
  }
}

- (void)scheduleRecurringFetch
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  NSObject *v29;
  uint32_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  NSObject *v44;
  NSObject *v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  int v49;
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  objc_msgSend_stateQueue(self, a2, v2, v3);
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend_database(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lastFetchDate(v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_recurringFetchPeriod(self, v14, v15, v16);
  v21 = v20;
  if (v13)
  {
    objc_msgSend_date(MEMORY[0x1E0C99D68], v17, v18, v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_timeIntervalSinceDate_(v22, v23, (uint64_t)v13, v24);
    if (v28 >= v21)
    {
      objc_msgSend_database(self, v25, v26, v27);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setLastFetchDate_(v41, v42, (uint64_t)v22, v43);

      if (ck_log_initialization_predicate != -1)
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      v44 = ck_log_facility_data_repair;
      if (os_log_type_enabled((os_log_t)ck_log_facility_data_repair, OS_LOG_TYPE_INFO))
      {
        LOWORD(v49) = 0;
        _os_log_impl(&dword_18A5C5000, v44, OS_LOG_TYPE_INFO, "Fetching upload requests on schedule", (uint8_t *)&v49, 2u);
        if (ck_log_initialization_predicate != -1)
          dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      v45 = ck_log_facility_data_repair;
      if (os_log_type_enabled((os_log_t)ck_log_facility_data_repair, OS_LOG_TYPE_DEBUG))
      {
        v49 = 138543362;
        v50 = v22;
        _os_log_debug_impl(&dword_18A5C5000, v45, OS_LOG_TYPE_DEBUG, "Setting last fetch date to %{public}@", (uint8_t *)&v49, 0xCu);
      }
      objc_msgSend_dispatchEvent_(self, v46, 14, v47);
    }
    else
    {
      if (ck_log_initialization_predicate != -1)
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      v29 = ck_log_facility_data_repair;
      if (os_log_type_enabled((os_log_t)ck_log_facility_data_repair, OS_LOG_TYPE_DEBUG))
      {
        v49 = 138543362;
        v50 = v13;
        _os_log_debug_impl(&dword_18A5C5000, v29, OS_LOG_TYPE_DEBUG, "Last fetch was on %{public}@, so no need to fetch yet", (uint8_t *)&v49, 0xCu);
      }
    }
  }
  else
  {
    v30 = arc4random_uniform(0x401u);
    objc_msgSend_dateWithTimeIntervalSinceNow_(MEMORY[0x1E0C99D68], v31, v32, v33, v21 * ((double)v30 * 0.0009765625));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v34 = ck_log_facility_data_repair;
    if (os_log_type_enabled((os_log_t)ck_log_facility_data_repair, OS_LOG_TYPE_DEBUG))
    {
      v49 = 138543362;
      v50 = v22;
      _os_log_debug_impl(&dword_18A5C5000, v34, OS_LOG_TYPE_DEBUG, "Initializing last fetch date to %{public}@", (uint8_t *)&v49, 0xCu);
    }
    objc_msgSend_database(self, v35, v36, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setLastFetchDate_(v38, v39, (uint64_t)v22, v40);

  }
  objc_msgSend_invokeCallbackForOverridePoint_withError_onCallbackQueue_(self, v48, 2, 0, 1);

}

- (void)scheduleNextSync
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  NSObject *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint8_t v27[16];
  uint8_t v28[16];
  uint8_t buf[16];

  objc_msgSend_stateQueue(self, a2, v2, v3);
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend_date(MEMORY[0x1E0C99D68], v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_nextRepairDateForDate_(self, v10, (uint64_t)v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v12;
  if (v12)
  {
    if (objc_msgSend_compare_(v12, v13, (uint64_t)v9, v14) == 1)
    {
      if (ck_log_initialization_predicate != -1)
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      v16 = ck_log_facility_data_repair;
      if (os_log_type_enabled((os_log_t)ck_log_facility_data_repair, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18A5C5000, v16, OS_LOG_TYPE_INFO, "Scheduling next upload requests at a future date", buf, 2u);
      }
      objc_msgSend_timeIntervalSinceDate_(v15, v17, (uint64_t)v9, v18);
      objc_msgSend_scheduleRepairsWithDelay_(self, v19, v20, v21);
    }
    else
    {
      if (ck_log_initialization_predicate != -1)
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      v23 = ck_log_facility_data_repair;
      if (os_log_type_enabled((os_log_t)ck_log_facility_data_repair, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v28 = 0;
        _os_log_impl(&dword_18A5C5000, v23, OS_LOG_TYPE_INFO, "Scheduling next upload requests right away", v28, 2u);
      }
      objc_msgSend_scheduleOrInvokeRepairsNow(self, v24, v25, v26);
    }
  }
  else
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v22 = ck_log_facility_data_repair;
    if (os_log_type_enabled((os_log_t)ck_log_facility_data_repair, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v27 = 0;
      _os_log_impl(&dword_18A5C5000, v22, OS_LOG_TYPE_INFO, "Attempted to schedule next upload request, but nothing to do", v27, 2u);
    }
  }

}

@end
