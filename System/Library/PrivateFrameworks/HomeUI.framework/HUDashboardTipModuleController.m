@implementation HUDashboardTipModuleController

- (id)collectionLayoutSectionForSectionWithIdentifier:(id)a3 layoutEnvironment:(id)a4
{
  HUDashboardTipModuleController *v5;
  id v6;

  swift_unknownObjectRetain();
  v5 = self;
  v6 = sub_1B8E3CA94();
  swift_unknownObjectRelease();

  return v6;
}

- (HUDashboardTipModuleController)initWithModule:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for DashboardTipModuleController();
  return -[HUItemModuleController initWithModule:](&v5, sel_initWithModule_, a3);
}

- (Class)collectionCellClassForItem:(id)a3
{
  sub_1B8FB540C();
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)configureCell:(id)a3 forItem:(id)a4
{
  id v6;
  id v7;
  HUDashboardTipModuleController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1B8FB5460((uint64_t)v6, v7);

}

@end
