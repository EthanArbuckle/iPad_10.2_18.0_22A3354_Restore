@implementation CPSStorePurchaseResponse

- (CPSStorePurchaseResponse)initWithPurchaseResult:(id)a3
{
  id v5;
  CPSStorePurchaseResponse *v6;
  CPSStorePurchaseResponse *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CPSStorePurchaseResponse;
  v6 = -[CPSStorePurchaseResponse init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_purchaseResult, a3);

  return v7;
}

- (id)description
{
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", self->_purchaseResult, CFSTR("purchaseResult"));
  objc_msgSend(v3, "build");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPSStorePurchaseResponse)initWithCoder:(id)a3
{
  id v4;
  CPSStorePurchaseResponse *v5;
  uint64_t v6;
  AMSDelegatePurchaseResult *purchaseResult;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CPSStorePurchaseResponse;
  v5 = -[CPSStorePurchaseResponse init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", getAMSDelegatePurchaseResultClass(), CFSTR("purchaseResult"));
    v6 = objc_claimAutoreleasedReturnValue();
    purchaseResult = v5->_purchaseResult;
    v5->_purchaseResult = (AMSDelegatePurchaseResult *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_purchaseResult, CFSTR("purchaseResult"));
}

- (AMSDelegatePurchaseResult)purchaseResult
{
  return self->_purchaseResult;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_purchaseResult, 0);
}

@end
