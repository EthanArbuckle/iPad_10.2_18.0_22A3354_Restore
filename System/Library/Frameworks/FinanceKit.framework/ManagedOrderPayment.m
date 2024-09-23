@implementation ManagedOrderPayment

- (_TtC10FinanceKit19ManagedOrderPayment)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  return -[ManagedOrderPayment initWithEntity:insertIntoManagedObjectContext:](&v7, sel_initWithEntity_insertIntoManagedObjectContext_, a3, a4);
}

- (void).cxx_construct
{
  _QWORD *v2;

  v2 = (Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC10FinanceKit19ManagedOrderPayment_statusValueKey);
  *v2 = 0x6156737574617473;
  v2[1] = 0xEB0000000065756CLL;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
