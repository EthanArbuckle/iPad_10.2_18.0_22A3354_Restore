@implementation CKLogicalDeviceScopedStateManager

- (CKLogicalDeviceScopedStateManager)initWithDeviceContext:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  CKLogicalDeviceScopedStateManager *v8;
  uint64_t v9;
  NSMapTable *assetsByUUID;
  uint64_t v11;
  NSMutableSet *outstandingOperationIDs;
  uint64_t v13;
  NSMutableSet *completedLongLivedOperationIDs;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CKLogicalDeviceScopedStateManager;
  v8 = -[CKLogicalDeviceScopedStateManager init](&v16, sel_init);
  if (v8)
  {
    objc_msgSend_strongToWeakObjectsMapTable(MEMORY[0x1E0CB3748], v5, v6, v7);
    v9 = objc_claimAutoreleasedReturnValue();
    assetsByUUID = v8->_assetsByUUID;
    v8->_assetsByUUID = (NSMapTable *)v9;

    v11 = objc_opt_new();
    outstandingOperationIDs = v8->_outstandingOperationIDs;
    v8->_outstandingOperationIDs = (NSMutableSet *)v11;

    v13 = objc_opt_new();
    completedLongLivedOperationIDs = v8->_completedLongLivedOperationIDs;
    v8->_completedLongLivedOperationIDs = (NSMutableSet *)v13;

    objc_storeWeak((id *)&v8->_deviceContext, v4);
  }

  return v8;
}

- (void)trackAssets:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  const char *v22;
  void *v23;
  const char *v24;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_assetsByUUID(self, v5, v6, v7);
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v8 = v4;
  v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v27, (uint64_t)v31, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v28;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v28 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v12);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          objc_msgSend_UUID(v13, v14, v15, v16);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v20)
          {
            objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v17, v18, v19);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v23, v24, (uint64_t)a2, (uint64_t)self, CFSTR("CKLogicalDeviceScopedStateManager.m"), 56, CFSTR("Expected non-nil UUID for %@"), v13);

          }
          objc_msgSend_assetsByUUID(self, v17, v18, v19);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_forKey_(v21, v22, (uint64_t)v13, (uint64_t)v20);

        }
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v14, (uint64_t)&v27, (uint64_t)v31, 16);
    }
    while (v10);
  }

  objc_sync_exit(obj);
}

- (id)trackedAssetForUUID:(id)a3
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
  void *v15;

  v4 = a3;
  objc_msgSend_assetsByUUID(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v8);
  objc_msgSend_assetsByUUID(self, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v12, v13, (uint64_t)v4, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v8);
  return v15;
}

- (void)registerLongLivedOperationWithIDAsOutstanding:(id)a3
{
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
  int v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  int v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  void *v28;
  char *v29;

  v29 = (char *)a3;
  if (!v29)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v5, v6, v7);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v26, v27, (uint64_t)a2, (uint64_t)self, CFSTR("CKLogicalDeviceScopedStateManager.m"), 69, CFSTR("Expected a non-nil operationID to register"));

  }
  objc_msgSend_outstandingOperationIDs(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v8);
  objc_msgSend_outstandingOperationIDs(self, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend_containsObject_(v12, v13, (uint64_t)v29, v14);

  if (v15)
  {
    v28 = (void *)objc_msgSend_initWithCode_format_([CKException alloc], v29, 12, (uint64_t)CFSTR("Long-lived operation %@ attempted to start, but another instance of it is already running. Your code should only fetch and re-enqueue long-lived operations on app launch."), v29);
    goto LABEL_9;
  }
  if (CKCurrentProcessLinkCheck5dbf91c3fd1d871f0bcfe60afeb451e3e708d350())
  {
    objc_msgSend_completedLongLivedOperationIDs(self, v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend_containsObject_(v19, v20, (uint64_t)v29, v21);

    if (v22)
    {
      v28 = (void *)objc_msgSend_initWithCode_format_([CKException alloc], v29, 12, (uint64_t)CFSTR("Long-lived operation %@ attempted to start, but another instance of it had already completed in this process. Your code should only fetch and re-enqueue long-lived operations on app launch."), v29);
LABEL_9:
      objc_exception_throw(v28);
    }
  }
  objc_msgSend_outstandingOperationIDs(self, v16, v17, v18);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v23, v24, (uint64_t)v29, v25);

  objc_sync_exit(v8);
}

- (void)registerLongLivedOperationWithIDAsCompleted:(id)a3 allowResumingCompletedLongLivedOperations:(BOOL)a4
{
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  char v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  int v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  void *v39;
  const char *v40;
  void *v41;
  const char *v42;
  id v43;

  v43 = a3;
  if (!v43)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v7, v8, v9);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v37, v38, (uint64_t)a2, (uint64_t)self, CFSTR("CKLogicalDeviceScopedStateManager.m"), 83, CFSTR("Expected a non-nil operationID to mark as completed"));

  }
  objc_msgSend_outstandingOperationIDs(self, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v10);
  objc_msgSend_outstandingOperationIDs(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend_containsObject_(v14, v15, (uint64_t)v43, v16);

  if ((v17 & 1) == 0)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v18, v19, v20);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v39, v40, (uint64_t)a2, (uint64_t)self, CFSTR("CKLogicalDeviceScopedStateManager.m"), 86, CFSTR("Asked to unregister unknown operation %@"), v43);

  }
  objc_msgSend_completedLongLivedOperationIDs(self, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend_containsObject_(v21, v22, (uint64_t)v43, v23);

  if (v24)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v25, v26, v27);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v41, v42, (uint64_t)a2, (uint64_t)self, CFSTR("CKLogicalDeviceScopedStateManager.m"), 87, CFSTR("Asked to re-register completed long-lived operation %@"), v43);

  }
  objc_msgSend_outstandingOperationIDs(self, v25, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObject_(v28, v29, (uint64_t)v43, v30);

  if (!a4)
  {
    objc_msgSend_completedLongLivedOperationIDs(self, v31, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v34, v35, (uint64_t)v43, v36);

  }
  objc_sync_exit(v10);

}

- (void)openFileWithOpenInfo:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, id);
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  int RawEncryptedData;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  id *v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, id))a4;
  objc_msgSend_UUID(v6, v8, v9, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend_trackedAssetForUUID_(self, v11, (uint64_t)v13, v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
      goto LABEL_12;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      || (RawEncryptedData = objc_msgSend_shouldReadRawEncryptedData(v15, v16, v17, v18),
          RawEncryptedData != objc_msgSend_shouldReadRawEncryptedData(v6, v20, v21, v22)))
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v16, (uint64_t)CFSTR("CKInternalErrorDomain"), 1017, 0);
      v23 = (id)objc_claimAutoreleasedReturnValue();
      if (v7)
        v7[2](v7, 0, v23);
      goto LABEL_25;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v31 = 0;
      v25 = (id *)&v31;
      objc_msgSend_openWithError_(v15, v14, (uint64_t)&v31, v24);
      v26 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
LABEL_12:
      v30 = 0;
      v25 = (id *)&v30;
      objc_msgSend_openWithOpenInfo_error_(CKAsset, v14, (uint64_t)v6, (uint64_t)&v30);
      v26 = objc_claimAutoreleasedReturnValue();
    }
    v27 = (void *)v26;
    v23 = *v25;
    if (!v27)
    {
      if (ck_log_initialization_predicate != -1)
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      v29 = ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        v33 = v6;
        v34 = 2112;
        v35 = v23;
        _os_log_debug_impl(&dword_18A5C5000, v29, OS_LOG_TYPE_DEBUG, "Failed to open %@: %@", buf, 0x16u);
        if (!v7)
          goto LABEL_24;
      }
      else if (!v7)
      {
        goto LABEL_24;
      }
      v7[2](v7, 0, v23);
      goto LABEL_24;
    }
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v28 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v33 = v6;
      _os_log_debug_impl(&dword_18A5C5000, v28, OS_LOG_TYPE_DEBUG, "Opened %@", buf, 0xCu);
      if (!v7)
        goto LABEL_24;
    }
    else if (!v7)
    {
LABEL_24:

LABEL_25:
      goto LABEL_26;
    }
    ((void (**)(id, void *, id))v7)[2](v7, v27, 0);
    goto LABEL_24;
  }
  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v11, (uint64_t)CFSTR("CKInternalErrorDomain"), 1017, 0);
  v23 = (id)objc_claimAutoreleasedReturnValue();
  if (v7)
    v7[2](v7, 0, v23);
LABEL_26:

}

- (void)readBytesOfInMemoryAssetContentWithUUID:(id)a3 offset:(unint64_t)a4 length:(unint64_t)a5 reply:(id)a6
{
  const char *v10;
  uint64_t v11;
  void (**v12)(id, void *, _QWORD);
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
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
  unint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  void *v44;
  char *v45;

  v45 = (char *)a3;
  v12 = (void (**)(id, void *, _QWORD))a6;
  if (v45)
  {
    objc_msgSend_trackedAssetForUUID_(self, v10, (uint64_t)v45, v11);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = v13;
        if (objc_msgSend_shouldReadAssetContentUsingClientProxy(v13, v14, v15, v16)
          && (objc_msgSend_assetContent(v13, v17, v18, v19),
              v20 = (void *)objc_claimAutoreleasedReturnValue(),
              v20,
              v20))
        {
          objc_msgSend_assetContent(v13, v21, v22, v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend_length(v24, v25, v26, v27);

          if (v28 >= a4)
          {
            objc_msgSend_assetContent(v13, v29, v30, v31);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = objc_msgSend_length(v34, v35, v36, v37) - a4;

            if (v38 < a5)
              a5 = v38;
            objc_msgSend_assetContent(v13, v39, v40, v41);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_subdataWithRange_(v42, v43, a4, a5);
            v33 = (void *)objc_claimAutoreleasedReturnValue();

            if (v33)
            {
              if (v12)
                v12[2](v12, v33, 0);
            }
            else
            {
              objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v45, (uint64_t)CFSTR("CKInternalErrorDomain"), 1017, CFSTR("Failed to read data for asset with UUID: %@"), v45);
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              if (v12)
                ((void (**)(id, void *, void *))v12)[2](v12, 0, v44);

              v33 = 0;
            }
            goto LABEL_16;
          }
          objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v45, (uint64_t)CFSTR("CKInternalErrorDomain"), 1017, CFSTR("Requested offset is greater than content length for asset with UUID: %@"), v45);
        }
        else
        {
          objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v45, (uint64_t)CFSTR("CKInternalErrorDomain"), 1017, CFSTR("Asset is not initialized for in-memory upload for UUID: %@"), v45);
        }
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          ((void (**)(id, void *, void *))v12)[2](v12, 0, v33);
LABEL_16:

        goto LABEL_17;
      }
    }
    objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v45, (uint64_t)CFSTR("CKInternalErrorDomain"), 1017, CFSTR("Could not find tracked asset with UUID: %@"), v45);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      ((void (**)(id, void *, void *))v12)[2](v12, 0, v32);

  }
  else
  {
    objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v10, (uint64_t)CFSTR("CKInternalErrorDomain"), 1017, CFSTR("nil UUID"));
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if (v12)
      ((void (**)(id, void *, id))v12)[2](v12, 0, v13);
  }
LABEL_17:

}

- (void)resetThrottles
{
  uint64_t v2;
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  objc_msgSend_deviceContext(self, a2, v2, v3);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_throttleManager(v11, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_resetThrottles(v7, v8, v9, v10);

}

- (void)addThrottle:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  id v14;

  v4 = a3;
  objc_msgSend_deviceContext(self, v5, v6, v7);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_throttleManager(v14, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addThrottle_(v11, v12, (uint64_t)v4, v13);

}

- (NSMapTable)assetsByUUID
{
  return self->_assetsByUUID;
}

- (CKLogicalDeviceContext)deviceContext
{
  return (CKLogicalDeviceContext *)objc_loadWeakRetained((id *)&self->_deviceContext);
}

- (NSMutableSet)completedLongLivedOperationIDs
{
  return self->_completedLongLivedOperationIDs;
}

- (NSMutableSet)outstandingOperationIDs
{
  return self->_outstandingOperationIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outstandingOperationIDs, 0);
  objc_storeStrong((id *)&self->_completedLongLivedOperationIDs, 0);
  objc_destroyWeak((id *)&self->_deviceContext);
  objc_storeStrong((id *)&self->_assetsByUUID, 0);
}

@end
