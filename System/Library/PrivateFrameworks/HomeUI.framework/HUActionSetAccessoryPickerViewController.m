@implementation HUActionSetAccessoryPickerViewController

- (HFActionSetBuilder)actionSetBuilder
{
  return (HFActionSetBuilder *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.isa
                                                                       + OBJC_IVAR___HUActionSetAccessoryPickerViewController_actionSetBuilder));
}

- (HUActionSetAccessoryPickerViewController)initWithActionSetBuilder:(id)a3 delegate:(id)a4
{
  id v4;

  v4 = a3;
  swift_unknownObjectRetain();
  return (HUActionSetAccessoryPickerViewController *)ActionSetAccessoryPickerViewController.init(actionSetBuilder:delegate:)(v4);
}

- (void)viewDidLoad
{
  HUActionSetAccessoryPickerViewController *v2;

  v2 = self;
  sub_1B8F68FD8();

}

- (id)buildItemModuleControllerForModule:(id)a3
{
  id v4;
  HUActionSetAccessoryPickerViewController *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  v6 = (void *)sub_1B8F69AD4(v4);

  return v6;
}

- (void)cancelWithSender:(id)a3
{
  HUActionSetAccessoryPickerViewController *v4;
  void *v5;
  uint64_t v6;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1B93EE69C();
  swift_unknownObjectRelease();
  v5 = (void *)MEMORY[0x1BCCC1DA8]((char *)v4 + OBJC_IVAR___HUActionSetAccessoryPickerViewController_delegate);
  if (v5)
  {
    objc_msgSend(v5, sel_actionSetAccessoryPickerDidFinish_, v4);

    swift_unknownObjectRelease();
  }
  else
  {

  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v6);
}

- (void)doneWithSender:(id)a3
{
  HUActionSetAccessoryPickerViewController *v4;
  uint64_t v5;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1B93EE69C();
  swift_unknownObjectRelease();
  sub_1B8F6934C();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v5);
}

- (id)listContentConfigurationForSupplementaryElementOfKind:(id)a3 atIndexPath:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v14;
  HUActionSetAccessoryPickerViewController *v15;
  void *v16;
  void *v17;
  objc_class *v18;
  id v19;
  HUActionSetAccessoryPickerViewController *v20;
  objc_super v22;

  v5 = sub_1B93EB900();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1B93EDDB4();
  v11 = v10;
  sub_1B93EB8C4();
  if (v9 == sub_1B93EDDB4() && v11 == v12)
  {
    v20 = self;
    swift_bridgeObjectRelease();
  }
  else
  {
    v14 = sub_1B93EEB10();
    v15 = self;
    swift_bridgeObjectRelease();
    if ((v14 & 1) == 0)
    {
      v16 = (void *)sub_1B93EDD84();
      v17 = (void *)sub_1B93EB8B8();
      v18 = (objc_class *)type metadata accessor for ActionSetAccessoryPickerViewController();
      v22.receiver = v15;
      v22.super_class = v18;
      v19 = -[HUItemCollectionViewController listContentConfigurationForSupplementaryElementOfKind:atIndexPath:](&v22, sel_listContentConfigurationForSupplementaryElementOfKind_atIndexPath_, v16, v17);

      swift_bridgeObjectRelease();
      goto LABEL_11;
    }
  }
  if (qword_1EF207730 != -1)
    swift_once();
  v19 = (id)qword_1EF2096C0;

  swift_bridgeObjectRelease();
LABEL_11:
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return v19;
}

- (HUActionSetAccessoryPickerViewController)initWithItemManager:(id)a3 collectionViewLayout:(id)a4
{
  id v5;
  id v6;
  HUActionSetAccessoryPickerViewController *result;

  v5 = a3;
  v6 = a4;
  result = (HUActionSetAccessoryPickerViewController *)_swift_stdlib_reportUnimplementedInitializer();
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
                     + OBJC_IVAR___HUActionSetAccessoryPickerViewController_accessoryElementModule));
  swift_release();
  sub_1B8E7A1E8((uint64_t)self + OBJC_IVAR___HUActionSetAccessoryPickerViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUActionSetAccessoryPickerViewController_actionSetBuilder));
}

@end
