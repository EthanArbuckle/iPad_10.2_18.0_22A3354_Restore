@implementation ActivityAwardsDateQuery

- (void)dealloc
{
  _TtC18ActivityAwardsCore23ActivityAwardsDateQuery *v2;
  objc_super v3;

  v2 = self;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254EF9F18);
  sub_2175A62D8();
  swift_release();
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for ActivityAwardsDateQuery();
  -[ActivityAwardsDateQuery dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC18ActivityAwardsCore23ActivityAwardsDateQuery_dateComponents;
  v4 = sub_2175A629C();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC18ActivityAwardsCore23ActivityAwardsDateQuery_connection));
  swift_release();
}

- (_TtC18ActivityAwardsCore23ActivityAwardsDateQuery)init
{
  _TtC18ActivityAwardsCore23ActivityAwardsDateQuery *result;

  result = (_TtC18ActivityAwardsCore23ActivityAwardsDateQuery *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
