@implementation ODIPartialAssessmentInitiator

- (_TtC7CoreODI29ODIPartialAssessmentInitiator)initWithProviderID:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  _TtC7CoreODI29ODIPartialAssessmentInitiator *v10;
  objc_class *v11;
  _TtC7CoreODI29ODIPartialAssessmentInitiator *v12;
  objc_super v14;

  v5 = sub_20A9DFF3C();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7CoreODI29ODIPartialAssessmentInitiator_providerID) = (Class)a3;
  sub_20A9E00E0();
  v9 = a3;
  v10 = self;
  sub_20A9DFF24();
  (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))((uint64_t)v10 + OBJC_IVAR____TtC7CoreODI29ODIPartialAssessmentInitiator_adapter, v8, v5);

  v11 = (objc_class *)type metadata accessor for ODIPartialAssessmentInitiator();
  v14.receiver = v10;
  v14.super_class = v11;
  v12 = -[ODIPartialAssessmentInitiator init](&v14, sel_init);

  return v12;
}

- (id)makeInitialPartialAssessmentPayload
{
  _TtC7CoreODI29ODIPartialAssessmentInitiator *v2;
  void *v3;

  v2 = self;
  sub_20A9D9BB4();

  v3 = (void *)sub_20A9E00BC();
  swift_bridgeObjectRelease();
  return v3;
}

- (id)makeInitialPartialAssessmentID
{
  return (id)sub_20A9E00BC();
}

- (_TtC7CoreODI29ODIPartialAssessmentInitiator)init
{
  _TtC7CoreODI29ODIPartialAssessmentInitiator *result;

  result = (_TtC7CoreODI29ODIPartialAssessmentInitiator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC7CoreODI29ODIPartialAssessmentInitiator_adapter;
  v4 = sub_20A9DFF3C();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
