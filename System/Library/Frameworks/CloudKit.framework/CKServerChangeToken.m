@implementation CKServerChangeToken

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
  objc_msgSend_data(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v10, v9, (uint64_t)v8, (uint64_t)CFSTR("ChangeTokenData"));

  objc_autoreleasePoolPop(v4);
}

- (NSData)data
{
  return self->_data;
}

- (BOOL)isEqual:(id)a3
{
  CKServerChangeToken *v4;
  CKServerChangeToken *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  char v14;

  v4 = (CKServerChangeToken *)a3;
  if (self == v4)
  {
    v14 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      objc_msgSend_data(self, v6, v7, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_data(v5, v10, v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = CKObjectsAreBothNilOrEqual(v9, v13);
    }
    else
    {
      v14 = 0;
    }
  }

  return v14;
}

- (CKServerChangeToken)initWithData:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  CKServerChangeToken *v8;
  uint64_t v9;
  NSData *data;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CKServerChangeToken;
  v8 = -[CKServerChangeToken init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend_copy(v4, v5, v6, v7);
    data = v8->_data;
    v8->_data = (NSData *)v9;

  }
  return v8;
}

- (CKServerChangeToken)initWithCoder:(id)a3
{
  id v4;
  CKServerChangeToken *v5;
  void *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  NSData *data;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CKServerChangeToken;
  v5 = -[CKServerChangeToken init](&v12, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x18D76DE4C]();
    v7 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v7, (uint64_t)CFSTR("ChangeTokenData"));
    v9 = objc_claimAutoreleasedReturnValue();
    data = v5->_data;
    v5->_data = (NSData *)v9;

    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

+ (void)initialize
{
  objc_class *v2;
  uint64_t v3;

  v2 = (objc_class *)objc_opt_class();
  v3 = objc_opt_self();
  sub_18A5CEF4C(v3, v2, 0, 0, 0);
}

- (CKServerChangeToken)init
{
  CKException *v2;
  objc_class *v3;
  void *v4;
  const char *v5;
  id v6;

  v2 = [CKException alloc];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend_initWithCode_format_(v2, v5, 12, (uint64_t)CFSTR("You can't call init on %@"), v4);

  objc_exception_throw(v6);
}

- (void)setData_modelMutation:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (id)CKPropertiesDescription
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;

  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_data(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_base64EncodedStringWithOptions_(v5, v6, 0, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v4, v9, (uint64_t)CFSTR("data=%@"), v10, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)description
{
  return (id)((uint64_t (*)(CKServerChangeToken *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKDescription);
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;

  objc_msgSend_data(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_hash(v4, v5, v6, v7);

  return v8;
}

@end
