@implementation AISFlowTask

- (BOOL)completed
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____TtC12AppleIDSetup11AISFlowTask_completed;
  swift_beginAccess();
  return *v2;
}

- (void)setCompleted:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR____TtC12AppleIDSetup11AISFlowTask_completed;
  swift_beginAccess();
  *v4 = a3;
}

- (void)complete
{
  _TtC12AppleIDSetup11AISFlowTask *v2;

  v2 = self;
  sub_2364CA2A8();

}

- (void)waitUntilLoadedWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC12AppleIDSetup11AISFlowTask *v13;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563E9790);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = sub_2365B0218();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_2563E8058;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_2563E8060;
  v12[5] = v11;
  v13 = self;
  sub_23655D7FC((uint64_t)v7, (uint64_t)&unk_2563E97B0, (uint64_t)v12);
  swift_release();
}

- (void)dealloc
{
  _TtC12AppleIDSetup11AISFlowTask *v3;
  _TtC12AppleIDSetup11AISFlowTask *v4;
  objc_super v5;

  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12AppleIDSetup11AISFlowTask_cachedTask))
  {
    v3 = self;
    swift_retain();
    sub_2365B02B4();
    swift_release();
  }
  else
  {
    v4 = self;
  }
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for AISFlowTask();
  -[AISFlowTask dealloc](&v5, sel_dealloc);
}

- (void).cxx_destruct
{
  sub_2364CA4A4((uint64_t)self + OBJC_IVAR____TtC12AppleIDSetup11AISFlowTask_cachedContinuation);
  swift_release();
}

- (_TtC12AppleIDSetup11AISFlowTask)init
{
  char *v3;
  uint64_t v4;
  objc_super v6;

  v3 = (char *)self + OBJC_IVAR____TtC12AppleIDSetup11AISFlowTask_cachedContinuation;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563E7FC8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(v3, 1, 1, v4);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12AppleIDSetup11AISFlowTask_cachedTask) = 0;
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC12AppleIDSetup11AISFlowTask_completed) = 0;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for AISFlowTask();
  return -[AISFlowTask init](&v6, sel_init);
}

@end
