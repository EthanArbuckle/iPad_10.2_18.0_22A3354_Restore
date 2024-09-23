@implementation FPFSSearchEnumerator

- (void)dealloc
{
  _TtC9libfssync20FPFSSearchEnumerator *v2;
  objc_super v3;

  v2 = self;
  sub_23AF24D94();
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for FPFSSearchEnumerator();
  -[FPFSSearchEnumerator dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_unknownObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC9libfssync20FPFSSearchEnumerator_logger;
  v4 = sub_23B1C5E4C();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  sub_23AAB7948(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC9libfssync20FPFSSearchEnumerator_keepAlive));

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)invalidate
{
  _TtC9libfssync20FPFSSearchEnumerator *v2;

  v2 = self;
  sub_23AF24D94();

}

- (void)currentSyncAnchorWithCompletion:(id)a3
{
  void *v4;
  _TtC9libfssync20FPFSSearchEnumerator *v5;

  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_23AF26D2C(v5, (void (**)(_QWORD, _QWORD, _QWORD))v4);
  _Block_release(v4);
  _Block_release(v4);

}

- (void)enumerateItemsFromPage:(id)a3 suggestedPageSize:(int64_t)a4 reply:(id)a5
{
  void *v8;
  id v9;
  _TtC9libfssync20FPFSSearchEnumerator *v10;

  v8 = _Block_copy(a5);
  _Block_copy(v8);
  v9 = a3;
  v10 = self;
  sub_23AF2764C(v9, a4, (char *)v10, v8);
  _Block_release(v8);
  _Block_release(v8);

}

- (void)enumerateItemsFromPage:(id)a3 suggestedPageSize:(int64_t)a4 upTo:(int64_t)a5 reply:(id)a6
{
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  uint64_t v12;
  uint64_t v13;
  char *v14;
  void (**v15)(void *, _QWORD, void *);
  id v16;
  _TtC9libfssync20FPFSSearchEnumerator *v17;
  void *v18;
  void *v19;
  uint64_t v20;

  v9 = sub_23B1C545C();
  MEMORY[0x24BDAC7A8](v9);
  v10 = sub_23B1C5474();
  v11 = (uint64_t (*)(uint64_t))MEMORY[0x24BDCAEE8];
  v12 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = (void (**)(void *, _QWORD, void *))_Block_copy(a6);
  v16 = a3;
  v17 = self;
  sub_23B1C5378();
  sub_23AAB75BC(MEMORY[0x24BEE4AF8]);
  sub_23AA7E38C((unint64_t *)&qword_2569E8150, v11, MEMORY[0x24BDCAEE0]);
  sub_23B1C5864();
  v18 = (void *)sub_23B1C5354();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v10);
  v19 = (void *)sub_23B1C5870();
  v15[2](v15, 0, v19);

  _Block_release(v15);
}

- (void)enumerateChangesFromToken:(id)a3 suggestedBatchSize:(int64_t)a4 reply:(id)a5
{
  void *v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  _TtC9libfssync20FPFSSearchEnumerator *v13;

  v8 = _Block_copy(a5);
  v9 = a3;
  v13 = self;
  v10 = sub_23B1C5AD4();
  v12 = v11;

  _Block_copy(v8);
  sub_23AF28464(v10, v12, a4, (char *)v13, v8);
  _Block_release(v8);
  _Block_release(v8);
  sub_23AAAE53C(v10, v12);

}

- (void)keepAliveConnectionForRegisteredObserver:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t (**v6)();
  uint64_t v7;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = (uint64_t (**)())((char *)self + OBJC_IVAR____TtC9libfssync20FPFSSearchEnumerator_keepAlive);
  v7 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC9libfssync20FPFSSearchEnumerator_keepAlive);
  *v6 = sub_23AAB7934;
  v6[1] = (uint64_t (*)())v5;
  sub_23AAB7948(v7);
}

- (NSString)description
{
  _TtC9libfssync20FPFSSearchEnumerator *v2;
  void *v3;

  v2 = self;
  sub_23AF2661C();

  v3 = (void *)sub_23B1C63BC();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC9libfssync20FPFSSearchEnumerator)init
{
  _TtC9libfssync20FPFSSearchEnumerator *result;

  result = (_TtC9libfssync20FPFSSearchEnumerator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
