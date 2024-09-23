@implementation ArcadeSubscriptionManager

- (void)dealloc
{
  _TtC19AppStoreKitInternal25ArcadeSubscriptionManager *v2;

  v2 = self;
  ArcadeSubscriptionManager.__deallocating_deinit();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19AppStoreKitInternal25ArcadeSubscriptionManager_paymentQueue));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19AppStoreKitInternal25ArcadeSubscriptionManager_dialogHandler));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC19AppStoreKitInternal25ArcadeSubscriptionManager_activeStoreAccountProvider);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19AppStoreKitInternal25ArcadeSubscriptionManager_stateLock));
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC19AppStoreKitInternal25ArcadeSubscriptionManager_subscriptionEntitlements);
  sub_1D838B5B4(*(void **)((char *)&self->super.isa+ OBJC_IVAR____TtC19AppStoreKitInternal25ArcadeSubscriptionManager_subscriptionState), self->paymentQueue[OBJC_IVAR____TtC19AppStoreKitInternal25ArcadeSubscriptionManager_subscriptionState]);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC19AppStoreKitInternal25ArcadeSubscriptionManager_logger);
}

- (void)entitlementsDidChange
{
  _TtC19AppStoreKitInternal25ArcadeSubscriptionManager *v2;

  v2 = self;
  sub_1D85B3CC8();

}

- (void)handleEngagementRequest:(id)a3 resultHandler:(id)a4
{
  void *v6;
  id v7;
  _TtC19AppStoreKitInternal25ArcadeSubscriptionManager *v8;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = a3;
  v8 = self;
  sub_1D85B9B24(v7, (uint64_t)v8, (void (**)(_QWORD, _QWORD, _QWORD))v6);
  _Block_release(v6);
  _Block_release(v6);

}

- (_TtC19AppStoreKitInternal25ArcadeSubscriptionManager)init
{
  _TtC19AppStoreKitInternal25ArcadeSubscriptionManager *result;

  result = (_TtC19AppStoreKitInternal25ArcadeSubscriptionManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)paymentQueue:(id)a3 updatedTransactions:(id)a4
{
  void *v6;
  objc_class *v7;
  _TtC19AppStoreKitInternal25ArcadeSubscriptionManager *v8;
  SKPaymentQueue v9;
  Swift::OpaquePointer v10;

  sub_1D832F5B8(0, &qword_1F0176738);
  v6 = (void *)sub_1D892B060();
  v7 = (objc_class *)a3;
  v8 = self;
  v9.super.isa = v7;
  v9._internal = v6;
  ArcadeSubscriptionManager.paymentQueue(_:updatedTransactions:)(v9, v10);

  swift_bridgeObjectRelease();
}

@end
