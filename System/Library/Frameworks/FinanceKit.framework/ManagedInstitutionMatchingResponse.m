@implementation ManagedInstitutionMatchingResponse

- (_TtC10FinanceKit34ManagedInstitutionMatchingResponse)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  return -[ManagedInstitutionMatchingResponse initWithEntity:insertIntoManagedObjectContext:](&v7, sel_initWithEntity_insertIntoManagedObjectContext_, a3, a4);
}

- (NSString)description
{
  _TtC10FinanceKit34ManagedInstitutionMatchingResponse *v2;
  void *v3;

  v2 = self;
  ManagedInstitutionMatchingResponse.description.getter();

  v3 = (void *)sub_23361E12C();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

@end
