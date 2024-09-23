@implementation TriggerActionPickerViewController.ConvertToShortcutModule

- (id)buildItemProviders
{
  _TtCC6HomeUI33TriggerActionPickerViewController23ConvertToShortcutModule *v2;
  uint64_t v3;
  void *v4;

  v2 = self;
  v3 = sub_1B8F21308();

  if (v3)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED57E930);
    sub_1B8E6DFF4();
    v4 = (void *)sub_1B93EE0D8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  uint64_t v4;
  _TtCC6HomeUI33TriggerActionPickerViewController23ConvertToShortcutModule *v5;
  void *v6;

  sub_1B8E23A60(0, (unint64_t *)&qword_1ED57F910);
  sub_1B8E34E3C();
  v4 = sub_1B93EE0FC();
  v5 = self;
  sub_1B8F21798(v4);

  swift_bridgeObjectRelease();
  sub_1B8E23A60(0, (unint64_t *)&unk_1ED57E910);
  v6 = (void *)sub_1B93EDF34();
  swift_bridgeObjectRelease();
  return v6;
}

- (_TtCC6HomeUI33TriggerActionPickerViewController23ConvertToShortcutModule)initWithItemUpdater:(id)a3
{
  _TtCC6HomeUI33TriggerActionPickerViewController23ConvertToShortcutModule *result;

  swift_unknownObjectRetain();
  result = (_TtCC6HomeUI33TriggerActionPickerViewController23ConvertToShortcutModule *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1B8E7A1E8((uint64_t)self + OBJC_IVAR____TtCC6HomeUI33TriggerActionPickerViewController23ConvertToShortcutModule_delegate);
  swift_unknownObjectWeakDestroy();
  swift_bridgeObjectRelease();
  swift_unknownObjectWeakDestroy();
}

@end
