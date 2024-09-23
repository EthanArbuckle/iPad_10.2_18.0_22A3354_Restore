@implementation SKPaymentInternal

- (SKPaymentInternal)init
{
  SKPaymentInternal *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SKPaymentInternal;
  result = -[SKPaymentInternal init](&v3, sel_init);
  if (result)
  {
    result->_quantity = 1;
    result->_simulatesAskToBuyInSandbox = 0;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SKPaymentInternal *v5;
  uint64_t v6;
  NSString *applicationUsername;
  uint64_t v8;
  NSString *partnerIdentifier;
  uint64_t v10;
  NSString *partnerTransactionIdentifier;
  uint64_t v12;
  NSString *productIdentifier;
  uint64_t v14;
  NSData *requestData;
  uint64_t v16;
  NSDictionary *requestParameters;
  SKPaymentAppleIDAuthorizationRequest *v18;
  SKPaymentAppleIDAuthorizationRequest *appleIDAuthorizationClientInfo;

  v5 = objc_alloc_init(SKPaymentInternal);
  v6 = -[NSString copyWithZone:](self->_applicationUsername, "copyWithZone:", a3);
  applicationUsername = v5->_applicationUsername;
  v5->_applicationUsername = (NSString *)v6;

  v8 = -[NSString copyWithZone:](self->_partnerIdentifier, "copyWithZone:", a3);
  partnerIdentifier = v5->_partnerIdentifier;
  v5->_partnerIdentifier = (NSString *)v8;

  v10 = -[NSString copyWithZone:](self->_partnerTransactionIdentifier, "copyWithZone:", a3);
  partnerTransactionIdentifier = v5->_partnerTransactionIdentifier;
  v5->_partnerTransactionIdentifier = (NSString *)v10;

  v12 = -[NSString copyWithZone:](self->_productIdentifier, "copyWithZone:", a3);
  productIdentifier = v5->_productIdentifier;
  v5->_productIdentifier = (NSString *)v12;

  v5->_quantity = self->_quantity;
  v14 = -[NSData copyWithZone:](self->_requestData, "copyWithZone:", a3);
  requestData = v5->_requestData;
  v5->_requestData = (NSData *)v14;

  v16 = -[NSDictionary copyWithZone:](self->_requestParameters, "copyWithZone:", a3);
  requestParameters = v5->_requestParameters;
  v5->_requestParameters = (NSDictionary *)v16;

  v5->_simulatesAskToBuyInSandbox = self->_simulatesAskToBuyInSandbox;
  v5->_isStoreOriginated = self->_isStoreOriginated;
  objc_storeStrong((id *)&v5->_paymentDiscount, self->_paymentDiscount);
  v18 = -[SKPaymentAppleIDAuthorizationRequest copyWithZone:](self->_appleIDAuthorizationClientInfo, "copyWithZone:", a3);
  appleIDAuthorizationClientInfo = v5->_appleIDAuthorizationClientInfo;
  v5->_appleIDAuthorizationClientInfo = v18;

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appleIDAuthorizationClientInfo, 0);
  objc_storeStrong((id *)&self->_paymentDiscount, 0);
  objc_storeStrong((id *)&self->_requestParameters, 0);
  objc_storeStrong((id *)&self->_requestData, 0);
  objc_storeStrong((id *)&self->_productIdentifier, 0);
  objc_storeStrong((id *)&self->_partnerTransactionIdentifier, 0);
  objc_storeStrong((id *)&self->_partnerIdentifier, 0);
  objc_storeStrong((id *)&self->_applicationUsername, 0);
}

@end
