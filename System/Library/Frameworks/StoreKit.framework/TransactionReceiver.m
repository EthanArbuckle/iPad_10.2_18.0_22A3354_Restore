@implementation TransactionReceiver

- (void)receivedTransactions:(id)a3
{
  uint64_t v3;

  if (a3)
    v3 = sub_1AC0F7BC4();
  else
    v3 = 0;
  swift_retain();
  sub_1AC01AA50(v3);
  swift_release();
  swift_bridgeObjectRelease();
}

- (_TtC8StoreKit19TransactionReceiver)init
{
  sub_1AC01B50C();
}

@end
