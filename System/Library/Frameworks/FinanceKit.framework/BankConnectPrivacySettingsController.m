@implementation BankConnectPrivacySettingsController

- (_TtC10FinanceKit36BankConnectPrivacySettingsController)initWithBundleID:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_class *v8;
  _TtC10FinanceKit36BankConnectPrivacySettingsController *v9;
  uint64_t *v10;
  objc_super v12;
  __int128 v13;
  ValueMetadata *v14;
  _UNKNOWN **v15;

  v4 = sub_23361E150();
  v6 = v5;
  v7 = OBJC_IVAR____TtC10FinanceKit36BankConnectPrivacySettingsController_authorizationManager;
  type metadata accessor for AppAuthorizationStateManager();
  v8 = (objc_class *)swift_allocObject();
  v14 = &type metadata for FinancialDataTCC;
  v15 = &protocol witness table for FinancialDataTCC;
  v9 = self;
  *((_QWORD *)v8 + 2) = sub_233160224(MEMORY[0x24BEE4AF8]);
  sub_23318B020(&v13, (uint64_t)v8 + 24);
  *(Class *)((char *)&self->super.isa + v7) = v8;
  v10 = (uint64_t *)((char *)v9 + OBJC_IVAR____TtC10FinanceKit36BankConnectPrivacySettingsController_bundleID);
  *v10 = v4;
  v10[1] = v6;

  v12.receiver = v9;
  v12.super_class = (Class)type metadata accessor for BankConnectPrivacySettingsController();
  return -[BankConnectPrivacySettingsController init](&v12, sel_init);
}

- (unint64_t)authorizationType
{
  uint64_t v2;
  uint64_t v3;
  _TtC10FinanceKit36BankConnectPrivacySettingsController *v4;
  unint64_t v5;

  v2 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC10FinanceKit36BankConnectPrivacySettingsController_bundleID);
  v3 = *(_QWORD *)&self->bundleID[OBJC_IVAR____TtC10FinanceKit36BankConnectPrivacySettingsController_bundleID];
  v4 = self;
  v5 = AppAuthorizationStateManager.authorizationType(bundleID:)(v2, v3);

  return v5;
}

- (_TtC10FinanceKit36BankConnectPrivacySettingsController)init
{
  _TtC10FinanceKit36BankConnectPrivacySettingsController *result;

  result = (_TtC10FinanceKit36BankConnectPrivacySettingsController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
}

@end
