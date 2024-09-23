@implementation CKShareAccessRequester

- (CKShareAccessRequester)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKShareAccessRequester;
  return -[CKShareAccessRequester init](&v3, sel_init);
}

- (CKShareAccessRequester)initWithUserIdentity:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  CKShareAccessRequester *v11;
  uint64_t v12;
  CKUserIdentity *userIdentity;

  v4 = a3;
  v11 = (CKShareAccessRequester *)objc_msgSend_init(self, v5, v6, v7);
  if (v11)
  {
    v12 = objc_msgSend_copy(v4, v8, v9, v10);
    userIdentity = v11->_userIdentity;
    v11->_userIdentity = (CKUserIdentity *)v12;

  }
  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;

  v5 = (void *)objc_opt_class();
  v8 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  objc_msgSend_userIdentity(self, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend_initWithUserIdentity_(v8, v13, (uint64_t)v12, v14);

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  CKShareAccessRequester *v4;
  CKShareAccessRequester *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  char isEqual;

  v4 = (CKShareAccessRequester *)a3;
  if (v4 == self)
  {
    isEqual = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      objc_msgSend_userIdentity(self, v6, v7, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_userIdentity(v5, v10, v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      isEqual = objc_msgSend_isEqual_(v9, v14, (uint64_t)v13, v15);
    }
    else
    {
      isEqual = 0;
    }
  }

  return isEqual;
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

  objc_msgSend_userIdentity(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_hash(v4, v5, v6, v7);

  return v8;
}

- (void)CKDescribePropertiesUsing:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  id v9;

  v4 = a3;
  objc_msgSend_userIdentity(self, v5, v6, v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v4, v8, (uint64_t)CFSTR("identity"), (uint64_t)v9, 0);

}

- (NSString)description
{
  return (NSString *)((uint64_t (*)(CKShareAccessRequester *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKUnredactedDescription);
}

- (id)redactedDescription
{
  return (id)((uint64_t (*)(CKShareAccessRequester *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKRedactedDescription);
}

- (NSString)debugDescription
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  objc_super v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v13.receiver = self;
  v13.super_class = (Class)CKShareAccessRequester;
  -[CKShareAccessRequester description](&v13, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_userIdentity(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v9, (uint64_t)CFSTR("[%@ userIdentity=\"%@\"]"), v10, v4, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v11;
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
  objc_msgSend_userIdentity(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v10, v9, (uint64_t)v8, (uint64_t)CFSTR("UserIdentity"));

  objc_autoreleasePoolPop(v4);
}

- (CKShareAccessRequester)initWithCoder:(id)a3
{
  id v4;
  CKShareAccessRequester *v5;
  void *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  CKUserIdentity *userIdentity;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CKShareAccessRequester;
  v5 = -[CKShareAccessRequester init](&v12, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x18D76DE4C]();
    v7 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v7, (uint64_t)CFSTR("UserIdentity"));
    v9 = objc_claimAutoreleasedReturnValue();
    userIdentity = v5->_userIdentity;
    v5->_userIdentity = (CKUserIdentity *)v9;

    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

- (CKUserIdentity)userIdentity
{
  return (CKUserIdentity *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userIdentity, 0);
}

@end
