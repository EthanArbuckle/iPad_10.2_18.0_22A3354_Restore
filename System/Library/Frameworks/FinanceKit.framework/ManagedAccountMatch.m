@implementation ManagedAccountMatch

- (_TtC10FinanceKit19ManagedAccountMatch)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  return -[ManagedAccountMatch initWithEntity:insertIntoManagedObjectContext:](&v7, sel_initWithEntity_insertIntoManagedObjectContext_, a3, a4);
}

- (void).cxx_construct
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR____TtC10FinanceKit19ManagedAccountMatch_matchingTypeKey;
  strcpy((char *)self + OBJC_IVAR____TtC10FinanceKit19ManagedAccountMatch_matchingTypeKey, "matchingType");
  v2[13] = 0;
  *((_WORD *)v2 + 7) = -5120;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
