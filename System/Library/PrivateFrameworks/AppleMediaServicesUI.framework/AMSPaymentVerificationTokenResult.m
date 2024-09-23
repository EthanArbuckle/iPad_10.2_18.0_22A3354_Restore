@implementation AMSPaymentVerificationTokenResult

- (AMSPaymentVerificationTokenResult)initWithTokenData:(id)a3
{
  id v5;
  AMSPaymentVerificationTokenResult *v6;
  AMSPaymentVerificationTokenResult *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSPaymentVerificationTokenResult;
  v6 = -[AMSPaymentVerificationTokenResult init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_tokenData, a3);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[AMSPaymentVerificationTokenResult tokenData](self, "tokenData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[AMSPaymentVerificationTokenResult tokenData](self, "tokenData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("kCodingKeyTokenData"));

  }
}

- (AMSPaymentVerificationTokenResult)initWithCoder:(id)a3
{
  id v4;
  AMSPaymentVerificationTokenResult *v5;
  uint64_t v6;
  NSData *tokenData;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSPaymentVerificationTokenResult;
  v5 = -[AMSPaymentVerificationTokenResult init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCodingKeyTokenData"));
    v6 = objc_claimAutoreleasedReturnValue();
    tokenData = v5->_tokenData;
    v5->_tokenData = (NSData *)v6;

  }
  return v5;
}

- (NSData)tokenData
{
  return self->_tokenData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenData, 0);
}

@end
