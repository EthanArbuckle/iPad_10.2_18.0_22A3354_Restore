@implementation FCBundleEntitlementsProviderResult

- (FCBundleEntitlementsProviderResult)initWithBundlePurchaseID:(id)a3 inTrialPeriod:(BOOL)a4 isPurchaser:(BOOL)a5 servicesBundlePurchaseID:(id)a6 isAmplifyUser:(BOOL)a7 initialPurchaseTimestamp:(id)a8 vendorAdHocOfferID:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  FCBundleEntitlementsProviderResult *v19;
  uint64_t v20;
  NSString *bundlePurchaseID;
  uint64_t v22;
  NSNumber *initialPurchaseTimestamp;
  uint64_t v24;
  NSString *servicesBundlePurchaseID;
  objc_super v27;

  v15 = a3;
  v16 = a6;
  v17 = a8;
  v18 = a9;
  v27.receiver = self;
  v27.super_class = (Class)FCBundleEntitlementsProviderResult;
  v19 = -[FCBundleEntitlementsProviderResult init](&v27, sel_init);
  if (v19)
  {
    v20 = objc_msgSend(v15, "copy");
    bundlePurchaseID = v19->_bundlePurchaseID;
    v19->_bundlePurchaseID = (NSString *)v20;

    v19->_inTrialPeriod = a4;
    v19->_isPurchaser = a5;
    v19->_isAmplifyUser = a7;
    objc_storeStrong((id *)&v19->_vendorAdHocOfferID, a9);
    v22 = objc_msgSend(v17, "copy");
    initialPurchaseTimestamp = v19->_initialPurchaseTimestamp;
    v19->_initialPurchaseTimestamp = (NSNumber *)v22;

    v24 = objc_msgSend(v16, "copy");
    servicesBundlePurchaseID = v19->_servicesBundlePurchaseID;
    v19->_servicesBundlePurchaseID = (NSString *)v24;

  }
  return v19;
}

- (NSString)bundlePurchaseID
{
  return self->_bundlePurchaseID;
}

- (NSString)servicesBundlePurchaseID
{
  return self->_servicesBundlePurchaseID;
}

- (BOOL)inTrialPeriod
{
  return self->_inTrialPeriod;
}

- (BOOL)isPurchaser
{
  return self->_isPurchaser;
}

- (BOOL)isAmplifyUser
{
  return self->_isAmplifyUser;
}

- (NSString)vendorAdHocOfferID
{
  return self->_vendorAdHocOfferID;
}

- (NSNumber)initialPurchaseTimestamp
{
  return self->_initialPurchaseTimestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialPurchaseTimestamp, 0);
  objc_storeStrong((id *)&self->_vendorAdHocOfferID, 0);
  objc_storeStrong((id *)&self->_servicesBundlePurchaseID, 0);
  objc_storeStrong((id *)&self->_bundlePurchaseID, 0);
}

@end
