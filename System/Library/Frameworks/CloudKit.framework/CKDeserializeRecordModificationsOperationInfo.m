@implementation CKDeserializeRecordModificationsOperationInfo

- (CKDeserializeRecordModificationsOperationInfo)init
{
  CKDeserializeRecordModificationsOperationInfo *v2;
  CKDeserializeRecordModificationsOperationInfo *v3;
  NSData *serializedModifications;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKDeserializeRecordModificationsOperationInfo;
  v2 = -[CKOperationInfo init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    serializedModifications = v2->_serializedModifications;
    v2->_serializedModifications = 0;

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
  objc_super v16;

  v4 = a3;
  v5 = (void *)MEMORY[0x18D76DE4C]();
  v16.receiver = self;
  v16.super_class = (Class)CKDeserializeRecordModificationsOperationInfo;
  -[CKDatabaseOperationInfo encodeWithCoder:](&v16, sel_encodeWithCoder_, v4);
  objc_msgSend_serializedModifications(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend_serializedModifications(self, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_serializedModifications);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_encodeObject_forKey_(v4, v15, (uint64_t)v13, (uint64_t)v14);

  }
  objc_autoreleasePoolPop(v5);

}

- (CKDeserializeRecordModificationsOperationInfo)initWithCoder:(id)a3
{
  id v4;
  CKDeserializeRecordModificationsOperationInfo *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  NSData *serializedModifications;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CKDeserializeRecordModificationsOperationInfo;
  v5 = -[CKDatabaseOperationInfo initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x18D76DE4C]();
    v7 = objc_opt_class();
    NSStringFromSelector(sel_serializedModifications);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v9, v7, (uint64_t)v8);
    v10 = objc_claimAutoreleasedReturnValue();
    serializedModifications = v5->_serializedModifications;
    v5->_serializedModifications = (NSData *)v10;

    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

- (NSData)serializedModifications
{
  return self->_serializedModifications;
}

- (void)setSerializedModifications:(id)a3
{
  objc_storeStrong((id *)&self->_serializedModifications, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializedModifications, 0);
}

@end
