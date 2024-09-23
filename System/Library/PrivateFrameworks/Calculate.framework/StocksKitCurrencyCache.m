@implementation StocksKitCurrencyCache

+ (_TtC9Calculate22StocksKitCurrencyCache)shared
{
  if (qword_1ED562F70 != -1)
    swift_once();
  swift_beginAccess();
  return (_TtC9Calculate22StocksKitCurrencyCache *)(id)qword_1ED562F68;
}

+ (void)setShared:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = qword_1ED562F70;
  v4 = a3;
  if (v3 != -1)
    swift_once();
  swift_beginAccess();
  v5 = (void *)qword_1ED562F68;
  qword_1ED562F68 = (uint64_t)v4;

}

+ (BOOL)isEnabled
{
  BOOL v2;

  if (MEMORY[0x1E0DAF390])
    v2 = MEMORY[0x1E0DAF398] == 0;
  else
    v2 = 1;
  return !v2 && MEMORY[0x1E0DAF3A8] != 0 && MEMORY[0x1E0DAF388] != 0 && MEMORY[0x1E0DAF3A0] != 0;
}

- (void)refreshWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC9Calculate22StocksKitCurrencyCache *v13;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED561B48);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = sub_1B8912D5C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1EF1B61C0;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1EF1B61C8;
  v12[5] = v11;
  v13 = self;
  sub_1B888859C((uint64_t)v7, (uint64_t)&unk_1EF1B61D0, (uint64_t)v12);
  swift_release();
}

- (void)refreshWithTimeout:(double)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  _TtC9Calculate22StocksKitCurrencyCache *v15;
  uint64_t v16;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED561B48);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = swift_allocObject();
  *(double *)(v11 + 16) = a3;
  *(_QWORD *)(v11 + 24) = v10;
  *(_QWORD *)(v11 + 32) = self;
  v12 = sub_1B8912D5C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1EF1B61A0;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1EF1B61A8;
  v14[5] = v13;
  v15 = self;
  sub_1B888859C((uint64_t)v9, (uint64_t)&unk_1EF1B61B0, (uint64_t)v14);
  swift_release();
}

- (BOOL)refreshSynchronouslyWithTimeout:(double)a3
{
  return 0;
}

- (BOOL)refreshSynchronously
{
  return 0;
}

- (BOOL)needsRefresh
{
  return 0;
}

- (NSDictionary)currencyData
{
  void *v2;

  sub_1B8884CFC(MEMORY[0x1E0DEE9D8]);
  sub_1B888A040();
  v2 = (void *)sub_1B8912A14();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v2;
}

- (_TtC9Calculate22StocksKitCurrencyCache)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for StocksKitCurrencyCache();
  return -[StocksKitCurrencyCache init](&v3, sel_init);
}

@end
