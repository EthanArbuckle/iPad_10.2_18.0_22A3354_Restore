@implementation SFOnDeviceSummarization

- (SFOnDeviceSummarizationDelegate)delegate
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___SFOnDeviceSummarization_delegate;
  swift_beginAccess();
  return (SFOnDeviceSummarizationDelegate *)(id)MEMORY[0x18D77FD08](v2);
}

- (void)setDelegate:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (SFOnDeviceSummarization)init
{
  _QWORD *v3;
  objc_super v5;

  swift_unknownObjectWeakInit();
  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR___SFOnDeviceSummarization__summary);
  *v3 = 0;
  v3[1] = 0;
  *((_BYTE *)&self->super.isa + OBJC_IVAR___SFOnDeviceSummarization__isSafe) = 0;
  v5.receiver = self;
  v5.super_class = (Class)SFOnDeviceSummarization;
  return -[SFOnDeviceSummarization init](&v5, sel_init);
}

- (NSString)summary
{
  void *v2;

  if (*(_QWORD *)&self->delegate[OBJC_IVAR___SFOnDeviceSummarization__summary])
  {
    sub_18BABFD34();
    v2 = (void *)sub_18BAC0DCC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

- (BOOL)isSafe
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___SFOnDeviceSummarization__isSafe);
}

+ (BOOL)isRestricted
{
  return byte_1EDFF40B0;
}

+ (void)checkSummarizationAvailabilityWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFF38D0);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = a1;
  v10 = sub_18BAC1060();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1EDFF4140;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1EDFF4150;
  v12[5] = v11;
  sub_18BA80E98((uint64_t)v7, (uint64_t)&unk_1EDFF4160, (uint64_t)v12);
  swift_release();
}

- (void)summarizeArticleText:(id)a3
{
  SFOnDeviceSummarization *v4;

  sub_18BAC0DFC();
  v4 = self;
  sub_18BA804A0();

  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
  sub_18B913BBC((uint64_t)self + OBJC_IVAR___SFOnDeviceSummarization_delegate);
  swift_bridgeObjectRelease();
}

@end
