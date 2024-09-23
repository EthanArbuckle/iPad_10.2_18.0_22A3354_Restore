@implementation NoOpPaymentTransactionObserver

- (_TtC7NewsUI230NoOpPaymentTransactionObserver)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[NoOpPaymentTransactionObserver init](&v3, sel_init);
}

- (void)paymentQueue:(id)a3 updatedTransactions:(id)a4
{
  unint64_t v6;
  id v7;
  _TtC7NewsUI230NoOpPaymentTransactionObserver *v8;

  sub_1D5E6F04C(0, qword_1F0008828);
  v6 = sub_1D6E26D80();
  v7 = a3;
  v8 = self;
  sub_1D6DC488C(v7, v6);

  swift_bridgeObjectRelease();
}

@end
