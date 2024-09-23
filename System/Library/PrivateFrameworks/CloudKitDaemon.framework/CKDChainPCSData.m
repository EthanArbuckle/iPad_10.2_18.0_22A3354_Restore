@implementation CKDChainPCSData

- (CKDChainPCSData)initWithPCSData:(id)a3 encryptedPrivateKey:(id)a4
{
  id v7;
  CKDChainPCSData *v8;
  CKDChainPCSData *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CKDChainPCSData;
  v8 = -[CKDPCSData initWithPCSData:](&v11, sel_initWithPCSData_, a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_encryptedChainPCSPrivateKey, a4);

  return v9;
}

- (id)CKPropertiesDescription
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  objc_super v16;

  v3 = (void *)MEMORY[0x1C3B83E24](self, a2);
  v16.receiver = self;
  v16.super_class = (Class)CKDChainPCSData;
  -[CKDPCSData CKPropertiesDescription](&v16, sel_CKPropertiesDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend_mutableCopy(v4, v5, v6);

  objc_msgSend_encryptedChainPCSPrivateKey(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend_encryptedChainPCSPrivateKey(self, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v7, v14, (uint64_t)CFSTR(", encryptedChainPCSPrivateKey=%@"), v13);

  }
  objc_autoreleasePoolPop(v3);
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CKDChainPCSData;
  v4 = -[CKDPCSData copyWithZone:](&v13, sel_copyWithZone_, a3);
  objc_msgSend_encryptedChainPCSPrivateKey(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend_copy(v7, v8, v9);
  objc_msgSend_setEncryptedChainPCSPrivateKey_(v4, v11, (uint64_t)v10);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  objc_super v7;

  v4 = a3;
  v5 = (void *)MEMORY[0x1C3B83E24]();
  v7.receiver = self;
  v7.super_class = (Class)CKDChainPCSData;
  -[CKDPCSData encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  objc_msgSend_encodeObject_forKey_(v4, v6, (uint64_t)self->_encryptedChainPCSPrivateKey, CFSTR("ChainPrivateKey"));
  objc_autoreleasePoolPop(v5);

}

- (CKDChainPCSData)initWithCoder:(id)a3
{
  id v4;
  CKDChainPCSData *v5;
  void *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  CKEncryptedData *encryptedChainPCSPrivateKey;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CKDChainPCSData;
  v5 = -[CKDPCSData initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1C3B83E24]();
    v7 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v7, CFSTR("ChainPrivateKey"));
    v9 = objc_claimAutoreleasedReturnValue();
    encryptedChainPCSPrivateKey = v5->_encryptedChainPCSPrivateKey;
    v5->_encryptedChainPCSPrivateKey = (CKEncryptedData *)v9;

    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

- (CKEncryptedData)encryptedChainPCSPrivateKey
{
  return self->_encryptedChainPCSPrivateKey;
}

- (void)setEncryptedChainPCSPrivateKey:(id)a3
{
  objc_storeStrong((id *)&self->_encryptedChainPCSPrivateKey, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptedChainPCSPrivateKey, 0);
}

@end
