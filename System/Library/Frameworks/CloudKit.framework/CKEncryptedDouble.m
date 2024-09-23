@implementation CKEncryptedDouble

- (CKEncryptedDouble)initWithDouble:(double)a3
{
  CKDPRecordFieldValueEncryptedValue *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  CKEncryptedDouble *v13;
  objc_super v15;

  v5 = objc_alloc_init(CKDPRecordFieldValueEncryptedValue);
  objc_msgSend_setCkDoubleValue_(v5, v6, v7, v8, a3);
  objc_msgSend_data(v5, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15.receiver = self;
  v15.super_class = (Class)CKEncryptedDouble;
  v13 = -[CKEncryptedData initWithData:](&v15, sel_initWithData_, v12);

  return v13;
}

- (double)ckDoubleValue
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
  double v12;
  double v13;

  objc_msgSend_data(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = [CKDPRecordFieldValueEncryptedValue alloc];
    v8 = (void *)objc_msgSend_initWithData_(v5, v6, (uint64_t)v4, v7);
    objc_msgSend_ckDoubleValue(v8, v9, v10, v11);
    v13 = v12;

  }
  else
  {
    v13 = 0.0;
  }

  return v13;
}

- (id)value
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_ckDoubleValue(self, a2, v2, v3);
  return (id)objc_msgSend_numberWithDouble_(v4, v5, v6, v7);
}

@end
