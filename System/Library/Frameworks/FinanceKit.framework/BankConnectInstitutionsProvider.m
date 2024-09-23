@implementation BankConnectInstitutionsProvider

- (FKBankConnectInstitutionsProviderDelegate)delegate
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR____TtC10FinanceKit31BankConnectInstitutionsProvider_delegate;
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
  id v3;
  uint64_t v4;
  id v5;

  if (qword_254247048 != -1)
    swift_once();
  v3 = objc_allocWithZone((Class)type metadata accessor for BankConnectInstitutionsProvider());
  v4 = swift_retain();
  v5 = sub_233543538(v4);
  swift_release();
  return v5;
}

- (void)fetchConnectedInstitutionsWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD *v7;
  void *v8;
  _TtC10FinanceKit31BankConnectInstitutionsProvider *v9;
  _QWORD v10[6];

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10FinanceKit31BankConnectInstitutionsProvider_context);
  v7 = (_QWORD *)swift_allocObject();
  v7[2] = self;
  v7[3] = sub_233543960;
  v7[4] = v5;
  v10[4] = sub_23354397C;
  v10[5] = v7;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 1107296256;
  v10[2] = sub_2331C9ED4;
  v10[3] = &block_descriptor_31_0;
  v8 = _Block_copy(v10);
  v9 = self;
  swift_retain();
  swift_release();
  objc_msgSend(v6, sel_performBlock_, v8);
  _Block_release(v8);
  swift_release();

}

- (_TtC10FinanceKit31BankConnectInstitutionsProvider)init
{
  _TtC10FinanceKit31BankConnectInstitutionsProvider *result;

  result = (_TtC10FinanceKit31BankConnectInstitutionsProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10FinanceKit31BankConnectInstitutionsProvider_lastNotificationToken));
  swift_release();
  sub_233291C90((uint64_t)self + OBJC_IVAR____TtC10FinanceKit31BankConnectInstitutionsProvider_delegate);
}

@end
