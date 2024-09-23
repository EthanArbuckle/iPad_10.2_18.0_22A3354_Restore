@implementation ManagedOrderImageData

- (void)willSave
{
  _TtC10FinanceKit21ManagedOrderImageData *v2;

  v2 = self;
  ManagedOrderImageData.willSave()();

}

- (_TtC10FinanceKit21ManagedOrderImageData)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  return -[ManagedOrderImageData initWithEntity:insertIntoManagedObjectContext:](&v7, sel_initWithEntity_insertIntoManagedObjectContext_, a3, a4);
}

@end
