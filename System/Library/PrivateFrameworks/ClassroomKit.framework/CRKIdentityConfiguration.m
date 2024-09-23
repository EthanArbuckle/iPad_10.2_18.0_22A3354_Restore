@implementation CRKIdentityConfiguration

+ (CRKIdentityConfiguration)configurationWithData:(id)a3
{
  return (CRKIdentityConfiguration *)objc_msgSend(MEMORY[0x24BDD1620], "cat_unarchiveObjectOfClass:withData:", a1, a3);
}

- (CRKIdentityConfiguration)init
{
  void *v3;
  void *v4;
  CRKIdentityConfiguration *v5;

  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CRKIdentityConfiguration initWithCommonName:](self, "initWithCommonName:", v4);

  return v5;
}

- (CRKIdentityConfiguration)initWithCommonName:(id)a3
{
  id v4;
  CRKIdentityConfiguration *v5;
  uint64_t v6;
  NSString *commonName;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKIdentityConfiguration;
  v5 = -[CRKIdentityConfiguration init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    commonName = v5->_commonName;
    v5->_commonName = (NSString *)v6;

    v5->_keySizeInBits = objc_msgSend((id)objc_opt_class(), "defaultKeySizeInBits");
    v5->_createsCertificateAuthority = objc_msgSend((id)objc_opt_class(), "defaultCreatesCertificateAuthority");
    v5->_hashingAlgorithm = objc_msgSend((id)objc_opt_class(), "defaultHashingAlgorithm");
    v5->_addsClientAuthAndServerAuthEKUs = 1;
  }

  return v5;
}

- (NSData)dataRepresentation
{
  return (NSData *)objc_msgSend(MEMORY[0x24BDD1618], "cat_archivedDataWithRootObject:", self);
}

- (NSString)emailAddress
{
  NSString *emailAddress;

  emailAddress = self->_emailAddress;
  if (emailAddress)
    return emailAddress;
  -[CRKIdentityConfiguration commonName](self, "commonName");
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_opt_class();
  -[CRKIdentityConfiguration dataRepresentation](self, "dataRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configurationWithData:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[CRKIdentityConfiguration commonName](self, "commonName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v4, CFSTR("commonName"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[CRKIdentityConfiguration keySizeInBits](self, "keySizeInBits"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v5, CFSTR("keySizeInBits"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[CRKIdentityConfiguration createsCertificateAuthority](self, "createsCertificateAuthority"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v6, CFSTR("createsCertificateAuthority"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[CRKIdentityConfiguration hashingAlgorithm](self, "hashingAlgorithm"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v7, CFSTR("hashingAlgorithm"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[CRKIdentityConfiguration addsClientAuthAndServerAuthEKUs](self, "addsClientAuthAndServerAuthEKUs"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v8, CFSTR("addsClientAuthAndServerAuthEKUs"));

  objc_msgSend(v9, "encodeObject:forKey:", self->_emailAddress, CFSTR("emailAddress"));
}

- (CRKIdentityConfiguration)initWithCoder:(id)a3
{
  id v4;
  CRKIdentityConfiguration *v5;
  void *v6;
  uint64_t v7;
  NSString *commonName;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSString *emailAddress;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CRKIdentityConfiguration;
  v5 = -[CRKIdentityConfiguration init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("commonName"));
    v7 = objc_claimAutoreleasedReturnValue();
    commonName = v5->_commonName;
    v5->_commonName = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("keySizeInBits"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_keySizeInBits = objc_msgSend(v9, "integerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("createsCertificateAuthority"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_createsCertificateAuthority = objc_msgSend(v10, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("hashingAlgorithm"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_hashingAlgorithm = objc_msgSend(v11, "integerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("addsClientAuthAndServerAuthEKUs"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_addsClientAuthAndServerAuthEKUs = objc_msgSend(v12, "BOOLValue");

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("emailAddress"));
    v14 = objc_claimAutoreleasedReturnValue();
    emailAddress = v5->_emailAddress;
    v5->_emailAddress = (NSString *)v14;

  }
  return v5;
}

+ (int64_t)defaultKeySizeInBits
{
  return 2048;
}

+ (unsigned)defaultHashingAlgorithm
{
  return 6;
}

+ (BOOL)defaultCreatesCertificateAuthority
{
  return 0;
}

- (NSString)commonName
{
  return self->_commonName;
}

- (int64_t)keySizeInBits
{
  return self->_keySizeInBits;
}

- (void)setKeySizeInBits:(int64_t)a3
{
  self->_keySizeInBits = a3;
}

- (BOOL)createsCertificateAuthority
{
  return self->_createsCertificateAuthority;
}

- (void)setCreatesCertificateAuthority:(BOOL)a3
{
  self->_createsCertificateAuthority = a3;
}

- (unsigned)hashingAlgorithm
{
  return self->_hashingAlgorithm;
}

- (void)setHashingAlgorithm:(unsigned int)a3
{
  self->_hashingAlgorithm = a3;
}

- (BOOL)addsClientAuthAndServerAuthEKUs
{
  return self->_addsClientAuthAndServerAuthEKUs;
}

- (void)setAddsClientAuthAndServerAuthEKUs:(BOOL)a3
{
  self->_addsClientAuthAndServerAuthEKUs = a3;
}

- (void)setEmailAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emailAddress, 0);
  objc_storeStrong((id *)&self->_commonName, 0);
}

@end
