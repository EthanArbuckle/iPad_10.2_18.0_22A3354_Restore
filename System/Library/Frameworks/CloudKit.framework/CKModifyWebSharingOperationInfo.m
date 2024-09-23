@implementation CKModifyWebSharingOperationInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  const char *v6;
  const char *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKModifyWebSharingOperationInfo;
  v4 = a3;
  -[CKDatabaseOperationInfo encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
  objc_msgSend_encodeObject_forKey_(v4, v5, (uint64_t)self->_recordIDsToShare, (uint64_t)CFSTR("RecordIDsToShare"), v8.receiver, v8.super_class);
  objc_msgSend_encodeObject_forKey_(v4, v6, (uint64_t)self->_recordIDsToUnshare, (uint64_t)CFSTR("RecordIDsToUnshare"));
  objc_msgSend_encodeObject_forKey_(v4, v7, (uint64_t)self->_recordIDsToShareReadWrite, (uint64_t)CFSTR("RecordIDsToShareReadWrite"));

}

- (CKModifyWebSharingOperationInfo)initWithCoder:(id)a3
{
  id v4;
  CKModifyWebSharingOperationInfo *v5;
  void *v6;
  const char *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  NSArray *recordIDsToShare;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  NSArray *recordIDsToUnshare;
  void *v24;
  const char *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  NSArray *recordIDsToShareReadWrite;
  objc_super v34;
  _QWORD v35[2];
  _QWORD v36[2];
  _QWORD v37[3];

  v37[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)CKModifyWebSharingOperationInfo;
  v5 = -[CKDatabaseOperationInfo initWithCoder:](&v34, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v37[0] = objc_opt_class();
    v37[1] = objc_opt_class();
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v7, (uint64_t)v37, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWithArray_(v6, v9, (uint64_t)v8, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v12, (uint64_t)v11, (uint64_t)CFSTR("RecordIDsToShare"));
    v13 = objc_claimAutoreleasedReturnValue();
    recordIDsToShare = v5->_recordIDsToShare;
    v5->_recordIDsToShare = (NSArray *)v13;

    v15 = (void *)MEMORY[0x1E0C99E60];
    v36[0] = objc_opt_class();
    v36[1] = objc_opt_class();
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v16, (uint64_t)v36, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWithArray_(v15, v18, (uint64_t)v17, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v21, (uint64_t)v20, (uint64_t)CFSTR("RecordIDsToUnshare"));
    v22 = objc_claimAutoreleasedReturnValue();
    recordIDsToUnshare = v5->_recordIDsToUnshare;
    v5->_recordIDsToUnshare = (NSArray *)v22;

    v24 = (void *)MEMORY[0x1E0C99E60];
    v35[0] = objc_opt_class();
    v35[1] = objc_opt_class();
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v25, (uint64_t)v35, 2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWithArray_(v24, v27, (uint64_t)v26, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v30, (uint64_t)v29, (uint64_t)CFSTR("RecordIDsToShareReadWrite"));
    v31 = objc_claimAutoreleasedReturnValue();
    recordIDsToShareReadWrite = v5->_recordIDsToShareReadWrite;
    v5->_recordIDsToShareReadWrite = (NSArray *)v31;

  }
  return v5;
}

- (NSArray)recordIDsToShare
{
  return self->_recordIDsToShare;
}

- (void)setRecordIDsToShare:(id)a3
{
  objc_storeStrong((id *)&self->_recordIDsToShare, a3);
}

- (NSArray)recordIDsToUnshare
{
  return self->_recordIDsToUnshare;
}

- (void)setRecordIDsToUnshare:(id)a3
{
  objc_storeStrong((id *)&self->_recordIDsToUnshare, a3);
}

- (NSArray)recordIDsToShareReadWrite
{
  return self->_recordIDsToShareReadWrite;
}

- (void)setRecordIDsToShareReadWrite:(id)a3
{
  objc_storeStrong((id *)&self->_recordIDsToShareReadWrite, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordIDsToShareReadWrite, 0);
  objc_storeStrong((id *)&self->_recordIDsToUnshare, 0);
  objc_storeStrong((id *)&self->_recordIDsToShare, 0);
}

@end
