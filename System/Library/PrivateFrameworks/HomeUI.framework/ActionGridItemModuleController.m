@implementation ActionGridItemModuleController

- (_TtC6HomeUI30ActionGridItemModuleController)initWithModule:(id)a3
{
  char *v5;
  _TtC6HomeUI30ActionGridItemModuleController *v6;
  objc_super v8;

  *(HUItemModuleControllerHosting **)((char *)&self->super._host
                                    + OBJC_IVAR____TtC6HomeUI30ActionGridItemModuleController_delegate) = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC6HomeUI30ActionGridItemModuleController____lazy_storage___collectionLayoutManager) = 0;
  swift_unknownObjectWeakInit();
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for ActionGridItemModuleController();
  v5 = (char *)a3;
  v6 = -[HUItemModuleController initWithModule:](&v8, sel_initWithModule_, v5);
  *(_QWORD *)&v5[OBJC_IVAR____TtC6HomeUI20ActionGridItemModule_delegate + 8] = &off_1E6F3FC10;
  swift_unknownObjectWeakAssign();

  return v6;
}

- (Class)collectionCellClassForItem:(id)a3
{
  id v4;
  _TtC6HomeUI30ActionGridItemModuleController *v5;
  unsigned int v6;

  v4 = a3;
  v5 = self;
  v6 = objc_msgSend(v4, sel_conformsToProtocol_, &unk_1EF2AC0A8);

  if (v6)
    type metadata accessor for AccessoryTileCell();
  else
    sub_1B8E23A60(0, (unint64_t *)&qword_1ED57E670);
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)configureCell:(id)a3 forItem:(id)a4
{
  id v6;
  id v7;
  _TtC6HomeUI30ActionGridItemModuleController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1B8E74190(v6, v7);

}

- (id)collectionLayoutSectionForSectionWithIdentifier:(id)a3 layoutEnvironment:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _TtC6HomeUI30ActionGridItemModuleController *v9;
  void *v10;

  v6 = sub_1B93EDDB4();
  v8 = v7;
  swift_unknownObjectRetain();
  v9 = self;
  v10 = sub_1B8E74E94(v6, v8, a4);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  return v10;
}

- (BOOL)hasDetailsActionFor:(id)a3 item:(id)a4
{
  id v6;
  id v7;
  _TtC6HomeUI30ActionGridItemModuleController *v8;
  HFItemModule *v9;
  char *v10;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = -[HUItemModuleController module](v8, sel_module);
  v10 = (char *)v9 + OBJC_IVAR____TtC6HomeUI20ActionGridItemModule_config;
  swift_beginAccess();
  LOBYTE(v10) = v10[16];

  return (char)v10;
}

- (id)detailsViewControllerFor:(id)a3 item:(id)a4
{
  id v6;
  id v7;
  _TtC6HomeUI30ActionGridItemModuleController *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = (void *)sub_1B8E75178((uint64_t)v6, v7);

  return v9;
}

- (void)serviceActionControlsViewController:(id)a3 removeServiceActionItem:(id)a4
{
  id v6;
  id v7;
  _TtC6HomeUI30ActionGridItemModuleController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1B8E783A4(v7);

}

- (id)displayedItemsInSection:(id)a3
{
  _TtC6HomeUI30ActionGridItemModuleController *v4;
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
  return 1;
}

- (id)transform:(id)a3
{
  id v4;
  _TtC6HomeUI30ActionGridItemModuleController *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  v6 = sub_1B8E79864(v4);

  return v6;
}

- (void).cxx_destruct
{
  sub_1B8E7A1E8((uint64_t)self + OBJC_IVAR____TtC6HomeUI30ActionGridItemModuleController_delegate);
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC6HomeUI30ActionGridItemModuleController____lazy_storage___collectionLayoutManager));
  swift_unknownObjectWeakDestroy();
}

@end
