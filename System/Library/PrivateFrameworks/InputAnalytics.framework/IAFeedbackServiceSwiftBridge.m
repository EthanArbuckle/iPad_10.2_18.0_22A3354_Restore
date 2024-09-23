@implementation IAFeedbackServiceSwiftBridge

- (int64_t)featureDomain
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___IAFeedbackServiceSwiftBridge_featureDomain);
}

- (void)setFeatureDomain:(int64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___IAFeedbackServiceSwiftBridge_featureDomain) = (Class)a3;
}

- (int64_t)action
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___IAFeedbackServiceSwiftBridge_action);
}

- (void)setAction:(int64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___IAFeedbackServiceSwiftBridge_action) = (Class)a3;
}

- (NSString)originalContent
{
  return (NSString *)sub_23F09C534();
}

- (void)setOriginalContent:(id)a3
{
  sub_23F09C588((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___IAFeedbackServiceSwiftBridge_originalContent);
}

- (NSString)generatedContent
{
  return (NSString *)sub_23F09C534();
}

- (void)setGeneratedContent:(id)a3
{
  sub_23F09C588((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___IAFeedbackServiceSwiftBridge_generatedContent);
}

- (IAFeedbackServiceSwiftBridge)initWithFeatureDomain:(int64_t)a3 action:(int64_t)a4 originalContent:(id)a5 generatedContent:(id)a6
{
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;

  if (!a5)
  {
    v9 = 0;
    v11 = 0;
    if (a6)
      goto LABEL_3;
LABEL_5:
    v12 = 0;
    v14 = 0;
    return (IAFeedbackServiceSwiftBridge *)sub_23F09C5C4(a3, a4, v9, v11, v12, v14);
  }
  v9 = sub_23F0A058C();
  v11 = v10;
  if (!a6)
    goto LABEL_5;
LABEL_3:
  v12 = sub_23F0A058C();
  v14 = v13;
  return (IAFeedbackServiceSwiftBridge *)sub_23F09C5C4(a3, a4, v9, v11, v12, v14);
}

- (void)reportPresentedWithCompletionHandler:(id)a3
{
  uint64_t v5;
  char *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  IAFeedbackServiceSwiftBridge *v12;
  uint64_t v13;

  sub_23F09E354(&qword_256DFC240);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = _Block_copy(a3);
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = v7;
  *(_QWORD *)(v8 + 24) = self;
  v9 = sub_23F0A05C8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v6, 1, 1, v9);
  v10 = (_QWORD *)swift_allocObject();
  v10[2] = 0;
  v10[3] = 0;
  v10[4] = &unk_256DFC2B0;
  v10[5] = v8;
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_256DFC2B8;
  v11[5] = v10;
  v12 = self;
  sub_23F09E5A8((uint64_t)v6, (uint64_t)&unk_256DFC2C0, (uint64_t)v11);
  swift_release();
}

- (void)launchFeedbackWithCompletionHandler:(id)a3
{
  uint64_t v5;
  char *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  IAFeedbackServiceSwiftBridge *v12;
  uint64_t v13;

  sub_23F09E354(&qword_256DFC240);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = _Block_copy(a3);
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = v7;
  *(_QWORD *)(v8 + 24) = self;
  v9 = sub_23F0A05C8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v6, 1, 1, v9);
  v10 = (_QWORD *)swift_allocObject();
  v10[2] = 0;
  v10[3] = 0;
  v10[4] = &unk_256DFC250;
  v10[5] = v8;
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_256DFC260;
  v11[5] = v10;
  v12 = self;
  sub_23F09E5A8((uint64_t)v6, (uint64_t)&unk_256DFC270, (uint64_t)v11);
  swift_release();
}

- (IAFeedbackServiceSwiftBridge)init
{
  IAFeedbackServiceSwiftBridge *result;

  result = (IAFeedbackServiceSwiftBridge *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
