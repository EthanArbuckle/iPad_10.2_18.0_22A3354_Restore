@implementation FPFSEnumerator

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;

  swift_unknownObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC9libfssync14FPFSEnumerator_logger;
  v4 = sub_23B1C5E4C();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_unknownObjectWeakDestroy();

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  sub_23AAB7948(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC9libfssync14FPFSEnumerator_keepAlive));
  v5 = (char *)self + OBJC_IVAR____TtC9libfssync14FPFSEnumerator_invalidated;
  v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542E77E0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  swift_release();
  v7 = (char *)self + OBJC_IVAR____TtC9libfssync14FPFSEnumerator__currentAnchor;
  v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542E4398);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)dealloc
{
  _TtC9libfssync14FPFSEnumerator *v2;
  objc_super v3;

  v2 = self;
  sub_23AA6AFC4();
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for FPFSEnumerator();
  -[FPFSEnumerator dealloc](&v3, sel_dealloc);
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
  v6 = (uint64_t (**)())((char *)self + OBJC_IVAR____TtC9libfssync14FPFSEnumerator_keepAlive);
  v7 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC9libfssync14FPFSEnumerator_keepAlive);
  *v6 = sub_23AAB792C;
  v6[1] = (uint64_t (*)())v5;
  sub_23AAB7948(v7);
}

- (void)enumerateChangesFromToken:(id)a3 suggestedBatchSize:(int64_t)a4 reply:(id)a5
{
  void *v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  _TtC9libfssync14FPFSEnumerator *v13;

  v8 = _Block_copy(a5);
  v9 = a3;
  v13 = self;
  v10 = sub_23B1C5AD4();
  v12 = v11;

  _Block_copy(v8);
  sub_23AA72CE4(v10, v12, a4, v13, (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v8);
  _Block_release(v8);
  _Block_release(v8);
  sub_23AAAE53C(v10, v12);

}

- (void)enumerateItemsFromPage:(id)a3 suggestedPageSize:(int64_t)a4 reply:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  uint64_t v13;
  _QWORD *v14;
  _TtC9libfssync14FPFSEnumerator *v15;
  uint64_t v16;

  v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542E4750);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542E6B00);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v11, 1, 1, v13);
  _Block_copy(v12);
  v14 = a3;
  v15 = self;
  sub_23AA76828(v14, v11, a4, (char *)v15, v12);
  _Block_release(v12);
  sub_23AA8A05C((uint64_t)v11, (uint64_t *)&unk_2542E4750);
  _Block_release(v12);

}

- (void)invalidate
{
  _TtC9libfssync14FPFSEnumerator *v2;

  v2 = self;
  sub_23AA6AFC4();

}

- (void)currentSyncAnchorWithCompletion:(id)a3
{
  void *v4;
  _TtC9libfssync14FPFSEnumerator *v5;

  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_23AB3C318((char *)v5, (void (**)(_QWORD, _QWORD, _QWORD))v4);
  _Block_release(v4);
  _Block_release(v4);

}

- (void)enumerateItemsFromPage:(id)a3 suggestedPageSize:(int64_t)a4 upTo:(int64_t)a5 reply:(id)a6
{
  void (**v8)(void *, _QWORD, void *);
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  _TtC9libfssync14FPFSEnumerator *v14;

  v8 = (void (**)(void *, _QWORD, void *))_Block_copy(a6);
  sub_23B1C63E0();
  v9 = objc_allocWithZone(MEMORY[0x24BDD1540]);
  v10 = a3;
  v14 = self;
  v11 = (void *)sub_23B1C63BC();
  swift_bridgeObjectRelease();
  v12 = objc_msgSend(v9, sel_initWithDomain_code_userInfo_, v11, 3328, 0);

  v13 = (void *)sub_23B1C5870();
  v8[2](v8, 0, v13);

  _Block_release(v8);
}

- (NSString)description
{
  _TtC9libfssync14FPFSEnumerator *v2;
  void *v3;

  v2 = self;
  sub_23AB3B0AC();

  v3 = (void *)sub_23B1C63BC();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC9libfssync14FPFSEnumerator)init
{
  _TtC9libfssync14FPFSEnumerator *result;

  result = (_TtC9libfssync14FPFSEnumerator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
