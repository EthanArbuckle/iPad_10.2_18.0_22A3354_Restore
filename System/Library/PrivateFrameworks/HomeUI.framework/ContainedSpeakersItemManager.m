@implementation ContainedSpeakersItemManager

- (id)_buildItemProvidersForHome:(id)a3
{
  id v4;
  _TtC6HomeUI28ContainedSpeakersItemManager *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  sub_1B8F16A2C();

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED57E930);
  v6 = (void *)sub_1B93EDF34();
  swift_bridgeObjectRelease();
  return v6;
}

- (id)_buildItemModulesForHome:(id)a3
{
  id v4;
  _TtC6HomeUI28ContainedSpeakersItemManager *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  sub_1B8F16250(v4);

  sub_1B8E23A60(0, (unint64_t *)&qword_1ED57E900);
  v6 = (void *)sub_1B93EDF34();
  swift_bridgeObjectRelease();
  return v6;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  _TtC6HomeUI28ContainedSpeakersItemManager *v4;
  void *v5;

  sub_1B8E23A60(0, (unint64_t *)&qword_1ED57F910);
  sub_1B8E48724((unint64_t *)&qword_1ED57F920, (unint64_t *)&qword_1ED57F910);
  sub_1B93EE0FC();
  v4 = self;
  sub_1B8F163C8();

  swift_bridgeObjectRelease();
  sub_1B8E23A60(0, (unint64_t *)&unk_1ED57E910);
  v5 = (void *)sub_1B93EDF34();
  swift_bridgeObjectRelease();
  return v5;
}

- (_TtC6HomeUI28ContainedSpeakersItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4
{
  id v5;
  _TtC6HomeUI28ContainedSpeakersItemManager *result;

  swift_unknownObjectRetain();
  v5 = a4;
  result = (_TtC6HomeUI28ContainedSpeakersItemManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC6HomeUI28ContainedSpeakersItemManager_accessoryElementItemModule));

  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC6HomeUI28ContainedSpeakersItemManager_accessoryElementContext));
  swift_bridgeObjectRelease();
}

@end
