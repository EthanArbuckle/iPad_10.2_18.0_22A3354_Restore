@implementation HUTriggerActionPickerViewController

- (id)triggerBuilder
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.isa
                                                 + OBJC_IVAR___HUTriggerActionPickerViewController_triggerBuilder));
}

- (HUTriggerActionFlow)flow
{
  return (HUTriggerActionFlow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.isa
                                                                        + OBJC_IVAR___HUTriggerActionPickerViewController_flow));
}

- (HUTriggerEditorDelegate)delegate
{
  return (HUTriggerEditorDelegate *)(id)swift_unknownObjectRetain();
}

- (HUTriggerActionPickerViewController)initWithTriggerBuilder:(id)a3 mode:(unint64_t)a4 delegate:(id)a5
{
  id v9;
  id v10;
  id v11;
  HUTriggerActionPickerViewController *v12;

  v9 = objc_allocWithZone((Class)HUTriggerActionFlow);
  v10 = a3;
  swift_unknownObjectRetain();
  v11 = objc_msgSend(v9, sel_initWithEditorMode_, a4);
  v12 = -[HUTriggerActionPickerViewController initWithTriggerBuilder:flow:delegate:](self, sel_initWithTriggerBuilder_flow_delegate_, v10, v11, a5);

  swift_unknownObjectRelease();
  return v12;
}

- (HUTriggerActionPickerViewController)initWithTriggerBuilder:(id)a3 flow:(id)a4 delegate:(id)a5
{
  id v7;
  id v8;

  v7 = a3;
  v8 = a4;
  swift_unknownObjectRetain();
  return (HUTriggerActionPickerViewController *)TriggerActionPickerViewController.init(triggerBuilder:flow:delegate:)(v7, v8, (uint64_t)a5);
}

- (void)viewDidLoad
{
  HUTriggerActionPickerViewController *v2;

  v2 = self;
  sub_1B8ED12E0();

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  id v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for TriggerActionPickerViewController();
  v4 = v7.receiver;
  -[HUItemCollectionViewController viewDidAppear:](&v7, sel_viewDidAppear_, v3);
  v5 = objc_msgSend(v4, sel_navigationController, v7.receiver, v7.super_class);
  if (v5)
  {
    v6 = v5;
    if ((objc_msgSend(v5, sel_isBeingDismissed) & 1) == 0)
      sub_1B8ED1D1C();

  }
  sub_1B8ED20C4();

}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  HUTriggerActionPickerViewController *v11;
  uint64_t v13;

  v6 = sub_1B93EB900();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B93EB8C4();
  v10 = a3;
  v11 = self;
  sub_1B8ED15C0((uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return (Class)swift_getObjCClassFromMetadata();
}

- (id)buildItemModuleControllerForModule:(id)a3
{
  id v4;
  HUTriggerActionPickerViewController *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  v6 = (void *)sub_1B8ED1840(v4);

  return v6;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  HUTriggerActionPickerViewController *v11;
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
  v13 = (objc_class *)type metadata accessor for TriggerActionPickerViewController();
  v14.receiver = v11;
  v14.super_class = v13;
  -[HUItemCollectionViewController collectionView:didSelectItemAtIndexPath:](&v14, sel_collectionView_didSelectItemAtIndexPath_, v10, v12);

  sub_1B8ED20C4();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)cancelWithSender:(id)a3
{
  HUTriggerActionPickerViewController *v4;
  uint64_t v5;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1B93EE69C();
  swift_unknownObjectRelease();
  objc_msgSend(*(id *)((char *)&v4->super.super.super.super.super.super.isa+ OBJC_IVAR___HUTriggerActionPickerViewController_delegate), sel_triggerEditor_didFinishWithTriggerBuilder_, v4, 0);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v5);
}

- (void)nextWithSender:(id)a3
{
  HUTriggerActionPickerViewController *v4;
  uint64_t v5;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1B93EE69C();
  swift_unknownObjectRelease();
  sub_1B8ED228C();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v5);
}

- (void)itemManagerDidUpdate:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for TriggerActionPickerViewController();
  v4 = a3;
  v5 = v6.receiver;
  -[HUItemCollectionViewController itemManagerDidUpdate:](&v6, sel_itemManagerDidUpdate_, v4);
  sub_1B8ED20C4();

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
  HUTriggerActionPickerViewController *v15;
  void *v16;
  void *v17;
  objc_class *v18;
  id v19;
  HUTriggerActionPickerViewController *v20;
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
      v18 = (objc_class *)type metadata accessor for TriggerActionPickerViewController();
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

- (HUTriggerActionPickerViewController)initWithItemManager:(id)a3 collectionViewLayout:(id)a4
{
  id v5;
  id v6;
  HUTriggerActionPickerViewController *result;

  v5 = a3;
  v6 = a4;
  result = (HUTriggerActionPickerViewController *)_swift_stdlib_reportUnimplementedInitializer();
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
                     + OBJC_IVAR___HUTriggerActionPickerViewController_actionSetModule));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUTriggerActionPickerViewController_accessoryModule));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUTriggerActionPickerViewController_triggerBuilder));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUTriggerActionPickerViewController_flow));
  swift_unknownObjectRelease();
}

- (void)homeWorkflowEditorViewController:(id)a3 didFinishWithHomeWorkflow:(id)a4 includesSecureAccessory:(BOOL)a5
{
  void *v7;
  id v8;
  id v9;
  id v10;
  HUTriggerActionPickerViewController *v11;

  v7 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR___HUTriggerActionPickerViewController_triggerBuilder);
  v8 = a3;
  v9 = a4;
  v11 = self;
  v10 = objc_msgSend(v7, sel_triggerActionSets);
  objc_msgSend(v10, sel_setHomeWorkflow_, v9);

  sub_1B8ED2798();
}

@end
