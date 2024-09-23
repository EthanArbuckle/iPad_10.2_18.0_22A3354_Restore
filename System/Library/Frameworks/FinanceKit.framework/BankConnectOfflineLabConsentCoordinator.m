@implementation BankConnectOfflineLabConsentCoordinator

- (void)loadOfflineLabSharingPreferenceWithCompletion:(id)a3
{
  void *v4;
  _TtC10FinanceKit39BankConnectOfflineLabConsentCoordinator *v5;

  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_233448200(v5, (void (**)(_QWORD, _QWORD, _QWORD))v4);
  _Block_release(v4);
  _Block_release(v4);

}

- (void)saveOfflineLabSharingPermission:(BOOL)a3 withCompletion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _TtC10FinanceKit39BankConnectOfflineLabConsentCoordinator *v14;
  uint64_t v15;

  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254247060);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v10;
  v12 = sub_23361E534();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = 0;
  *(_QWORD *)(v13 + 24) = 0;
  *(_QWORD *)(v13 + 32) = self;
  *(_BYTE *)(v13 + 40) = a3;
  *(_QWORD *)(v13 + 48) = sub_2334481C0;
  *(_QWORD *)(v13 + 56) = v11;
  v14 = self;
  swift_retain();
  sub_2333B205C((uint64_t)v9, (uint64_t)&unk_256050400, v13);

  swift_release();
  swift_release();
}

- (id)offlineLabPrivacyBundleIdentifier
{
  return (id)sub_23361E12C();
}

- (_TtC10FinanceKit39BankConnectOfflineLabConsentCoordinator)init
{
  char *v3;
  objc_class *v4;
  objc_super v6;

  v3 = (char *)self + OBJC_IVAR____TtC10FinanceKit39BankConnectOfflineLabConsentCoordinator__bankConnectService;
  v4 = (objc_class *)type metadata accessor for BankConnectOfflineLabConsentCoordinator();
  *(_OWORD *)v3 = 0u;
  *((_OWORD *)v3 + 1) = 0u;
  *((_QWORD *)v3 + 4) = 0;
  v6.receiver = self;
  v6.super_class = v4;
  return -[BankConnectOfflineLabConsentCoordinator init](&v6, sel_init);
}

- (void).cxx_destruct
{
  sub_233447F74((uint64_t)self + OBJC_IVAR____TtC10FinanceKit39BankConnectOfflineLabConsentCoordinator__bankConnectService);
}

@end
