@implementation ASDSubscriptionEntitlement(FCAdditions)

- (id)description
{
  void *v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  const __CFString *v6;
  void *v7;

  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "inAppAdamID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "offerID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(a1, "isTrialPeriod"))
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  if (objc_msgSend(a1, "isPurchaser"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  objc_msgSend(v2, "stringWithFormat:", CFSTR("{purchaseId=%@, offerId=%@, isTrialPeriod=%@, isPurchaser=%@}"), v3, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)servicesBundlePurchaseID
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;

  objc_opt_class();
  objc_msgSend(a1, "subscriptionBundleID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v3 = v2;
    else
      v3 = 0;
  }
  else
  {
    v3 = 0;
  }
  v4 = v3;

  if (v4)
  {
    if (objc_msgSend(v4, "intValue"))
    {
      objc_msgSend(v4, "stringValue");
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }
  }
  else
  {
    objc_opt_class();
    objc_msgSend(a1, "subscriptionBundleID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v7 = v6;
      else
        v7 = 0;
    }
    else
    {
      v7 = 0;
    }
    v5 = v7;

  }
  return v5;
}

@end
