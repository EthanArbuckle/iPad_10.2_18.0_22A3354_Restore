@implementation CKCompleteParticipantVettingOperationInfo

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
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  objc_super v36;

  v4 = a3;
  v5 = (void *)MEMORY[0x18D76DE4C]();
  objc_msgSend_vettingToken(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v10, (uint64_t)v9, (uint64_t)CFSTR("VettingToken"));

  objc_msgSend_vettingEmail(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v15, (uint64_t)v14, (uint64_t)CFSTR("VettingEmail"));

  objc_msgSend_vettingPhone(self, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v20, (uint64_t)v19, (uint64_t)CFSTR("VettingPhone"));

  objc_msgSend_routingKey(self, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v25, (uint64_t)v24, (uint64_t)CFSTR("RoutingKey"));

  objc_msgSend_encryptedKey(self, v26, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v30, (uint64_t)v29, (uint64_t)CFSTR("EncryptedKey"));

  objc_msgSend_baseToken(self, v31, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v35, (uint64_t)v34, (uint64_t)CFSTR("BaseToken"));

  v36.receiver = self;
  v36.super_class = (Class)CKCompleteParticipantVettingOperationInfo;
  -[CKOperationInfo encodeWithCoder:](&v36, sel_encodeWithCoder_, v4);
  objc_autoreleasePoolPop(v5);

}

- (CKCompleteParticipantVettingOperationInfo)initWithCoder:(id)a3
{
  id v4;
  CKCompleteParticipantVettingOperationInfo *v5;
  void *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  NSString *vettingToken;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  NSString *vettingEmail;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  NSString *vettingPhone;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  NSString *routingKey;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  NSData *encryptedKey;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  NSString *baseToken;
  objc_super v32;

  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)CKCompleteParticipantVettingOperationInfo;
  v5 = -[CKOperationInfo initWithCoder:](&v32, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x18D76DE4C]();
    v7 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v7, (uint64_t)CFSTR("VettingToken"));
    v9 = objc_claimAutoreleasedReturnValue();
    vettingToken = v5->_vettingToken;
    v5->_vettingToken = (NSString *)v9;

    v11 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, (uint64_t)CFSTR("VettingEmail"));
    v13 = objc_claimAutoreleasedReturnValue();
    vettingEmail = v5->_vettingEmail;
    v5->_vettingEmail = (NSString *)v13;

    v15 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v16, v15, (uint64_t)CFSTR("VettingPhone"));
    v17 = objc_claimAutoreleasedReturnValue();
    vettingPhone = v5->_vettingPhone;
    v5->_vettingPhone = (NSString *)v17;

    v19 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v20, v19, (uint64_t)CFSTR("RoutingKey"));
    v21 = objc_claimAutoreleasedReturnValue();
    routingKey = v5->_routingKey;
    v5->_routingKey = (NSString *)v21;

    v23 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v24, v23, (uint64_t)CFSTR("EncryptedKey"));
    v25 = objc_claimAutoreleasedReturnValue();
    encryptedKey = v5->_encryptedKey;
    v5->_encryptedKey = (NSData *)v25;

    v27 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v28, v27, (uint64_t)CFSTR("BaseToken"));
    v29 = objc_claimAutoreleasedReturnValue();
    baseToken = v5->_baseToken;
    v5->_baseToken = (NSString *)v29;

    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

- (NSString)vettingToken
{
  return self->_vettingToken;
}

- (void)setVettingToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSString)vettingEmail
{
  return self->_vettingEmail;
}

- (void)setVettingEmail:(id)a3
{
  objc_storeStrong((id *)&self->_vettingEmail, a3);
}

- (NSString)vettingPhone
{
  return self->_vettingPhone;
}

- (void)setVettingPhone:(id)a3
{
  objc_storeStrong((id *)&self->_vettingPhone, a3);
}

- (NSString)routingKey
{
  return self->_routingKey;
}

- (void)setRoutingKey:(id)a3
{
  objc_storeStrong((id *)&self->_routingKey, a3);
}

- (NSData)encryptedKey
{
  return self->_encryptedKey;
}

- (void)setEncryptedKey:(id)a3
{
  objc_storeStrong((id *)&self->_encryptedKey, a3);
}

- (NSString)baseToken
{
  return self->_baseToken;
}

- (void)setBaseToken:(id)a3
{
  objc_storeStrong((id *)&self->_baseToken, a3);
}

- (NSString)displayedHostname
{
  return self->_displayedHostname;
}

- (void)setDisplayedHostname:(id)a3
{
  objc_storeStrong((id *)&self->_displayedHostname, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayedHostname, 0);
  objc_storeStrong((id *)&self->_baseToken, 0);
  objc_storeStrong((id *)&self->_encryptedKey, 0);
  objc_storeStrong((id *)&self->_routingKey, 0);
  objc_storeStrong((id *)&self->_vettingPhone, 0);
  objc_storeStrong((id *)&self->_vettingEmail, 0);
  objc_storeStrong((id *)&self->_vettingToken, 0);
}

@end
