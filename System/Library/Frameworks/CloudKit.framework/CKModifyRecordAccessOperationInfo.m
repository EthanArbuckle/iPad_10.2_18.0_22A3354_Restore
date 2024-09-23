@implementation CKModifyRecordAccessOperationInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  const char *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKModifyRecordAccessOperationInfo;
  v4 = a3;
  -[CKDatabaseOperationInfo encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  objc_msgSend_encodeObject_forKey_(v4, v5, (uint64_t)self->_recordIDsToGrant, (uint64_t)CFSTR("RecordIDsToGrant"), v7.receiver, v7.super_class);
  objc_msgSend_encodeObject_forKey_(v4, v6, (uint64_t)self->_recordIDsToRevoke, (uint64_t)CFSTR("RecordIDsToRevoke"));

}

- (CKModifyRecordAccessOperationInfo)initWithCoder:(id)a3
{
  id v4;
  CKModifyRecordAccessOperationInfo *v5;
  void *v6;
  const char *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  NSArray *recordIDsToGrant;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  NSArray *recordIDsToRevoke;
  objc_super v25;
  _QWORD v26[2];
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)CKModifyRecordAccessOperationInfo;
  v5 = -[CKDatabaseOperationInfo initWithCoder:](&v25, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v27[0] = objc_opt_class();
    v27[1] = objc_opt_class();
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v7, (uint64_t)v27, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWithArray_(v6, v9, (uint64_t)v8, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v12, (uint64_t)v11, (uint64_t)CFSTR("RecordIDsToGrant"));
    v13 = objc_claimAutoreleasedReturnValue();
    recordIDsToGrant = v5->_recordIDsToGrant;
    v5->_recordIDsToGrant = (NSArray *)v13;

    v15 = (void *)MEMORY[0x1E0C99E60];
    v26[0] = objc_opt_class();
    v26[1] = objc_opt_class();
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v16, (uint64_t)v26, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWithArray_(v15, v18, (uint64_t)v17, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v21, (uint64_t)v20, (uint64_t)CFSTR("RecordIDsToRevoke"));
    v22 = objc_claimAutoreleasedReturnValue();
    recordIDsToRevoke = v5->_recordIDsToRevoke;
    v5->_recordIDsToRevoke = (NSArray *)v22;

  }
  return v5;
}

- (NSArray)recordIDsToGrant
{
  return self->_recordIDsToGrant;
}

- (void)setRecordIDsToGrant:(id)a3
{
  objc_storeStrong((id *)&self->_recordIDsToGrant, a3);
}

- (NSArray)recordIDsToRevoke
{
  return self->_recordIDsToRevoke;
}

- (void)setRecordIDsToRevoke:(id)a3
{
  objc_storeStrong((id *)&self->_recordIDsToRevoke, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordIDsToRevoke, 0);
  objc_storeStrong((id *)&self->_recordIDsToGrant, 0);
}

@end
