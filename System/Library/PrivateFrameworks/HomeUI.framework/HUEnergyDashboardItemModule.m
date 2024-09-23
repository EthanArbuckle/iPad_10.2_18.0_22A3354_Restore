@implementation HUEnergyDashboardItemModule

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  HUEnergyDashboardItemModule *v4;
  void *v5;

  sub_1B8E23A60(0, (unint64_t *)&qword_1ED57F910);
  sub_1B8E34E3C();
  sub_1B93EE0FC();
  v4 = self;
  sub_1B8E3465C();

  swift_bridgeObjectRelease();
  sub_1B8E23A60(0, (unint64_t *)&unk_1ED57E910);
  v5 = (void *)sub_1B93EDF34();
  swift_bridgeObjectRelease();
  return v5;
}

- (HUEnergyDashboardItemModule)initWithItemUpdater:(id)a3 dashboardContext:(id)a4 home:(id)a5
{
  id v8;
  id v9;
  objc_super v11;

  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___HUEnergyDashboardItemModule_dashboardContext) = (Class)a4;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___HUEnergyDashboardItemModule_home) = (Class)a5;
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for EnergyDashboardItemModule();
  v8 = a4;
  v9 = a5;
  return -[HFItemModule initWithItemUpdater:](&v11, sel_initWithItemUpdater_, a3);
}

- (id)buildItemProviders
{
  HUEnergyDashboardItemModule *v2;
  uint64_t v3;
  void *v4;

  v2 = self;
  v3 = sub_1B8E6FA20();

  if (v3)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED57E930);
    sub_1B8E6DFF4();
    v4 = (void *)sub_1B93EE0D8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)reset
{
  HUEnergyDashboardItemModule *v2;

  v2 = self;
  sub_1B8F477F8();

}

- (HUEnergyDashboardItemModule)initWithItemUpdater:(id)a3
{
  HUEnergyDashboardItemModule *result;

  swift_unknownObjectRetain();
  result = (HUEnergyDashboardItemModule *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
