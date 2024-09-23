@implementation CKDFetchMergeableDeltasOperation

- (CKDFetchMergeableDeltasOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  CKDFetchMergeableDeltasOperation *v9;
  uint64_t v10;
  NSArray *mergeableValueIDs;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CKDFetchMergeableDeltasOperation;
  v9 = -[CKDDatabaseOperation initWithOperationInfo:container:](&v13, sel_initWithOperationInfo_container_, v6, a4);
  if (v9)
  {
    objc_msgSend_mergeableValueIDs(v6, v7, v8);
    v10 = objc_claimAutoreleasedReturnValue();
    mergeableValueIDs = v9->_mergeableValueIDs;
    v9->_mergeableValueIDs = (NSArray *)v10;

  }
  return v9;
}

- (int)operationType
{
  return 314;
}

- (id)activityCreate
{
  return _os_activity_create(&dword_1BE990000, "daemon/fetch-mergeable-deltas", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
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

  v4 = objc_msgSend_state(self, a2, v2);
  if (v4 == 2)
  {
    objc_msgSend_setState_(self, v5, 0xFFFFFFFFLL);
    objc_msgSend_error(self, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_finishWithError_(self, v11, (uint64_t)v10);

  }
  else if (v4 == 1)
  {
    objc_msgSend_setState_(self, v5, 2);
    objc_msgSend_fetchMergeableDeltas(self, v6, v7);
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

  if (a3 == 2)
  {
    v5 = CFSTR("Fetch Deltas");
  }
  else
  {
    v8 = v3;
    v9 = v4;
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___CKDFetchMergeableDeltasOperation;
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

  objc_msgSend_mergeableValueIDs(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_count(v4, v5, v6) == 0;

  objc_msgSend_makeStateTransition_(self, v8, v7);
}

- (void)fetchMergeableDeltas
{
  uint64_t v2;
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  _QWORD v9[4];
  id v10;
  id location;

  objc_msgSend_stateTransitionGroup(self, a2, v2);
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(v4);

  objc_initWeak(&location, self);
  objc_msgSend_mergeableValueIDs(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1BEAD68D8;
  v9[3] = &unk_1E78309E8;
  objc_copyWeak(&v10, &location);
  objc_msgSend_fetchMergeableDeltasRecursivelyForValueIDs_continuationTokens_completionHandler_(self, v8, (uint64_t)v7, 0, v9);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)fetchMergeableDeltasRecursivelyForValueIDs:(id)a3 continuationTokens:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  CKDFetchMergeableDeltasURLRequest *v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  id v19;
  const char *v20;
  id v21;
  id v22;
  const char *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  id v33;
  id from;
  _QWORD v35[4];
  id v36;
  id v37;
  _BYTE location[12];
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v11 = *MEMORY[0x1E0C952C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952C0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)location = 138412546;
    *(_QWORD *)&location[4] = v8;
    v39 = 2112;
    v40 = v9;
    _os_log_debug_impl(&dword_1BE990000, v11, OS_LOG_TYPE_DEBUG, "Will fetch deltas recursively for values %@ with continuation tokens %@", location, 0x16u);
  }
  v12 = [CKDFetchMergeableDeltasURLRequest alloc];
  v14 = (void *)objc_msgSend_initWithOperation_mergeableValueIDs_previousContinuationTokens_(v12, v13, (uint64_t)self, v8, v9);
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak((id *)location, self);
  v18 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = sub_1BEAD6E20;
  v35[3] = &unk_1E7830808;
  objc_copyWeak(&v37, (id *)location);
  v19 = v17;
  v36 = v19;
  objc_msgSend_setDeltasFetchedBlock_(v14, v20, (uint64_t)v35);
  objc_initWeak(&from, v14);
  v29[0] = v18;
  v29[1] = 3221225472;
  v29[2] = sub_1BEAD6F80;
  v29[3] = &unk_1E7832FD8;
  objc_copyWeak(&v32, (id *)location);
  objc_copyWeak(&v33, &from);
  v21 = v10;
  v31 = v21;
  v22 = v19;
  v30 = v22;
  objc_msgSend_setCompletionBlock_(v14, v23, (uint64_t)v29);
  objc_msgSend_setRequest_(self, v24, (uint64_t)v14);
  objc_msgSend_container(self, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_performRequest_(v27, v28, (uint64_t)v14);

  objc_destroyWeak(&v33);
  objc_destroyWeak(&v32);
  objc_destroyWeak(&from);

  objc_destroyWeak(&v37);
  objc_destroyWeak((id *)location);

}

- (void)handleMergeableDeltasFetchedForValueID:(id)a3 fetchedDeltas:(id)a4 result:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  NSObject *v32;
  NSObject *v33;
  const char *v34;
  int v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  NSObject *v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  NSObject *v55;
  id v56;
  id v57;
  uint64_t v58;
  void *v59;
  _QWORD block[5];
  id v61;
  id v62;
  uint64_t *v63;
  _QWORD v64[4];
  id v65;
  id v66;
  NSObject *v67;
  uint64_t *v68;
  id v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t (*v73)(uint64_t, uint64_t);
  void (*v74)(uint64_t);
  id v75;
  uint8_t buf[4];
  id v77;
  __int16 v78;
  uint64_t v79;
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend_stateTransitionGroup(self, v11, v12);
  v13 = objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(v13);

  v70 = 0;
  v71 = &v70;
  v72 = 0x3032000000;
  v73 = sub_1BE9BB028;
  v74 = sub_1BE9BADC8;
  v75 = 0;
  if (objc_msgSend_code(v10, v14, v15) == 1)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v16 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v77 = v8;
      _os_log_debug_impl(&dword_1BE990000, v16, OS_LOG_TYPE_DEBUG, "Successfully fetched delta for %@", buf, 0xCu);
    }
  }
  else
  {
    v17 = sub_1BEB10D5C(v10);
    objc_msgSend_request(self, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1BEB10290(v20, v10);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = (void *)MEMORY[0x1E0C94FF8];
    objc_msgSend_error(v10, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorDescription(v25, v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_format_(v22, v29, *MEMORY[0x1E0C94B20], v17, v21, CFSTR("Error fetching deltas for %@ from server: %@"), v8, v28);
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = (void *)v71[5];
    v71[5] = v30;

    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v32 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
    {
      v58 = v71[5];
      *(_DWORD *)buf = 138412546;
      v77 = v8;
      v78 = 2112;
      v79 = v58;
      _os_log_error_impl(&dword_1BE990000, v32, OS_LOG_TYPE_ERROR, "Failed to fetch deltas for %@: %@", buf, 0x16u);
    }

  }
  v33 = dispatch_group_create();
  v35 = objc_msgSend_CKContains_(v9, v34, (uint64_t)&unk_1E7833018);
  v38 = MEMORY[0x1E0C809B0];
  v39 = (_QWORD *)&unk_1BECBB000;
  if (v35)
  {
    objc_msgSend_recordID(v8, v36, v37);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    if (v59)
    {
      v40 = v38;
      dispatch_group_enter(v33);
      objc_initWeak((id *)buf, self);
      objc_msgSend_container(self, v41, v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_pcsCache(v43, v44, v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_recordID(v8, v47, v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v64[0] = v40;
      v64[1] = 3221225472;
      v64[2] = sub_1BEAD7870;
      v64[3] = &unk_1E7833040;
      objc_copyWeak(&v69, (id *)buf);
      v65 = v8;
      v68 = &v70;
      v66 = v9;
      v67 = v33;
      objc_msgSend_fetchPCSForRecordWithID_forOperation_options_withCompletionHandler_(v46, v50, (uint64_t)v49, self, 0, v64);

      objc_destroyWeak(&v69);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v51 = *MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v77 = v8;
        _os_log_error_impl(&dword_1BE990000, v51, OS_LOG_TYPE_ERROR, "Unable to determine record ID for value %@", buf, 0xCu);
      }
      objc_msgSend_errorWithDomain_code_userInfo_format_(MEMORY[0x1E0C94FF8], v52, *MEMORY[0x1E0C94B20], 1017, 0, CFSTR("Unable to determine record ID for mergeable delta for value ID: %@"), v8);
      v53 = objc_claimAutoreleasedReturnValue();
      v40 = v38;
      v54 = (void *)v71[5];
      v71[5] = v53;

    }
    v38 = v40;
    v39 = &unk_1BECBB000;
  }
  objc_msgSend_callbackQueue(self, v36, v37);
  v55 = objc_claimAutoreleasedReturnValue();
  block[0] = v38;
  block[1] = v39[128];
  block[2] = sub_1BEAD7BEC;
  block[3] = &unk_1E7833068;
  block[4] = self;
  v61 = v8;
  v62 = v9;
  v63 = &v70;
  v56 = v9;
  v57 = v8;
  dispatch_group_notify(v33, v55, block);

  _Block_object_dispose(&v70, 8);
}

- (id)deltasFetchedBlock
{
  return self->_deltasFetchedBlock;
}

- (void)setDeltasFetchedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 456);
}

- (NSArray)mergeableValueIDs
{
  return self->_mergeableValueIDs;
}

- (void)setMergeableValueIDs:(id)a3
{
  objc_storeStrong((id *)&self->_mergeableValueIDs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mergeableValueIDs, 0);
  objc_storeStrong(&self->_deltasFetchedBlock, 0);
}

@end
