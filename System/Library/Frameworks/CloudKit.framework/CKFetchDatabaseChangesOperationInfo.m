@implementation CKFetchDatabaseChangesOperationInfo

- (void)setResultsLimit:(unint64_t)a3
{
  self->_resultsLimit = a3;
}

- (void)setPreviousServerChangeToken:(id)a3
{
  objc_storeStrong((id *)&self->_previousServerChangeToken, a3);
}

- (void)setFetchAllChanges:(BOOL)a3
{
  self->_fetchAllChanges = a3;
}

- (unint64_t)resultsLimit
{
  return self->_resultsLimit;
}

- (CKServerChangeToken)previousServerChangeToken
{
  return self->_previousServerChangeToken;
}

- (CKFetchDatabaseChangesOperationInfo)init
{
  CKFetchDatabaseChangesOperationInfo *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKFetchDatabaseChangesOperationInfo;
  result = -[CKOperationInfo init](&v3, sel_init);
  if (result)
    result->_fetchAllChanges = 1;
  return result;
}

- (CKFetchDatabaseChangesOperationInfo)initWithCoder:(id)a3
{
  id v4;
  CKFetchDatabaseChangesOperationInfo *v5;
  void *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  CKServerChangeToken *previousServerChangeToken;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CKFetchDatabaseChangesOperationInfo;
  v5 = -[CKDatabaseOperationInfo initWithCoder:](&v16, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x18D76DE4C]();
    v7 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v7, (uint64_t)CFSTR("previousServerChangeToken"));
    v9 = objc_claimAutoreleasedReturnValue();
    previousServerChangeToken = v5->_previousServerChangeToken;
    v5->_previousServerChangeToken = (CKServerChangeToken *)v9;

    v5->_resultsLimit = objc_msgSend_decodeIntegerForKey_(v4, v11, (uint64_t)CFSTR("resultsLimit"), v12);
    v5->_fetchAllChanges = objc_msgSend_decodeBoolForKey_(v4, v13, (uint64_t)CFSTR("fetchAllChanges"), v14);
    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

- (BOOL)fetchAllChanges
{
  return self->_fetchAllChanges;
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
  uint64_t v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t AllChanges;
  const char *v20;
  objc_super v21;

  v4 = a3;
  v5 = (void *)MEMORY[0x18D76DE4C]();
  v21.receiver = self;
  v21.super_class = (Class)CKFetchDatabaseChangesOperationInfo;
  -[CKDatabaseOperationInfo encodeWithCoder:](&v21, sel_encodeWithCoder_, v4);
  objc_msgSend_previousServerChangeToken(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v10, (uint64_t)v9, (uint64_t)CFSTR("previousServerChangeToken"));

  v14 = objc_msgSend_resultsLimit(self, v11, v12, v13);
  objc_msgSend_encodeInteger_forKey_(v4, v15, v14, (uint64_t)CFSTR("resultsLimit"));
  AllChanges = objc_msgSend_fetchAllChanges(self, v16, v17, v18);
  objc_msgSend_encodeBool_forKey_(v4, v20, AllChanges, (uint64_t)CFSTR("fetchAllChanges"));
  objc_autoreleasePoolPop(v5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousServerChangeToken, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
