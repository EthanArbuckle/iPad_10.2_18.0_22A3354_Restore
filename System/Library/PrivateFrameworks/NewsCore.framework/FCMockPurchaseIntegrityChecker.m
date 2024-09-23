@implementation FCMockPurchaseIntegrityChecker

+ (id)mockPurchaseIntegrityCheckForSuccess
{
  FCMockPurchaseIntegrityChecker *v2;

  v2 = objc_alloc_init(FCMockPurchaseIntegrityChecker);
  -[FCMockPurchaseIntegrityChecker setMockedCheckResult:](v2, "setMockedCheckResult:", 0);
  return v2;
}

+ (id)mockPurchaseIntegrityCheckForFailure
{
  FCMockPurchaseIntegrityChecker *v2;

  v2 = objc_alloc_init(FCMockPurchaseIntegrityChecker);
  -[FCMockPurchaseIntegrityChecker setMockedCheckResult:](v2, "setMockedCheckResult:", 1);
  return v2;
}

- (void)isUserEntitledToSubscriptionForPurchaseID:(id)a3 completion:(id)a4
{
  void (**v5)(id, void *);
  FCSubscriptionEntitlement *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  FCSubscriptionEntitlement *v11;
  uint64_t v12;
  void (**v13)(id, void *);

  v13 = (void (**)(id, void *))a4;
  if (!-[FCMockPurchaseIntegrityChecker mockedCheckResult](self, "mockedCheckResult"))
  {
    v6 = [FCSubscriptionEntitlement alloc];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v12) = 0;
    v11 = -[FCSubscriptionEntitlement initWithAppAdamID:inAppAdamID:chargeCurrencyCode:newsAppPurchase:isTrialPeriod:isPurchaser:servicesBundleAdamID:isAmplifyUser:startDate:expiryDate:initialPurchaseTimestamp:serviceBeginsTimestamp:vendorAdHocOfferID:](v6, "initWithAppAdamID:inAppAdamID:chargeCurrencyCode:newsAppPurchase:isTrialPeriod:isPurchaser:servicesBundleAdamID:isAmplifyUser:startDate:expiryDate:initialPurchaseTimestamp:serviceBeginsTimestamp:vendorAdHocOfferID:", v7, v8, CFSTR("mockchargeCurrencyCode"), 1, 0, 0, 0, v12, v9, v10, 0, 0, 0);

    if (v13)
      v13[2](v13, v11);

    goto LABEL_7;
  }
  -[FCMockPurchaseIntegrityChecker mockedCheckResult](self, "mockedCheckResult");
  v5 = v13;
  if (v13)
  {
    v13[2](v13, 0);
LABEL_7:
    v5 = v13;
  }

}

- (unint64_t)mockedCheckResult
{
  return self->_mockedCheckResult;
}

- (void)setMockedCheckResult:(unint64_t)a3
{
  self->_mockedCheckResult = a3;
}

@end
