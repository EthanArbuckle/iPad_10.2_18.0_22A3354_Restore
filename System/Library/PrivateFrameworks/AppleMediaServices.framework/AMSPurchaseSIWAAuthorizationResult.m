@implementation AMSPurchaseSIWAAuthorizationResult

- (AMSPurchaseSIWAAuthorizationResult)initWithAuthorization:(id)a3 error:(id)a4
{
  id v7;
  id v8;
  AMSPurchaseSIWAAuthorizationResult *v9;
  AMSPurchaseSIWAAuthorizationResult *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AMSPurchaseSIWAAuthorizationResult;
  v9 = -[AMSPurchaseSIWAAuthorizationResult init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_authorization, a3);
    objc_storeStrong((id *)&v10->_error, a4);
  }

  return v10;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[AMSPurchaseSIWAAuthorizationResult authorization](self, "authorization");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[AMSPurchaseSIWAAuthorizationResult error](self, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  AMSPurchaseSIWAAuthorizationResult *v4;
  BOOL v5;

  v4 = (AMSPurchaseSIWAAuthorizationResult *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[AMSPurchaseSIWAAuthorizationResult isEqualToPurchaseSIWAAuthorizationResult:](self, "isEqualToPurchaseSIWAAuthorizationResult:", v4);
  }

  return v5;
}

- (BOOL)isEqualToPurchaseSIWAAuthorizationResult:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v7;
  void *v8;
  int v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;

  v7 = a3;
  -[AMSPurchaseSIWAAuthorizationResult authorization](self, "authorization");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(v7, "authorization");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      v15 = 0;
      v9 = 0;
      goto LABEL_7;
    }
  }
  -[AMSPurchaseSIWAAuthorizationResult authorization](self, "authorization");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "authorization");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqual:", v4))
  {
    v9 = 1;
LABEL_7:
    -[AMSPurchaseSIWAAuthorizationResult error](self, "error");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 || (objc_msgSend(v7, "error"), (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[AMSPurchaseSIWAAuthorizationResult error](self, "error");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "error");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v12, "isEqual:", v13);

      if (v11)
        goto LABEL_13;
    }
    else
    {
      v10 = 1;
    }

LABEL_13:
    if (!v9)
      goto LABEL_15;
    goto LABEL_14;
  }
  v10 = 0;
LABEL_14:

LABEL_15:
  if (!v8)

  return v10;
}

- (AKCredential)authorizationCredential
{
  void *v2;
  void *v3;

  -[AMSPurchaseSIWAAuthorizationResult authorization](self, "authorization");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "credential");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (AKCredential *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  AMSPurchaseSIWAAuthorizationResult *v4;
  void *v5;
  uint64_t v6;
  NSError *error;

  v4 = objc_alloc_init(AMSPurchaseSIWAAuthorizationResult);
  -[AMSPurchaseSIWAAuthorizationResult error](self, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "copy");
  error = v4->_error;
  v4->_error = (NSError *)v6;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[AMSPurchaseSIWAAuthorizationResult authorization](self, "authorization");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("authorizationCredential"));

  -[AMSPurchaseSIWAAuthorizationResult error](self, "error");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("authorizationError"));

}

- (AMSPurchaseSIWAAuthorizationResult)initWithCoder:(id)a3
{
  id v4;
  AMSPurchaseSIWAAuthorizationResult *v5;
  uint64_t v6;
  AKAuthorization *authorization;
  uint64_t v8;
  NSError *error;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AMSPurchaseSIWAAuthorizationResult;
  v5 = -[AMSPurchaseSIWAAuthorizationResult init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("authorizationCredential"));
    v6 = objc_claimAutoreleasedReturnValue();
    authorization = v5->_authorization;
    v5->_authorization = (AKAuthorization *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("authorizationError"));
    v8 = objc_claimAutoreleasedReturnValue();
    error = v5->_error;
    v5->_error = (NSError *)v8;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (AKAuthorization)authorization
{
  return self->_authorization;
}

- (void)setAuthorization:(id)a3
{
  objc_storeStrong((id *)&self->_authorization, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authorization, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end
