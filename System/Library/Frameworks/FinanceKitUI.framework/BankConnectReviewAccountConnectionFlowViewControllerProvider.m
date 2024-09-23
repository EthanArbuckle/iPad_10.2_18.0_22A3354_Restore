@implementation BankConnectReviewAccountConnectionFlowViewControllerProvider

+ (id)makeViewControllerWithInstitution:(id)a3 paymentPass:(id)a4 previousConsentUUID:(id)a5 completion:(id)a6
{
  int *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  uint64_t (**v21)(char);
  void *v22;
  uint64_t v24;
  id v25;

  v10 = (int *)type metadata accessor for BankConnectReviewAccountConnectionFlowView();
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_2339D23DC();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v24 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = _Block_copy(a6);
  v18 = swift_allocObject();
  *(_QWORD *)(v18 + 16) = v17;
  sub_2339D23C4();
  objc_allocWithZone((Class)type metadata accessor for BankConnectReviewAccountConnectionFlowViewController());
  v19 = a4;
  v20 = a3;
  v25 = a5;
  swift_retain();
  sub_2339D4620();
  (*(void (**)(char *, char *, uint64_t))(v14 + 16))(&v12[v10[5]], v16, v13);
  *(_QWORD *)&v12[v10[6]] = v19;
  v21 = (uint64_t (**)(char))&v12[v10[7]];
  *v21 = sub_23373D7E0;
  v21[1] = (uint64_t (*)(char))v18;
  v22 = (void *)sub_2339D30D8();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);

  swift_release();
  return v22;
}

- (_TtC12FinanceKitUI60BankConnectReviewAccountConnectionFlowViewControllerProvider)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for BankConnectReviewAccountConnectionFlowViewControllerProvider();
  return -[BankConnectReviewAccountConnectionFlowViewControllerProvider init](&v3, sel_init);
}

@end
