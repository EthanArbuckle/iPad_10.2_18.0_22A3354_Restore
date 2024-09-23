@implementation OfferManager

- (_TtC16NewsSubscription12OfferManager)init
{
  _TtC16NewsSubscription12OfferManager *result;

  result = (_TtC16NewsSubscription12OfferManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  sub_1BA30A104((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription12OfferManager_lastSessionEndTime, (unint64_t *)&qword_1ED5BCD00, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  swift_unknownObjectRelease();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription12OfferManager_featureAvailability);
  swift_bridgeObjectRelease();
}

- (void)networkReachabilityDidChange:(id)a3
{
  _TtC16NewsSubscription12OfferManager *v5;

  swift_unknownObjectRetain();
  v5 = self;
  sub_1BA37B374(a3);
  swift_unknownObjectRelease();

}

- (void)bundleSubscriptionDidSubscribe:(id)a3
{
  id v4;
  _TtC16NewsSubscription12OfferManager *v5;

  v4 = a3;
  v5 = self;
  sub_1BA37C4AC();

}

- (void)bundleSubscriptionDidExpire:(id)a3
{
  id v4;
  _TtC16NewsSubscription12OfferManager *v5;

  v4 = a3;
  v5 = self;
  sub_1BA37C5EC();

}

@end
