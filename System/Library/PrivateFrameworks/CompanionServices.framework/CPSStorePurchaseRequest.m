@implementation CPSStorePurchaseRequest

- (id)description
{
  void *v3;
  id v4;
  id v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", self->_purchaseRequest, CFSTR("purchaseRequest"));
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", self->_account, CFSTR("account"));
  objc_msgSend(v3, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int64_t)authType
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPSStorePurchaseRequest)initWithCoder:(id)a3
{
  id v4;
  CPSStorePurchaseRequest *v5;
  uint64_t v6;
  AMSDelegatePurchaseRequest *purchaseRequest;
  void *v8;
  uint64_t v9;
  ACAccount *account;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CPSStorePurchaseRequest;
  v5 = -[CPSStorePurchaseRequest init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", getAMSDelegatePurchaseRequestClass(), CFSTR("purchaseRequest"));
    v6 = objc_claimAutoreleasedReturnValue();
    purchaseRequest = v5->_purchaseRequest;
    v5->_purchaseRequest = (AMSDelegatePurchaseRequest *)v6;

    objc_opt_self();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, CFSTR("account"));
    v9 = objc_claimAutoreleasedReturnValue();
    account = v5->_account;
    v5->_account = (ACAccount *)v9;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  AMSDelegatePurchaseRequest *purchaseRequest;
  id v5;

  purchaseRequest = self->_purchaseRequest;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", purchaseRequest, CFSTR("purchaseRequest"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_account, CFSTR("account"));

}

- (AMSDelegatePurchaseRequest)purchaseRequest
{
  return self->_purchaseRequest;
}

- (void)setPurchaseRequest:(id)a3
{
  objc_storeStrong((id *)&self->_purchaseRequest, a3);
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_purchaseRequest, 0);
}

@end
