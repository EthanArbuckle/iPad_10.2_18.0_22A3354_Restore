@implementation CRKIdentitySharingSendCertificateRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKIdentitySharingSendCertificateRequest)initWithCoder:(id)a3
{
  id v4;
  CRKIdentitySharingSendCertificateRequest *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSSet *recipients;
  void *v11;
  uint64_t v12;
  NSData *activeCertificateData;
  void *v14;
  uint64_t v15;
  NSData *stagedCertificateData;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CRKIdentitySharingSendCertificateRequest;
  v5 = -[CATTaskRequest initWithCoder:](&v18, sel_initWithCoder_, v4);
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

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("activeCertificateData"));
    v12 = objc_claimAutoreleasedReturnValue();
    activeCertificateData = v5->_activeCertificateData;
    v5->_activeCertificateData = (NSData *)v12;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("stagedCertificateData"));
    v15 = objc_claimAutoreleasedReturnValue();
    stagedCertificateData = v5->_stagedCertificateData;
    v5->_stagedCertificateData = (NSData *)v15;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CRKIdentitySharingSendCertificateRequest;
  v4 = a3;
  -[CATTaskRequest encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
  -[CRKIdentitySharingSendCertificateRequest recipients](self, "recipients", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("recipients"));

  -[CRKIdentitySharingSendCertificateRequest activeCertificateData](self, "activeCertificateData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("activeCertificateData"));

  -[CRKIdentitySharingSendCertificateRequest stagedCertificateData](self, "stagedCertificateData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("stagedCertificateData"));

}

- (NSSet)recipients
{
  return self->_recipients;
}

- (void)setRecipients:(id)a3
{
  objc_storeStrong((id *)&self->_recipients, a3);
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
  objc_storeStrong((id *)&self->_recipients, 0);
}

@end
