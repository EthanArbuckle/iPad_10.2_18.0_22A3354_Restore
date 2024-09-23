@implementation IDSCloudKitKeyElectionStore

+ (BOOL)isItemNotFoundError:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  double v6;
  void *v7;
  void *v8;
  const char *v9;
  double v10;
  const char *v11;
  uint64_t v12;
  double v13;
  BOOL v14;

  v3 = a3;
  objc_msgSend_domain(v3, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  sub_19BA18F10();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_isEqualToString_(v7, v9, (uint64_t)v8, v10))
    v14 = objc_msgSend_code(v3, v11, v12, v13) == 11;
  else
    v14 = 0;

  return v14;
}

- (IDSCloudKitKeyElectionStore)initWithDatabase:(id)a3 queue:(id)a4
{
  id v7;
  id v8;
  IDSCloudKitKeyElectionStore *v9;
  IDSCloudKitKeyElectionStore *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IDSCloudKitKeyElectionStore;
  v9 = -[IDSCloudKitKeyElectionStore init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_database, a3);
    objc_storeStrong((id *)&v10->_queue, a4);
  }

  return v10;
}

- (void)fetchAccountIdentityItemWithCompletion:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  double v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  double v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  double v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  double v19;
  void *v20;
  id v21;
  const char *v22;
  double v23;
  _QWORD v24[5];
  id v25;
  uint8_t buf[16];

  v4 = a3;
  objc_msgSend_queue(self, v5, v6, v7);
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  objc_msgSend_accountIdentity(IDSFoundationLog, v9, v10, v11);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B949000, v12, OS_LOG_TYPE_INFO, "Fetching account identity item", buf, 2u);
  }

  objc_msgSend__recordID(self, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_database(self, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = sub_19BA4440C;
  v24[3] = &unk_1E3C1FAC8;
  v24[4] = self;
  v25 = v4;
  v21 = v4;
  objc_msgSend_fetchRecordWithID_completionHandler_(v20, v22, (uint64_t)v16, v23, v24);

}

- (void)removeAccountIdentityItemWithCompletion:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  double v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  double v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  double v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  double v19;
  void *v20;
  id v21;
  const char *v22;
  double v23;
  _QWORD v24[5];
  id v25;
  uint8_t buf[16];

  v4 = a3;
  objc_msgSend_queue(self, v5, v6, v7);
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  objc_msgSend_accountIdentity(IDSFoundationLog, v9, v10, v11);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B949000, v12, OS_LOG_TYPE_INFO, "Fetching account identity item", buf, 2u);
  }

  objc_msgSend__recordID(self, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_database(self, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = sub_19BA44880;
  v24[3] = &unk_1E3C20B80;
  v24[4] = self;
  v25 = v4;
  v21 = v4;
  objc_msgSend_deleteRecordWithID_completionHandler_(v20, v22, (uint64_t)v16, v23, v24);

}

- (void)storeAccountIdentityItem:(id)a3 withCompletion:(id)a4
{
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  double v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  double v15;
  NSObject *v16;
  const char *v17;
  uint64_t v18;
  double v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  double v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  double v27;
  void *v28;
  IDSCKModifyRecordsOperation *v29;
  const char *v30;
  double v31;
  void *v32;
  const char *v33;
  double v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  const char *v39;
  double v40;
  const char *v41;
  uint64_t v42;
  double v43;
  void *v44;
  const char *v45;
  double v46;
  void *v47;
  const char *v48;
  double v49;
  void *v50;
  const char *v51;
  double v52;
  void *v53;
  const char *v54;
  double v55;
  _QWORD v56[5];
  id v57;
  id v58;
  id v59;
  uint8_t buf[16];
  _QWORD v61[2];

  v61[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend_queue(self, v9, v10, v11);
  v12 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v12);

  objc_msgSend_accountIdentity(IDSFoundationLog, v13, v14, v15);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B949000, v16, OS_LOG_TYPE_INFO, "Storing account identity item", buf, 2u);
  }

  if (!v7)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v17, v18, v19);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v47, v48, (uint64_t)a2, v49, self, CFSTR("IDSCloudKitKeyElectionStore.m"), 102, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("item"));

  }
  objc_msgSend_groupName(v7, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v21, v22, v23);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v50, v51, (uint64_t)a2, v52, self, CFSTR("IDSCloudKitKeyElectionStore.m"), 103, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("item.groupName"));

  }
  objc_msgSend_groupID(v7, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v24)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v25, v26, v27);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v53, v54, (uint64_t)a2, v55, self, CFSTR("IDSCloudKitKeyElectionStore.m"), 104, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("item.groupID"));

  }
  objc_msgSend__recordFromItem_(self, v25, (uint64_t)v7, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = [IDSCKModifyRecordsOperation alloc];
  v61[0] = v28;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v30, (uint64_t)v61, v31, 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (void *)objc_msgSend_initWithRecordsToSave_recordIDsToDelete_(v29, v33, (uint64_t)v32, v34, 0);

  v56[0] = MEMORY[0x1E0C809B0];
  v56[1] = 3221225472;
  v56[2] = sub_19BA44C18;
  v56[3] = &unk_1E3C20BA8;
  v56[4] = self;
  v57 = v28;
  v58 = v7;
  v59 = v8;
  v36 = v7;
  v37 = v8;
  v38 = v28;
  objc_msgSend_setModifyRecordsCompletionBlock_(v35, v39, (uint64_t)v56, v40);
  objc_msgSend_database(self, v41, v42, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addOperation_(v44, v45, (uint64_t)v35, v46);

}

- (id)_itemFromRecord:(id)a3 error:(id *)a4
{
  id v5;
  const char *v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  double v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  double v18;
  id v19;
  const char *v20;
  double v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  double v25;
  void *v26;
  IDSCloudKitKeyElectionStoreItem *v27;
  const char *v28;
  double v29;
  const char *v30;
  double v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  double v46;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;

  v5 = a3;
  objc_msgSend_objectForKeyedSubscript_(v5, v6, (uint64_t)CFSTR("kGroupNameKey"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v5, v9, (uint64_t)CFSTR("kGroupIDKey"), v10);
  v11 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v11;
  if (v8 && v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v19 = objc_alloc(MEMORY[0x1E0D1F450]);
      v22 = objc_msgSend_initWithDataRepresentation_(v19, v20, (uint64_t)v15, v21);
      if (v22)
      {
        v26 = (void *)v22;
        v27 = objc_alloc_init(IDSCloudKitKeyElectionStoreItem);
        objc_msgSend_setGroupID_(v27, v28, (uint64_t)v26, v29);
        objc_msgSend_setGroupName_(v27, v30, (uint64_t)v8, v31);

        goto LABEL_14;
      }
      objc_msgSend_accountIdentity(IDSFoundationLog, v23, v24, v25);
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
        sub_19BAF6AC8((uint64_t)v15, v32, v48, v49, v50, v51, v52, v53);
    }
    else
    {
      objc_msgSend_accountIdentity(IDSFoundationLog, v16, v17, v18);
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
        sub_19BAF6B2C((uint64_t)v5, v32, v39, v40, v41, v42, v43, v44);
    }
  }
  else
  {
    objc_msgSend_accountIdentity(IDSFoundationLog, v12, v13, v14);
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
      sub_19BAF6B90((uint64_t)v5, v32, v33, v34, v35, v36, v37, v38);
  }

  if (a4)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v45, (uint64_t)CFSTR("IDSCloudKitKeyElectionStoreErrorDomain"), v46, -1000, 0);
    v27 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v27 = 0;
  }
LABEL_14:

  return v27;
}

- (id)_recordFromItem:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  double v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  double v15;
  void *v16;
  IDSCKRecord *v17;
  const char *v18;
  double v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  double v23;
  void *v24;
  const char *v25;
  double v26;
  const char *v27;
  double v28;

  v4 = a3;
  objc_msgSend_groupID(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dataRepresentation(v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend__recordID(self, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = [IDSCKRecord alloc];
  v20 = (void *)objc_msgSend_initWithRecordType_recordID_(v17, v18, (uint64_t)CFSTR("IDSCloudKitKeyElectionStoreItem"), v19, v16);
  objc_msgSend_groupName(v4, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setObject_forKeyedSubscript_(v20, v25, (uint64_t)v24, v26, CFSTR("kGroupNameKey"));
  objc_msgSend_setObject_forKeyedSubscript_(v20, v27, (uint64_t)v12, v28, CFSTR("kGroupIDKey"));

  return v20;
}

- (id)_recordID
{
  void *v2;
  void *v3;
  const char *v4;
  double v5;
  void *v6;
  IDSCKRecordID *v7;
  const char *v8;
  double v9;
  void *v10;

  v2 = (void *)MEMORY[0x1E0CB3940];
  _IDSEngramKeyElectorVersion();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v2, v4, (uint64_t)CFSTR("%@-%@"), v5, CFSTR("IDSCloudKitKeyElectionStoreItem"), v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = [IDSCKRecordID alloc];
  v10 = (void *)objc_msgSend_initWithRecordName_(v7, v8, (uint64_t)v6, v9);

  return v10;
}

- (IDSCKDatabase)database
{
  return self->_database;
}

- (void)setDatabase:(id)a3
{
  objc_storeStrong((id *)&self->_database, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

@end
