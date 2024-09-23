@implementation ActionSetContainerSummaryGridItemModuleController

- (Class)collectionCellClassForItem:(id)a3
{
  uint64_t ObjCClassFromMetadata;
  id v6;
  _TtC6HomeUI49ActionSetContainerSummaryGridItemModuleController *v7;

  sub_1B8E23A60(0, &qword_1EF20C180);
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v6 = a3;
  v7 = self;
  LODWORD(ObjCClassFromMetadata) = objc_msgSend(v6, sel_isKindOfClass_, ObjCClassFromMetadata);

  if ((_DWORD)ObjCClassFromMetadata)
    type metadata accessor for SceneTileCell();
  else
    sub_1B8E23A60(0, (unint64_t *)&qword_1ED57E670);
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)configureCell:(id)a3 forItem:(id)a4
{
  id v6;
  id v7;
  _TtC6HomeUI49ActionSetContainerSummaryGridItemModuleController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1B8F2050C(v6, (uint64_t)v7);

}

- (id)collectionLayoutSectionForSectionWithIdentifier:(id)a3 layoutEnvironment:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _TtC6HomeUI49ActionSetContainerSummaryGridItemModuleController *v9;
  id v10;

  v6 = sub_1B93EDDB4();
  v8 = v7;
  swift_unknownObjectRetain();
  v9 = self;
  v10 = sub_1B8F20680(v6, v8, a4);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  return v10;
}

- (id)displayedItemsInSection:(id)a3
{
  _TtC6HomeUI49ActionSetContainerSummaryGridItemModuleController *v4;
  HFItemModule *v5;
  HFItemUpdating *v6;
  void *v7;
  id v8;
  void *v9;

  sub_1B93EDDB4();
  v4 = self;
  v5 = -[HUItemModuleController module](v4, sel_module);
  v6 = -[HFItemModule itemUpdater](v5, sel_itemUpdater);

  if (v6)
  {
    v7 = (void *)sub_1B93EDD84();
    v8 = -[HFItemUpdating displayedItemsInSectionWithIdentifier:](v6, sel_displayedItemsInSectionWithIdentifier_, v7);

    swift_unknownObjectRelease();
    sub_1B8E23A60(0, (unint64_t *)&qword_1ED57F910);
    sub_1B93EDF4C();

    swift_bridgeObjectRelease();
  }
  else
  {

    swift_bridgeObjectRelease();
  }
  sub_1B8E23A60(0, (unint64_t *)&qword_1ED57F910);
  v9 = (void *)sub_1B93EDF34();
  swift_bridgeObjectRelease();
  return v9;
}

- (BOOL)shouldShowHeaderForSection:(id)a3
{
  return 0;
}

- (id)transform:(id)a3
{
  id v4;
  _TtC6HomeUI49ActionSetContainerSummaryGridItemModuleController *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  v6 = sub_1B8F20E58(v4);

  return v6;
}

- (void)sceneEditor:(id)a3 removeActionSetBuilderFromTrigger:(id)a4
{
  id v7;
  id v8;
  _TtC6HomeUI49ActionSetContainerSummaryGridItemModuleController *v9;

  v7 = a3;
  v8 = a4;
  v9 = self;
  sub_1B8F20A04((uint64_t)a3, a4);

}

- (_TtC6HomeUI49ActionSetContainerSummaryGridItemModuleController)initWithModule:(id)a3
{
  objc_super v6;

  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC6HomeUI49ActionSetContainerSummaryGridItemModuleController____lazy_storage___collectionLayoutManager) = 0;
  swift_unknownObjectWeakInit();
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ActionSetContainerSummaryGridItemModuleController();
  return -[HUItemModuleController initWithModule:](&v6, sel_initWithModule_, a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC6HomeUI49ActionSetContainerSummaryGridItemModuleController____lazy_storage___collectionLayoutManager));
  sub_1B8E7A1E8((uint64_t)self + OBJC_IVAR____TtC6HomeUI49ActionSetContainerSummaryGridItemModuleController_sceneEditorDelegate);
}

@end
