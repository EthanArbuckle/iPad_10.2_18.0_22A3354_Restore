@implementation CKSyncEngineFetchedRecordDeletion

- (CKSyncEngineFetchedRecordDeletion)initWithRecordID:(id)a3 recordType:(id)a4
{
  id v7;
  id v8;
  char v9;
  id v10;
  CKSyncEngineFetchedRecordDeletion *v11;
  CKSyncEngineFetchedRecordDeletion *v12;
  void *v14;
  CKException *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  id v25;
  objc_super v26;
  id v27;

  v7 = a3;
  v8 = a4;
  v27 = 0;
  v9 = _CKCheckArgument((uint64_t)"recordID", v7, 0, 0, 0, &v27);
  v10 = v27;
  if ((v9 & 1) == 0)
  {
    v14 = v10;
    v15 = [CKException alloc];
    v19 = objc_msgSend_code(v14, v16, v17, v18);
    objc_msgSend_localizedDescription(v14, v20, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (id)objc_msgSend_initWithCode_format_(v15, v24, v19, (uint64_t)CFSTR("%@"), v23);

    objc_exception_throw(v25);
  }

  v26.receiver = self;
  v26.super_class = (Class)CKSyncEngineFetchedRecordDeletion;
  v11 = -[CKSyncEngineFetchedRecordDeletion init](&v26, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_recordID, a3);
    objc_storeStrong((id *)&v12->_recordType, a4);
  }

  return v12;
}

- (NSString)description
{
  return (NSString *)((uint64_t (*)(CKSyncEngineFetchedRecordDeletion *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKUnredactedDescription);
}

- (id)redactedDescription
{
  return (id)((uint64_t (*)(CKSyncEngineFetchedRecordDeletion *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKRedactedDescription);
}

- (BOOL)CKDescriptionShouldPrintPointer
{
  return 0;
}

- (id)CKDescriptionClassName
{
  return CFSTR("FetchedRecordDeletion");
}

- (void)CKDescribePropertiesUsing:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  id v14;

  v4 = a3;
  objc_msgSend_recordType(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addProperty_value_shouldRedact_(v4, v9, (uint64_t)CFSTR("recordType"), (uint64_t)v8, 0);

  objc_msgSend_recordID(self, v10, v11, v12);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addProperty_value_shouldRedact_(v4, v13, (uint64_t)CFSTR("recordID"), (uint64_t)v14, 0);

}

- (CKRecordID)recordID
{
  return self->_recordID;
}

- (CKRecordType)recordType
{
  return self->_recordType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordType, 0);
  objc_storeStrong((id *)&self->_recordID, 0);
}

@end
