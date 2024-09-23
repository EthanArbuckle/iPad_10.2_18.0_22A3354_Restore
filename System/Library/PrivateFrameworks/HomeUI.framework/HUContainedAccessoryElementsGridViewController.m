@implementation HUContainedAccessoryElementsGridViewController

- (BOOL)requiresPresentingViewControllerDismissal
{
  BOOL *v2;

  v2 = (BOOL *)self
     + OBJC_IVAR___HUContainedAccessoryElementsGridViewController_requiresPresentingViewControllerDismissal;
  swift_beginAccess();
  return *v2;
}

- (void)setRequiresPresentingViewControllerDismissal:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self
     + OBJC_IVAR___HUContainedAccessoryElementsGridViewController_requiresPresentingViewControllerDismissal;
  swift_beginAccess();
  *v4 = a3;
}

- (HUPresentationDelegate)presentationDelegate
{
  swift_beginAccess();
  return (HUPresentationDelegate *)(id)swift_unknownObjectRetain();
}

- (void)setPresentationDelegate:(id)a3
{
  id *v4;

  v4 = (id *)((char *)&self->super.super.super.super.super.super.super.isa
            + OBJC_IVAR___HUContainedAccessoryElementsGridViewController_presentationDelegate);
  swift_beginAccess();
  *v4 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (HUServiceContainerItem)serviceContainingItem
{
  return (HUServiceContainerItem *)sub_1B8E34318((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___HUContainedAccessoryElementsGridViewController_serviceContainingItem);
}

- (void)setServiceContainingItem:(id)a3
{
  sub_1B8F964A4((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR___HUContainedAccessoryElementsGridViewController_serviceContainingItem);
}

- (HFMediaAccessoryItem)mediaItem
{
  return (HFMediaAccessoryItem *)sub_1B8E34318((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___HUContainedAccessoryElementsGridViewController_mediaItem);
}

- (void)setMediaItem:(id)a3
{
  sub_1B8F964A4((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR___HUContainedAccessoryElementsGridViewController_mediaItem);
}

- (HUContainedAccessoryElementsGridViewControllerDelegate)serviceGridDelegate
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___HUContainedAccessoryElementsGridViewController_serviceGridDelegate;
  swift_beginAccess();
  return (HUContainedAccessoryElementsGridViewControllerDelegate *)(id)MEMORY[0x1BCCC1DA8](v2);
}

- (void)setServiceGridDelegate:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (HUContainedAccessoryElementsGridViewController)initWithServiceContainingItem:(id)a3 isPresentedModally:(BOOL)a4 shouldGroupByRoom:(BOOL)a5 valueSource:(id)a6
{
  return -[HUContainedAccessoryElementsGridViewController initWithServiceContainingItem:mediaItem:isPresentedModally:shouldGroupByRoom:valueSource:](self, sel_initWithServiceContainingItem_mediaItem_isPresentedModally_shouldGroupByRoom_valueSource_, a3, 0, a4, a5, a6);
}

- (HUContainedAccessoryElementsGridViewController)initWithMediaItem:(id)a3 isPresentedModally:(BOOL)a4 shouldGroupByRoom:(BOOL)a5 valueSource:(id)a6
{
  return -[HUContainedAccessoryElementsGridViewController initWithServiceContainingItem:mediaItem:isPresentedModally:shouldGroupByRoom:valueSource:](self, sel_initWithServiceContainingItem_mediaItem_isPresentedModally_shouldGroupByRoom_valueSource_, 0, a3, a4, a5, a6);
}

- (HUContainedAccessoryElementsGridViewController)initWithServiceContainingItem:(id)a3 mediaItem:(id)a4 isPresentedModally:(BOOL)a5 shouldGroupByRoom:(BOOL)a6 valueSource:(id)a7
{
  id v12;
  id v13;

  v12 = a3;
  v13 = a4;
  swift_unknownObjectRetain();
  return (HUContainedAccessoryElementsGridViewController *)ContainedAccessoryElementsGridViewController.init(serviceContainingItem:mediaItem:isPresentedModally:shouldGroupByRoom:valueSource:)(a3, a4, a5, a6, (uint64_t)a7);
}

- (void)viewDidLoad
{
  id v2;
  id v3;
  void *v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ContainedAccessoryElementsGridViewController();
  v2 = v6.receiver;
  -[HUControllableItemCollectionViewController viewDidLoad](&v6, sel_viewDidLoad);
  v3 = objc_msgSend(v2, sel_collectionView, v6.receiver, v6.super_class);
  if (v3)
  {
    v4 = v3;
    v5 = objc_msgSend((id)objc_opt_self(), sel_systemGroupedBackgroundColor);
    objc_msgSend(v4, sel_setBackgroundColor_, v5);

  }
  else
  {
    __break(1u);
  }
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  HUContainedAccessoryElementsGridViewController *v11;
  void *v12;
  objc_class *v13;
  uint64_t v15;
  objc_super v16;
  void *v17;

  v6 = sub_1B93EB900();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B93EB8C4();
  v17 = &unk_1EF2AC0A8;
  if (swift_dynamicCastObjCProtocolConditional())
  {
    type metadata accessor for AccessoryTileCell();
  }
  else
  {
    v10 = a3;
    v11 = self;
    v12 = (void *)sub_1B93EB8B8();
    v13 = (objc_class *)type metadata accessor for ContainedAccessoryElementsGridViewController();
    v16.receiver = v11;
    v16.super_class = v13;
    -[HUItemCollectionViewController cellClassForItem:indexPath:](&v16, sel_cellClassForItem_indexPath_, v10, v12);

    swift_getObjCClassMetadata();
  }
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)configureCell:(id)a3 forItem:(id)a4
{
  id v6;
  HUContainedAccessoryElementsGridViewController *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = self;
  sub_1B8F977C0(v8, v6);

}

- (void)itemManagerDidUpdate:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ContainedAccessoryElementsGridViewController();
  v4 = a3;
  v5 = v6.receiver;
  -[HUItemCollectionViewController itemManagerDidUpdate:](&v6, sel_itemManagerDidUpdate_, v4);
  sub_1B8F97B64();

}

- (id)layoutSectionForSection:(int64_t)a3 layoutEnvironment:(id)a4
{
  HUContainedAccessoryElementsGridViewController *v7;
  void *v8;

  swift_unknownObjectRetain();
  v7 = self;
  v8 = sub_1B8F97DF0(a3, a4);
  swift_unknownObjectRelease();

  return v8;
}

- (void)accessoryControlViewControllerFor:(HFAccessoryRepresentableItem *)a3 tileItem:(HFItem *)a4 completionHandler:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  HFAccessoryRepresentableItem *v17;
  HFItem *v18;
  HUContainedAccessoryElementsGridViewController *v19;
  uint64_t v20;

  v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED57F900);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = sub_1B93EE090();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1EF20EF00;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1EF209370;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_1B901BAB4((uint64_t)v11, (uint64_t)&unk_1EF20E5B0, (uint64_t)v16);
  swift_release();
}

- (BOOL)hasDetailsActionForPresentationCoordinator:(id)a3 item:(id)a4
{
  char *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  HUContainedAccessoryElementsGridViewController *v12;
  unsigned __int8 v13;

  v7 = (char *)self + OBJC_IVAR___HUContainedAccessoryElementsGridViewController_serviceGridDelegate;
  swift_beginAccess();
  v8 = (void *)MEMORY[0x1BCCC1DA8](v7);
  if (!v8)
    return 0;
  v9 = v8;
  if ((objc_msgSend(v8, sel_respondsToSelector_, sel_hasDetailsActionFor_item_) & 1) != 0)
  {
    v10 = a3;
    v11 = a4;
    v12 = self;
    v13 = objc_msgSend(v9, sel_hasDetailsActionFor_item_, v12, v11);

  }
  else
  {
    v13 = 0;
  }
  swift_unknownObjectRelease();
  return v13;
}

- (id)detailsViewControllerForPresentationCoordinator:(id)a3 item:(id)a4
{
  id v6;
  id v7;
  HUContainedAccessoryElementsGridViewController *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = (void *)sub_1B8F99F94(v7);

  return v9;
}

- (HUContainedAccessoryElementsGridViewController)initWithItemManager:(id)a3 collectionViewLayout:(id)a4
{
  id v5;
  id v6;
  HUContainedAccessoryElementsGridViewController *result;

  v5 = a3;
  v6 = a4;
  result = (HUContainedAccessoryElementsGridViewController *)_swift_stdlib_reportUnimplementedInitializer();
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
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUContainedAccessoryElementsGridViewController____lazy_storage___collectionLayoutManager));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUContainedAccessoryElementsGridViewController_serviceContainingItem));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUContainedAccessoryElementsGridViewController_mediaItem));
  sub_1B8E7A1E8((uint64_t)self + OBJC_IVAR___HUContainedAccessoryElementsGridViewController_serviceGridDelegate);
  swift_release();
  swift_release();
}

- (id)displayedItemsInSection:(id)a3
{
  HUContainedAccessoryElementsGridViewController *v4;
  HFItemManager *v5;
  HFItemManager *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;

  sub_1B93EDDB4();
  v4 = self;
  v5 = -[HUItemCollectionViewController itemManager](v4, sel_itemManager);
  v6 = -[HUItemCollectionViewController itemManager](v4, sel_itemManager);
  v7 = (void *)sub_1B93EDD84();
  v8 = -[HFItemManager sectionIndexForDisplayedSectionIdentifier:](v6, sel_sectionIndexForDisplayedSectionIdentifier_, v7);

  v9 = -[HFItemManager displayedItemsInSection:](v5, sel_displayedItemsInSection_, v8);
  sub_1B8E23A60(0, (unint64_t *)&qword_1ED57F910);
  sub_1B93EDF4C();

  swift_bridgeObjectRelease();
  v10 = (void *)sub_1B93EDF34();
  swift_bridgeObjectRelease();
  return v10;
}

- (BOOL)shouldShowHeaderForSection:(id)a3
{
  return 1;
}

- (id)finishPresentation:(id)a3 animated:(BOOL)a4
{
  id v6;
  HUContainedAccessoryElementsGridViewController *v7;
  id v8;

  v6 = a3;
  v7 = self;
  v8 = ContainedAccessoryElementsGridViewController.finishPresentation(_:animated:)(v6, a4);

  return v8;
}

- (void)doneWithSender:(id)a3
{
  HUContainedAccessoryElementsGridViewController *v4;
  _QWORD *v5;
  HUContainedAccessoryElementsGridViewController *v6;
  _BYTE v7[32];

  swift_unknownObjectRetain();
  v4 = self;
  sub_1B93EE69C();
  swift_unknownObjectRelease();
  v5 = (Class *)((char *)&v4->super.super.super.super.super.super.super.isa
               + OBJC_IVAR___HUContainedAccessoryElementsGridViewController_presentationDelegate);
  swift_beginAccess();
  if (*v5)
  {
    v6 = (HUContainedAccessoryElementsGridViewController *)objc_msgSend((id)swift_unknownObjectRetain(), sel_finishPresentation_animated_, v4, 1);

    swift_unknownObjectRelease();
    v4 = v6;
  }

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
}

- (void)editWithSender:(id)a3
{
  HUContainedAccessoryElementsGridViewController *v4;
  uint64_t v5;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1B93EE69C();
  swift_unknownObjectRelease();
  sub_1B8F98B40();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v5);
}

@end
