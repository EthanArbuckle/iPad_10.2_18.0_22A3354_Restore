@implementation BankConnectAuthorizationViewControllerProvider

+ (id)makeConsentViewControllerWithPaymentPass:(id)a3 fkInstitution:(id)a4 completion:(id)a5
{
  int *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  id v24;
  void *v25;
  uint64_t v27;

  v8 = (int *)type metadata accessor for BankConnectAuthorizationFlowConfig(0);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v27 - v12;
  v14 = _Block_copy(a5);
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = v14;
  v16 = a3;
  v17 = a4;
  sub_2339D4620();
  v18 = &v13[v8[6]];
  v19 = sub_2339D1734();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v18, 1, 1, v19);
  v20 = &v13[v8[7]];
  v21 = *MEMORY[0x24BDCA660];
  v22 = sub_2339D1884();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 104))(v20, v21, v22);
  *(_QWORD *)&v13[v8[5]] = v16;
  sub_233726074((uint64_t)v13, (uint64_t)v11, type metadata accessor for BankConnectAuthorizationFlowConfig);
  v23 = objc_allocWithZone((Class)type metadata accessor for BankConnectAuthorizationViewController(0));
  v24 = v16;
  swift_retain();
  v25 = (void *)sub_2337673E8((uint64_t)v11, (uint64_t)sub_2337684FC, v15);
  swift_release();
  sub_2337260B8((uint64_t)v13, type metadata accessor for BankConnectAuthorizationFlowConfig);

  swift_release();
  return v25;
}

+ (id)makeReconsentViewControllerWithPaymentPass:(id)a3 fkInstitution:(id)a4 previousConsentUUID:(id)a5 completion:(id)a6
{
  int *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  char *v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  id v27;
  void *v28;
  uint64_t v30;

  v10 = (int *)type metadata accessor for BankConnectAuthorizationFlowConfig(0);
  v11 = MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v30 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v30 - v14;
  v16 = _Block_copy(a6);
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = v16;
  v18 = a3;
  v19 = a4;
  v20 = a5;
  sub_2339D4620();
  v21 = &v15[v10[6]];
  v22 = sub_2339D1734();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v21, 1, 1, v22);
  v23 = &v15[v10[7]];
  sub_2339D23C4();
  v24 = *MEMORY[0x24BDCA668];
  v25 = sub_2339D1884();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 104))(v23, v24, v25);
  *(_QWORD *)&v15[v10[5]] = a3;
  sub_233726074((uint64_t)v15, (uint64_t)v13, type metadata accessor for BankConnectAuthorizationFlowConfig);
  v26 = objc_allocWithZone((Class)type metadata accessor for BankConnectAuthorizationViewController(0));
  v27 = v18;
  swift_retain();
  v28 = (void *)sub_2337673E8((uint64_t)v13, (uint64_t)sub_2337684FC, v17);
  swift_release();
  sub_2337260B8((uint64_t)v15, type metadata accessor for BankConnectAuthorizationFlowConfig);

  swift_release();
  return v28;
}

+ (id)makeMismatchedAccountViewControllerWithPaymentPass:(id)a3 fkInstitution:(id)a4 previousConsentUUID:(id)a5 completion:(id)a6
{
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  void *v14;

  v9 = _Block_copy(a6);
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = v9;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = (void *)sub_2337675C0(v11, (uint64_t)v12, (uint64_t)v13, (uint64_t)sub_2337684FC, v10);

  swift_release();
  return v14;
}

+ (id)makeAuthorizationViewControllerFor:(id)a3 completion:(id)a4
{
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;

  v5 = _Block_copy(a4);
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = v5;
  v7 = a3;
  v8 = (void *)sub_233767740(v7, (uint64_t)sub_233768430, v6);

  swift_release();
  return v8;
}

- (_TtC12FinanceKitUI46BankConnectAuthorizationViewControllerProvider)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for BankConnectAuthorizationViewControllerProvider();
  return -[BankConnectAuthorizationViewControllerProvider init](&v3, sel_init);
}

@end
