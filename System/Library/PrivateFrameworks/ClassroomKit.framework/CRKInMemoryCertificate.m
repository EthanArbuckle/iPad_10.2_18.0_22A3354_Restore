@implementation CRKInMemoryCertificate

+ (id)certificateWithData:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD1620], "cat_unarchiveObjectOfClass:withData:", a1, a3);
}

- (CRKInMemoryCertificate)initWithConfiguration:(id)a3 validityDateInterval:(id)a4
{
  id v6;
  id v7;
  CRKInMemoryCertificate *v8;
  uint64_t v9;
  CRKIdentityConfiguration *configuration;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CRKInMemoryCertificate;
  v8 = -[CRKInMemoryCertificate init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    configuration = v8->_configuration;
    v8->_configuration = (CRKIdentityConfiguration *)v9;

    objc_storeStrong((id *)&v8->_validityDateInterval, a4);
  }

  return v8;
}

- (NSArray)commonNames
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  -[CRKInMemoryCertificate configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "commonName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (NSString)fingerprint
{
  void *v2;
  void *v3;

  -[CRKInMemoryCertificate configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "commonName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSData)dataRepresentation
{
  return (NSData *)objc_msgSend(MEMORY[0x24BDD1618], "cat_archivedDataWithRootObject:", self);
}

- (__SecCertificate)underlyingCertificate
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKInMemoryCertificate.m"), 58, CFSTR("Reconsider what you are trying to test"));

  return 0;
}

- (BOOL)isTemporallyValid
{
  void *v2;
  char v3;

  -[CRKInMemoryCertificate validityDateInterval](self, "validityDateInterval");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "crk_containsCurrentDate");

  return v3;
}

- (BOOL)isCertificateAuthority
{
  void *v2;
  char v3;

  -[CRKInMemoryCertificate configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "createsCertificateAuthority");

  return v3;
}

- (unsigned)hashingAlgorithm
{
  void *v2;
  unsigned int v3;

  -[CRKInMemoryCertificate configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hashingAlgorithm");

  return v3;
}

- (int64_t)keySizeInBits
{
  void *v2;
  int64_t v3;

  -[CRKInMemoryCertificate configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "keySizeInBits");

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CRKInMemoryCertificate validityDateInterval](self, "validityDateInterval");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("validityDateInterval"));

  -[CRKInMemoryCertificate configuration](self, "configuration");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("configuration"));

}

- (CRKInMemoryCertificate)initWithCoder:(id)a3
{
  id v4;
  CRKInMemoryCertificate *v5;
  void *v6;
  uint64_t v7;
  NSDateInterval *validityDateInterval;
  void *v9;
  uint64_t v10;
  CRKIdentityConfiguration *configuration;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CRKInMemoryCertificate;
  v5 = -[CRKInMemoryCertificate init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("validityDateInterval"));
    v7 = objc_claimAutoreleasedReturnValue();
    validityDateInterval = v5->_validityDateInterval;
    v5->_validityDateInterval = (NSDateInterval *)v7;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("configuration"));
    v10 = objc_claimAutoreleasedReturnValue();
    configuration = v5->_configuration;
    v5->_configuration = (CRKIdentityConfiguration *)v10;

  }
  return v5;
}

- (NSDateInterval)validityDateInterval
{
  return self->_validityDateInterval;
}

- (void)setValidityDateInterval:(id)a3
{
  objc_storeStrong((id *)&self->_validityDateInterval, a3);
}

- (CRKIdentityConfiguration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_validityDateInterval, 0);
}

@end
