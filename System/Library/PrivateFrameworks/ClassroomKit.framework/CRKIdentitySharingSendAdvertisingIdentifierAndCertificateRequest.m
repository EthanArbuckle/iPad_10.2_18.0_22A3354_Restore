@implementation CRKIdentitySharingSendAdvertisingIdentifierAndCertificateRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKIdentitySharingSendAdvertisingIdentifierAndCertificateRequest)initWithCoder:(id)a3
{
  id v4;
  CRKIdentitySharingSendAdvertisingIdentifierAndCertificateRequest *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSSet *recipients;
  void *v11;
  uint64_t v12;
  NSUUID *advertisingIdentifier;
  void *v14;
  uint64_t v15;
  NSData *activeCertificateData;
  void *v17;
  uint64_t v18;
  NSData *stagedCertificateData;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CRKIdentitySharingSendAdvertisingIdentifierAndCertificateRequest;
  v5 = -[CATTaskRequest initWithCoder:](&v21, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("recipients"));
    v9 = objc_claimAutoreleasedReturnValue();
    recipients = v5->_recipients;
    v5->_recipients = (NSSet *)v9;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("advertisingIdentifier"));
    v12 = objc_claimAutoreleasedReturnValue();
    advertisingIdentifier = v5->_advertisingIdentifier;
    v5->_advertisingIdentifier = (NSUUID *)v12;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("activeCertificateData"));
    v15 = objc_claimAutoreleasedReturnValue();
    activeCertificateData = v5->_activeCertificateData;
    v5->_activeCertificateData = (NSData *)v15;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("stagedCertificateData"));
    v18 = objc_claimAutoreleasedReturnValue();
    stagedCertificateData = v5->_stagedCertificateData;
    v5->_stagedCertificateData = (NSData *)v18;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CRKIdentitySharingSendAdvertisingIdentifierAndCertificateRequest;
  v4 = a3;
  -[CATTaskRequest encodeWithCoder:](&v9, sel_encodeWithCoder_, v4);
  -[CRKIdentitySharingSendAdvertisingIdentifierAndCertificateRequest recipients](self, "recipients", v9.receiver, v9.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("recipients"));

  -[CRKIdentitySharingSendAdvertisingIdentifierAndCertificateRequest advertisingIdentifier](self, "advertisingIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("advertisingIdentifier"));

  -[CRKIdentitySharingSendAdvertisingIdentifierAndCertificateRequest activeCertificateData](self, "activeCertificateData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("activeCertificateData"));

  -[CRKIdentitySharingSendAdvertisingIdentifierAndCertificateRequest stagedCertificateData](self, "stagedCertificateData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("stagedCertificateData"));

}

- (NSSet)recipients
{
  return self->_recipients;
}

- (void)setRecipients:(id)a3
{
  objc_storeStrong((id *)&self->_recipients, a3);
}

- (NSUUID)advertisingIdentifier
{
  return self->_advertisingIdentifier;
}

- (void)setAdvertisingIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_advertisingIdentifier, a3);
}

- (NSData)activeCertificateData
{
  return self->_activeCertificateData;
}

- (void)setActiveCertificateData:(id)a3
{
  objc_storeStrong((id *)&self->_activeCertificateData, a3);
}

- (NSData)stagedCertificateData
{
  return self->_stagedCertificateData;
}

- (void)setStagedCertificateData:(id)a3
{
  objc_storeStrong((id *)&self->_stagedCertificateData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stagedCertificateData, 0);
  objc_storeStrong((id *)&self->_activeCertificateData, 0);
  objc_storeStrong((id *)&self->_advertisingIdentifier, 0);
  objc_storeStrong((id *)&self->_recipients, 0);
}

@end
