@implementation ASPasswordCredentialRequest

- (ASPasswordCredentialRequest)initWithCredentialIdentity:(ASPasswordCredentialIdentity *)credentialIdentity
{
  ASPasswordCredentialIdentity *v4;
  ASPasswordCredentialRequest *v5;
  uint64_t v6;
  ASPasswordCredentialIdentity *v7;
  ASPasswordCredentialRequest *v8;
  objc_super v10;

  v4 = credentialIdentity;
  v10.receiver = self;
  v10.super_class = (Class)ASPasswordCredentialRequest;
  v5 = -[ASPasswordCredentialRequest init](&v10, sel_init);
  if (v5)
  {
    v6 = -[ASPasswordCredentialIdentity copy](v4, "copy");
    v7 = v5->_credentialIdentity;
    v5->_credentialIdentity = (ASPasswordCredentialIdentity *)v6;

    v8 = v5;
  }

  return v5;
}

+ (ASPasswordCredentialRequest)requestWithCredentialIdentity:(ASPasswordCredentialIdentity *)credentialIdentity
{
  ASPasswordCredentialIdentity *v4;
  void *v5;

  v4 = credentialIdentity;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithCredentialIdentity:", v4);

  return (ASPasswordCredentialRequest *)v5;
}

- (int64_t)type
{
  return 0;
}

- (ASCredentialIdentity)credentialIdentity
{
  return (ASCredentialIdentity *)self->_credentialIdentity;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_credentialIdentity, CFSTR("credentialIdentity"));
}

- (ASPasswordCredentialRequest)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  ASPasswordCredentialRequest *v6;
  ASPasswordCredentialRequest *v7;
  ASPasswordCredentialRequest *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("credentialIdentity"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[ASPasswordCredentialRequest initWithCredentialIdentity:](self, "initWithCredentialIdentity:", v5);
  v7 = v6;
  if (v6)
    v8 = v6;

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[ASPasswordCredentialRequest initWithCredentialIdentity:](+[ASPasswordCredentialRequest allocWithZone:](ASPasswordCredentialRequest, "allocWithZone:", a3), "initWithCredentialIdentity:", self->_credentialIdentity);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_credentialIdentity, 0);
}

@end
