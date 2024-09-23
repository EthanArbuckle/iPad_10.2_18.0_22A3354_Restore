@implementation SubscriptionActivationEligibilityProvider

- (int64_t)eligibility
{
  _TtC16NewsSubscription41SubscriptionActivationEligibilityProvider *v2;
  int64_t v3;

  v2 = self;
  v3 = sub_1BA3A5910();

  return v3;
}

- (void)addObserver:(id)a3
{
  _TtC16NewsSubscription41SubscriptionActivationEligibilityProvider *v4;
  _QWORD *v5;
  uint64_t v6;

  sub_1BA3A63B4();
  swift_allocObject();
  swift_unknownObjectRetain_n();
  v4 = self;
  sub_1BA436808();
  v5 = (Class *)((char *)&v4->super.isa
               + OBJC_IVAR____TtC16NewsSubscription41SubscriptionActivationEligibilityProvider_observers);
  v6 = swift_beginAccess();
  MEMORY[0x1BCCDB6C8](v6);
  if (*(_QWORD *)((*v5 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*v5 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    sub_1BA437E1C();
  sub_1BA437E28();
  sub_1BA437DEC();
  swift_endAccess();
  swift_unknownObjectRelease();

}

- (void)removeObserver:(id)a3
{
  uint64_t *v5;
  _TtC16NewsSubscription41SubscriptionActivationEligibilityProvider *v6;
  unint64_t v7;
  uint64_t v8;

  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC16NewsSubscription41SubscriptionActivationEligibilityProvider_observers);
  swift_beginAccess();
  swift_unknownObjectRetain();
  v6 = self;
  v7 = swift_bridgeObjectRetain();
  v8 = sub_1BA3A6460(v7, (uint64_t)a3);
  swift_bridgeObjectRelease();
  *v5 = v8;
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

- (_TtC16NewsSubscription41SubscriptionActivationEligibilityProvider)init
{
  _TtC16NewsSubscription41SubscriptionActivationEligibilityProvider *result;

  result = (_TtC16NewsSubscription41SubscriptionActivationEligibilityProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
}

@end
