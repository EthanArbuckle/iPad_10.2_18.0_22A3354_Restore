@implementation FKBankConnectTermsAndConditionsViewControllerProvider

+ (id)makeViewControllerWithTermsAndConditionsID:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t *v13;
  void *v14;
  uint64_t v16;

  v3 = type metadata accessor for BankConnectTermsAndConditionsWebView(0);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v16 - v7;
  v9 = sub_2339D42E4();
  v11 = v10;
  objc_allocWithZone((Class)type metadata accessor for BankConnectTermsAndConditionsViewController());
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = v9;
  v12[3] = v11;
  v12[4] = 0;
  v12[5] = 0;
  *(_QWORD *)v8 = sub_23396E670;
  *((_QWORD *)v8 + 1) = v12;
  v8[16] = 0;
  v13 = (uint64_t *)&v8[*(int *)(v3 + 20)];
  *v13 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560D45F8);
  swift_storeEnumTagMultiPayload();
  sub_23396E374((uint64_t)v8, (uint64_t)v5);
  swift_bridgeObjectRetain();
  v14 = (void *)sub_2339D30D8();
  sub_23396E3B8((uint64_t)v8);
  swift_bridgeObjectRelease();
  return v14;
}

+ (id)makeViewControllerWithTermsAndConditionsID:(id)a3 completion:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t *v17;
  void *v18;
  uint64_t v20;

  v5 = type metadata accessor for BankConnectTermsAndConditionsWebView(0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v20 - v9;
  v11 = _Block_copy(a4);
  v12 = sub_2339D42E4();
  v14 = v13;
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = v11;
  objc_allocWithZone((Class)type metadata accessor for BankConnectTermsAndConditionsViewController());
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = v12;
  v16[3] = v14;
  v16[4] = sub_23396E354;
  v16[5] = v15;
  *(_QWORD *)v10 = sub_23396E364;
  *((_QWORD *)v10 + 1) = v16;
  v10[16] = 0;
  v17 = (uint64_t *)&v10[*(int *)(v5 + 20)];
  *v17 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560D45F8);
  swift_storeEnumTagMultiPayload();
  sub_23396E374((uint64_t)v10, (uint64_t)v7);
  swift_bridgeObjectRetain();
  swift_retain();
  v18 = (void *)sub_2339D30D8();
  sub_23396E3B8((uint64_t)v10);
  swift_bridgeObjectRelease();
  swift_release();
  return v18;
}

- (FKBankConnectTermsAndConditionsViewControllerProvider)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FKBankConnectTermsAndConditionsViewControllerProvider;
  return -[FKBankConnectTermsAndConditionsViewControllerProvider init](&v3, sel_init);
}

@end
