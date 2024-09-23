@implementation IDSEndpointTransparencyState

- (IDSEndpointTransparencyState)initWithPushToken:(id)a3 verificationState:(int64_t)a4
{
  id v7;
  IDSEndpointTransparencyState *v8;
  IDSEndpointTransparencyState *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IDSEndpointTransparencyState;
  v8 = -[IDSEndpointTransparencyState init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_pushToken, a3);
    v9->_verificationState = a4;
  }

  return v9;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  const char *v13;
  double v14;
  void *v15;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  objc_msgSend_pushToken(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_verificationState(self, v9, v10, v11);
  if ((unint64_t)(v12 + 1) > 2)
    objc_msgSend_stringWithFormat_(v3, v13, (uint64_t)CFSTR("<%@: %p pushToken: %@, verificationState: %@>"), v14, v4, self, v8, CFSTR("Unknown"));
  else
    objc_msgSend_stringWithFormat_(v3, v13, (uint64_t)CFSTR("<%@: %p pushToken: %@, verificationState: %@>"), v14, v4, self, v8, off_1E3C22350[v12 + 1]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  const char *v5;
  double v6;
  char isEqualToEndpointTransparencyState;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    isEqualToEndpointTransparencyState = objc_msgSend_isEqualToEndpointTransparencyState_(self, v5, (uint64_t)v4, v6);
  else
    isEqualToEndpointTransparencyState = 0;

  return isEqualToEndpointTransparencyState;
}

- (BOOL)isEqualToEndpointTransparencyState:(id)a3
{
  void *v3;
  void *v4;
  IDSEndpointTransparencyState *v6;
  const char *v7;
  uint64_t v8;
  double v9;
  IDSEndpointTransparencyState *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  double v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  double v18;
  const char *v19;
  uint64_t v20;
  double v21;
  const char *v22;
  double v23;
  BOOL v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  double v28;

  v6 = (IDSEndpointTransparencyState *)a3;
  v10 = v6;
  if (self == v6)
  {
    v24 = 1;
  }
  else
  {
    if (v6)
    {
      objc_msgSend_pushToken(self, v7, v8, v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_pushToken(v10, v12, v13, v14);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 == v17
        || (objc_msgSend_pushToken(self, v15, v16, v18),
            v3 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend_pushToken(v10, v19, v20, v21),
            v4 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend_isEqual_(v3, v22, (uint64_t)v4, v23)))
      {
        v25 = objc_msgSend_verificationState(self, v15, v16, v18);
        v24 = v25 == objc_msgSend_verificationState(v10, v26, v27, v28);
        if (v11 == v17)
        {
LABEL_10:

          goto LABEL_11;
        }
      }
      else
      {
        v24 = 0;
      }

      goto LABEL_10;
    }
    v24 = 0;
  }
LABEL_11:

  return v24;
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

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IDSEndpointTransparencyState)initWithCoder:(id)a3
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
  uint64_t v14;
  double v15;
  uint64_t v16;
  const char *v17;
  double v18;
  IDSEndpointTransparencyState *v19;

  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v6, v5, v7, CFSTR("PushToken"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v10, v9, v11, CFSTR("VerificationState"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_msgSend_integerValue(v12, v13, v14, v15);
  v19 = (IDSEndpointTransparencyState *)objc_msgSend_initWithPushToken_verificationState_(self, v17, (uint64_t)v8, v18, v16);

  return v19;
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
  void *v11;
  const char *v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  const char *v16;
  double v17;
  const char *v18;
  double v19;
  id v20;

  v4 = a3;
  objc_msgSend_pushToken(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v9, (uint64_t)v8, v10, CFSTR("PushToken"));

  v11 = (void *)MEMORY[0x1E0CB37E8];
  v15 = objc_msgSend_verificationState(self, v12, v13, v14);
  objc_msgSend_numberWithInteger_(v11, v16, v15, v17);
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v18, (uint64_t)v20, v19, CFSTR("VerificationState"));

}

- (NSData)pushToken
{
  return self->_pushToken;
}

- (int64_t)verificationState
{
  return self->_verificationState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pushToken, 0);
}

@end
