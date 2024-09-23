@implementation HUMediaSystemEditorViewController

- (HUPresentationDelegate)presentationDelegate
{
  return (HUPresentationDelegate *)sub_1B8E7AFF8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___HUMediaSystemEditorViewController_presentationDelegate);
}

- (void)setPresentationDelegate:(id)a3
{
  sub_1B8E7B098();
}

- (HUMediaSystemEditorViewControllerDelegate)delegate
{
  return (HUMediaSystemEditorViewControllerDelegate *)sub_1B8E7AFF8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___HUMediaSystemEditorViewController_delegate);
}

- (void)setDelegate:(id)a3
{
  sub_1B8E7B098();
}

- (HFMediaSystemBuilder)mediaSystemBuilder
{
  return (HFMediaSystemBuilder *)objc_retainAutoreleaseReturnValue((*(id **)((char *)&self->super.super.super.super.super.super.isa
                                                                           + OBJC_IVAR___HUMediaSystemEditorViewController_selectionController))[2]);
}

- (HUMediaSystemEditorViewController)initWithAccessories:(id)a3 home:(id)a4
{
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  HUMediaSystemEditorViewController *v11;

  sub_1B8E23A60(0, (unint64_t *)&qword_1EF209310);
  sub_1B8E48724(&qword_1EF20ADB0, (unint64_t *)&qword_1EF209310);
  v6 = sub_1B93EE0FC();
  v7 = objc_allocWithZone(MEMORY[0x1E0D31550]);
  v8 = a4;
  v9 = objc_msgSend(v7, sel_initWithHome_, v8);
  sub_1B90172C0(v6, v9);
  v10 = (void *)sub_1B93EE0D8();
  swift_bridgeObjectRelease();
  v11 = -[HUMediaSystemEditorViewController initWithMediaSystemBuilder:staticAccessories:](self, sel_initWithMediaSystemBuilder_staticAccessories_, v9, v10);

  return v11;
}

- (HUMediaSystemEditorViewController)initWithMediaSystemBuilder:(id)a3 staticAccessories:(id)a4
{
  uint64_t v5;

  sub_1B8E23A60(0, (unint64_t *)&qword_1EF209310);
  sub_1B8E48724(&qword_1EF20ADB0, (unint64_t *)&qword_1EF209310);
  v5 = sub_1B93EE0FC();
  return (HUMediaSystemEditorViewController *)MediaSystemEditorViewController.init(mediaSystemBuilder:staticAccessories:)(a3, v5);
}

- (void)viewDidLoad
{
  HUMediaSystemEditorViewController *v2;

  v2 = self;
  sub_1B9015198();

}

- (void)createMediaSystemWithAccessory:(id)a3
{
  id v4;
  id v5;
  id v6;
  HUMediaSystemEditorViewController *v7;
  id v8;
  HUMediaSystemEditorViewController *v9;

  v4 = a3;
  v9 = self;
  v5 = sub_1B90147B8();
  v6 = objc_msgSend(v5, sel_createMediaSystemWithAccessory_, v4);

  if (v6)
  {
    v7 = (HUMediaSystemEditorViewController *)objc_msgSend(v6, sel_asGeneric);
    v8 = sub_1B9015698(v7);

    v4 = v8;
    v9 = v7;
  }

}

- (id)createMediaSystem
{
  HUMediaSystemEditorViewController *v2;
  id v3;
  id v4;
  id v5;
  id v6;

  v2 = self;
  v3 = sub_1B90147B8();
  v4 = objc_msgSend(v3, sel_createMediaSystem);

  v5 = objc_msgSend(v4, sel_asGeneric);
  v6 = sub_1B9015698(v5);

  return v6;
}

- (id)buildItemModuleControllerForModule:(id)a3
{
  id v4;
  HUMediaSystemEditorViewController *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  v6 = (void *)sub_1B9017658(v4);

  return v6;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  HUMediaSystemEditorViewController *v11;
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
  v13 = (objc_class *)type metadata accessor for MediaSystemEditorViewController();
  v14.receiver = v11;
  v14.super_class = v13;
  -[HUItemCollectionViewController collectionView:didSelectItemAtIndexPath:](&v14, sel_collectionView_didSelectItemAtIndexPath_, v10, v12);

  sub_1B9015E4C();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
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
  HUMediaSystemEditorViewController *v15;
  void *v16;
  void *v17;
  objc_class *v18;
  id v19;
  HUMediaSystemEditorViewController *v20;
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
      v18 = (objc_class *)type metadata accessor for MediaSystemEditorViewController();
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

- (HUMediaSystemEditorViewController)initWithItemManager:(id)a3 collectionViewLayout:(id)a4
{
  id v5;
  id v6;
  HUMediaSystemEditorViewController *result;

  v5 = a3;
  v6 = a4;
  result = (HUMediaSystemEditorViewController *)_swift_stdlib_reportUnimplementedInitializer();
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
  sub_1B8E7A1E8((uint64_t)self + OBJC_IVAR___HUMediaSystemEditorViewController_presentationDelegate);
  sub_1B8E7A1E8((uint64_t)self + OBJC_IVAR___HUMediaSystemEditorViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUMediaSystemEditorViewController_accessoryModule));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUMediaSystemEditorViewController____lazy_storage___helper));
}

- (void)cancelWithSender:(id)a3
{
  HUMediaSystemEditorViewController *v4;
  char *v5;
  void *v6;
  HUMediaSystemEditorViewController *v7;
  _BYTE v8[32];

  swift_unknownObjectRetain();
  v4 = self;
  sub_1B93EE69C();
  swift_unknownObjectRelease();
  v5 = (char *)v4 + OBJC_IVAR___HUMediaSystemEditorViewController_presentationDelegate;
  swift_beginAccess();
  v6 = (void *)MEMORY[0x1BCCC1DA8](v5);
  if (v6)
  {
    v7 = (HUMediaSystemEditorViewController *)objc_msgSend(v6, sel_finishPresentation_animated_, v4, 1);

    swift_unknownObjectRelease();
    v4 = v7;
  }

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
}

- (void)doneWithSender:(id)a3
{
  HUMediaSystemEditorViewController *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1B93EE69C();
  swift_unknownObjectRelease();
  v5 = sub_1B90147B8();
  v6 = objc_msgSend(v5, sel_createMediaSystem);

  v7 = objc_msgSend(v6, sel_asGeneric);
  v8 = sub_1B9015698(v7);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v9);
}

- (void)mediaSystemEditorHelperDidBeginCommitting:(id)a3
{
  id v4;
  HUMediaSystemEditorViewController *v5;

  v4 = a3;
  v5 = self;
  _s6HomeUI31MediaSystemEditorViewControllerC05mediadE24HelperDidBeginCommittingyySo07HUMediadeI0CF_0();

}

- (void)mediaSystemEditorHelperDidEndCommitting:(id)a3
{
  id v4;
  HUMediaSystemEditorViewController *v5;
  id v6;
  id v7;

  v4 = a3;
  v5 = self;
  sub_1B9015334();
  v6 = -[HUMediaSystemEditorViewController view](v5, sel_view);
  if (v6)
  {
    v7 = v6;
    objc_msgSend(v6, sel_setUserInteractionEnabled_, 1);

  }
  else
  {
    __break(1u);
  }
}

- (void)mediaSystemEditorHelper:(id)a3 didModifyMediaSystemBuilder:(id)a4
{
  id v6;
  id v7;
  HUMediaSystemEditorViewController *v8;
  HFItemManager *v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = -[HUItemCollectionViewController itemManager](v8, sel_itemManager);
  -[HFItemManager recalculateVisibilityAndSortAllItems](v9, sel_recalculateVisibilityAndSortAllItems);

}

- (void)mediaSystemEditorHelper:(id)a3 needsToPresentViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v6;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  HUMediaSystemEditorViewController *v15;
  id v16;
  id v17;
  HUMediaSystemEditorViewController *v18;
  _QWORD v19[6];

  v6 = a5;
  v10 = _Block_copy(a6);
  if (v10)
  {
    v11 = swift_allocObject();
    *(_QWORD *)(v11 + 16) = v10;
    v10 = sub_1B9017B68;
    v19[4] = sub_1B9017B68;
    v19[5] = v11;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 1107296256;
    v19[2] = sub_1B8EA3E34;
    v19[3] = &block_descriptor_22_0;
    v12 = _Block_copy(v19);
    v13 = a3;
    v14 = a4;
    v15 = self;
    swift_retain();
    swift_release();
  }
  else
  {
    v16 = a3;
    v17 = a4;
    v18 = self;
    v12 = 0;
  }
  -[HUMediaSystemEditorViewController presentViewController:animated:completion:](self, sel_presentViewController_animated_completion_, a4, v6, v12);
  _Block_release(v12);
  sub_1B8E6FE50((uint64_t)v10);

}

- (void)mediaSystemEditorHelper:(id)a3 didAbortForAccessoryNeedingUpdate:(id)a4
{
  id v6;
  id v7;
  HUMediaSystemEditorViewController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1B9017930((uint64_t)v7);

}

@end
