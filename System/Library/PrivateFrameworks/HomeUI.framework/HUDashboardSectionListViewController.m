@implementation HUDashboardSectionListViewController

- (HUDashboardSectionListViewController)initWithContext:(id)a3
{
  void *v5;
  id v6;
  id v7;
  char *v8;
  HUDashboardSectionListViewController *v9;
  objc_super v11;

  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR___HUDashboardSectionListViewController____lazy_storage___layoutManager) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR___HUDashboardSectionListViewController_dashboardContext) = (Class)a3;
  v5 = *(void **)((char *)a3 + OBJC_IVAR___HUDashboardContext_room);
  objc_allocWithZone((Class)type metadata accessor for DashboardSectionListItemManager());
  v6 = v5;
  v7 = a3;
  v8 = sub_1B8F11C88(0, v5);
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for DashboardSectionListViewController();
  v9 = -[HUItemCollectionViewController initUsingCompositionalLayoutWithItemManager:](&v11, sel_initUsingCompositionalLayoutWithItemManager_, v8);

  return v9;
}

- (void)viewDidLoad
{
  HUDashboardSectionListViewController *v2;

  v2 = self;
  sub_1B8F2C6C8();

}

- (void)_cancel
{
  HUDashboardSectionListViewController *v2;

  v2 = self;
  sub_1B8F2C854();

}

- (void)_done
{
  HUDashboardSectionListViewController *v2;

  v2 = self;
  sub_1B8F2CA98();

}

- (id)layoutSectionForSection:(int64_t)a3 layoutEnvironment:(id)a4
{
  HUDashboardSectionListViewController *v7;
  void *v8;

  swift_unknownObjectRetain();
  v7 = self;
  v8 = sub_1B8F2CB80(a3, (uint64_t)a4);
  swift_unknownObjectRelease();

  return v8;
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v9;

  v4 = sub_1B93EB900();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B93EB8C4();
  sub_1B8E23A60(0, &qword_1EF20C780);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)configureCell:(id)a3 forItem:(id)a4
{
  id v6;
  id v7;
  HUDashboardSectionListViewController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1B8F2DA4C(v6, v7);

}

- (id)displayedItemsInSection:(id)a3
{
  HUDashboardSectionListViewController *v4;
  HFItemManager *v5;
  void *v6;
  id v7;
  void *v8;

  sub_1B93EDDB4();
  v4 = self;
  v5 = -[HUItemCollectionViewController itemManager](v4, sel_itemManager);
  v6 = (void *)sub_1B93EDD84();
  v7 = -[HFItemManager displayedItemsInSectionWithIdentifier:](v5, sel_displayedItemsInSectionWithIdentifier_, v6);

  sub_1B8E23A60(0, (unint64_t *)&qword_1ED57F910);
  sub_1B93EDF4C();

  swift_bridgeObjectRelease();
  v8 = (void *)sub_1B93EDF34();
  swift_bridgeObjectRelease();
  return v8;
}

- (BOOL)shouldShowHeaderForSection:(id)a3
{
  HUDashboardSectionListViewController *v4;
  HFItemManager *v5;
  void *v6;
  id v7;
  HFItemManager *v8;
  id v9;

  sub_1B93EDDB4();
  v4 = self;
  v5 = -[HUItemCollectionViewController itemManager](v4, sel_itemManager);
  v6 = (void *)sub_1B93EDD84();
  v7 = -[HFItemManager sectionIndexForDisplayedSectionIdentifier:](v5, sel_sectionIndexForDisplayedSectionIdentifier_, v6);

  v8 = -[HUItemCollectionViewController itemManager](v4, sel_itemManager);
  v9 = -[HFItemManager titleForSection:](v8, sel_titleForSection_, v7);

  swift_bridgeObjectRelease();
  if (v9)

  return v9 != 0;
}

- (BOOL)collectionView:(id)a3 canMoveItemAtIndexPath:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  unsigned __int8 v9;
  uint64_t v11;

  v5 = sub_1B93EB900();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B93EB8C4();
  v9 = objc_msgSend(a3, sel_isEditing);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return v9;
}

- (void)didReorderItemWithSortedItemsBySectionID:(id)a3
{
  uint64_t v4;
  HUDashboardSectionListViewController *v5;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF210770);
  v4 = sub_1B93EDD00();
  v5 = self;
  sub_1B8F2D310(v4);

  swift_bridgeObjectRelease();
}

- (void)homeDidUpdateApplicationData:(id)a3
{
  id v4;
  HUDashboardSectionListViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1B8F2D464(v4);

}

- (void)home:(id)a3 didUpdateApplicationDataForRoom:(id)a4
{
  id v6;
  id v7;
  HUDashboardSectionListViewController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1B8F2DDEC(v7);

}

- (HUDashboardSectionListViewController)initWithItemManager:(id)a3 collectionViewLayout:(id)a4
{
  id v5;
  id v6;
  HUDashboardSectionListViewController *result;

  v5 = a3;
  v6 = a4;
  result = (HUDashboardSectionListViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (id)initUsingCompositionalLayoutWithItemManager:(id)a3
{
  id v3;
  id result;

  v3 = a3;
  result = (id)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUDashboardSectionListViewController_dashboardContext));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUDashboardSectionListViewController____lazy_storage___layoutManager));
}

@end
