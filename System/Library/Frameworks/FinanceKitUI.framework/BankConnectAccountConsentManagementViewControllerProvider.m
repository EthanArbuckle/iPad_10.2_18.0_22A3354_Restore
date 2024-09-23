@implementation BankConnectAccountConsentManagementViewControllerProvider

+ (id)makeViewControllerWithAccountIdentifier:(id)a3 institutionIdentifier:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  uint64_t v13;

  v4 = type metadata accessor for ConsentManagementView(0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_2339D17C4();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2339D42E4();
  sub_2339D42E4();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_2339D17AC();
  objc_allocWithZone((Class)type metadata accessor for BankConnectAccountConsentManagementViewController(0));
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v6, v10, v7);
  v11 = (void *)sub_2339D30D8();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v11;
}

- (_TtC12FinanceKitUI57BankConnectAccountConsentManagementViewControllerProvider)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for BankConnectAccountConsentManagementViewControllerProvider();
  return -[BankConnectAccountConsentManagementViewControllerProvider init](&v3, sel_init);
}

@end
