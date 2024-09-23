@implementation AllPurchaseTransactionObserver

- (_TtC16NewsSubscription30AllPurchaseTransactionObserver)init
{
  _TtC16NewsSubscription30AllPurchaseTransactionObserver *result;

  result = (_TtC16NewsSubscription30AllPurchaseTransactionObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription30AllPurchaseTransactionObserver_inAppSubscriptionStatusChecker);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16NewsSubscription30AllPurchaseTransactionObserver_tagController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16NewsSubscription30AllPurchaseTransactionObserver_purchaseController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16NewsSubscription30AllPurchaseTransactionObserver_subscriptionController));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription30AllPurchaseTransactionObserver_purchaseAdContextEntriesManager);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription30AllPurchaseTransactionObserver_webOptinFlowManager);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription30AllPurchaseTransactionObserver_trackerProvider);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription30AllPurchaseTransactionObserver_router);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription30AllPurchaseTransactionObserver_familySharingLandingPageLauncher);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16NewsSubscription30AllPurchaseTransactionObserver_entitlementService));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription30AllPurchaseTransactionObserver_postPurchaseOnboardingManager);
}

- (void)handlePurchaseAddedNotificationWithNotification:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC16NewsSubscription30AllPurchaseTransactionObserver *v9;
  uint64_t v10;

  v4 = sub_1BA435D34();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4, v6);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BA435D1C();
  v9 = self;
  sub_1BA3DF9E0();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

- (void)bundleSubscriptionDidSubscribe:(id)a3 hideBundleDetectionUI:(BOOL)a4
{
  id v6;
  _TtC16NewsSubscription30AllPurchaseTransactionObserver *v7;

  v6 = a3;
  v7 = self;
  sub_1BA3E157C(a4);

}

@end
