@implementation CKEncryptedString

- (CKEncryptedString)initWithString:(id)a3
{
  id v4;
  char v5;
  id v6;
  CKDPRecordFieldValueEncryptedValue *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  CKEncryptedString *v18;
  void *v20;
  CKException *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  id v31;
  objc_super v32;
  id v33;

  v4 = a3;
  v33 = 0;
  v5 = _CKCheckArgument((uint64_t)"string", v4, 0, 0, 1, &v33);
  v6 = v33;
  if ((v5 & 1) == 0)
  {
    v20 = v6;
    v21 = [CKException alloc];
    v25 = objc_msgSend_code(v20, v22, v23, v24);
    objc_msgSend_localizedDescription(v20, v26, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (id)objc_msgSend_initWithCode_format_(v21, v30, v25, (uint64_t)CFSTR("%@"), v29);

    objc_exception_throw(v31);
  }

  v7 = objc_alloc_init(CKDPRecordFieldValueEncryptedValue);
  v11 = (void *)objc_msgSend_copy(v4, v8, v9, v10);
  objc_msgSend_setStringValue_(v7, v12, (uint64_t)v11, v13);

  objc_msgSend_data(v7, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v32.receiver = self;
  v32.super_class = (Class)CKEncryptedString;
  v18 = -[CKEncryptedData initWithData:](&v32, sel_initWithData_, v17);

  return v18;
}

- (NSString)string
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
  void *v12;

  objc_msgSend_data(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = [CKDPRecordFieldValueEncryptedValue alloc];
    v8 = (void *)objc_msgSend_initWithData_(v5, v6, (uint64_t)v4, v7);
    objc_msgSend_stringValue(v8, v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }

  return (NSString *)v12;
}

@end
