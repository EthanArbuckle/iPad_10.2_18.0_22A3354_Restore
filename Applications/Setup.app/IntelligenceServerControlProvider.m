@implementation IntelligenceServerControlProvider

- (void)isFeatureEnabledWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC5Setup33IntelligenceServerControlProvider *v13;
  uint64_t v14;
  uint64_t v15;

  v5 = sub_10000A9E4(&qword_1002EA790);
  __chkstk_darwin(v5);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject(&unk_10027F3E0, 32, 7);
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject(&unk_10027F408, 48, 7);
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1002EA548;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject(&unk_10027F430, 48, 7);
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1002EB100;
  v12[5] = v11;
  v13 = self;
  v14 = sub_10002F124((uint64_t)v7, (uint64_t)&unk_1002EA860, (uint64_t)v12);
  swift_release(v14);
}

- (_TtC5Setup33IntelligenceServerControlProvider)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for IntelligenceServerControlProvider();
  return -[IntelligenceServerControlProvider init](&v3, "init");
}

@end
