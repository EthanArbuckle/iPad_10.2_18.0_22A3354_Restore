@implementation CKDDatabaseOperation

- (CKDDatabaseOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  CKDDatabaseOperation *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  int v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  int isTestContainer;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  objc_super v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v44.receiver = self;
  v44.super_class = (Class)CKDDatabaseOperation;
  v10 = -[CKDOperation initWithOperationInfo:container:](&v44, sel_initWithOperationInfo_container_, v6, v7);
  if (v10)
  {
    v10->_databaseScope = objc_msgSend_databaseScope(v6, v8, v9);
    if (objc_msgSend_databaseScope(v6, v11, v12) == 4)
    {
      objc_msgSend_setUseClearAssetEncryption_(v10, v13, 1);
    }
    else if (objc_msgSend_supportsClearAssetEncryption(v10, v13, v14))
    {
      objc_msgSend_options(v7, v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend_useClearAssetEncryption(v17, v18, v19);

      if (v20)
      {
        objc_msgSend_containerID(v7, v15, v16);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend_specialContainerType(v21, v22, v23);

        if (v24 == 15
          || (objc_msgSend_containerID(v7, v25, v26),
              v27 = (void *)objc_claimAutoreleasedReturnValue(),
              isTestContainer = objc_msgSend_isTestContainer(v27, v28, v29),
              v27,
              isTestContainer))
        {
          objc_msgSend_setUseClearAssetEncryption_(v10, v25, 1);
        }
        if ((objc_msgSend_useClearAssetEncryption(v10, v25, v31) & 1) == 0)
        {
          if (*MEMORY[0x1E0C95300] != -1)
            dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
          v32 = (void *)*MEMORY[0x1E0C952B0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_FAULT))
          {
            v37 = v32;
            objc_msgSend_applicationBundleID(v7, v38, v39);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_containerID(v7, v41, v42);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v46 = v40;
            v47 = 2114;
            v48 = v43;
            _os_log_fault_impl(&dword_1BE990000, v37, OS_LOG_TYPE_FAULT, "Unauthorized client (%{public}@) is trying to use clear asset encryption in container (%{public}@)", buf, 0x16u);

          }
        }
      }
    }
    if (objc_msgSend_databaseScope(v6, v15, v16) == 1
      || objc_msgSend_databaseScope(v6, v33, v34) == 4
      || objc_msgSend_useClearAssetEncryption(v10, v33, v35))
    {
      objc_msgSend_setUseEncryption_(v10, v33, 0);
    }
  }

  return v10;
}

- (int64_t)databaseScope
{
  return self->_databaseScope;
}

- (BOOL)supportsClearAssetEncryption
{
  return 0;
}

- (void)spawnAndRunOperationOfClass:(Class)a3 operationInfo:(id)a4 spawnQueue:(id)a5 container:(id)a6 operationConfigurationBlock:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  objc_super v20;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v18 = objc_msgSend_databaseScope(self, v16, v17);
  objc_msgSend_setDatabaseScope_(v15, v19, v18);
  v20.receiver = self;
  v20.super_class = (Class)CKDDatabaseOperation;
  -[CKDOperation spawnAndRunOperationOfClass:operationInfo:spawnQueue:container:operationConfigurationBlock:](&v20, sel_spawnAndRunOperationOfClass_operationInfo_spawnQueue_container_operationConfigurationBlock_, a3, v15, v14, v13, v12);

}

- (id)analyticsPayload
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  void *v9;
  const char *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CKDDatabaseOperation;
  -[CKDOperation analyticsPayload](&v12, sel_analyticsPayload);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB37E8];
  v7 = objc_msgSend_databaseScope(self, v5, v6);
  objc_msgSend_numberWithInteger_(v4, v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v10, (uint64_t)v9, 0x1E78391A8);

  return v3;
}

- (id)activityCreate
{
  return _os_activity_create(&dword_1BE990000, "daemon/db-operation", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
}

- (id)CKStatusReportProperties
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CKDDatabaseOperation;
  -[CKDOperation CKStatusReportProperties](&v12, sel_CKStatusReportProperties);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_databaseScope(self, v5, v6);
  CKDatabaseScopeString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v4, v8, (uint64_t)CFSTR("scope: %@"), v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v3, v10, (uint64_t)v9);

  return v3;
}

- (void)setDatabaseScope:(int64_t)a3
{
  self->_databaseScope = a3;
}

- (void)setPCSData:(id)a3 forFetchedRecordID:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  const char *v21;
  _QWORD v22[4];
  NSObject *v23;

  if (a4)
  {
    v6 = a4;
    v7 = a3;
    objc_msgSend_stateTransitionGroup(self, v8, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    dispatch_group_enter(v10);
    objc_msgSend_container(self, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_pcsCache(v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend_databaseScope(self, v17, v18);
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = sub_1BEC38184;
    v22[3] = &unk_1E782EDA8;
    v23 = v10;
    v20 = v10;
    objc_msgSend__setPCSData_forFetchedRecordID_withScope_withCompletionHandler_(v16, v21, (uint64_t)v7, v6, v19, v22);

  }
}

- (void)setPCSData:(id)a3 forFetchedZoneID:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  const char *v21;
  _QWORD v22[4];
  NSObject *v23;

  if (a4)
  {
    v6 = a4;
    v7 = a3;
    objc_msgSend_stateTransitionGroup(self, v8, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    dispatch_group_enter(v10);
    objc_msgSend_container(self, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_pcsCache(v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend_databaseScope(self, v17, v18);
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = sub_1BEC38280;
    v22[3] = &unk_1E782EDA8;
    v23 = v10;
    v20 = v10;
    objc_msgSend__setPCSData_forFetchedZoneID_withScope_withCompletionHandler_(v16, v21, (uint64_t)v7, v6, v19, v22);

  }
}

- (void)setPCSData:(id)a3 forFetchedShareID:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  const char *v21;
  _QWORD v22[4];
  NSObject *v23;

  if (a4)
  {
    v6 = a4;
    v7 = a3;
    objc_msgSend_stateTransitionGroup(self, v8, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    dispatch_group_enter(v10);
    objc_msgSend_container(self, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_pcsCache(v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend_databaseScope(self, v17, v18);
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = sub_1BEC3837C;
    v22[3] = &unk_1E782EDA8;
    v23 = v10;
    v20 = v10;
    objc_msgSend__setPCSData_forFetchedShareID_withScope_withCompletionHandler_(v16, v21, (uint64_t)v7, v6, v19, v22);

  }
}

- (void)_encryptMergeableDeltas:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  uint64_t v8;
  const char *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  const char *v21;
  uint64_t v22;
  NSObject *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  NSObject *v27;
  NSObject *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  _QWORD v35[5];
  void (**v36)(id, _QWORD);
  uint64_t *v37;
  _QWORD v38[4];
  NSObject *v39;
  CKDDatabaseOperation *v40;
  uint64_t *v41;
  id v42;
  _QWORD v43[5];
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  _BYTE location[12];
  __int16 v51;
  uint64_t v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  v44 = 0;
  v45 = &v44;
  v46 = 0x3032000000;
  v47 = sub_1BE9BB250;
  v48 = sub_1BE9BAED0;
  v8 = MEMORY[0x1E0C809B0];
  v49 = 0;
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = sub_1BEC7C560;
  v43[3] = &unk_1E7838AC0;
  v43[4] = &v44;
  objc_msgSend_CKCompactReduceIntoDictionary_(v6, v9, (uint64_t)v43);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v10;
  if (v45[5])
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v14 = (id)*MEMORY[0x1E0C952C0];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend_operationID(self, v15, v16);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v45[5];
      *(_DWORD *)location = 138543618;
      *(_QWORD *)&location[4] = v31;
      v51 = 2112;
      v52 = v32;
      _os_log_error_impl(&dword_1BE990000, v14, OS_LOG_TYPE_ERROR, "Invalid encrypted deltas for operation %{public}@: %@", location, 0x16u);

    }
    if (v7)
    {
      v17 = v45[5];
LABEL_8:
      v7[2](v7, v17);
    }
  }
  else
  {
    v18 = objc_msgSend_count(v10, v11, v12);
    v19 = (void *)*MEMORY[0x1E0C952F8];
    if (v18)
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], v19);
      v20 = (id)*MEMORY[0x1E0C952C0];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend_operationID(self, v21, v22);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)location = 138543362;
        *(_QWORD *)&location[4] = v33;
        _os_log_debug_impl(&dword_1BE990000, v20, OS_LOG_TYPE_DEBUG, "Will encrypt deltas for operation %{public}@", location, 0xCu);

      }
      objc_initWeak((id *)location, self);
      v38[0] = v8;
      v38[1] = 3221225472;
      v38[2] = sub_1BEC7C670;
      v38[3] = &unk_1E7838B10;
      v23 = dispatch_group_create();
      v39 = v23;
      v40 = self;
      objc_copyWeak(&v42, (id *)location);
      v41 = &v44;
      objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v13, v24, (uint64_t)v38);
      objc_msgSend_callbackQueue(self, v25, v26);
      v27 = objc_claimAutoreleasedReturnValue();
      v35[0] = v8;
      v35[1] = 3221225472;
      v35[2] = sub_1BEC7CB70;
      v35[3] = &unk_1E7838B38;
      v35[4] = self;
      v36 = v7;
      v37 = &v44;
      dispatch_group_notify(v23, v27, v35);

      objc_destroyWeak(&v42);
      objc_destroyWeak((id *)location);
    }
    else
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], v19);
      v28 = (id)*MEMORY[0x1E0C952C0];
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend_operationID(self, v29, v30);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)location = 138543362;
        *(_QWORD *)&location[4] = v34;
        _os_log_debug_impl(&dword_1BE990000, v28, OS_LOG_TYPE_DEBUG, "No deltas to encrypt for operation %{public}@", location, 0xCu);

      }
      if (v7)
      {
        v17 = 0;
        goto LABEL_8;
      }
    }
  }

  _Block_object_dispose(&v44, 8);
}

@end
