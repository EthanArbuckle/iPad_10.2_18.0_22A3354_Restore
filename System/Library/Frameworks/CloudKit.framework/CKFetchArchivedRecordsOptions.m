@implementation CKFetchArchivedRecordsOptions

- (CKFetchArchivedRecordsOptions)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKFetchArchivedRecordsOptions;
  return -[CKFetchArchivedRecordsOptions init](&v3, sel_init);
}

+ (id)new
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___CKFetchArchivedRecordsOptions;
  return objc_msgSendSuper2(&v3, "new");
}

- (CKFetchArchivedRecordsOptions)initWithPreviousServerChangeToken:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  CKFetchArchivedRecordsOptions *v8;
  uint64_t v9;
  CKServerChangeToken *previousServerChangeToken;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CKFetchArchivedRecordsOptions;
  v8 = -[CKFetchArchivedRecordsOptions init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend_copy(v4, v5, v6, v7);
    previousServerChangeToken = v8->_previousServerChangeToken;
    v8->_previousServerChangeToken = (CKServerChangeToken *)v9;

  }
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CKFetchArchivedRecordsOptions *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;

  v4 = [CKFetchArchivedRecordsOptions alloc];
  objc_msgSend_previousServerChangeToken(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend_initWithPreviousServerChangeToken_(v4, v9, (uint64_t)v8, v10);

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  id v10;

  v10 = a3;
  v4 = (void *)MEMORY[0x18D76DE4C]();
  objc_msgSend_previousServerChangeToken(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v10, v9, (uint64_t)v8, (uint64_t)CFSTR("previousServerChangeToken"));

  objc_autoreleasePoolPop(v4);
}

- (CKFetchArchivedRecordsOptions)initWithCoder:(id)a3
{
  id v4;
  CKFetchArchivedRecordsOptions *v5;
  void *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  CKServerChangeToken *previousServerChangeToken;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CKFetchArchivedRecordsOptions;
  v5 = -[CKFetchArchivedRecordsOptions init](&v12, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x18D76DE4C]();
    v7 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v7, (uint64_t)CFSTR("previousServerChangeToken"));
    v9 = objc_claimAutoreleasedReturnValue();
    previousServerChangeToken = v5->_previousServerChangeToken;
    v5->_previousServerChangeToken = (CKServerChangeToken *)v9;

    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

- (CKServerChangeToken)previousServerChangeToken
{
  return self->_previousServerChangeToken;
}

- (void)setPreviousServerChangeToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousServerChangeToken, 0);
}

@end
