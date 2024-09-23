@implementation FAChildAccountCutOffAgeRequest

- (FAChildAccountCutOffAgeRequest)initWithUrlProvider:(id)a3 urlSession:(id)a4
{
  id v5;
  objc_super v7;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR___FAChildAccountCutOffAgeRequest_urlProvider) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___FAChildAccountCutOffAgeRequest_urlSession) = (Class)a4;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for FAChildAccountCutOffAgeRequest();
  swift_unknownObjectRetain();
  v5 = a4;
  return -[FAChildAccountCutOffAgeRequest init](&v7, sel_init);
}

- (void)fetchWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  FAChildAccountCutOffAgeRequest *v13;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ECFCE7A0);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = sub_1CAF20658();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1EF991440;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1EF991068;
  v12[5] = v11;
  v13 = self;
  sub_1CAEF47AC((uint64_t)v7, (uint64_t)&unk_1EF991070, (uint64_t)v12);
  swift_release();
}

- (FAChildAccountCutOffAgeRequest)init
{
  FAChildAccountCutOffAgeRequest *result;

  result = (FAChildAccountCutOffAgeRequest *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();

}

@end
