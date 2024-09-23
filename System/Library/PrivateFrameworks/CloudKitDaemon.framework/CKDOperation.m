@implementation CKDOperation

- (void)setRequest:(id)a3
{
  CKDOperation *v5;
  CKDOperation *v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  _QWORD *v10;
  NSObject *v11;
  objc_class *v12;
  id v13;
  const char *v14;
  uint64_t v15;
  id v16;
  const char *v17;
  uint64_t v18;
  id v19;
  const char *v20;
  uint64_t v21;
  CKDOperation *v22;
  void *v23;
  void *v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  NSObject *v35;
  objc_class *v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  objc_class *v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  int v46;
  id v47;
  __int16 v48;
  CKDOperation *v49;
  __int16 v50;
  id v51;
  __int16 v52;
  id v53;
  __int16 v54;
  CKDOperation *v55;
  __int16 v56;
  void *v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v5 = (CKDOperation *)a3;
  v6 = self;
  objc_sync_enter(v6);
  if ((objc_msgSend_isEqual_(v5, v7, (uint64_t)v6->_request) & 1) != 0)
  {
    objc_sync_exit(v6);

  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x1E0C95300];
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v11 = (id)*MEMORY[0x1E0C952D0];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_ckShortDescription(v6, v14, v15);
      v16 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_ckShortDescription(v6->_request, v17, v18);
      v19 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_ckShortDescription(v5, v20, v21);
      v22 = (CKDOperation *)objc_claimAutoreleasedReturnValue();
      v46 = 138544386;
      v47 = v13;
      v48 = 2048;
      v49 = v6;
      v50 = 2114;
      v51 = v16;
      v52 = 2114;
      v53 = v19;
      v54 = 2114;
      v55 = v22;
      _os_log_impl(&dword_1BE990000, v11, OS_LOG_TYPE_DEFAULT, "Operation <%{public}@: %p; %{public}@>, setting current request from %{public}@ to %{public}@",
        (uint8_t *)&v46,
        0x34u);

    }
    objc_storeStrong((id *)&v6->_request, a3);
    objc_sync_exit(v6);

    if (v5)
    {
      objc_msgSend_configureRequest_(v6, v8, (uint64_t)v5);
      if (*v10 != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v23 = (void *)*MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
      {
        v35 = v23;
        v36 = (objc_class *)objc_opt_class();
        NSStringFromClass(v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_ckShortDescription(v5, v38, v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = (objc_class *)objc_opt_class();
        NSStringFromClass(v41);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_ckShortDescription(v6, v43, v44);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = 138544642;
        v47 = v37;
        v48 = 2048;
        v49 = v5;
        v50 = 2114;
        v51 = v40;
        v52 = 2114;
        v53 = v42;
        v54 = 2048;
        v55 = v6;
        v56 = 2114;
        v57 = v45;
        _os_log_debug_impl(&dword_1BE990000, v35, OS_LOG_TYPE_DEBUG, "Configured request <%{public}@: %p; %{public}@> for operation <%{public}@: %p; %{public}@>",
          (uint8_t *)&v46,
          0x3Eu);

      }
    }
  }
  objc_msgSend_additionalRequestHTTPHeaders(v6, v8, v9);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClientProvidedAdditionalHeaderValues_(v5, v25, (uint64_t)v24);

  if (*MEMORY[0x1E0C95280])
  {
    objc_msgSend_unitTestOverrides(v6, v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setUnitTestOverrides_(v5, v29, (uint64_t)v28);

  }
  if (objc_msgSend_isCancelled(v6, v26, v27))
  {
    objc_msgSend_request(v6, v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_cancel(v32, v33, v34);

  }
}

- (void)configureRequest:(id)a3
{
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
  const char *v14;
  id v15;

  v15 = a3;
  objc_msgSend_requestUUIDs(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v6);
  objc_msgSend_requestUUIDs(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_requestUUID(v15, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v9, v13, (uint64_t)v12);

  objc_sync_exit(v6);
  objc_msgSend_updateCloudKitMetrics_(self, v14, (uint64_t)&unk_1E7830708);

}

- (void)combineMetricsWithOperation:(id)a3
{
  id v4;
  const char *v5;
  const char *v6;
  id v7;
  CKDOperationMetrics *v8;
  CKDOperationMetrics *MMCSMetrics;
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
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  objc_msgSend_addCKSpecificMetricsFromMetrics_(self->_cloudKitMetrics, v5, *((_QWORD *)v4 + 32));
  v7 = *((id *)v4 + 33);
  if (v7)
  {
    if (!self->_MMCSMetrics)
    {
      v8 = (CKDOperationMetrics *)objc_opt_new();
      MMCSMetrics = self->_MMCSMetrics;
      self->_MMCSMetrics = v8;

    }
    v24[0] = v7;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v6, (uint64_t)v24, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    MMCSOperationMetricCombineMetrics();

  }
  os_unfair_recursive_lock_unlock();
  objc_msgSend_requestUUIDs(v4, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v13);
  objc_msgSend_requestUUIDs(self, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v16);
  objc_msgSend_requestUUIDs(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_requestUUIDs(v4, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObjectsFromArray_(v19, v23, (uint64_t)v22);

  objc_sync_exit(v16);
  objc_sync_exit(v13);

}

- (void)spawnAndRunOperationOfClass:(Class)a3 operationInfo:(id)a4 spawnQueue:(id)a5 container:(id)a6 operationConfigurationBlock:(id)a7
{
  id v12;
  id v13;
  void (**v14)(id, void *);
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  const char *v19;
  id v20;
  const char *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  _QWORD *v27;
  os_log_t *v28;
  void *v29;
  const char *v30;
  NSObject *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  _BOOL4 v45;
  void *v46;
  id v47;
  const char *v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  NSObject *v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  const char *v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  const char *v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  os_log_t v72;
  const char *v73;
  void *v74;
  const char *v75;
  NSObject *v76;
  const char *v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  void *v82;
  id v83;
  _QWORD v84[5];
  id v85;
  uint8_t buf[4];
  void *v87;
  __int16 v88;
  void *v89;
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v83 = a5;
  v13 = a6;
  v14 = (void (**)(id, void *))a7;
  objc_msgSend_operationInfo(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_takeValuesFromParentOperationInfo_(v12, v18, (uint64_t)v17);

  objc_msgSend_setParentOperation_(v12, v19, (uint64_t)self);
  v20 = [a3 alloc];
  v22 = (void *)objc_msgSend_initWithOperationInfo_container_(v20, v21, (uint64_t)v12, v13);
  v25 = objc_msgSend_useEncryption(self, v23, v24);
  objc_msgSend_setUseEncryption_(v22, v26, v25);
  if (v14)
    v14[2](v14, v22);
  v27 = (_QWORD *)MEMORY[0x1E0C95300];
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v28 = (os_log_t *)MEMORY[0x1E0C952B0];
  v29 = (void *)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
  {
    v31 = v29;
    objc_msgSend_operationID(v22, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_operationID(self, v35, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v87 = v34;
    v88 = 2114;
    v89 = v37;
    _os_log_impl(&dword_1BE990000, v31, OS_LOG_TYPE_INFO, "Adding child operation %{public}@ to parent operation %{public}@", buf, 0x16u);

  }
  objc_msgSend_setParentOperation_(v22, v30, (uint64_t)self);
  objc_msgSend_requestCompletedBlock(self, v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRequestCompletedBlock_(v22, v41, (uint64_t)v40);

  if (v83)
  {
    objc_msgSend_addOperation_(v83, v42, (uint64_t)v22);
  }
  else if (!v13
         || (objc_msgSend_operationQueue(v13, v42, v43),
             v44 = (void *)objc_claimAutoreleasedReturnValue(),
             v45 = v44 == 0,
             v44,
             v45))
  {
    if (*v27 != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v72 = *v28;
    if (os_log_type_enabled(*v28, OS_LOG_TYPE_DEBUG))
    {
      v76 = v72;
      objc_msgSend_operationID(v22, v77, v78);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_operationID(self, v80, v81);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v87 = v79;
      v88 = 2114;
      v89 = v82;
      _os_log_debug_impl(&dword_1BE990000, v76, OS_LOG_TYPE_DEBUG, "Child operation %{public}@ was added to parent %{public}@ but the parent has no container or operation queue to run that operation on", buf, 0x16u);

    }
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v73, *MEMORY[0x1E0C94B20], 1, CFSTR("Can't run a child operation on an orphaned parent operation"));
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_finishWithError_(v22, v75, (uint64_t)v74);

  }
  else
  {
    v46 = (void *)MEMORY[0x1E0CB34C8];
    v84[0] = MEMORY[0x1E0C809B0];
    v84[1] = 3221225472;
    v84[2] = sub_1BE999F2C;
    v84[3] = &unk_1E782EE20;
    v84[4] = self;
    v47 = v22;
    v85 = v47;
    objc_msgSend_blockOperationWithBlock_(v46, v48, (uint64_t)v84);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_childOperationsGroup(self, v50, v51);
    v52 = objc_claimAutoreleasedReturnValue();
    dispatch_group_enter(v52);

    objc_msgSend_childOperations(self, v53, v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v55);
    objc_msgSend_childOperations(self, v56, v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v58, v59, (uint64_t)v47);

    objc_sync_exit(v55);
    if (objc_msgSend_isCancelled(self, v60, v61))
      objc_msgSend_cancel(v47, v62, v63);
    objc_msgSend_addDependency_(v49, v62, (uint64_t)v47);
    objc_msgSend_cleanupOperationQueue(v13, v64, v65);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addOperation_(v66, v67, (uint64_t)v49);

    objc_msgSend_operationQueue(v13, v68, v69);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addOperation_(v70, v71, (uint64_t)v47);

  }
}

- (void)setUseEncryption:(BOOL)a3
{
  self->_useEncryption = a3;
}

- (double)timeoutIntervalForResource
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  double v6;
  double v7;

  objc_msgSend_operationInfo(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_timeoutIntervalForResource(v3, v4, v5);
  v7 = v6;

  return v7;
}

- (double)timeoutIntervalForRequest
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  double v6;
  double v7;

  objc_msgSend_operationInfo(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_timeoutIntervalForRequest(v3, v4, v5);
  v7 = v6;

  return v7;
}

- (BOOL)expectDelayBeforeRequestBegins
{
  uint64_t v2;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  BOOL result;

  v4 = objc_msgSend_duetPreClearedMode(self, a2, v2);
  result = objc_msgSend_usesBackgroundSession(self, v5, v6);
  if (v4)
    return 0;
  return result;
}

- (NSString)applicationBundleIdentifierForNetworkAttribution
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
  uint64_t v12;

  objc_msgSend_operationInfo(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_applicationBundleIdentifierOverrideForNetworkAttribution(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend_container(self, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_applicationBundleIdentifierForNetworkAttribution(v10, v11, v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v7;
}

- (void)_finishInternalOnCallbackQueueWithError:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  NSObject *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  os_signpost_id_t v22;
  dispatch_block_t *v23;
  void *v24;
  _QWORD *v25;
  os_log_t *v26;
  NSObject *v27;
  const char *v28;
  uint64_t v29;
  NSObject *v30;
  const char *v31;
  uint64_t v32;
  os_log_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  os_log_t v43;
  NSObject *v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  NSObject *v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  uint8_t buf[4];
  id v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_callbackQueue(self, v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  objc_msgSend_signpost(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend_signpost(self, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_log(v13, v14, v15);
    v16 = objc_claimAutoreleasedReturnValue();

    objc_msgSend_signpost(self, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend_identifier(v19, v20, v21);

    if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      *(_DWORD *)buf = 138412290;
      v54 = v4;
      _os_signpost_emit_with_name_impl(&dword_1BE990000, v16, OS_SIGNPOST_EVENT, v22, "CKDOperation", "Finishing with error: %@", buf, 0xCu);
    }

  }
  v23 = (dispatch_block_t *)MEMORY[0x1E0C952F8];
  v24 = (void *)*MEMORY[0x1E0C952F8];
  v25 = (_QWORD *)MEMORY[0x1E0C95300];
  v26 = (os_log_t *)MEMORY[0x1E0C952B0];
  if (v4)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], v24);
    v27 = *MEMORY[0x1E0C952D0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE990000, v27, OS_LOG_TYPE_DEFAULT, "Operation is finishing on callback queue with an error", buf, 2u);
    }
  }
  else
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], v24);
    v30 = *v26;
    if (os_log_type_enabled(*v26, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1BE990000, v30, OS_LOG_TYPE_DEBUG, "Operation is finishing on callback queue with no error", buf, 2u);
    }
  }
  if ((objc_msgSend_isExecuting(self, v28, v29) & 1) != 0)
    goto LABEL_19;
  if (*v25 != -1)
    dispatch_once(MEMORY[0x1E0C95300], *v23);
  v33 = *v26;
  if (os_log_type_enabled(*v26, OS_LOG_TYPE_DEBUG))
  {
    v49 = v33;
    objc_msgSend_operationID(self, v50, v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v54 = v52;
    _os_log_debug_impl(&dword_1BE990000, v49, OS_LOG_TYPE_DEBUG, "The operation %{public}@ didn't start or is already finished", buf, 0xCu);

    if (v4)
      goto LABEL_23;
  }
  else
  {
LABEL_19:
    if (v4)
      goto LABEL_23;
  }
  if (objc_msgSend_isCancelled(self, v31, v32))
  {
    v34 = (void *)MEMORY[0x1E0C94FF8];
    v35 = *MEMORY[0x1E0C94B20];
    objc_msgSend_operationID(self, v31, v32);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_format_(v34, v37, v35, 1, CFSTR("Operation %@ was cancelled"), v36);
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
LABEL_23:
  objc_msgSend_error(self, v31, v32);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v38)
    objc_msgSend_setError_(self, v39, (uint64_t)v4);
  if ((objc_msgSend_isFinished(self, v39, v40) & 1) == 0)
  {
    objc_msgSend_error(self, v41, v42);
    v44 = objc_claimAutoreleasedReturnValue();
    objc_msgSend__finishOnCallbackQueueWithError_(self, v48, (uint64_t)v44);
    goto LABEL_31;
  }
  if (*v25 != -1)
    dispatch_once(MEMORY[0x1E0C95300], *v23);
  v43 = *v26;
  if (os_log_type_enabled(*v26, OS_LOG_TYPE_DEBUG))
  {
    v44 = v43;
    objc_msgSend_operationID(self, v45, v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v54 = v47;
    _os_log_debug_impl(&dword_1BE990000, v44, OS_LOG_TYPE_DEBUG, "Ignoring _finishInternalOnCallbackQueue invocation on already-finished operation %{public}@", buf, 0xCu);

LABEL_31:
  }

}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 352, 1);
}

- (void)setError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 352);
}

- (void)finishWithError:(id)a3
{
  id v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  os_log_t *v16;
  os_log_t v17;
  const char *v18;
  uint64_t v19;
  NSObject *v20;
  const char *v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  NSObject *v25;
  const char *v26;
  uint64_t v27;
  NSObject *v28;
  intptr_t v29;
  os_log_t v30;
  BOOL v31;
  const char *v32;
  uint64_t v33;
  NSObject *v34;
  const char *v35;
  uint64_t v36;
  NSObject *v37;
  NSObject *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  os_log_t v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  id v51;
  const char *v52;
  NSObject *v53;
  id v54;
  NSObject *v55;
  const char *v56;
  uint64_t v57;
  void *v58;
  NSObject *v59;
  const char *v60;
  uint64_t v61;
  void *v62;
  NSObject *v63;
  const char *v64;
  uint64_t v65;
  void *v66;
  _QWORD v67[5];
  id v68;
  _QWORD v69[4];
  id v70;
  NSObject *v71;
  _QWORD v72[5];
  NSObject *v73;
  BOOL v74;
  _QWORD block[5];
  NSObject *v76;
  uint64_t v77;
  uint8_t buf[4];
  uint64_t v79;
  __int16 v80;
  void *v81;
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = dispatch_group_create();
  objc_msgSend_childOperations(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v8);
  objc_msgSend_childOperations(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend_count(v11, v12, v13);

  objc_sync_exit(v8);
  v15 = (_QWORD *)MEMORY[0x1E0C95300];
  v16 = (os_log_t *)MEMORY[0x1E0C952B0];
  if (v14)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v17 = *v16;
    if (os_log_type_enabled(*v16, OS_LOG_TYPE_DEBUG))
    {
      v55 = v17;
      objc_msgSend_operationID(self, v56, v57);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v79 = v14;
      v80 = 2114;
      v81 = v58;
      _os_log_debug_impl(&dword_1BE990000, v55, OS_LOG_TYPE_DEBUG, "Waiting for all (%lu) child operations to finish for operation %{public}@", buf, 0x16u);

    }
  }
  dispatch_group_enter(v5);
  objc_msgSend_childOperationsGroup(self, v18, v19);
  v20 = objc_claimAutoreleasedReturnValue();
  objc_msgSend_callbackQueue(self, v21, v22);
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BE9BB678;
  block[3] = &unk_1E7830158;
  v77 = v14;
  block[4] = self;
  v25 = v5;
  v76 = v25;
  dispatch_group_notify(v20, v23, block);

  objc_msgSend_stateTransitionGroup(self, v26, v27);
  v28 = objc_claimAutoreleasedReturnValue();
  v29 = dispatch_group_wait(v28, 0);

  if (v29)
  {
    if (*v15 != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v30 = *v16;
    if (os_log_type_enabled(*v16, OS_LOG_TYPE_DEBUG))
    {
      v59 = v30;
      objc_msgSend_operationID(self, v60, v61);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v79 = (uint64_t)v62;
      _os_log_debug_impl(&dword_1BE990000, v59, OS_LOG_TYPE_DEBUG, "Operation %{public}@ is waiting for its state transition lock holders to finish before it can complete", buf, 0xCu);

    }
  }
  v31 = v29 != 0;
  dispatch_group_enter(v25);
  objc_msgSend_stateTransitionGroup(self, v32, v33);
  v34 = objc_claimAutoreleasedReturnValue();
  objc_msgSend_callbackQueue(self, v35, v36);
  v37 = objc_claimAutoreleasedReturnValue();
  v72[0] = v24;
  v72[1] = 3221225472;
  v72[2] = sub_1BEA40760;
  v72[3] = &unk_1E7830628;
  v74 = v31;
  v72[4] = self;
  v38 = v25;
  v73 = v38;
  dispatch_group_notify(v34, v37, v72);

  objc_msgSend_clientOperationCallbackProxy(self, v39, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  if (v41)
  {
    if (*v15 != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v44 = *v16;
    if (os_log_type_enabled(*v16, OS_LOG_TYPE_DEBUG))
    {
      v63 = v44;
      objc_msgSend_operationID(self, v64, v65);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v79 = (uint64_t)v66;
      _os_log_debug_impl(&dword_1BE990000, v63, OS_LOG_TYPE_DEBUG, "Waiting for all client callbacks to finish for operation %{public}@", buf, 0xCu);

    }
    dispatch_group_enter(v38);
    objc_msgSend_operationID(self, v45, v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_clientOperationCallbackProxy(self, v48, v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v69[0] = v24;
    v69[1] = 3221225472;
    v69[2] = sub_1BEA40870;
    v69[3] = &unk_1E782EE20;
    v70 = v47;
    v71 = v38;
    v51 = v47;
    objc_msgSend_addBarrierBlock_(v50, v52, (uint64_t)v69);

  }
  objc_msgSend_callbackQueue(self, v42, v43);
  v53 = objc_claimAutoreleasedReturnValue();
  v67[0] = v24;
  v67[1] = 3221225472;
  v67[2] = sub_1BEA40950;
  v67[3] = &unk_1E782EE20;
  v67[4] = self;
  v68 = v4;
  v54 = v4;
  dispatch_group_notify(v38, v53, v67);

}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (OS_dispatch_group)stateTransitionGroup
{
  return self->_stateTransitionGroup;
}

- (OS_dispatch_group)childOperationsGroup
{
  return self->_childOperationsGroup;
}

- (id)baseOperationAndErrorInfoCoreAnalyticsPayloadWithError:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
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
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  void *v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  objc_class *v35;
  void *v36;
  const char *v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  void *v43;
  const char *v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  const char *v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  const char *v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  const char *v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  const char *v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  __CFString *v81;
  const char *v82;
  const char *v83;
  uint64_t v84;
  void *v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  const char *v90;
  void *v91;
  const char *v92;
  void *v93;
  const char *v94;
  const char *v95;
  uint64_t v96;
  const char *v97;
  void *v98;

  v4 = a3;
  objc_msgSend_container(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_containerID(v7, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_containerIdentifier(v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v10, v17, (uint64_t)v16, 0x1E783B268);

  v18 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_containerID(v7, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend_environment(v21, v22, v23);
  objc_msgSend_numberWithInteger_(v18, v25, v24);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v10, v27, (uint64_t)v26, 0x1E7839008);

  objc_msgSend_containerID(v7, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_environment(v30, v31, v32);
  CKContainerEnvironmentString();
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v10, v34, (uint64_t)v33, 0x1E784B3E8);

  v35 = (objc_class *)objc_opt_class();
  NSStringFromClass(v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v10, v37, (uint64_t)v36, 0x1E784B408);

  v38 = (void *)MEMORY[0x1E0CB37E8];
  v41 = objc_msgSend_qualityOfService(self, v39, v40);
  objc_msgSend_numberWithInteger_(v38, v42, v41);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v10, v44, (uint64_t)v43, 0x1E784B428);

  objc_msgSend_qualityOfService(self, v45, v46);
  CKStringForQOS();
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v10, v48, (uint64_t)v47, 0x1E784B448);

  objc_msgSend_applicationBundleID(v7, v49, v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v10, v52, (uint64_t)v51, 0x1E784B468);

  objc_msgSend_operationInfo(self, v53, v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_applicationBundleIdentifierOverrideForContainerAccess(v55, v56, v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v10, v59, (uint64_t)v58, 0x1E783B8E8);

  objc_msgSend_operationInfo(self, v60, v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_applicationBundleIdentifierOverrideForNetworkAttribution(v62, v63, v64);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v10, v66, (uint64_t)v65, 0x1E783B908);

  objc_msgSend_operationGroupQuantityNumber(self, v67, v68);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v10, v70, (uint64_t)v69, 0x1E7844508);

  objc_msgSend_operationGroupName(self, v71, v72);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v10, v74, (uint64_t)v73, 0x1E783B828);

  objc_msgSend_operationInfo(self, v75, v76);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = objc_msgSend_requestOriginator(v77, v78, v79);
  if ((unint64_t)(v80 - 1) > 4)
    v81 = CFSTR("unknown");
  else
    v81 = off_1E7830770[v80 - 1];

  objc_msgSend_setObject_forKeyedSubscript_(v10, v82, (uint64_t)v81, 0x1E7844608);
  if (v4)
  {
    objc_msgSend_CKClientSuitableError(v4, v83, v84);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = (void *)MEMORY[0x1E0CB37E8];
    v89 = objc_msgSend_code(v85, v87, v88);
    objc_msgSend_numberWithInteger_(v86, v90, v89);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v10, v92, (uint64_t)v91, 0x1E784B488);

    CKErrorChainStringFromError();
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v10, v94, (uint64_t)v93, 0x1E784B4A8);

    objc_msgSend_CKStringForWellKnownCKErrors(v85, v95, v96);
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    if (v98)
      objc_msgSend_setObject_forKeyedSubscript_(v10, v97, (uint64_t)v98, 0x1E784B4C8);

  }
  return v10;
}

- (id)analyticsPayload
{
  uint64_t v2;
  void *v4;
  const char *v5;
  void *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  void *v33;
  const char *v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  void *v40;
  const char *v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  void *v47;
  const char *v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  void *v54;
  const char *v55;
  const char *v56;
  uint64_t v57;
  CKDOperationMetrics *MMCSMetrics;
  void *v59;
  const char *v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  const char *v82;
  void *v83;
  const char *v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  const char *v89;
  void *v90;
  const char *v91;
  void *v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  const char *v96;
  void *v97;
  const char *v98;
  void *v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  const char *v103;
  void *v104;
  const char *v105;

  objc_msgSend_error(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_baseOperationAndErrorInfoCoreAnalyticsPayloadWithError_(self, v5, (uint64_t)v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_recursive_lock_lock_with_options();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_duration(self->_cloudKitMetrics, v8, v9);
  objc_msgSend_numberWithDouble_(v7, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v6, v13, (uint64_t)v12, 0x1E7847868);

  v14 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_queueing(self->_cloudKitMetrics, v15, v16);
  objc_msgSend_numberWithDouble_(v14, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v6, v20, (uint64_t)v19, 0x1E784B4E8);

  v21 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_executing(self->_cloudKitMetrics, v22, v23);
  objc_msgSend_numberWithDouble_(v21, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v6, v27, (uint64_t)v26, 0x1E784B508);

  v28 = (void *)MEMORY[0x1E0CB37E8];
  v31 = objc_msgSend_bytesUploaded(self->_cloudKitMetrics, v29, v30);
  objc_msgSend_numberWithUnsignedInteger_(v28, v32, v31);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v6, v34, (uint64_t)v33, 0x1E7847888);

  v35 = (void *)MEMORY[0x1E0CB37E8];
  v38 = objc_msgSend_bytesDownloaded(self->_cloudKitMetrics, v36, v37);
  objc_msgSend_numberWithUnsignedInteger_(v35, v39, v38);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v6, v41, (uint64_t)v40, 0x1E78478A8);

  v42 = (void *)MEMORY[0x1E0CB37E8];
  v45 = objc_msgSend_connections(self->_cloudKitMetrics, v43, v44);
  objc_msgSend_numberWithUnsignedInteger_(v42, v46, v45);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v6, v48, (uint64_t)v47, 0x1E78478C8);

  v49 = (void *)MEMORY[0x1E0CB37E8];
  v52 = objc_msgSend_connectionsCreated(self->_cloudKitMetrics, v50, v51);
  objc_msgSend_numberWithUnsignedInteger_(v49, v53, v52);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v6, v55, (uint64_t)v54, 0x1E78478E8);

  MMCSMetrics = self->_MMCSMetrics;
  if (MMCSMetrics)
  {
    v59 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend_duration(MMCSMetrics, v56, v57);
    objc_msgSend_numberWithDouble_(v59, v60, v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v6, v63, (uint64_t)v62, 0x1E7847A48);

    v64 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend_queueing(self->_MMCSMetrics, v65, v66);
    objc_msgSend_numberWithDouble_(v64, v67, v68);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v6, v70, (uint64_t)v69, 0x1E784B528);

    v71 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend_executing(self->_MMCSMetrics, v72, v73);
    objc_msgSend_numberWithDouble_(v71, v74, v75);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v6, v77, (uint64_t)v76, 0x1E784B548);

    v78 = (void *)MEMORY[0x1E0CB37E8];
    v81 = objc_msgSend_bytesUploaded(self->_MMCSMetrics, v79, v80);
    objc_msgSend_numberWithUnsignedInteger_(v78, v82, v81);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v6, v84, (uint64_t)v83, 0x1E7847A68);

    v85 = (void *)MEMORY[0x1E0CB37E8];
    v88 = objc_msgSend_bytesDownloaded(self->_MMCSMetrics, v86, v87);
    objc_msgSend_numberWithUnsignedInteger_(v85, v89, v88);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v6, v91, (uint64_t)v90, 0x1E7847A88);

    v92 = (void *)MEMORY[0x1E0CB37E8];
    v95 = objc_msgSend_connections(self->_MMCSMetrics, v93, v94);
    objc_msgSend_numberWithUnsignedInteger_(v92, v96, v95);
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v6, v98, (uint64_t)v97, 0x1E7847AA8);

    v99 = (void *)MEMORY[0x1E0CB37E8];
    v102 = objc_msgSend_connectionsCreated(self->_MMCSMetrics, v100, v101);
    objc_msgSend_numberWithUnsignedInteger_(v99, v103, v102);
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v6, v105, (uint64_t)v104, 0x1E7847AC8);

  }
  os_unfair_recursive_lock_unlock();
  return v6;
}

- (void)_determineNetworkServiceType
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  void *v33;
  _BOOL4 v34;
  id v35;
  id v36;
  const char *v37;
  void (**v38)(void *, void *, uint64_t);
  const char *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  NSObject *v55;
  const char *v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  NSObject *v60;
  const char *v61;
  const char *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  void (*v68)(uint64_t, void *, uint64_t);
  void *v69;
  CKDOperation *v70;
  id v71;
  id v72;
  uint64_t *v73;
  uint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  char v77;
  uint8_t buf[4];
  void *v79;
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  objc_msgSend_operationInfo(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_group(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend_expectedSendSize(v7, v8, v9);
  v13 = objc_msgSend_expectedReceiveSize(v7, v11, v12);
  if (v10 | v13)
  {
    v16 = v13;
    v74 = 0;
    v75 = &v74;
    v76 = 0x2020000000;
    v77 = 0;
    objc_msgSend_systemImposedInfo(v7, v14, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v17)
      *((_BYTE *)v75 + 24) = 1;
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v18 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1BE990000, v18, OS_LOG_TYPE_DEBUG, "Determining Network Service Types", buf, 2u);
    }
    v19 = (void *)objc_opt_new();
    v22 = objc_msgSend_expectedSendSize(v7, v20, v21);
    objc_msgSend_setExpectedSendSize_(v19, v23, v22);
    v26 = objc_msgSend_expectedReceiveSize(v7, v24, v25);
    objc_msgSend_setExpectedReceiveSize_(v19, v27, v26);
    v28 = (void *)objc_opt_new();
    objc_msgSend_networkServiceTypePerConfig(v17, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setNetworkServiceTypePerConfig_(v19, v32, (uint64_t)v28);
    v33 = (void *)objc_opt_new();
    v34 = v10 != 0;
    v66 = MEMORY[0x1E0C809B0];
    v67 = 3221225472;
    v68 = sub_1BEA400C4;
    v69 = &unk_1E7830588;
    v70 = self;
    v35 = v31;
    v71 = v35;
    v73 = &v74;
    v36 = v28;
    v72 = v36;
    v38 = (void (**)(void *, void *, uint64_t))_Block_copy(&v66);
    if (v34)
    {
      objc_msgSend_setIsUplink_(v33, v37, 1, v66, v67, v68, v69, v70, v71);
      objc_msgSend_setAllowsCellularAccess_(v33, v39, 1);
      v42 = objc_msgSend_approximateSendBytes(v7, v40, v41);
      v38[2](v38, v33, v42);
      objc_msgSend_setAllowsCellularAccess_(v33, v43, 0);
      v46 = objc_msgSend_approximateSendBytes(v7, v44, v45);
      v38[2](v38, v33, v46);
    }
    if (v16)
    {
      objc_msgSend_setIsUplink_(v33, v37, 0);
      objc_msgSend_setAllowsCellularAccess_(v33, v47, 1);
      v50 = objc_msgSend_approximateReceiveBytes(v7, v48, v49);
      v38[2](v38, v33, v50);
      objc_msgSend_setAllowsCellularAccess_(v33, v51, 0);
      v54 = objc_msgSend_approximateReceiveBytes(v7, v52, v53);
      v38[2](v38, v33, v54);
    }
    if (*((_BYTE *)v75 + 24))
    {
      objc_msgSend_setSystemImposedInfo_(v7, v37, (uint64_t)v19);
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v55 = (id)*MEMORY[0x1E0C952B0];
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend_networkServiceType(self, v56, v57);
        CKStringForNetworkServiceType();
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v79 = v64;
        _os_log_debug_impl(&dword_1BE990000, v55, OS_LOG_TYPE_DEBUG, "Determined Network Service Type %{public}@", buf, 0xCu);

      }
      objc_msgSend_clientOperationCallbackProxy(self, v58, v59);
      v60 = objc_claimAutoreleasedReturnValue();
      objc_msgSend_handleSystemDidImposeInfo_(v60, v61, (uint64_t)v19);
    }
    else
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v60 = (id)*MEMORY[0x1E0C952B0];
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend_networkServiceType(self, v62, v63);
        CKStringForNetworkServiceType();
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v79 = v65;
        _os_log_debug_impl(&dword_1BE990000, v60, OS_LOG_TYPE_DEBUG, "Using pre-determined Network Service Type %{public}@", buf, 0xCu);

      }
    }

    _Block_object_dispose(&v74, 8);
  }
  objc_msgSend__continueOperationStart(self, v14, v15, v66, v67, v68, v69, v70);

}

- (void)_continueOperationStart
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  NSObject *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend_isCancelled(self, a2, v2))
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v6 = *MEMORY[0x1E0C952D0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE990000, v6, OS_LOG_TYPE_DEFAULT, "Operation was cancelled before it could start", buf, 2u);
    }
    v9 = (void *)MEMORY[0x1E0C94FF8];
    v10 = *MEMORY[0x1E0C94B20];
    objc_msgSend_operationID(self, v7, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_format_(v9, v12, v10, 1, CFSTR("Operation %@ was cancelled"), v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_finishWithError_(self, v14, (uint64_t)v13);
  }
  else
  {
    objc_msgSend__registerAttemptForOperation(self, v4, v5);
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v15 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      v18 = v15;
      objc_msgSend_operationID(self, v19, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v23 = v21;
      _os_log_debug_impl(&dword_1BE990000, v18, OS_LOG_TYPE_DEBUG, "Invoking main for operation %{public}@", buf, 0xCu);

    }
    objc_msgSend_main(self, v16, v17);
  }
}

- (void)_registerAttemptForOperation
{
  uint64_t v2;
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
  const char *v16;
  NSObject *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  int v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend_isLongLived(self, a2, v2)
    && (objc_msgSend_isLongLivedCallbackRelayOperation(self, v4, v5) & 1) == 0)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v6 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      v17 = v6;
      objc_msgSend_operationID(self, v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543362;
      v22 = v20;
      _os_log_debug_impl(&dword_1BE990000, v17, OS_LOG_TYPE_DEBUG, "Notifying operation info cache of an attempt for long-lived operation %{public}@", (uint8_t *)&v21, 0xCu);

    }
    objc_msgSend_deviceContext(self, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_operationInfoCache(v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_operationID(self, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_registerAttemptForOperationWithID_(v12, v16, (uint64_t)v15);

  }
}

- (NSString)applicationBundleIdentifierForContainerAccess
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
  uint64_t v12;

  objc_msgSend_operationInfo(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_applicationBundleIdentifierOverrideForContainerAccess(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend_container(self, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_applicationBundleIdentifierForContainerAccess(v10, v11, v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v7;
}

- (void)start
{
  uint64_t v2;
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  os_signpost_id_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  CKDOperation *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  NSObject *v36;
  objc_class *v37;
  id v38;
  const char *v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  id v43;
  const char *v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  const char *v54;
  uint64_t (**v55)(_QWORD);
  const char *v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  const char *v62;
  _BYTE *v63;
  void *v64;
  const char *v65;
  const char *v66;
  uint64_t v67;
  void *v68;
  int isLongLivedCallbackRelayOperation;
  const char *v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  NSObject *v79;
  id v80;
  const char *v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  const char *v88;
  void *v89;
  const char *v90;
  const char *v91;
  uint64_t v92;
  void *v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  const char *v97;
  uint64_t v98;
  void *v99;
  const char *v100;
  uint64_t v101;
  const char *v102;
  uint64_t v103;
  void *v104;
  const char *v105;
  uint64_t v106;
  void *v107;
  const char *v108;
  const char *v109;
  uint64_t v110;
  void *v111;
  void *v112;
  NSObject *v113;
  const char *v114;
  const char *v115;
  uint64_t v116;
  void *v117;
  const char *v118;
  uint64_t v119;
  int v120;
  NSObject *v121;
  const char *v122;
  uint64_t v123;
  objc_class *v124;
  void *v125;
  const char *v126;
  uint64_t v127;
  uint64_t isTopLevelDaemonOperation;
  const char *v129;
  NSObject *v130;
  void *v131;
  _QWORD v132[5];
  NSObject *v133;
  _QWORD v134[4];
  NSObject *v135;
  _QWORD v136[5];
  id v137;
  _QWORD aBlock[5];
  _QWORD v139[5];
  os_activity_scope_state_s state;
  uint8_t buf[4];
  uint64_t v142;
  __int16 v143;
  CKDOperation *v144;
  __int16 v145;
  id v146;
  __int16 v147;
  void *v148;
  __int16 v149;
  void *v150;
  uint64_t v151;

  v151 = *MEMORY[0x1E0C80C00];
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  objc_msgSend_osActivity(self, a2, v2);
  v4 = objc_claimAutoreleasedReturnValue();
  os_activity_scope_enter(v4, &state);

  objc_msgSend_signpost(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend_signpost(self, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_log(v10, v11, v12);
    v13 = objc_claimAutoreleasedReturnValue();

    objc_msgSend_signpost(self, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend_identifier(v16, v17, v18);

    if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      v20 = objc_opt_class();
      objc_msgSend_operationID(self, v21, v22);
      v23 = (CKDOperation *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_containerID(self, v24, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_container(self, v27, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_applicationBundleID(v29, v30, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_qualityOfService(self, v33, v34);
      CKStringForQOS();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v142 = v20;
      v143 = 2112;
      v144 = v23;
      v145 = 2112;
      v146 = v26;
      v147 = 2112;
      v148 = v32;
      v149 = 2114;
      v150 = v35;
      _os_signpost_emit_with_name_impl(&dword_1BE990000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v19, "CKDOperation", "Type=%{signpost.description:attribute,public}@ ID=%{signpost.description:attribute}@ ContainerID=%{signpost.description:attribute}@ BundleID=%{signpost.description:attribute}@ QoS=%{signpost.description:attribute,public}@ ", buf, 0x34u);

    }
  }
  objc_msgSend_hash(self, v8, v9);
  kdebug_trace();
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v36 = (id)*MEMORY[0x1E0C952D0];
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    v37 = (objc_class *)objc_opt_class();
    NSStringFromClass(v37);
    v38 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKDescriptionPropertiesWithPublic_private_shouldExpand_(self, v39, 1, 0, 0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKPropertiesStyleString(v40, v41, v42);
    v43 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKDescriptionPropertiesWithPublic_private_shouldExpand_(self, v44, 0, 1, 0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKPropertiesStyleString(v45, v46, v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v142 = (uint64_t)v38;
    v143 = 2048;
    v144 = self;
    v145 = 2114;
    v146 = v43;
    v147 = 2112;
    v148 = v48;
    _os_log_impl(&dword_1BE990000, v36, OS_LOG_TYPE_DEFAULT, "Starting <%{public}@: %p; %{public}@, %@>", buf, 0x2Au);

  }
  objc_msgSend_date(MEMORY[0x1E0C99D68], v49, v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMetricExecuteStartDate_(self, v52, (uint64_t)v51);

  v53 = MEMORY[0x1E0C809B0];
  v139[0] = MEMORY[0x1E0C809B0];
  v139[1] = 3221225472;
  v139[2] = sub_1BE9A87E4;
  v139[3] = &unk_1E78305B0;
  v139[4] = self;
  objc_msgSend_updateCloudKitMetrics_(self, v54, (uint64_t)v139);
  aBlock[0] = v53;
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1BE9A7990;
  aBlock[3] = &unk_1E78305D8;
  aBlock[4] = self;
  v55 = (uint64_t (**)(_QWORD))_Block_copy(aBlock);
  if ((((uint64_t (*)(void))v55[2])() & 1) == 0)
  {
    if ((objc_msgSend_isExecuting(self, v56, v57) & 1) != 0 || objc_msgSend_isFinished(self, v58, v59))
    {
      v60 = (void *)MEMORY[0x1E0C99DA0];
      objc_msgSend_operationID(self, v58, v59);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_raise_format_(v60, v62, *MEMORY[0x1E0C99778], CFSTR("You can't restart an executing or finished CKOperation: %@"), v61);

    }
    v63 = (_BYTE *)MEMORY[0x1E0C95280];
    if (*MEMORY[0x1E0C95280])
    {
      objc_msgSend_unitTestOverrides(self, v58, v59);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v64, v65, (uint64_t)CFSTR("ForceTimingIssueAroundProxySetupQueue"));
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      if (v68)
      {
        isLongLivedCallbackRelayOperation = objc_msgSend_isLongLivedCallbackRelayOperation(self, v66, v67);

        if (isLongLivedCallbackRelayOperation)
          sleep(2u);
      }
      else
      {

      }
    }
    objc_msgSend_transitionToExecuting(self, v58, v59);
    if ((v55[2](v55) & 1) == 0)
    {
      if (objc_msgSend_supportsDeviceThrottling(self, v70, v71))
      {
        objc_msgSend_deviceContext(self, v72, v73);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_throttleManager(v74, v75, v76);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        v137 = 0;
        objc_msgSend_enforcedThrottleForCriteria_willSendRequest_outThrottleError_(v77, v78, (uint64_t)self, 1, &v137);
        v79 = objc_claimAutoreleasedReturnValue();
        v80 = v137;

        if (v79)
        {
          if (objc_msgSend_canTestInClientProcess(v79, v72, v73))
          {
            objc_msgSend_container(self, v81, v82);
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_logicalDeviceScopedClientProxy(v83, v84, v85);
            v86 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend_setHasBeenThrottled_(v86, v87, 1);
            objc_msgSend_addThrottle_(v86, v88, (uint64_t)v79);

          }
          objc_msgSend_CKClientSuitableError(v80, v81, v82);
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_finishWithError_(self, v90, (uint64_t)v89);
LABEL_43:

          goto LABEL_44;
        }
      }
      else
      {
        v80 = 0;
      }
      if (*v63 && objc_msgSend_useEncryption(self, v72, v73))
      {
        objc_msgSend_unitTestOverrides(self, v91, v92);
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        v96 = objc_msgSend_count(v93, v94, v95);

        objc_msgSend_container(self, v97, v98);
        if (v96)
        {
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_pcsManager(v99, v100, v101);
        }
        else
        {
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_pcsManagerIfExists(v99, v102, v103);
        }
        v104 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_unitTestOverrides(self, v105, v106);
        v107 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addEntriesForUnitTestOverrides_(v104, v108, (uint64_t)v107);

      }
      v79 = dispatch_group_create();
      objc_msgSend_clientOperationCallbackProxy(self, v109, v110);
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      v136[0] = v53;
      v136[1] = 3221225472;
      v136[2] = sub_1BEA40288;
      v136[3] = &unk_1E782EA40;
      v136[4] = self;
      v111 = _Block_copy(v136);
      v112 = v111;
      if (v89)
      {
        dispatch_group_enter(v79);
        v134[0] = v53;
        v134[1] = 3221225472;
        v134[2] = sub_1BEA40470;
        v134[3] = &unk_1E782EDA8;
        v113 = v79;
        v135 = v113;
        objc_msgSend_handleDidStart_(v89, v114, (uint64_t)v134);

        if (*v63)
        {
          objc_msgSend_operationInfo(self, v115, v116);
          v117 = (void *)objc_claimAutoreleasedReturnValue();
          v120 = objc_msgSend_wantsDaemonOperationCallbacks(v117, v118, v119);

          if (v120)
          {
            dispatch_group_enter(v113);
            if (*MEMORY[0x1E0C95300] != -1)
              dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
            v121 = (id)*MEMORY[0x1E0C952B0];
            if (os_log_type_enabled(v121, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend_operationID(self, v122, v123);
              v131 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v142 = (uint64_t)v131;
              _os_log_debug_impl(&dword_1BE990000, v121, OS_LOG_TYPE_DEBUG, "Operation %{public}@ calling out to client about lifecycle transition", buf, 0xCu);

            }
            v124 = (objc_class *)objc_opt_class();
            NSStringFromClass(v124);
            v125 = (void *)objc_claimAutoreleasedReturnValue();
            isTopLevelDaemonOperation = objc_msgSend_isTopLevelDaemonOperation(self, v126, v127);
            v132[0] = v53;
            v132[1] = 3221225472;
            v132[2] = sub_1BEA40478;
            v132[3] = &unk_1E7830600;
            v132[4] = self;
            v133 = v113;
            objc_msgSend_handleDaemonOperationWillStartWithClassName_isTopLevelDaemonOperation_replyBlock_(v89, v129, (uint64_t)v125, isTopLevelDaemonOperation, v132);

          }
        }
        objc_msgSend_callbackQueue(self, v115, v116);
        v130 = objc_claimAutoreleasedReturnValue();
        dispatch_group_notify(v113, v130, v112);

      }
      else
      {
        (*((void (**)(void *))v111 + 2))(v111);
      }

      goto LABEL_43;
    }
  }
LABEL_44:

  os_activity_scope_leave(&state);
}

- (OS_os_activity)osActivity
{
  CKDOperation *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  OS_os_activity *osActivity;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_osActivity)
  {
    objc_msgSend_activityCreate(v2, v3, v4);
    v5 = objc_claimAutoreleasedReturnValue();
    osActivity = v2->_osActivity;
    v2->_osActivity = (OS_os_activity *)v5;

  }
  objc_sync_exit(v2);

  return v2->_osActivity;
}

- (unint64_t)hash
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  unint64_t v6;

  objc_msgSend_operationID(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_hash(v3, v4, v5);

  return v6;
}

- (void)transitionToExecuting
{
  CKOperationExecutionStateTransitionToExecuting();
}

- (BOOL)supportsDeviceThrottling
{
  return 1;
}

- (BOOL)shouldCheckAppVersion
{
  return 1;
}

- (void)setState:(unint64_t)a3
{
  uint64_t state;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  os_signpost_id_t v19;
  void *v20;
  const char *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  const char *v29;
  void *v30;
  void *v31;
  const char *v32;
  void *v33;
  CKDOperation *obj;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  obj = self;
  objc_sync_enter(obj);
  state = obj->_state;
  if (state == a3)
  {
    objc_sync_exit(obj);

  }
  else
  {
    obj->_state = a3;
    objc_sync_exit(obj);

    objc_msgSend_signpost(obj, v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend_signpost(obj, v8, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_log(v10, v11, v12);
      v13 = objc_claimAutoreleasedReturnValue();

      objc_msgSend_signpost(obj, v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend_identifier(v16, v17, v18);

      if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
      {
        v20 = (void *)objc_opt_class();
        objc_msgSend_nameForState_(v20, v21, a3);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v36 = v22;
        _os_signpost_emit_with_name_impl(&dword_1BE990000, v13, OS_SIGNPOST_EVENT, v19, "CKDOperation", "%{public}@", buf, 0xCu);

      }
    }
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v23 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      v24 = v23;
      objc_msgSend_operationID(obj, v25, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (void *)objc_opt_class();
      objc_msgSend_nameForState_(v28, v29, state);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (void *)objc_opt_class();
      objc_msgSend_nameForState_(v31, v32, a3);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v36 = v27;
      v37 = 2114;
      v38 = v30;
      v39 = 2114;
      v40 = v33;
      _os_log_debug_impl(&dword_1BE990000, v24, OS_LOG_TYPE_DEBUG, "Operation %{public}@ transitioned from state [%{public}@] to state [%{public}@]", buf, 0x20u);

    }
  }
}

- (CKSignpost)signpost
{
  return self->_signpost;
}

- (void)setMetricExecuteStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_metricExecuteStartDate, a3);
}

- (CKDLogicalDeviceContext)deviceContext
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend_container(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deviceContext(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (CKDLogicalDeviceContext *)v6;
}

- (id)containerID
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend_container(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_containerID(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (CKDOperationCallbackProxy)clientOperationCallbackProxy
{
  uint64_t v2;
  id *v3;
  CKDOperationCallbackProxy *v4;

  objc_msgSend_topmostParentOperation(self, a2, v2);
  v3 = (id *)objc_claimAutoreleasedReturnValue();
  v4 = (CKDOperationCallbackProxy *)v3[39];

  return v4;
}

- (BOOL)_checkAppVersion
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  _QWORD v9[5];
  uint8_t buf[16];

  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v3 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1BE990000, v3, OS_LOG_TYPE_DEBUG, "Checking application version", buf, 2u);
  }
  objc_msgSend_sharedManager(CKDServerConfigurationManager, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1BE9A4670;
  v9[3] = &unk_1E7830560;
  v9[4] = self;
  objc_msgSend_configurationForOperation_completionHandler_(v6, v7, (uint64_t)self, v9);

  return 1;
}

+ (id)nameForState:(unint64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("Unknown");
  if (a3 == 0xFFFFFFFF)
    v3 = CFSTR("Complete");
  if (a3 == 1)
    return CFSTR("Not Started");
  else
    return (id)v3;
}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
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
  void *v15;
  const char *v16;
  uint64_t v17;
  NSObject *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  os_signpost_id_t v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  int v29;
  objc_class *v30;
  void *v31;
  CKDOperationCombinedMetrics *v32;
  const char *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  const char *v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  void *v77;
  NSObject *v78;
  objc_class *v79;
  void *v80;
  const char *v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  void *v87;
  const char *v88;
  uint64_t v89;
  void *v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  const __CFString *v95;
  const __CFString *v96;
  CKDOperation *v97;
  CKDURLRequest *request;
  const char *v99;
  uint64_t v100;
  void *v101;
  const char *v102;
  uint64_t v103;
  void *v104;
  const char *v105;
  uint64_t v106;
  const char *v107;
  const char *v108;
  uint64_t v109;
  void *v110;
  const char *v111;
  uint64_t v112;
  void *v113;
  const char *v114;
  uint64_t v115;
  void *v116;
  void *v117;
  void *v118;
  __CFString *v119;
  _QWORD v120[5];
  uint8_t buf[4];
  void *v122;
  __int16 v123;
  CKDOperation *v124;
  __int16 v125;
  void *v126;
  __int16 v127;
  void *v128;
  __int16 v129;
  uint64_t v130;
  __int16 v131;
  const __CFString *v132;
  __int16 v133;
  const __CFString *v134;
  uint64_t v135;

  v135 = *MEMORY[0x1E0C80C00];
  v119 = (__CFString *)a3;
  objc_msgSend_callbackQueue(self, v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  if (objc_msgSend_isFinished(self, v8, v9))
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v10, v11);
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_operationID(self, v111, v112);
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v110, v114, (uint64_t)a2, self, CFSTR("CKDOperation.m"), 1124, CFSTR("Operation %@ was already marked as finished"), v113);

  }
  objc_msgSend_signpost(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend_signpost(self, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_log(v15, v16, v17);
    v18 = objc_claimAutoreleasedReturnValue();

    objc_msgSend_signpost(self, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend_identifier(v21, v22, v23);

    if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BE990000, v18, OS_SIGNPOST_INTERVAL_END, v24, "CKDOperation", ", buf, 2u);
    }

  }
  v120[0] = MEMORY[0x1E0C809B0];
  v120[1] = 3221225472;
  v120[2] = sub_1BE9A8A3C;
  v120[3] = &unk_1E78305B0;
  v120[4] = self;
  objc_msgSend_updateCloudKitMetrics_(self, v13, (uint64_t)v120);
  if (objc_msgSend_isEnabled(CKDPowerLogger, v25, v26))
  {
    v29 = objc_msgSend_isTopLevelDaemonOperation(self, v27, v28) ^ 1;
    if (v119)
      LOBYTE(v29) = 1;
    if ((v29 & 1) == 0)
    {
      v30 = (objc_class *)objc_opt_class();
      NSStringFromClass(v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v115 = CKDaemonOperationTypeForClass(v31);

      os_unfair_recursive_lock_lock_with_options();
      v32 = [CKDOperationCombinedMetrics alloc];
      v117 = (void *)objc_msgSend_initWithCloudKitMetrics_andMMCSMetrics_(v32, v33, (uint64_t)self->_cloudKitMetrics, self->_MMCSMetrics);
      os_unfair_recursive_lock_unlock();
      objc_msgSend_topmostParentOperation(self, v34, v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_operationInfo(v36, v37, v38);
      v118 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_group(v118, v39, v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_sharedLogger(CKDPowerLogger, v42, v43);
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_operationID(self, v44, v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_operationGroupID(v41, v47, v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_name(v41, v50, v51);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = objc_msgSend_quantity(v41, v53, v54);
      v58 = objc_msgSend_qualityOfService(self, v56, v57);
      objc_msgSend_xpcActivityIdentifier(v118, v59, v60);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_container(self, v62, v63);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_appContainerTuple(v64, v65, v66);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_logOperationCombinedMetrics_forOperationID_operationType_operationGroupID_operationGroupName_operationGroupQuantity_operationQualityOfService_xpcActivityIdentifier_appContainerTuple_(v116, v68, (uint64_t)v117, v46, v115, v49, v52, v55, v58, v61, v67);

    }
  }
  objc_msgSend_sendCoreAnalyticsEventOperationFinished(self, v27, v28);
  objc_msgSend_userSyncTask(self, v69, v70);
  v71 = (void *)objc_claimAutoreleasedReturnValue();

  if (v71)
  {
    objc_msgSend_userSyncTask(self, v72, v73);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_end(v74, v75, v76);

  }
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v77 = (void *)*MEMORY[0x1E0C952D0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D0], OS_LOG_TYPE_DEFAULT))
  {
    v78 = v77;
    v79 = (objc_class *)objc_opt_class();
    NSStringFromClass(v79);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKDescriptionPropertiesWithPublic_private_shouldExpand_(self, v81, 1, 0, 0);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKPropertiesStyleString(v82, v83, v84);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKDescriptionPropertiesWithPublic_private_shouldExpand_(self, v86, 0, 1, 0);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKPropertiesStyleString(v87, v88, v89);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_operationMetrics(self, v91, v92);
    v93 = objc_claimAutoreleasedReturnValue();
    v94 = (void *)v93;
    v95 = CFSTR(" with error: ");
    *(_DWORD *)buf = 138544898;
    v96 = &stru_1E7838F48;
    v122 = v80;
    v123 = 2048;
    if (v119)
      v96 = v119;
    else
      v95 = &stru_1E7838F48;
    v124 = self;
    v125 = 2114;
    v126 = v85;
    v127 = 2112;
    v128 = v90;
    v129 = 2112;
    v130 = v93;
    v131 = 2114;
    v132 = v95;
    v133 = 2112;
    v134 = v96;
    _os_log_impl(&dword_1BE990000, v78, OS_LOG_TYPE_DEFAULT, "Finished operation <%{public}@: %p; %{public}@, %@> metrics=%@%{public}@%@",
      buf,
      0x48u);

  }
  v97 = self;
  objc_sync_enter(v97);
  request = v97->_request;
  v97->_request = 0;

  objc_sync_exit(v97);
  objc_msgSend_childOperations(v97, v99, v100);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v101);
  objc_msgSend_childOperations(v97, v102, v103);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeAllObjects(v104, v105, v106);

  objc_sync_exit(v101);
  objc_msgSend_setState_(v97, v107, 0xFFFFFFFFLL);
  objc_msgSend_transitionToFinished(v97, v108, v109);

}

- (void)updateCloudKitMetrics:(id)a3
{
  void (**v4)(id, CKDOperationMetrics *);

  v4 = (void (**)(id, CKDOperationMetrics *))a3;
  os_unfair_recursive_lock_lock_with_options();
  v4[2](v4, self->_cloudKitMetrics);

  os_unfair_recursive_lock_unlock();
}

- (NSDate)metricExecuteStartDate
{
  return self->_metricExecuteStartDate;
}

- (UMUserSyncTask)userSyncTask
{
  return self->_userSyncTask;
}

- (void)transitionToFinished
{
  CKOperationExecutionStateTransitionToFinished();
}

- (void)sendCoreAnalyticsEventOperationFinished
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
  void *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  int v25;
  void *v26;
  __int16 v27;
  __CFString *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend_didAttemptDugongKeyRoll(self, a2, v2))
  {
    objc_msgSend_error(self, v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v7 = (void *)*MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
      {
        v21 = v7;
        objc_msgSend_operationID(self, v22, v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 138543618;
        v26 = v24;
        v27 = 2114;
        v28 = CFSTR("com.apple.cloudkit.dugongKeyRollOperationFinished");
        _os_log_debug_impl(&dword_1BE990000, v21, OS_LOG_TYPE_DEBUG, "Operation %{public}@ sending CoreAnalytics event %{public}@", (uint8_t *)&v25, 0x16u);

      }
      objc_msgSend_error(self, v8, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_dugongKeyRollAnalyticsPayloadWithError_(self, v11, (uint64_t)v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      AnalyticsSendEvent();
    }
  }
  if (objc_msgSend_isTopLevelDaemonOperation(self, v4, v5))
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v13 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      v17 = v13;
      objc_msgSend_operationID(self, v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138543618;
      v26 = v20;
      v27 = 2114;
      v28 = CFSTR("com.apple.cloudkit.operationFinished");
      _os_log_debug_impl(&dword_1BE990000, v17, OS_LOG_TYPE_DEBUG, "Operation %{public}@ sending CoreAnalytics event %{public}@", (uint8_t *)&v25, 0x16u);

    }
    objc_msgSend_analyticsPayload(self, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    AnalyticsSendEvent();

  }
}

- (CKOperationMetrics)operationMetrics
{
  id v3;
  const char *v4;
  void *v5;
  id v6;
  const char *v7;
  void *v8;
  id v9;
  const char *v10;
  void *v11;

  os_unfair_recursive_lock_lock_with_options();
  v3 = objc_alloc(MEMORY[0x1E0C94EE0]);
  v5 = (void *)objc_msgSend_initWithMMCSOperationMetric_(v3, v4, (uint64_t)self->_cloudKitMetrics);
  if (self->_MMCSMetrics)
  {
    v6 = objc_alloc(MEMORY[0x1E0C94EE0]);
    v8 = (void *)objc_msgSend_initWithMMCSOperationMetric_(v6, v7, (uint64_t)self->_MMCSMetrics);
  }
  else
  {
    v8 = 0;
  }
  v9 = objc_alloc(MEMORY[0x1E0C94FB0]);
  v11 = (void *)objc_msgSend_initWithCloudKitMetrics_MMCSMetrics_(v9, v10, (uint64_t)v5, v8);
  os_unfair_recursive_lock_unlock();

  return (CKOperationMetrics *)v11;
}

- (BOOL)didAttemptDugongKeyRoll
{
  return self->_didAttemptDugongKeyRoll;
}

- (unint64_t)networkServiceType
{
  uint64_t v2;
  CKDOperation *v4;
  const char *v5;
  uint64_t v6;
  CKDOperation *v7;
  unint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t isPredominatelyDownload;
  unint64_t v28;

  objc_msgSend_topmostParentOperation(self, a2, v2);
  v4 = (CKDOperation *)objc_claimAutoreleasedReturnValue();
  v7 = v4;
  if (v4 == self)
  {
    objc_msgSend_operationInfo(self, v5, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_group(v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = (void *)objc_opt_new();
      v16 = objc_msgSend_allowsCellularAccess(self, v14, v15);
      objc_msgSend_setAllowsCellularAccess_(v13, v17, v16);
      objc_msgSend_setIsUplink_(v13, v18, 1);
      v20 = objc_msgSend_resolvedNetworkServiceTypeForConfig_(v12, v19, (uint64_t)v13);
      objc_msgSend_setIsUplink_(v13, v21, 0);
      v23 = objc_msgSend_resolvedNetworkServiceTypeForConfig_(v12, v22, (uint64_t)v13);
      v24 = (void *)objc_opt_class();
      isPredominatelyDownload = objc_msgSend_isPredominatelyDownload(v24, v25, v26);
      if (v20)
        v28 = v20;
      else
        v28 = v23;
      if (isPredominatelyDownload == 1)
        v28 = v23;
      if (isPredominatelyDownload)
        v8 = v28;
      else
        v8 = v20;

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = objc_msgSend_networkServiceType(v4, v5, v6);
  }

  return v8;
}

+ (int64_t)isPredominatelyDownload
{
  return 1;
}

- (BOOL)preferAnonymousRequests
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  char v9;
  void *v10;
  const char *v11;
  uint64_t v12;

  objc_msgSend_operationInfo(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_preferAnonymousRequests(v4, v5, v6) & 1) != 0)
  {
    v9 = 1;
  }
  else
  {
    objc_msgSend_container(self, v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend_preferAnonymousRequests(v10, v11, v12);

  }
  return v9;
}

- (CKDOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  id v7;
  const char *v8;
  uint64_t v9;
  id v10;
  char *v11;
  id v12;
  void *v13;
  id v14;
  objc_class *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  dispatch_group_t v31;
  void *v32;
  dispatch_group_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  id v39;
  os_log_t *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  const char *v49;
  const char *v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  NSObject *v61;
  const char *v62;
  uint64_t v63;
  dispatch_qos_class_t v64;
  NSObject *v65;
  NSObject *v66;
  const char *v67;
  uint64_t v68;
  const char *v69;
  dispatch_queue_t v70;
  dispatch_object_t *v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  NSObject *v77;
  uint64_t v78;
  const char *v79;
  NSObject *v80;
  CKDOperationCallbackProxy *v81;
  const char *v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  void *v87;
  os_log_t v88;
  NSObject *v89;
  const char *v90;
  uint64_t v91;
  int v92;
  const char *v93;
  uint64_t v94;
  int v95;
  const char *v96;
  uint64_t v97;
  int v98;
  const char *v99;
  uint64_t v100;
  int v101;
  uint64_t v102;
  void *v103;
  void *v105;
  const char *v106;
  objc_super v107;
  uint8_t buf[4];
  id v109;
  __int16 v110;
  int v111;
  __int16 v112;
  int v113;
  __int16 v114;
  int v115;
  __int16 v116;
  int v117;
  uint64_t v118;

  v118 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v10 = a4;
  if (!v7)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v8, v9);
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v105, v106, (uint64_t)a2, self, CFSTR("CKDOperation.m"), 186, CFSTR("Expected non-nil operationInfo"));

  }
  v107.receiver = self;
  v107.super_class = (Class)CKDOperation;
  v11 = -[CKDOperation init](&v107, sel_init);
  if (v11)
  {
    v12 = objc_alloc_init(MEMORY[0x1E0C99D68]);
    v13 = (void *)*((_QWORD *)v11 + 41);
    *((_QWORD *)v11 + 41) = v12;

    v14 = objc_alloc(MEMORY[0x1E0CB3940]);
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_operationID(v7, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend_initWithFormat_(v14, v20, (uint64_t)CFSTR("com.apple.cloudkit.%@.%@"), v16, v19);

    objc_msgSend_parentOperation(v7, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)v11 + 40, v24);

    objc_storeStrong((id *)v11 + 42, a4);
    v25 = objc_opt_new();
    v26 = (void *)*((_QWORD *)v11 + 48);
    *((_QWORD *)v11 + 48) = v25;

    v27 = objc_opt_new();
    v28 = (void *)*((_QWORD *)v11 + 49);
    *((_QWORD *)v11 + 49) = v27;

    v29 = objc_opt_new();
    v30 = (void *)*((_QWORD *)v11 + 50);
    *((_QWORD *)v11 + 50) = v29;

    *((_QWORD *)v11 + 34) = 1;
    v31 = dispatch_group_create();
    v32 = (void *)*((_QWORD *)v11 + 47);
    *((_QWORD *)v11 + 47) = v31;

    v33 = dispatch_group_create();
    v34 = (void *)*((_QWORD *)v11 + 51);
    *((_QWORD *)v11 + 51) = v33;

    objc_msgSend_UTF8String(v21, v35, v36);
    v37 = os_transaction_create();
    v38 = (void *)*((_QWORD *)v11 + 53);
    *((_QWORD *)v11 + 53) = v37;

    v39 = objc_alloc(MEMORY[0x1E0C95140]);
    v40 = (os_log_t *)MEMORY[0x1E0C952D0];
    v42 = objc_msgSend_initWithLog_(v39, v41, *MEMORY[0x1E0C952D0]);
    v43 = (void *)*((_QWORD *)v11 + 54);
    *((_QWORD *)v11 + 54) = v42;

    objc_msgSend__ensureOperationGroup(v11, v44, v45);
    if (!v7)
    {
      v7 = (id)objc_opt_new();
      objc_msgSend_setRequestOriginator_(v7, v48, 1);
    }
    if (!objc_msgSend_requestOriginator(v7, v46, v47))
      objc_msgSend_setRequestOriginator_(v7, v49, 1);
    objc_storeStrong((id *)v11 + 46, v7);
    objc_msgSend_configureQualityOfServiceFromOperationInfo_(v11, v50, (uint64_t)v7);
    objc_msgSend_sharedOptions(MEMORY[0x1E0C94C00], v51, v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend_useEncryption(v53, v54, v55) & 1) != 0)
    {
      objc_msgSend_options(v10, v56, v57);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v11[292] = objc_msgSend_bypassPCSEncryption(v58, v59, v60) ^ 1;

    }
    else
    {
      v11[292] = 0;
    }

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v61 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_qualityOfService(v11, v62, v63);
    v64 = CKQoSClassFromNSQualityOfService();
    dispatch_queue_attr_make_with_qos_class(v61, v64, 0);
    v65 = objc_claimAutoreleasedReturnValue();

    dispatch_queue_attr_make_initially_inactive(v65);
    v66 = objc_claimAutoreleasedReturnValue();

    v69 = (const char *)objc_msgSend_UTF8String(v21, v67, v68);
    v70 = dispatch_queue_create(v69, v66);
    v71 = (dispatch_object_t *)(v11 + 344);
    v72 = (void *)*((_QWORD *)v11 + 43);
    *((_QWORD *)v11 + 43) = v70;

    dispatch_queue_set_specific(*((dispatch_queue_t *)v11 + 43), v11 + 344, (void *)1, 0);
    if ((objc_msgSend_isCloudKitSupportOperation(v11, v73, v74) & 1) == 0)
    {
      v77 = *v71;
      v78 = objc_msgSend_qualityOfService(v11, v75, v76);
      objc_msgSend__globalOperationCallbackQueueForQOS_(CKDOperation, v79, v78);
      v80 = objc_claimAutoreleasedReturnValue();
      dispatch_set_target_queue(v77, v80);

    }
    dispatch_activate(*v71);
    v81 = [CKDOperationCallbackProxy alloc];
    objc_msgSend_callbackProxyEndpoint(v7, v82, v83);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = objc_msgSend_initWithEndpoint_(v81, v85, (uint64_t)v84);
    v87 = (void *)*((_QWORD *)v11 + 39);
    *((_QWORD *)v11 + 39) = v86;

    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v88 = *v40;
    if (os_log_type_enabled(*v40, OS_LOG_TYPE_DEFAULT))
    {
      v89 = v88;
      v92 = objc_msgSend_usesBackgroundSession(v11, v90, v91);
      v95 = objc_msgSend_allowsCellularAccess(v11, v93, v94);
      v98 = objc_msgSend_allowsExpensiveNetworkAccess(v11, v96, v97);
      v101 = objc_msgSend_qualityOfService(v11, v99, v100);
      *(_DWORD *)buf = 134219008;
      v109 = v10;
      v110 = 1024;
      v111 = v92;
      v112 = 1024;
      v113 = v95;
      v114 = 1024;
      v115 = v98;
      v116 = 1024;
      v117 = v101;
      _os_log_impl(&dword_1BE990000, v89, OS_LOG_TYPE_DEFAULT, "Initialized with container %p. Background: %d, cellular: %d, expensive: %d, QOS: 0x%x", buf, 0x24u);

    }
    v102 = objc_opt_new();
    v103 = (void *)*((_QWORD *)v11 + 32);
    *((_QWORD *)v11 + 32) = v102;

  }
  return (CKDOperation *)v11;
}

- (BOOL)isCloudKitSupportOperation
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  char isCloudKitSupportOperation;

  objc_msgSend_operationInfo(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  isCloudKitSupportOperation = objc_msgSend_isCloudKitSupportOperation(v3, v4, v5);

  return isCloudKitSupportOperation;
}

- (void)dealloc
{
  uint64_t v2;
  NSObject *v5;
  intptr_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  OS_os_transaction *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  dispatch_time_t v23;
  NSObject *v24;
  objc_super v25;
  _QWORD block[4];
  OS_os_transaction *v27;

  objc_msgSend_stateTransitionGroup(self, a2, v2);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = dispatch_group_wait(v5, 0);

  if (v6)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_operationID(self, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v9, v13, (uint64_t)a2, self, CFSTR("CKDOperation.m"), 264, CFSTR("Operation %@ tried to dealloc with outstanding entries in the state transition group"), v12);

  }
  v16 = self->_transaction;
  if (*MEMORY[0x1E0C95280])
  {
    objc_msgSend_deviceContext(self, v14, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_testServer(v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20 && (objc_msgSend_useLiveServer(v20, v21, v22) & 1) == 0)
    {
      v23 = dispatch_time(0, 60000000000);
      CKGetGlobalQueue();
      v24 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = nullsub_9;
      block[3] = &unk_1E782EA40;
      v27 = v16;
      dispatch_after(v23, v24, block);

    }
  }

  v25.receiver = self;
  v25.super_class = (Class)CKDOperation;
  -[CKDOperation dealloc](&v25, sel_dealloc);
}

- (void)configureQualityOfServiceFromOperationInfo:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  const char *v10;
  uint64_t v11;
  NSObject *v12;
  int v13;
  CKDOperation *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v7 = objc_msgSend_qualityOfService(v4, v5, v6);
  if (v7 == -1)
    v8 = 17;
  else
    v8 = v7;
  v9 = CKQualityOfServiceOrdering();
  if (v9 > (int)CKQualityOfServiceOrdering() && objc_msgSend_discretionaryNetworkBehavior(v4, v10, v11))
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v12 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
    {
      v13 = 138412290;
      v14 = self;
      _os_log_impl(&dword_1BE990000, v12, OS_LOG_TYPE_INFO, "Operation %@ was assigned QoS greater than Utility but it has discretionary networking behavior. Demoting operation QoS to Utility.", (uint8_t *)&v13, 0xCu);
    }
    v8 = 17;
  }
  objc_msgSend_setQualityOfService_(self, v10, v8);

}

- (void)setQualityOfService:(int64_t)a3
{
  int v5;
  const char *v6;
  uint64_t v7;
  NSObject *v8;
  objc_super v9;
  uint8_t buf[16];

  v5 = CKQualityOfServiceOrdering();
  if (v5 > (int)CKQualityOfServiceOrdering() && objc_msgSend_discretionaryNetworkBehavior(self, v6, v7))
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v8 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1BE990000, v8, OS_LOG_TYPE_FAULT, "A CKDOperation was assigned a QoS greater than Utility but its discretionaryNetworkingBehavior is not set nonDiscretionary. A high QoS operation may end up gated on the network.", buf, 2u);
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)CKDOperation;
  -[CKDOperation setQualityOfService:](&v9, sel_setQualityOfService_, a3);
}

- (void)_ensureOperationGroup
{
  uint64_t v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  id v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  id v15;

  objc_msgSend_topmostParentOperation(self, a2, v2);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_operationInfo(v15, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_group(v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C94F88]);
    objc_msgSend_setName_(v9, v10, (uint64_t)CFSTR("EphemeralGroup"));
    objc_msgSend_operationInfo(v15, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setGroup_(v13, v14, (uint64_t)v9);

  }
}

+ (id)_globalOperationCallbackQueueForQOS:(int64_t)a3
{
  id *v4;
  uint64_t *v5;
  uint64_t *v6;
  uint64_t *v7;

  if (qword_1ED700AD8 != -1)
    dispatch_once(&qword_1ED700AD8, &unk_1E7830538);
  v4 = (id *)&qword_1ED700AF0;
  v5 = &qword_1ED700AE0;
  v6 = &qword_1ED700AE8;
  v7 = &qword_1ED700AF8;
  if (a3 <= 16)
    v7 = &qword_1ED700B00;
  if (a3 <= 24)
    v6 = v7;
  if (a3 <= 32)
    v5 = v6;
  if (a3 != -1)
    v4 = (id *)v5;
  return *v4;
}

- (BOOL)allowsCellularAccess
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  char v12;

  objc_msgSend_operationInfo(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_allowsCellularAccess(v4, v5, v6))
  {
    objc_msgSend_container(self, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend_allowsCellularAccess(v9, v10, v11);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (CKDContainer)container
{
  return (CKDContainer *)objc_getProperty(self, a2, 336, 1);
}

- (NSNumber)operationGroupQuantityNumber
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;

  objc_msgSend_topmostParentOperation(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_operationInfo(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_group(v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_quantityNumber(v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v12;
}

- (NSString)operationGroupID
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;

  objc_msgSend_topmostParentOperation(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_operationInfo(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_group(v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_operationGroupID(v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
}

- (NSString)operationGroupName
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;

  objc_msgSend_topmostParentOperation(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_operationInfo(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_group(v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_name(v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
}

- (id)CKDescriptionPropertiesWithPublic:(BOOL)a3 private:(BOOL)a4 shouldExpand:(BOOL)a5
{
  uint64_t v5;
  _BOOL4 v6;
  _BOOL4 v7;
  const char *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  void *v21;
  const char *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  void *v36;
  const char *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  const char *v51;
  void *v52;
  const char *v53;
  void *v54;
  const char *v55;
  const char *v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  void *v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  double v76;
  const char *v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  void *v81;
  const char *v82;
  const char *v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  const char *v92;
  uint64_t v93;
  void *v94;
  void *v95;
  const char *v96;
  void *v97;
  const char *v98;
  void *v99;
  const char *v100;
  const char *v101;
  uint64_t v102;
  void *v103;
  const char *v104;
  uint64_t v105;
  void *v106;
  const char *v107;
  uint64_t v108;
  void *v109;
  const char *v110;
  uint64_t v111;
  const char *v112;
  uint64_t v113;
  void *v114;
  void *v115;
  const char *v116;
  void *v117;
  const char *v118;
  void *v119;
  const char *v120;
  const char *v121;
  uint64_t v122;
  void *v123;
  void *v124;
  const char *v125;
  uint64_t v126;
  void *v127;
  const char *v128;
  id v129;
  const char *v130;
  uint64_t v131;
  void *v132;
  void *v133;
  unint64_t v134;
  const char *v135;
  const __CFString *v136;
  void *v137;
  const char *v138;
  const char *v139;
  void *v140;
  void *v141;
  const char *v142;
  uint64_t v143;
  void *v144;
  const char *v145;
  uint64_t v146;
  void *v147;
  const char *v148;
  uint64_t v149;
  void *v150;
  const char *v151;
  uint64_t v152;
  void *v153;
  const char *v154;
  uint64_t v155;
  void *v156;
  const char *v157;
  const char *v158;
  uint64_t v159;
  void *v160;
  const char *v161;
  uint64_t v162;
  void *v163;
  const char *v164;
  uint64_t v165;
  void *v166;
  const char *v167;
  uint64_t v168;
  void *v169;
  const char *v170;
  void *v171;
  const char *v172;
  uint64_t v173;
  void *v174;
  const char *v175;
  uint64_t v176;
  void *v177;
  const char *v178;
  uint64_t v179;
  void *v180;
  const char *v181;
  void *v182;
  const char *v183;
  uint64_t v184;
  void *v185;
  const char *v186;
  void *v187;
  const char *v188;
  uint64_t v189;
  void *v190;
  const char *v191;
  void *v192;
  const char *v193;
  uint64_t v194;
  void *v195;
  void *v196;
  const char *v197;
  void *v198;
  const char *v199;
  uint64_t v200;
  void *v201;
  const char *v202;
  const char *v203;
  CKDOperationMetrics *MMCSMetrics;
  void *v205;
  const char *v206;
  const char *v207;
  uint64_t v208;
  void *v209;
  const char *v210;
  uint64_t v211;
  void *v212;
  const char *v213;
  uint64_t v214;
  uint64_t v215;
  const char *v216;
  uint64_t v217;
  void *v218;
  const char *v219;
  void *v220;
  const char *v221;
  unsigned int v223;
  _BOOL4 v224;

  v5 = a5;
  v6 = a4;
  v7 = a3;
  objc_msgSend_dictionaryWithCapacity_(MEMORY[0x1E0C99E08], a2, 10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v224 = v7;
  if (v7)
  {
    v223 = v5;
    objc_msgSend_operationID(self, v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v13, (uint64_t)CFSTR("operationID"), v12);

    v16 = objc_msgSend_state(self, v14, v15);
    if (v16 != 1)
    {
      v18 = v16;
      v19 = (void *)objc_opt_class();
      objc_msgSend_nameForState_(v19, v20, v18);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v22, (uint64_t)CFSTR("state"), v21);

    }
    objc_msgSend_arrayWithCapacity_(MEMORY[0x1E0C99DE8], v17, 3);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_isExecuting(self, v24, v25))
      objc_msgSend_addObject_(v23, v26, (uint64_t)CFSTR("executing"));
    if (objc_msgSend_isFinished(self, v26, v27))
      objc_msgSend_addObject_(v23, v28, (uint64_t)CFSTR("finished"));
    if (objc_msgSend_isCancelled(self, v28, v29))
      objc_msgSend_addObject_(v23, v30, (uint64_t)CFSTR("cancelled"));
    if (objc_msgSend_count(v23, v30, v31))
    {
      objc_msgSend_componentsJoinedByString_(v23, v32, (uint64_t)CFSTR("|"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v35, (uint64_t)CFSTR("stateFlags"), v34);

    }
    objc_msgSend_qualityOfService(self, v32, v33);
    CKStringForQOS();
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v37, (uint64_t)CFSTR("qos"), v36);

    objc_msgSend_requestUUIDs(self, v38, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v40);
    objc_msgSend_requestUUIDs(self, v41, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend_count(v43, v44, v45);

    if (v46)
    {
      v49 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend_requestUUIDs(self, v47, v48);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_componentsJoinedByString_(v50, v51, (uint64_t)CFSTR(", "));
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v49, v53, (uint64_t)CFSTR("[%@]"), v52);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v55, (uint64_t)CFSTR("requestIDs"), v54);

    }
    objc_sync_exit(v40);

    objc_msgSend_arrayWithCapacity_(MEMORY[0x1E0C99DE8], v56, 3);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_usesBackgroundSession(self, v58, v59))
      objc_msgSend_addObject_(v57, v60, (uint64_t)CFSTR("background"));
    if (objc_msgSend_allowsCellularAccess(self, v60, v61))
      objc_msgSend_addObject_(v57, v62, (uint64_t)CFSTR("allows-cellular"));
    if (objc_msgSend_allowsExpensiveNetworkAccess(self, v62, v63))
      objc_msgSend_addObject_(v57, v64, (uint64_t)CFSTR("allows-expensive"));
    if (objc_msgSend_isLongLived(self, v64, v65))
      objc_msgSend_addObject_(v57, v66, (uint64_t)CFSTR("long-lived"));
    if (objc_msgSend_count(v57, v66, v67))
    {
      objc_msgSend_componentsJoinedByString_(v57, v68, (uint64_t)CFSTR("|"));
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v71, (uint64_t)CFSTR("flags"), v70);

    }
    v72 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend_startDate(self, v68, v69);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_timeIntervalSinceNow(v73, v74, v75);
    objc_msgSend_numberWithDouble_(v72, v77, v78, -v76);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKRoundedToMaximumDecimalPlaces_(v79, v80, 3);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v82, (uint64_t)CFSTR("runningFor"), v81);

    objc_msgSend_finishedChildOperationIDs(self, v83, v84);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v85);
    objc_msgSend_finishedChildOperationIDs(self, v86, v87);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = objc_msgSend_count(v88, v89, v90);

    if (v91)
    {
      v94 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend_finishedChildOperationIDs(self, v92, v93);
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_componentsJoinedByString_(v95, v96, (uint64_t)CFSTR(", "));
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v94, v98, (uint64_t)CFSTR("[%@]"), v97);
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v100, (uint64_t)CFSTR("finishedChildOpIDs"), v99);

    }
    objc_sync_exit(v85);

    objc_msgSend_childOperations(self, v101, v102);
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v103);
    objc_msgSend_childOperations(self, v104, v105);
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    v109 = (void *)objc_msgSend_copy(v106, v107, v108);

    objc_sync_exit(v103);
    if (objc_msgSend_count(v109, v110, v111))
    {
      objc_msgSend_CKMap_(v109, v112, (uint64_t)&unk_1E7830518);
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      v115 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend_componentsJoinedByString_(v114, v116, (uint64_t)CFSTR(", "));
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v115, v118, (uint64_t)CFSTR("[%@]"), v117);
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v120, (uint64_t)CFSTR("childOps"), v119);

    }
    objc_msgSend_operationGroupID(self, v112, v113);
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    if (v123)
      objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v121, (uint64_t)CFSTR("operationGroupID"), v123);
    objc_msgSend_operationGroupName(self, v121, v122);
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    v127 = v124;
    if (v124)
    {
      if ((unint64_t)objc_msgSend_length(v124, v125, v126) <= 0x80)
      {
        v129 = v127;
      }
      else
      {
        objc_msgSend_substringToIndex_(v127, v128, 128);
        v129 = (id)objc_claimAutoreleasedReturnValue();
      }
      v132 = v129;
      v133 = (void *)MEMORY[0x1E0CB3940];
      v134 = objc_msgSend_length(v127, v130, v131);
      v136 = &stru_1E7838F48;
      if (v134 > 0x80)
        v136 = CFSTR("...");
      objc_msgSend_stringWithFormat_(v133, v135, (uint64_t)CFSTR("%@%@"), v132, v136);
      v137 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v138, (uint64_t)CFSTR("operationGroupName"), v137);

    }
    objc_msgSend_operationGroupQuantityNumber(self, v125, v126);
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    if (v140)
      objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v139, (uint64_t)CFSTR("operationGroupQuantityNumber"), v140);

    v5 = v223;
  }
  if (v6)
  {
    objc_msgSend_container(self, v9, v10);
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_account(v141, v142, v143);
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_accountID(v144, v145, v146);
    v147 = (void *)objc_claimAutoreleasedReturnValue();

    if (v147)
      objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v148, (uint64_t)CFSTR("currentAccountID"), v147);
    objc_msgSend_sharedManager(MEMORY[0x1E0DC5EE8], v148, v149);
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_currentPersona(v150, v151, v152);
    v153 = (void *)objc_claimAutoreleasedReturnValue();

    if (v153)
    {
      objc_msgSend_userPersonaUniqueString(v153, v154, v155);
      v156 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v157, (uint64_t)CFSTR("currentPersona"), v156);

    }
    else
    {
      objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v154, (uint64_t)CFSTR("currentPersona"), CFSTR("nilPersonaValue"));
    }
    objc_msgSend_operationInfo(self, v158, v159);
    v160 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_applicationBundleIdentifierOverrideForContainerAccess(v160, v161, v162);
    v163 = (void *)objc_claimAutoreleasedReturnValue();

    if (v163)
    {
      objc_msgSend_operationInfo(self, v164, v165);
      v166 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_applicationBundleIdentifierOverrideForContainerAccess(v166, v167, v168);
      v169 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v170, (uint64_t)CFSTR("applicationBundleIdentifierOverrideForContainerAccess"), v169);

    }
    objc_msgSend_operationInfo(self, v164, v165);
    v171 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_applicationBundleIdentifierOverrideForNetworkAttribution(v171, v172, v173);
    v174 = (void *)objc_claimAutoreleasedReturnValue();

    if (v174)
    {
      objc_msgSend_operationInfo(self, v175, v176);
      v177 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_applicationBundleIdentifierOverrideForNetworkAttribution(v177, v178, v179);
      v180 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v181, (uint64_t)CFSTR("applicationBundleIdentifierOverrideForNetworkAttribution"), v180);

    }
    objc_msgSend_sourceApplicationSecondaryIdentifier(self, v175, v176);
    v182 = (void *)objc_claimAutoreleasedReturnValue();

    if (v182)
    {
      objc_msgSend_sourceApplicationSecondaryIdentifier(self, v183, v184);
      v185 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v186, (uint64_t)CFSTR("applicationSecondaryID"), v185);

    }
    objc_msgSend_privacyProxyFailClosedOverride(self, v183, v184);
    v187 = (void *)objc_claimAutoreleasedReturnValue();

    if (v187)
    {
      objc_msgSend_privacyProxyFailClosedOverride(self, v188, v189);
      v190 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v191, (uint64_t)CFSTR("privacyProxyFailClosedOverride"), v190);

    }
    objc_msgSend_containerID(v141, v188, v189);
    v192 = (void *)objc_claimAutoreleasedReturnValue();
    v195 = v192;
    if (v192)
    {
      objc_msgSend_containerIdentifier(v192, v193, v194);
      v196 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v197, (uint64_t)CFSTR("containerID"), v196);

    }
    objc_msgSend_request(self, v193, v194);
    v198 = (void *)objc_claimAutoreleasedReturnValue();

    if (v198)
    {
      objc_msgSend_request(self, v199, v200);
      v201 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v202, (uint64_t)CFSTR("request"), v201);

    }
    os_unfair_recursive_lock_lock_with_options();
    MMCSMetrics = self->_MMCSMetrics;
    if (MMCSMetrics)
    {
      objc_msgSend_CKDescriptionPropertiesWithPublic_private_shouldExpand_(MMCSMetrics, v203, v224, 1, v5);
      v205 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v206, (uint64_t)CFSTR("MMCSMetrics"), v205);

    }
    os_unfair_recursive_lock_unlock();
    if (*MEMORY[0x1E0C95280])
    {
      objc_msgSend_unitTestOverrides(self, v207, v208);
      v209 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_allKeys(v209, v210, v211);
      v212 = (void *)objc_claimAutoreleasedReturnValue();
      v215 = objc_msgSend_count(v212, v213, v214);

      if (v215)
      {
        objc_msgSend_unitTestOverrides(self, v216, v217);
        v218 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_CKDescriptionPropertiesWithPublic_private_shouldExpand_(v218, v219, v224, 1, v5);
        v220 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v221, (uint64_t)CFSTR("unitTestOverrides"), v220);

      }
    }

  }
  return v11;
}

- (NSMutableArray)childOperations
{
  return self->_childOperations;
}

- (BOOL)isFinished
{
  return CKOperationExecutionStateIsFinished();
}

- (BOOL)isExecuting
{
  return CKOperationExecutionStateIsExecuting();
}

- (NSMutableArray)requestUUIDs
{
  return self->_requestUUIDs;
}

- (NSMutableArray)finishedChildOperationIDs
{
  return self->_finishedChildOperationIDs;
}

- (BOOL)usesBackgroundSession
{
  uint64_t v2;
  char v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;

  v4 = objc_msgSend_resolvedAutomaticallyRetryNetworkFailures(self, a2, v2);
  v7 = objc_msgSend_resolvedDiscretionaryNetworkBehavior(self, v5, v6);
  if (objc_msgSend_duetPreClearedMode(self, v8, v9) | v7)
    return 1;
  else
    return v4;
}

- (unint64_t)discretionaryNetworkBehavior
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  unint64_t v6;

  objc_msgSend_operationInfo(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_discretionaryNetworkBehavior(v3, v4, v5);

  return v6;
}

- (unint64_t)resolvedDiscretionaryNetworkBehavior
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  const char *v7;
  uint64_t v8;

  if (objc_msgSend_duetPreClearedMode(self, a2, v2))
    return 2;
  if (objc_msgSend_discretionaryWhenBackgroundedState(self, v4, v5) == 1)
    return 0;
  return objc_msgSend_discretionaryNetworkBehavior(self, v7, v8);
}

- (unint64_t)discretionaryWhenBackgroundedState
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  unint64_t v6;

  objc_msgSend_operationInfo(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_discretionaryWhenBackgroundedState(v3, v4, v5);

  return v6;
}

- (BOOL)resolvedAutomaticallyRetryNetworkFailures
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;

  if (objc_msgSend_systemScheduler(self, a2, v2) == 1)
    return 0;
  else
    return objc_msgSend_automaticallyRetryNetworkFailures(self, v4, v5);
}

- (unint64_t)systemScheduler
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  unint64_t v6;

  objc_msgSend_operationInfo(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_systemScheduler(v3, v4, v5);

  return v6;
}

- (BOOL)automaticallyRetryNetworkFailures
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  char v6;

  objc_msgSend_operationInfo(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_automaticallyRetryNetworkFailures(v3, v4, v5);

  return v6;
}

- (NSString)operationID
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend_operationInfo(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_operationID(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (unint64_t)duetPreClearedMode
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  unint64_t v6;

  objc_msgSend_operationInfo(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_duetPreClearedMode(v3, v4, v5);

  return v6;
}

- (CKOperationInfo)operationInfo
{
  return self->_operationInfo;
}

- (BOOL)allowsExpensiveNetworkAccess
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  char v12;

  objc_msgSend_operationInfo(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_allowsExpensiveNetworkAccess(v4, v5, v6))
  {
    objc_msgSend_container(self, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend_allowsExpensiveNetworkAccess(v9, v10, v11);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)isLongLived
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  char isLongLived;

  objc_msgSend_operationInfo(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  isLongLived = objc_msgSend_isLongLived(v3, v4, v5);

  return isLongLived;
}

- (BOOL)isTopLevelDaemonOperation
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  void *v6;
  int v7;

  objc_msgSend_parentOperation(self, a2, v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    LOBYTE(v7) = 0;
  else
    v7 = objc_msgSend_isLongLivedCallbackRelayOperation(self, v4, v5) ^ 1;

  return v7;
}

- (CKDOperation)topmostParentOperation
{
  CKDOperation *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  CKDOperation *v7;
  const char *v8;
  uint64_t v9;

  v2 = self;
  objc_msgSend_parentOperation(v2, v3, v4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    do
    {
      v7 = v6;

      objc_msgSend_parentOperation(v7, v8, v9);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v2 = v7;
    }
    while (v6);
  }
  else
  {
    v7 = v2;
  }
  return v7;
}

- (CKDOperation)parentOperation
{
  CKDOperation *v2;
  id WeakRetained;

  v2 = self;
  objc_sync_enter(v2);
  WeakRetained = objc_loadWeakRetained((id *)&v2->_parentOperation);
  objc_sync_exit(v2);

  return (CKDOperation *)WeakRetained;
}

- (unint64_t)state
{
  CKDOperation *v2;
  unint64_t state;

  v2 = self;
  objc_sync_enter(v2);
  state = v2->_state;
  objc_sync_exit(v2);

  return state;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSString)sourceApplicationSecondaryIdentifier
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend_operationInfo(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sourceApplicationSecondaryIdentifier(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (CKDURLRequest)request
{
  CKDOperation *v2;
  CKDURLRequest *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_request;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)isLongLivedCallbackRelayOperation
{
  return self->_isLongLivedCallbackRelayOperation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricExecuteStartDate, 0);
  objc_storeStrong((id *)&self->_signpost, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_userSyncTask, 0);
  objc_storeStrong((id *)&self->_childOperationsGroup, 0);
  objc_storeStrong((id *)&self->_finishedChildOperationIDs, 0);
  objc_storeStrong((id *)&self->_childOperations, 0);
  objc_storeStrong((id *)&self->_requestUUIDs, 0);
  objc_storeStrong((id *)&self->_stateTransitionGroup, 0);
  objc_storeStrong((id *)&self->_operationInfo, 0);
  objc_storeStrong(&self->_requestCompletedBlock, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_destroyWeak((id *)&self->_parentOperation);
  objc_storeStrong((id *)&self->_clientOperationCallbackProxy, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_osActivity, 0);
  objc_storeStrong((id *)&self->_MMCSMetrics, 0);
  objc_storeStrong((id *)&self->_cloudKitMetrics, 0);
}

- (BOOL)validateAgainstLiveContainer:(id)a3 error:(id *)a4
{
  uint64_t hasValidatedEntitlements;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;

  hasValidatedEntitlements = objc_msgSend_hasValidatedEntitlements(a3, a2, (uint64_t)a3, a4);
  objc_msgSend_operationInfo(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClientHasValidatedEntitlements_(v8, v9, hasValidatedEntitlements);

  return 1;
}

- (BOOL)useEncryption
{
  return self->_useEncryption;
}

- (BOOL)useClearAssetEncryption
{
  return self->_useClearAssetEncryption;
}

- (void)spawnAndRunOperationOfClass:(Class)a3 operationInfo:(id)a4 spawnQueue:(id)a5 operationConfigurationBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  id v16;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  objc_msgSend_container(self, v13, v14);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_spawnAndRunOperationOfClass_operationInfo_spawnQueue_container_operationConfigurationBlock_(self, v15, (uint64_t)a3, v12, v11, v16, v10);

}

- (void)spawnAndRunOperationOfClass:(Class)a3 operationInfo:(id)a4 operationConfigurationBlock:(id)a5
{
  objc_msgSend_spawnAndRunOperationOfClass_operationInfo_spawnQueue_operationConfigurationBlock_(self, a2, (uint64_t)a3, a4, 0, a5);
}

- (void)setRequestCompletedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 360);
}

- (void)setParentOperation:(id)a3
{
  id v4;
  CKDOperation *v5;
  id WeakRetained;
  NSObject *v7;
  int v8;
  CKDOperation *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  WeakRetained = objc_loadWeakRetained((id *)&v5->_parentOperation);

  if (WeakRetained != v4)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v7 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      v8 = 134218240;
      v9 = v5;
      v10 = 2048;
      v11 = v4;
      _os_log_debug_impl(&dword_1BE990000, v7, OS_LOG_TYPE_DEBUG, "Setting parent operation of %p to %p", (uint8_t *)&v8, 0x16u);
    }
    objc_storeWeak((id *)&v5->_parentOperation, v4);
  }
  objc_sync_exit(v5);

}

- (void)setCompletionBlock:(id)a3
{
  id v4;
  objc_super v5;
  objc_super v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  if (v4)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = sub_1BE997E58;
    v7[3] = &unk_1E782EC40;
    objc_copyWeak(&v9, &location);
    v8 = v4;
    v6.receiver = self;
    v6.super_class = (Class)CKDOperation;
    -[CKDOperation setCompletionBlock:](&v6, sel_setCompletionBlock_, v7);

    objc_destroyWeak(&v9);
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)CKDOperation;
    -[CKDOperation setCompletionBlock:](&v5, sel_setCompletionBlock_, 0);
  }
  objc_destroyWeak(&location);

}

- (void)setClientOperationCallbackProxy:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  _QWORD *v8;

  v4 = a3;
  objc_msgSend_topmostParentOperation(self, v5, v6);
  v8 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)v8[39];
  v8[39] = v4;

}

- (id)requestCompletedBlock
{
  return self->_requestCompletedBlock;
}

- (void)request:(id)a3 didFinishWithMetrics:(id)a4 w3cNavigationTiming:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  _BYTE *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  char v29;
  id v30;
  const char *v31;
  void *v32;
  objc_class *v33;
  void *v34;
  const char *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  int v44;
  void *v45;
  const char *v46;
  void (**v47)(_QWORD, _QWORD);
  void *v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  const char *v53;
  const char *v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  int isEqualToString;
  const char *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  const char *v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  int v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  void *v81;
  const char *v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  id v91;
  const char *v92;
  uint64_t v93;
  void *v94;
  const char *v95;
  uint64_t v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  const char *v100;
  const char *v101;
  const char *v102;
  const char *v103;
  void *v104;
  const char *v105;
  const char *v106;
  uint64_t v107;
  void *v108;
  const char *v109;
  const char *v110;
  const char *v111;
  void *v112;
  void *v113;
  void *v114;
  uint64_t v115;
  uint64_t v116;
  id v117;
  _QWORD v118[4];
  id v119;
  id v120;
  id v121;

  v117 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend_requestUUID(v117, v10, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v118[0] = MEMORY[0x1E0C809B0];
    v118[1] = 3221225472;
    v118[2] = sub_1BE9C2998;
    v118[3] = &unk_1E7830730;
    v119 = v8;
    v120 = v14;
    v121 = v117;
    objc_msgSend_updateCloudKitMetrics_(self, v15, (uint64_t)v118);

  }
  objc_msgSend_requestCompletedBlock(self, v12, v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (_BYTE *)MEMORY[0x1E0C95280];
  if (v16)
  {
    objc_msgSend_responseHeaders(v117, v17, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_container(self, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_options(v23, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend_captureResponseHTTPHeaders(v26, v27, v28);

    if ((v29 & 1) == 0)
    {

      v20 = 0;
    }
    v30 = objc_alloc(MEMORY[0x1E0C950C8]);
    v32 = (void *)objc_msgSend_initWithRequestUUID_responseHTTPHeaders_w3cTiming_(v30, v31, (uint64_t)v14, v20, v9);
    v33 = (objc_class *)objc_opt_class();
    NSStringFromClass(v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setOperationClassName_(v32, v35, (uint64_t)v34);

    if (*v19)
    {
      objc_msgSend_container(self, v36, v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_options(v38, v39, v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend_returnRequestOperationProto(v41, v42, v43);

      if (v44)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend_requestOperations(v117, v36, v37);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setRequestOperations_(v32, v46, (uint64_t)v45);

        }
      }
    }
    objc_msgSend_requestCompletedBlock(self, v36, v37);
    v47 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v47)[2](v47, v32);

  }
  objc_msgSend_error(v117, v17, v18);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v48;
  if (v48)
  {
    objc_msgSend_domain(v48, v49, v50);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_isEqualToString_(v52, v53, *MEMORY[0x1E0C94B20]))
    {

    }
    else
    {
      objc_msgSend_domain(v51, v54, v55);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      isEqualToString = objc_msgSend_isEqualToString_(v58, v59, *MEMORY[0x1E0C947D8]);

      if (!isEqualToString)
        goto LABEL_31;
    }
    objc_msgSend_userInfo(v51, v56, v57);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    if (!*v19
      || (objc_msgSend_unitTestOverrides(self, v61, v62),
          v64 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend_objectForKeyedSubscript_(v64, v65, (uint64_t)CFSTR("AllowThrottling")),
          v66 = (void *)objc_claimAutoreleasedReturnValue(),
          v69 = objc_msgSend_BOOLValue(v66, v67, v68),
          v66,
          v64,
          v69))
    {
      objc_msgSend_objectForKey_(v63, v61, *MEMORY[0x1E0C94B28]);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = objc_msgSend_integerValue(v70, v71, v72);

      if (v73 == 503 || v73 == 429)
      {
        objc_msgSend_deviceContext(self, v74, v75);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_throttleManager(v76, v77, v78);
        v79 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_enforcedThrottleForCriteria_willSendRequest_outThrottleError_(v79, v80, (uint64_t)self, 0, 0);
        v81 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v81)
        {
          objc_msgSend_objectForKeyedSubscript_(v63, v82, *MEMORY[0x1E0C94808]);
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          v86 = v83;
          if (v83)
          {
            v87 = objc_msgSend_unsignedLongValue(v83, v84, v85);
          }
          else
          {
            objc_msgSend_sharedOptions(MEMORY[0x1E0C94C00], v84, v85);
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            v115 = (int)objc_msgSend_defaultRetryAfter(v88, v89, v90);

            v87 = v115;
          }
          if (v87 >= 1)
          {
            v116 = v87;
            v91 = objc_alloc_init(MEMORY[0x1E0C951E8]);
            objc_msgSend_containerID(self, v92, v93);
            v114 = v86;
            v94 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_containerIdentifier(v94, v95, v96);
            v112 = (void *)objc_claimAutoreleasedReturnValue();

            v99 = objc_msgSend_operationType(self, v97, v98);
            objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v100, (uint64_t)CFSTR("Device throttle: container=%@, type=%d"), v112, v99);
            v113 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setLabel_(v91, v101, (uint64_t)v113);
            objc_msgSend_setContainerIdentifier_(v91, v102, (uint64_t)v112);
            objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v103, v99);
            v104 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setOperationType_(v91, v105, (uint64_t)v104);

            objc_msgSend_dateWithTimeIntervalSinceNow_(MEMORY[0x1E0C99D68], v106, v107, (double)v116);
            v108 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setExpirationDate_(v91, v109, (uint64_t)v108);

            v86 = v114;
            if (v73 == 503)
              objc_msgSend_setErrorCode_(v91, v110, (uint64_t)&unk_1E78B00D0);
            else
              objc_msgSend_setErrorCode_(v91, v110, (uint64_t)&unk_1E78B00E8);
            objc_msgSend_addThrottle_(v79, v111, (uint64_t)v91);

          }
        }

      }
    }

  }
LABEL_31:

}

- (BOOL)isWaitingOnPCS
{
  signed int v2;

  v2 = atomic_load((unsigned int *)&self->_pcsWaitCount);
  return v2 > 0;
}

- (id)ckShortDescription
{
  uint64_t v2;
  void *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  void *v19;

  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_operationID(self, a2, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__stateFlags(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_opt_class();
  v12 = objc_msgSend_state(self, v10, v11);
  objc_msgSend_nameForState_(v9, v13, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_qualityOfService(self, v15, v16);
  CKStringForQOS();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v4, v18, (uint64_t)CFSTR("%@ %@ State: %@, QoS: %@"), v5, v8, v14, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (BOOL)allowsPowerNapScheduling
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  char hasDarkWakeNetworkReachabilityEnabledEntitlement;

  objc_msgSend_container(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_entitlements(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  hasDarkWakeNetworkReachabilityEnabledEntitlement = objc_msgSend_hasDarkWakeNetworkReachabilityEnabledEntitlement(v6, v7, v8);

  return hasDarkWakeNetworkReachabilityEnabledEntitlement;
}

- (id)additionalRequestHTTPHeaders
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend_operationInfo(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_additionalRequestHTTPHeaders(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_stateFlags
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  const __CFString *v7;
  const char *v8;
  uint64_t v9;
  const __CFString *v10;
  const char *v11;
  uint64_t v12;
  const __CFString *v13;
  const char *v14;
  uint64_t v15;
  const __CFString *v16;
  const char *v17;
  uint64_t v18;
  const __CFString *v19;
  const char *v20;
  uint64_t v21;
  const __CFString *v22;
  int isWaitingOnPCS;
  const char *v24;
  const __CFString *v25;

  v4 = (void *)MEMORY[0x1E0CB3940];
  if (objc_msgSend_isExecuting(self, a2, v2))
    v7 = CFSTR("R");
  else
    v7 = &stru_1E7838F48;
  if (objc_msgSend_isCancelled(self, v5, v6))
    v10 = CFSTR("X");
  else
    v10 = &stru_1E7838F48;
  if (objc_msgSend_usesBackgroundSession(self, v8, v9))
    v13 = CFSTR("B");
  else
    v13 = &stru_1E7838F48;
  if (objc_msgSend_allowsCellularAccess(self, v11, v12))
    v16 = CFSTR("C");
  else
    v16 = &stru_1E7838F48;
  if (objc_msgSend_allowsExpensiveNetworkAccess(self, v14, v15))
    v19 = CFSTR("E");
  else
    v19 = &stru_1E7838F48;
  if (objc_msgSend_isLongLived(self, v17, v18))
    v22 = CFSTR("L");
  else
    v22 = &stru_1E7838F48;
  isWaitingOnPCS = objc_msgSend_isWaitingOnPCS(self, v20, v21);
  v25 = CFSTR("P");
  if (!isWaitingOnPCS)
    v25 = &stru_1E7838F48;
  return (id)objc_msgSend_stringWithFormat_(v4, v24, (uint64_t)CFSTR("(%@%@%@%@%@%@%@) "), v7, v10, v13, v16, v19, v22, v25);
}

- (unsigned)QOSClass
{
  uint64_t v2;

  objc_msgSend_qualityOfService(self, a2, v2);
  return CKQoSClassFromNSQualityOfService();
}

- (id)activityCreate
{
  return _os_activity_create(&dword_1BE990000, "daemon/?", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
}

- (id)createSerialQueue
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  dispatch_qos_class_t v6;
  NSObject *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  const char *v11;
  void *v12;
  id v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  dispatch_queue_t v17;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_QOSClass(self, v4, v5);
  dispatch_queue_attr_make_with_qos_class(v3, v6, 0);
  v7 = objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0CB3940];
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v8, v11, (uint64_t)CFSTR("com.apple.cloudkit.%@"), v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_retainAutorelease(v12);
  v16 = (const char *)objc_msgSend_UTF8String(v13, v14, v15);
  v17 = dispatch_queue_create(v16, v7);

  return v17;
}

- (id)createInactiveSerialQueue
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  dispatch_qos_class_t v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  const char *v12;
  void *v13;
  id v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  dispatch_queue_t v18;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_QOSClass(self, v4, v5);
  dispatch_queue_attr_make_with_qos_class(v3, v6, 0);
  v7 = objc_claimAutoreleasedReturnValue();

  dispatch_queue_attr_make_initially_inactive(v7);
  v8 = objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0CB3940];
  v10 = (objc_class *)objc_opt_class();
  NSStringFromClass(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v9, v12, (uint64_t)CFSTR("com.apple.cloudkit.%@"), v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_retainAutorelease(v13);
  v17 = (const char *)objc_msgSend_UTF8String(v14, v15, v16);
  v18 = dispatch_queue_create(v17, v8);

  return v18;
}

- (id)createConcurrentQueue
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  dispatch_qos_class_t v6;
  NSObject *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  const char *v11;
  void *v12;
  id v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  dispatch_queue_t v17;

  dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E0C80D50], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_QOSClass(self, v4, v5);
  dispatch_queue_attr_make_with_qos_class(v3, v6, 0);
  v7 = objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0CB3940];
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v8, v11, (uint64_t)CFSTR("com.apple.cloudkit.%@"), v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_retainAutorelease(v12);
  v16 = (const char *)objc_msgSend_UTF8String(v13, v14, v15);
  v17 = dispatch_queue_create(v16, v7);

  return v17;
}

- (id)createInactiveConcurrentQueue
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  dispatch_qos_class_t v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  const char *v12;
  void *v13;
  id v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  dispatch_queue_t v18;

  dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E0C80D50], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_QOSClass(self, v4, v5);
  dispatch_queue_attr_make_with_qos_class(v3, v6, 0);
  v7 = objc_claimAutoreleasedReturnValue();

  dispatch_queue_attr_make_initially_inactive(v7);
  v8 = objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0CB3940];
  v10 = (objc_class *)objc_opt_class();
  NSStringFromClass(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v9, v12, (uint64_t)CFSTR("com.apple.cloudkit.%@"), v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_retainAutorelease(v13);
  v17 = (const char *)objc_msgSend_UTF8String(v14, v15, v16);
  v18 = dispatch_queue_create(v17, v8);

  return v18;
}

- (int64_t)clientQueuePriority
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  int64_t v6;

  objc_msgSend_operationInfo(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_clientQueuePriority(v3, v4, v5);

  return v6;
}

- (CKOperationMMCSRequestOptions)MMCSRequestOptions
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend_operationInfo(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_MMCSRequestOptions(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (CKOperationMMCSRequestOptions *)v6;
}

- (NSDictionary)unitTestOverrides
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  void *v13;
  const char *v14;

  if (!*MEMORY[0x1E0C95280])
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, v2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v13, v14, (uint64_t)a2, self, CFSTR("CKDOperation.m"), 371, CFSTR("Only suitable for testing"));

  }
  objc_msgSend_operationInfo(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_resolvedConfiguration(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_unitTestOverrides(v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v10;
}

- (BOOL)checkAndClearUnitTestOverrides:(id)a3
{
  const char *v5;
  uint64_t v6;
  id v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  void *v16;
  BOOL v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  void *v26;
  const char *v27;

  v7 = a3;
  if (!*MEMORY[0x1E0C95280])
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v5, v6);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v26, v27, (uint64_t)a2, self, CFSTR("CKDOperation.m"), 375, CFSTR("Only suitable for testing"));

  }
  objc_msgSend_operationInfo(self, v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_resolvedConfiguration(v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_unitTestOverrides(v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v14, v15, (uint64_t)v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16 != 0;

  objc_msgSend_operationInfo(self, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_resolvedConfiguration(v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeUnitTestOverride_(v23, v24, (uint64_t)v7);

  return v17;
}

- (NSNumber)privacyProxyFailClosedOverride
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend_operationInfo(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_privacyProxyFailClosedOverride(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v6;
}

- (NSString)authPromptReason
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend_operationInfo(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_authPromptReason(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSNumber)cacheDeleteAvailableSpaceClass
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend_operationInfo(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_cacheDeleteAvailableSpaceClass(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v6;
}

- (NSString)description
{
  return (NSString *)((uint64_t (*)(CKDOperation *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKDescription);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  const char *v6;
  id v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  char isEqualToString;

  v4 = a3;
  v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5))
  {
    v7 = v4;
    objc_msgSend_operationID(self, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_operationID(v7, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    isEqualToString = objc_msgSend_isEqualToString_(v10, v14, (uint64_t)v13);
  }
  else
  {
    isEqualToString = 0;
  }

  return isEqualToString;
}

- (void)main
{
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint8_t v9[16];

  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v4 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_fault_impl(&dword_1BE990000, v4, OS_LOG_TYPE_FAULT, "main was called on CKDOperation", v9, 2u);
  }
  objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v7, v8, (uint64_t)a2, self, CFSTR("CKDOperation.m"), 1044, CFSTR("Must be called on subclass"));

}

- (void)cancel
{
  uint64_t v2;
  NSObject *v4;
  NSObject *v5;
  objc_class *v6;
  id v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  objc_super v33;
  os_activity_scope_state_s state;
  uint8_t v35[128];
  uint8_t buf[4];
  id v37;
  __int16 v38;
  CKDOperation *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  objc_msgSend_osActivity(self, a2, v2);
  v4 = objc_claimAutoreleasedReturnValue();
  os_activity_scope_enter(v4, &state);

  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v5 = (id)*MEMORY[0x1E0C952D0];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_ckShortDescription(self, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v37 = v7;
    v38 = 2048;
    v39 = self;
    v40 = 2114;
    v41 = v10;
    _os_log_impl(&dword_1BE990000, v5, OS_LOG_TYPE_DEFAULT, "Cancelling operation <%{public}@: %p; %{public}@>",
      buf,
      0x20u);

  }
  objc_msgSend_setQueuePriority_(self, v11, 8);
  v33.receiver = self;
  v33.super_class = (Class)CKDOperation;
  -[CKDOperation cancel](&v33, sel_cancel);
  objc_msgSend_request(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_cancel(v14, v15, v16);

  objc_msgSend_childOperations(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v19);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  objc_msgSend_childOperations(self, v20, v21, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v23, (uint64_t)&v29, v35, 16);
  if (v26)
  {
    v27 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v30 != v27)
          objc_enumerationMutation(v22);
        objc_msgSend_cancel(*(void **)(*((_QWORD *)&v29 + 1) + 8 * i), v24, v25);
      }
      v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v24, (uint64_t)&v29, v35, 16);
    }
    while (v26);
  }

  objc_sync_exit(v19);
  os_activity_scope_leave(&state);
}

- (BOOL)makeStateTransition
{
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint8_t v10[16];

  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v4 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_fault_impl(&dword_1BE990000, v4, OS_LOG_TYPE_FAULT, "makeStateTransition was called on CKDOperation", v10, 2u);
  }
  objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v7, v8, (uint64_t)a2, self, CFSTR("CKDOperation.m"), 1235, CFSTR("Must be called on subclass"));

  return 0;
}

- (void)makeStateTransition:(BOOL)a3
{
  _BOOL4 v3;
  const char *v6;
  uint64_t v7;
  int isCancelled;
  void *v9;
  const char *v10;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  NSObject *v29;
  const char *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  char v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  NSObject *v41;
  void *v42;
  const char *v43;
  _QWORD block[5];
  char v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  _BOOL4 v51;
  __int16 v52;
  int v53;
  __int16 v54;
  void *v55;
  uint64_t v56;

  v3 = a3;
  v56 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend_state(self, a2, a3) != 0xFFFFFFFFLL)
  {
    isCancelled = objc_msgSend_isCancelled(self, v6, v7);
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v9 = (void *)*MEMORY[0x1E0C952D0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D0], OS_LOG_TYPE_DEFAULT))
    {
      v12 = v9;
      objc_msgSend_operationID(self, v13, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_opt_class();
      v19 = objc_msgSend_state(self, v17, v18);
      objc_msgSend_nameForState_(v16, v20, v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_error(self, v22, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v47 = v15;
      v48 = 2114;
      v49 = v21;
      v50 = 1024;
      v51 = v3;
      v52 = 1024;
      v53 = isCancelled;
      v54 = 2114;
      v55 = v24;
      _os_log_impl(&dword_1BE990000, v12, OS_LOG_TYPE_DEFAULT, "Operation %{public}@ is transitioning from state [%{public}@], stop:%d, cancelled:%d, error:%{public}@", buf, 0x2Cu);

    }
    if (((isCancelled | v3) & 1) != 0
      || (objc_msgSend_error(self, v10, v11), v25 = (void *)objc_claimAutoreleasedReturnValue(), v25, v25))
    {
      objc_msgSend_setState_(self, v10, 0xFFFFFFFFLL);
      if ((isCancelled & 1) != 0)
      {
        v29 = 0;
        objc_msgSend_finishWithError_(self, v27, 0);
      }
      else
      {
        objc_msgSend_error(self, v27, v28);
        v29 = objc_claimAutoreleasedReturnValue();
        objc_msgSend_finishWithError_(self, v30, (uint64_t)v29);
      }
    }
    else
    {
      if (objc_msgSend_isFinished(self, v10, v26))
      {
        objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v31, v32);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v42, v43, (uint64_t)a2, self, CFSTR("CKDOperation.m"), 1255, CFSTR("Operation %@ is marked as finished"), self);

      }
      v33 = (void *)MEMORY[0x1C3B83E24]();
      v36 = objc_msgSend_makeStateTransition(self, v34, v35) ^ 1;
      objc_autoreleasePoolPop(v33);
      objc_msgSend_stateTransitionGroup(self, v37, v38);
      v29 = objc_claimAutoreleasedReturnValue();
      objc_msgSend_qualityOfService(self, v39, v40);
      CKGetGlobalQueue();
      v41 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = sub_1BEA40F88;
      block[3] = &unk_1E7830650;
      block[4] = self;
      v45 = v36;
      dispatch_group_notify(v29, v41, block);

    }
  }
}

- (void)beginUserSyncTask
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  int isSharedIPad;
  const char *v12;
  uint64_t v13;
  void *v14;
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
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  id v29;

  objc_msgSend_currentProcess(CKDDaemonProcess, a2, v2);
  v29 = (id)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend_processType(v29, v4, v5))
  {
    objc_msgSend_sharedManager(MEMORY[0x1E0DC5EE8], v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    isSharedIPad = objc_msgSend_isSharedIPad(v8, v9, v10);

    if (!isSharedIPad)
      return;
    v14 = (void *)MEMORY[0x1E0DC5F10];
    objc_msgSend_operationID(self, v12, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_container(self, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_applicationBundleID(v18, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_taskWithName_reason_forBundleID_(v14, v22, (uint64_t)v15, CFSTR("CloudKit client work"), v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setUserSyncTask_(self, v24, (uint64_t)v23);

    objc_msgSend_userSyncTask(self, v25, v26);
    v29 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_begin(v29, v27, v28);
  }

}

- (void)noteOperationWillWaitOnPCS
{
  int *p_pcsWaitCount;
  unsigned int v3;

  p_pcsWaitCount = &self->_pcsWaitCount;
  do
    v3 = __ldaxr((unsigned int *)p_pcsWaitCount);
  while (__stlxr(v3 + 1, (unsigned int *)p_pcsWaitCount));
}

- (void)noteOperationDidFinishWaitingOnPCS
{
  int *p_pcsWaitCount;
  unsigned int v3;

  p_pcsWaitCount = &self->_pcsWaitCount;
  do
    v3 = __ldaxr((unsigned int *)p_pcsWaitCount);
  while (__stlxr(v3 - 1, (unsigned int *)p_pcsWaitCount));
}

- (void)fetchContainerScopedUserID:(id)a3
{
  void (**v4)(id, _QWORD);
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  void *v21;
  _QWORD v22[4];
  void (**v23)(id, _QWORD);
  id v24;
  id location;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  objc_msgSend_container(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_containerScopedUserID(v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {

    goto LABEL_4;
  }
  v13 = objc_msgSend_databaseScope(self, v11, v12);

  if (v13 == 1)
  {
LABEL_4:
    if (v4)
      v4[2](v4, 0);
    goto LABEL_11;
  }
  objc_initWeak(&location, self);
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v14 = (id)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend_operationID(self, v15, v16);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v27 = v21;
    _os_log_debug_impl(&dword_1BE990000, v14, OS_LOG_TYPE_DEBUG, "Fetching container scoped user identifier for operation %{public}@", buf, 0xCu);

  }
  objc_msgSend_container(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = sub_1BEA41310;
  v22[3] = &unk_1E7830678;
  objc_copyWeak(&v24, &location);
  v23 = v4;
  objc_msgSend_fetchImportantUserIDsForOperation_withCompletionHandler_(v19, v20, (uint64_t)self, v22);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
LABEL_11:

}

- (BOOL)isConcurrent
{
  return 1;
}

- (id)openFileWithOpenInfo:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  const char *v14;
  dispatch_time_t v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, void *, void *);
  void *v29;
  NSObject *v30;
  uint64_t *v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;

  v6 = a3;
  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = sub_1BE9BAF58;
  v43 = sub_1BE9BAD60;
  v44 = 0;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = sub_1BE9BAF58;
  v37 = sub_1BE9BAD60;
  v38 = 0;
  objc_msgSend_clientOperationCallbackProxy(self, v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = dispatch_group_create();
    dispatch_group_enter(v11);
    v12 = (void *)MEMORY[0x1C3B83E24]();
    voucher_copy_without_importance();
    voucher_adopt();
    v26 = MEMORY[0x1E0C809B0];
    v27 = 3221225472;
    v28 = sub_1BEA417AC;
    v29 = &unk_1E78306A0;
    v31 = &v33;
    v32 = &v39;
    v13 = v11;
    v30 = v13;
    objc_msgSend_openFileWithOpenInfo_reply_(v10, v14, (uint64_t)v6, &v26);

    objc_autoreleasePoolPop(v12);
    v15 = dispatch_time(0, 150000000000);
    if (dispatch_group_wait(v13, v15))
    {
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v16, *MEMORY[0x1E0C94B20], 1000, CFSTR("Daemon timed out waiting for adopter process to open file %@"), v6, v26, v27, v28, v29);
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = (void *)v40[5];
      v40[5] = v17;

      if (a4)
        goto LABEL_4;
    }
    else
    {
      v22 = (void *)v34[5];
      if (v22)
      {
        v19 = v22;
        goto LABEL_14;
      }
      if (!v40[5])
      {
        objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v16, *MEMORY[0x1E0C94B20], 1000, CFSTR("Adopter failed to open file %@"), v6, v26, v27, v28, v29);
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = (void *)v40[5];
        v40[5] = v23;

      }
      if (a4)
      {
LABEL_4:
        v19 = 0;
        *a4 = objc_retainAutorelease((id)v40[5]);
LABEL_14:

        goto LABEL_15;
      }
    }
    v19 = 0;
    goto LABEL_14;
  }
  objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v9, *MEMORY[0x1E0C94B20], 1000, CFSTR("nil clientOperationCallbackProxy"));
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)v40[5];
  v40[5] = v20;

  v19 = 0;
  if (a4)
    *a4 = objc_retainAutorelease((id)v40[5]);
LABEL_15:

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v39, 8);

  return v19;
}

- (BOOL)finishWithAssetDownloadStagingInfo:(id)a3 fileURL:(id *)a4 fileHandle:(id *)a5 error:(id *)a6
{
  id v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  const char *v18;
  dispatch_time_t v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  BOOL v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  _QWORD v30[4];
  NSObject *v31;
  uint64_t *v32;
  uint64_t *v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;

  v10 = a3;
  v47 = 0;
  v48 = &v47;
  v49 = 0x3032000000;
  v50 = sub_1BE9BAF58;
  v51 = sub_1BE9BAD60;
  v52 = 0;
  v41 = 0;
  v42 = &v41;
  v43 = 0x3032000000;
  v44 = sub_1BE9BAF58;
  v45 = sub_1BE9BAD60;
  v46 = 0;
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = sub_1BE9BAF58;
  v39 = sub_1BE9BAD60;
  v40 = 0;
  objc_msgSend_clientOperationCallbackProxy(self, v11, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = dispatch_group_create();
    dispatch_group_enter(v15);
    v16 = (void *)MEMORY[0x1C3B83E24]();
    voucher_copy_without_importance();
    voucher_adopt();
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = sub_1BEA41B78;
    v30[3] = &unk_1E78306C8;
    v32 = &v41;
    v33 = &v35;
    v34 = &v47;
    v17 = v15;
    v31 = v17;
    objc_msgSend_handleFinishWithAssetDownloadStagingInfo_reply_(v14, v18, (uint64_t)v10, v30);

    objc_autoreleasePoolPop(v16);
    v19 = dispatch_time(0, 150000000000);
    if (dispatch_group_wait(v17, v19))
    {
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v20, *MEMORY[0x1E0C94B20], 1000, CFSTR("Daemon timed out waiting for adopter process to finish file %@"), v10);
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = (void *)v48[5];
      v48[5] = v21;

      if (a6)
      {
LABEL_4:
        v23 = 0;
        *a6 = objc_retainAutorelease((id)v48[5]);
LABEL_18:

        goto LABEL_19;
      }
    }
    else
    {
      v26 = (void *)v42[5];
      if (v26)
      {
        if (a4)
          *a4 = objc_retainAutorelease(v26);
        if (a5)
          *a5 = objc_retainAutorelease((id)v36[5]);
        v23 = v42[5] != 0;
        goto LABEL_18;
      }
      if (!v48[5])
      {
        objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v20, *MEMORY[0x1E0C94B20], 1000, CFSTR("Adopter failed to finish file %@"), v10);
        v27 = objc_claimAutoreleasedReturnValue();
        v28 = (void *)v48[5];
        v48[5] = v27;

      }
      if (a6)
        goto LABEL_4;
    }
    v23 = 0;
    goto LABEL_18;
  }
  objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v13, *MEMORY[0x1E0C94B20], 1000, CFSTR("nil clientOperationCallbackProxy"));
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = (void *)v48[5];
  v48[5] = v24;

  v23 = 0;
  if (a6)
    *a6 = objc_retainAutorelease((id)v48[5]);
LABEL_19:

  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v41, 8);

  _Block_object_dispose(&v47, 8);
  return v23;
}

- (void)updateMMCSMetrics:(id)a3
{
  CKDOperationMetrics *MMCSMetrics;
  CKDOperationMetrics *v5;
  CKDOperationMetrics *v6;
  void (**v7)(id, CKDOperationMetrics *);

  v7 = (void (**)(id, CKDOperationMetrics *))a3;
  os_unfair_recursive_lock_lock_with_options();
  MMCSMetrics = self->_MMCSMetrics;
  if (!MMCSMetrics)
  {
    v5 = (CKDOperationMetrics *)objc_opt_new();
    v6 = self->_MMCSMetrics;
    self->_MMCSMetrics = v5;

    MMCSMetrics = self->_MMCSMetrics;
  }
  v7[2](v7, MMCSMetrics);
  os_unfair_recursive_lock_unlock();

}

- (id)_startDateString
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  const char *v9;
  __CFString *v10;

  if (qword_1ED700B10 != -1)
    dispatch_once(&qword_1ED700B10, &unk_1E7830750);
  objc_msgSend_startDate(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v7 = (void *)qword_1ED700B08;
    objc_msgSend_startDate(self, v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringFromDate_(v7, v9, (uint64_t)v8);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = CFSTR("(unknown)");
  }
  return v10;
}

- (id)CKStatusReportProperties
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  unint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const char *v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  void *v22;
  void *v23;
  const char *v24;
  void *v25;
  const char *v26;
  void *v27;
  const char *v28;

  objc_msgSend_parentOperation(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_container(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_opt_new();
  v11 = objc_msgSend_state(self, v9, v10);
  if (v11 >= 2)
  {
    v14 = v11;
    v15 = (void *)MEMORY[0x1E0CB3940];
    v16 = (void *)objc_opt_class();
    objc_msgSend_nameForState_(v16, v17, v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v15, v19, (uint64_t)CFSTR("state: %@"), v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v8, v21, (uint64_t)v20);

  }
  if (v4)
  {
    v22 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_operationID(v4, v12, v13);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v22, v24, (uint64_t)CFSTR("parent: %@"), v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v8, v26, (uint64_t)v25);

  }
  if (v7)
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v12, (uint64_t)CFSTR("container: %p"), v7);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v8, v28, (uint64_t)v27);

  }
  return v8;
}

- (id)CKStatusReportLogGroups
{
  return 0;
}

- (id)statusReportWithIndent:(unint64_t)a3
{
  void *v4;
  uint64_t v5;
  objc_class *v6;
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
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  void *v35;
  const char *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  void *v52;
  id v53;
  const char *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t i;
  void *v59;
  const char *v60;
  uint64_t v61;
  const char *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  const char *v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  const char *v71;
  const char *v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  const char *v76;
  const char *v77;
  uint64_t v78;
  uint64_t j;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  const char *v83;
  id v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t k;
  uint64_t v89;
  uint64_t v90;
  const char *v91;
  const char *v92;
  uint64_t v93;
  const char *v94;
  void *v95;
  const char *v96;
  uint64_t v97;
  void *v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  const char *v103;
  uint64_t v104;
  void *v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  const char *v109;
  uint64_t v110;
  void *v111;
  const char *v112;
  void *v113;
  const char *v114;
  const char *v115;
  uint64_t v116;
  void *v117;
  const char *v118;
  uint64_t v119;
  void *v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  const char *v125;
  uint64_t v126;
  void *v127;
  const char *v128;
  uint64_t v129;
  uint64_t v130;
  const char *v131;
  uint64_t v132;
  void *v133;
  const char *v134;
  void *v135;
  const char *v136;
  uint64_t v137;
  const char *v138;
  uint64_t v139;
  const char *v140;
  uint64_t v141;
  const char *v142;
  uint64_t v143;
  const char *v144;
  uint64_t v145;
  const char *v146;
  uint64_t v147;
  const char *v148;
  const char *v149;
  uint64_t v150;
  void *v151;
  uint64_t v152;
  const char *v153;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  CKDOperation *v159;
  id obj;
  uint64_t v161;
  void *v162;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  _BYTE v176[128];
  _BYTE v177[128];
  _BYTE v178[128];
  uint64_t v179;

  v179 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB37A0];
  v5 = CKTabIndentAtDepth();
  v159 = self;
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_operationID(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v4, v11, (uint64_t)CFSTR("%s<%@ %@ "), v5, v7, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend__stateFlags(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v12, v16, (uint64_t)CFSTR("%@"), v15);

  objc_msgSend_qualityOfService(self, v17, v18);
  CKStringForQOS();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v12, v20, (uint64_t)CFSTR("QoS %@ "), v19);

  objc_msgSend_startDate(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_timeIntervalSinceNow(v23, v24, v25);

  CKDescriptionForTimeInterval();
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__startDateString(self, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v12, v29, (uint64_t)CFSTR("running for %@ (started %@) "), v156, v28);

  objc_msgSend_CKStatusReportProperties(self, v30, v31);
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v158, v32, v33))
  {
    objc_msgSend_componentsJoinedByString_(v158, v34, (uint64_t)CFSTR(", "));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v12, v36, (uint64_t)CFSTR("%@ "), v35);

  }
  objc_msgSend_appendString_(v12, v34, (uint64_t)CFSTR(">\n"));
  objc_msgSend_childOperations(self, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v39);
  objc_msgSend_childOperations(self, v40, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = (void *)objc_msgSend_copy(v42, v43, v44);

  objc_sync_exit(v39);
  if (objc_msgSend_count(v45, v46, v47))
  {
    v50 = CKTabIndentAtDepth();
    objc_msgSend_appendFormat_(v12, v51, (uint64_t)CFSTR("%sRunning Child Operations: {\n"), v50);
    v174 = 0u;
    v175 = 0u;
    v172 = 0u;
    v173 = 0u;
    v52 = v45;
    v53 = v45;
    v56 = objc_msgSend_countByEnumeratingWithState_objects_count_(v53, v54, (uint64_t)&v172, v178, 16);
    if (v56)
    {
      v57 = *(_QWORD *)v173;
      do
      {
        for (i = 0; i != v56; ++i)
        {
          if (*(_QWORD *)v173 != v57)
            objc_enumerationMutation(v53);
          objc_msgSend_statusReportWithIndent_(*(void **)(*((_QWORD *)&v172 + 1) + 8 * i), v55, a3 + 1);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_appendFormat_(v12, v60, (uint64_t)CFSTR("%@"), v59);

        }
        v56 = objc_msgSend_countByEnumeratingWithState_objects_count_(v53, v55, (uint64_t)&v172, v178, 16);
      }
      while (v56);
    }

    v61 = CKTabIndentAtDepth();
    objc_msgSend_appendFormat_(v12, v62, (uint64_t)CFSTR("%s}\n"), v61);
    v45 = v52;
  }
  v155 = v45;
  objc_msgSend_request(v159, v48, v49);
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  if (v157)
  {
    v65 = CKTabIndentAtDepth();
    objc_msgSend_appendFormat_(v12, v66, (uint64_t)CFSTR("%sRequest: {\n"), v65);
    objc_msgSend_statusReportWithIndent_(v157, v67, a3 + 1);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v12, v69, (uint64_t)CFSTR("%@"), v68);

    v70 = CKTabIndentAtDepth();
    objc_msgSend_appendFormat_(v12, v71, (uint64_t)CFSTR("%s}\n"), v70);
  }
  objc_msgSend_CKStatusReportLogGroups(v159, v63, v64);
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v162, v72, v73))
  {
    v170 = 0u;
    v171 = 0u;
    v168 = 0u;
    v169 = 0u;
    objc_msgSend_allKeys(v162, v74, v75);
    obj = (id)objc_claimAutoreleasedReturnValue();
    v78 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v76, (uint64_t)&v168, v177, 16);
    if (v78)
    {
      v161 = *(_QWORD *)v169;
      do
      {
        for (j = 0; j != v78; ++j)
        {
          if (*(_QWORD *)v169 != v161)
            objc_enumerationMutation(obj);
          v80 = *(_QWORD *)(*((_QWORD *)&v168 + 1) + 8 * j);
          objc_msgSend_objectForKeyedSubscript_(v162, v77, v80);
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          v82 = CKTabIndentAtDepth();
          objc_msgSend_appendFormat_(v12, v83, (uint64_t)CFSTR("%s%@: {\n"), v82, v80);
          v166 = 0u;
          v167 = 0u;
          v164 = 0u;
          v165 = 0u;
          v84 = v81;
          v86 = objc_msgSend_countByEnumeratingWithState_objects_count_(v84, v85, (uint64_t)&v164, v176, 16);
          if (v86)
          {
            v87 = *(_QWORD *)v165;
            do
            {
              for (k = 0; k != v86; ++k)
              {
                if (*(_QWORD *)v165 != v87)
                  objc_enumerationMutation(v84);
                v89 = *(_QWORD *)(*((_QWORD *)&v164 + 1) + 8 * k);
                v90 = CKTabIndentAtDepth();
                objc_msgSend_appendFormat_(v12, v91, (uint64_t)CFSTR("%s%@\n"), v90, v89);
              }
              v86 = objc_msgSend_countByEnumeratingWithState_objects_count_(v84, v92, (uint64_t)&v164, v176, 16);
            }
            while (v86);
          }

          v93 = CKTabIndentAtDepth();
          objc_msgSend_appendFormat_(v12, v94, (uint64_t)CFSTR("%s}\n"), v93);

        }
        v78 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v77, (uint64_t)&v168, v177, 16);
      }
      while (v78);
    }

  }
  objc_msgSend_requestUUIDs(v159, v74, v75);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v95);
  objc_msgSend_requestUUIDs(v159, v96, v97);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v101 = objc_msgSend_count(v98, v99, v100);

  if (v101)
  {
    v102 = CKTabIndentAtDepth();
    objc_msgSend_requestUUIDs(v159, v103, v104);
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    v108 = objc_msgSend_count(v105, v106, v107);
    objc_msgSend_requestUUIDs(v159, v109, v110);
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_componentsJoinedByString_(v111, v112, (uint64_t)CFSTR(", "));
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v12, v114, (uint64_t)CFSTR("%s%lu Previous Requests: [%@]\n"), v102, v108, v113);

  }
  objc_sync_exit(v95);

  objc_msgSend_finishedChildOperationIDs(v159, v115, v116);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v117);
  objc_msgSend_finishedChildOperationIDs(v159, v118, v119);
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  v123 = objc_msgSend_count(v120, v121, v122);

  if (v123)
  {
    v124 = CKTabIndentAtDepth();
    objc_msgSend_finishedChildOperationIDs(v159, v125, v126);
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    v130 = objc_msgSend_count(v127, v128, v129);
    objc_msgSend_finishedChildOperationIDs(v159, v131, v132);
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_componentsJoinedByString_(v133, v134, (uint64_t)CFSTR(", "));
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v12, v136, (uint64_t)CFSTR("%s%lu Finished Child Operations: [%@]\n"), v124, v130, v135);

  }
  objc_sync_exit(v117);

  os_unfair_recursive_lock_lock_with_options();
  v137 = CKTabIndentAtDepth();
  objc_msgSend_appendFormat_(v12, v138, (uint64_t)CFSTR("%sCloudKit metrics: {\n"), v137);
  v139 = CKTabIndentAtDepth();
  objc_msgSend_appendFormat_(v12, v140, (uint64_t)CFSTR("%s%@\n"), v139, v159->_cloudKitMetrics);
  v141 = CKTabIndentAtDepth();
  objc_msgSend_appendFormat_(v12, v142, (uint64_t)CFSTR("%s}\n"), v141);
  if (v159->_MMCSMetrics)
  {
    v143 = CKTabIndentAtDepth();
    objc_msgSend_appendFormat_(v12, v144, (uint64_t)CFSTR("%sMMCS metrics: {\n"), v143);
    v145 = CKTabIndentAtDepth();
    objc_msgSend_appendFormat_(v12, v146, (uint64_t)CFSTR("%s%@\n"), v145, v159->_MMCSMetrics);
    v147 = CKTabIndentAtDepth();
    objc_msgSend_appendFormat_(v12, v148, (uint64_t)CFSTR("%s}\n"), v147);
  }
  os_unfair_recursive_lock_unlock();
  objc_msgSend_error(v159, v149, v150);
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  if (v151)
  {
    v152 = CKTabIndentAtDepth();
    objc_msgSend_appendFormat_(v12, v153, (uint64_t)CFSTR("%sError: %@\n"), v152, v151);
  }

  return v12;
}

- (BOOL)isNetworkingBehaviorEquivalentForOperation:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  int v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  int v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  int v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  int v28;
  const char *v29;
  uint64_t v30;
  int v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  int v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  int v55;
  const char *v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  int v62;
  const char *v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  void *v68;
  char v69;

  v4 = a3;
  objc_msgSend_operationInfo(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_allowsCellularAccess(v7, v8, v9);
  objc_msgSend_operationInfo(v4, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend_allowsCellularAccess(v13, v14, v15);

  if (v10 != v16)
    goto LABEL_10;
  objc_msgSend_operationInfo(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend_allowsExpensiveNetworkAccess(v19, v20, v21);
  objc_msgSend_operationInfo(v4, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend_allowsExpensiveNetworkAccess(v25, v26, v27);

  if (v22 != v28)
    goto LABEL_10;
  v31 = objc_msgSend_usesBackgroundSession(self, v29, v30);
  if (v31 != objc_msgSend_usesBackgroundSession(v4, v32, v33))
    goto LABEL_10;
  v36 = objc_msgSend_resolvedAutomaticallyRetryNetworkFailures(self, v34, v35);
  if (v36 != objc_msgSend_resolvedAutomaticallyRetryNetworkFailures(v4, v37, v38))
    goto LABEL_10;
  v41 = objc_msgSend_resolvedDiscretionaryNetworkBehavior(self, v39, v40);
  if (v41 != objc_msgSend_resolvedDiscretionaryNetworkBehavior(v4, v42, v43))
    goto LABEL_10;
  v46 = objc_msgSend_duetPreClearedMode(self, v44, v45);
  if (v46 != objc_msgSend_duetPreClearedMode(v4, v47, v48))
    goto LABEL_10;
  objc_msgSend_applicationBundleIdentifierForNetworkAttribution(self, v49, v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_applicationBundleIdentifierForNetworkAttribution(v4, v52, v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = CKObjectsAreBothNilOrEqual();

  if (!v55)
    goto LABEL_10;
  objc_msgSend_sourceApplicationSecondaryIdentifier(self, v56, v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sourceApplicationSecondaryIdentifier(v4, v59, v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = CKObjectsAreBothNilOrEqual();

  if (v62)
  {
    objc_msgSend_privacyProxyFailClosedOverride(self, v63, v64);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_privacyProxyFailClosedOverride(v4, v66, v67);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = CKObjectsAreBothNilOrEqual();

  }
  else
  {
LABEL_10:
    v69 = 0;
  }

  return v69;
}

- (id)dugongKeyRollAnalyticsPayloadWithError:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  id v8;
  const char *v9;
  void *v10;
  void *v11;

  v4 = a3;
  v7 = v4;
  if (v4)
  {
    v8 = v4;
  }
  else
  {
    objc_msgSend_error(self, v5, v6);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v8;
  objc_msgSend_baseOperationAndErrorInfoCoreAnalyticsPayloadWithError_(self, v9, (uint64_t)v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (int)operationType
{
  void *v3;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v3 = (void *)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_FAULT))
  {
    v5 = v3;
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v7;
    v11 = 2114;
    v12 = v8;
    _os_log_fault_impl(&dword_1BE990000, v5, OS_LOG_TYPE_FAULT, "Operation class %{public}@ does not implement %{public}@", (uint8_t *)&v9, 0x16u);

  }
  return 0;
}

- (BOOL)isOperationType:(int)a3
{
  return objc_msgSend_operationType(self, a2, *(uint64_t *)&a3) == a3;
}

- (void)pushStatisticsTo:(id)a3
{
  id v4;
  const char *v5;

  v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  objc_msgSend_addOperation_cloudKitMetrics_MMCSMetrics_(v4, v5, (uint64_t)self, self->_cloudKitMetrics, self->_MMCSMetrics);

  os_unfair_recursive_lock_unlock();
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
}

- (void)setUseClearAssetEncryption:(BOOL)a3
{
  self->_useClearAssetEncryption = a3;
}

- (void)setCallbackQueue:(id)a3
{
  objc_storeStrong((id *)&self->_callbackQueue, a3);
}

- (void)setStateTransitionGroup:(id)a3
{
  objc_storeStrong((id *)&self->_stateTransitionGroup, a3);
}

- (void)setChildOperationsGroup:(id)a3
{
  objc_storeStrong((id *)&self->_childOperationsGroup, a3);
}

- (void)setUserSyncTask:(id)a3
{
  objc_storeStrong((id *)&self->_userSyncTask, a3);
}

- (int)pcsWaitCount
{
  return atomic_load((unsigned int *)&self->_pcsWaitCount);
}

- (void)setPcsWaitCount:(int)a3
{
  atomic_store(a3, (unsigned int *)&self->_pcsWaitCount);
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (void)setDidAttemptDugongKeyRoll:(BOOL)a3
{
  self->_didAttemptDugongKeyRoll = a3;
}

@end
