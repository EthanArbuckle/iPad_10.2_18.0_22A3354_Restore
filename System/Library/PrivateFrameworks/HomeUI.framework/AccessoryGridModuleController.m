@implementation AccessoryGridModuleController

- (Class)collectionCellClassForItem:(id)a3
{
  id v5;
  _TtC6HomeUI29AccessoryGridModuleController *v6;
  objc_super v8;
  void *v9;

  v9 = &unk_1EF2AC0A8;
  if (swift_dynamicCastObjCProtocolConditional())
  {
    type metadata accessor for AccessoryTileCell();
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)type metadata accessor for AccessoryGridModuleController();
    v5 = a3;
    v6 = self;
    -[HUItemModuleController collectionCellClassForItem:](&v8, sel_collectionCellClassForItem_, v5);

    swift_getObjCClassMetadata();
  }
  return (Class)swift_getObjCClassFromMetadata();
}

- (id)collectionLayoutSectionForSectionWithIdentifier:(id)a3 layoutEnvironment:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _TtC6HomeUI29AccessoryGridModuleController *v9;
  id v10;

  v6 = sub_1B93EDDB4();
  v8 = v7;
  swift_unknownObjectRetain();
  v9 = self;
  v10 = sub_1B9018204(v6, v8, a4);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  return v10;
}

- (void)configureCell:(id)a3 forItem:(id)a4
{
  id v6;
  id v7;
  _TtC6HomeUI29AccessoryGridModuleController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1B9018438(v6, v7);

}

- (id)displayedItemsInSection:(id)a3
{
  _TtC6HomeUI29AccessoryGridModuleController *v4;
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
  _TtC6HomeUI29AccessoryGridModuleController *v3;
  HFItemModule *v4;
  uint64_t *v5;
  uint64_t v6;

  v3 = self;
  v4 = -[HUItemModuleController module](v3, sel_module);
  v5 = (uint64_t *)((char *)v4 + OBJC_IVAR____TtC6HomeUI19AccessoryItemModule_sectionGroupingType);
  swift_beginAccess();
  v6 = *v5;

  return v6 != 0;
}

- (id)transform:(id)a3
{
  id v4;
  _TtC6HomeUI29AccessoryGridModuleController *v5;

  v4 = a3;
  v5 = self;
  objc_msgSend(v4, sel_setSectionLeadingMargin_, 0.0);
  objc_msgSend(v4, sel_setSectionTrailingMargin_, 0.0);

  return v4;
}

- (_TtC6HomeUI29AccessoryGridModuleController)initWithModule:(id)a3
{
  char *v4;
  char *v5;
  objc_super v7;

  v4 = (char *)self + OBJC_IVAR____TtC6HomeUI29AccessoryGridModuleController_cellSettings;
  *(_OWORD *)v4 = xmmword_1B9438F40;
  *((_WORD *)v4 + 8) = 256;
  v4[18] = 0;
  *((_QWORD *)v4 + 3) = 0;
  v4[32] = 1;
  v5 = (char *)self + OBJC_IVAR____TtC6HomeUI29AccessoryGridModuleController_layoutStyle;
  *(_OWORD *)v5 = xmmword_1B9436B50;
  v5[16] = 2;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC6HomeUI29AccessoryGridModuleController____lazy_storage___collectionLayoutManager) = 0;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for AccessoryGridModuleController();
  return -[HUItemModuleController initWithModule:](&v7, sel_initWithModule_, a3);
}

- (void).cxx_destruct
{
  sub_1B8E3EF7C(*(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC6HomeUI29AccessoryGridModuleController_layoutStyle), *(uint64_t *)((char *)&self->super._host + OBJC_IVAR____TtC6HomeUI29AccessoryGridModuleController_layoutStyle), *((_BYTE *)&self->super._hostType + OBJC_IVAR____TtC6HomeUI29AccessoryGridModuleController_layoutStyle));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC6HomeUI29AccessoryGridModuleController____lazy_storage___collectionLayoutManager));
}

@end
