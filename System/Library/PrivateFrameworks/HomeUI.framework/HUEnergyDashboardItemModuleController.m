@implementation HUEnergyDashboardItemModuleController

- (HUEnergyDashboardItemModuleController)initWithModule:(id)a3
{
  id v3;
  HUEnergyDashboardItemModuleController *result;

  v3 = a3;
  result = (HUEnergyDashboardItemModuleController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  sub_1B8E7A1E8((uint64_t)self + OBJC_IVAR___HUEnergyDashboardItemModuleController_delegate);
}

- (Class)collectionCellClassForItem:(id)a3
{
  sub_1B8E23A60(0, (unint64_t *)&qword_1ED57E670);
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)configureCell:(id)a3 forItem:(id)a4
{
  id v6;
  id v7;
  HUEnergyDashboardItemModuleController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  _s6HomeUI35EnergyDashboardItemModuleControllerC13configureCell_3forySo016UICollectionViewI0C_So6HFItemCtF_0();

}

- (id)collectionLayoutSectionForSectionWithIdentifier:(id)a3 layoutEnvironment:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  HUEnergyDashboardItemModuleController *v9;
  id v10;

  v6 = sub_1B93EDDB4();
  v8 = v7;
  swift_unknownObjectRetain();
  v9 = self;
  v10 = EnergyDashboardItemModuleController.collectionLayoutSectionForSection(withIdentifier:layoutEnvironment:)(v6, v8, (uint64_t)a4);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  return v10;
}

@end
