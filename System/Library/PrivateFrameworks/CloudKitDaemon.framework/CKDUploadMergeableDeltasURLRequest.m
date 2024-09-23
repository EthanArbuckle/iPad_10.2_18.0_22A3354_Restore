@implementation CKDUploadMergeableDeltasURLRequest

- (CKDUploadMergeableDeltasURLRequest)initWithOperation:(id)a3 deltas:(id)a4 replacementRequests:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  CKDUploadMergeableDeltasURLRequest *v12;
  uint64_t v13;
  NSArray *deltas;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  NSMutableDictionary *deltasByRequestID;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  NSMutableDictionary *replacementRequestsByRequestID;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  NSArray *replacementRequests;
  objc_super v28;

  v8 = a4;
  v9 = a5;
  v28.receiver = self;
  v28.super_class = (Class)CKDUploadMergeableDeltasURLRequest;
  v12 = -[CKDURLRequest initWithOperation:](&v28, sel_initWithOperation_, a3);
  if (v12)
  {
    v13 = objc_msgSend_copy(v8, v10, v11);
    deltas = v12->_deltas;
    v12->_deltas = (NSArray *)v13;

    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v15, v16);
    v17 = objc_claimAutoreleasedReturnValue();
    deltasByRequestID = v12->_deltasByRequestID;
    v12->_deltasByRequestID = (NSMutableDictionary *)v17;

    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v19, v20);
    v21 = objc_claimAutoreleasedReturnValue();
    replacementRequestsByRequestID = v12->_replacementRequestsByRequestID;
    v12->_replacementRequestsByRequestID = (NSMutableDictionary *)v21;

    v25 = objc_msgSend_copy(v9, v23, v24);
    replacementRequests = v12->_replacementRequests;
    v12->_replacementRequests = (NSArray *)v25;

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
  v15.super_class = (Class)CKDUploadMergeableDeltasURLRequest;
  v4 = a3;
  -[CKDURLRequest fillOutEquivalencyPropertiesBuilder:](&v15, sel_fillOutEquivalencyPropertiesBuilder_, v4);
  v5 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend_replacementRequests(self, v6, v7, v15.receiver, v15.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ckEquivalencyProperties(v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v5, v12, (uint64_t)v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setObject_forKeyedSubscript_(v4, v14, (uint64_t)v13, CFSTR("requests"));
}

- (void)fillOutRequestProperties:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  objc_super v11;

  v4 = a3;
  objc_msgSend_replacementRequests(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKCompactMap_(v7, v8, (uint64_t)&unk_1E782EA80);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setModifyMergeableValueIDs_(v4, v10, (uint64_t)v9);
  v11.receiver = self;
  v11.super_class = (Class)CKDUploadMergeableDeltasURLRequest;
  -[CKDURLRequest fillOutRequestProperties:](&v11, sel_fillOutRequestProperties_, v4);

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
  objc_msgSend_deltas(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKCompactMap_(v6, v7, (uint64_t)&unk_1E782EAC0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObjectsFromArray_(v3, v9, (uint64_t)v8);

  objc_msgSend_allObjects(v3, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)requestOperationClasses
{
  const char *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v15[0] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v3, (uint64_t)v15, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_replacementRequests(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_count(v7, v8, v9);

  if (v10)
  {
    v11 = objc_opt_class();
    objc_msgSend_arrayByAddingObject_(v4, v12, v11);
    v13 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v13;
  }
  return v4;
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
  const char *v7;
  uint64_t v8;
  id v9;
  const char *v10;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  void *v14;
  void *v15;
  id *v16;
  const char *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  NSObject *v21;
  const char *v22;
  unint64_t i;
  const char *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v42;
  uint64_t v43;
  id obj;
  _QWORD v45[6];
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  uint8_t buf[4];
  uint64_t v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v46 = 0;
  v47 = &v46;
  v48 = 0x3032000000;
  v49 = sub_1BE9BAF08;
  v50 = sub_1BE9BAD38;
  v51 = 0;
  objc_msgSend_deltas(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = sub_1BEA10954;
  v45[3] = &unk_1E782EAE8;
  v45[4] = self;
  v45[5] = &v46;
  objc_msgSend_CKCompactMap_(v4, v5, (uint64_t)v45);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend_mutableCopy(v6, v7, v8);

  if (v47[5])
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v12 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_FAULT))
    {
      v42 = v47[5];
      *(_DWORD *)buf = 138412290;
      v53 = v42;
      _os_log_fault_impl(&dword_1BE990000, v12, OS_LOG_TYPE_FAULT, "Failed to generate requestOperations for MergeableDeltaSaveRequest: %@", buf, 0xCu);
    }
    objc_msgSend_finishWithError_(self, v13, v47[5]);
    v14 = 0;
  }
  else
  {
    objc_msgSend_replacementRequests(self, v10, v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (id *)(v47 + 5);
    obj = (id)v47[5];
    objc_msgSend_requestOperationsForRequest_replaceDeltasRequests_ignoreMissingDeltas_error_(CKDReplaceMergeableDeltasURLRequest, v17, (uint64_t)self, v15, 1, &obj);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v16, obj);

    if (v18 && !v47[5])
    {
      for (i = 0; i < objc_msgSend_count(v18, v19, v20); ++i)
      {
        objc_msgSend_objectAtIndexedSubscript_(v18, v24, i);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_replacementRequests(self, v26, v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v28, v29, i);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_replacementRequestsByRequestID(self, v31, v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_request(v25, v34, v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_operationUUID(v36, v37, v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v33, v40, (uint64_t)v30, v39);

      }
      objc_msgSend_addObjectsFromArray_(v9, v24, (uint64_t)v18);
    }
    else
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v21 = *MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_FAULT))
      {
        v43 = v47[5];
        *(_DWORD *)buf = 138412290;
        v53 = v43;
        _os_log_fault_impl(&dword_1BE990000, v21, OS_LOG_TYPE_FAULT, "Failed to create mergeable delta proto for replacement request: %@", buf, 0xCu);
      }

      objc_msgSend_finishWithError_(self, v22, v47[5]);
      v9 = 0;
    }
    v9 = v9;

    v14 = v9;
  }

  _Block_object_dispose(&v46, 8);
  return v14;
}

- (id)requestDidParseProtobufObject:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
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
  uint64_t v26;
  const char *v27;
  uint64_t v28;
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
  void *v39;
  const char *v40;
  uint64_t v41;
  void (**v42)(_QWORD, _QWORD, _QWORD);
  void *v43;
  void *v45;
  const char *v46;
  void *v47;
  const char *v48;

  v5 = a3;
  if (objc_msgSend_hasMergeableDeltaSaveResponse(v5, v6, v7))
  {
    objc_msgSend_deltasByRequestID(self, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_response(v5, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_operationUUID(v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v10, v17, (uint64_t)v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
    {
      objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v19, v20);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v45, v46, (uint64_t)a2, self, CFSTR("CKDUploadMergeableDeltasURLRequest.m"), 164, CFSTR("Expected non-nil delta for response %@"), v5);

    }
    objc_msgSend_perDeltaCompletionBlock(self, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v21)
      goto LABEL_12;
    objc_msgSend_perDeltaCompletionBlock(self, v22, v23);
    v24 = objc_claimAutoreleasedReturnValue();
LABEL_11:
    v42 = (void (**)(_QWORD, _QWORD, _QWORD))v24;
    objc_msgSend_result(v5, v25, v26);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void *))v42)[2](v42, v18, v43);

LABEL_12:
    goto LABEL_13;
  }
  if (objc_msgSend_hasMergeableDeltaReplaceResponse(v5, v8, v9))
  {
    objc_msgSend_replacementRequestsByRequestID(self, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_response(v5, v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_operationUUID(v32, v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v29, v36, (uint64_t)v35);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
    {
      objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v37, v38);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v47, v48, (uint64_t)a2, self, CFSTR("CKDUploadMergeableDeltasURLRequest.m"), 170, CFSTR("Expected non-nil replacement request for response %@"), v5);

    }
    objc_msgSend_perReplaceDeltasRequestCompletionBlock(self, v37, v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v39)
      goto LABEL_12;
    objc_msgSend_perReplaceDeltasRequestCompletionBlock(self, v40, v41);
    v24 = objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
LABEL_13:

  return 0;
}

- (void)requestDidParseNodeFailure:(id)a3
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
  uint64_t v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  void (**v20)(_QWORD, _QWORD, _QWORD);
  const char *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  void (**v38)(_QWORD, _QWORD, _QWORD);
  const char *v39;
  uint64_t v40;
  void *v41;
  NSObject *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  int v46;
  void *v47;
  __int16 v48;
  id v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v5 = (void *)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
  {
    v42 = v5;
    objc_msgSend_requestUUID(self, v43, v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = 138412546;
    v47 = v45;
    v48 = 2112;
    v49 = v4;
    _os_log_error_impl(&dword_1BE990000, v42, OS_LOG_TYPE_ERROR, "Node failure in upload deltas request %@: %@", (uint8_t *)&v46, 0x16u);

  }
  objc_msgSend_deltasByRequestID(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_response(v4, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_operationUUID(v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v8, v15, (uint64_t)v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend_perDeltaCompletionBlock(self, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend_perDeltaCompletionBlock(self, v17, v18);
      v20 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend_result(v4, v21, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, void *))v20)[2](v20, v16, v23);

    }
  }
  objc_msgSend_replacementRequestsByRequestID(self, v17, v18);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_response(v4, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_operationUUID(v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v24, v31, (uint64_t)v30);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    objc_msgSend_perReplaceDeltasRequestCompletionBlock(self, v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (v35)
    {
      objc_msgSend_perReplaceDeltasRequestCompletionBlock(self, v36, v37);
      v38 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend_result(v4, v39, v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, void *))v38)[2](v38, v32, v41);

    }
  }

}

- (NSArray)deltas
{
  return self->_deltas;
}

- (NSArray)replacementRequests
{
  return self->_replacementRequests;
}

- (id)perDeltaCompletionBlock
{
  return self->_perDeltaCompletionBlock;
}

- (void)setPerDeltaCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 400);
}

- (id)perReplaceDeltasRequestCompletionBlock
{
  return self->_perReplaceDeltasRequestCompletionBlock;
}

- (void)setPerReplaceDeltasRequestCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 408);
}

- (NSMutableDictionary)deltasByRequestID
{
  return self->_deltasByRequestID;
}

- (void)setDeltasByRequestID:(id)a3
{
  objc_storeStrong((id *)&self->_deltasByRequestID, a3);
}

- (NSMutableDictionary)replacementRequestsByRequestID
{
  return self->_replacementRequestsByRequestID;
}

- (void)setReplacementRequestsByRequestID:(id)a3
{
  objc_storeStrong((id *)&self->_replacementRequestsByRequestID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replacementRequestsByRequestID, 0);
  objc_storeStrong((id *)&self->_deltasByRequestID, 0);
  objc_storeStrong(&self->_perReplaceDeltasRequestCompletionBlock, 0);
  objc_storeStrong(&self->_perDeltaCompletionBlock, 0);
  objc_storeStrong((id *)&self->_replacementRequests, 0);
  objc_storeStrong((id *)&self->_deltas, 0);
}

@end
