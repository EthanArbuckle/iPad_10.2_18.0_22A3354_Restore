@implementation AAUIActivityAwardsDateQuery

- (_TtC22ActivityAchievementsUI27AAUIActivityAwardsDateQuery)initWithDateComponents:(id)a3 initialAwardsHandler:(id)a4 updateHandler:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  void *v15;
  void *v16;
  _TtC22ActivityAchievementsUI27AAUIActivityAwardsDateQuery *v17;
  objc_class *v18;
  _TtC22ActivityAchievementsUI27AAUIActivityAwardsDateQuery *v19;
  objc_super v21;

  v8 = sub_21CC3F5E8();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v21 - v13;
  v15 = _Block_copy(a4);
  v16 = _Block_copy(a5);
  sub_21CC3F5DC();
  *(_QWORD *)(swift_allocObject() + 16) = v15;
  *(_QWORD *)(swift_allocObject() + 16) = v16;
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v12, v14, v8);
  objc_allocWithZone((Class)sub_21CC3F708());
  v17 = self;
  swift_retain();
  swift_retain();
  *(Class *)((char *)&v17->super.isa + OBJC_IVAR____TtC22ActivityAchievementsUI27AAUIActivityAwardsDateQuery_query) = (Class)sub_21CC3F6F0();

  v18 = (objc_class *)type metadata accessor for AAUIActivityAwardsDateQuery();
  v21.receiver = v17;
  v21.super_class = v18;
  v19 = -[AAUIActivityAwardsDateQuery init](&v21, sel_init);
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v14, v8);
  return v19;
}

- (BOOL)activateAndReturnError:(id *)a3
{
  _TtC22ActivityAchievementsUI27AAUIActivityAwardsDateQuery *v3;

  v3 = self;
  sub_21CC3F6FC();

  return 1;
}

- (void)deactivate
{
  _TtC22ActivityAchievementsUI27AAUIActivityAwardsDateQuery *v2;

  v2 = self;
  sub_21CC3F6E4();

}

- (_TtC22ActivityAchievementsUI27AAUIActivityAwardsDateQuery)init
{
  _TtC22ActivityAchievementsUI27AAUIActivityAwardsDateQuery *result;

  result = (_TtC22ActivityAchievementsUI27AAUIActivityAwardsDateQuery *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC22ActivityAchievementsUI27AAUIActivityAwardsDateQuery_query));
}

@end
