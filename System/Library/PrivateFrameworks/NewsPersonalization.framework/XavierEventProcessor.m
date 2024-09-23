@implementation XavierEventProcessor

- (_TtC19NewsPersonalization20XavierEventProcessor)init
{
  _TtC19NewsPersonalization20XavierEventProcessor *result;

  result = (_TtC19NewsPersonalization20XavierEventProcessor *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19NewsPersonalization20XavierEventProcessor_personalizer));
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
}

- (void)configurationManager:(id)a3 appConfigurationDidChange:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  _TtC19NewsPersonalization20XavierEventProcessor *v13;
  id v14;
  uint64_t v15;

  v6 = sub_1D5D1D1A4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v10);
  v12 = (char *)&v15 - v11;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v13 = self;
  v14 = objc_msgSend(a4, sel_personalizationTreatment);
  sub_1D5BA3F5C();

  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v9, v12, v6);
  swift_retain();
  sub_1D5D1E2D8();
  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

}

@end
