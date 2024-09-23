@implementation ManagedAccountBalance

- (_TtC10FinanceKit21ManagedAccountBalance)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  return -[ManagedAccountBalance initWithEntity:insertIntoManagedObjectContext:](&v7, sel_initWithEntity_insertIntoManagedObjectContext_, a3, a4);
}

- (BOOL)validateForInsert:(id *)a3
{
  return sub_23319DAF8(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void))ManagedAccountBalance.validateForInsert());
}

- (BOOL)validateForUpdate:(id *)a3
{
  return sub_23319DAF8(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void))ManagedAccountBalance.validateForUpdate());
}

@end
