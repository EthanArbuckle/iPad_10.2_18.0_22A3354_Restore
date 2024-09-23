@implementation ASDSubscriptionEntitlement

- (ASDSubscriptionEntitlement)initWithDictionary:(id)a3 forAppAdamID:(id)a4 segment:(unint64_t)a5 hasFamily:(BOOL)a6
{
  id v10;
  id v11;
  ASDSubscriptionEntitlement *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSDictionary *dictionary;
  objc_super v18;

  v10 = a3;
  v11 = a4;
  v18.receiver = self;
  v18.super_class = (Class)ASDSubscriptionEntitlement;
  v12 = -[ASDSubscriptionEntitlement init](&v18, sel_init);
  if (v12)
  {
    v13 = (void *)MEMORY[0x19AEC59A8]();
    v14 = (void *)objc_msgSend(v10, "mutableCopy");
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v11, CFSTR("appAdamId"));
    v15 = objc_msgSend(v14, "copy");
    dictionary = v12->_dictionary;
    v12->_dictionary = (NSDictionary *)v15;

    v12->_segment = a5;
    v12->_hasFamily = a6;

    objc_autoreleasePoolPop(v13);
  }

  return v12;
}

- (NSNumber)appAdamID
{
  objc_opt_class();
  return (NSNumber *)-[ASDSubscriptionEntitlement _valueForKey:ofType:]((uint64_t)self, (uint64_t)CFSTR("appAdamId"));
}

- (id)_valueForKey:(uint64_t)a1 ofType:(uint64_t)a2
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 8), "valueForKey:", a2);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)objc_msgSend(v2, "copy");

    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v3;
    else
      v4 = 0;
    v5 = v4;

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (NSNumber)appVersion
{
  objc_opt_class();
  return (NSNumber *)-[ASDSubscriptionEntitlement _valueForKey:ofType:]((uint64_t)self, (uint64_t)CFSTR("appVersion"));
}

- (BOOL)autoRenewEnabled
{
  void *v3;
  char v4;

  objc_opt_class();
  -[ASDSubscriptionEntitlement _valueForKey:ofType:]((uint64_t)self, (uint64_t)CFSTR("autoRenew"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (NSString)chargeCountryCode
{
  objc_opt_class();
  return (NSString *)-[ASDSubscriptionEntitlement _valueForKey:ofType:]((uint64_t)self, (uint64_t)CFSTR("chargeCountryCode"));
}

- (NSString)chargeCurrencyCode
{
  objc_opt_class();
  return (NSString *)-[ASDSubscriptionEntitlement _valueForKey:ofType:]((uint64_t)self, (uint64_t)CFSTR("chargeCurrencyCode"));
}

- (NSNumber)chargeStoreFrontID
{
  objc_opt_class();
  return (NSNumber *)-[ASDSubscriptionEntitlement _valueForKey:ofType:]((uint64_t)self, (uint64_t)CFSTR("chargeStoreFrontId"));
}

- (NSString)entitlementOriginType
{
  objc_opt_class();
  return (NSString *)-[ASDSubscriptionEntitlement _valueForKey:ofType:]((uint64_t)self, (uint64_t)CFSTR("entitlementOriginType"));
}

- (NSNumber)entitlementSourceAdamID
{
  objc_opt_class();
  return (NSNumber *)-[ASDSubscriptionEntitlement _valueForKey:ofType:]((uint64_t)self, (uint64_t)CFSTR("entitlementSourceAdamId"));
}

- (NSDate)expiryDate
{
  void *v3;
  void *v4;

  objc_opt_class();
  -[ASDSubscriptionEntitlement _valueForKey:ofType:]((uint64_t)self, (uint64_t)CFSTR("expireDate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASDSubscriptionEntitlement _dateFromDateString:]((uint64_t)self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v4;
}

- (id)_dateFromDateString:(uint64_t)a1
{
  void *v2;
  objc_class *v3;
  id v4;
  id v5;
  void *v6;

  v2 = 0;
  if (a1 && a2)
  {
    v3 = (objc_class *)MEMORY[0x1E0CB3578];
    v4 = a2;
    v5 = objc_alloc_init(v3);
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
    objc_msgSend(v5, "setLocale:", v6);
    objc_msgSend(v5, "setDateFormat:", CFSTR("EEE MMM dd HH:mm:ss z yyyy"));
    objc_msgSend(v5, "dateFromString:", v4);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

- (NSString)externalSubscriptionID
{
  objc_opt_class();
  return (NSString *)-[ASDSubscriptionEntitlement _valueForKey:ofType:]((uint64_t)self, (uint64_t)CFSTR("externalSubscriptionId"));
}

- (NSNumber)familyID
{
  objc_opt_class();
  return (NSNumber *)-[ASDSubscriptionEntitlement _valueForKey:ofType:]((uint64_t)self, (uint64_t)CFSTR("familyId"));
}

- (NSNumber)familyRank
{
  objc_opt_class();
  return (NSNumber *)-[ASDSubscriptionEntitlement _valueForKey:ofType:]((uint64_t)self, (uint64_t)CFSTR("familyRank"));
}

- (NSNumber)featureAccessTypeID
{
  objc_opt_class();
  return (NSNumber *)-[ASDSubscriptionEntitlement _valueForKey:ofType:]((uint64_t)self, (uint64_t)CFSTR("featureAccessTypeId"));
}

- (NSNumber)freeTrialPeriodID
{
  objc_opt_class();
  return (NSNumber *)-[ASDSubscriptionEntitlement _valueForKey:ofType:]((uint64_t)self, (uint64_t)CFSTR("freeTrialPeriodId"));
}

- (BOOL)hasFamily
{
  return self->_hasFamily;
}

- (NSNumber)inAppAdamID
{
  objc_opt_class();
  return (NSNumber *)-[ASDSubscriptionEntitlement _valueForKey:ofType:]((uint64_t)self, (uint64_t)CFSTR("inAppAdamId"));
}

- (NSString)inAppVersion
{
  objc_opt_class();
  return (NSString *)-[ASDSubscriptionEntitlement _valueForKey:ofType:]((uint64_t)self, (uint64_t)CFSTR("inAppVersion"));
}

- (NSNumber)initialPurchaseTimestamp
{
  objc_opt_class();
  return (NSNumber *)-[ASDSubscriptionEntitlement _valueForKey:ofType:]((uint64_t)self, (uint64_t)CFSTR("initialPurchaseTimestamp"));
}

- (BOOL)isTrialPeriod
{
  void *v3;
  char v4;

  objc_opt_class();
  -[ASDSubscriptionEntitlement _valueForKey:ofType:]((uint64_t)self, (uint64_t)CFSTR("isTrialPeriod"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)isOfferPeriod
{
  void *v3;
  char v4;

  objc_opt_class();
  -[ASDSubscriptionEntitlement _valueForKey:ofType:]((uint64_t)self, (uint64_t)CFSTR("isOfferPeriod"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)isPurchaser
{
  void *v3;
  char v4;

  objc_opt_class();
  -[ASDSubscriptionEntitlement _valueForKey:ofType:]((uint64_t)self, (uint64_t)CFSTR("isPurchaser"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)isNewsAppPurchase
{
  void *v3;
  char v4;

  objc_opt_class();
  -[ASDSubscriptionEntitlement _valueForKey:ofType:]((uint64_t)self, (uint64_t)CFSTR("isNewsAppPurchase"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)isInGracePeriod
{
  void *v3;
  char v4;

  objc_opt_class();
  -[ASDSubscriptionEntitlement _valueForKey:ofType:]((uint64_t)self, (uint64_t)CFSTR("isGracePeriod"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (NSString)offerID
{
  objc_opt_class();
  return (NSString *)-[ASDSubscriptionEntitlement _valueForKey:ofType:]((uint64_t)self, (uint64_t)CFSTR("offerIdentifier"));
}

- (NSNumber)originalPurchaseDownloadID
{
  objc_opt_class();
  return (NSNumber *)-[ASDSubscriptionEntitlement _valueForKey:ofType:]((uint64_t)self, (uint64_t)CFSTR("originalPurchaseDownloadId"));
}

- (NSString)poolType
{
  objc_opt_class();
  return (NSString *)-[ASDSubscriptionEntitlement _valueForKey:ofType:]((uint64_t)self, (uint64_t)CFSTR("poolType"));
}

- (NSString)productCode
{
  objc_opt_class();
  return (NSString *)-[ASDSubscriptionEntitlement _valueForKey:ofType:]((uint64_t)self, (uint64_t)CFSTR("productCode"));
}

- (NSNumber)promoScenarioID
{
  objc_opt_class();
  return (NSNumber *)-[ASDSubscriptionEntitlement _valueForKey:ofType:]((uint64_t)self, (uint64_t)CFSTR("promoScenarioId"));
}

- (NSNumber)purchasabilityType
{
  objc_opt_class();
  return (NSNumber *)-[ASDSubscriptionEntitlement _valueForKey:ofType:]((uint64_t)self, (uint64_t)CFSTR("purchasabilityType"));
}

- (NSNumber)purchaseDownloadID
{
  objc_opt_class();
  return (NSNumber *)-[ASDSubscriptionEntitlement _valueForKey:ofType:]((uint64_t)self, (uint64_t)CFSTR("purchaseDownloadId"));
}

- (unint64_t)segment
{
  return self->_segment;
}

- (NSNumber)serviceBeginsTimestamp
{
  objc_opt_class();
  return (NSNumber *)-[ASDSubscriptionEntitlement _valueForKey:ofType:]((uint64_t)self, (uint64_t)CFSTR("serviceBeginsTimestamp"));
}

- (NSDate)startDate
{
  void *v3;
  void *v4;

  objc_opt_class();
  -[ASDSubscriptionEntitlement _valueForKey:ofType:]((uint64_t)self, (uint64_t)CFSTR("startDate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASDSubscriptionEntitlement _dateFromDateString:]((uint64_t)self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v4;
}

- (NSNumber)subscriptionBundleID
{
  objc_opt_class();
  return (NSNumber *)-[ASDSubscriptionEntitlement _valueForKey:ofType:]((uint64_t)self, (uint64_t)CFSTR("subscriptionBundleId"));
}

- (NSNumber)quantity
{
  objc_opt_class();
  return (NSNumber *)-[ASDSubscriptionEntitlement _valueForKey:ofType:]((uint64_t)self, (uint64_t)CFSTR("quantity"));
}

- (NSString)vendorAdHocOfferID
{
  objc_opt_class();
  return (NSString *)-[ASDSubscriptionEntitlement _valueForKey:ofType:]((uint64_t)self, (uint64_t)CFSTR("vendorAdHocOfferId"));
}

- (NSString)vendorID
{
  objc_opt_class();
  return (NSString *)-[ASDSubscriptionEntitlement _valueForKey:ofType:]((uint64_t)self, (uint64_t)CFSTR("vendorIdentifier"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_dictionary, CFSTR("dictionary"));
}

- (ASDSubscriptionEntitlement)initWithCoder:(id)a3
{
  id v4;
  ASDSubscriptionEntitlement *v5;
  uint64_t v6;
  NSDictionary *dictionary;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASDSubscriptionEntitlement;
  v5 = -[ASDSubscriptionEntitlement init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodePropertyListForKey:", CFSTR("dictionary"));
    v6 = objc_claimAutoreleasedReturnValue();
    dictionary = v5->_dictionary;
    v5->_dictionary = (NSDictionary *)v6;

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionary, 0);
}

@end
