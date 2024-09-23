@implementation IMDPreReqsChecker

- (void)verifyAllPreReqsWithRequireEnablement:(BOOL)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  _TtC12IMDaemonCore17IMDPreReqsChecker *v15;
  uint64_t v16;

  v7 = sub_1D141AC58((uint64_t *)&unk_1ED935780);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = swift_allocObject();
  *(_BYTE *)(v11 + 16) = a3;
  *(_QWORD *)(v11 + 24) = v10;
  *(_QWORD *)(v11 + 32) = self;
  v12 = sub_1D166DCB8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1EFC62CB0;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1EFC62CC0;
  v14[5] = v13;
  v15 = self;
  sub_1D161F954((uint64_t)v9, (uint64_t)&unk_1EFC62CD0, (uint64_t)v14);
  swift_release();
}

- (_TtC12IMDaemonCore17IMDPreReqsChecker)init
{
  _TtC12IMDaemonCore17IMDPreReqsChecker *v2;
  objc_super v4;

  v2 = self;
  sub_1D166D940();
  sub_1D166D958();

  v4.receiver = v2;
  v4.super_class = (Class)type metadata accessor for IMDPreReqsChecker(0);
  return -[IMDPreReqsChecker init](&v4, sel_init);
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR____TtC12IMDaemonCore17IMDPreReqsChecker_logger;
  v3 = sub_1D166D964();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

@end
