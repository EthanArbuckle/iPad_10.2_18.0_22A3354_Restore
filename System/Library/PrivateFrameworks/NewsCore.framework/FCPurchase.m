@implementation FCPurchase

- (FCPurchase)initWithPurchaseID:(id)a3 appAdamID:(id)a4 subscriptionPriceFormatted:(id)a5 subscriptionPeriodInISO_8601:(id)a6 offerName:(id)a7 storeExternalVersion:(id)a8 bundleID:(id)a9 price:(id)a10 introOffer:(id)a11 payment:(id)a12
{
  id v18;
  id v19;
  id v20;
  id v21;
  FCPurchase *v22;
  FCPurchase *v23;
  id obj;
  id v26;
  id v27;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  objc_super v35;

  v34 = a3;
  obj = a4;
  v33 = a4;
  v32 = a5;
  v26 = a6;
  v31 = a6;
  v27 = a7;
  v30 = a7;
  v29 = a8;
  v18 = a9;
  v19 = a10;
  v20 = a11;
  v21 = a12;
  v35.receiver = self;
  v35.super_class = (Class)FCPurchase;
  v22 = -[FCPurchase init](&v35, sel_init);
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_purchaseID, a3);
    objc_storeStrong((id *)&v23->_appAdamID, obj);
    objc_storeStrong((id *)&v23->_subscriptionPriceFormatted, a5);
    objc_storeStrong((id *)&v23->_subscriptionPeriodInISO_8601, v26);
    objc_storeStrong((id *)&v23->_offerName, v27);
    objc_storeStrong((id *)&v23->_storeExternalVersion, a8);
    objc_storeStrong((id *)&v23->_bundleID, a9);
    objc_storeStrong((id *)&v23->_price, a10);
    objc_storeStrong((id *)&v23->_introductoryOffer, a11);
    objc_storeStrong((id *)&v23->_payment, a12);
  }

  return v23;
}

- (BOOL)isFreeTrialEligible
{
  void *v3;
  uint64_t v4;
  void *v5;
  BOOL v6;

  NewsCoreUserDefaults();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerForKey:", CFSTR("newssubscription.bundle_subscriptions.trial_eligible"));

  if (NFInternalBuild())
  {
    if (v4 == 2)
      return 0;
    if (v4 == 1)
      return 1;
  }
  -[FCPurchase introductoryOffer](self, "introductoryOffer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "offerType") == 3;

  return v6;
}

- (NSNumber)appAdamID
{
  return self->_appAdamID;
}

- (NSString)purchaseID
{
  return self->_purchaseID;
}

- (NSString)subscriptionPriceFormatted
{
  return self->_subscriptionPriceFormatted;
}

- (NSString)subscriptionPeriodInISO_8601
{
  return self->_subscriptionPeriodInISO_8601;
}

- (NSString)offerName
{
  return self->_offerName;
}

- (NSNumber)storeExternalVersion
{
  return self->_storeExternalVersion;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSNumber)price
{
  return self->_price;
}

- (FCIntroductoryOffer)introductoryOffer
{
  return self->_introductoryOffer;
}

- (SKMutablePayment)payment
{
  return self->_payment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payment, 0);
  objc_storeStrong((id *)&self->_introductoryOffer, 0);
  objc_storeStrong((id *)&self->_price, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_storeExternalVersion, 0);
  objc_storeStrong((id *)&self->_offerName, 0);
  objc_storeStrong((id *)&self->_subscriptionPeriodInISO_8601, 0);
  objc_storeStrong((id *)&self->_subscriptionPriceFormatted, 0);
  objc_storeStrong((id *)&self->_purchaseID, 0);
  objc_storeStrong((id *)&self->_appAdamID, 0);
}

@end
