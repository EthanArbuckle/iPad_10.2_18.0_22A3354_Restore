@implementation CKFetchRecordVersionsOperationInfo

- (CKFetchRecordVersionsOperationInfo)init
{
  CKFetchRecordVersionsOperationInfo *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKFetchRecordVersionsOperationInfo;
  result = -[CKOperationInfo init](&v3, sel_init);
  if (result)
    result->_shouldFetchAssetContent = 1;
  return result;
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
  const char *v7;
  const char *v8;
  const char *v9;
  objc_super v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x18D76DE4C]();
  v10.receiver = self;
  v10.super_class = (Class)CKFetchRecordVersionsOperationInfo;
  -[CKDatabaseOperationInfo encodeWithCoder:](&v10, sel_encodeWithCoder_, v4);
  objc_msgSend_encodeObject_forKey_(v4, v6, (uint64_t)self->_recordIDs, (uint64_t)CFSTR("RecordIDs"));
  objc_msgSend_encodeObject_forKey_(v4, v7, (uint64_t)self->_desiredKeys, (uint64_t)CFSTR("DesiredKeys"));
  objc_msgSend_encodeObject_forKey_(v4, v8, (uint64_t)self->_minimumVersionETag, (uint64_t)CFSTR("MinimumVersionETag"));
  objc_msgSend_encodeBool_forKey_(v4, v9, self->_shouldFetchAssetContent, (uint64_t)CFSTR("shouldFetchAssetContents"));
  objc_autoreleasePoolPop(v5);

}

- (CKFetchRecordVersionsOperationInfo)initWithCoder:(id)a3
{
  id v4;
  CKFetchRecordVersionsOperationInfo *v5;
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
  NSArray *desiredKeys;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  NSString *minimumVersionETag;
  const char *v29;
  uint64_t v30;
  objc_super v32;

  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)CKFetchRecordVersionsOperationInfo;
  v5 = -[CKDatabaseOperationInfo initWithCoder:](&v32, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x18D76DE4C]();
    v7 = (void *)MEMORY[0x1E0C99E60];
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    objc_msgSend_setWithObjects_(v7, v10, v8, v11, v9, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v13, (uint64_t)v12, (uint64_t)CFSTR("RecordIDs"));
    v14 = objc_claimAutoreleasedReturnValue();
    recordIDs = v5->_recordIDs;
    v5->_recordIDs = (NSArray *)v14;

    v16 = (void *)MEMORY[0x1E0C99E60];
    v17 = objc_opt_class();
    v18 = objc_opt_class();
    objc_msgSend_setWithObjects_(v16, v19, v17, v20, v18, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v22, (uint64_t)v21, (uint64_t)CFSTR("DesiredKeys"));
    v23 = objc_claimAutoreleasedReturnValue();
    desiredKeys = v5->_desiredKeys;
    v5->_desiredKeys = (NSArray *)v23;

    v25 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v26, v25, (uint64_t)CFSTR("MinimumVersionETag"));
    v27 = objc_claimAutoreleasedReturnValue();
    minimumVersionETag = v5->_minimumVersionETag;
    v5->_minimumVersionETag = (NSString *)v27;

    v5->_shouldFetchAssetContent = objc_msgSend_decodeBoolForKey_(v4, v29, (uint64_t)CFSTR("shouldFetchAssetContents"), v30);
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

- (NSArray)desiredKeys
{
  return self->_desiredKeys;
}

- (void)setDesiredKeys:(id)a3
{
  objc_storeStrong((id *)&self->_desiredKeys, a3);
}

- (NSString)minimumVersionETag
{
  return self->_minimumVersionETag;
}

- (void)setMinimumVersionETag:(id)a3
{
  objc_storeStrong((id *)&self->_minimumVersionETag, a3);
}

- (BOOL)shouldFetchAssetContent
{
  return self->_shouldFetchAssetContent;
}

- (void)setShouldFetchAssetContent:(BOOL)a3
{
  self->_shouldFetchAssetContent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minimumVersionETag, 0);
  objc_storeStrong((id *)&self->_desiredKeys, 0);
  objc_storeStrong((id *)&self->_recordIDs, 0);
}

@end
