@implementation CKAcceptSharesOperationInfo

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
  objc_super v11;

  v4 = a3;
  v5 = (void *)MEMORY[0x18D76DE4C]();
  objc_msgSend_shareMetadatasToAccept(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v10, (uint64_t)v9, (uint64_t)CFSTR("ShareMetadatasToAccept"));

  v11.receiver = self;
  v11.super_class = (Class)CKAcceptSharesOperationInfo;
  -[CKDatabaseOperationInfo encodeWithCoder:](&v11, sel_encodeWithCoder_, v4);
  objc_autoreleasePoolPop(v5);

}

- (CKAcceptSharesOperationInfo)initWithCoder:(id)a3
{
  id v4;
  CKAcceptSharesOperationInfo *v5;
  void *v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  NSArray *shareMetadatasToAccept;
  objc_super v17;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CKAcceptSharesOperationInfo;
  v5 = -[CKDatabaseOperationInfo initWithCoder:](&v17, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x18D76DE4C]();
    v7 = (void *)MEMORY[0x1E0C99E60];
    v18[0] = objc_opt_class();
    v18[1] = objc_opt_class();
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v8, (uint64_t)v18, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWithArray_(v7, v10, (uint64_t)v9, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v13, (uint64_t)v12, (uint64_t)CFSTR("ShareMetadatasToAccept"));
    v14 = objc_claimAutoreleasedReturnValue();
    shareMetadatasToAccept = v5->_shareMetadatasToAccept;
    v5->_shareMetadatasToAccept = (NSArray *)v14;

    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

- (int64_t)databaseScope
{
  return 3;
}

- (NSArray)shareMetadatasToAccept
{
  return self->_shareMetadatasToAccept;
}

- (void)setShareMetadatasToAccept:(id)a3
{
  objc_storeStrong((id *)&self->_shareMetadatasToAccept, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareMetadatasToAccept, 0);
}

@end
