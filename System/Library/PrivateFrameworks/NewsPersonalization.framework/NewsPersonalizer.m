@implementation NewsPersonalizer

- (_TtC19NewsPersonalization16NewsPersonalizer)init
{
  _TtC19NewsPersonalization16NewsPersonalizer *result;

  result = (_TtC19NewsPersonalization16NewsPersonalizer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  v3 = (char *)self + OBJC_IVAR____TtC19NewsPersonalization16NewsPersonalizer_classicConfiguration;
  v4 = sub_1D5D1D294();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC19NewsPersonalization16NewsPersonalizer_trainer;
  sub_1D5B6A3F8();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC19NewsPersonalization16NewsPersonalizer_configurationManager);
}

@end
