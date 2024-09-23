@implementation FCNoOpBundleSubscriptionManager

- (FCNoOpBundleSubscriptionManager)init
{
  FCNoOpBundleSubscriptionManager *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  FCBundleSubscription *cachedSubscription;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)FCNoOpBundleSubscriptionManager;
  v2 = -[FCNoOpBundleSubscriptionManager init](&v8, sel_init);
  if (v2)
  {
    +[FCBundleSubscription subscriptionWithSubscriptionState:bundleChannelIDs:](FCBundleSubscription, "subscriptionWithSubscriptionState:bundleChannelIDs:", 3, MEMORY[0x1E0C9AA60]);
    v3 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v3 + 25);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -25 - v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setAssociatedObject((id)v3, (const void *)(v3 + 1), v4, (void *)1);
    objc_setAssociatedObject((id)v3, (const void *)(-26 - v3), v5, (void *)1);

    cachedSubscription = v2->cachedSubscription;
    v2->cachedSubscription = (FCBundleSubscription *)v3;

  }
  return v2;
}

- (id)bundleSubscriptionLookupEntry
{
  return objc_alloc_init(FCBundleSubscriptionLookUpEntry);
}

- (void)refreshBundleSubscriptionWithCachePolicy:(unint64_t)a3 hideBundleDetectionUI:(BOOL)a4 completion:(id)a5
{
  id v7;
  id v8;

  if (a5)
  {
    v7 = a5;
    -[FCNoOpBundleSubscriptionManager cachedSubscription](self, "cachedSubscription");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, id))a5 + 2))(v7, v8);

  }
}

- (void)refreshBundleSubscriptionWithCachePolicy:(unint64_t)a3 completion:(id)a4
{
  id v6;
  id v7;

  if (a4)
  {
    v6 = a4;
    -[FCNoOpBundleSubscriptionManager cachedSubscription](self, "cachedSubscription");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, id))a4 + 2))(v6, v7);

  }
}

- (void)prepareForUseWithCompletion:(id)a3
{
  if (a3)
    (*((void (**)(id))a3 + 2))(a3);
}

- (FCBundleSubscription)cachedSubscription
{
  return self->cachedSubscription;
}

- (FCBundleSubscription)validatedCachedSubscription
{
  return self->validatedCachedSubscription;
}

- (FCEntitlementsOverrideProviderType)entitlementsOverrideProvider
{
  return self->entitlementsOverrideProvider;
}

- (void)setEntitlementsOverrideProvider:(id)a3
{
  objc_storeStrong((id *)&self->entitlementsOverrideProvider, a3);
}

- (FCBundleSubscription)bundleSubscription
{
  return self->bundleSubscription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->bundleSubscription, 0);
  objc_storeStrong((id *)&self->entitlementsOverrideProvider, 0);
  objc_storeStrong((id *)&self->validatedCachedSubscription, 0);
  objc_storeStrong((id *)&self->cachedSubscription, 0);
}

@end
