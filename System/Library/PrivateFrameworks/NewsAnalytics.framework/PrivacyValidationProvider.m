@implementation PrivacyValidationProvider

- (_TtC13NewsAnalytics25PrivacyValidationProvider)init
{
  _TtC13NewsAnalytics25PrivacyValidationProvider *result;

  result = (_TtC13NewsAnalytics25PrivacyValidationProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_release();
}

- (void)configurationManager:(id)a3 appConfigurationDidChange:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t *v12;
  _TtC13NewsAnalytics25PrivacyValidationProvider *v13;
  uint64_t v14;

  v6 = sub_1D5AADC68();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x1E0C80A78](v6);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v8);
  v12 = (uint64_t *)((char *)&v14 - v11);
  swift_unknownObjectRetain_n();
  swift_unknownObjectRetain();
  v13 = self;
  sub_1D57B59BC(a4, v12);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t *, uint64_t))(v7 + 16))(v10, v12, v6);
  swift_retain();
  sub_1D5AAE28C();
  swift_release();
  (*(void (**)(uint64_t *, uint64_t))(v7 + 8))(v12, v6);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

}

@end
