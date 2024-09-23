@implementation CKDPublicIdentityLookupRequest

- (CKDPublicIdentityLookupRequest)initWithOperation:(id)a3 lookupInfos:(id)a4
{
  id v6;
  id v7;
  CKDPublicIdentityLookupRequest *v8;
  CKDPublicIdentityLookupRequest *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  NSArray *lookupInfosToFetch;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CKDPublicIdentityLookupRequest;
  v8 = -[CKDPublicIdentityLookupRequest init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_operation, v6);
    v12 = objc_msgSend_copy(v7, v10, v11);
    lookupInfosToFetch = v9->_lookupInfosToFetch;
    v9->_lookupInfosToFetch = (NSArray *)v12;

  }
  return v9;
}

- (void)cancel
{
  objc_msgSend_setIsCancelled_(self, a2, 1);
}

- (void)_saveUserIdentity:(id)a3 forLookupInfo:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  id WeakRetained;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  const char *v19;
  const char *v20;
  NSObject *v21;
  NSObject *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  int v26;
  id v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend_publicSharingKey(v6, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_operation);
    objc_msgSend_container(WeakRetained, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_publicIdentitiesDiskCache(v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v18 = (void *)*MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
      {
        v22 = v18;
        objc_msgSend_ckShortDescription(v7, v23, v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 138412546;
        v27 = v25;
        v28 = 2112;
        v29 = v17;
        _os_log_debug_impl(&dword_1BE990000, v22, OS_LOG_TYPE_DEBUG, "Caching PILS entry for \"%@\" in %@", (uint8_t *)&v26, 0x16u);

      }
      objc_msgSend_cacheUserIdentity_forLookupInfo_container_(v17, v19, (uint64_t)v6, v7, v14);
    }

  }
  else
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v21 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      v26 = 138412290;
      v27 = v6;
      _os_log_debug_impl(&dword_1BE990000, v21, OS_LOG_TYPE_DEBUG, "Not caching user identity without a public sharing key: %@", (uint8_t *)&v26, 0xCu);
    }
  }
  objc_msgSend__receivedUserIdentity_forLookupInfo_error_(self, v20, (uint64_t)v6, v7, 0);

}

- (void)_receivedUserIdentity:(id)a3 forLookupInfo:(id)a4 error:(id)a5
{
  void (**perLookupInfoProgressBlock)(id, id, id, id);

  perLookupInfoProgressBlock = (void (**)(id, id, id, id))self->_perLookupInfoProgressBlock;
  if (perLookupInfoProgressBlock)
    perLookupInfoProgressBlock[2](perLookupInfoProgressBlock, a4, a3, a5);
}

- (void)performRequest
{
  uint64_t v2;
  const char *v5;
  uint64_t v6;
  id WeakRetained;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  const char *v24;
  int hasPrefix;
  void *v26;
  const char *v27;
  void *v28;
  const char *v29;
  void *v30;
  const char *v31;
  void *v32;
  const char *v33;
  NSMutableArray *missingLookupInfos;
  NSMutableArray *v35;
  NSMutableArray *v36;
  NSObject *v37;
  const char *v38;
  uint64_t v39;
  void *(*v40)(uint64_t, uint64_t);
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  NSObject *v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  id v57;
  id v58;
  void *v59;
  void *v60;
  const char *v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  NSObject *v68;
  const char *v69;
  void *v70;
  objc_class *v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  NSArray *obj;
  _QWORD aBlock[4];
  id v77;
  id v78;
  CKDPublicIdentityLookupRequest *v79;
  _QWORD *v80;
  _BYTE *v81;
  uint64_t *v82;
  _QWORD v83[5];
  id v84;
  uint64_t v85;
  uint64_t *v86;
  uint64_t v87;
  void *(*v88)(uint64_t, uint64_t);
  void (*v89)(uint64_t);
  id v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  uint8_t v95[4];
  void *v96;
  _BYTE buf[24];
  void *(*v98)(uint64_t, uint64_t);
  __int128 v99;
  _BYTE v100[128];
  uint64_t v101;

  v101 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend_hasPerformed(self, a2, v2))
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v5, v6);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = (objc_class *)objc_opt_class();
    NSStringFromClass(v71);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v70, v73, (uint64_t)a2, self, CFSTR("CKDPublicIdentityLookupRequest.m"), 71, CFSTR("A %@ may only be performed once"), v72);

  }
  objc_msgSend_setHasPerformed_(self, v5, 1);
  WeakRetained = objc_loadWeakRetained((id *)&self->_operation);
  objc_msgSend_container(WeakRetained, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_publicIdentitiesDiskCache(v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v93 = 0u;
  v94 = 0u;
  v91 = 0u;
  v92 = 0u;
  obj = self->_lookupInfosToFetch;
  v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v14, (uint64_t)&v91, v100, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v92;
    v74 = *MEMORY[0x1E0C94B20];
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v92 != v17)
          objc_enumerationMutation(obj);
        v19 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * v18);
        objc_msgSend_cachedIdentityForLookupInfo_container_(v13, v15, (uint64_t)v19, v10);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (*MEMORY[0x1E0C95280]
          && (objc_msgSend_phoneNumber(v19, v20, v21),
              v23 = (void *)objc_claimAutoreleasedReturnValue(),
              hasPrefix = objc_msgSend_hasPrefix_(v23, v24, (uint64_t)CFSTR("UNIT_TEST_FAILED_LOOKUP_")),
              v23,
              hasPrefix))
        {
          if (*MEMORY[0x1E0C95300] != -1)
            dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
          v26 = (void *)*MEMORY[0x1E0C952B0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
          {
            v44 = v26;
            objc_msgSend_phoneNumber(v19, v45, v46);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v47;
            _os_log_debug_impl(&dword_1BE990000, v44, OS_LOG_TYPE_DEBUG, "Returning a fake empty response for participant \"%@\". You asked for it!", buf, 0xCu);

          }
          objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v27, v74, 1000, CFSTR("Unit-test-requested error fetching share participant"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend__receivedUserIdentity_forLookupInfo_error_(self, v29, 0, v19, v28);

        }
        else if (v22)
        {
          objc_msgSend_setLookupInfo_(v22, v20, (uint64_t)v19);
          if (*MEMORY[0x1E0C95300] != -1)
            dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
          v30 = (void *)*MEMORY[0x1E0C952B0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
          {
            v37 = v30;
            objc_msgSend_publicSharingKey(v22, v38, v39);
            v40 = (void *(*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
            v43 = objc_msgSend_publicKeyVersion(v22, v41, v42);
            *(_DWORD *)buf = 138413058;
            *(_QWORD *)&buf[4] = v19;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v22;
            *(_WORD *)&buf[22] = 2114;
            v98 = v40;
            LOWORD(v99) = 2048;
            *(_QWORD *)((char *)&v99 + 2) = v43;
            _os_log_debug_impl(&dword_1BE990000, v37, OS_LOG_TYPE_DEBUG, "Found lookup info key %@ in cache, injected it into cached identity %@. Public key is %{public}@/%lu", buf, 0x2Au);

          }
          objc_msgSend__receivedUserIdentity_forLookupInfo_error_(self, v31, (uint64_t)v22, v19, 0);
        }
        else
        {
          if (*MEMORY[0x1E0C95300] != -1)
            dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
          v32 = (void *)*MEMORY[0x1E0C952B0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
          {
            v48 = v32;
            objc_msgSend_ckShortDescription(v19, v49, v50);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)&buf[4] = v51;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v13;
            _os_log_debug_impl(&dword_1BE990000, v48, OS_LOG_TYPE_DEBUG, "Found no PILS cache entry for \"%@\" in %@", buf, 0x16u);

          }
          missingLookupInfos = self->_missingLookupInfos;
          if (!missingLookupInfos)
          {
            v35 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
            v36 = self->_missingLookupInfos;
            self->_missingLookupInfos = v35;

            missingLookupInfos = self->_missingLookupInfos;
          }
          objc_msgSend_addObject_(missingLookupInfos, v33, (uint64_t)v19);
        }

        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v15, (uint64_t)&v91, v100, 16);
    }
    while (v16);
  }

  if ((objc_msgSend__tryComplete(self, v52, v53) & 1) == 0)
  {
    objc_msgSend_spawnURLRequests(self, v54, v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v98 = sub_1BE9BB138;
    *(_QWORD *)&v99 = sub_1BE9BAE50;
    *((_QWORD *)&v99 + 1) = 0;
    v85 = 0;
    v86 = &v85;
    v87 = 0x3032000000;
    v88 = sub_1BE9BB138;
    v89 = sub_1BE9BAE50;
    v90 = 0;
    v83[0] = 0;
    v83[1] = v83;
    v83[2] = 0x3032000000;
    v83[3] = sub_1BEBCD8D8;
    v83[4] = sub_1BEBCD8E8;
    v84 = 0;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = sub_1BEBCD8F0;
    aBlock[3] = &unk_1E7836908;
    v57 = v56;
    v77 = v57;
    v80 = v83;
    v81 = buf;
    v82 = &v85;
    v58 = v10;
    v78 = v58;
    v79 = self;
    v59 = _Block_copy(aBlock);
    v60 = (void *)v86[5];
    v86[5] = (uint64_t)v59;

    objc_msgSend_objectAtIndex_(v57, v61, 0);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_completionBlock(v62, v63, v64);
    v65 = objc_claimAutoreleasedReturnValue();
    v66 = *(void **)(*(_QWORD *)&buf[8] + 40);
    *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v65;

    objc_msgSend_setCompletionBlock_(v62, v67, v86[5]);
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v68 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v95 = 138412290;
      v96 = v62;
      _os_log_debug_impl(&dword_1BE990000, v68, OS_LOG_TYPE_DEBUG, "Starting execution of batched requests, triggering %@", v95, 0xCu);
    }
    objc_msgSend_performRequest_(v58, v69, (uint64_t)v62);

    _Block_object_dispose(v83, 8);
    _Block_object_dispose(&v85, 8);

    _Block_object_dispose(buf, 8);
  }

}

- (id)spawnURLRequests
{
  uint64_t v2;
  void *v4;
  NSMutableArray *v5;
  const char *v6;
  uint64_t v7;
  unint64_t v8;
  const char *v9;
  id WeakRetained;
  __int128 v11;
  unint64_t fetchBatchSize;
  NSMutableArray *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  NSMutableArray *missingLookupInfos;
  uint64_t v18;
  void *v19;
  CKDDiscoverUserIdentitiesURLRequest *v20;
  const char *v21;
  void *v22;
  const char *v23;
  id v24;
  const char *v25;
  const char *v26;
  const char *v27;
  NSObject *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t BatchSize;
  __int128 v36;
  _QWORD v37[4];
  id v38;
  CKDPublicIdentityLookupRequest *v39;
  id v40;
  _BYTE from[12];
  __int16 v42;
  uint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  objc_msgSend_array(MEMORY[0x1E0C99DE8], a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = self->_missingLookupInfos;
  v8 = objc_msgSend_count(v5, v6, v7);
  WeakRetained = objc_loadWeakRetained((id *)&self->_operation);
  if (v8)
  {
    *(_QWORD *)&v11 = 134218240;
    v36 = v11;
    do
    {
      fetchBatchSize = self->_fetchBatchSize;
      if (v8 <= fetchBatchSize)
      {
        v13 = v5;
        missingLookupInfos = self->_missingLookupInfos;
        self->_missingLookupInfos = 0;

      }
      else
      {
        objc_msgSend_subarrayWithRange_(v5, v9, 0, self->_fetchBatchSize);
        v13 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_removeObjectsInRange_(v5, v14, 0, fetchBatchSize);
      }
      v18 = objc_msgSend_count(v13, v15, v16, v36);
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v19 = (void *)*MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
      {
        v28 = v19;
        v31 = objc_msgSend_count(v13, v29, v30);
        BatchSize = objc_msgSend_fetchBatchSize(self, v32, v33);
        *(_DWORD *)from = v36;
        *(_QWORD *)&from[4] = v31;
        v42 = 2048;
        v43 = BatchSize;
        _os_log_debug_impl(&dword_1BE990000, v28, OS_LOG_TYPE_DEBUG, "Creating request to fetch public identity for %lu infos (batch size is %lu)", from, 0x16u);

      }
      v20 = [CKDDiscoverUserIdentitiesURLRequest alloc];
      v22 = (void *)objc_msgSend_initWithOperation_lookupInfos_adopterProvidedLookupInfos_(v20, v21, (uint64_t)WeakRetained, v13, 1);
      objc_msgSend_setWantsProtectionInfo_(v22, v23, 1);
      *(_QWORD *)from = 0;
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = sub_1BEBCDE8C;
      v37[3] = &unk_1E7836930;
      v24 = WeakRetained;
      v38 = v24;
      v39 = self;
      objc_copyWeak(&v40, (id *)from);
      objc_msgSend_setProgressBlock_(v22, v25, (uint64_t)v37);
      objc_msgSend_configureRequest_(v24, v26, (uint64_t)v22);
      objc_msgSend_addObject_(v4, v27, (uint64_t)v22);
      objc_destroyWeak(&v40);

      objc_destroyWeak((id *)from);
      v8 -= v18;
    }
    while (v8);
  }

  return v4;
}

- (BOOL)_tryComplete
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  BOOL v8;
  BOOL v9;

  if (objc_msgSend_isCancelled(self, a2, v2))
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v4, *MEMORY[0x1E0C947D8], 20, CFSTR("This request was cancelled"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  if (objc_msgSend_count(self->_missingLookupInfos, v4, v5))
    v8 = v6 == 0;
  else
    v8 = 0;
  v9 = !v8;
  if (!v8)
    objc_msgSend_finishWithError_(self, v7, (uint64_t)v6);

  return v9;
}

- (void)finishWithError:(id)a3
{
  id v4;
  NSMutableArray *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  const char *v11;
  void (**lookupCompletionBlock)(id, id);
  id v13;
  id perLookupInfoProgressBlock;
  NSObject *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  CKDPublicIdentityLookupRequest *v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_perLookupInfoProgressBlock)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v5 = self->_missingLookupInfos;
    v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v16, v22, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v5);
          (*((void (**)(id))self->_perLookupInfoProgressBlock + 2))(self->_perLookupInfoProgressBlock);
        }
        v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v11, (uint64_t)&v16, v22, 16);
      }
      while (v8);
    }

  }
  lookupCompletionBlock = (void (**)(id, id))self->_lookupCompletionBlock;
  if (lookupCompletionBlock)
  {
    lookupCompletionBlock[2](lookupCompletionBlock, v4);
    v13 = self->_lookupCompletionBlock;
  }
  else
  {
    v13 = 0;
  }
  self->_lookupCompletionBlock = 0;

  perLookupInfoProgressBlock = self->_perLookupInfoProgressBlock;
  self->_perLookupInfoProgressBlock = 0;

  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v15 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v21 = self;
    _os_log_debug_impl(&dword_1BE990000, v15, OS_LOG_TYPE_DEBUG, "Completed request: %@", buf, 0xCu);
  }

}

- (id)description
{
  return (id)((uint64_t (*)(CKDPublicIdentityLookupRequest *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKDescription);
}

- (id)ckShortDescription
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  void *v15;
  const char *v16;
  const char *v17;
  const char *v18;
  void *v19;

  objc_msgSend_array(MEMORY[0x1E0C99DE8], a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_count(self->_lookupInfosToFetch, v5, v6);
  v9 = (void *)MEMORY[0x1E0CB3940];
  if (v8 < 4)
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v7, (uint64_t)CFSTR("lookupInfos=%@"), self->_lookupInfosToFetch);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v4, v17, (uint64_t)v10);
  }
  else
  {
    objc_msgSend_subarrayWithRange_(self->_lookupInfosToFetch, v7, 0, 3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend_count(self->_lookupInfosToFetch, v11, v12);
    objc_msgSend_stringWithFormat_(v9, v14, (uint64_t)CFSTR("lookupInfos=%@ + %ld more"), v10, v13 - 3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v4, v16, (uint64_t)v15);

  }
  objc_msgSend_componentsJoinedByString_(v4, v18, (uint64_t)CFSTR(", "));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (BOOL)isCancelled
{
  return self->_isCancelled;
}

- (void)setIsCancelled:(BOOL)a3
{
  self->_isCancelled = a3;
}

- (unint64_t)fetchBatchSize
{
  return self->_fetchBatchSize;
}

- (void)setFetchBatchSize:(unint64_t)a3
{
  self->_fetchBatchSize = a3;
}

- (id)perLookupInfoProgressBlock
{
  return self->_perLookupInfoProgressBlock;
}

- (void)setPerLookupInfoProgressBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (id)lookupCompletionBlock
{
  return self->_lookupCompletionBlock;
}

- (void)setLookupCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)hasPerformed
{
  return self->_hasPerformed;
}

- (void)setHasPerformed:(BOOL)a3
{
  self->_hasPerformed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_lookupCompletionBlock, 0);
  objc_storeStrong(&self->_perLookupInfoProgressBlock, 0);
  objc_storeStrong((id *)&self->_missingLookupInfos, 0);
  objc_storeStrong((id *)&self->_lookupInfosToFetch, 0);
  objc_destroyWeak((id *)&self->_operation);
}

@end
