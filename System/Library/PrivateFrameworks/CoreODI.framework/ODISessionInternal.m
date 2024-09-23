@implementation ODISessionInternal

- (NSString)description
{
  void *v2;

  swift_retain();
  sub_20A9E026C();
  sub_20A9E0110();
  type metadata accessor for ODIServiceProviderId(0);
  sub_20A9E02CC();
  swift_release();
  v2 = (void *)sub_20A9E00BC();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (_TtC7CoreODI18ODISessionInternal)initWithServiceIdentifier:(id)a3 forDSIDType:(unint64_t)a4 locationBundle:(id)a5 andLocationBundleIdentifier:(id)a6 sessionStateDelegate:(id)a7
{
  uint64_t v11;
  uint64_t *v12;
  uint64_t *v13;
  id v14;
  id v15;

  if (a6)
  {
    v11 = sub_20A9E00E0();
    v13 = v12;
  }
  else
  {
    v11 = 0;
    v13 = 0;
  }
  v14 = a3;
  v15 = a5;
  swift_unknownObjectRetain();
  return (_TtC7CoreODI18ODISessionInternal *)ODISessionInternal.init(serviceIdentifier:forDSIDType:locationBundle:andLocationBundleIdentifier:sessionStateDelegate:)(v14, a4, a5, v11, v13, (uint64_t)a7);
}

- (void)updateWithAdditionalAttributes:(id)a3
{
  id v4;

  v4 = a3;
  swift_retain();
  sub_20A9C7FC8(a3);
  swift_release();

}

- (void)getAssessment:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v16 = sub_20A9DFE64();
  v5 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_20A9E0050();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a3);
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = v12;
  __swift_project_boxed_opaque_existential_1((Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger), *(_QWORD *)&self->$defaultActor[OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger + 16]);
  (*(void (**)(char *, _QWORD, uint64_t))(v9 + 104))(v11, *MEMORY[0x24BE1F7E0], v8);
  swift_retain();
  sub_20A9DFF90();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  sub_20A9DFE4C();
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = sub_20A9D8840;
  *(_QWORD *)(v14 + 24) = v13;
  swift_retain();
  sub_20A9CFE60((uint64_t)v7, (uint64_t)sub_20A9D7770, v14);
  swift_release();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v16);
  swift_release();
  swift_release();
}

- (void)provideFeedbackOnPayloadOutcome:(unint64_t)a3
{
  swift_retain();
  sub_20A9C8C2C(a3);
  swift_release();
}

- (void)provideFeedbackOnPartialAssessmentID:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254611C48);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_20A9E00E0();
  v9 = v8;
  v10 = sub_20A9E0194();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v6, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = self;
  v11[5] = v7;
  v11[6] = v9;
  swift_retain_n();
  swift_bridgeObjectRetain();
  sub_20A9C3E64((uint64_t)v6, (uint64_t)&unk_2546120E8, (uint64_t)v11);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
}

- (void)validateForDeinit
{
  swift_retain();
  sub_20A9D62C8();
  swift_release();
}

- (_TtC7CoreODI18ODISessionInternal)init
{
  _TtC7CoreODI18ODISessionInternal *result;

  swift_defaultActor_initialize();
  result = (_TtC7CoreODI18ODISessionInternal *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
