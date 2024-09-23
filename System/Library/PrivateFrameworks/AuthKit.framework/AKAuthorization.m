@implementation AKAuthorization

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
  -[AKAuthorization authorizedRequest](self, "authorizedRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_authorizedRequest"));

  -[AKAuthorization credential](self, "credential");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("_credential"));

}

- (AKAuthorization)initWithCoder:(id)a3
{
  id v4;
  AKAuthorization *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  AKCredentialRequestProtocol *authorizedRequest;
  uint64_t v17;
  AKCredential *credential;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)AKAuthorization;
  v5 = -[AKAuthorization init](&v24, sel_init);
  if (v5)
  {
    v23 = (void *)MEMORY[0x1E0C99E60];
    v22 = objc_opt_class();
    v21 = objc_opt_class();
    v20 = objc_opt_class();
    v6 = objc_opt_class();
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    objc_msgSend(v23, "setWithObjects:", v22, v21, v20, v6, v7, v8, v9, v10, v11, v12, v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("_authorizedRequest"));
    v15 = objc_claimAutoreleasedReturnValue();
    authorizedRequest = v5->_authorizedRequest;
    v5->_authorizedRequest = (AKCredentialRequestProtocol *)v15;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("_credential"));
    v17 = objc_claimAutoreleasedReturnValue();
    credential = v5->_credential;
    v5->_credential = (AKCredential *)v17;

  }
  return v5;
}

- (void)setAuthorizedRequest:(id)a3
{
  id v4;
  uint64_t v5;
  AKCredentialRequestProtocol *authorizedRequest;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "_sanitizedCopy");
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v5;
  }
  authorizedRequest = self->_authorizedRequest;
  self->_authorizedRequest = (AKCredentialRequestProtocol *)v4;

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p {\nAuthorized request: %@\nCredential: %@\n}"), v5, self, self->_authorizedRequest, self->_credential);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (AKCredentialRequestProtocol)authorizedRequest
{
  return self->_authorizedRequest;
}

- (AKCredential)credential
{
  return self->_credential;
}

- (void)setCredential:(id)a3
{
  objc_storeStrong((id *)&self->_credential, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_credential, 0);
  objc_storeStrong((id *)&self->_authorizedRequest, 0);
}

@end
