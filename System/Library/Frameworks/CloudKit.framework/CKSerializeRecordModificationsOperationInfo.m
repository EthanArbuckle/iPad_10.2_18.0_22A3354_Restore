@implementation CKSerializeRecordModificationsOperationInfo

- (CKSerializeRecordModificationsOperationInfo)init
{
  CKSerializeRecordModificationsOperationInfo *v2;
  CKSerializeRecordModificationsOperationInfo *v3;
  NSArray *recordsToSave;
  NSArray *recordIDsToDelete;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKSerializeRecordModificationsOperationInfo;
  v2 = -[CKOperationInfo init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    recordsToSave = v2->_recordsToSave;
    v2->_recordsToSave = 0;

    recordIDsToDelete = v3->_recordIDsToDelete;
    v3->_recordIDsToDelete = 0;

  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  const char *v22;
  objc_super v23;

  v4 = a3;
  v5 = (void *)MEMORY[0x18D76DE4C]();
  v23.receiver = self;
  v23.super_class = (Class)CKSerializeRecordModificationsOperationInfo;
  -[CKDatabaseOperationInfo encodeWithCoder:](&v23, sel_encodeWithCoder_, v4);
  objc_msgSend_recordsToSave(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend_recordsToSave(self, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_recordsToSave);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_encodeObject_forKey_(v4, v15, (uint64_t)v13, (uint64_t)v14);

  }
  objc_msgSend_recordIDsToDelete(self, v10, v11, v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend_recordIDsToDelete(self, v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_recordIDsToDelete);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_encodeObject_forKey_(v4, v22, (uint64_t)v20, (uint64_t)v21);

  }
  objc_autoreleasePoolPop(v5);

}

- (CKSerializeRecordModificationsOperationInfo)initWithCoder:(id)a3
{
  id v4;
  CKSerializeRecordModificationsOperationInfo *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  NSArray *recordsToSave;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  NSArray *recordIDsToDelete;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)CKSerializeRecordModificationsOperationInfo;
  v5 = -[CKDatabaseOperationInfo initWithCoder:](&v28, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x18D76DE4C]();
    v7 = (void *)MEMORY[0x1E0C99E60];
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    objc_msgSend_setWithObjects_(v7, v10, v8, v11, v9, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_recordsToSave);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v14, (uint64_t)v12, (uint64_t)v13);
    v15 = objc_claimAutoreleasedReturnValue();
    recordsToSave = v5->_recordsToSave;
    v5->_recordsToSave = (NSArray *)v15;

    v17 = (void *)MEMORY[0x1E0C99E60];
    v18 = objc_opt_class();
    v19 = objc_opt_class();
    objc_msgSend_setWithObjects_(v17, v20, v18, v21, v19, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_recordIDsToDelete);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v24, (uint64_t)v22, (uint64_t)v23);
    v25 = objc_claimAutoreleasedReturnValue();
    recordIDsToDelete = v5->_recordIDsToDelete;
    v5->_recordIDsToDelete = (NSArray *)v25;

    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

- (NSArray)recordsToSave
{
  return self->_recordsToSave;
}

- (void)setRecordsToSave:(id)a3
{
  objc_storeStrong((id *)&self->_recordsToSave, a3);
}

- (NSArray)recordIDsToDelete
{
  return self->_recordIDsToDelete;
}

- (void)setRecordIDsToDelete:(id)a3
{
  objc_storeStrong((id *)&self->_recordIDsToDelete, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordIDsToDelete, 0);
  objc_storeStrong((id *)&self->_recordsToSave, 0);
}

@end
