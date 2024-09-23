@implementation LocationSearchService

- (_TtC12FinanceKitUI21LocationSearchService)init
{
  return (_TtC12FinanceKitUI21LocationSearchService *)sub_23392BA48();
}

- (void)dealloc
{
  void *v2;
  _TtC12FinanceKitUI21LocationSearchService *v3;
  objc_super v4;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12FinanceKitUI21LocationSearchService_completer);
  v3 = self;
  objc_msgSend(v2, sel_cancel);
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for LocationSearchService();
  -[LocationSearchService dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{

  sub_23392D464((uint64_t)self + OBJC_IVAR____TtC12FinanceKitUI21LocationSearchService_resultsContinuation);
}

- (void)completerDidUpdateResults:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  id v11;
  _TtC12FinanceKitUI21LocationSearchService *v12;
  uint64_t v13;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2560D4880);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_2339D44D0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 1, 1, v8);
  v9 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v10 = (_QWORD *)swift_allocObject();
  v10[2] = 0;
  v10[3] = 0;
  v10[4] = a3;
  v10[5] = v9;
  v11 = a3;
  v12 = self;
  sub_23387C704((uint64_t)v7, (uint64_t)&unk_2560E0908, (uint64_t)v10);
  swift_release();

}

- (void)completer:(id)a3 didFailWithError:(id)a4
{
  id v6;
  _TtC12FinanceKitUI21LocationSearchService *v7;
  id v8;

  v6 = a3;
  v8 = a4;
  v7 = self;
  sub_23392D2DC(v8);

}

@end
