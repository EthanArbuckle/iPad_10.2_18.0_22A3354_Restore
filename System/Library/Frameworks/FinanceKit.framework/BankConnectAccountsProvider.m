@implementation BankConnectAccountsProvider

- (FKBankConnectAccountsProviderDelegate)delegate
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR____TtC10FinanceKit27BankConnectAccountsProvider_delegate;
  swift_beginAccess();
  return (FKBankConnectAccountsProviderDelegate *)(id)MEMORY[0x23493465C](v2);
}

- (void)setDelegate:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

+ (id)makeProviderWithPrimaryAccountIdentifier:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  id v5;

  v3 = sub_23361E150();
  v5 = sub_2333B665C(v3, v4);
  swift_bridgeObjectRelease();
  return v5;
}

+ (id)makeProviderWithPrimaryAccountIdentifier:(id)a3 returnError:(id *)a4
{
  uint64_t v4;
  uint64_t v5;
  id v6;

  v4 = sub_23361E150();
  v6 = sub_2333B6750(v4, v5);
  swift_bridgeObjectRelease();
  return v6;
}

- (void)accountAndReconsentStatusWithCompletion:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC10FinanceKit27BankConnectAccountsProvider *v13;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254247060);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = sub_23361E534();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_25604C740;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_2560574C0;
  v12[5] = v11;
  v13 = self;
  sub_2336055F8((uint64_t)v7, (uint64_t)&unk_25604C750, (uint64_t)v12);
  swift_release();
}

- (_TtC10FinanceKit27BankConnectAccountsProvider)init
{
  _TtC10FinanceKit27BankConnectAccountsProvider *result;

  result = (_TtC10FinanceKit27BankConnectAccountsProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR____TtC10FinanceKit27BankConnectAccountsProvider_consentStore);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR____TtC10FinanceKit27BankConnectAccountsProvider_persistentHistoryTransactionProvider);
  swift_release();

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10FinanceKit27BankConnectAccountsProvider_lastNotificationToken));
  swift_release();
  swift_bridgeObjectRelease();
  sub_233291C90((uint64_t)self + OBJC_IVAR____TtC10FinanceKit27BankConnectAccountsProvider_delegate);
}

@end
