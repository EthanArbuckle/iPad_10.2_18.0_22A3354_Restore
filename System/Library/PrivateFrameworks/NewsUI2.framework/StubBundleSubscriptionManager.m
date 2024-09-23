@implementation StubBundleSubscriptionManager

- (FCBundleSubscription)cachedSubscription
{
  return (FCBundleSubscription *)*(id *)self->cachedSubscription;
}

- (FCBundleSubscription)bundleSubscription
{
  return (FCBundleSubscription *)*(id *)self->bundleSubscription;
}

- (FCEntitlementsOverrideProviderType)entitlementsOverrideProvider
{
  return (FCEntitlementsOverrideProviderType *)(id)swift_unknownObjectRetain();
}

- (void)setEntitlementsOverrideProvider:(id)a3
{
  *(_QWORD *)self->entitlementsOverrideProvider = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (FCBundleSubscription)validatedCachedSubscription
{
  return (FCBundleSubscription *)*(id *)self->cachedSubscription;
}

- (void)refreshBundleSubscriptionWithCachePolicy:(unint64_t)a3 completion:(id)a4
{
  void (**v5)(const void *, uint64_t);
  void (**v6)(const void *, uint64_t);
  uint64_t v7;
  void (*v8)(const void *, uint64_t);

  v5 = (void (**)(const void *, uint64_t))_Block_copy(a4);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)self->bundleSubscription;
    v8 = v5[2];
    swift_retain();
    v8(v6, v7);
    _Block_release(v6);
    swift_release();
  }
}

- (void)refreshBundleSubscriptionWithCachePolicy:(unint64_t)a3 hideBundleDetectionUI:(BOOL)a4 completion:(id)a5
{
  void (**v6)(const void *, uint64_t);
  void (**v7)(const void *, uint64_t);
  uint64_t v8;
  void (*v9)(const void *, uint64_t);

  v6 = (void (**)(const void *, uint64_t))_Block_copy(a5);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)self->bundleSubscription;
    v9 = v6[2];
    swift_retain();
    v9(v7, v8);
    _Block_release(v7);
    swift_release();
  }
}

- (id)bundleSubscriptionLookupEntry
{
  return objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D589E0]), sel_init);
}

- (void)prepareForUseWithCompletion:(id)a3
{
  void (**v3)(const void *);
  void (**v4)(const void *);
  void (*v5)(const void *);

  v3 = (void (**)(const void *))_Block_copy(a3);
  if (v3)
  {
    v4 = v3;
    v5 = v3[2];
    swift_retain();
    v5(v4);
    _Block_release(v4);
    swift_release();
  }
}

@end
