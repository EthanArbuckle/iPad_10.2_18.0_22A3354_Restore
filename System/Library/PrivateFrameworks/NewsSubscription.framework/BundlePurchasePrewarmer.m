@implementation BundlePurchasePrewarmer

- (_TtC16NewsSubscription23BundlePurchasePrewarmer)init
{
  _TtC16NewsSubscription23BundlePurchasePrewarmer *result;

  result = (_TtC16NewsSubscription23BundlePurchasePrewarmer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
}

- (void)networkReachabilityDidChange:(id)a3
{
  _TtC16NewsSubscription23BundlePurchasePrewarmer *v5;

  swift_unknownObjectRetain();
  v5 = self;
  if (objc_msgSend(a3, sel_isNetworkReachable))
  {
    sub_1BA2FBD14();
    swift_unknownObjectRelease();

    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();

  }
}

- (void)bundleSubscriptionDidExpire:(id)a3
{
  id v4;
  _TtC16NewsSubscription23BundlePurchasePrewarmer *v5;

  v4 = a3;
  v5 = self;
  sub_1BA2FBD14();

  swift_release();
}

@end
