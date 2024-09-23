@implementation MindfulnessSessionViewModel

- (NSDictionary)metadata
{
  void *v2;

  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9FitnessUI27MindfulnessSessionViewModel_metadata))
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_213106274();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSDictionary *)v2;
}

- (NSString)description
{
  _TtC9FitnessUI27MindfulnessSessionViewModel *v2;
  void *v3;

  v2 = self;
  sub_2130F2B98();

  v3 = (void *)sub_2131062F8();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC9FitnessUI27MindfulnessSessionViewModel)init
{
  _TtC9FitnessUI27MindfulnessSessionViewModel *result;

  result = (_TtC9FitnessUI27MindfulnessSessionViewModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  void (*v7)(char *, uint64_t);

  v3 = (char *)self + OBJC_IVAR____TtC9FitnessUI27MindfulnessSessionViewModel_uuid;
  v4 = sub_2131059BC();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC9FitnessUI27MindfulnessSessionViewModel_startDate;
  v6 = sub_21310598C();
  v7 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8);
  v7(v5, v6);
  v7((char *)self + OBJC_IVAR____TtC9FitnessUI27MindfulnessSessionViewModel_endDate, v6);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end
