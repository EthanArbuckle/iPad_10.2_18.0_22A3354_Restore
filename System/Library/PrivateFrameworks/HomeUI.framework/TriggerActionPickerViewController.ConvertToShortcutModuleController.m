@implementation TriggerActionPickerViewController.ConvertToShortcutModuleController

- (Class)collectionCellClassForItem:(id)a3
{
  sub_1B8E23A60(0, (unint64_t *)&qword_1ED57E670);
  return (Class)swift_getObjCClassFromMetadata();
}

- (id)collectionLayoutSectionForSectionWithIdentifier:(id)a3 layoutEnvironment:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _TtCC6HomeUI33TriggerActionPickerViewController33ConvertToShortcutModuleController *v9;
  void *v10;

  v6 = sub_1B93EDDB4();
  v8 = v7;
  swift_unknownObjectRetain();
  v9 = self;
  v10 = sub_1B8F21CE0(v6, v8, (uint64_t)a4);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  return v10;
}

- (unint64_t)didSelectItem:(id)a3
{
  id v4;
  _TtCC6HomeUI33TriggerActionPickerViewController33ConvertToShortcutModuleController *v5;

  v4 = a3;
  v5 = self;
  sub_1B8F21FB4(v4);

  return 0;
}

- (void)configureCell:(id)a3 forItem:(id)a4
{
  id v6;
  id v7;
  _TtCC6HomeUI33TriggerActionPickerViewController33ConvertToShortcutModuleController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1B8F22108((uint64_t)v6, v7);

}

- (id)displayedItemsInSection:(id)a3
{
  _TtCC6HomeUI33TriggerActionPickerViewController33ConvertToShortcutModuleController *v4;
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
  _TtCC6HomeUI33TriggerActionPickerViewController33ConvertToShortcutModuleController *v3;
  HFItemModule *v4;
  uint64_t v5;

  v3 = self;
  v4 = -[HUItemModuleController module](v3, sel_module);
  v5 = *(uint64_t *)((char *)&v4->_itemProviders
                  + OBJC_IVAR____TtCC6HomeUI33TriggerActionPickerViewController23ConvertToShortcutModule_sectionHeader);
  sub_1B93ECF74();

  if (v5)
    swift_bridgeObjectRelease();
  return v5 != 0;
}

- (_TtCC6HomeUI33TriggerActionPickerViewController33ConvertToShortcutModuleController)initWithModule:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtCC6HomeUI33TriggerActionPickerViewController33ConvertToShortcutModuleController____lazy_storage___collectionLayoutManager) = 0;
  v5.receiver = self;
  v5.super_class = (Class)_s33ConvertToShortcutModuleControllerCMa();
  return -[HUItemModuleController initWithModule:](&v5, sel_initWithModule_, a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtCC6HomeUI33TriggerActionPickerViewController33ConvertToShortcutModuleController____lazy_storage___collectionLayoutManager));
}

@end
