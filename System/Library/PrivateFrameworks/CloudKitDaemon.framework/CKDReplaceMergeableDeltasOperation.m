@implementation CKDReplaceMergeableDeltasOperation

- (CKDReplaceMergeableDeltasOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  CKDReplaceMergeableDeltasOperation *v9;
  uint64_t v10;
  NSArray *replaceDeltasRequests;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CKDReplaceMergeableDeltasOperation;
  v9 = -[CKDDatabaseOperation initWithOperationInfo:container:](&v13, sel_initWithOperationInfo_container_, v6, a4);
  if (v9)
  {
    objc_msgSend_replaceDeltasRequests(v6, v7, v8);
    v10 = objc_claimAutoreleasedReturnValue();
    replaceDeltasRequests = v9->_replaceDeltasRequests;
    v9->_replaceDeltasRequests = (NSArray *)v10;

  }
  return v9;
}

- (int)operationType
{
  return 313;
}

- (id)activityCreate
{
  return _os_activity_create(&dword_1BE990000, "daemon/replace-mergeable-deltas", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
}

- (BOOL)makeStateTransition
{
  uint64_t v2;
  uint64_t v4;
  const char *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;

  v4 = objc_msgSend_state(self, a2, v2);
  switch(v4)
  {
    case 3:
      objc_msgSend_setState_(self, v5, 0xFFFFFFFFLL);
      objc_msgSend_error(self, v8, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_finishWithError_(self, v11, (uint64_t)v10);

      break;
    case 2:
      objc_msgSend_setState_(self, v5, 3);
      objc_msgSend__replaceMergeableDeltas(self, v12, v13);
      break;
    case 1:
      objc_msgSend_setState_(self, v5, 2);
      objc_msgSend__encryptMergeableDeltas(self, v6, v7);
      break;
  }
  return 1;
}

+ (id)nameForState:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  __CFString *v5;
  objc_super v7;
  uint64_t v8;
  uint64_t v9;

  if (a3 == 3)
    return CFSTR("Replace Deltas");
  if (a3 == 2)
  {
    v5 = CFSTR("Encrypt Deltas");
  }
  else
  {
    v8 = v3;
    v9 = v4;
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___CKDReplaceMergeableDeltasOperation;
    objc_msgSendSuper2(&v7, sel_nameForState_);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (void)main
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  _BOOL8 v7;
  const char *v8;

  objc_msgSend_replaceDeltasRequests(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_count(v4, v5, v6) == 0;

  objc_msgSend_makeStateTransition_(self, v8, v7);
}

- (void)_encryptMergeableDeltas
{
  uint64_t v2;
  void *v4;
  const char *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  _QWORD v11[4];
  id v12;
  id location;

  objc_msgSend_replaceDeltasRequests(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKFlatMap_(v4, v5, (uint64_t)&unk_1E7838580);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  objc_msgSend_stateTransitionGroup(self, v7, v8);
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(v9);

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_1BEC547F4;
  v11[3] = &unk_1E78309E8;
  objc_copyWeak(&v12, &location);
  objc_msgSend__encryptMergeableDeltas_completionHandler_(self, v10, (uint64_t)v6, v11);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

- (void)_replaceMergeableDeltas
{
  uint64_t v2;
  NSObject *v4;
  void *v5;
  CKDReplaceMergeableDeltasURLRequest *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  void *v11;
  uint64_t v12;
  const char *v13;
  const char *v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  NSObject *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t);
  void *v27;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id from;
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  objc_msgSend_stateTransitionGroup(self, a2, v2);
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(v4);

  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v5 = (void *)*MEMORY[0x1E0C952C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952C0], OS_LOG_TYPE_DEBUG))
  {
    v20 = v5;
    objc_msgSend_replaceDeltasRequests(self, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(location[0]) = 138412290;
    *(id *)((char *)location + 4) = v23;
    _os_log_debug_impl(&dword_1BE990000, v20, OS_LOG_TYPE_DEBUG, "Will replace deltas with requests: %@", (uint8_t *)location, 0xCu);

  }
  v6 = [CKDReplaceMergeableDeltasURLRequest alloc];
  objc_msgSend_replaceDeltasRequests(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend_initWithOperation_replaceDeltasRequests_ignoreMissingDeltas_(v6, v10, (uint64_t)self, v9, 0);

  objc_initWeak(location, self);
  objc_initWeak(&from, v11);
  v12 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = sub_1BEC54B0C;
  v30[3] = &unk_1E7831FF8;
  objc_copyWeak(&v31, location);
  objc_msgSend_setPerReplacementCompletionBlock_(v11, v13, (uint64_t)v30);
  v24 = v12;
  v25 = 3221225472;
  v26 = sub_1BEC54BF0;
  v27 = &unk_1E782E468;
  objc_copyWeak(&v28, location);
  objc_copyWeak(&v29, &from);
  objc_msgSend_setCompletionBlock_(v11, v14, (uint64_t)&v24);
  objc_msgSend_setRequest_(self, v15, (uint64_t)v11, v24, v25, v26, v27);
  objc_msgSend_container(self, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_performRequest_(v18, v19, (uint64_t)v11);

  objc_destroyWeak(&v29);
  objc_destroyWeak(&v28);
  objc_destroyWeak(&v31);
  objc_destroyWeak(&from);
  objc_destroyWeak(location);

}

- (void)handleReplaceDeltasRequest:(id)a3 result:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  void (**v16)(_QWORD, _QWORD, _QWORD);
  void *v17;
  NSObject *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  void *v35;
  NSObject *v36;
  const char *v37;
  uint64_t v38;
  void (**v39)(_QWORD, _QWORD, _QWORD);
  uint8_t buf[4];
  id v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend_perReplacementCompletionBlock(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    if (objc_msgSend_code(v7, v11, v12) == 1)
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v13 = *MEMORY[0x1E0C952C0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952C0], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v41 = v6;
        _os_log_debug_impl(&dword_1BE990000, v13, OS_LOG_TYPE_DEBUG, "Successfully replaced deltas with request %@", buf, 0xCu);
      }
      objc_msgSend_perReplacementCompletionBlock(self, v14, v15);
      v16 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id, _QWORD))v16)[2](v16, v6, 0);

      goto LABEL_18;
    }
    v22 = sub_1BEB10D5C(v7);
    objc_msgSend_request(self, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1BEB10290(v25, v7);
    v18 = objc_claimAutoreleasedReturnValue();

    v26 = (void *)MEMORY[0x1E0C94FF8];
    v27 = *MEMORY[0x1E0C94B20];
    objc_msgSend_error(v7, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorDescription(v30, v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_format_(v26, v34, v27, v22, v18, CFSTR("Error performing replace deltas request: %@"), v33);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v36 = *MEMORY[0x1E0C952C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952C0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v41 = v6;
      v42 = 2112;
      v43 = v35;
      _os_log_error_impl(&dword_1BE990000, v36, OS_LOG_TYPE_ERROR, "Failed to replace deltas for request %@: %@", buf, 0x16u);
    }
    objc_msgSend_perReplacementCompletionBlock(self, v37, v38);
    v39 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, void *))v39)[2](v39, v6, v35);

LABEL_17:
    goto LABEL_18;
  }
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v17 = (void *)*MEMORY[0x1E0C952C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952C0], OS_LOG_TYPE_INFO))
  {
    v18 = v17;
    objc_msgSend_operationID(self, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v41 = v21;
    _os_log_impl(&dword_1BE990000, v18, OS_LOG_TYPE_INFO, "No per-request completion block for operation %@", buf, 0xCu);

    goto LABEL_17;
  }
LABEL_18:

}

- (id)perReplacementCompletionBlock
{
  return self->_perReplacementCompletionBlock;
}

- (void)setPerReplacementCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 456);
}

- (NSArray)replaceDeltasRequests
{
  return self->_replaceDeltasRequests;
}

- (void)setReplaceDeltasRequests:(id)a3
{
  objc_storeStrong((id *)&self->_replaceDeltasRequests, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replaceDeltasRequests, 0);
  objc_storeStrong(&self->_perReplacementCompletionBlock, 0);
}

@end
