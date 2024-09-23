@implementation CKDQueryOperation

- (CKDQueryOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  CKQueryCursor *v6;
  const char *v7;
  uint64_t v8;
  CKDQueryOperation *v9;
  uint64_t v10;
  CKQuery *query;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  CKQueryCursor *cursor;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  CKQueryCursor *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  const char *v42;
  void *v43;
  uint64_t v44;
  NSSet *desiredKeySet;
  dispatch_group_t v46;
  OS_dispatch_group *fetchRecordsGroup;
  uint64_t v48;
  NSMutableArray *requestInfos;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  NSDictionary *assetTransferOptionsByKey;
  objc_super v55;
  _QWORD v56[2];

  v56[1] = *MEMORY[0x1E0C80C00];
  v6 = (CKQueryCursor *)a3;
  v55.receiver = self;
  v55.super_class = (Class)CKDQueryOperation;
  v9 = -[CKDDatabaseOperation initWithOperationInfo:container:](&v55, sel_initWithOperationInfo_container_, v6, a4);
  if (v9)
  {
    objc_msgSend_query(v6, v7, v8);
    v10 = objc_claimAutoreleasedReturnValue();
    query = v9->_query;
    v9->_query = (CKQuery *)v10;

    objc_msgSend_cursor(v6, v12, v13);
    v14 = objc_claimAutoreleasedReturnValue();
    cursor = v9->_cursor;
    v9->_cursor = (CKQueryCursor *)v14;

    v9->_resultsLimit = objc_msgSend_resultsLimit(v6, v16, v17);
    v20 = v9->_cursor;
    if (!v20)
      v20 = v6;
    objc_msgSend_zoneID(v20, v18, v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v9->_zoneID, v21);

    v9->_shouldFetchAssetContent = objc_msgSend_shouldFetchAssetContent(v6, v22, v23);
    objc_msgSend_desiredKeys(v6, v24, v25);
    v26 = objc_claimAutoreleasedReturnValue();
    if (v26
      && (v29 = (void *)v26,
          objc_msgSend_desiredKeys(v6, v27, v28),
          v30 = (void *)objc_claimAutoreleasedReturnValue(),
          v33 = objc_msgSend_count(v30, v31, v32),
          v30,
          v29,
          !v33))
    {
      v40 = (void *)MEMORY[0x1E0C99E60];
      v56[0] = *MEMORY[0x1E0C94A00];
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v27, (uint64_t)v56, 1);
      v41 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend_desiredKeys(v6, v27, v28);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend_count(v34, v35, v36);

      if (!v37)
      {
LABEL_10:
        v9->_fetchAllResults = objc_msgSend_fetchAllResults(v6, v38, v39);
        v46 = dispatch_group_create();
        fetchRecordsGroup = v9->_fetchRecordsGroup;
        v9->_fetchRecordsGroup = (OS_dispatch_group *)v46;

        v9->_numRequestsSent = 0;
        v48 = objc_opt_new();
        requestInfos = v9->_requestInfos;
        v9->_requestInfos = (NSMutableArray *)v48;

        objc_msgSend_assetTransferOptionsByKey(v6, v50, v51);
        v52 = objc_claimAutoreleasedReturnValue();
        assetTransferOptionsByKey = v9->_assetTransferOptionsByKey;
        v9->_assetTransferOptionsByKey = (NSDictionary *)v52;

        goto LABEL_11;
      }
      v40 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend_desiredKeys(v6, v38, v39);
      v41 = objc_claimAutoreleasedReturnValue();
    }
    v43 = (void *)v41;
    objc_msgSend_setWithArray_(v40, v42, v41);
    v44 = objc_claimAutoreleasedReturnValue();
    desiredKeySet = v9->_desiredKeySet;
    v9->_desiredKeySet = (NSSet *)v44;

    goto LABEL_10;
  }
LABEL_11:

  return v9;
}

- (void)main
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  CKDProtocolTranslator *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  void *v21;
  id v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t AssetContent;
  const char *v31;
  const char *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  BOOL v49;
  const char *v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  const char *v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  const char *v70;
  uint64_t v71;
  NSObject *v72;
  const char *v73;
  uint64_t v74;
  NSObject *v75;
  void *v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  const char *v80;
  void *v81;
  const char *v82;
  char *v83;
  _QWORD block[5];
  _QWORD v85[5];
  id v86;
  id location;
  id v88;
  void *v89;
  _QWORD v90[2];

  v90[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend_query(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v7 = (void *)MEMORY[0x1C3B83E24]();
    v8 = [CKDProtocolTranslator alloc];
    objc_msgSend_container(self, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend_databaseScope(self, v12, v13);
    v16 = (void *)objc_msgSend_initWithContainer_databaseScope_requireContainerScopedUserID_(v8, v15, (uint64_t)v11, v14, 0);

    objc_msgSend_query(self, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = 0;
    objc_msgSend_pQueryFromQuery_error_(v16, v20, (uint64_t)v19, &v88);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v88;

    if (v21)
    {

      objc_autoreleasePoolPop(v7);
      goto LABEL_5;
    }
    v76 = (void *)MEMORY[0x1E0C94FF8];
    v77 = *MEMORY[0x1E0C94B20];
    if (v22)
    {
      objc_msgSend_localizedDescription(v22, v23, v24);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_format_(v76, v79, v77, 1009, CFSTR("Invalid predicate: %@"), v78);
    }
    else
    {
      objc_msgSend_query(self, v23, v24);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_format_(v76, v80, v77, 1000, CFSTR("Unexpected error while encoding query %@"), v78);
    }
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_finishWithError_(self, v82, (uint64_t)v81);

    objc_autoreleasePoolPop(v7);
  }
  else
  {
    objc_msgSend_cursor(self, v5, v6);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
LABEL_5:
      objc_initWeak(&location, self);
      v27 = (void *)objc_opt_new();
      AssetContent = objc_msgSend_shouldFetchAssetContent(self, v28, v29);
      objc_msgSend_setFetchAssetContents_(v27, v31, AssetContent);
      objc_msgSend_setPreserveOrdering_(v27, v32, 1);
      objc_msgSend_desiredKeySet(self, v33, v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setDesiredKeys_(v27, v36, (uint64_t)v35);

      objc_msgSend_query(self, v37, v38);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      if (v41)
      {
        objc_msgSend_query(self, v39, v40);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_recordType(v42, v43, v44);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v47)
        {
LABEL_9:

          goto LABEL_10;
        }
        objc_msgSend_assetTransferOptionsByKey(self, v45, v46);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = v48 == 0;

        if (!v49)
        {
          objc_msgSend_query(self, v50, v51);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_recordType(v41, v52, v53);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v89 = v42;
          objc_msgSend_assetTransferOptionsByKey(self, v54, v55);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          v90[0] = v56;
          objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v57, (uint64_t)v90, &v89, 1);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setAssetTransferOptionsByRecordTypeAndKey_(v27, v59, (uint64_t)v58);

          goto LABEL_9;
        }
      }
LABEL_10:
      v60 = objc_opt_class();
      v61 = MEMORY[0x1E0C809B0];
      v85[0] = MEMORY[0x1E0C809B0];
      v85[1] = 3221225472;
      v85[2] = sub_1BE9C59F0;
      v85[3] = &unk_1E7830A10;
      v85[4] = self;
      objc_copyWeak(&v86, &location);
      objc_msgSend_spawnAndRunOperationOfClass_operationInfo_operationConfigurationBlock_(self, v62, v60, v27, v85);
      objc_msgSend_cursor(self, v63, v64);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_data(v65, v66, v67);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend__sendQueryRequestWithCursor_previousRequestSchedulerInfo_(self, v69, (uint64_t)v68, 0);

      objc_msgSend_fetchRecordsGroup(self, v70, v71);
      v72 = objc_claimAutoreleasedReturnValue();
      objc_msgSend_qualityOfService(self, v73, v74);
      CKGetGlobalQueue();
      v75 = objc_claimAutoreleasedReturnValue();
      block[0] = v61;
      block[1] = 3221225472;
      block[2] = sub_1BEA4A698;
      block[3] = &unk_1E782EA40;
      block[4] = self;
      dispatch_group_notify(v72, v75, block);

      objc_destroyWeak(&v86);
      objc_destroyWeak(&location);
      return;
    }
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v26, *MEMORY[0x1E0C947D8], 12, CFSTR("No query or cursor supplied for query operation"));
    v83 = (char *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_finishWithError_(self, v83, (uint64_t)v83);

  }
}

- (CKQuery)query
{
  return self->_query;
}

- (void)_sendQueryRequestWithCursor:(id)a3 previousRequestSchedulerInfo:(id)a4
{
  id v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  CKDQueryURLRequest *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  void *cursor_limit_requestedFields_zoneID;
  const char *v31;
  uint64_t v32;
  char AssetContent;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  CKDPipeliningInfo *v43;
  const char *v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  const char *v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  BOOL v55;
  char v56;
  NSObject *v57;
  const char *v58;
  uint64_t v59;
  NSObject *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  id v65;
  const char *v66;
  const char *v67;
  const char *v68;
  const char *v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  id v77;
  _QWORD v78[4];
  id v79;
  id v80;
  _QWORD v81[4];
  id v82;
  id v83;
  id v84;
  id v85;
  char v86;
  id from;
  id location;
  _QWORD v89[4];
  id v90;
  uint8_t buf[4];
  id v92;
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  v77 = a3;
  v6 = a4;
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v73 = v6;
  v7 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v92 = v77;
    _os_log_impl(&dword_1BE990000, v7, OS_LOG_TYPE_INFO, "Executing query with cursor %@", buf, 0xCu);
  }
  objc_msgSend_zoneID(self, v8, v9);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_cursor(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend_cursor(self, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_zoneID(v15, v16, v17);
    v18 = objc_claimAutoreleasedReturnValue();

    v76 = (void *)v18;
  }
  if (v77)
  {
    v74 = 0;
  }
  else
  {
    objc_msgSend_query(self, v13, v14);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v19 = [CKDQueryURLRequest alloc];
  v22 = objc_msgSend_resultsLimit(self, v20, v21);
  objc_msgSend_desiredKeySet(self, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allObjects(v25, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  cursor_limit_requestedFields_zoneID = (void *)objc_msgSend_initWithOperation_query_cursor_limit_requestedFields_zoneID_(v19, v29, (uint64_t)self, v74, v77, v22, v28, v76);

  v75 = (void *)objc_opt_new();
  AssetContent = objc_msgSend_shouldFetchAssetContent(self, v31, v32);
  v36 = MEMORY[0x1E0C809B0];
  if ((AssetContent & 1) == 0)
  {
    objc_msgSend_assetTransferOptionsByKey(self, v34, v35);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v89[0] = v36;
    v89[1] = 3221225472;
    v89[2] = sub_1BEA4A388;
    v89[3] = &unk_1E7830948;
    v90 = v75;
    objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v37, v38, (uint64_t)v89);

  }
  if (objc_msgSend_count(v75, v34, v35))
  {
    objc_msgSend_setDesiredAssetKeys_(cursor_limit_requestedFields_zoneID, v39, (uint64_t)v75);
  }
  else
  {
    v41 = objc_msgSend_shouldFetchAssetContent(self, v39, v40);
    objc_msgSend_setShouldFetchAssetContent_(cursor_limit_requestedFields_zoneID, v42, v41);
  }
  v43 = [CKDPipeliningInfo alloc];
  v45 = (void *)objc_msgSend_initWithRequest_operation_(v43, v44, (uint64_t)cursor_limit_requestedFields_zoneID, self);
  objc_msgSend_requestInfos(self, v46, v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v48, v49, (uint64_t)v45);

  objc_initWeak((id *)buf, self);
  objc_initWeak(&location, cursor_limit_requestedFields_zoneID);
  objc_initWeak(&from, v45);
  if (!objc_msgSend_fetchAllResults(self, v50, v51)
    || (objc_msgSend_request(self, v52, v53),
        v54 = (void *)objc_claimAutoreleasedReturnValue(),
        v55 = v54 == 0,
        v54,
        v55))
  {
    v56 = 0;
  }
  else
  {
    objc_msgSend_suspendCallbackQueue(v45, v52, v53);
    v56 = 1;
  }
  objc_msgSend_fetchRecordsGroup(self, v52, v53);
  v57 = objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(v57);

  objc_msgSend_perRequestGroup(v45, v58, v59);
  v60 = objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(v60);

  if (v73)
  {
    objc_msgSend_perRequestGroup(v73, v61, v62);
    v63 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v63 = (uint64_t)dispatch_group_create();
  }
  v64 = (void *)v63;
  v81[0] = v36;
  v81[1] = 3221225472;
  v81[2] = sub_1BE9C1BA4;
  v81[3] = &unk_1E7830998;
  objc_copyWeak(&v83, (id *)buf);
  objc_copyWeak(&v84, &location);
  objc_copyWeak(&v85, &from);
  v65 = v64;
  v82 = v65;
  v86 = v56;
  objc_msgSend_setCompletionBlock_(cursor_limit_requestedFields_zoneID, v66, (uint64_t)v81);
  v78[0] = v36;
  v78[1] = 3221225472;
  v78[2] = sub_1BEA4A62C;
  v78[3] = &unk_1E78309C0;
  objc_copyWeak(&v79, (id *)buf);
  objc_copyWeak(&v80, &from);
  objc_msgSend_setRecordsParsedBlock_(cursor_limit_requestedFields_zoneID, v67, (uint64_t)v78);
  objc_msgSend_setRequest_(self, v68, (uint64_t)cursor_limit_requestedFields_zoneID);
  objc_msgSend_container(self, v69, v70);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_performRequest_(v71, v72, (uint64_t)cursor_limit_requestedFields_zoneID);

  objc_destroyWeak(&v80);
  objc_destroyWeak(&v79);

  objc_destroyWeak(&v85);
  objc_destroyWeak(&v84);
  objc_destroyWeak(&v83);

  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)buf);

}

- (BOOL)shouldFetchAssetContent
{
  return self->_shouldFetchAssetContent;
}

- (CKRecordZoneID)zoneID
{
  return self->_zoneID;
}

- (void)setResultsCursor:(id)a3
{
  objc_storeStrong((id *)&self->_resultsCursor, a3);
}

- (void)setRecordFetcher:(id)a3
{
  objc_storeStrong((id *)&self->_recordFetcher, a3);
}

- (void)setRecordFetchCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 496);
}

- (void)setQueryCursorUpdatedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 504);
}

- (void)setNumRequestsSent:(unint64_t)a3
{
  self->_numRequestsSent = a3;
}

- (unint64_t)resultsLimit
{
  return self->_resultsLimit;
}

- (CKQueryCursor)resultsCursor
{
  return self->_resultsCursor;
}

- (NSMutableArray)requestInfos
{
  return self->_requestInfos;
}

- (CKDRecordFetchAggregator)recordFetcher
{
  return self->_recordFetcher;
}

- (NSString)pipeliningDescription
{
  return (NSString *)CFSTR("fetchAllQueryResults");
}

- (int)operationType
{
  return 220;
}

- (unint64_t)numRequestsSent
{
  return self->_numRequestsSent;
}

- (OS_dispatch_group)fetchRecordsGroup
{
  return self->_fetchRecordsGroup;
}

- (BOOL)fetchAllResults
{
  return self->_fetchAllResults;
}

- (NSSet)desiredKeySet
{
  return self->_desiredKeySet;
}

- (CKQueryCursor)cursor
{
  return self->_cursor;
}

- (NSDictionary)assetTransferOptionsByKey
{
  return self->_assetTransferOptionsByKey;
}

- (id)activityCreate
{
  return _os_activity_create(&dword_1BE990000, "daemon/query", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
}

- (void)_handleRecordResponses:(id)a3 perRequestSchedulerInfo:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  id v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  dispatch_once_t *v15;
  os_log_t *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  const char *v20;
  uint64_t v21;
  NSObject *v22;
  os_log_t v23;
  NSObject *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  id v32;
  _QWORD v33[4];
  id v34;
  CKDQueryOperation *v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  void *v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v32 = a3;
  v6 = a4;
  if ((objc_msgSend_isCancelled(self, v7, v8) & 1) == 0)
  {
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v9 = v32;
    v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v37, v43, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v38;
      v15 = (dispatch_once_t *)MEMORY[0x1E0C95300];
      v16 = (os_log_t *)MEMORY[0x1E0C952B0];
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v38 != v14)
            objc_enumerationMutation(v9);
          v18 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v17);
          objc_msgSend_fetchRecordsGroup(self, v11, v12);
          v19 = objc_claimAutoreleasedReturnValue();
          dispatch_group_enter(v19);

          objc_msgSend_perRequestCallbackGroup(v6, v20, v21);
          v22 = objc_claimAutoreleasedReturnValue();
          dispatch_group_enter(v22);

          if (*v15 != -1)
            dispatch_once(v15, (dispatch_block_t)*MEMORY[0x1E0C952F8]);
          v23 = *v16;
          if (os_log_type_enabled(*v16, OS_LOG_TYPE_DEBUG))
          {
            v24 = v23;
            objc_msgSend_recordID(v18, v25, v26);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v42 = v27;
            _os_log_debug_impl(&dword_1BE990000, v24, OS_LOG_TYPE_DEBUG, "Handling record response for record %@", buf, 0xCu);

          }
          ++v17;
        }
        while (v13 != v17);
        v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v11, (uint64_t)&v37, v43, 16);
      }
      while (v13);
    }

    objc_initWeak((id *)buf, self);
    objc_msgSend_recordFetcher(self, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = sub_1BEA49CC8;
    v33[3] = &unk_1E7830920;
    objc_copyWeak(&v36, (id *)buf);
    v34 = v6;
    v35 = self;
    objc_msgSend_fetchRecords_withPerRecordCompletion_(v30, v31, (uint64_t)v9, v33);

    objc_destroyWeak(&v36);
    objc_destroyWeak((id *)buf);
  }

}

- (void)_handleQueryRequestFinishedWithSchedulerInfo:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  id v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  NSObject *v22;
  const char *v23;
  uint64_t v24;
  NSObject *v25;
  const char *v26;
  uint64_t v27;
  NSObject *v28;
  id v29;
  id v30;
  _QWORD block[5];
  id v32;
  id v33;

  v4 = a3;
  objc_msgSend_request(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRequest_(v4, v8, 0);
  objc_msgSend_resultsCursor(v7, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v14 = objc_alloc(MEMORY[0x1E0C95020]);
    objc_msgSend_resultsCursor(v7, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_zoneID(self, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend_initWithData_zoneID_(v14, v21, (uint64_t)v17, v20);

  }
  objc_msgSend_fetchRecordsGroup(self, v12, v13);
  v22 = objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(v22);

  objc_msgSend_perRequestCallbackGroup(v4, v23, v24);
  v25 = objc_claimAutoreleasedReturnValue();
  objc_msgSend_perRequestCallbackQueue(v4, v26, v27);
  v28 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BE9C26F0;
  block[3] = &unk_1E782E418;
  block[4] = self;
  v32 = v11;
  v33 = v4;
  v29 = v4;
  v30 = v11;
  dispatch_group_notify(v25, v28, block);

}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
  id v4;
  const char *v5;
  objc_super v6;

  v4 = a3;
  objc_msgSend_setRecordFetchCompletionBlock_(self, v5, 0);
  v6.receiver = self;
  v6.super_class = (Class)CKDQueryOperation;
  -[CKDOperation _finishOnCallbackQueueWithError:](&v6, sel__finishOnCallbackQueueWithError_, v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetTransferOptionsByKey, 0);
  objc_storeStrong((id *)&self->_requestInfos, 0);
  objc_storeStrong((id *)&self->_fetchRecordsGroup, 0);
  objc_storeStrong((id *)&self->_recordFetcher, 0);
  objc_storeStrong((id *)&self->_zoneID, 0);
  objc_storeStrong((id *)&self->_desiredKeySet, 0);
  objc_storeStrong(&self->_queryCursorUpdatedBlock, 0);
  objc_storeStrong(&self->_recordFetchCompletionBlock, 0);
  objc_storeStrong((id *)&self->_resultsCursor, 0);
  objc_storeStrong((id *)&self->_cursor, 0);
  objc_storeStrong((id *)&self->_query, 0);
}

- (id)_wrapError:(id)a3 format:(id)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  int isEqualToString;
  id v17;
  id v19;
  const char *v20;
  void *v21;
  const char *v22;
  uint64_t v23;

  v5 = a3;
  v8 = a4;
  if (v5)
  {
    objc_msgSend_domain(v5, v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *MEMORY[0x1E0C94B20];
    if (objc_msgSend_isEqualToString_(v9, v11, *MEMORY[0x1E0C94B20]))
    {

    }
    else
    {
      objc_msgSend_domain(v5, v12, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      isEqualToString = objc_msgSend_isEqualToString_(v14, v15, *MEMORY[0x1E0CB32E8]);

      if (!isEqualToString)
      {
        v19 = objc_alloc(MEMORY[0x1E0CB3940]);
        v21 = (void *)objc_msgSend_initWithFormat_arguments_(v19, v20, (uint64_t)v8, &v23);
        objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E0C94FF8], v22, v10, 1000, v5, CFSTR("%@"), v21);
        v17 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_6;
      }
    }
  }
  v17 = v5;
LABEL_6:

  return v17;
}

- (id)relevantZoneIDs
{
  void *v2;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  if (self->_zoneID)
  {
    v4[0] = self->_zoneID;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], a2, (uint64_t)v4, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = (void *)MEMORY[0x1E0C9AA60];
  }
  return v2;
}

- (id)recordFetchCompletionBlock
{
  return self->_recordFetchCompletionBlock;
}

- (id)queryCursorUpdatedBlock
{
  return self->_queryCursorUpdatedBlock;
}

- (void)setDesiredKeySet:(id)a3
{
  objc_storeStrong((id *)&self->_desiredKeySet, a3);
}

- (void)setShouldFetchAssetContent:(BOOL)a3
{
  self->_shouldFetchAssetContent = a3;
}

- (void)setZoneID:(id)a3
{
  objc_storeStrong((id *)&self->_zoneID, a3);
}

- (void)setFetchAllResults:(BOOL)a3
{
  self->_fetchAllResults = a3;
}

- (void)setFetchRecordsGroup:(id)a3
{
  objc_storeStrong((id *)&self->_fetchRecordsGroup, a3);
}

- (void)setRequestInfos:(id)a3
{
  objc_storeStrong((id *)&self->_requestInfos, a3);
}

- (void)setAssetTransferOptionsByKey:(id)a3
{
  objc_storeStrong((id *)&self->_assetTransferOptionsByKey, a3);
}

- (BOOL)hasCalledQueryCursorUpdatedBlock
{
  return self->_hasCalledQueryCursorUpdatedBlock;
}

- (void)setHasCalledQueryCursorUpdatedBlock:(BOOL)a3
{
  self->_hasCalledQueryCursorUpdatedBlock = a3;
}

@end
