@implementation CRKGenerateIdentityResultObject

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CRKGenerateIdentityResultObject;
  v4 = a3;
  -[CATTaskResultObject encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[CRKGenerateIdentityResultObject certificateData](self, "certificateData", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("certificateData"));

  -[CRKGenerateIdentityResultObject privateKeyData](self, "privateKeyData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("privateKeyData"));

}

- (CRKGenerateIdentityResultObject)initWithCoder:(id)a3
{
  id v4;
  CRKGenerateIdentityResultObject *v5;
  void *v6;
  uint64_t v7;
  NSData *certificateData;
  void *v9;
  uint64_t v10;
  NSData *privateKeyData;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CRKGenerateIdentityResultObject;
  v5 = -[CATTaskResultObject initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("certificateData"));
    v7 = objc_claimAutoreleasedReturnValue();
    certificateData = v5->_certificateData;
    v5->_certificateData = (NSData *)v7;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("privateKeyData"));
    v10 = objc_claimAutoreleasedReturnValue();
    privateKeyData = v5->_privateKeyData;
    v5->_privateKeyData = (NSData *)v10;

  }
  return v5;
}

- (NSData)certificateData
{
  return self->_certificateData;
}

- (void)setCertificateData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSData)privateKeyData
{
  return self->_privateKeyData;
}

- (void)setPrivateKeyData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateKeyData, 0);
  objc_storeStrong((id *)&self->_certificateData, 0);
}

@end
