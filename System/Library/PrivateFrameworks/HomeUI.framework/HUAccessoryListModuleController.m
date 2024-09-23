@implementation HUAccessoryListModuleController

- (Class)collectionCellClassForItem:(id)a3
{
  sub_1B8E23A60(0, &qword_1EF20AD60);
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)configureCell:(id)a3 forItem:(id)a4
{
  id v6;
  id v7;
  HUAccessoryListModuleController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1B8ED4E3C(v6, v7);

}

- (id)collectionLayoutSectionForSectionWithIdentifier:(id)a3 layoutEnvironment:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  HUAccessoryListModuleController *v9;
  void *v10;

  v6 = sub_1B93EDDB4();
  v8 = v7;
  swift_unknownObjectRetain();
  v9 = self;
  v10 = sub_1B8ED56C0(v6, v8, (uint64_t)a4);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  return v10;
}

- (id)displayedItemsInSection:(id)a3
{
  HUAccessoryListModuleController *v4;
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
  HUAccessoryListModuleController *v3;
  HFItemModule *v4;
  char *v5;
  char *v6;
  uint64_t v7;

  v3 = self;
  v4 = -[HUItemModuleController module](v3, sel_module);
  type metadata accessor for AccessoryRepresentableItemModule();
  v5 = (char *)objc_retain(*(id *)(swift_dynamicCastClassUnconditional()
                                 + OBJC_IVAR___HUAccessoryRepresentableItemModule_context));

  v6 = &v5[OBJC_IVAR___HUAccessoryRepresentableItemModuleContext_sectionGroupingType];
  swift_beginAccess();
  v7 = *(_QWORD *)v6;

  return v7 != 0;
}

- (BOOL)shouldShowFooterForSection:(id)a3
{
  HUAccessoryListModuleController *v3;
  HFItemModule *v4;
  char *v5;
  char *v6;

  v3 = self;
  v4 = -[HUItemModuleController module](v3, sel_module);
  type metadata accessor for AccessoryRepresentableItemModule();
  v5 = (char *)objc_retain(*(id *)(swift_dynamicCastClassUnconditional()
                                 + OBJC_IVAR___HUAccessoryRepresentableItemModule_context));

  v6 = &v5[OBJC_IVAR___HUAccessoryRepresentableItemModuleContext_showFooter];
  swift_beginAccess();
  LOBYTE(v6) = *v6;

  return (char)v6;
}

- (HUAccessoryListModuleController)initWithModule:(id)a3
{
  id v3;
  HUAccessoryListModuleController *result;

  v3 = a3;
  result = (HUAccessoryListModuleController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___HUAccessoryListModuleController_collectionLayoutManager));
}

@end
