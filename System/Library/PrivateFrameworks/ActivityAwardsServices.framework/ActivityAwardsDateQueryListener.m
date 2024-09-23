@implementation ActivityAwardsDateQueryListener

- (void)achievementStore:(void *)a1 didUpdateAchievements:
{
  id v2;

  swift_unknownObjectRetain();
  v2 = a1;
  sub_1D2A991CC();
  swift_unknownObjectRelease();

}

- (_TtC22ActivityAwardsServices31ActivityAwardsDateQueryListener)init
{
  _TtC22ActivityAwardsServices31ActivityAwardsDateQueryListener *result;

  result = (_TtC22ActivityAwardsServices31ActivityAwardsDateQueryListener *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC22ActivityAwardsServices31ActivityAwardsDateQueryListener_endpoint));
  swift_unknownObjectRelease();
  sub_1D2A9950C((uint64_t)self + OBJC_IVAR____TtC22ActivityAwardsServices31ActivityAwardsDateQueryListener_dateComponents, &qword_1ED9787B0);
  swift_bridgeObjectRelease();
}

@end
