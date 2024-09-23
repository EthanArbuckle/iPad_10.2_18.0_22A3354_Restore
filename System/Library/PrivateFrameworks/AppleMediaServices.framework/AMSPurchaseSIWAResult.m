@implementation AMSPurchaseSIWAResult

- (AMSPurchaseSIWAResult)initWithPurchaseResult:(id)a3 authorizationResult:(id)a4
{
  id v7;
  id v8;
  AMSPurchaseSIWAResult *v9;
  AMSPurchaseSIWAResult *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AMSPurchaseSIWAResult;
  v9 = -[AMSPurchaseSIWAResult init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_authorizationResult, a4);
    objc_storeStrong((id *)&v10->_purchaseResult, a3);
  }

  return v10;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[AMSPurchaseSIWAResult purchaseResult](self, "purchaseResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[AMSPurchaseSIWAResult authorizationResult](self, "authorizationResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  AMSPurchaseSIWAResult *v4;
  BOOL v5;

  v4 = (AMSPurchaseSIWAResult *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[AMSPurchaseSIWAResult isEqualToPurchaseSIWAResult:](self, "isEqualToPurchaseSIWAResult:", v4);
  }

  return v5;
}

- (BOOL)isEqualToPurchaseSIWAResult:(id)a3
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

  v7 = a3;
  -[AMSPurchaseSIWAResult authorizationResult](self, "authorizationResult");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(v7, "authorizationResult");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v9 = 0;
LABEL_7:
      -[AMSPurchaseSIWAResult purchaseResult](self, "purchaseResult");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "purchaseResult");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v11, "isEqualToPurchaseResult:", v12);

      if (!v9)
        goto LABEL_9;
      goto LABEL_8;
    }
  }
  -[AMSPurchaseSIWAResult authorizationResult](self, "authorizationResult");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "authorizationResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqual:", v5))
  {
    v9 = 1;
    goto LABEL_7;
  }
  v10 = 0;
LABEL_8:

LABEL_9:
  if (!v8)

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  AMSPurchaseSIWAResult *v4;
  void *v5;
  uint64_t v6;
  AMSPurchaseSIWAAuthorizationResult *authorizationResult;
  void *v8;
  uint64_t v9;
  AMSPurchaseResult *purchaseResult;

  v4 = objc_alloc_init(AMSPurchaseSIWAResult);
  -[AMSPurchaseSIWAResult authorizationResult](self, "authorizationResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "copy");
  authorizationResult = v4->_authorizationResult;
  v4->_authorizationResult = (AMSPurchaseSIWAAuthorizationResult *)v6;

  -[AMSPurchaseSIWAResult purchaseResult](self, "purchaseResult");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "copy");
  purchaseResult = v4->_purchaseResult;
  v4->_purchaseResult = (AMSPurchaseResult *)v9;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[AMSPurchaseSIWAResult authorizationResult](self, "authorizationResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("authorizationResult"));

  -[AMSPurchaseSIWAResult purchaseResult](self, "purchaseResult");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("purchaseResult"));

}

- (AMSPurchaseSIWAResult)initWithCoder:(id)a3
{
  id v4;
  AMSPurchaseSIWAResult *v5;
  uint64_t v6;
  AMSPurchaseSIWAAuthorizationResult *authorizationResult;
  uint64_t v8;
  AMSPurchaseResult *purchaseResult;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AMSPurchaseSIWAResult;
  v5 = -[AMSPurchaseSIWAResult init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("authorizationResult"));
    v6 = objc_claimAutoreleasedReturnValue();
    authorizationResult = v5->_authorizationResult;
    v5->_authorizationResult = (AMSPurchaseSIWAAuthorizationResult *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("purchaseResult"));
    v8 = objc_claimAutoreleasedReturnValue();
    purchaseResult = v5->_purchaseResult;
    v5->_purchaseResult = (AMSPurchaseResult *)v8;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AMSPurchaseResult)purchaseResult
{
  return self->_purchaseResult;
}

- (AMSPurchaseSIWAAuthorizationResult)authorizationResult
{
  return self->_authorizationResult;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authorizationResult, 0);
  objc_storeStrong((id *)&self->_purchaseResult, 0);
}

@end
