@implementation ASOneTimeCodeCredentialRequest

- (ASOneTimeCodeCredentialRequest)initWithCredentialIdentity:(id)a3
{
  id v4;
  ASOneTimeCodeCredentialRequest *v5;
  uint64_t v6;
  ASOneTimeCodeCredentialIdentity *credentialIdentity;
  ASOneTimeCodeCredentialRequest *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ASOneTimeCodeCredentialRequest;
  v5 = -[ASOneTimeCodeCredentialRequest init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    credentialIdentity = v5->_credentialIdentity;
    v5->_credentialIdentity = (ASOneTimeCodeCredentialIdentity *)v6;

    v8 = v5;
  }

  return v5;
}

+ (id)requestWithCredentialIdentity:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithCredentialIdentity:", v4);

  return v5;
}

- (int64_t)type
{
  return 3;
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

- (ASOneTimeCodeCredentialRequest)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  ASOneTimeCodeCredentialRequest *v6;
  ASOneTimeCodeCredentialRequest *v7;
  ASOneTimeCodeCredentialRequest *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("credentialIdentity"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[ASOneTimeCodeCredentialRequest initWithCredentialIdentity:](self, "initWithCredentialIdentity:", v5);
  v7 = v6;
  if (v6)
    v8 = v6;

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[ASOneTimeCodeCredentialRequest initWithCredentialIdentity:](+[ASOneTimeCodeCredentialRequest allocWithZone:](ASOneTimeCodeCredentialRequest, "allocWithZone:", a3), "initWithCredentialIdentity:", self->_credentialIdentity);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_credentialIdentity, 0);
}

@end
