@implementation CRKIdentitySharingRequestCertificateRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKIdentitySharingRequestCertificateRequest)initWithCoder:(id)a3
{
  id v4;
  CRKIdentitySharingRequestCertificateRequest *v5;
  void *v6;
  uint64_t v7;
  NSString *recipient;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CRKIdentitySharingRequestCertificateRequest;
  v5 = -[CATTaskRequest initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("recipient"));
    v7 = objc_claimAutoreleasedReturnValue();
    recipient = v5->_recipient;
    v5->_recipient = (NSString *)v7;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRKIdentitySharingRequestCertificateRequest;
  v4 = a3;
  -[CATTaskRequest encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[CRKIdentitySharingRequestCertificateRequest recipient](self, "recipient", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("recipient"));

}

- (NSString)recipient
{
  return self->_recipient;
}

- (void)setRecipient:(id)a3
{
  objc_storeStrong((id *)&self->_recipient, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recipient, 0);
}

@end
