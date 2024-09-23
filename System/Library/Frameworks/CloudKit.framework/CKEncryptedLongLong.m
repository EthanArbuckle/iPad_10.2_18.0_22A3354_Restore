@implementation CKEncryptedLongLong

- (CKEncryptedLongLong)initWithLongLong:(int64_t)a3
{
  CKDPRecordFieldValueEncryptedValue *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  CKEncryptedLongLong *v12;
  objc_super v14;

  v5 = objc_alloc_init(CKDPRecordFieldValueEncryptedValue);
  objc_msgSend_setSignedValue_(v5, v6, a3, v7);
  objc_msgSend_data(v5, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14.receiver = self;
  v14.super_class = (Class)CKEncryptedLongLong;
  v12 = -[CKEncryptedData initWithData:](&v14, sel_initWithData_, v11);

  return v12;
}

- (int64_t)longLongValue
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  CKDPRecordFieldValueEncryptedValue *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  int64_t v12;

  objc_msgSend_data(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = [CKDPRecordFieldValueEncryptedValue alloc];
    v8 = (void *)objc_msgSend_initWithData_(v5, v6, (uint64_t)v4, v7);
    v12 = objc_msgSend_signedValue(v8, v9, v10, v11);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)value
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = objc_msgSend_longLongValue(self, a2, v2, v3);
  return (id)objc_msgSend_numberWithLongLong_(v4, v6, v5, v7);
}

@end
