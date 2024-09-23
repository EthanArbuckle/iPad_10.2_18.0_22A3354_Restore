@implementation ManagedPendingApplePayTransactionRegistration

- (void)awakeFromInsert
{
  objc_class *ObjectType;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC10FinanceKit45ManagedPendingApplePayTransactionRegistration *v8;
  void *v9;
  objc_super v10;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = sub_23361D634();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10.receiver = self;
  v10.super_class = ObjectType;
  v8 = self;
  -[ManagedPendingApplePayTransactionRegistration awakeFromInsert](&v10, sel_awakeFromInsert);
  sub_23361D5F8();
  v9 = (void *)sub_23361D5B0();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  -[ManagedPendingApplePayTransactionRegistration setCreationDate:](v8, sel_setCreationDate_, v9);

}

- (_TtC10FinanceKit45ManagedPendingApplePayTransactionRegistration)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  return -[ManagedPendingApplePayTransactionRegistration initWithEntity:insertIntoManagedObjectContext:](&v7, sel_initWithEntity_insertIntoManagedObjectContext_, a3, a4);
}

- (void).cxx_construct
{
  _QWORD *v2;
  _QWORD *v3;

  v2 = (Class *)((char *)&self->super.super.isa
               + OBJC_IVAR____TtC10FinanceKit45ManagedPendingApplePayTransactionRegistration_transactionIdentifierKey);
  *v2 = 0xD000000000000015;
  v2[1] = 0x8000000233669D30;
  v3 = (Class *)((char *)&self->super.super.isa
               + OBJC_IVAR____TtC10FinanceKit45ManagedPendingApplePayTransactionRegistration_privateKeyKey);
  *v3 = 0x4B65746176697270;
  v3[1] = 0xEA00000000007965;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
