@implementation BankConnectEvaluationManagerWrapper

- (_TtC10FinanceKit35BankConnectEvaluationManagerWrapper)init
{
  return (_TtC10FinanceKit35BankConnectEvaluationManagerWrapper *)BankConnectEvaluationManagerWrapper.init()();
}

- (void)reevaluateEligibilityWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC10FinanceKit35BankConnectEvaluationManagerWrapper *v13;
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
  v11[4] = &unk_25604E7A8;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_25604E7B0;
  v12[5] = v11;
  v13 = self;
  sub_2336055F8((uint64_t)v7, (uint64_t)&unk_25604E7B8, (uint64_t)v12);
  swift_release();
}

- (void)reevaluateEligibilityAndReturnShouldReloadDiscoveryItemsWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC10FinanceKit35BankConnectEvaluationManagerWrapper *v13;
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
  v11[4] = &unk_25604E798;
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

- (BOOL)hasAnyEligibleBankConnectCard
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t);
  _TtC10FinanceKit35BankConnectEvaluationManagerWrapper *v7;
  char v8;

  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10FinanceKit35BankConnectEvaluationManagerWrapper_manager);
  v4 = v3[3];
  v5 = v3[4];
  __swift_project_boxed_opaque_existential_1(v3, v4);
  v6 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 16);
  v7 = self;
  v8 = v6(v4, v5);

  return v8 & 1;
}

- (BOOL)hasAnyConnectedCardWithBankConnect
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t);
  _TtC10FinanceKit35BankConnectEvaluationManagerWrapper *v7;
  char v8;

  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10FinanceKit35BankConnectEvaluationManagerWrapper_manager);
  v4 = v3[3];
  v5 = v3[4];
  __swift_project_boxed_opaque_existential_1(v3, v4);
  v6 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 24);
  v7 = self;
  v8 = v6(v4, v5);

  return v8 & 1;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR____TtC10FinanceKit35BankConnectEvaluationManagerWrapper_manager);
}

@end
