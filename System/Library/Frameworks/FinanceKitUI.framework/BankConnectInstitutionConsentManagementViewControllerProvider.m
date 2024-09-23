@implementation BankConnectInstitutionConsentManagementViewControllerProvider

+ (id)makeViewControllerWithInstitutionIdentifier:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  char *v7;

  v3 = sub_2339D42E4();
  v5 = v4;
  v6 = objc_allocWithZone((Class)type metadata accessor for BankConnectInstitutionConsentManagementViewController());
  swift_bridgeObjectRetain();
  v7 = sub_2338A3134(v3, v5);
  swift_bridgeObjectRelease();
  return v7;
}

- (_TtC12FinanceKitUI61BankConnectInstitutionConsentManagementViewControllerProvider)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for BankConnectInstitutionConsentManagementViewControllerProvider();
  return -[BankConnectInstitutionConsentManagementViewControllerProvider init](&v3, sel_init);
}

@end
