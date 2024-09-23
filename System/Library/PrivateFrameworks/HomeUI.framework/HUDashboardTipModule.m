@implementation HUDashboardTipModule

- (NSSet)itemProviders
{
  HUDashboardTipModule *v2;
  void *v3;

  v2 = self;
  sub_1B8E231B8();

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED57E930);
  sub_1B8E23178((unint64_t *)&qword_1ED57E940, (uint64_t *)&unk_1ED57E930, MEMORY[0x1E0DEFCF8]);
  v3 = (void *)sub_1B93EE0D8();
  swift_bridgeObjectRelease();
  return (NSSet *)v3;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  HUDashboardTipModule *v4;
  void *v5;

  sub_1B8E23A60(0, (unint64_t *)&qword_1ED57F910);
  sub_1B8E34E3C();
  sub_1B93EE0FC();
  v4 = self;
  sub_1B8E34BD4();

  swift_bridgeObjectRelease();
  sub_1B8E23A60(0, (unint64_t *)&unk_1ED57E910);
  v5 = (void *)sub_1B93EDF34();
  swift_bridgeObjectRelease();
  return v5;
}

- (HUDashboardTipModule)initWithContext:(id)a3 itemUpdater:(id)a4
{
  id v5;

  v5 = a3;
  swift_unknownObjectRetain();
  return (HUDashboardTipModule *)DashboardTipModule.init(context:itemUpdater:)(v5, (uint64_t)a4);
}

- (void)setupTipsObserver
{
  HUDashboardTipModule *v2;

  v2 = self;
  sub_1B8E71548();

}

- (HUDashboardTipModule)initWithItemUpdater:(id)a3 descriptionText:(id)a4
{
  swift_unknownObjectRetain();
  _s6HomeUI18DashboardTipModuleC11itemUpdater15descriptionTextACSo14HFItemUpdating_p_SStcfc_0();
}

- (HUDashboardTipModule)initWithItemUpdater:(id)a3
{
  HUDashboardTipModule *result;

  swift_unknownObjectRetain();
  result = (HUDashboardTipModule *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_release();
  sub_1B8E26870((uint64_t)self + OBJC_IVAR___HUDashboardTipModule_eligibleTip, &qword_1ED57E5C8);
}

@end
