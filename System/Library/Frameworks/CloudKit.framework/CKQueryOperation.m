@implementation CKQueryOperation

+ (SEL)daemonInvocationSelector
{
  return sel_performQueryOperation_withBlock_;
}

- (void)setQueryCompletionBlock:(void *)queryCompletionBlock
{
  _BOOL8 v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  id v9;

  v4 = queryCompletionBlock == 0;
  v9 = queryCompletionBlock;
  objc_msgSend_setCanDropItemResultsEarly_(self, v5, v4, v6);
  objc_msgSend_setQueryCompletionBlockIVar_(self, v7, (uint64_t)v9, v8);

}

- (void)setQueryCompletionBlockIVar:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id queryCompletionBlock;
  NSObject *v13;
  id v14;
  _QWORD block[5];
  id v16;

  v14 = a3;
  if (__sTestOverridesAvailable
    && objc_msgSend__ckRaiseInGeneratedCallbackImplementation(self, v4, v5, v6))
  {
    objc_msgSend_raise_format_(MEMORY[0x1E0C99DA0], v4, *MEMORY[0x1E0C99750], (uint64_t)CFSTR("Callback check triggered"));
  }
  if (objc_msgSend_queueHasStarted(self, v4, v5, v6)
    && !dispatch_get_specific(kCKOperationCallbackQueueName))
  {
    objc_msgSend_callbackQueue(self, v7, v8, v9);
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_18A7749AC;
    block[3] = &unk_1E1F5F730;
    block[4] = self;
    v16 = v14;
    dispatch_sync(v13, block);

    queryCompletionBlock = v16;
    goto LABEL_9;
  }
  v10 = v14;
  if (self->_queryCompletionBlock != v14)
  {
    v11 = (void *)objc_msgSend_copy(v14, v7, v8, v9);
    queryCompletionBlock = self->_queryCompletionBlock;
    self->_queryCompletionBlock = v11;
LABEL_9:

    v10 = v14;
  }

}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
  id v4;
  CKSignpost *signpost;
  CKSignpost *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  CKSignpost *v10;
  CKSignpost *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  CKSignpost *v16;
  CKSignpost *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  os_signpost_id_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  const char *v33;
  __CFString *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void (**v43)(void *, void *, void *);
  void *v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  const char *v59;
  unint64_t assetBackedMergeableDeltaCount;
  uint64_t v61;
  unint64_t mergeableValueCount;
  void *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  unint64_t mergeableDeltaCount;
  void *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  void *v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  void *v94;
  const char *v95;
  uint64_t v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  const char *v102;
  NSObject *v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  void *v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  void *v112;
  const __CFString *v113;
  const __CFString *v114;
  NSObject *v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  void *v119;
  const __CFString *v120;
  const __CFString *v121;
  objc_super v122;
  uint8_t buf[4];
  void *v124;
  __int16 v125;
  uint64_t v126;
  __int16 v127;
  const __CFString *v128;
  __int16 v129;
  const __CFString *v130;
  uint64_t v131;

  v131 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self)
    signpost = self->super.super._signpost;
  else
    signpost = 0;
  v6 = signpost;

  if (v6)
  {
    if (self)
      v10 = self->super.super._signpost;
    else
      v10 = 0;
    v11 = v10;
    objc_msgSend_log(v11, v12, v13, v14);
    v15 = objc_claimAutoreleasedReturnValue();

    if (self)
      v16 = self->super.super._signpost;
    else
      v16 = 0;
    v17 = v16;
    v21 = objc_msgSend_identifier(v17, v18, v19, v20);

    if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v15, OS_SIGNPOST_EVENT, v21, "CKQueryOperation", "Finishing", buf, 2u);
    }

  }
  if (!v4)
  {
    objc_msgSend_recordErrors(self, v7, v8, v9);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend_count(v22, v23, v24, v25);

    if (v26)
    {
      objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v7, v8, v9);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_recordErrors(self, v28, v29, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v27, v32, (uint64_t)v31, (uint64_t)CFSTR("CKPartialErrors"));

      objc_msgSend_errorWithDomain_code_userInfo_format_(CKPrettyError, v33, (uint64_t)CFSTR("CKInternalErrorDomain"), 1011, v27, CFSTR("Failed to fetch some query results"));
      v4 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v4 = 0;
    }
  }
  objc_msgSend_CKClientSuitableError(v4, v7, v8, v9);
  v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_queryCompletionBlock_wrapper(self, v35, v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v38;
  if (v38)
  {
    v43 = (void (**)(void *, void *, void *))_Block_copy(v38);
  }
  else
  {
    objc_msgSend_queryCompletionBlock(self, v39, v40, v41);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = (void (**)(void *, void *, void *))_Block_copy(v44);

  }
  if (v43)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v45 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      v103 = v45;
      objc_msgSend_operationID(self, v104, v105, v106);
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_resultsCursor(self, v108, v109, v110);
      v111 = objc_claimAutoreleasedReturnValue();
      v112 = (void *)v111;
      v113 = CFSTR(" Error was: ");
      *(_DWORD *)buf = 138544130;
      v114 = &stru_1E1F66ED0;
      v124 = v107;
      v125 = 2112;
      if (!v34)
        v113 = &stru_1E1F66ED0;
      v126 = v111;
      if (v34)
        v114 = v34;
      v127 = 2114;
      v128 = v113;
      v129 = 2112;
      v130 = v114;
      _os_log_debug_impl(&dword_18A5C5000, v103, OS_LOG_TYPE_DEBUG, "Operation %{public}@ has completed. Query cursor is %@.%{public}@%@", buf, 0x2Au);

    }
    objc_msgSend_resultsCursor(self, v46, v47, v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v43[2](v43, v49, v34);

    objc_msgSend_setQueryCompletionBlock_(self, v50, 0, v51);
  }
  else
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v54 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      v115 = v54;
      objc_msgSend_operationID(self, v116, v117, v118);
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      v120 = CFSTR(" Error was: ");
      v121 = &stru_1E1F66ED0;
      *(_DWORD *)buf = 138543874;
      v124 = v119;
      if (v34)
        v121 = v34;
      else
        v120 = &stru_1E1F66ED0;
      v125 = 2114;
      v126 = (uint64_t)v120;
      v127 = 2112;
      v128 = v121;
      _os_log_debug_impl(&dword_18A5C5000, v115, OS_LOG_TYPE_DEBUG, "Operation %{public}@ finished but no queryCompletionBlock was set.%{public}@%@", buf, 0x20u);

    }
  }
  objc_msgSend_setRecordFetchedBlock_(self, v52, 0, v53);
  objc_msgSend_setRecordMatchedBlock_(self, v55, 0, v56);
  objc_msgSend_setQueryCursorFetchedBlock_(self, v57, 0, v58);
  if (self)
  {
    mergeableValueCount = self->_mergeableValueCount;
    if (mergeableValueCount)
    {
      objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v59, mergeableValueCount, v61);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_operationMetric(self, v64, v65, v66);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v67, v68, (uint64_t)v63, (uint64_t)CFSTR("mergeable_valueCount"));

    }
    mergeableDeltaCount = self->_mergeableDeltaCount;
    if (mergeableDeltaCount)
    {
      objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v59, mergeableDeltaCount, v61);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_operationMetric(self, v71, v72, v73);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v74, v75, (uint64_t)v70, (uint64_t)CFSTR("mergeable_fetchedDeltaCount"));

    }
    assetBackedMergeableDeltaCount = self->_assetBackedMergeableDeltaCount;
    if (assetBackedMergeableDeltaCount)
    {
      objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v59, assetBackedMergeableDeltaCount, v61);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_operationMetric(self, v77, v78, v79);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v80, v81, (uint64_t)v76, (uint64_t)CFSTR("mergeable_assetCount"));

    }
  }
  objc_msgSend_zoneID(self, v59, assetBackedMergeableDeltaCount, v61);
  v82 = (void *)objc_claimAutoreleasedReturnValue();

  if (v82)
  {
    v86 = (void *)MEMORY[0x1E0C99E20];
    v87 = (void *)MEMORY[0x1E0C99D20];
    objc_msgSend_zoneID(self, v83, v84, v85);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_arrayWithObjects_(v87, v89, (uint64_t)v88, v90, 0);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWithArray_(v86, v92, (uint64_t)v91, v93);
    v94 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_zoneIDsToZoneNamesString_(self, v95, (uint64_t)v94, v96);
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_operationMetric(self, v98, v99, v100);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v101, v102, (uint64_t)v97, (uint64_t)CFSTR("zoneNames"));

  }
  v122.receiver = self;
  v122.super_class = (Class)CKQueryOperation;
  -[CKOperation _finishOnCallbackQueueWithError:](&v122, sel__finishOnCallbackQueueWithError_, v4);

}

- (void)fillOutOperationInfo:(id)a3
{
  id *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  char AssetContent;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  objc_super v41;

  v4 = (id *)a3;
  objc_msgSend_query(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v4)
    objc_storeStrong(v4 + 19, v8);

  objc_msgSend_zoneID(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v4)
    objc_storeStrong(v4 + 20, v13);

  objc_msgSend_cursor(self, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v4)
    objc_storeStrong(v4 + 21, v18);

  v23 = objc_msgSend_resultsLimit(self, v20, v21, v22);
  if (v4)
    v4[22] = (id)v23;
  objc_msgSend_desiredKeys(self, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v27;
  if (v4)
    objc_storeStrong(v4 + 23, v27);

  objc_msgSend_assetTransferOptionsByKey(self, v29, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v32;
  if (v4)
    objc_storeStrong(v4 + 24, v32);

  AssetContent = objc_msgSend_shouldFetchAssetContent(self, v34, v35, v36);
  if (v4)
  {
    *((_BYTE *)v4 + 144) = AssetContent;
    *((_BYTE *)v4 + 145) = objc_msgSend_fetchAllResults(self, v38, v39, v40);
  }
  else
  {
    objc_msgSend_fetchAllResults(self, v38, v39, v40);
  }
  v41.receiver = self;
  v41.super_class = (Class)CKQueryOperation;
  -[CKDatabaseOperation fillOutOperationInfo:](&v41, sel_fillOutOperationInfo_, v4);

}

- (CKRecordZoneID)zoneID
{
  return self->_zoneID;
}

- (BOOL)shouldFetchAssetContent
{
  return self->_shouldFetchAssetContent;
}

- (NSUInteger)resultsLimit
{
  return self->_resultsLimit;
}

- (CKQuery)query
{
  return self->_query;
}

- (BOOL)fetchAllResults
{
  return self->_fetchAllResults;
}

- (NSArray)desiredKeys
{
  return self->_desiredKeys;
}

- (CKQueryCursor)cursor
{
  return self->_cursor;
}

- (NSDictionary)assetTransferOptionsByKey
{
  return self->_assetTransferOptionsByKey;
}

- (void)setRecordFetchedBlock:(void *)recordFetchedBlock
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v14;
  _QWORD block[5];
  id v16;

  v14 = recordFetchedBlock;
  if (__sTestOverridesAvailable
    && objc_msgSend__ckRaiseInGeneratedCallbackImplementation(self, v4, v5, v6))
  {
    objc_msgSend_raise_format_(MEMORY[0x1E0C99DA0], v4, *MEMORY[0x1E0C99750], (uint64_t)CFSTR("Callback check triggered"));
  }
  if (objc_msgSend_queueHasStarted(self, v4, v5, v6)
    && !dispatch_get_specific(kCKOperationCallbackQueueName))
  {
    objc_msgSend_callbackQueue(self, v7, v8, v9);
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_18A774704;
    block[3] = &unk_1E1F5F730;
    block[4] = self;
    v16 = v14;
    dispatch_sync(v13, block);

    v12 = v16;
    goto LABEL_9;
  }
  v10 = v14;
  if (self->_recordFetchedBlock != v14)
  {
    v11 = (void *)objc_msgSend_copy(v14, v7, v8, v9);
    v12 = self->_recordFetchedBlock;
    self->_recordFetchedBlock = v11;
LABEL_9:

    v10 = v14;
  }

}

- (void)setZoneID:(CKRecordZoneID *)zoneID
{
  objc_setProperty_nonatomic_copy(self, a2, zoneID, 568);
}

- (void)setResultsLimit:(NSUInteger)resultsLimit
{
  self->_resultsLimit = resultsLimit;
}

- (void)setResultsCursor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 632);
}

- (void)setRecordMatchedBlock:(void *)recordMatchedBlock
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v14;
  _QWORD block[5];
  id v16;

  v14 = recordMatchedBlock;
  if (__sTestOverridesAvailable
    && objc_msgSend__ckRaiseInGeneratedCallbackImplementation(self, v4, v5, v6))
  {
    objc_msgSend_raise_format_(MEMORY[0x1E0C99DA0], v4, *MEMORY[0x1E0C99750], (uint64_t)CFSTR("Callback check triggered"));
  }
  if (objc_msgSend_queueHasStarted(self, v4, v5, v6)
    && !dispatch_get_specific(kCKOperationCallbackQueueName))
  {
    objc_msgSend_callbackQueue(self, v7, v8, v9);
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_18A7747C4;
    block[3] = &unk_1E1F5F730;
    block[4] = self;
    v16 = v14;
    dispatch_sync(v13, block);

    v12 = v16;
    goto LABEL_9;
  }
  v10 = v14;
  if (self->_recordMatchedBlock != v14)
  {
    v11 = (void *)objc_msgSend_copy(v14, v7, v8, v9);
    v12 = self->_recordMatchedBlock;
    self->_recordMatchedBlock = v11;
LABEL_9:

    v10 = v14;
  }

}

- (void)setQueryCursorFetchedBlock:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id queryCursorFetchedBlock;
  NSObject *v13;
  id v14;
  _QWORD block[5];
  id v16;

  v14 = a3;
  if (__sTestOverridesAvailable
    && objc_msgSend__ckRaiseInGeneratedCallbackImplementation(self, v4, v5, v6))
  {
    objc_msgSend_raise_format_(MEMORY[0x1E0C99DA0], v4, *MEMORY[0x1E0C99750], (uint64_t)CFSTR("Callback check triggered"));
  }
  if (objc_msgSend_queueHasStarted(self, v4, v5, v6)
    && !dispatch_get_specific(kCKOperationCallbackQueueName))
  {
    objc_msgSend_callbackQueue(self, v7, v8, v9);
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_18A774A3C;
    block[3] = &unk_1E1F5F730;
    block[4] = self;
    v16 = v14;
    dispatch_sync(v13, block);

    queryCursorFetchedBlock = v16;
    goto LABEL_9;
  }
  v10 = v14;
  if (self->_queryCursorFetchedBlock != v14)
  {
    v11 = (void *)objc_msgSend_copy(v14, v7, v8, v9);
    queryCursorFetchedBlock = self->_queryCursorFetchedBlock;
    self->_queryCursorFetchedBlock = v11;
LABEL_9:

    v10 = v14;
  }

}

- (void)setDesiredKeys:(NSArray *)desiredKeys
{
  objc_setProperty_nonatomic_copy(self, a2, desiredKeys, 584);
}

- (CKQueryCursor)resultsCursor
{
  return self->_resultsCursor;
}

- (void)recordFetchedBlock
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v10;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  void *(*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  if (__sTestOverridesAvailable
    && objc_msgSend__ckRaiseInGeneratedCallbackImplementation(self, a2, v2, v3))
  {
    objc_msgSend_raise_format_(MEMORY[0x1E0C99DA0], a2, *MEMORY[0x1E0C99750], (uint64_t)CFSTR("Callback check triggered"));
  }
  if (objc_msgSend_queueHasStarted(self, a2, v2, v3)
    && !dispatch_get_specific(kCKOperationCallbackQueueName))
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = sub_18A774754;
    v16 = sub_18A77477C;
    v17 = 0;
    objc_msgSend_callbackQueue(self, v5, v6, v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18A774784;
    v11[3] = &unk_1E1F5F758;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);

  }
  else
  {
    v8 = _Block_copy(self->_recordFetchedBlock);
  }
  return v8;
}

- (NSMutableDictionary)recordErrors
{
  return self->_recordErrors;
}

- (id)queryCompletionBlock_wrapper
{
  return self->_queryCompletionBlock_wrapper;
}

- (void)queryCompletionBlock
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v10;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  void *(*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  if (__sTestOverridesAvailable
    && objc_msgSend__ckRaiseInGeneratedCallbackImplementation(self, a2, v2, v3))
  {
    objc_msgSend_raise_format_(MEMORY[0x1E0C99DA0], a2, *MEMORY[0x1E0C99750], (uint64_t)CFSTR("Callback check triggered"));
  }
  if (objc_msgSend_queueHasStarted(self, a2, v2, v3)
    && !dispatch_get_specific(kCKOperationCallbackQueueName))
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = sub_18A774754;
    v16 = sub_18A77477C;
    v17 = 0;
    objc_msgSend_callbackQueue(self, v5, v6, v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18A7749FC;
    v11[3] = &unk_1E1F5F758;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);

  }
  else
  {
    v8 = _Block_copy(self->_queryCompletionBlock);
  }
  return v8;
}

- (CKQueryOperation)init
{
  CKQueryOperation *v2;
  uint64_t v3;
  NSMutableDictionary *recordErrors;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKQueryOperation;
  v2 = -[CKOperation init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    recordErrors = v2->_recordErrors;
    v2->_recordErrors = (NSMutableDictionary *)v3;

    v2->_shouldFetchAssetContent = 1;
    v2->_resultsLimit = 0;
  }
  return v2;
}

- (CKQueryOperation)initWithQuery:(CKQuery *)query
{
  CKQuery *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  CKQueryOperation *v11;
  uint64_t v12;
  CKQuery *v13;

  v4 = query;
  v11 = (CKQueryOperation *)objc_msgSend_init(self, v5, v6, v7);
  if (v11)
  {
    v12 = objc_msgSend_copy(v4, v8, v9, v10);
    v13 = v11->_query;
    v11->_query = (CKQuery *)v12;

  }
  return v11;
}

- (void)handleOperationDidCompleteWithCursor:(id)a3 metrics:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  objc_super v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = a4;
  if ((objc_msgSend_isCancelled(self, v11, v12, v13) & 1) == 0)
    objc_msgSend_setResultsCursor_(self, v14, (uint64_t)v8, v15);
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v16 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    v17 = v16;
    objc_msgSend_operationID(self, v18, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v24 = v21;
    v25 = 2112;
    v26 = v8;
    _os_log_debug_impl(&dword_18A5C5000, v17, OS_LOG_TYPE_DEBUG, "Received completion callback for operation %{public}@ with cursor %@", buf, 0x16u);

  }
  v22.receiver = self;
  v22.super_class = (Class)CKQueryOperation;
  -[CKOperation handleOperationDidCompleteWithMetrics:error:](&v22, sel_handleOperationDidCompleteWithMetrics_error_, v10, v9);

}

- (void)ckSignpostEndWithError:(id)a3
{
  id v4;
  CKSignpost *signpost;
  CKSignpost *v6;
  CKSignpost *v7;
  CKSignpost *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  CKSignpost *v13;
  CKSignpost *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  os_signpost_id_t v18;
  int v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self)
    signpost = self->super.super._signpost;
  else
    signpost = 0;
  v6 = signpost;

  if (v6)
  {
    if (self)
      v7 = self->super.super._signpost;
    else
      v7 = 0;
    v8 = v7;
    objc_msgSend_log(v8, v9, v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();

    if (self)
      v13 = self->super.super._signpost;
    else
      v13 = 0;
    v14 = v13;
    v18 = objc_msgSend_identifier(v14, v15, v16, v17);

    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      v19 = 138412290;
      v20 = v4;
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v12, OS_SIGNPOST_INTERVAL_END, v18, "CKQueryOperation", "Error=%{signpost.description:attribute}@ ", (uint8_t *)&v19, 0xCu);
    }

  }
}

- (void)ckSignpostBegin
{
  CKSignpost *signpost;
  CKSignpost *v4;
  CKSignpost *v5;
  CKSignpost *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  CKSignpost *v11;
  CKSignpost *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  os_signpost_id_t v16;
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
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  int v54;
  void *v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  void *v63;
  __int16 v64;
  void *v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  if (self)
    signpost = self->super.super._signpost;
  else
    signpost = 0;
  v4 = signpost;

  if (v4)
  {
    if (self)
      v5 = self->super.super._signpost;
    else
      v5 = 0;
    v6 = v5;
    objc_msgSend_log(v6, v7, v8, v9);
    v10 = objc_claimAutoreleasedReturnValue();

    if (self)
      v11 = self->super.super._signpost;
    else
      v11 = 0;
    v12 = v11;
    v16 = objc_msgSend_identifier(v12, v13, v14, v15);

    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      objc_msgSend_operationID(self, v17, v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_containerID(self, v21, v22, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_group(self, v25, v26, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_operationGroupID(v28, v29, v30, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_operationGroupName(self, v33, v34, v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_operationInfo(self, v37, v38, v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend_discretionaryNetworkBehavior(v40, v41, v42, v43);
      CKStringForDiscretionaryNetworkBehavior(v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = objc_msgSend_qualityOfService(self, v46, v47, v48);
      CKStringForQOS(v49, v50, v51, v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = 138413570;
      v55 = v20;
      v56 = 2112;
      v57 = v24;
      v58 = 2112;
      v59 = v32;
      v60 = 2114;
      v61 = v36;
      v62 = 2114;
      v63 = v45;
      v64 = 2114;
      v65 = v53;
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v16, "CKQueryOperation", "ID=%{signpost.description:attribute}@ Container=%{signpost.description:attribute}@ GroupID=%{signpost.description:attribute}@ GroupName=%{signpost.description:attribute,public}@ Behavior=%{signpost.description:attribute,public}@ QoS=%{signpost.description:attribute,public}@ ", (uint8_t *)&v54, 0x3Eu);

    }
  }
}

- (id)activityCreate
{
  return _os_activity_create(&dword_18A5C5000, "client/query", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
}

- (BOOL)CKOperationShouldRun:(id *)a3
{
  uint64_t v3;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  int v33;
  _BOOL4 v34;
  objc_class *v35;
  void *v36;
  const char *v37;
  void *v38;
  NSObject *v39;
  objc_super v41;
  uint8_t buf[16];

  objc_msgSend_query(self, a2, (uint64_t)a3, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recordType(v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_length(v10, v11, v12, v13))
  {

  }
  else
  {
    objc_msgSend_cursor(self, v14, v15, v16);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v20)
    {
      if (a3)
      {
        v35 = (objc_class *)objc_opt_class();
        NSStringFromClass(v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v37, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("either a query or query cursor must be provided for %@"), v36);
        *a3 = (id)objc_claimAutoreleasedReturnValue();

      }
      goto LABEL_16;
    }
  }
  objc_msgSend_recordFetchedBlock(self, v17, v18, v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21
    || (objc_msgSend_recordMatchedBlock(self, v22, v23, v24), (v21 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {

    goto LABEL_7;
  }
  objc_msgSend_queryCompletionBlock(self, v25, v26, v27);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38)
  {
LABEL_7:
    objc_msgSend_zoneID(self, v28, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend_zoneIDHasCorrectDatabaseScope_error_(self, v32, (uint64_t)v31, (uint64_t)a3);

    if (v33)
    {
      v41.receiver = self;
      v41.super_class = (Class)CKQueryOperation;
      LOBYTE(v34) = -[CKDatabaseOperation CKOperationShouldRun:](&v41, sel_CKOperationShouldRun_, a3);
      return v34;
    }
LABEL_16:
    LOBYTE(v34) = 0;
    return v34;
  }
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v39 = ck_log_facility_ck;
  v34 = os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_INFO);
  if (v34)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18A5C5000, v39, OS_LOG_TYPE_INFO, "Warn: There's no point in running a query if there are no progress or completion blocks set. Bailing early.", buf, 2u);
    goto LABEL_16;
  }
  return v34;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetTransferOptionsByKey, 0);
  objc_storeStrong((id *)&self->_recordErrors, 0);
  objc_storeStrong((id *)&self->_resultsCursor, 0);
  objc_storeStrong(&self->_queryCompletionBlock_wrapper, 0);
  objc_storeStrong(&self->_recordMatchedBlock_wrapper, 0);
  objc_storeStrong((id *)&self->_desiredKeys, 0);
  objc_storeStrong((id *)&self->_zoneID, 0);
  objc_storeStrong((id *)&self->_cursor, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong(&self->_queryCursorFetchedBlock, 0);
  objc_storeStrong(&self->_queryCompletionBlock, 0);
  objc_storeStrong(&self->_recordMatchedBlock, 0);
  objc_storeStrong(&self->_recordFetchedBlock, 0);
}

+ (void)applyDaemonCallbackInterfaceTweaks:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  objc_super v7;

  v4 = a3;
  CKErrorUserInfoClasses();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v4, v6, (uint64_t)v5, (uint64_t)sel_handleOperationDidCompleteWithCursor_metrics_error_, 2, 0);

  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___CKQueryOperation;
  objc_msgSendSuper2(&v7, sel_applyDaemonCallbackInterfaceTweaks_, v4);

}

- (CKQueryOperation)initWithCursor:(CKQueryCursor *)cursor
{
  CKQueryCursor *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  CKQueryOperation *v11;
  uint64_t v12;
  CKQueryCursor *v13;

  v4 = cursor;
  v11 = (CKQueryOperation *)objc_msgSend_init(self, v5, v6, v7);
  if (v11)
  {
    v12 = objc_msgSend_copy(v4, v8, v9, v10);
    v13 = v11->_cursor;
    v11->_cursor = (CKQueryCursor *)v12;

  }
  return v11;
}

- (void)recordMatchedBlock
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v10;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  void *(*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  if (__sTestOverridesAvailable
    && objc_msgSend__ckRaiseInGeneratedCallbackImplementation(self, a2, v2, v3))
  {
    objc_msgSend_raise_format_(MEMORY[0x1E0C99DA0], a2, *MEMORY[0x1E0C99750], (uint64_t)CFSTR("Callback check triggered"));
  }
  if (objc_msgSend_queueHasStarted(self, a2, v2, v3)
    && !dispatch_get_specific(kCKOperationCallbackQueueName))
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = sub_18A774754;
    v16 = sub_18A77477C;
    v17 = 0;
    objc_msgSend_callbackQueue(self, v5, v6, v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18A77496C;
    v11[3] = &unk_1E1F5F758;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);

  }
  else
  {
    v8 = _Block_copy(self->_recordMatchedBlock);
  }
  return v8;
}

- (id)queryCursorFetchedBlock
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v10;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  void *(*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  if (__sTestOverridesAvailable
    && objc_msgSend__ckRaiseInGeneratedCallbackImplementation(self, a2, v2, v3))
  {
    objc_msgSend_raise_format_(MEMORY[0x1E0C99DA0], a2, *MEMORY[0x1E0C99750], (uint64_t)CFSTR("Callback check triggered"));
  }
  if (objc_msgSend_queueHasStarted(self, a2, v2, v3)
    && !dispatch_get_specific(kCKOperationCallbackQueueName))
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = sub_18A774754;
    v16 = sub_18A77477C;
    v17 = 0;
    objc_msgSend_callbackQueue(self, v5, v6, v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18A774BE4;
    v11[3] = &unk_1E1F5F758;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);

  }
  else
  {
    v8 = _Block_copy(self->_queryCursorFetchedBlock);
  }
  return v8;
}

- (BOOL)hasCKOperationCallbacksSet
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
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
  uint64_t v17;
  void *v18;
  void *v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)CKQueryOperation;
  if (-[CKOperation hasCKOperationCallbacksSet](&v21, sel_hasCKOperationCallbacksSet))
    return 1;
  objc_msgSend_recordFetchedBlock(self, v3, v4, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend_recordMatchedBlock(self, v7, v8, v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v6 = 1;
    }
    else
    {
      objc_msgSend_queryCursorFetchedBlock(self, v11, v12, v13);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        v6 = 1;
      }
      else
      {
        objc_msgSend_queryCompletionBlock(self, v15, v16, v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v19 != 0;

      }
    }

  }
  return v6;
}

- (void)handleQueryDidFetchForRecordID:(id)a3 record:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  CKSignpost *signpost;
  CKSignpost *v15;
  const char *v16;
  uint64_t v17;
  CKSignpost *v18;
  CKSignpost *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  CKSignpost *v24;
  CKSignpost *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  NSObject *v31;
  os_signpost_id_t v32;
  uint32_t v33;
  CKSignpost *v34;
  CKSignpost *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  CKSignpost *v39;
  CKSignpost *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void (**v53)(void *, id, id, void *);
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  void (**v67)(_QWORD, _QWORD);
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  NSObject *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  NSObject *v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  _QWORD v99[5];
  uint8_t buf[4];
  id v101;
  __int16 v102;
  void *v103;
  __int16 v104;
  void *v105;
  __int16 v106;
  void *v107;
  uint64_t v108;

  v108 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend_CKClientSuitableError(a5, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    signpost = self->super.super._signpost;
  else
    signpost = 0;
  v15 = signpost;

  if (v13)
  {
    if (!v15)
      goto LABEL_22;
    if (self)
      v18 = self->super.super._signpost;
    else
      v18 = 0;
    v19 = v18;
    objc_msgSend_log(v19, v20, v21, v22);
    v23 = objc_claimAutoreleasedReturnValue();

    if (self)
      v24 = self->super.super._signpost;
    else
      v24 = 0;
    v25 = v24;
    v29 = objc_msgSend_identifier(v25, v26, v27, v28);

    if ((unint64_t)(v29 - 1) > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v23))
      goto LABEL_21;
    *(_DWORD *)buf = 138412546;
    v101 = v8;
    v102 = 2112;
    v103 = v13;
    v30 = "Record %@ fetched with error: %@";
    v31 = v23;
    v32 = v29;
    v33 = 22;
    goto LABEL_20;
  }
  if (!v15)
    goto LABEL_22;
  if (self)
    v34 = self->super.super._signpost;
  else
    v34 = 0;
  v35 = v34;
  objc_msgSend_log(v35, v36, v37, v38);
  v23 = objc_claimAutoreleasedReturnValue();

  if (self)
    v39 = self->super.super._signpost;
  else
    v39 = 0;
  v40 = v39;
  v44 = objc_msgSend_identifier(v40, v41, v42, v43);

  if ((unint64_t)(v44 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
  {
    *(_DWORD *)buf = 138412290;
    v101 = v8;
    v30 = "Record %@ fetched";
    v31 = v23;
    v32 = v44;
    v33 = 12;
LABEL_20:
    _os_signpost_emit_with_name_impl(&dword_18A5C5000, v31, OS_SIGNPOST_EVENT, v32, "CKQueryOperation", v30, buf, v33);
  }
LABEL_21:

LABEL_22:
  v99[0] = MEMORY[0x1E0C809B0];
  v99[1] = 3221225472;
  v99[2] = sub_18A775214;
  v99[3] = &unk_1E1F645F0;
  v99[4] = self;
  objc_msgSend_countMergeableValueMetrics_(v9, v16, (uint64_t)v99, v17);
  objc_msgSend_recordMatchedBlock_wrapper(self, v45, v46, v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = v48;
  if (v48)
  {
    v53 = (void (**)(void *, id, id, void *))_Block_copy(v48);
  }
  else
  {
    objc_msgSend_recordMatchedBlock(self, v49, v50, v51);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = (void (**)(void *, id, id, void *))_Block_copy(v54);

  }
  if (v53)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v58 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      v73 = v58;
      objc_msgSend_operationID(self, v74, v75, v76);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_recordID(v9, v78, v79, v80);
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_recordChangeTag(v9, v82, v83, v84);
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v101 = v77;
      v102 = 2112;
      v103 = v81;
      v104 = 2112;
      v105 = v85;
      v106 = 2112;
      v107 = v13;
      _os_log_debug_impl(&dword_18A5C5000, v73, OS_LOG_TYPE_DEBUG, "Operation %{public}@ calling out about matched record with ID %@ etag=%@: %@", buf, 0x2Au);

    }
    v53[2](v53, v8, v9, v13);
  }
  else
  {
    objc_msgSend_recordFetchedBlock(self, v55, v56, v57);
    v62 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9 && v62)
    {
      if (ck_log_initialization_predicate != -1)
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      v63 = (void *)ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
      {
        v86 = v63;
        objc_msgSend_operationID(self, v87, v88, v89);
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_recordID(v9, v91, v92, v93);
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_recordChangeTag(v9, v95, v96, v97);
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v101 = v90;
        v102 = 2112;
        v103 = v94;
        v104 = 2112;
        v105 = v98;
        v106 = 2112;
        v107 = v13;
        _os_log_debug_impl(&dword_18A5C5000, v86, OS_LOG_TYPE_DEBUG, "Operation %{public}@ calling out about matched record with ID %@ etag=%@: %@", buf, 0x2Au);

      }
      objc_msgSend_recordFetchedBlock(self, v64, v65, v66);
      v67 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id))v67)[2](v67, v9);

    }
  }
  if (v8 && v13 && (objc_msgSend_canDropItemResultsEarly(self, v59, v60, v61) & 1) == 0)
  {
    objc_msgSend_recordErrors(self, v68, v69, v70);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v71, v72, (uint64_t)v13, (uint64_t)v8);

  }
}

- (void)handleQueryDidFetchCursor:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  CKSignpost *signpost;
  CKSignpost *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  CKSignpost *v13;
  CKSignpost *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  CKSignpost *v19;
  CKSignpost *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  os_signpost_id_t v24;
  void *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void (**v30)(_QWORD, _QWORD);
  NSObject *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  int v36;
  id v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  if (self)
    signpost = self->super.super._signpost;
  else
    signpost = 0;
  v9 = signpost;

  if (v9)
  {
    if (self)
      v13 = self->super.super._signpost;
    else
      v13 = 0;
    v14 = v13;
    objc_msgSend_log(v14, v15, v16, v17);
    v18 = objc_claimAutoreleasedReturnValue();

    if (self)
      v19 = self->super.super._signpost;
    else
      v19 = 0;
    v20 = v19;
    v24 = objc_msgSend_identifier(v20, v21, v22, v23);

    if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      v36 = 138412290;
      v37 = v6;
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v18, OS_SIGNPOST_EVENT, v24, "CKQueryOperation", "Cursor %@ fetched", (uint8_t *)&v36, 0xCu);
    }

  }
  objc_msgSend_queryCursorFetchedBlock(self, v10, v11, v12);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v26 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      v31 = v26;
      objc_msgSend_operationID(self, v32, v33, v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = 138543618;
      v37 = v35;
      v38 = 2112;
      v39 = v6;
      _os_log_debug_impl(&dword_18A5C5000, v31, OS_LOG_TYPE_DEBUG, "Operation %{public}@ calling out about a query cursor %@", (uint8_t *)&v36, 0x16u);

    }
    objc_msgSend_queryCursorFetchedBlock(self, v27, v28, v29);
    v30 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v30)[2](v30, v6);

  }
  v7[2](v7, 0);

}

- (void)fillFromOperationInfo:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t AssetContent;
  const char *v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t AllResults;
  const char *v51;
  uint64_t v52;
  objc_super v53;

  v53.receiver = self;
  v53.super_class = (Class)CKQueryOperation;
  v4 = a3;
  -[CKDatabaseOperation fillFromOperationInfo:](&v53, sel_fillFromOperationInfo_, v4);
  objc_msgSend_query(v4, v5, v6, v7, v53.receiver, v53.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setQuery_(self, v9, (uint64_t)v8, v10);

  objc_msgSend_zoneID(v4, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setZoneID_(self, v15, (uint64_t)v14, v16);

  objc_msgSend_cursor(v4, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setCursor_(self, v21, (uint64_t)v20, v22);

  v26 = objc_msgSend_resultsLimit(v4, v23, v24, v25);
  objc_msgSend_setResultsLimit_(self, v27, v26, v28);
  objc_msgSend_desiredKeys(v4, v29, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDesiredKeys_(self, v33, (uint64_t)v32, v34);

  objc_msgSend_assetTransferOptionsByKey(v4, v35, v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAssetTransferOptionsByKey_(self, v39, (uint64_t)v38, v40);

  AssetContent = objc_msgSend_shouldFetchAssetContent(v4, v41, v42, v43);
  objc_msgSend_setShouldFetchAssetContent_(self, v45, AssetContent, v46);
  AllResults = objc_msgSend_fetchAllResults(v4, v47, v48, v49);

  objc_msgSend_setFetchAllResults_(self, v51, AllResults, v52);
}

+ (SEL)daemonCallbackCompletionSelector
{
  return sel_handleOperationDidCompleteWithCursor_metrics_error_;
}

- (void)setQuery:(CKQuery *)query
{
  objc_setProperty_nonatomic_copy(self, a2, query, 552);
}

- (void)setCursor:(CKQueryCursor *)cursor
{
  objc_setProperty_nonatomic_copy(self, a2, cursor, 560);
}

- (id)recordMatchedBlock_wrapper
{
  return self->_recordMatchedBlock_wrapper;
}

- (void)setRecordMatchedBlock_wrapper:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 616);
}

- (void)setQueryCompletionBlock_wrapper:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 624);
}

- (void)setShouldFetchAssetContent:(BOOL)a3
{
  self->_shouldFetchAssetContent = a3;
}

- (void)setRecordErrors:(id)a3
{
  objc_storeStrong((id *)&self->_recordErrors, a3);
}

- (void)setFetchAllResults:(BOOL)a3
{
  self->_fetchAllResults = a3;
}

- (void)setAssetTransferOptionsByKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 648);
}

@end
