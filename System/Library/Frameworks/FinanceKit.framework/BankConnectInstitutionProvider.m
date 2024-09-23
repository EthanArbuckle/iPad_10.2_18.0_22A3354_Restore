@implementation BankConnectInstitutionProvider

- (FKBankConnectInstitutionsProviderDelegate)delegate
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR____TtC10FinanceKit30BankConnectInstitutionProvider_delegate;
  swift_beginAccess();
  return (FKBankConnectInstitutionsProviderDelegate *)(id)MEMORY[0x23493465C](v2);
}

- (void)setDelegate:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

+ (id)makeProviderAndReturnError:(id *)a3
{
  uint64_t v3;
  objc_class *v4;
  char *v5;
  objc_super v7;

  if (qword_254247048 != -1)
    swift_once();
  v3 = *((_QWORD *)off_254247040 + 2);
  v4 = (objc_class *)type metadata accessor for BankConnectInstitutionProvider();
  v5 = (char *)objc_allocWithZone(v4);
  swift_unknownObjectWeakInit();
  *(_QWORD *)&v5[OBJC_IVAR____TtC10FinanceKit30BankConnectInstitutionProvider_store] = v3;
  v7.receiver = v5;
  v7.super_class = v4;
  swift_retain();
  return objc_msgSendSuper2(&v7, sel_init);
}

- (void)institutionFor:(id)a3 completion:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _TtC10FinanceKit30BankConnectInstitutionProvider *v16;
  uint64_t v17;

  v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254247060);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a4);
  v10 = sub_23361E150();
  v12 = v11;
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = v9;
  v14 = sub_23361E534();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v8, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = self;
  v15[5] = v10;
  v15[6] = v12;
  v15[7] = sub_233582CD4;
  v15[8] = v13;
  v16 = self;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_2333B205C((uint64_t)v8, (uint64_t)&unk_256056140, (uint64_t)v15);

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
}

- (_TtC10FinanceKit30BankConnectInstitutionProvider)init
{
  _TtC10FinanceKit30BankConnectInstitutionProvider *result;

  result = (_TtC10FinanceKit30BankConnectInstitutionProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  sub_233291C90((uint64_t)self + OBJC_IVAR____TtC10FinanceKit30BankConnectInstitutionProvider_delegate);
}

@end
