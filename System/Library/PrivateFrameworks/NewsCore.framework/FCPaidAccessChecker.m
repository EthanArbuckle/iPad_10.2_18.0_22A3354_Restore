@implementation FCPaidAccessChecker

- (FCPurchaseProviderType)purchaseProvider
{
  return self->_purchaseProvider;
}

- (BOOL)canGetBundleSubscriptionToChannel:(id)a3
{
  return -[FCPaidAccessChecker _canGetBundleSubscriptionToChannel:]((uint64_t)self, a3);
}

- (uint64_t)_canGetBundleSubscriptionToChannel:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = a2;
  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 24), "configuration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "paidBundleConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "areMagazinesEnabled");

    if (v6)
    {
      objc_msgSend((id)a1, "bundleSubscriptionProvider");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "bundleSubscription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "bundleChannelIDs");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "count");

      if (v10)
      {
        objc_msgSend((id)a1, "bundleSubscriptionProvider");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "bundleSubscription");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "bundleChannelIDs");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "identifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        a1 = objc_msgSend(v13, "containsObject:", v14);

      }
      else
      {
        a1 = 1;
      }
    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
}

- (FCBundleSubscriptionProviderType)bundleSubscriptionProvider
{
  return self->_bundleSubscriptionProvider;
}

- (FCPaidAccessChecker)initWithPurchaseProvider:(id)a3 bundleSubscriptionProvider:(id)a4 configurationManager:(id)a5
{
  id v9;
  id v10;
  id v11;
  FCPaidAccessChecker *v12;
  FCPaidAccessChecker *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)FCPaidAccessChecker;
  v12 = -[FCPaidAccessChecker init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_purchaseProvider, a3);
    objc_storeStrong((id *)&v13->_bundleSubscriptionProvider, a4);
    objc_storeStrong((id *)&v13->_configurationManager, a5);
  }

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_storeStrong((id *)&self->_bundleSubscriptionProvider, 0);
  objc_storeStrong((id *)&self->_purchaseProvider, 0);
}

- (BOOL)canGetAccessToItemPaid:(BOOL)a3 bundlePaid:(BOOL)a4 channel:(id)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v8;
  void *v9;
  void *v10;
  FCPaidAccessChecker *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  char v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  BOOL v29;
  void *v31;
  char v32;
  void *v33;
  void *v34;

  v5 = a4;
  v6 = a3;
  v8 = a5;
  v9 = v8;
  if (!v6 && !v5)
    goto LABEL_18;
  objc_msgSend(v8, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = self;
  v12 = v10;
  -[FCPaidAccessChecker bundleSubscriptionProvider](v11, "bundleSubscriptionProvider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCPaidAccessChecker purchaseProvider](v11, "purchaseProvider");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v13;
  v16 = v14;
  v17 = v12;
  if (v16)
  {
    if (v6)
    {
      objc_msgSend(v16, "purchasedTagIDs");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "containsObject:", v17);

      if ((v19 & 1) != 0)
        goto LABEL_12;
    }
  }
  if (!v15 || !v5)
    goto LABEL_13;
  v20 = v15;
  v21 = v17;
  if (!v21)
    goto LABEL_10;
  objc_msgSend(v20, "bundleSubscription");
  v33 = v21;
  v22 = objc_claimAutoreleasedReturnValue();
  objc_getAssociatedObject((id)v22, (const void *)(v22 + 1));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v31, "unsignedIntegerValue");
  v24 = v23;
  objc_getAssociatedObject((id)v22, (const void *)~v23);
  v34 = v20;
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "unsignedIntegerValue") ^ v24;

  v20 = v34;
  v21 = v33;
  if ((v26 & 1) == 0)
  {
LABEL_10:

    goto LABEL_13;
  }
  objc_msgSend(v34, "bundleSubscription");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "bundleChannelIDs");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v28, "containsObject:", v33);

  if ((v32 & 1) != 0)
  {
LABEL_12:

    goto LABEL_18;
  }
LABEL_13:

  if ((!v11 || !v6 || (objc_msgSend(v9, "isPurchaseSetup") & 1) == 0)
    && (!v5 || (-[FCPaidAccessChecker _canGetBundleSubscriptionToChannel:]((uint64_t)v11, v9) & 1) == 0))
  {
    v29 = 0;
    goto LABEL_19;
  }
LABEL_18:
  v29 = 1;
LABEL_19:

  return v29;
}

- (BOOL)canGetSubscriptionToChannel:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  v5 = v4;
  if (self && (objc_msgSend(v4, "isPurchaseSetup") & 1) != 0)
    v6 = 1;
  else
    v6 = -[FCPaidAccessChecker _canGetBundleSubscriptionToChannel:]((uint64_t)self, v5);

  return v6;
}

- (BOOL)isPreparedForUse
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  -[FCPaidAccessChecker bundleSubscriptionProvider](self, "bundleSubscriptionProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleSubscription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleChannelIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count") != 0;

  return v5;
}

- (void)prepareForUseWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[FCPaidAccessChecker bundleSubscriptionProvider](self, "bundleSubscriptionProvider");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "prepareForUseWithCompletion:", v4);

}

@end
