@implementation AMSDelegatePurchaseRequest

- (AMSDelegatePurchaseRequest)initWithPurchaseResult:(id)a3 challenge:(id)a4 userAgent:(id)a5
{
  id v9;
  AMSDelegatePurchaseRequest *v10;
  AMSDelegatePurchaseRequest *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AMSDelegatePurchaseRequest;
  v10 = -[AMSDelegateAuthenticateRequest initWithChallenge:userAgent:](&v13, sel_initWithChallenge_userAgent_, a4, a5);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_purchaseResult, a3);

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AMSDelegatePurchaseRequest;
  v4 = a3;
  -[AMSDelegateAuthenticateRequest encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[AMSDelegatePurchaseRequest purchaseResult](self, "purchaseResult", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("pr"));

  -[AMSDelegatePurchaseRequest deviceName](self, "deviceName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("deviceName"));

}

- (AMSDelegatePurchaseRequest)initWithCoder:(id)a3
{
  id v4;
  AMSDelegatePurchaseRequest *v5;
  uint64_t v6;
  AMSPurchaseResult *purchaseResult;
  uint64_t v8;
  NSString *deviceName;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AMSDelegatePurchaseRequest;
  v5 = -[AMSDelegateAuthenticateRequest initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pr"));
    v6 = objc_claimAutoreleasedReturnValue();
    purchaseResult = v5->_purchaseResult;
    v5->_purchaseResult = (AMSPurchaseResult *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceName"));
    v8 = objc_claimAutoreleasedReturnValue();
    deviceName = v5->_deviceName;
    v5->_deviceName = (NSString *)v8;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (AMSPurchaseResult)purchaseResult
{
  return self->_purchaseResult;
}

- (void)setPurchaseResult:(id)a3
{
  objc_storeStrong((id *)&self->_purchaseResult, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_purchaseResult, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
}

@end
