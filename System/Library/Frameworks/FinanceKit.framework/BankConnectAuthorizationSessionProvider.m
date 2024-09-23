@implementation BankConnectAuthorizationSessionProvider

+ (id)makeProviderAndReturnError:(id *)a3
{
  return sub_2331CA0F8();
}

- (void)authorizationSessionWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD *v7;
  void *v8;
  _TtC10FinanceKit39BankConnectAuthorizationSessionProvider *v9;
  _QWORD v10[6];

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC10FinanceKit39BankConnectAuthorizationSessionProvider_context);
  v7 = (_QWORD *)swift_allocObject();
  v7[2] = self;
  v7[3] = sub_2331CA260;
  v7[4] = v5;
  v10[4] = sub_2331CA2E4;
  v10[5] = v7;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 1107296256;
  v10[2] = sub_2331C9ED4;
  v10[3] = &block_descriptor_10;
  v8 = _Block_copy(v10);
  v9 = self;
  swift_retain();
  swift_release();
  objc_msgSend(v6, sel_performBlock_, v8);
  _Block_release(v8);

  swift_release();
}

- (_TtC10FinanceKit39BankConnectAuthorizationSessionProvider)init
{
  _TtC10FinanceKit39BankConnectAuthorizationSessionProvider *result;

  result = (_TtC10FinanceKit39BankConnectAuthorizationSessionProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10FinanceKit39BankConnectAuthorizationSessionProvider_context));
}

@end
