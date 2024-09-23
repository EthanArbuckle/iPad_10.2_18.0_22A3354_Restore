@implementation CKUploadRequestPersistentStore

- (CKUploadRequestPersistentStore)initWithDatabaseURL:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  dispatch_queue_t v12;
  void *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CKUploadRequestPersistentStore;
  v8 = -[CKUploadRequestPersistentStore init](&v15, sel_init);
  if (v8)
  {
    v9 = objc_msgSend_copy(v4, v5, v6, v7);
    v10 = (void *)*((_QWORD *)v8 + 2);
    *((_QWORD *)v8 + 2) = v9;

    v8[8] = 1;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create("com.apple.cloudkit.uploadrequest.database", v11);
    v13 = (void *)*((_QWORD *)v8 + 3);
    *((_QWORD *)v8 + 3) = v12;

    dispatch_queue_set_specific(*((dispatch_queue_t *)v8 + 3), v8 + 24, (void *)1, 0);
  }

  return (CKUploadRequestPersistentStore *)v8;
}

- (id)lastFetchDate
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = sub_18A6B62C8;
  v9 = sub_18A6B62D8;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_18A6B62E0;
  v4[3] = &unk_1E1F5F880;
  v4[4] = &v5;
  objc_msgSend_readDatabase_async_withCompletionHandler_(self, a2, (uint64_t)v4, 0, &unk_1E1F582D8);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (id)currentUser
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = sub_18A6B62C8;
  v9 = sub_18A6B62D8;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_18A6B64D0;
  v4[3] = &unk_1E1F5F8C8;
  v4[4] = self;
  v4[5] = &v5;
  objc_msgSend_readDatabase_async_withCompletionHandler_(self, a2, (uint64_t)v4, 0, &unk_1E1F5F8E8);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (id)assetRepairMetadata
{
  void *v2;
  NSObject *v3;
  void *v4;
  id v5;
  uint8_t v7[16];
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = sub_18A6B62C8;
  v13 = sub_18A6B62D8;
  v14 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_18A6B6874;
  v8[3] = &unk_1E1F5F8C8;
  v8[4] = self;
  v8[5] = &v9;
  objc_msgSend_readDatabase_async_withCompletionHandler_(self, a2, (uint64_t)v8, 0, &unk_1E1F5F908);
  v2 = (void *)v10[5];
  if (!v2)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v3 = ck_log_facility_data_repair;
    if (os_log_type_enabled((os_log_t)ck_log_facility_data_repair, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_error_impl(&dword_18A5C5000, v3, OS_LOG_TYPE_ERROR, "Failed to get asset repair metadata, return data is inexplicably nil", v7, 2u);
    }
    v4 = (void *)v10[5];
    v10[5] = MEMORY[0x1E0C9AA60];

    v2 = (void *)v10[5];
  }
  v5 = v2;
  _Block_object_dispose(&v9, 8);

  return v5;
}

- (id)packageRepairMetadata
{
  void *v2;
  NSObject *v3;
  void *v4;
  id v5;
  uint8_t v7[16];
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = sub_18A6B62C8;
  v13 = sub_18A6B62D8;
  v14 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_18A6B6DF0;
  v8[3] = &unk_1E1F5F8C8;
  v8[4] = self;
  v8[5] = &v9;
  objc_msgSend_readDatabase_async_withCompletionHandler_(self, a2, (uint64_t)v8, 0, &unk_1E1F58D78);
  v2 = (void *)v10[5];
  if (!v2)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v3 = ck_log_facility_data_repair;
    if (os_log_type_enabled((os_log_t)ck_log_facility_data_repair, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_error_impl(&dword_18A5C5000, v3, OS_LOG_TYPE_ERROR, "Failed to get package repair metadata, return data is inexplicably nil", v7, 2u);
    }
    v4 = (void *)v10[5];
    v10[5] = MEMORY[0x1E0C9AA60];

    v2 = (void *)v10[5];
  }
  v5 = v2;
  _Block_object_dispose(&v9, 8);

  return v5;
}

- (id)metadataForRecordName:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  const char *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  CKUploadRequestPersistentStore *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v4 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = sub_18A6B62C8;
  v20 = sub_18A6B62D8;
  v21 = 0;
  v5 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_18A6B72B4;
  v12[3] = &unk_1E1F5F930;
  v13 = v4;
  v14 = self;
  v15 = &v16;
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = sub_18A6B7504;
  v10[3] = &unk_1E1F5F958;
  v6 = v13;
  v11 = v6;
  objc_msgSend_readDatabase_async_withCompletionHandler_(self, v7, (uint64_t)v12, 0, v10);
  v8 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v8;
}

- (id)sortedDelayedSyncRecordsForDatabase:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  const char *v27;
  uint64_t v28;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;

  v3 = a3;
  objc_msgSend_objectForKeyedSubscript_(v3, v4, (uint64_t)CFSTR("Scheduler"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = sub_18A6B7734;
  v32[3] = &unk_1E1F5F980;
  v8 = v3;
  v33 = v8;
  objc_msgSend_CKFilter_(v6, v9, (uint64_t)v32, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_allKeys(v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend_mutableCopy(v15, v16, v17, v18);
  v23 = v19;
  if (v19)
  {
    v24 = v19;
  }
  else
  {
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v20, v21, v22);
    v24 = (id)objc_claimAutoreleasedReturnValue();
  }
  v25 = v24;

  v30[0] = v7;
  v30[1] = 3221225472;
  v30[2] = sub_18A6B77A0;
  v30[3] = &unk_1E1F5F9A8;
  v31 = v11;
  v26 = v11;
  objc_msgSend_sortUsingComparator_(v25, v27, (uint64_t)v30, v28);

  return v25;
}

- (id)delayedSyncRecordNamesBeforeAndIncludingDate:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  uint8_t v12[8];
  _QWORD v13[5];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v4 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = sub_18A6B62C8;
  v20 = sub_18A6B62D8;
  v21 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_18A6B79B4;
  v13[3] = &unk_1E1F5F930;
  v13[4] = self;
  v5 = v4;
  v14 = v5;
  v15 = &v16;
  objc_msgSend_readDatabase_async_withCompletionHandler_(self, v6, (uint64_t)v13, 0, &unk_1E1F58DD8);
  v7 = (void *)v17[5];
  if (!v7)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v8 = ck_log_facility_data_repair;
    if (os_log_type_enabled((os_log_t)ck_log_facility_data_repair, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      _os_log_error_impl(&dword_18A5C5000, v8, OS_LOG_TYPE_ERROR, "Failed to get record names, return array is inexplicably nil", v12, 2u);
    }
    v9 = (void *)v17[5];
    v17[5] = MEMORY[0x1E0C9AA60];

    v7 = (void *)v17[5];
  }
  v10 = v7;

  _Block_object_dispose(&v16, 8);
  return v10;
}

- (id)delayedSyncRecordNamesAfterDate:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  id v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_18A6B62C8;
  v16 = sub_18A6B62D8;
  v17 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_18A6B7C90;
  v9[3] = &unk_1E1F5F930;
  v9[4] = self;
  v5 = v4;
  v10 = v5;
  v11 = &v12;
  objc_msgSend_readDatabase_async_withCompletionHandler_(self, v6, (uint64_t)v9, 0, &unk_1E1F58E38);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)earliestDelayedSyncDateAfterDate:(id)a3
{
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;

  objc_msgSend_delayedSyncRecordNamesAfterDate_(self, a2, (uint64_t)a3, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v5;
  if (v5)
  {
    objc_msgSend_firstObject(v5, v6, v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_delayedSyncDateForRecord_(self, v11, (uint64_t)v10, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)delayedSyncDateForRecord:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_18A6B62C8;
  v16 = sub_18A6B62D8;
  v17 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_18A6B7FDC;
  v9[3] = &unk_1E1F5F8C8;
  v5 = v4;
  v10 = v5;
  v11 = &v12;
  objc_msgSend_readDatabase_async_withCompletionHandler_(self, v6, (uint64_t)v9, 0, &unk_1E1F58E78);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (int64_t)delayedSyncCountForRecordName:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  int64_t v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_18A6B8234;
  v9[3] = &unk_1E1F5F8C8;
  v5 = v4;
  v10 = v5;
  v11 = &v12;
  objc_msgSend_readDatabase_async_withCompletionHandler_(self, v6, (uint64_t)v9, 0, &unk_1E1F5F9C8);
  v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)syncEngineMetadata
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = sub_18A6B62C8;
  v9 = sub_18A6B62D8;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_18A6B848C;
  v4[3] = &unk_1E1F5F880;
  v4[4] = &v5;
  objc_msgSend_readDatabase_async_withCompletionHandler_(self, a2, (uint64_t)v4, 0, &unk_1E1F58F58);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (void)setLastFetchDate:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_18A6B8630;
  v7[3] = &unk_1E1F5F9F0;
  v8 = v4;
  v5 = v4;
  objc_msgSend_readWriteDatabase_async_withCompletionHandler_(self, v6, (uint64_t)v7, 0, &unk_1E1F58FF8);

}

- (void)setCurrentUser:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_18A6B87D0;
  v7[3] = &unk_1E1F5F9F0;
  v8 = v4;
  v5 = v4;
  objc_msgSend_readWriteDatabase_async_withCompletionHandler_(self, v6, (uint64_t)v7, 0, &unk_1E1F59118);

}

- (void)persistRepairRecord:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  const char *v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  CKUploadRequestPersistentStore *v12;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_18A6B8AB8;
  v10[3] = &unk_1E1F5FA18;
  v11 = v4;
  v12 = self;
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = sub_18A6B8EC8;
  v8[3] = &unk_1E1F5F958;
  v9 = v11;
  v6 = v11;
  objc_msgSend_readWriteDatabase_async_withCompletionHandler_(self, v7, (uint64_t)v10, 0, v8);

}

- (void)deleteRepairRecord:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  const char *v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_18A6B9098;
  v10[3] = &unk_1E1F5F9F0;
  v11 = v4;
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = sub_18A6B9498;
  v8[3] = &unk_1E1F5F958;
  v9 = v11;
  v6 = v11;
  objc_msgSend_readWriteDatabase_async_withCompletionHandler_(self, v7, (uint64_t)v10, 0, v8);

}

- (void)clearRepairRecords
{
  objc_msgSend_readWriteDatabase_async_withCompletionHandler_(self, a2, (uint64_t)&unk_1E1F59218, 0, &unk_1E1F59298);
}

- (void)persistDelayedSyncForRecordName:(id)a3 withDate:(id)a4 increasingCount:(BOOL)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  const char *v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  BOOL v19;

  v8 = a3;
  v9 = a4;
  v10 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_18A6B980C;
  v16[3] = &unk_1E1F5FA60;
  v17 = v8;
  v18 = v9;
  v19 = a5;
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = sub_18A6B9A74;
  v14[3] = &unk_1E1F5F958;
  v15 = v17;
  v11 = v17;
  v12 = v9;
  objc_msgSend_readWriteDatabase_async_withCompletionHandler_(self, v13, (uint64_t)v16, 0, v14);

}

- (void)deleteDelayedSyncForRecordName:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  const char *v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_18A6B9C24;
  v10[3] = &unk_1E1F5F9F0;
  v11 = v4;
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = sub_18A6B9E0C;
  v8[3] = &unk_1E1F5F958;
  v9 = v11;
  v6 = v11;
  objc_msgSend_readWriteDatabase_async_withCompletionHandler_(self, v7, (uint64_t)v10, 0, v8);

}

- (void)clearDelayedSyncRecords
{
  objc_msgSend_readWriteDatabase_async_withCompletionHandler_(self, a2, (uint64_t)&unk_1E1F59418, 0, &unk_1E1F5FA80);
}

- (void)markRecordNameUnrecoverable:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  const char *v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_18A6BA100;
  v10[3] = &unk_1E1F5F9F0;
  v11 = v4;
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = sub_18A6BA1A8;
  v8[3] = &unk_1E1F5F958;
  v9 = v11;
  v6 = v11;
  objc_msgSend_readWriteDatabase_async_withCompletionHandler_(self, v7, (uint64_t)v10, 0, v8);

}

- (void)persistSyncEngineMetadata:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_18A6BA328;
  v7[3] = &unk_1E1F5F9F0;
  v8 = v4;
  v5 = v4;
  objc_msgSend_readWriteDatabase_async_withCompletionHandler_(self, v6, (uint64_t)v7, 0, &unk_1E1F59498);

}

- (void)clearDatabase
{
  objc_msgSend_readWriteDatabase_async_withCompletionHandler_(self, a2, (uint64_t)&unk_1E1F59518, 0, &unk_1E1F59598);
}

- (void)deleteDatabase
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v5;
  _QWORD block[5];

  objc_msgSend_stateQueue(self, a2, v2, v3);
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18A6BA634;
  block[3] = &unk_1E1F5FAA8;
  block[4] = self;
  dispatch_sync(v5, block);

}

- (void)readDatabase:(id)a3 async:(BOOL)a4 withCompletionHandler:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  const char *v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v8 = a3;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_18A6BA828;
  v11[3] = &unk_1E1F5FAD0;
  v12 = v8;
  v9 = v8;
  objc_msgSend_readWriteDatabase_async_withCompletionHandler_(self, v10, (uint64_t)v11, v6, a5);

}

- (id)unarchivedObjectOfClass:(Class)a3 fromData:(id)a4 error:(id *)a5
{
  id v7;
  const char *v8;
  void *v9;
  id v10;
  void *v11;
  id v13[7];

  v13[6] = *(id *)MEMORY[0x1E0C80C00];
  v7 = a4;
  v13[0] = 0;
  objc_msgSend_unarchivedObjectOfClass_fromData_error_(MEMORY[0x1E0CB3710], v8, (uint64_t)a3, (uint64_t)v7, v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v13[0];
  v11 = v10;
  if (a5)
    *a5 = objc_retainAutorelease(v10);

  return v9;
}

- (void)readWriteDatabase:(id)a3 async:(BOOL)a4 withCompletionHandler:(id)a5
{
  _BOOL4 v6;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void (*v13)(void *, _QWORD *);
  void *v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;

  v6 = a4;
  v8 = a3;
  v12 = a5;
  if (v6)
    v13 = (void (*)(void *, _QWORD *))MEMORY[0x1E0C82C00];
  else
    v13 = (void (*)(void *, _QWORD *))MEMORY[0x1E0C82F90];
  objc_msgSend_stateQueue(self, v9, v10, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = sub_18A6BAB94;
  v17[3] = &unk_1E1F5FAF8;
  v17[4] = self;
  v18 = v12;
  v19 = v8;
  v15 = v8;
  v16 = v12;
  v13(v14, v17);

}

+ (id)repairRecordToMetadata:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  int isEqualToString;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  CKRecordZoneID *v33;
  const char *v34;
  void *v35;
  CKRecordID *v36;
  const char *v37;
  void *v38;
  CKAssetUploadRequestMetadata *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  int v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  CKRecordZoneID *v72;
  void *v73;
  const char *v74;
  CKRecordID *v75;
  void *v76;
  const char *v77;
  CKPackageUploadRequestMetadata *v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  const char *v82;
  void *v83;
  uint64_t v84;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  void *v89;
  void *v90;

  v3 = a3;
  objc_msgSend_recordType(v3, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v7, v8, (uint64_t)CFSTR("MissingAsset"), v9);

  if (isEqualToString)
  {
    objc_msgSend_objectForKeyedSubscript_(v3, v11, (uint64_t)CFSTR("zone"), v13);
    v14 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v3, v15, (uint64_t)CFSTR("affectedRecordID"), v16);
    v17 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v3, v18, (uint64_t)CFSTR("affectedRecordType"), v19);
    v20 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v3, v21, (uint64_t)CFSTR("fieldName"), v22);
    v23 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v3, v24, (uint64_t)CFSTR("fileSignature"), v25);
    v26 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v3, v27, (uint64_t)CFSTR("referenceSignature"), v28);
    v29 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v3, v30, (uint64_t)CFSTR("listIndex"), v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = [CKRecordZoneID alloc];
    v89 = (void *)v14;
    v35 = (void *)objc_msgSend_initWithZoneName_ownerName_(v33, v34, v14, (uint64_t)CFSTR("__defaultOwner__"));
    v36 = [CKRecordID alloc];
    v88 = (void *)v17;
    v38 = (void *)objc_msgSend_initWithRecordName_zoneID_(v36, v37, v17, (uint64_t)v35);
    v39 = [CKAssetUploadRequestMetadata alloc];
    objc_msgSend_recordID(v3, v40, v41, v42);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v90 = (void *)v29;
    if (v32)
    {
      v47 = objc_msgSend_integerValue(v32, v43, v44, v45);
      v86 = v29;
      v48 = (void *)v20;
      v49 = v20;
      v50 = (void *)v26;
      v52 = objc_msgSend_initWithRepairZoneRecordID_databaseScope_recordID_recordType_fieldName_fileSignature_referenceSignature_listIndex_(v39, v51, (uint64_t)v46, 2, v38, v49, v23, v26, v86, v47);
    }
    else
    {
      v87 = v29;
      v48 = (void *)v20;
      v84 = v20;
      v50 = (void *)v26;
      v52 = objc_msgSend_initWithRepairZoneRecordID_databaseScope_recordID_recordType_fieldName_fileSignature_referenceSignature_(v39, v43, (uint64_t)v46, 2, v38, v84, v23, v26, v87);
    }
    v83 = (void *)v52;
    v67 = (void *)v23;

    v76 = v88;
    v73 = v89;
    goto LABEL_9;
  }
  objc_msgSend_recordType(v3, v11, v12, v13);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = objc_msgSend_isEqualToString_(v53, v54, (uint64_t)CFSTR("MissingPackage"), v55);

  if (v56)
  {
    objc_msgSend_objectForKeyedSubscript_(v3, v57, (uint64_t)CFSTR("zone"), v58);
    v59 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v3, v60, (uint64_t)CFSTR("affectedRecordID"), v61);
    v62 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v3, v63, (uint64_t)CFSTR("affectedRecordType"), v64);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v3, v65, (uint64_t)CFSTR("fieldName"), v66);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v3, v68, (uint64_t)CFSTR("fileSignature"), v69);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v3, v70, (uint64_t)CFSTR("referenceSignature"), v71);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = [CKRecordZoneID alloc];
    v73 = (void *)v59;
    v32 = (void *)objc_msgSend_initWithZoneName_ownerName_(v72, v74, v59, (uint64_t)CFSTR("__defaultOwner__"));
    v75 = [CKRecordID alloc];
    v76 = (void *)v62;
    v35 = (void *)objc_msgSend_initWithRecordName_zoneID_(v75, v77, v62, (uint64_t)v32);
    v78 = [CKPackageUploadRequestMetadata alloc];
    objc_msgSend_recordID(v3, v79, v80, v81);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = (void *)objc_msgSend_initWithRepairZoneRecordID_databaseScope_recordID_recordType_fieldName_fileSignatures_referenceSignatures_(v78, v82, (uint64_t)v38, 2, v35, v48, v67, v50, v90);
LABEL_9:

    goto LABEL_10;
  }
  v83 = 0;
LABEL_10:

  return v83;
}

- (id)allData
{
  void *v2;
  NSObject *v3;
  void *v4;
  id v5;
  uint8_t v7[8];
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = sub_18A6B62C8;
  v13 = sub_18A6B62D8;
  v14 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_18A6BB534;
  v8[3] = &unk_1E1F5F880;
  v8[4] = &v9;
  objc_msgSend_readDatabase_async_withCompletionHandler_(self, a2, (uint64_t)v8, 0, &unk_1E1F5FB18);
  v2 = (void *)v10[5];
  if (!v2)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v3 = ck_log_facility_data_repair;
    if (os_log_type_enabled((os_log_t)ck_log_facility_data_repair, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_error_impl(&dword_18A5C5000, v3, OS_LOG_TYPE_ERROR, "Data is inexplicably nil", v7, 2u);
    }
    v4 = (void *)v10[5];
    v10[5] = MEMORY[0x1E0C9AA70];

    v2 = (void *)v10[5];
  }
  v5 = v2;
  _Block_object_dispose(&v9, 8);

  return v5;
}

- (NSURL)databaseURL
{
  return self->_databaseURL;
}

- (BOOL)firstInvocation
{
  return self->_firstInvocation;
}

- (void)setFirstInvocation:(BOOL)a3
{
  self->_firstInvocation = a3;
}

- (OS_dispatch_queue)stateQueue
{
  return self->_stateQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateQueue, 0);
  objc_storeStrong((id *)&self->_databaseURL, 0);
}

@end
