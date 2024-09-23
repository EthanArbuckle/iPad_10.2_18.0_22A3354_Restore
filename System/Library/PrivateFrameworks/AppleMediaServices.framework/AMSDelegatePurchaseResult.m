@implementation AMSDelegatePurchaseResult

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AMSDelegatePurchaseResult;
  v4 = a3;
  -[AMSDelegateAuthenticateResult encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_request, CFSTR("rp"), v5.receiver, v5.super_class);

}

- (AMSDelegatePurchaseResult)initWithCoder:(id)a3
{
  id v4;
  AMSDelegatePurchaseResult *v5;
  uint64_t v6;
  AMSDelegatePurchaseRequest *request;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSDelegatePurchaseResult;
  v5 = -[AMSDelegateAuthenticateResult initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rp"));
    v6 = objc_claimAutoreleasedReturnValue();
    request = v5->_request;
    v5->_request = (AMSDelegatePurchaseRequest *)v6;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AMSDelegatePurchaseRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_storeStrong((id *)&self->_request, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
}

@end
