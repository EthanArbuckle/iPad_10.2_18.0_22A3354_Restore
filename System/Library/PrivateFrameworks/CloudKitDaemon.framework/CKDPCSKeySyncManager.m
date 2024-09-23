@implementation CKDPCSKeySyncManager

+ (id)sharedManager
{
  if (qword_1ED7028B0 != -1)
    dispatch_once(&qword_1ED7028B0, &unk_1E7833B88);
  return (id)qword_1ED7028A8;
}

- (CKDPCSKeySyncManager)init
{
  CKDPCSKeySyncManager *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *keySyncTrackerByServiceNameByAccount;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *keySyncQueue;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CKDPCSKeySyncManager;
  v2 = -[CKDPCSKeySyncManager init](&v9, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    keySyncTrackerByServiceNameByAccount = v2->_keySyncTrackerByServiceNameByAccount;
    v2->_keySyncTrackerByServiceNameByAccount = v3;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("com.apple.cloudkit.keySyncQueue", v5);
    keySyncQueue = v2->_keySyncQueue;
    v2->_keySyncQueue = (OS_dispatch_queue *)v6;

  }
  return v2;
}

- (id)_on_queue_getKeySyncTrackerByServicenameForAccount:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
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
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  void *v28;

  v4 = a3;
  objc_msgSend_keySyncTrackerByServiceNameByAccount(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dsid(v4, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v7, v11, (uint64_t)v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    v15 = (void *)objc_opt_new();
    objc_msgSend_keySyncTrackerByServiceNameByAccount(self, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_dsid(v4, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v18, v22, (uint64_t)v15, v21);

  }
  objc_msgSend_keySyncTrackerByServiceNameByAccount(self, v13, v14);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dsid(v4, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v23, v27, (uint64_t)v26);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

- (id)_on_queue_createSyncTrackerForAccount:(id)a3 requestorOperationID:(id)a4 service:(id)a5 manatee:(BOOL)a6 testOverrideProvider:(id)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  id v15;
  CKDPCSKeySyncTracker *v16;
  const char *v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  void *v28;
  const char *v29;

  v8 = a6;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v16 = objc_alloc_init(CKDPCSKeySyncTracker);
  objc_msgSend_setServiceName_(v16, v17, (uint64_t)v14);
  objc_msgSend_setManatee_(v16, v18, v8);
  objc_msgSend_dsid(v12, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAccountDsid_(v16, v22, (uint64_t)v21);

  objc_msgSend_setRequestorOperationID_(v16, v23, (uint64_t)v13);
  objc_msgSend_keySyncTrackerByServiceNameByAccount(self, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v26);
  objc_msgSend__on_queue_getKeySyncTrackerByServicenameForAccount_(self, v27, (uint64_t)v12);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v28, v29, (uint64_t)v16, v14);

  objc_sync_exit(v26);
  return v16;
}

- (id)createSyncTrackerForAccount:(id)a3 requestorOperationID:(id)a4 service:(id)a5 manatee:(BOOL)a6 testOverrideProvider:(id)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  id v14;
  id v15;
  const char *v16;
  uint64_t v17;
  NSObject *v18;
  const char *v19;
  void *v20;

  v7 = a6;
  v12 = a7;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  objc_msgSend_keySyncQueue(self, v16, v17);
  v18 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v18);

  objc_msgSend__on_queue_createSyncTrackerForAccount_requestorOperationID_service_manatee_testOverrideProvider_(self, v19, (uint64_t)v15, v14, v13, v7, v12);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)_on_queue_syncTrackerForAccount:(id)a3 requestorOperationID:(id)a4 service:(id)a5 manatee:(BOOL)a6 testOverrideProvider:(id)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  id v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;

  v8 = a6;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  objc_msgSend_keySyncTrackerByServiceNameByAccount(self, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v18);
  objc_msgSend__on_queue_getKeySyncTrackerByServicenameForAccount_(self, v19, (uint64_t)v12);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v20, v21, (uint64_t)v14);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend_state(v22, v23, v24);
  if (!v22 || v25 == 3)
  {
    objc_msgSend__on_queue_createSyncTrackerForAccount_requestorOperationID_service_manatee_testOverrideProvider_(self, v26, (uint64_t)v12, v13, v14, v8, v15);
    v27 = objc_claimAutoreleasedReturnValue();

    v22 = (void *)v27;
  }

  objc_sync_exit(v18);
  return v22;
}

- (id)syncTrackerForAccount:(id)a3 requestorOperationID:(id)a4 service:(id)a5 manatee:(BOOL)a6 testOverrideProvider:(id)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  id v14;
  id v15;
  const char *v16;
  uint64_t v17;
  NSObject *v18;
  const char *v19;
  void *v20;

  v7 = a6;
  v12 = a7;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  objc_msgSend_keySyncQueue(self, v16, v17);
  v18 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v18);

  objc_msgSend__on_queue_syncTrackerForAccount_requestorOperationID_service_manatee_testOverrideProvider_(self, v19, (uint64_t)v15, v14, v13, v7, v12);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (void)_on_queue_performKeySyncWithSyncTracker:(id)a3 testableSyncConfig:(unint64_t)a4 shouldThrottle:(BOOL)a5 testOverrideProvider:(id)a6 requestorOperationID:(id)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  NSObject *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  dispatch_group_t v29;
  const char *v30;
  const char *v31;
  uint64_t v32;
  NSObject *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  id v39;
  void (**v40)(void *, _QWORD, void *);
  id v41;
  id v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  const char *v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  NSObject *v62;
  const char *v63;
  uint64_t v64;
  const char *v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  const char *v69;
  void *v70;
  void *v71;
  const char *v72;
  SEL v73;
  void *v74;
  void *v75;
  _QWORD v76[4];
  id v77;
  CKDPCSKeySyncManager *v78;
  id v79;
  _QWORD aBlock[5];
  id v81;
  _QWORD v82[3];
  _QWORD v83[3];
  uint8_t buf[4];
  void *v85;
  __int16 v86;
  void *v87;
  __int16 v88;
  void *v89;
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v73 = a2;
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v18 = (void *)*MEMORY[0x1E0C952D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_INFO))
  {
    v19 = v18;
    objc_msgSend_serviceName(v14, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_accountDsid(v14, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_requestorOperationID(v14, v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v85 = v22;
    v86 = 2112;
    v87 = v25;
    v88 = 2114;
    v89 = v28;
    _os_log_impl(&dword_1BE990000, v19, OS_LOG_TYPE_INFO, "Starting user key sync for service: %{public}@, account dsid %@, operation %{public}@", buf, 0x20u);

  }
  v29 = dispatch_group_create();
  objc_msgSend_setSyncGroup_(v14, v30, (uint64_t)v29);

  objc_msgSend_syncGroup(v14, v31, v32);
  v33 = objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(v33);

  objc_msgSend_keySyncQueue(self, v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = v17;
  v75 = v16;
  objc_msgSend_waitOnSyncWithQueue_waiterOperationID_handler_(v14, v37, (uint64_t)v36, v16, v17);

  v38 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1BEB1D81C;
  aBlock[3] = &unk_1E7833BB0;
  aBlock[4] = self;
  v39 = v14;
  v81 = v39;
  v40 = (void (**)(void *, _QWORD, void *))_Block_copy(aBlock);
  v76[0] = v38;
  v76[1] = 3221225472;
  v76[2] = sub_1BEB1DBDC;
  v76[3] = &unk_1E7833BD8;
  v41 = v39;
  v77 = v41;
  v78 = self;
  v42 = v15;
  v79 = v42;
  v43 = _Block_copy(v76);
  v82[0] = *MEMORY[0x1E0D82B48];
  objc_msgSend_serviceName(v41, v44, v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v83[0] = v46;
  v82[1] = *MEMORY[0x1E0D82B18];
  objc_msgSend_accountDsid(v41, v47, v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v83[1] = v49;
  v82[2] = *MEMORY[0x1E0D82B30];
  v50 = _Block_copy(v43);
  v83[2] = v50;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v51, (uint64_t)v83, v82, 3);
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_sharedManager(MEMORY[0x1E0DC5EE8], v53, v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_currentPersona(v55, v56, v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_userPersonaUniqueString(v58, v59, v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v62 = *MEMORY[0x1E0C952D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v85 = v61;
    _os_log_impl(&dword_1BE990000, v62, OS_LOG_TYPE_INFO, "Starting user key sync on current persona %@", buf, 0xCu);
  }
  if (*MEMORY[0x1E0C95280])
  {
    objc_msgSend__pcsTestOverrideForKey_(v42, v63, (uint64_t)CFSTR("ExpectedPersonaIdentifier"));
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    if (v66 && (objc_msgSend_isEqualToString_(v61, v65, (uint64_t)v66) & 1) == 0)
    {
      objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v67, v68);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v71, v72, (uint64_t)v73, self, CFSTR("CKDPCSKeySyncManager.m"), 225, CFSTR("Expected persona identifier to match"));

    }
  }
  switch(a4)
  {
    case 2uLL:
      if (objc_msgSend_isManatee(v41, v63, v64))
        objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v69, *MEMORY[0x1E0C94B20], 5009, CFSTR("Underlying user key sync error"), v73);
      else
        objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v69, *MEMORY[0x1E0C94B20], 5000, CFSTR("Underlying user key sync error"), v73);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v40[2](v40, 0, v70);

      goto LABEL_23;
    case 1uLL:
      v40[2](v40, 1, 0);
LABEL_23:
      (*((void (**)(void *, _QWORD))v43 + 2))(v43, 0);
      break;
    case 0uLL:
      PCSSyncKeyRegistryWithOptions();
      break;
  }

}

- (void)performKeySyncWithSyncTracker:(id)a3 testableSyncConfig:(unint64_t)a4 shouldThrottle:(BOOL)a5 testOverrideProvider:(id)a6 requestorOperationID:(id)a7 completionHandler:(id)a8
{
  _BOOL8 v10;
  id v14;
  id v15;
  id v16;
  const char *v17;
  uint64_t v18;
  NSObject *v19;
  const char *v20;
  id v21;

  v10 = a5;
  v14 = a8;
  v15 = a7;
  v16 = a6;
  v21 = a3;
  objc_msgSend_keySyncQueue(self, v17, v18);
  v19 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v19);

  objc_msgSend__on_queue_performKeySyncWithSyncTracker_testableSyncConfig_shouldThrottle_testOverrideProvider_requestorOperationID_completionHandler_(self, v20, (uint64_t)v21, a4, v10, v16, v15, v14);
}

- (void)getKeySyncEligibilityForService:(id)a3 isManatee:(BOOL)a4 account:(id)a5 lastModifiedDate:(id)a6 testOverrideProvider:(id)a7 completionHandler:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  const char *v17;
  uint64_t v18;
  id v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  NSObject *v29;
  NSObject *v30;
  _QWORD block[5];
  id v32;
  id v33;
  id v34;
  id v35;
  uint8_t buf[16];

  v13 = a3;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v19 = a8;
  if (*MEMORY[0x1E0C95280]
    && objc_msgSend__checkAndClearPCSTestOverrideForKey_(v16, v17, (uint64_t)CFSTR("ResetKeySyncState")))
  {
    objc_msgSend_keySyncTrackerByServiceNameByAccount(self, v17, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v20);
    objc_msgSend_keySyncTrackerByServiceNameByAccount(self, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_removeAllObjects(v23, v24, v25);

    objc_sync_exit(v20);
  }
  objc_msgSend_dsid(v14, v17, v18);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    objc_msgSend_keySyncQueue(self, v27, v28);
    v29 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1BEB1E17C;
    block[3] = &unk_1E782F430;
    block[4] = self;
    v32 = v14;
    v33 = v13;
    v34 = v15;
    v35 = v19;
    dispatch_async(v29, block);

  }
  else
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v30 = *MEMORY[0x1E0C952D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE990000, v30, OS_LOG_TYPE_INFO, "No account DSID, so we can't start user key sync", buf, 2u);
    }
    if (v19)
      (*((void (**)(id, _QWORD))v19 + 2))(v19, 0);
  }

}

- (void)syncUserKeysForService:(id)a3 context:(id)a4 bundleID:(id)a5 serviceIsManatee:(BOOL)a6 account:(id)a7 shouldThrottle:(BOOL)a8 testOverrideProvider:(id)a9 requestorOperationID:(id)a10 completionHandler:(id)a11
{
  id v16;
  id v17;
  id v18;
  const char *v19;
  uint64_t v20;
  id v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  CKDPCSKeySyncCoreAnalytics *v30;
  const char *v31;
  const char *v32;
  void *v33;
  const char *v34;
  const char *v35;
  void *v36;
  const char *v37;
  const char *v38;
  const char *v39;
  const char *v40;
  const char *v41;
  uint64_t v42;
  char v43;
  const char *v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  char v48;
  const char *v49;
  char v50;
  const char *v51;
  CKDPCSKeySyncCoreAnalytics *v52;
  NSObject *v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  unsigned int v57;
  unsigned int v58;
  void *v59;
  id v60;
  id v61;
  id v62;
  _QWORD block[5];
  CKDPCSKeySyncCoreAnalytics *v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  _QWORD *v71;
  char v72;
  char v73;
  char v74;
  BOOL v75;
  char v76;
  _QWORD v77[5];

  LODWORD(v56) = a8;
  HIDWORD(v56) = a6;
  v16 = a3;
  v62 = a4;
  v61 = a5;
  v17 = a7;
  v18 = a9;
  v60 = a10;
  v21 = a11;
  if (!v16)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v19, v20);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v54, v55, (uint64_t)a2, self, CFSTR("CKDPCSKeySyncManager.m"), 302, CFSTR("Must provide a service name to syncUserKeys"));

  }
  objc_msgSend_date(MEMORY[0x1E0C99D68], v19, v20, v56);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v77[0] = 0;
  v77[1] = v77;
  v77[2] = 0x2020000000;
  v77[3] = 0;
  v24 = objc_msgSend_accountType(v17, v22, v23);
  v25 = v24 == 0;
  objc_msgSend_dsid(v17, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    v30 = objc_alloc_init(CKDPCSKeySyncCoreAnalytics);
    objc_msgSend_setServiceName_(v30, v31, (uint64_t)v16);
    objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v32, v58);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setIsManatee_(v30, v34, (uint64_t)v33);

    objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v35, v57);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setShouldThrottle_(v30, v37, (uint64_t)v36);

    objc_msgSend_setThrottledDurationSec_(v30, v38, (uint64_t)&unk_1E78B0130);
    objc_msgSend_setContext_(v30, v39, (uint64_t)v62);
    objc_msgSend_setBundleID_(v30, v40, (uint64_t)v61);
    if (*MEMORY[0x1E0C95280])
    {
      v43 = objc_msgSend__checkPCSTestOverrideForKey_(v18, v41, (uint64_t)CFSTR("AllowThrottlingWithUnitTestAccount"));
      if (v24)
        v25 = v43;
      else
        v25 = 1;
      objc_msgSend__pcsTestOverrideForKey_(v18, v44, (uint64_t)CFSTR("ResetKeySyncState"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend_BOOLValue(v45, v46, v47);

      v50 = objc_msgSend__checkAndClearPCSTestOverrideForKey_(v18, v49, (uint64_t)CFSTR("ForceKeySyncFailure"));
      if (objc_msgSend_isEqualToString_(v16, v51, (uint64_t)CFSTR("com.apple.reminders")))
        v50 |= objc_msgSend__checkAndClearPCSTestOverrideForKey_(v18, v41, (uint64_t)CFSTR("ForceKeySyncFailureForReminders"));
    }
    else
    {
      v50 = 0;
      v48 = 0;
    }
    objc_msgSend_keySyncQueue(self, v41, v42);
    v53 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1BEB1E788;
    block[3] = &unk_1E7833C28;
    v72 = v48;
    block[4] = self;
    v64 = v30;
    v71 = v77;
    v65 = v59;
    v73 = v58;
    v70 = v21;
    v66 = v17;
    v67 = v60;
    v68 = v16;
    v69 = v18;
    v74 = v57;
    v75 = v25;
    v76 = v50;
    v52 = v30;
    dispatch_async(v53, block);

  }
  else
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v29, *MEMORY[0x1E0C94B20], 1002, CFSTR("No account DSID, so we can't start user key sync"));
    v52 = (CKDPCSKeySyncCoreAnalytics *)objc_claimAutoreleasedReturnValue();
    if (v21)
      (*((void (**)(id, _QWORD, CKDPCSKeySyncCoreAnalytics *, _QWORD))v21 + 2))(v21, 0, v52, 0);
  }

  _Block_object_dispose(v77, 8);
}

- (NSMutableDictionary)keySyncTrackerByServiceNameByAccount
{
  return self->_keySyncTrackerByServiceNameByAccount;
}

- (void)setKeySyncTrackerByServiceNameByAccount:(id)a3
{
  objc_storeStrong((id *)&self->_keySyncTrackerByServiceNameByAccount, a3);
}

- (OS_dispatch_queue)keySyncQueue
{
  return self->_keySyncQueue;
}

- (void)setKeySyncQueue:(id)a3
{
  objc_storeStrong((id *)&self->_keySyncQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keySyncQueue, 0);
  objc_storeStrong((id *)&self->_keySyncTrackerByServiceNameByAccount, 0);
}

@end
