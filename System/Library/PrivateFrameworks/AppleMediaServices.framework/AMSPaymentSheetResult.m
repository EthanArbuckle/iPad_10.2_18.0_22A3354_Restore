@implementation AMSPaymentSheetResult

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[AMSPaymentSheetResult delegateAuthenticateToken](self, "delegateAuthenticateToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kDelegateAuthenticateToken"));

  -[AMSPaymentSheetResult passwordEquivalentToken](self, "passwordEquivalentToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("kPasswordEquivalentToken"));

  -[AMSPaymentSheetResult paymentToken](self, "paymentToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("kPaymentToken"));

  -[AMSPaymentSheetResult signatureResult](self, "signatureResult");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("kSignatureResult"));

}

- (AMSPaymentSheetResult)initWithCoder:(id)a3
{
  id v4;
  AMSPaymentSheetResult *v5;
  uint64_t v6;
  NSString *delegateAuthenticateToken;
  uint64_t v8;
  NSString *passwordEquivalentToken;
  uint64_t v10;
  NSString *paymentToken;
  uint64_t v12;
  AMSBiometricsSignatureResult *signatureResult;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)AMSPaymentSheetResult;
  v5 = -[AMSPaymentSheetResult init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kDelegateAuthenticateToken"));
    v6 = objc_claimAutoreleasedReturnValue();
    delegateAuthenticateToken = v5->_delegateAuthenticateToken;
    v5->_delegateAuthenticateToken = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kPasswordEquivalentToken"));
    v8 = objc_claimAutoreleasedReturnValue();
    passwordEquivalentToken = v5->_passwordEquivalentToken;
    v5->_passwordEquivalentToken = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kPaymentToken"));
    v10 = objc_claimAutoreleasedReturnValue();
    paymentToken = v5->_paymentToken;
    v5->_paymentToken = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kSignatureResult"));
    v12 = objc_claimAutoreleasedReturnValue();
    signatureResult = v5->_signatureResult;
    v5->_signatureResult = (AMSBiometricsSignatureResult *)v12;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)delegateAuthenticateToken
{
  return self->_delegateAuthenticateToken;
}

- (void)setDelegateAuthenticateToken:(id)a3
{
  objc_storeStrong((id *)&self->_delegateAuthenticateToken, a3);
}

- (NSString)passwordEquivalentToken
{
  return self->_passwordEquivalentToken;
}

- (void)setPasswordEquivalentToken:(id)a3
{
  objc_storeStrong((id *)&self->_passwordEquivalentToken, a3);
}

- (NSString)paymentToken
{
  return self->_paymentToken;
}

- (void)setPaymentToken:(id)a3
{
  objc_storeStrong((id *)&self->_paymentToken, a3);
}

- (AMSBiometricsSignatureResult)signatureResult
{
  return self->_signatureResult;
}

- (void)setSignatureResult:(id)a3
{
  objc_storeStrong((id *)&self->_signatureResult, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signatureResult, 0);
  objc_storeStrong((id *)&self->_paymentToken, 0);
  objc_storeStrong((id *)&self->_passwordEquivalentToken, 0);
  objc_storeStrong((id *)&self->_delegateAuthenticateToken, 0);
}

@end
