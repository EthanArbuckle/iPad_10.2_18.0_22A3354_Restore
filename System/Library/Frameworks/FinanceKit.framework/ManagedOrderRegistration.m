@implementation ManagedOrderRegistration

- (void)awakeFromInsert
{
  _TtC10FinanceKit24ManagedOrderRegistration *v2;

  v2 = self;
  ManagedOrderRegistration.awakeFromInsert()();

}

- (_TtC10FinanceKit24ManagedOrderRegistration)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  return -[ManagedOrderRegistration initWithEntity:insertIntoManagedObjectContext:](&v7, sel_initWithEntity_insertIntoManagedObjectContext_, a3, a4);
}

- (BOOL)validateForInsert:(id *)a3
{
  return sub_23319DAF8(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void))ManagedOrderRegistration.validateForInsert());
}

- (BOOL)validateForUpdate:(id *)a3
{
  return sub_23319DAF8(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void))ManagedOrderRegistration.validateForUpdate());
}

@end
