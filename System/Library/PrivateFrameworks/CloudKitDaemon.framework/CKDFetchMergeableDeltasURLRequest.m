@implementation CKDFetchMergeableDeltasURLRequest

- (CKDFetchMergeableDeltasURLRequest)initWithOperation:(id)a3 mergeableValueIDs:(id)a4 previousContinuationTokens:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  CKDFetchMergeableDeltasURLRequest *v12;
  uint64_t v13;
  NSArray *mergeableValueIDs;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  NSMutableDictionary *mergeableValueIDsByRequestID;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  NSDictionary *previousContinuationTokens;
  objc_super v24;

  v8 = a4;
  v9 = a5;
  v24.receiver = self;
  v24.super_class = (Class)CKDFetchMergeableDeltasURLRequest;
  v12 = -[CKDURLRequest initWithOperation:](&v24, sel_initWithOperation_, a3);
  if (v12)
  {
    v13 = objc_msgSend_copy(v8, v10, v11);
    mergeableValueIDs = v12->_mergeableValueIDs;
    v12->_mergeableValueIDs = (NSArray *)v13;

    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v15, v16);
    v17 = objc_claimAutoreleasedReturnValue();
    mergeableValueIDsByRequestID = v12->_mergeableValueIDsByRequestID;
    v12->_mergeableValueIDsByRequestID = (NSMutableDictionary *)v17;

    v21 = objc_msgSend_copy(v9, v19, v20);
    previousContinuationTokens = v12->_previousContinuationTokens;
    v12->_previousContinuationTokens = (NSDictionary *)v21;

  }
  return v12;
}

- (void)fillOutEquivalencyPropertiesBuilder:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CKDFetchMergeableDeltasURLRequest;
  v4 = a3;
  -[CKDURLRequest fillOutEquivalencyPropertiesBuilder:](&v15, sel_fillOutEquivalencyPropertiesBuilder_, v4);
  v5 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend_mergeableValueIDs(self, v6, v7, v15.receiver, v15.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ckEquivalencyProperties(v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v5, v12, (uint64_t)v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setObject_forKeyedSubscript_(v4, v14, (uint64_t)v13, CFSTR("mvIDs"));
}

- (void)fillOutRequestProperties:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  objc_super v9;

  v4 = a3;
  objc_msgSend_mergeableValueIDs(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFetchMergeableValueIDs_(v4, v8, (uint64_t)v7);

  v9.receiver = self;
  v9.super_class = (Class)CKDFetchMergeableDeltasURLRequest;
  -[CKDURLRequest fillOutRequestProperties:](&v9, sel_fillOutRequestProperties_, v4);

}

- (BOOL)allowsAnonymousAccount
{
  uint64_t v2;

  return objc_msgSend_databaseScope(self, a2, v2) == 1;
}

- (id)zoneIDsToLock
{
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  void *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  void *v12;

  v3 = (void *)objc_opt_new();
  objc_msgSend_mergeableValueIDs(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKCompactMap_(v6, v7, (uint64_t)&unk_1E7838120);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObjectsFromArray_(v3, v9, (uint64_t)v8);

  objc_msgSend_allObjects(v3, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)requestOperationClasses
{
  const char *v2;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v4[0] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v2, (uint64_t)v4, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)handlesAnonymousCKUserIDPropagation
{
  return 1;
}

- (id)anonymousUserIDForHTTPHeader
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;

  objc_msgSend_zoneIDsToLock(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_firstObject(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_anonymousCKUserID(v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)generateRequestOperations
{
  uint64_t v2;
  void *v4;
  const char *v5;
  void *v6;
  _QWORD v8[5];

  objc_msgSend_mergeableValueIDs(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1BEC2ED78;
  v8[3] = &unk_1E7838148;
  v8[4] = self;
  objc_msgSend_CKCompactMap_(v4, v5, (uint64_t)v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)requestDidParseProtobufObject:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
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
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  CKDFetchMergeableDeltasURLRequest *v38;
  void *v39;
  void *v40;
  const char *v41;
  void *v42;
  id v43;
  const char *v44;
  NSObject *v45;
  NSObject *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  void (**v53)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  const char *v54;
  uint64_t v55;
  void *v56;
  id v57;
  void *v59;
  const char *v60;
  void *v61;
  uint64_t v62;
  id v63;
  uint64_t v64;
  id obj;
  id v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  uint8_t buf[4];
  void *v72;
  __int16 v73;
  id v74;
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend_mergeableValueIDsByRequestID(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_response(v5, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_operationUUID(v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v8, v15, (uint64_t)v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v17, v18);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v59, v60, (uint64_t)a2, self, CFSTR("CKDFetchMergeableDeltasURLRequest.m"), 119, CFSTR("Expected non-nil mergeable ID for response %@"), v5);

  }
  v19 = (void *)objc_opt_new();
  if ((objc_msgSend_hasMergeableDeltaRetrieveResponse(v5, v20, v21) & 1) != 0)
  {
    v63 = v5;
    objc_msgSend_mergeableDeltaRetrieveResponse(v5, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_continuation(v24, v25, v26);
    v61 = v24;
    v62 = objc_claimAutoreleasedReturnValue();
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    v70 = 0u;
    objc_msgSend_deltas(v24, v27, v28);
    obj = (id)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v29, (uint64_t)&v67, v75, 16);
    if (v30)
    {
      v33 = v30;
      v34 = 0;
      v35 = *(_QWORD *)v68;
      v64 = *MEMORY[0x1E0C94B20];
      do
      {
        v36 = 0;
        do
        {
          if (*(_QWORD *)v68 != v35)
            objc_enumerationMutation(obj);
          v37 = *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * v36);
          v38 = self;
          objc_msgSend_translator(self, v31, v32);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v66 = v34;
          v40 = v16;
          objc_msgSend_mergeableDeltaFromPDelta_valueID_error_(v39, v41, v37, v16, &v66);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = v66;

          if (v42)
          {
            objc_msgSend_addObject_(v19, v44, (uint64_t)v42);
          }
          else
          {
            if (!v43)
            {
              objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v44, v64, 1000, CFSTR("Failed to load fetched delta"));
              v43 = (id)objc_claimAutoreleasedReturnValue();
            }
            if (*MEMORY[0x1E0C95300] != -1)
              dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
            v45 = *MEMORY[0x1E0C952B0];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v72 = v40;
              v73 = 2112;
              v74 = v43;
              _os_log_error_impl(&dword_1BE990000, v45, OS_LOG_TYPE_ERROR, "Failed to load fetched delta for mergeable %@: %@", buf, 0x16u);
            }
          }
          v34 = v43;

          ++v36;
          v16 = v40;
          self = v38;
        }
        while (v33 != v36);
        v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v31, (uint64_t)&v67, v75, 16);
      }
      while (v33);
    }
    else
    {
      v34 = 0;
    }

    v49 = (void *)v62;
    v5 = v63;
  }
  else
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v46 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1BE990000, v46, OS_LOG_TYPE_FAULT, "Expected MergeableDeltaRetrieveResponse for MergeableDeltaRetrieveRequest", buf, 2u);
    }
    v49 = 0;
    v34 = 0;
  }
  objc_msgSend_deltasFetchedBlock(self, v47, v48);
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  if (v50)
  {
    objc_msgSend_deltasFetchedBlock(self, v51, v52);
    v53 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend_result(v5, v54, v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void *, void *, void *))v53)[2](v53, v16, v19, v49, v56);

  }
  v57 = v34;

  return v57;
}

- (void)requestDidParseNodeFailure:(id)a3
{
  id v5;
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
  uint64_t v28;
  void (**v29)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  const char *v30;
  uint64_t v31;
  void *v32;
  NSObject *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  const char *v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v6 = (void *)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
  {
    v33 = v6;
    objc_msgSend_requestUUID(self, v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v40 = v36;
    v41 = 2112;
    v42 = v5;
    _os_log_error_impl(&dword_1BE990000, v33, OS_LOG_TYPE_ERROR, "Node failure in atom sync request %@: %@", buf, 0x16u);

  }
  objc_msgSend_response(v5, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_operationUUID(v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend_mergeableValueIDsByRequestID(self, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_response(v5, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_operationUUID(v18, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v15, v22, (uint64_t)v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v23)
    {
      objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v24, v25);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v37, v38, (uint64_t)a2, self, CFSTR("CKDFetchMergeableDeltasURLRequest.m"), 158, CFSTR("Expected non-nil mergeable ID for response %@"), v5);

    }
    objc_msgSend_deltasFetchedBlock(self, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      objc_msgSend_deltasFetchedBlock(self, v27, v28);
      v29 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend_result(v5, v30, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, _QWORD, _QWORD, void *))v29)[2](v29, v23, 0, 0, v32);

    }
  }
  else
  {
    v23 = 0;
  }

}

- (NSArray)mergeableValueIDs
{
  return self->_mergeableValueIDs;
}

- (void)setMergeableValueIDs:(id)a3
{
  objc_storeStrong((id *)&self->_mergeableValueIDs, a3);
}

- (NSDictionary)previousContinuationTokens
{
  return self->_previousContinuationTokens;
}

- (id)deltasFetchedBlock
{
  return self->_deltasFetchedBlock;
}

- (void)setDeltasFetchedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 400);
}

- (NSMutableDictionary)mergeableValueIDsByRequestID
{
  return self->_mergeableValueIDsByRequestID;
}

- (void)setMergeableValueIDsByRequestID:(id)a3
{
  objc_storeStrong((id *)&self->_mergeableValueIDsByRequestID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mergeableValueIDsByRequestID, 0);
  objc_storeStrong(&self->_deltasFetchedBlock, 0);
  objc_storeStrong((id *)&self->_previousContinuationTokens, 0);
  objc_storeStrong((id *)&self->_mergeableValueIDs, 0);
}

@end
