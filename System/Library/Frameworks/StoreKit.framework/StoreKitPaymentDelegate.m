@implementation StoreKitPaymentDelegate

- (_TtC8StoreKit23StoreKitPaymentDelegate)init
{
  return (_TtC8StoreKit23StoreKitPaymentDelegate *)sub_1AC09E514();
}

- (void)shouldContinueTransactionWithNewStorefront:(id)a3 replyBlock:(id)a4
{
  void *v4;

  v4 = _Block_copy(a4);
  sub_1AC0F79CC();
  *(_QWORD *)(swift_allocObject() + 16) = v4;
  swift_retain();
  sub_1AC09E570();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
}

- (void)handleEngagementRequest:(id)a3 replyBlock:(id)a4
{
  void *v5;
  id v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;

  v5 = _Block_copy(a4);
  v6 = a3;
  swift_retain();
  v7 = sub_1AC0F748C();
  v9 = v8;

  *(_QWORD *)(swift_allocObject() + 16) = v5;
  sub_1AC09E9A8();
  swift_release();
  sub_1ABFC8B84(v7, v9);
  swift_release();
}

@end
