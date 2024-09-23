@implementation IDSDestinationPushToken

- (IDSDestinationPushToken)initWithAlias:(id)a3 pushToken:(id)a4
{
  id v7;
  id v8;
  IDSDestinationPushToken *v9;
  IDSDestinationPushToken *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IDSDestinationPushToken;
  v9 = -[IDSDestinationPushToken init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_alias, a3);
    objc_storeStrong((id *)&v10->_pushToken, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IDSDestinationPushToken)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  const char *v6;
  double v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  double v11;
  void *v12;
  const char *v13;
  double v14;
  IDSDestinationPushToken *v15;

  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v6, v5, v7, CFSTR("kIDSDestinationPushTokenAlias"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v10, v9, v11, CFSTR("kIDSDestinationPushTokenPushToken"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (IDSDestinationPushToken *)objc_msgSend_initWithAlias_pushToken_(self, v13, (uint64_t)v8, v14, v12);
  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;
  const char *v11;
  uint64_t v12;
  double v13;
  const char *v14;
  double v15;
  id v16;

  v4 = a3;
  objc_msgSend_alias(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v9, (uint64_t)v8, v10, CFSTR("kIDSDestinationPushTokenAlias"));

  objc_msgSend_pushToken(self, v11, v12, v13);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v14, (uint64_t)v16, v15, CFSTR("kIDSDestinationPushTokenPushToken"));

}

- (id)description
{
  void *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  double v12;
  void *v13;
  void *v14;
  const char *v15;
  double v16;
  void *v17;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  objc_msgSend_alias(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  IDSLoggableDescriptionForHandleOnService(v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pushToken(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  IDSLoggableDescriptionForTokenOnService(v13, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v15, (uint64_t)CFSTR("<%@: %p alias: %@ pushToken: %@>"), v16, v4, self, v9, v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  uint64_t v7;
  double v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  double v12;
  void *v13;
  const char *v14;
  double v15;
  const char *v16;
  uint64_t v17;
  double v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  double v22;
  void *v23;
  const char *v24;
  double v25;
  char isEqual;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend_pushToken(v5, v6, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_pushToken(self, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_isEqual_(v9, v14, (uint64_t)v13, v15))
    {
      objc_msgSend_alias(v5, v16, v17, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_alias(self, v20, v21, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      isEqual = objc_msgSend_isEqual_(v19, v24, (uint64_t)v23, v25);

    }
    else
    {
      isEqual = 0;
    }

  }
  else
  {
    isEqual = 0;
  }

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v2;
  double v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  unint64_t v8;

  objc_msgSend_pushToken(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_hash(v4, v5, v6, v7);

  return v8;
}

- (id)destinationURIs
{
  uint64_t v2;
  double v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  double v8;
  void *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  double v13;
  void *v14;

  objc_msgSend_pushToken(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_alias(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)_IDSCopyIDForTokenWithURI(v5, v9);

  if (v10)
    objc_msgSend_setWithObject_(MEMORY[0x1E0C99E60], v11, (uint64_t)v10, v13);
  else
    objc_msgSend_set(MEMORY[0x1E0C99E60], v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (NSString)alias
{
  return self->_alias;
}

- (NSData)pushToken
{
  return self->_pushToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pushToken, 0);
  objc_storeStrong((id *)&self->_alias, 0);
}

@end
