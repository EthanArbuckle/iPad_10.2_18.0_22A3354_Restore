@implementation __CKDynamicObjCType

- (__CKDynamicObjCType)initWithCode:(int64_t)a3 encoding:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  __CKDynamicObjCType *v10;
  uint64_t v11;
  NSString *encoding;
  objc_super v14;

  v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)__CKDynamicObjCType;
  v10 = -[CKObjCType initWithCode:](&v14, sel_initWithCode_, a3);
  if (v10)
  {
    v11 = objc_msgSend_copy(v6, v7, v8, v9);
    encoding = v10->_encoding;
    v10->_encoding = (NSString *)v11;

  }
  return v10;
}

- (id)encoding
{
  return self->_encoding;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encoding, 0);
}

@end
