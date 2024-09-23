@implementation STKStickersOnDemandReindexer

+ (void)reindexStickersIfNecessaryWithCompletionHandler:(id)a3
{
  uint64_t v5;
  char *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;

  sub_1000048C4(&qword_100011B20);
  __chkstk_darwin();
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = _Block_copy(a3);
  v8 = swift_allocObject(&unk_10000C6E8, 32, 7);
  *(_QWORD *)(v8 + 16) = v7;
  *(_QWORD *)(v8 + 24) = a1;
  v9 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v6, 1, 1, v9);
  v10 = (_QWORD *)swift_allocObject(&unk_10000C710, 48, 7);
  v10[2] = 0;
  v10[3] = 0;
  v10[4] = &unk_1000119E8;
  v10[5] = v8;
  v11 = (_QWORD *)swift_allocObject(&unk_10000C738, 48, 7);
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1000119F8;
  v11[5] = v10;
  v12 = sub_1000065B0((uint64_t)v6, (uint64_t)&unk_100011A08, (uint64_t)v11);
  swift_release(v12);
}

- (STKStickersOnDemandReindexer)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for StickersOnDemandReindexer();
  return -[STKStickersOnDemandReindexer init](&v3, "init");
}

@end
