@implementation ManagedBankConnectTermsAndConditions

- (_TtC10FinanceKit36ManagedBankConnectTermsAndConditions)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  return -[ManagedBankConnectTermsAndConditions initWithEntity:insertIntoManagedObjectContext:](&v7, sel_initWithEntity_insertIntoManagedObjectContext_, a3, a4);
}

- (void)willSave
{
  _TtC10FinanceKit36ManagedBankConnectTermsAndConditions *v2;

  v2 = self;
  ManagedBankConnectTermsAndConditions.willSave()();

}

@end
