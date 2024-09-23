@implementation CKDArchiveRecordsOperation

- (CKDArchiveRecordsOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  CKDArchiveRecordsOperation *v9;
  uint64_t v10;
  NSArray *recordIDs;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CKDArchiveRecordsOperation;
  v9 = -[CKDDatabaseOperation initWithOperationInfo:container:](&v13, sel_initWithOperationInfo_container_, v6, a4);
  if (v9)
  {
    objc_msgSend_recordIDs(v6, v7, v8);
    v10 = objc_claimAutoreleasedReturnValue();
    recordIDs = v9->_recordIDs;
    v9->_recordIDs = (NSArray *)v10;

  }
  return v9;
}

- (id)activityCreate
{
  return _os_activity_create(&dword_1BE990000, "daemon/archive-records", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
  id v4;
  const char *v5;
  objc_super v6;

  v4 = a3;
  objc_msgSend_setRecordArchivedBlock_(self, v5, 0);
  v6.receiver = self;
  v6.super_class = (Class)CKDArchiveRecordsOperation;
  -[CKDOperation _finishOnCallbackQueueWithError:](&v6, sel__finishOnCallbackQueueWithError_, v4);

}

- (void)_handleRecordArchived:(id)a3 responseCode:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  int v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  NSObject *v39;
  id v40;
  id v41;
  _QWORD block[5];
  id v43;
  id v44;
  uint8_t buf[4];
  id v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v10 = objc_msgSend_code(v7, v8, v9);
  v11 = (void *)*MEMORY[0x1E0C952F8];
  v12 = *MEMORY[0x1E0C95300];
  if (v10 == 1)
  {
    if (v12 != -1)
      dispatch_once(MEMORY[0x1E0C95300], v11);
    v13 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v46 = v6;
      _os_log_impl(&dword_1BE990000, v13, OS_LOG_TYPE_INFO, "Record with ID %@ was successfully archived", buf, 0xCu);
    }
    v16 = 0;
  }
  else
  {
    if (v12 != -1)
      dispatch_once(MEMORY[0x1E0C95300], v11);
    v17 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
    {
      v18 = v17;
      objc_msgSend_error(v7, v19, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorDescription(v21, v22, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v46 = v6;
      v47 = 2114;
      v48 = v24;
      _os_log_impl(&dword_1BE990000, v18, OS_LOG_TYPE_INFO, "Error archiving record with ID %@: %{public}@", buf, 0x16u);

    }
    v25 = (void *)MEMORY[0x1E0C94FF8];
    v26 = *MEMORY[0x1E0C94B20];
    v27 = sub_1BEB10D5C(v7);
    objc_msgSend_request(self, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1BEB10290(v30, v7);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_error(v7, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorDescription(v34, v35, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_format_(v25, v38, v26, v27, v31, CFSTR("Error archiving record with ID %@: %@"), v6, v37);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend_callbackQueue(self, v14, v15);
  v39 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BEBE7A4C;
  block[3] = &unk_1E782E418;
  block[4] = self;
  v43 = v6;
  v44 = v16;
  v40 = v16;
  v41 = v6;
  dispatch_async(v39, block);

}

- (int)operationType
{
  return 900;
}

- (void)main
{
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  _BOOL4 v9;
  const char *v10;
  NSObject *v11;
  CKDArchiveRecordsURLRequest *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  void *v17;
  uint64_t v18;
  const char *v19;
  NSObject *v20;
  const char *v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  NSObject *v29;
  NSObject *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  _QWORD v37[5];
  _QWORD v38[4];
  NSObject *v39;
  id v40;
  id v41;
  _QWORD v42[4];
  id v43;
  id from;
  _BYTE location[12];
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v3 = (void *)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    v30 = v3;
    objc_msgSend_operationID(self, v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordIDs(self, v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)location = 138543618;
    *(_QWORD *)&location[4] = v33;
    v46 = 2112;
    v47 = v36;
    _os_log_debug_impl(&dword_1BE990000, v30, OS_LOG_TYPE_DEBUG, "Starting archive records operation %{public}@ for record IDs %@", location, 0x16u);

  }
  objc_msgSend_recordIDs(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_count(v6, v7, v8) == 0;

  if (v9)
  {
    objc_msgSend_finishWithError_(self, v10, 0);
  }
  else
  {
    v11 = dispatch_group_create();
    v12 = [CKDArchiveRecordsURLRequest alloc];
    objc_msgSend_recordIDs(self, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend_initWithOperation_recordIDsToArchive_(v12, v16, (uint64_t)self, v15);

    objc_initWeak((id *)location, self);
    objc_initWeak(&from, v17);
    dispatch_group_enter(v11);
    v18 = MEMORY[0x1E0C809B0];
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = sub_1BEBE7E24;
    v42[3] = &unk_1E78370D0;
    objc_copyWeak(&v43, (id *)location);
    objc_msgSend_setRecordArchivedBlock_(v17, v19, (uint64_t)v42);
    v38[0] = v18;
    v38[1] = 3221225472;
    v38[2] = sub_1BEBE7E88;
    v38[3] = &unk_1E7831E10;
    objc_copyWeak(&v40, &from);
    objc_copyWeak(&v41, (id *)location);
    v20 = v11;
    v39 = v20;
    objc_msgSend_setCompletionBlock_(v17, v21, (uint64_t)v38);
    objc_msgSend_setRequest_(self, v22, (uint64_t)v17);
    objc_msgSend_container(self, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_performRequest_(v25, v26, (uint64_t)v17);

    objc_msgSend_callbackQueue(self, v27, v28);
    v29 = objc_claimAutoreleasedReturnValue();
    v37[0] = v18;
    v37[1] = 3221225472;
    v37[2] = sub_1BEBE7F0C;
    v37[3] = &unk_1E782EA40;
    v37[4] = self;
    dispatch_group_notify(v20, v29, v37);

    objc_destroyWeak(&v41);
    objc_destroyWeak(&v40);
    objc_destroyWeak(&v43);
    objc_destroyWeak(&from);
    objc_destroyWeak((id *)location);

  }
}

- (id)relevantZoneIDs
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend_recordIDs(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v3, v4, v5))
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v7 = v3;
    v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v18, v22, 16);
    if (v9)
    {
      v12 = v9;
      v13 = *(_QWORD *)v19;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v19 != v13)
            objc_enumerationMutation(v7);
          objc_msgSend_zoneID(*(void **)(*((_QWORD *)&v18 + 1) + 8 * v14), v10, v11, (_QWORD)v18);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
            objc_msgSend_addObject_(v6, v15, (uint64_t)v16);

          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v18, v22, 16);
      }
      while (v12);
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)recordArchivedBlock
{
  return self->_recordArchivedBlock;
}

- (void)setRecordArchivedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 456);
}

- (NSArray)recordIDs
{
  return self->_recordIDs;
}

- (void)setRecordIDs:(id)a3
{
  objc_storeStrong((id *)&self->_recordIDs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordIDs, 0);
  objc_storeStrong(&self->_recordArchivedBlock, 0);
}

@end
