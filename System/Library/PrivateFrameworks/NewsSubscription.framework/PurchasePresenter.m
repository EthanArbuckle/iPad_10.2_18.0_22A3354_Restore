@implementation PurchasePresenter

- (_TtC16NewsSubscription17PurchasePresenter)init
{
  _TtC16NewsSubscription17PurchasePresenter *result;

  result = (_TtC16NewsSubscription17PurchasePresenter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription17PurchasePresenter_purchaseStarter);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription17PurchasePresenter_familySharingLandingPageLauncher);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription17PurchasePresenter_purchasingSpinnerViewControllerFactory);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16NewsSubscription17PurchasePresenter____lazy_storage___spinnerViewController));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription17PurchasePresenter_urlHandler);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16NewsSubscription17PurchasePresenter_purchaseController));
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription17PurchasePresenter_postPurchaseOnboardingManager);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription17PurchasePresenter_router);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription17PurchasePresenter_onboardingPrewarmer);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription17PurchasePresenter_featureAvailability);
  sub_1BA30A0C8((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription17PurchasePresenter_purchaseContext, (unint64_t *)&qword_1ED5C2760, (void (*)(uint64_t))type metadata accessor for PurchaseContext);
}

- (void)handlePurchaseAddedNotificationWithNotification:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC16NewsSubscription17PurchasePresenter *v9;
  uint64_t v10;

  v4 = sub_1BA435D34();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4, v6);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BA435D1C();
  v9 = self;
  sub_1BA31F920();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

- (void)bundleSubscriptionDidSubscribe:(id)a3
{
  id v4;
  _TtC16NewsSubscription17PurchasePresenter *v5;

  v4 = a3;
  v5 = self;
  sub_1BA321218();

}

@end
