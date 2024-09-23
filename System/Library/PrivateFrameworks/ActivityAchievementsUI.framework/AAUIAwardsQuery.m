@implementation AAUIAwardsQuery

- (BOOL)activateAndReturnError:(id *)a3
{
  _TtC22ActivityAchievementsUI15AAUIAwardsQuery *v3;

  v3 = self;
  sub_21CC3F6CC();

  return 1;
}

- (_TtC22ActivityAchievementsUI15AAUIAwardsQuery)initWithInitialAwardsHandler:(id)a3 addedAwardsHandler:(id)a4 removedAwardsHandler:(id)a5 updatedAwardsHandler:(id)a6
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _TtC22ActivityAchievementsUI15AAUIAwardsQuery *v14;
  _TtC22ActivityAchievementsUI15AAUIAwardsQuery *v15;
  objc_super v17;

  v10 = _Block_copy(a3);
  v11 = _Block_copy(a4);
  v12 = _Block_copy(a5);
  v13 = _Block_copy(a6);
  *(_QWORD *)(swift_allocObject() + 16) = v10;
  *(_QWORD *)(swift_allocObject() + 16) = v11;
  *(_QWORD *)(swift_allocObject() + 16) = v12;
  *(_QWORD *)(swift_allocObject() + 16) = v13;
  objc_allocWithZone((Class)sub_21CC3F6D8());
  v14 = self;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  *(Class *)((char *)&v14->super.isa + OBJC_IVAR____TtC22ActivityAchievementsUI15AAUIAwardsQuery_query) = (Class)sub_21CC3F6B4();

  v17.receiver = v14;
  v17.super_class = (Class)type metadata accessor for AAUIAwardsQuery();
  v15 = -[AAUIAwardsQuery init](&v17, sel_init);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return v15;
}

- (void)deactivate
{
  _TtC22ActivityAchievementsUI15AAUIAwardsQuery *v2;

  v2 = self;
  sub_21CC3F6C0();

}

- (_TtC22ActivityAchievementsUI15AAUIAwardsQuery)init
{
  _TtC22ActivityAchievementsUI15AAUIAwardsQuery *result;

  result = (_TtC22ActivityAchievementsUI15AAUIAwardsQuery *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
