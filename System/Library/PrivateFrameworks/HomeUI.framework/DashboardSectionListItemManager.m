@implementation DashboardSectionListItemManager

- (HMHome)home
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DashboardSectionListItemManager();
  return -[HFItemManager home](&v3, sel_home);
}

- (void)setHome:(id)a3
{
  _TtC6HomeUI31DashboardSectionListItemManager *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_1B8F12CE4((uint64_t)a3);

}

- (id)_buildItemProvidersForHome:(id)a3
{
  id v4;
  _TtC6HomeUI31DashboardSectionListItemManager *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  sub_1B8F11DB4(v4);

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED57E930);
  v6 = (void *)sub_1B93EDF34();
  swift_bridgeObjectRelease();
  return v6;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  _TtC6HomeUI31DashboardSectionListItemManager *v4;
  void *v5;

  sub_1B8E23A60(0, (unint64_t *)&qword_1ED57F910);
  sub_1B8E34E3C();
  sub_1B93EE0FC();
  v4 = self;
  sub_1B8F12490();

  swift_bridgeObjectRelease();
  sub_1B8E23A60(0, (unint64_t *)&unk_1ED57E910);
  v5 = (void *)sub_1B93EDF34();
  swift_bridgeObjectRelease();
  return v5;
}

- (id)_itemsToHideInSet:(id)a3
{
  _TtC6HomeUI31DashboardSectionListItemManager *v4;
  void *v5;

  sub_1B8E23A60(0, (unint64_t *)&qword_1ED57F910);
  sub_1B8E34E3C();
  sub_1B93EE0FC();
  v4 = self;
  sub_1B8F12694();

  swift_bridgeObjectRelease();
  v5 = (void *)sub_1B93EE0D8();
  swift_bridgeObjectRelease();
  return v5;
}

- (_TtC6HomeUI31DashboardSectionListItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4
{
  id v5;
  _TtC6HomeUI31DashboardSectionListItemManager *result;

  swift_unknownObjectRetain();
  v5 = a4;
  result = (_TtC6HomeUI31DashboardSectionListItemManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC6HomeUI31DashboardSectionListItemManager_roomItemProvider));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC6HomeUI31DashboardSectionListItemManager_categoryItemProvider));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC6HomeUI31DashboardSectionListItemManager_staticItemProvider));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC6HomeUI31DashboardSectionListItemManager_sceneSectionItem));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC6HomeUI31DashboardSectionListItemManager_cameraSectionItem));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC6HomeUI31DashboardSectionListItemManager_favoriteSectionItem));

  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC6HomeUI31DashboardSectionListItemManager_reorderableSectionList));
}

@end
