@implementation PaywallInteractor

- (_TtC16NewsSubscription17PaywallInteractor)init
{
  _TtC16NewsSubscription17PaywallInteractor *result;

  result = (_TtC16NewsSubscription17PaywallInteractor *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1BA3110FC((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription17PaywallInteractor_delegate);
  sub_1BA391D8C((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription17PaywallInteractor_tracker, (unint64_t *)&qword_1ED5BEEE0, (unint64_t *)&qword_1ED5BEED0, (uint64_t)&protocol descriptor for PaywallTrackerType);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription17PaywallInteractor_webAccessAuthenticatorFactory);
  sub_1BA391D8C((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription17PaywallInteractor_webAccessAuthenticator, &qword_1ED5BF640, (unint64_t *)&qword_1ED5BF630, (uint64_t)&protocol descriptor for WebAccessAuthenticatorType);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription17PaywallInteractor_webAccessConversionEventReporter);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription17PaywallInteractor_paidBundleViaOfferFeatureAvailability);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription17PaywallInteractor_personalizedPaywallDataService);
}

- (void)bundleSubscriptionDidSubscribe:(id)a3
{
  char *v5;
  uint64_t v6;
  uint64_t ObjectType;
  void (*v8)(uint64_t, uint64_t);
  id v9;
  _TtC16NewsSubscription17PaywallInteractor *v10;

  v5 = (char *)self + OBJC_IVAR____TtC16NewsSubscription17PaywallInteractor_delegate;
  swift_beginAccess();
  if (MEMORY[0x1BCCDC4E4](v5))
  {
    v6 = *((_QWORD *)v5 + 1);
    ObjectType = swift_getObjectType();
    v8 = *(void (**)(uint64_t, uint64_t))(v6 + 32);
    v9 = a3;
    v10 = self;
    v8(ObjectType, v6);

    swift_unknownObjectRelease();
  }
}

@end
