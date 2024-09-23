@implementation ManagedTransactionInsights

- (_TtC10FinanceKit26ManagedTransactionInsights)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  return -[ManagedTransactionInsights initWithEntity:insertIntoManagedObjectContext:](&v7, sel_initWithEntity_insertIntoManagedObjectContext_, a3, a4);
}

- (void)willSave
{
  _TtC10FinanceKit26ManagedTransactionInsights *v2;

  v2 = self;
  ManagedTransactionInsights.willSave()();

}

@end
