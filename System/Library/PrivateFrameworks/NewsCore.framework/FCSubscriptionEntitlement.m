@implementation FCSubscriptionEntitlement

- (FCSubscriptionEntitlement)initWithASDEntitlement:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  FCSubscriptionEntitlement *v13;
  uint64_t v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  void *v19;
  void *v20;

  v4 = a3;
  objc_msgSend(v4, "appAdamID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "inAppAdamID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "chargeCurrencyCode");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v4, "isNewsAppPurchase");
  v17 = objc_msgSend(v4, "isTrialPeriod");
  v16 = objc_msgSend(v4, "isPurchaser");
  objc_msgSend(v4, "servicesBundlePurchaseID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isOfferPeriod");
  objc_msgSend(v4, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "expiryDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "initialPurchaseTimestamp");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serviceBeginsTimestamp");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "vendorAdHocOfferID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v15) = v7;
  v13 = -[FCSubscriptionEntitlement initWithAppAdamID:inAppAdamID:chargeCurrencyCode:newsAppPurchase:isTrialPeriod:isPurchaser:servicesBundleAdamID:isAmplifyUser:startDate:expiryDate:initialPurchaseTimestamp:serviceBeginsTimestamp:vendorAdHocOfferID:](self, "initWithAppAdamID:inAppAdamID:chargeCurrencyCode:newsAppPurchase:isTrialPeriod:isPurchaser:servicesBundleAdamID:isAmplifyUser:startDate:expiryDate:initialPurchaseTimestamp:serviceBeginsTimestamp:vendorAdHocOfferID:", v5, v20, v19, v18, v17, v16, v6, v15, v8, v9, v10, v11, v12);

  return v13;
}

- (FCSubscriptionEntitlement)initWithAppAdamID:(id)a3 inAppAdamID:(id)a4 chargeCurrencyCode:(id)a5 newsAppPurchase:(BOOL)a6 isTrialPeriod:(BOOL)a7 isPurchaser:(BOOL)a8 servicesBundleAdamID:(id)a9 isAmplifyUser:(BOOL)a10 startDate:(id)a11 expiryDate:(id)a12 initialPurchaseTimestamp:(id)a13 serviceBeginsTimestamp:(id)a14 vendorAdHocOfferID:(id)a15
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  FCSubscriptionEntitlement *v25;
  FCSubscriptionEntitlement *v26;
  id obj;
  id v29;
  id v33;
  id v34;
  id v35;
  objc_super v36;

  v33 = a3;
  obj = a4;
  v19 = a4;
  v29 = a5;
  v20 = a5;
  v35 = a9;
  v34 = a11;
  v21 = a12;
  v22 = a13;
  v23 = a14;
  v24 = a15;
  v36.receiver = self;
  v36.super_class = (Class)FCSubscriptionEntitlement;
  v25 = -[FCSubscriptionEntitlement init](&v36, sel_init);
  v26 = v25;
  if (v25)
  {
    objc_storeStrong((id *)&v25->_appAdamID, a3);
    objc_storeStrong((id *)&v26->_inAppAdamID, obj);
    objc_storeStrong((id *)&v26->_chargeCurrencyCode, v29);
    v26->_newsAppPurchase = a6;
    v26->_isTrialPeriod = a7;
    v26->_isPurchaser = a8;
    v26->_isAmplifyUser = a10;
    objc_storeStrong((id *)&v26->_servicesBundleAdamID, a9);
    objc_storeStrong((id *)&v26->_startDate, a11);
    objc_storeStrong((id *)&v26->_expiryDate, a12);
    objc_storeStrong((id *)&v26->_initialPurchaseTimestamp, a13);
    objc_storeStrong((id *)&v26->_serviceBeginsTimestamp, a14);
    objc_storeStrong((id *)&v26->_vendorAdHocOfferID, a15);
  }

  return v26;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[FCSubscriptionEntitlement inAppAdamID](self, "inAppAdamID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCSubscriptionEntitlement servicesBundleAdamID](self, "servicesBundleAdamID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("{purchaseId=%@, servicesBundleAdamID=%@}"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)servicesBundleAdamID
{
  return self->_servicesBundleAdamID;
}

- (NSNumber)appAdamID
{
  return self->_appAdamID;
}

- (NSString)chargeCurrencyCode
{
  return self->_chargeCurrencyCode;
}

- (NSNumber)inAppAdamID
{
  return self->_inAppAdamID;
}

- (BOOL)isNewsAppPurchase
{
  return self->_newsAppPurchase;
}

- (BOOL)isTrialPeriod
{
  return self->_isTrialPeriod;
}

- (BOOL)isPurchaser
{
  return self->_isPurchaser;
}

- (BOOL)isAmplifyUser
{
  return self->_isAmplifyUser;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)expiryDate
{
  return self->_expiryDate;
}

- (NSNumber)initialPurchaseTimestamp
{
  return self->_initialPurchaseTimestamp;
}

- (NSNumber)serviceBeginsTimestamp
{
  return self->_serviceBeginsTimestamp;
}

- (NSString)vendorAdHocOfferID
{
  return self->_vendorAdHocOfferID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vendorAdHocOfferID, 0);
  objc_storeStrong((id *)&self->_serviceBeginsTimestamp, 0);
  objc_storeStrong((id *)&self->_initialPurchaseTimestamp, 0);
  objc_storeStrong((id *)&self->_expiryDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_inAppAdamID, 0);
  objc_storeStrong((id *)&self->_chargeCurrencyCode, 0);
  objc_storeStrong((id *)&self->_appAdamID, 0);
  objc_storeStrong((id *)&self->_servicesBundleAdamID, 0);
}

@end
