@implementation CKDFetchUserRecordURLRequest

- (void)fillOutEquivalencyPropertiesBuilder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKDFetchUserRecordURLRequest;
  -[CKDURLRequest fillOutEquivalencyPropertiesBuilder:](&v3, sel_fillOutEquivalencyPropertiesBuilder_, a3);
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

- (id)generateRequestOperations
{
  uint64_t v2;
  uint64_t v4;
  const char *v5;
  void *v6;
  void *v7;
  const char *v8;
  const char *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend_operationType(self, a2, v2);
  objc_msgSend_operationRequestWithType_(self, v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_opt_new();
  objc_msgSend_setUserRetrieveRequest_(v6, v8, (uint64_t)v7);

  v12[0] = v6;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v9, (uint64_t)v12, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)requestDidParseProtobufObject:(id)a3
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
  CKRecord *v17;
  id v18;
  CKRecord *userRecord;
  const char *v20;
  uint64_t v21;
  NSObject *v22;
  CKRecord *v23;
  void *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  const char *v33;
  CKRecord *v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  void (**v38)(_QWORD, _QWORD, _QWORD, _QWORD);
  CKRecord *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  NSObject *v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  id v51;
  uint8_t buf[4];
  id v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend_hasUserRetrieveResponse(v4, v5, v6)
    && (objc_msgSend_userRetrieveResponse(v4, v7, v8),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend_user(v9, v10, v11),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v9,
        v12))
  {
    objc_msgSend_translator(self, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = 0;
    objc_msgSend_recordFromPRecord_error_(v15, v16, (uint64_t)v12, &v51);
    v17 = (CKRecord *)objc_claimAutoreleasedReturnValue();
    v18 = v51;
    userRecord = self->_userRecord;
    self->_userRecord = v17;

    if (!self->_userRecord)
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v22 = *MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v53 = v18;
        _os_log_error_impl(&dword_1BE990000, v22, OS_LOG_TYPE_ERROR, "Invalid user record response from server: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    v23 = self->_userRecord;
    self->_userRecord = 0;

    v12 = 0;
    v18 = 0;
  }
  if (self->_userRecord)
  {
    objc_msgSend_fakeResponseOperationResultByItemID(self, v20, v21);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend_fakeResponseOperationResultByItemID(self, v20, v21);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_allValues(v25, v26, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_firstObject(v28, v29, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      if (v31)
      {
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v32 = (void *)*MEMORY[0x1E0C952E0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952E0], OS_LOG_TYPE_ERROR))
        {
          v47 = v32;
          objc_msgSend_requestUUID(self, v48, v49);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v53 = v50;
          _os_log_error_impl(&dword_1BE990000, v47, OS_LOG_TYPE_ERROR, "req: %{public}@, \"Inlining fake response operation result\", buf, 0xCu);

        }
        objc_msgSend_setResult_(v4, v33, (uint64_t)v31);
        v34 = self->_userRecord;
        self->_userRecord = 0;

      }
    }
  }
  objc_msgSend_recordFetchedBlock(self, v20, v21);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v35)
  {
    objc_msgSend_recordFetchedBlock(self, v36, v37);
    v38 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v39 = self->_userRecord;
    objc_msgSend_recordID(v39, v40, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_result(v4, v43, v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, CKRecord *, void *, void *))v38)[2](v38, v39, v42, v45);

  }
  return v18;
}

- (id)recordFetchedBlock
{
  return self->_recordFetchedBlock;
}

- (void)setRecordFetchedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 384);
}

- (CKRecord)userRecord
{
  return self->_userRecord;
}

- (void)setUserRecord:(id)a3
{
  objc_storeStrong((id *)&self->_userRecord, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userRecord, 0);
  objc_storeStrong(&self->_recordFetchedBlock, 0);
}

@end
