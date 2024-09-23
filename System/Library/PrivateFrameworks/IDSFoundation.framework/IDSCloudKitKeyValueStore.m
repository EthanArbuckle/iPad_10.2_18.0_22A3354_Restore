@implementation IDSCloudKitKeyValueStore

- (IDSCloudKitKeyValueStore)initWithContainer:(id)a3 queue:(id)a4
{
  id v7;
  id v8;
  IDSCloudKitKeyValueStore *v9;
  IDSCloudKitKeyValueStore *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IDSCloudKitKeyValueStore;
  v9 = -[IDSCloudKitKeyValueStore init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a4);
    objc_storeStrong((id *)&v10->_container, a3);
  }

  return v10;
}

- (void)fetchDataForKey:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  IDSCKRecordID *v8;
  const char *v9;
  double v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  double v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  double v18;
  void *v19;
  id v20;
  const char *v21;
  double v22;
  _QWORD v23[5];
  id v24;

  v6 = a4;
  v7 = a3;
  v8 = [IDSCKRecordID alloc];
  v11 = (void *)objc_msgSend_initWithRecordName_(v8, v9, (uint64_t)v7, v10);

  objc_msgSend_container(self, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_privateCloudDatabase(v15, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = sub_19B9B0310;
  v23[3] = &unk_1E3C1FAC8;
  v23[4] = self;
  v24 = v6;
  v20 = v6;
  objc_msgSend_fetchRecordWithID_completionHandler_(v19, v21, (uint64_t)v11, v22, v23);

}

- (void)setData:(id)a3 forKey:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  IDSCKRecordID *v11;
  const char *v12;
  double v13;
  void *v14;
  IDSCKRecord *v15;
  const char *v16;
  double v17;
  void *v18;
  const char *v19;
  double v20;
  IDSCKModifyRecordsOperation *v21;
  const char *v22;
  double v23;
  void *v24;
  const char *v25;
  double v26;
  void *v27;
  const char *v28;
  double v29;
  id v30;
  const char *v31;
  double v32;
  const char *v33;
  uint64_t v34;
  double v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  double v39;
  void *v40;
  const char *v41;
  double v42;
  uint64_t v43;
  uint64_t v44;
  void (*v45)(uint64_t, uint64_t, uint64_t, void *);
  void *v46;
  IDSCloudKitKeyValueStore *v47;
  id v48;
  _QWORD v49[2];

  v49[1] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = [IDSCKRecordID alloc];
  v14 = (void *)objc_msgSend_initWithRecordName_(v11, v12, (uint64_t)v9, v13);

  v15 = [IDSCKRecord alloc];
  v18 = (void *)objc_msgSend_initWithRecordType_recordID_(v15, v16, (uint64_t)CFSTR("IDSKeyValueStore"), v17, v14);
  objc_msgSend_setObject_forKey_(v18, v19, (uint64_t)v10, v20, CFSTR("kPayloadKey"));

  v21 = [IDSCKModifyRecordsOperation alloc];
  v49[0] = v18;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v22, (uint64_t)v49, v23, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_msgSend_initWithRecordsToSave_recordIDsToDelete_(v21, v25, (uint64_t)v24, v26, 0);

  objc_msgSend_setSavePolicy_(v27, v28, 1, v29);
  v43 = MEMORY[0x1E0C809B0];
  v44 = 3221225472;
  v45 = sub_19B9B062C;
  v46 = &unk_1E3C1FAF0;
  v47 = self;
  v48 = v8;
  v30 = v8;
  objc_msgSend_setModifyRecordsCompletionBlock_(v27, v31, (uint64_t)&v43, v32);
  objc_msgSend_container(self, v33, v34, v35, v43, v44, v45, v46, v47);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_privateCloudDatabase(v36, v37, v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addOperation_(v40, v41, (uint64_t)v27, v42);

}

- (void)fetchObjectForKey:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  double v9;
  _QWORD v10[5];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_19B9B076C;
  v10[3] = &unk_1E3C1FB40;
  v10[4] = self;
  v11 = v6;
  v7 = v6;
  objc_msgSend_fetchDataForKey_completion_(self, v8, (uint64_t)a3, v9, v10);

}

- (void)setObject:(id)a3 forKey:(id)a4 completion:(id)a5
{
  id v8;
  void *v9;
  id v10;
  const char *v11;
  double v12;
  void *v13;
  id v14;
  IDSCloudKitKeyValueStore *v15;
  const char *v16;
  double v17;
  _QWORD v18[5];
  id v19;

  v8 = a5;
  v9 = (void *)MEMORY[0x1E0CB36F8];
  v10 = a4;
  objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(v9, v11, (uint64_t)a3, v12, 0, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = sub_19B9B0924;
  v18[3] = &unk_1E3C1FB68;
  v18[4] = self;
  v19 = v8;
  v14 = v8;
  v15 = self;
  objc_msgSend_setData_forKey_completion_(v15, v16, (uint64_t)v13, v17, v10, v18);

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (IDSCKContainer)container
{
  return self->_container;
}

- (void)setContainer:(id)a3
{
  objc_storeStrong((id *)&self->_container, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
