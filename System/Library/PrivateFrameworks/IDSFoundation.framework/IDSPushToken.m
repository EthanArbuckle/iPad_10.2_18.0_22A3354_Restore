@implementation IDSPushToken

+ (IDSPushToken)pushTokenWithData:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  double v7;
  void *v8;

  v4 = a3;
  v5 = objc_alloc((Class)a1);
  v8 = (void *)objc_msgSend_initWithData_withServiceLoggingHint_(v5, v6, (uint64_t)v4, v7, 0);

  return (IDSPushToken *)v8;
}

+ (IDSPushToken)pushTokenWithData:(id)a3 withServiceLoggingHint:(id)a4
{
  id v6;
  id v7;
  id v8;
  const char *v9;
  double v10;
  void *v11;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc((Class)a1);
  v11 = (void *)objc_msgSend_initWithData_withServiceLoggingHint_(v8, v9, (uint64_t)v7, v10, v6);

  return (IDSPushToken *)v11;
}

- (IDSPushToken)initWithData:(id)a3
{
  double v3;

  return (IDSPushToken *)objc_msgSend_initWithData_withServiceLoggingHint_(self, a2, (uint64_t)a3, v3, 0);
}

- (IDSPushToken)initWithData:(id)a3 withServiceLoggingHint:(id)a4
{
  id v7;
  id v8;
  IDSPushToken *v9;
  id *p_isa;
  IDSPushToken *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v13.receiver = self;
    v13.super_class = (Class)IDSPushToken;
    v9 = -[IDSPushToken init](&v13, sel_init);
    p_isa = (id *)&v9->super.isa;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_rawToken, a3);
      objc_storeStrong(p_isa + 2, a4);
    }
    self = p_isa;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)isEqualToPushToken:(id)a3
{
  double v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  double v8;
  void *v9;
  const char *v10;
  double v11;
  char isEqualToData;

  if (self == a3)
    return 1;
  objc_msgSend_rawToken(a3, a2, (uint64_t)a3, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_rawToken(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToData = objc_msgSend_isEqualToData_(v5, v10, (uint64_t)v9, v11);

  return isEqualToData;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  const char *v5;
  double v6;
  char isEqualToPushToken;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    isEqualToPushToken = objc_msgSend_isEqualToPushToken_(self, v5, (uint64_t)v4, v6);
  else
    isEqualToPushToken = 0;

  return isEqualToPushToken;
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

  objc_msgSend_rawToken(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_hash(v4, v5, v6, v7);

  return v8;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  double v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  IDSLoggableDescriptionForTokenOnService(self->_rawToken, self->_serviceLoggingHint);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: %@>"), v7, v4, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IDSPushToken)initWithCoder:(id)a3
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
  IDSPushToken *v15;

  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v6, v5, v7, CFSTR("rawToken"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v10, v9, v11, CFSTR("serviceHint"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (IDSPushToken *)objc_msgSend_initWithData_withServiceLoggingHint_(self, v13, (uint64_t)v8, v14, v12);
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
  objc_msgSend_rawToken(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v9, (uint64_t)v8, v10, CFSTR("rawToken"));

  objc_msgSend_serviceLoggingHint(self, v11, v12, v13);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v14, (uint64_t)v16, v15, CFSTR("serviceHint"));

}

- (NSData)rawToken
{
  return self->_rawToken;
}

- (NSString)serviceLoggingHint
{
  return self->_serviceLoggingHint;
}

- (void)setServiceLoggingHint:(id)a3
{
  objc_storeStrong((id *)&self->_serviceLoggingHint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceLoggingHint, 0);
  objc_storeStrong((id *)&self->_rawToken, 0);
}

@end
