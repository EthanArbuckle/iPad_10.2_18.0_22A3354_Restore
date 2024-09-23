@implementation ApplePayOrderFetchController

- (_TtC12FinanceKitUI28ApplePayOrderFetchController)init
{
  _TtC12FinanceKitUI28ApplePayOrderFetchController *result;

  result = (_TtC12FinanceKitUI28ApplePayOrderFetchController *)sub_2339D4A04();
  __break(1u);
  return result;
}

+ (id)makeFetchController
{
  uint64_t v2;
  objc_class *Controller;
  char *v4;
  objc_super v6;

  sub_2339D0318();
  sub_2339D030C();
  v2 = sub_2339D0300();
  swift_release();
  Controller = (objc_class *)type metadata accessor for ApplePayOrderFetchController();
  v4 = (char *)objc_allocWithZone(Controller);
  *(_QWORD *)&v4[OBJC_IVAR____TtC12FinanceKitUI28ApplePayOrderFetchController_store] = v2;
  v6.receiver = v4;
  v6.super_class = Controller;
  return objc_msgSendSuper2(&v6, sel_init);
}

- (void)fetchAllRowViewModelsForTransactionWithIdentifier:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  NSString *v15;
  _TtC12FinanceKitUI28ApplePayOrderFetchController *v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2560D4880);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_2339D44D0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_2560D13F8;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_2560E1CF0;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_23399737C((uint64_t)v9, (uint64_t)&unk_2560DAAC0, (uint64_t)v14);
  swift_release();
}

- (void).cxx_destruct
{
  swift_release();
}

@end
