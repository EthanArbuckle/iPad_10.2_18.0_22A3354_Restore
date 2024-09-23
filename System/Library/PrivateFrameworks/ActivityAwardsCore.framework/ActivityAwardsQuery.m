@implementation ActivityAwardsQuery

- (void)dealloc
{
  _TtC18ActivityAwardsCore19ActivityAwardsQuery *v2;
  objc_super v3;

  v2 = self;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254EF9F18);
  sub_2175A62D8();
  swift_release();
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for ActivityAwardsQuery();
  -[ActivityAwardsQuery dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC18ActivityAwardsCore19ActivityAwardsQuery_connection));
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
}

- (_TtC18ActivityAwardsCore19ActivityAwardsQuery)init
{
  _TtC18ActivityAwardsCore19ActivityAwardsQuery *result;

  result = (_TtC18ActivityAwardsCore19ActivityAwardsQuery *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
