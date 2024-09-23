@implementation CKDFetchUserRecordOperation

- (int)operationType
{
  return 400;
}

- (void)fetchRecordsWithIDs:(id)a3 andFullRecords:(id)a4
{
  id v6;
  id v7;
  CKDFetchUserRecordURLRequest *v8;
  const char *v9;
  void *v10;
  uint64_t v11;
  const char *v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  NSObject *v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id from;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = [CKDFetchUserRecordURLRequest alloc];
  v10 = (void *)objc_msgSend_initWithOperation_(v8, v9, (uint64_t)self);
  objc_initWeak(&location, self);
  objc_initWeak(&from, v10);
  v11 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = sub_1BEBE5D7C;
  v25[3] = &unk_1E7837038;
  objc_copyWeak(&v26, &location);
  objc_msgSend_setRecordFetchedBlock_(v10, v12, (uint64_t)v25);
  v22[0] = v11;
  v22[1] = 3221225472;
  v22[2] = sub_1BEBE5E04;
  v22[3] = &unk_1E782E468;
  objc_copyWeak(&v23, &location);
  objc_copyWeak(&v24, &from);
  objc_msgSend_setCompletionBlock_(v10, v13, (uint64_t)v22);
  objc_msgSend_stateTransitionGroup(self, v14, v15);
  v16 = objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(v16);

  objc_msgSend_setRequest_(self, v17, (uint64_t)v10);
  objc_msgSend_container(self, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_performRequest_(v20, v21, (uint64_t)v10);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&v23);
  objc_destroyWeak(&v26);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

- (void)main
{
  void *v3;
  const char *v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  CKDFetchUserRecordOperation *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v3 = (void *)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    v5 = v3;
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKDescriptionPropertiesWithPublic_private_shouldExpand_(self, v8, 1, 0, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKPropertiesStyleString(v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKDescriptionPropertiesWithPublic_private_shouldExpand_(self, v13, 0, 1, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKPropertiesStyleString(v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138544130;
    v19 = v7;
    v20 = 2048;
    v21 = self;
    v22 = 2114;
    v23 = v12;
    v24 = 2112;
    v25 = v17;
    _os_log_debug_impl(&dword_1BE990000, v5, OS_LOG_TYPE_DEBUG, "Starting fetch user record operation <%{public}@: %p; %{public}@, %@>",
      (uint8_t *)&v18,
      0x2Au);

  }
  objc_msgSend_makeStateTransition_(self, v4, 0);
}

- (id)analyticsPayload
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t AssetContent;
  const char *v18;
  void *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
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
  const char *v34;
  void *v35;
  const char *v36;
  objc_super v38;

  v38.receiver = self;
  v38.super_class = (Class)CKDFetchUserRecordOperation;
  -[CKDDatabaseOperation analyticsPayload](&v38, sel_analyticsPayload);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_recordIDsToFetch(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_count(v7, v8, v9);
  objc_msgSend_numberWithUnsignedInteger_(v4, v11, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v13, (uint64_t)v12, 0x1E784B568);

  v14 = (void *)MEMORY[0x1E0CB37E8];
  AssetContent = objc_msgSend_shouldFetchAssetContent(self, v15, v16);
  objc_msgSend_numberWithBool_(v14, v18, AssetContent);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v20, (uint64_t)v19, 0x1E784B588);

  objc_msgSend_desiredKeySet(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend_count(v23, v24, v25);

  if (v26)
  {
    v29 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend_desiredKeySet(self, v27, v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend_count(v30, v31, v32);
    objc_msgSend_numberWithUnsignedInteger_(v29, v34, v33);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v3, v36, (uint64_t)v35, 0x1E784B5A8);

  }
  return v3;
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
}

@end
