@implementation CKSyncEngineBatch

+ (void)initialize
{
  objc_class *v2;
  uint64_t v3;

  v2 = (objc_class *)objc_opt_class();
  v3 = objc_opt_self();
  sub_18A5CEF4C(v3, v2, 0, 0, 0);
}

- (CKSyncEngineBatch)initWithRecordsToSave:(id)a3 recordIDsToDelete:(id)a4
{
  id v6;
  id v7;
  CKSyncEngineBatch *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  CKSyncEngineBatch *v12;
  uint64_t v13;
  NSArray *recordsToSave;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSArray *recordIDsToDelete;
  NSArray *savedRecords;
  NSArray *deletedRecordIDs;
  objc_super v23;

  v6 = a3;
  v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)CKSyncEngineBatch;
  v8 = -[CKSyncEngineBatch init](&v23, sel_init);
  v12 = v8;
  if (v8)
  {
    v8->_atomic = 1;
    v13 = objc_msgSend_copy(v6, v9, v10, v11);
    recordsToSave = v12->_recordsToSave;
    v12->_recordsToSave = (NSArray *)v13;

    v18 = objc_msgSend_copy(v7, v15, v16, v17);
    recordIDsToDelete = v12->_recordIDsToDelete;
    v12->_recordIDsToDelete = (NSArray *)v18;

    savedRecords = v12->_savedRecords;
    v12->_savedRecords = 0;

    deletedRecordIDs = v12->_deletedRecordIDs;
    v12->_deletedRecordIDs = 0;

    v12->_customBatch = 0;
  }

  return v12;
}

- (id)description
{
  return (id)((uint64_t (*)(CKSyncEngineBatch *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKDescription);
}

- (id)CKDescriptionPropertiesWithPublic:(BOOL)a3 private:(BOOL)a4 shouldExpand:(BOOL)a5
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  void *v56;
  uint64_t isAtomic;
  const char *v58;
  uint64_t v59;
  void *v60;
  const char *v61;

  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend_recordsToSave(self, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend_count(v10, v11, v12, v13);

  if (v14)
  {
    objc_msgSend_recordsToSave(self, v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKMap_(v18, v19, (uint64_t)&unk_1E1F583B8, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v6, v22, (uint64_t)v21, (uint64_t)CFSTR("recordIDsToSave"));

  }
  objc_msgSend_recordIDsToDelete(self, v15, v16, v17);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend_count(v23, v24, v25, v26);

  if (v27)
  {
    objc_msgSend_recordIDsToDelete(self, v28, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v6, v32, (uint64_t)v31, (uint64_t)CFSTR("recordIDsToDelete"));

  }
  objc_msgSend_savedRecords(self, v28, v29, v30);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend_count(v33, v34, v35, v36);

  if (v37)
  {
    objc_msgSend_savedRecords(self, v38, v39, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKMap_(v41, v42, (uint64_t)&unk_1E1F59618, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v6, v45, (uint64_t)v44, (uint64_t)CFSTR("savedRecordIDs"));

  }
  objc_msgSend_deletedRecordIDs(self, v38, v39, v40);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend_count(v46, v47, v48, v49);

  if (v50)
  {
    objc_msgSend_deletedRecordIDs(self, v51, v52, v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v6, v55, (uint64_t)v54, (uint64_t)CFSTR("deletedRecordIDs"));

  }
  v56 = (void *)MEMORY[0x1E0CB37E8];
  isAtomic = objc_msgSend_isAtomic(self, v51, v52, v53);
  objc_msgSend_numberWithBool_(v56, v58, isAtomic, v59);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v6, v61, (uint64_t)v60, (uint64_t)CFSTR("atomicByZone"));

  return v6;
}

- (NSArray)recordsToSave
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (NSArray)recordIDsToDelete
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (NSArray)savedRecords
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSavedRecords:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (NSArray)deletedRecordIDs
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDeletedRecordIDs:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (BOOL)isAtomic
{
  return self->_atomic;
}

- (void)setAtomic:(BOOL)a3
{
  self->_atomic = a3;
}

- (BOOL)isCustomBatch
{
  return self->_customBatch;
}

- (void)setCustomBatch:(BOOL)a3
{
  self->_customBatch = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deletedRecordIDs, 0);
  objc_storeStrong((id *)&self->_savedRecords, 0);
  objc_storeStrong((id *)&self->_recordIDsToDelete, 0);
  objc_storeStrong((id *)&self->_recordsToSave, 0);
}

@end
