@implementation PaidBundleViaOfferUIHandler

- (_TtC7NewsUI227PaidBundleViaOfferUIHandler)init
{
  _TtC7NewsUI227PaidBundleViaOfferUIHandler *result;

  result = (_TtC7NewsUI227PaidBundleViaOfferUIHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI227PaidBundleViaOfferUIHandler_notificationService);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI227PaidBundleViaOfferUIHandler_paidBundleViaOfferHandler);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI227PaidBundleViaOfferUIHandler_featureAvailability);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI227PaidBundleViaOfferUIHandler_tracker);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI227PaidBundleViaOfferUIHandler_router);
  sub_1D5EC4E54((uint64_t)self + OBJC_IVAR____TtC7NewsUI227PaidBundleViaOfferUIHandler_sessionBadgeSource, (unint64_t *)&unk_1ED60B6B0, (uint64_t (*)(uint64_t))MEMORY[0x1E0D53948]);
  sub_1D65AA4C4(*(id *)((char *)&self->super.isa
                      + OBJC_IVAR____TtC7NewsUI227PaidBundleViaOfferUIHandler____lazy_storage___paidBundleViaOfferConfig));
}

- (void)bundleSubscriptionDidSubscribe:(id)a3
{
  id v5;
  _TtC7NewsUI227PaidBundleViaOfferUIHandler *v6;
  _TtC7NewsUI227PaidBundleViaOfferUIHandler *v7;
  id v8;

  __swift_project_boxed_opaque_existential_1((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7NewsUI227PaidBundleViaOfferUIHandler_featureAvailability), *(_QWORD *)&self->notificationService[OBJC_IVAR____TtC7NewsUI227PaidBundleViaOfferUIHandler_featureAvailability + 8]);
  v5 = a3;
  v6 = self;
  sub_1D6E1BDAC();
  *(_QWORD *)(swift_allocObject() + 16) = v6;
  v7 = v6;
  v8 = (id)sub_1D6E1AB4C();
  sub_1D6E1AC24();

  swift_release();
  swift_release();
  swift_release();

}

- (void)pushPayload:(id)a3 withBadgeRequest:(id)a4
{
  id v6;
  id v7;
  _TtC7NewsUI227PaidBundleViaOfferUIHandler *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1D6B802D0(v7);

}

@end
