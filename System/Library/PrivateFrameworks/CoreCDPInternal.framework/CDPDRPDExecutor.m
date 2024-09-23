@implementation CDPDRPDExecutor

- (CDPDRPDExecutor)initWithSbDeleter:(id)a3 ledger:(id)a4 resetter:(id)a5
{
  objc_super v6;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CDPDRPDExecutor_sbDeleter) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CDPDRPDExecutor_ledger) = (Class)a4;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CDPDRPDExecutor_resetter) = (Class)a5;
  v6.receiver = self;
  v6.super_class = (Class)CDPDRPDExecutor;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  return -[CDPDRPDExecutor init](&v6, sel_init);
}

- (void)performRPDWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  CDPDRPDExecutor *v13;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549DB9A0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = sub_20DB9F6C0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_2549DB9B0;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_2549DB9B8;
  v12[5] = v11;
  v13 = self;
  sub_20DB8F2FC((uint64_t)v7, (uint64_t)&unk_2549DB9C0, (uint64_t)v12);
  swift_release();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

- (CDPDRPDExecutor)init
{
  CDPDRPDExecutor *result;

  result = (CDPDRPDExecutor *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
