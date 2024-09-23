@implementation IDSCarrierTokenRequestParameters

- (IDSCarrierTokenRequestParameters)initWithSubscriptionSource:(int64_t)a3 IMEI:(id)a4 carrierNonce:(id)a5
{
  id v9;
  id v10;
  IDSCarrierTokenRequestParameters *v11;
  IDSCarrierTokenRequestParameters *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)IDSCarrierTokenRequestParameters;
  v11 = -[IDSCarrierTokenRequestParameters init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_subscriptionSource = a3;
    objc_storeStrong((id *)&v11->_IMEI, a4);
    objc_storeStrong((id *)&v12->_carrierNonce, a5);
  }

  return v12;
}

- (int64_t)subscriptionSource
{
  return self->_subscriptionSource;
}

- (NSString)IMEI
{
  return self->_IMEI;
}

- (NSString)carrierNonce
{
  return self->_carrierNonce;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_carrierNonce, 0);
  objc_storeStrong((id *)&self->_IMEI, 0);
}

@end
