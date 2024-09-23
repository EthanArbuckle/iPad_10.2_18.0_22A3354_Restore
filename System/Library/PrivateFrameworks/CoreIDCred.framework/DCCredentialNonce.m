@implementation DCCredentialNonce

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_credentialNonce, 0x24C3076E8);
}

- (DCCredentialNonce)initWithCoder:(id)a3
{
  id v4;
  DCCredentialNonce *v5;
  uint64_t v6;
  NSData *credentialNonce;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DCCredentialNonce;
  v5 = -[DCCredentialNonce init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), 0x24C3076E8);
    v6 = objc_claimAutoreleasedReturnValue();
    credentialNonce = v5->_credentialNonce;
    v5->_credentialNonce = (NSData *)v6;

  }
  return v5;
}

- (DCCredentialNonce)initWithCredentialNonce:(id)a3
{
  id v4;
  DCCredentialNonce *v5;
  uint64_t v6;
  NSData *credentialNonce;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DCCredentialNonce;
  v5 = -[DCCredentialNonce init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    credentialNonce = v5->_credentialNonce;
    v5->_credentialNonce = (NSData *)v6;

  }
  return v5;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("DCCredentialNonce nonce = %@"), self->_credentialNonce);
}

- (NSData)credentialNonce
{
  return self->_credentialNonce;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_credentialNonce, 0);
}

@end
