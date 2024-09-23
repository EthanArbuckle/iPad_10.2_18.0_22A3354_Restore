@implementation ManagedOrder

- (void)awakeFromInsert
{
  objc_class *ObjectType;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC10FinanceKit12ManagedOrder *v8;
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
  -[ManagedOrder awakeFromInsert](&v10, sel_awakeFromInsert);
  sub_23361D5F8();
  v9 = (void *)sub_23361D5B0();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  -[ManagedOrder setCreationDate:](v8, sel_setCreationDate_, v9);

}

- (void)willSave
{
  _TtC10FinanceKit12ManagedOrder *v2;

  v2 = self;
  ManagedOrder.willSave()();

}

- (_TtC10FinanceKit12ManagedOrder)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  return -[ManagedOrder initWithEntity:insertIntoManagedObjectContext:](&v7, sel_initWithEntity_insertIntoManagedObjectContext_, a3, a4);
}

- (void).cxx_construct
{
  _QWORD *v2;

  v2 = (Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC10FinanceKit12ManagedOrder_orderContentTypeKey);
  *v2 = 0xD000000000000010;
  v2[1] = 0x8000000233671BA0;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

- (BOOL)validateForInsert:(id *)a3
{
  return sub_23319DAF8(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void))ManagedOrder.validateForInsert());
}

- (BOOL)validateForUpdate:(id *)a3
{
  return sub_23319DAF8(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void))ManagedOrder.validateForUpdate());
}

@end
