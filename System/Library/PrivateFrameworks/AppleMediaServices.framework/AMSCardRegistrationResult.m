@implementation AMSCardRegistrationResult

- (AMSCardRegistrationResult)initWithCardRegistrationResponse:(id)a3
{
  id v4;
  AMSCardRegistrationResult *v5;
  uint64_t v6;
  NSData *cardData;
  uint64_t v8;
  NSURL *brokerURL;
  uint64_t v10;
  NSURL *paymentServicesURL;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AMSCardRegistrationResult;
  v5 = -[AMSCardRegistrationResult init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "cardData");
    v6 = objc_claimAutoreleasedReturnValue();
    cardData = v5->_cardData;
    v5->_cardData = (NSData *)v6;

    objc_msgSend(v4, "brokerURL");
    v8 = objc_claimAutoreleasedReturnValue();
    brokerURL = v5->_brokerURL;
    v5->_brokerURL = (NSURL *)v8;

    objc_msgSend(v4, "paymentServicesURL");
    v10 = objc_claimAutoreleasedReturnValue();
    paymentServicesURL = v5->_paymentServicesURL;
    v5->_paymentServicesURL = (NSURL *)v10;

  }
  return v5;
}

- (NSData)cardData
{
  return self->_cardData;
}

- (NSURL)brokerURL
{
  return self->_brokerURL;
}

- (NSURL)paymentServicesURL
{
  return self->_paymentServicesURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentServicesURL, 0);
  objc_storeStrong((id *)&self->_brokerURL, 0);
  objc_storeStrong((id *)&self->_cardData, 0);
}

@end
