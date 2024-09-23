@implementation CKDFetchMergeableDeltaMetadataOperation

- (CKDFetchMergeableDeltaMetadataOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  CKDFetchMergeableDeltaMetadataOperation *v9;
  uint64_t v10;
  NSArray *mergeableValueIDs;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CKDFetchMergeableDeltaMetadataOperation;
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
  return 312;
}

- (id)activityCreate
{
  return _os_activity_create(&dword_1BE990000, "daemon/fetch-mergeable-delta-metadata", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
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
    objc_msgSend_fetchMetadata(self, v6, v7);
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
    v5 = CFSTR("Fetch Metadata");
  }
  else
  {
    v8 = v3;
    v9 = v4;
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___CKDFetchMergeableDeltaMetadataOperation;
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

- (void)fetchMetadata
{
  uint64_t v2;
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  _QWORD v9[5];
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
  v9[2] = sub_1BEA445D0;
  v9[3] = &unk_1E78307E0;
  objc_copyWeak(&v10, &location);
  v9[4] = self;
  objc_msgSend_fetchMetadataRecursivelyForMergeableValueIDs_continuationTokens_completionHandler_(self, v8, (uint64_t)v7, 0, v9);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)fetchMetadataRecursivelyForMergeableValueIDs:(id)a3 continuationTokens:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  CKDFetchMergeableDeltaMetadataURLRequest *v12;
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
  _QWORD v34[4];
  id v35;
  id v36;
  id from;
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
    _os_log_debug_impl(&dword_1BE990000, v11, OS_LOG_TYPE_DEBUG, "Will fetch delta metadata recursively for value IDs %@ with continuation tokens %@", location, 0x16u);
  }
  v12 = [CKDFetchMergeableDeltaMetadataURLRequest alloc];
  v14 = (void *)objc_msgSend_initWithOperation_mergeableValueIDs_continuationTokens_(v12, v13, (uint64_t)self, v8, v9);
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak((id *)location, v14);
  objc_initWeak(&from, self);
  v18 = MEMORY[0x1E0C809B0];
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = sub_1BEA44B20;
  v34[3] = &unk_1E7830808;
  objc_copyWeak(&v36, &from);
  v19 = v17;
  v35 = v19;
  objc_msgSend_setMetadataFetchedBlock_(v14, v20, (uint64_t)v34);
  v29[0] = v18;
  v29[1] = 3221225472;
  v29[2] = sub_1BEA44CFC;
  v29[3] = &unk_1E7830830;
  objc_copyWeak(&v32, &from);
  v21 = v19;
  v30 = v21;
  v22 = v10;
  v31 = v22;
  objc_copyWeak(&v33, (id *)location);
  objc_msgSend_setCompletionBlock_(v14, v23, (uint64_t)v29);
  objc_msgSend_setRequest_(self, v24, (uint64_t)v14);
  objc_msgSend_container(self, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_performRequest_(v27, v28, (uint64_t)v14);

  objc_destroyWeak(&v33);
  objc_destroyWeak(&v32);

  objc_destroyWeak(&v36);
  objc_destroyWeak(&from);
  objc_destroyWeak((id *)location);

}

- (void)handleFetchedMetadatasForMergeableValueID:(id)a3 metadatas:(id)a4 result:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  NSObject *v20;
  id v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  NSObject *v31;
  NSObject *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  const char *v40;
  uint64_t v41;
  NSObject *v42;
  void *v43;
  NSObject *v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  void *v61;
  NSObject *v62;
  const char *v63;
  uint64_t v64;
  void (**v65)(_QWORD, _QWORD, _QWORD, _QWORD);
  NSObject *v66;
  const char *v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  void (**v71)(_QWORD, _QWORD, _QWORD, _QWORD);
  NSObject *v72;
  const char *v73;
  uint64_t v74;
  void *v75;
  id v76;
  void *v77;
  CKDFetchMergeableDeltaMetadataOperation *val;
  _QWORD block[5];
  id v80;
  id v81;
  _BYTE *v82;
  _QWORD v83[4];
  id v84;
  void *v85;
  NSObject *v86;
  _BYTE *v87;
  id v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  id location;
  uint8_t buf[4];
  void *v95;
  uint8_t v96[128];
  _BYTE v97[24];
  uint64_t (*v98)(uint64_t, uint64_t);
  void (*v99)(uint64_t);
  id v100;
  uint64_t v101;

  v101 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v76 = a5;
  val = self;
  objc_msgSend_metadataFetchedBlock(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    if (objc_msgSend_code(v76, v13, v14) == 1)
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v15 = (void *)*MEMORY[0x1E0C952C0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952C0], OS_LOG_TYPE_DEBUG))
      {
        v72 = v15;
        *(_DWORD *)v97 = 134218242;
        *(_QWORD *)&v97[4] = objc_msgSend_count(v9, v73, v74);
        *(_WORD *)&v97[12] = 2112;
        *(_QWORD *)&v97[14] = v8;
        _os_log_debug_impl(&dword_1BE990000, v72, OS_LOG_TYPE_DEBUG, "Successfully fetched %ld delta metadatas for value %@", v97, 0x16u);

      }
      objc_msgSend_recordID(v8, v16, v17);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_key(v8, v18, v19);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      if (v77 && v75)
      {
        *(_QWORD *)v97 = 0;
        *(_QWORD *)&v97[8] = v97;
        *(_QWORD *)&v97[16] = 0x3032000000;
        v98 = sub_1BE9BAF68;
        v99 = sub_1BE9BAD68;
        v100 = 0;
        v20 = dispatch_group_create();
        objc_initWeak(&location, self);
        v91 = 0u;
        v92 = 0u;
        v89 = 0u;
        v90 = 0u;
        v21 = v9;
        v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v89, v96, 16);
        if (v25)
        {
          v26 = *(_QWORD *)v90;
          do
          {
            v27 = 0;
            do
            {
              if (*(_QWORD *)v90 != v26)
                objc_enumerationMutation(v21);
              v28 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * v27);
              if (objc_msgSend_isEncrypted(v8, v23, v24)
                && objc_msgSend_needsDecryption(v28, v23, v24))
              {
                dispatch_group_enter(v20);
                objc_msgSend_stateTransitionGroup(val, v29, v30);
                v31 = objc_claimAutoreleasedReturnValue();
                dispatch_group_enter(v31);

                if (*MEMORY[0x1E0C95300] != -1)
                  dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
                v32 = *MEMORY[0x1E0C952C0];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952C0], OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v95 = v28;
                  _os_log_debug_impl(&dword_1BE990000, v32, OS_LOG_TYPE_DEBUG, "Need to decrypt timestamps for metadata %@", buf, 0xCu);
                }
                objc_msgSend_container(val, v33, v34);
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_pcsCache(v35, v36, v37);
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                v83[0] = MEMORY[0x1E0C809B0];
                v83[1] = 3221225472;
                v83[2] = sub_1BEA45784;
                v83[3] = &unk_1E7830858;
                objc_copyWeak(&v88, &location);
                v87 = v97;
                v84 = v8;
                v85 = v28;
                v86 = v20;
                objc_msgSend_fetchPCSForRecordWithID_forOperation_options_withCompletionHandler_(v38, v39, (uint64_t)v77, val, 0, v83);

                objc_destroyWeak(&v88);
              }
              ++v27;
            }
            while (v25 != v27);
            v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v23, (uint64_t)&v89, v96, 16);
          }
          while (v25);
        }

        if (*(_QWORD *)(*(_QWORD *)&v97[8] + 40))
        {

          v21 = 0;
        }
        objc_msgSend_callbackQueue(val, v40, v41);
        v42 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = sub_1BEA45AE8;
        block[3] = &unk_1E7830880;
        block[4] = val;
        v80 = v8;
        v9 = v21;
        v81 = v9;
        v82 = v97;
        dispatch_group_notify(v20, v42, block);

        objc_destroyWeak(&location);
        _Block_object_dispose(v97, 8);

      }
      else
      {
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v66 = *MEMORY[0x1E0C952C0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952C0], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v97 = 138412290;
          *(_QWORD *)&v97[4] = v8;
          _os_log_error_impl(&dword_1BE990000, v66, OS_LOG_TYPE_ERROR, "No record ID for delta metadata on value ID %@", v97, 0xCu);
        }
        objc_msgSend_errorWithDomain_code_userInfo_format_(MEMORY[0x1E0C94FF8], v67, *MEMORY[0x1E0C94B20], 1017, 0, CFSTR("Must specify a record ID and field name for value %@"), v8);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_metadataFetchedBlock(self, v69, v70);
        v71 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, id, _QWORD, void *))v71)[2](v71, v8, 0, v68);

      }
    }
    else
    {
      v48 = sub_1BEB10D5C(v76);
      objc_msgSend_request(self, v49, v50);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1BEB10290(v51, v76);
      v52 = (void *)objc_claimAutoreleasedReturnValue();

      v53 = (void *)MEMORY[0x1E0C94FF8];
      objc_msgSend_error(v76, v54, v55);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorDescription(v56, v57, v58);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_format_(v53, v60, *MEMORY[0x1E0C94B20], v48, v52, CFSTR("Error fetching delta for value %@ from server: %@"), v8, v59);
      v61 = (void *)objc_claimAutoreleasedReturnValue();

      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v62 = *MEMORY[0x1E0C952C0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952C0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v97 = 138412546;
        *(_QWORD *)&v97[4] = v8;
        *(_WORD *)&v97[12] = 2112;
        *(_QWORD *)&v97[14] = v61;
        _os_log_error_impl(&dword_1BE990000, v62, OS_LOG_TYPE_ERROR, "Failed to fetch metadatas for value %@: %@", v97, 0x16u);
      }
      objc_msgSend_metadataFetchedBlock(self, v63, v64);
      v65 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id, _QWORD, void *))v65)[2](v65, v8, 0, v61);

    }
  }
  else
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v43 = (void *)*MEMORY[0x1E0C952C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952C0], OS_LOG_TYPE_INFO))
    {
      v44 = v43;
      objc_msgSend_operationID(self, v45, v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v97 = 138412290;
      *(_QWORD *)&v97[4] = v47;
      _os_log_impl(&dword_1BE990000, v44, OS_LOG_TYPE_INFO, "No per-valueID fetch block for operation %@", v97, 0xCu);

    }
  }

}

- (id)metadataFetchedBlock
{
  return self->_metadataFetchedBlock;
}

- (void)setMetadataFetchedBlock:(id)a3
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
  objc_storeStrong(&self->_metadataFetchedBlock, 0);
}

@end
