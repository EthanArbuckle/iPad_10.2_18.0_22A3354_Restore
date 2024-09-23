@implementation PurchaseManager

- (_TtC16NewsSubscription15PurchaseManager)init
{
  _TtC16NewsSubscription15PurchaseManager *result;

  result = (_TtC16NewsSubscription15PurchaseManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();

  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription15PurchaseManager_metricsBuilder);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription15PurchaseManager_sceneProvider);
}

- (void)handleAuthenticateRequest:(id)a3 purchase:(id)a4 purchaseQueue:(id)a5 completion:(id)a6
{
  sub_1BA335824(self, (int)a2, a3, a4, a5, a6, (int)&unk_1E72160F0, (uint64_t)sub_1BA339CBC, (void (*)(id, uint64_t, uint64_t))sub_1BA3394EC);
}

- (void)handleDialogRequest:(id)a3 purchase:(id)a4 purchaseQueue:(id)a5 completion:(id)a6
{
  sub_1BA335824(self, (int)a2, a3, a4, a5, a6, (int)&unk_1E7216050, (uint64_t)sub_1BA339C94, (void (*)(id, uint64_t, uint64_t))sub_1BA339774);
}

- (void)handleEngagementRequest:(id)a3 purchase:(id)a4 purchaseQueue:(id)a5 completion:(id)a6
{
  sub_1BA335824(self, (int)a2, a3, a4, a5, a6, (int)&unk_1E7215F88, (uint64_t)sub_1BA339D10, (void (*)(id, uint64_t, uint64_t))sub_1BA3399FC);
}

- (void)purchaseFailedWithProductID:(id)a3 transactionState:(int64_t)a4 transactionError:(id)a5 ongoingPurchaseEntry:(id)a6
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  _TtC16NewsSubscription15PurchaseManager *v14;
  id v15;

  v10 = sub_1BA437C3C();
  v12 = v11;
  v15 = a5;
  v13 = a6;
  v14 = self;
  sub_1BA336664(v10, v12, a4, v15, v13);

  swift_bridgeObjectRelease();
}

- (void)purchaseFailedForInvalidPurchaseReceiptWithProductID:(id)a3 ongoingPurchaseEntry:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _TtC16NewsSubscription15PurchaseManager *v10;

  v6 = sub_1BA437C3C();
  v8 = v7;
  v9 = a4;
  v10 = self;
  sub_1BA337170(v6, v8, v9);

  swift_bridgeObjectRelease();
}

- (void)purchaseSuccessWithProductID:(id)a3 transaction:(id)a4 chargeCurrencyCode:(id)a5 ongoingPurchaseEntry:(id)a6
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  _TtC16NewsSubscription15PurchaseManager *v17;

  v9 = sub_1BA437C3C();
  v11 = v10;
  v12 = sub_1BA437C3C();
  v14 = v13;
  v15 = a4;
  v16 = a6;
  v17 = self;
  sub_1BA337728(v9, v11, v15, v12, v14, v16);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
