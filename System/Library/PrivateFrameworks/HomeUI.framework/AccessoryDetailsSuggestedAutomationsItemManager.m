@implementation AccessoryDetailsSuggestedAutomationsItemManager

- (id)_buildItemModulesForHome:(id)a3
{
  id v4;
  _TtC6HomeUI47AccessoryDetailsSuggestedAutomationsItemManager *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  sub_1B8FF8C5C();

  sub_1B8E23A60(0, (unint64_t *)&qword_1ED57E900);
  v6 = (void *)sub_1B93EDF34();
  swift_bridgeObjectRelease();
  return v6;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  _TtC6HomeUI47AccessoryDetailsSuggestedAutomationsItemManager *v4;
  void *v5;

  sub_1B8E23A60(0, (unint64_t *)&qword_1ED57F910);
  sub_1B8E34E3C();
  sub_1B93EE0FC();
  v4 = self;
  sub_1B8FF8268();

  swift_bridgeObjectRelease();
  sub_1B8E23A60(0, (unint64_t *)&unk_1ED57E910);
  v5 = (void *)sub_1B93EDF34();
  swift_bridgeObjectRelease();
  return v5;
}

- (id)_itemsToHideInSet:(id)a3
{
  uint64_t v4;
  _TtC6HomeUI47AccessoryDetailsSuggestedAutomationsItemManager *v5;
  void *v6;

  sub_1B8E23A60(0, (unint64_t *)&qword_1ED57F910);
  sub_1B8E34E3C();
  v4 = sub_1B93EE0FC();
  v5 = self;
  sub_1B8FF8614(v4);

  swift_bridgeObjectRelease();
  v6 = (void *)sub_1B93EE0D8();
  swift_bridgeObjectRelease();
  return v6;
}

- (_TtC6HomeUI47AccessoryDetailsSuggestedAutomationsItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4
{
  id v5;
  _TtC6HomeUI47AccessoryDetailsSuggestedAutomationsItemManager *result;

  swift_unknownObjectRetain();
  v5 = a4;
  result = (_TtC6HomeUI47AccessoryDetailsSuggestedAutomationsItemManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC6HomeUI47AccessoryDetailsSuggestedAutomationsItemManager_triggerModule));
}

@end
