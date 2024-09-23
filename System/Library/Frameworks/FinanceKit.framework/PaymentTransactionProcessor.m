@implementation PaymentTransactionProcessor

- (_TtC10FinanceKit27PaymentTransactionProcessor)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PaymentTransactionProcessor();
  return -[PaymentTransactionProcessor init](&v3, sel_init);
}

- (void)insertOrUpdateTransaction:(id)a3 forPrimaryAccountIdentifier:(id)a4
{
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  id v9;
  _TtC10FinanceKit27PaymentTransactionProcessor *v10;

  v6 = sub_23361E150();
  v8 = v7;
  v9 = a3;
  v10 = self;
  _s10FinanceKit27PaymentTransactionProcessorC14insertOrUpdate11transaction3forySo09FKPaymentD0C_SStF_0(v9, v6, v8);

  swift_bridgeObjectRelease();
}

- (void)deleteTransactionWithIdentifier:(id)a3 forPrimaryAccountIdentifier:(id)a4
{
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _TtC10FinanceKit27PaymentTransactionProcessor *v12;
  uint64_t v13;
  uint64_t inited;

  v5 = sub_23361E150();
  v7 = v6;
  v8 = sub_23361E150();
  v10 = v9;
  v11 = qword_254245080;
  v12 = self;
  if (v11 != -1)
    swift_once();
  v13 = *((_QWORD *)off_254245078 + 2);
  type metadata accessor for BankConnectPassKitTransactionsDeleter();
  inited = swift_initStackObject();
  *(_QWORD *)(inited + 16) = v13;
  swift_retain();
  _s10FinanceKit27PaymentTransactionProcessorC06deleteD04with3for18bankConnectDeleterySS_SSAA04Bankj4Passb12TransactionsK0CtF_0(v5, v7, v8, v10, inited);
  swift_release();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
