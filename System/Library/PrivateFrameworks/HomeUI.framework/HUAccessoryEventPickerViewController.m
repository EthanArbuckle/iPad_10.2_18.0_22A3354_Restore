@implementation HUAccessoryEventPickerViewController

- (HFCharacteristicEventBuilderItem)eventBuilderItem
{
  return (HFCharacteristicEventBuilderItem *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.isa
                                                                                     + OBJC_IVAR___HUAccessoryEventPickerViewController_eventBuilderItem));
}

- (HFEventTriggerBuilder)triggerBuilder
{
  return (HFEventTriggerBuilder *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.isa
                                                                          + OBJC_IVAR___HUAccessoryEventPickerViewController_triggerBuilder));
}

- (unint64_t)mode
{
  return *(unint64_t *)((char *)&self->super.super.super.super.super.super.isa
                             + OBJC_IVAR___HUAccessoryEventPickerViewController_mode);
}

- (unint64_t)source
{
  return *(unint64_t *)((char *)&self->super.super.super.super.super.super.isa
                             + OBJC_IVAR___HUAccessoryEventPickerViewController_source);
}

- (HUTriggerEditorDelegate)delegate
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___HUAccessoryEventPickerViewController_delegate;
  swift_beginAccess();
  return (HUTriggerEditorDelegate *)(id)MEMORY[0x1BCCC1DA8](v2);
}

- (void)setDelegate:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (id)filter
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  _QWORD aBlock[6];

  v2 = (Class *)((char *)&self->super.super.super.super.super.super.isa
               + OBJC_IVAR___HUAccessoryEventPickerViewController_filter);
  swift_beginAccess();
  if (!*v2)
    return 0;
  v3 = v2[1];
  aBlock[4] = *v2;
  aBlock[5] = v3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1B8F0AADC;
  aBlock[3] = &block_descriptor_23_0;
  v4 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  return v4;
}

- (void)setFilter:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v4;
    v4 = sub_1B8F11200;
  }
  else
  {
    v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___HUAccessoryEventPickerViewController_filter);
  swift_beginAccess();
  v7 = *v6;
  *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_1B8E6FE50(v7);
}

- (HUAccessoryEventPickerViewController)initWithEventBuilderItem:(id)a3 triggerBuilder:(id)a4 mode:(unint64_t)a5 source:(unint64_t)a6 delegate:(id)a7
{
  id v10;
  id v11;

  v10 = a3;
  v11 = a4;
  swift_unknownObjectRetain();
  return (HUAccessoryEventPickerViewController *)AccessoryEventPickerViewController.init(eventBuilderItem:triggerBuilder:mode:source:delegate:)(v10, v11, a5, a6);
}

- (void)viewDidLoad
{
  HUAccessoryEventPickerViewController *v2;

  v2 = self;
  sub_1B90104D4();

}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  HUAccessoryEventPickerViewController *v11;
  void *v12;
  objc_class *v13;
  objc_super v14;

  v6 = sub_1B93EB900();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B93EB8C4();
  v10 = a3;
  v11 = self;
  v12 = (void *)sub_1B93EB8B8();
  v13 = (objc_class *)type metadata accessor for AccessoryEventPickerViewController();
  v14.receiver = v11;
  v14.super_class = v13;
  -[HUItemCollectionViewController collectionView:didSelectItemAtIndexPath:](&v14, sel_collectionView_didSelectItemAtIndexPath_, v10, v12);

  sub_1B9010A6C();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (id)buildItemModuleControllerForModule:(id)a3
{
  id v4;
  HUAccessoryEventPickerViewController *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = sub_1B9011910(v4);

  return v6;
}

- (void)validateNextButton
{
  HUAccessoryEventPickerViewController *v2;

  v2 = self;
  sub_1B9010A6C();

}

- (void)nextWithSender:(id)a3
{
  HUAccessoryEventPickerViewController *v4;
  uint64_t v5;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1B93EE69C();
  swift_unknownObjectRelease();
  sub_1B9010C84();

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
  HUAccessoryEventPickerViewController *v15;
  void *v16;
  void *v17;
  objc_class *v18;
  id v19;
  HUAccessoryEventPickerViewController *v20;
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
      v18 = (objc_class *)type metadata accessor for AccessoryEventPickerViewController();
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

- (HUAccessoryEventPickerViewController)initWithItemManager:(id)a3 collectionViewLayout:(id)a4
{
  id v5;
  id v6;
  HUAccessoryEventPickerViewController *result;

  v5 = a3;
  v6 = a4;
  result = (HUAccessoryEventPickerViewController *)_swift_stdlib_reportUnimplementedInitializer();
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
                     + OBJC_IVAR___HUAccessoryEventPickerViewController_accessoryElementModule));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUAccessoryEventPickerViewController_selectionController));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUAccessoryEventPickerViewController_eventBuilderItem));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUAccessoryEventPickerViewController_triggerBuilder));
  sub_1B8E7A1E8((uint64_t)self + OBJC_IVAR___HUAccessoryEventPickerViewController_delegate);
  sub_1B8E6FE50(*(uint64_t *)((char *)&self->super.super.super.super.super.super.isa
                           + OBJC_IVAR___HUAccessoryEventPickerViewController_filter));
}

@end
