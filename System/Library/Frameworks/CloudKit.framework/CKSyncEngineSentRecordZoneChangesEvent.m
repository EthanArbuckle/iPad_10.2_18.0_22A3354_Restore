@implementation CKSyncEngineSentRecordZoneChangesEvent

- (CKSyncEngineSentRecordZoneChangesEvent)initWithSavedRecords:(id)a3 failedRecordSaves:(id)a4 deletedRecordIDs:(id)a5 failedRecordDeletes:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  char v14;
  id v15;
  char v16;
  char v17;
  char v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  CKSyncEngineSentRecordZoneChangesEvent *v22;
  uint64_t v23;
  NSArray *savedRecords;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSArray *failedRecordSaves;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSArray *deletedRecordIDs;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSDictionary *failedRecordDeletes;
  void *v41;
  CKException *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  id v52;
  objc_super v53;
  id v54;
  id v55;
  id v56;
  id v57;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v57 = 0;
  v14 = _CKCheckArgument((uint64_t)"savedRecords", v10, 0, 0, 0, &v57);
  v15 = v57;
  if ((v14 & 1) == 0)
    goto LABEL_8;

  v56 = 0;
  v16 = _CKCheckArgument((uint64_t)"failedRecordSaves", v11, 0, 0, 0, &v56);
  v15 = v56;
  if ((v16 & 1) == 0)
    goto LABEL_8;

  v55 = 0;
  v17 = _CKCheckArgument((uint64_t)"deletedRecordIDs", v12, 0, 0, 0, &v55);
  v15 = v55;
  if ((v17 & 1) == 0
    || (v15,
        v54 = 0,
        v18 = _CKCheckArgument((uint64_t)"failedRecordDeletes", v13, 0, 0, 0, &v54),
        v15 = v54,
        (v18 & 1) == 0))
  {
LABEL_8:
    v41 = v15;
    v42 = [CKException alloc];
    v46 = objc_msgSend_code(v41, v43, v44, v45);
    objc_msgSend_localizedDescription(v41, v47, v48, v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = (id)objc_msgSend_initWithCode_format_(v42, v51, v46, (uint64_t)CFSTR("%@"), v50);

    objc_exception_throw(v52);
  }

  v53.receiver = self;
  v53.super_class = (Class)CKSyncEngineSentRecordZoneChangesEvent;
  v22 = -[CKSyncEngineEvent initInternal](&v53, sel_initInternal);
  if (v22)
  {
    v23 = objc_msgSend_copy(v10, v19, v20, v21);
    savedRecords = v22->_savedRecords;
    v22->_savedRecords = (NSArray *)v23;

    v28 = objc_msgSend_copy(v11, v25, v26, v27);
    failedRecordSaves = v22->_failedRecordSaves;
    v22->_failedRecordSaves = (NSArray *)v28;

    v33 = objc_msgSend_copy(v12, v30, v31, v32);
    deletedRecordIDs = v22->_deletedRecordIDs;
    v22->_deletedRecordIDs = (NSArray *)v33;

    v38 = objc_msgSend_copy(v13, v35, v36, v37);
    failedRecordDeletes = v22->_failedRecordDeletes;
    v22->_failedRecordDeletes = (NSDictionary *)v38;

  }
  return v22;
}

- (int64_t)type
{
  return 5;
}

- (void)CKDescribePropertiesUsing:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)CKSyncEngineSentRecordZoneChangesEvent;
  v4 = a3;
  -[CKSyncEngineEvent CKDescribePropertiesUsing:](&v28, sel_CKDescribePropertiesUsing_, v4);
  objc_msgSend_savedRecords(self, v5, v6, v7, v28.receiver, v28.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKMap_(v8, v9, (uint64_t)&unk_1E1F5FC50, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_addProperty_value_shouldRedact_(v4, v12, (uint64_t)CFSTR("savedRecords"), (uint64_t)v11, 0);
  objc_msgSend_failedRecordSaves(self, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addProperty_value_shouldRedact_(v4, v17, (uint64_t)CFSTR("failedRecordSaves"), (uint64_t)v16, 0);

  objc_msgSend_deletedRecordIDs(self, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addProperty_value_shouldRedact_(v4, v22, (uint64_t)CFSTR("deletedRecordIDs"), (uint64_t)v21, 0);

  objc_msgSend_failedRecordDeletes(self, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addProperty_value_shouldRedact_(v4, v27, (uint64_t)CFSTR("failedRecordDeletes"), (uint64_t)v26, 0);

}

- (NSArray)savedRecords
{
  return self->_savedRecords;
}

- (NSArray)failedRecordSaves
{
  return self->_failedRecordSaves;
}

- (NSArray)deletedRecordIDs
{
  return self->_deletedRecordIDs;
}

- (NSDictionary)failedRecordDeletes
{
  return self->_failedRecordDeletes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_failedRecordDeletes, 0);
  objc_storeStrong((id *)&self->_deletedRecordIDs, 0);
  objc_storeStrong((id *)&self->_failedRecordSaves, 0);
  objc_storeStrong((id *)&self->_savedRecords, 0);
}

@end
