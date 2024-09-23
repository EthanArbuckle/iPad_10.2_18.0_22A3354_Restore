@implementation CKPublishAssetsOperationInfo

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
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  objc_super v26;

  v4 = a3;
  v5 = (void *)MEMORY[0x18D76DE4C]();
  v26.receiver = self;
  v26.super_class = (Class)CKPublishAssetsOperationInfo;
  -[CKDatabaseOperationInfo encodeWithCoder:](&v26, sel_encodeWithCoder_, v4);
  objc_msgSend_recordIDs(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v10, (uint64_t)v9, (uint64_t)CFSTR("recordIDs"));

  objc_msgSend_fileNamesByAssetFieldNames(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v15, (uint64_t)v14, (uint64_t)CFSTR("fileNamesByAssetFieldNames"));

  v19 = objc_msgSend_requestedTTL(self, v16, v17, v18);
  objc_msgSend_encodeInt64_forKey_(v4, v20, v19, (uint64_t)CFSTR("requestedTTL"));
  v24 = objc_msgSend_URLOptions(self, v21, v22, v23);
  objc_msgSend_encodeInt64_forKey_(v4, v25, v24, (uint64_t)CFSTR("URLOptions"));
  objc_autoreleasePoolPop(v5);

}

- (CKPublishAssetsOperationInfo)initWithCoder:(id)a3
{
  id v4;
  CKPublishAssetsOperationInfo *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  NSArray *recordIDs;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  NSDictionary *fileNamesByAssetFieldNames;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  objc_super v30;

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)CKPublishAssetsOperationInfo;
  v5 = -[CKDatabaseOperationInfo initWithCoder:](&v30, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x18D76DE4C]();
    v7 = (void *)MEMORY[0x1E0C99E60];
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    objc_msgSend_setWithObjects_(v7, v10, v8, v11, v9, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v13, (uint64_t)v12, (uint64_t)CFSTR("recordIDs"));
    v14 = objc_claimAutoreleasedReturnValue();
    recordIDs = v5->_recordIDs;
    v5->_recordIDs = (NSArray *)v14;

    v16 = (void *)MEMORY[0x1E0C99E60];
    v17 = objc_opt_class();
    v18 = objc_opt_class();
    objc_msgSend_setWithObjects_(v16, v19, v17, v20, v18, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v22, (uint64_t)v21, (uint64_t)CFSTR("fileNamesByAssetFieldNames"));
    v23 = objc_claimAutoreleasedReturnValue();
    fileNamesByAssetFieldNames = v5->_fileNamesByAssetFieldNames;
    v5->_fileNamesByAssetFieldNames = (NSDictionary *)v23;

    v5->_requestedTTL = objc_msgSend_decodeInt64ForKey_(v4, v25, (uint64_t)CFSTR("requestedTTL"), v26);
    v5->_URLOptions = objc_msgSend_decodeInt64ForKey_(v4, v27, (uint64_t)CFSTR("URLOptions"), v28);
    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

- (NSArray)recordIDs
{
  return self->_recordIDs;
}

- (void)setRecordIDs:(id)a3
{
  objc_storeStrong((id *)&self->_recordIDs, a3);
}

- (NSDictionary)fileNamesByAssetFieldNames
{
  return self->_fileNamesByAssetFieldNames;
}

- (void)setFileNamesByAssetFieldNames:(id)a3
{
  objc_storeStrong((id *)&self->_fileNamesByAssetFieldNames, a3);
}

- (unint64_t)requestedTTL
{
  return self->_requestedTTL;
}

- (void)setRequestedTTL:(unint64_t)a3
{
  self->_requestedTTL = a3;
}

- (unint64_t)URLOptions
{
  return self->_URLOptions;
}

- (void)setURLOptions:(unint64_t)a3
{
  self->_URLOptions = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileNamesByAssetFieldNames, 0);
  objc_storeStrong((id *)&self->_recordIDs, 0);
}

@end
