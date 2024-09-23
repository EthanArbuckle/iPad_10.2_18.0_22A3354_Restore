@implementation HUShortcutsAccessoryPickerViewController

- (HUShortcutsAccessoryPickerViewController)initWithHome:(id)a3 configuration:(id)a4
{
  id v6;
  id v7;
  HUShortcutsAccessoryPickerViewController *v8;
  void *v9;
  id v10;
  HUShortcutsAccessoryPickerViewController *v11;
  void *v13;

  v6 = a3;
  v7 = a4;
  v8 = self;
  HUShortcutsTriggerViewAccessoryPickerConfiguration.buildConfiguration()((uint64_t *)&v13);

  v9 = v13;
  v10 = objc_allocWithZone((Class)type metadata accessor for ShortcutsAccessoryPickerViewController());
  sub_1B8F5F130(v9);
  swift_retain();
  swift_unknownObjectRetain();
  v11 = (HUShortcutsAccessoryPickerViewController *)ShortcutsAccessoryPickerViewController.init(home:configuration:)(v6, (uint64_t *)&v13);

  sub_1B8F61394(v9);
  swift_release();
  swift_unknownObjectRelease();
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v11;
}

- (id)buildItemModuleControllerForModule:(id)a3
{
  id v4;
  HUShortcutsAccessoryPickerViewController *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = sub_1B8F60698(v4);

  return v6;
}

- (void)configureWithDefaultSelectionController
{
  HUShortcutsAccessoryPickerViewController *v2;

  v2 = self;
  sub_1B8F60AA4();

}

- (id)getServices
{
  HUShortcutsAccessoryPickerViewController *v2;
  void *v3;

  v2 = self;
  sub_1B8F60BAC();

  sub_1B8E23A60(0, (unint64_t *)&qword_1EF2082C0);
  sub_1B8F2A4E0();
  v3 = (void *)sub_1B93EE0D8();
  swift_bridgeObjectRelease();
  return v3;
}

- (void)setServices:(id)a3
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;

  sub_1B8E23A60(0, (unint64_t *)&qword_1EF2082C0);
  sub_1B8F2A4E0();
  v4 = sub_1B93EE0FC();
  v5 = (Class *)((char *)&self->super.super.super.super.super.super.isa
               + OBJC_IVAR___HUShortcutsAccessoryPickerViewController_selectionController);
  swift_beginAccess();
  if (*v5)
  {
    _s14descr1E6F4C011V26DefaultSelectionControllerCMa();
    v6 = swift_dynamicCastClass();
    if (v6)
      *(_QWORD *)(v6
                + OBJC_IVAR____TtCC6HomeUI38ShortcutsAccessoryPickerViewController26DefaultSelectionController_services) = v4;
  }
  swift_bridgeObjectRelease();
}

- (HUShortcutsAccessoryPickerViewController)initWithItemManager:(id)a3 collectionViewLayout:(id)a4
{
  id v5;
  id v6;
  HUShortcutsAccessoryPickerViewController *result;

  v5 = a3;
  v6 = a4;
  result = (HUShortcutsAccessoryPickerViewController *)_swift_stdlib_reportUnimplementedInitializer();
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
  sub_1B8F61394(*(id *)((char *)&self->super.super.super.super.super.super.isa
                      + OBJC_IVAR___HUShortcutsAccessoryPickerViewController_configuration));
  swift_unknownObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUShortcutsAccessoryPickerViewController_home));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUShortcutsAccessoryPickerViewController_moduleContext));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUShortcutsAccessoryPickerViewController_module));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUShortcutsAccessoryPickerViewController_moduleController));
}

@end
