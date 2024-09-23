@implementation ManagedOrderPaymentTransaction

- (_TtC10FinanceKit30ManagedOrderPaymentTransaction)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  return -[ManagedOrderPaymentTransaction initWithEntity:insertIntoManagedObjectContext:](&v7, sel_initWithEntity_insertIntoManagedObjectContext_, a3, a4);
}

- (void).cxx_construct
{
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  char *v5;

  v2 = (Class *)((char *)&self->super.super.isa
               + OBJC_IVAR____TtC10FinanceKit30ManagedOrderPaymentTransaction_transactionTypeKey);
  *v2 = 0x746361736E617274;
  v2[1] = 0xEF657079546E6F69;
  v3 = (Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC10FinanceKit30ManagedOrderPaymentTransaction_statusKey);
  *v3 = 0x737574617473;
  v3[1] = 0xE600000000000000;
  v4 = (Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC10FinanceKit30ManagedOrderPaymentTransaction_amountKey);
  *v4 = 0x746E756F6D61;
  v4[1] = 0xE600000000000000;
  v5 = (char *)self + OBJC_IVAR____TtC10FinanceKit30ManagedOrderPaymentTransaction_currencyCodeKey;
  strcpy((char *)self + OBJC_IVAR____TtC10FinanceKit30ManagedOrderPaymentTransaction_currencyCodeKey, "currencyCode");
  v5[13] = 0;
  *((_WORD *)v5 + 7) = -5120;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
