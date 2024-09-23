@implementation HUNearbyAccessoriesViewController

- (HUPresentationDelegate)presentationDelegate
{
  swift_beginAccess();
  return (HUPresentationDelegate *)(id)swift_unknownObjectRetain();
}

- (void)setPresentationDelegate:(id)a3
{
  id *v4;

  v4 = (id *)((char *)&self->super.super.super.super.super.super.super.isa
            + OBJC_IVAR___HUNearbyAccessoriesViewController_presentationDelegate);
  swift_beginAccess();
  *v4 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

+ (unint64_t)updateMode
{
  return 1;
}

- (HUNearbyAccessoriesViewController)initWithSourceItem:(id)a3 supportsQuickControls:(BOOL)a4
{
  return (HUNearbyAccessoriesViewController *)NearbyAccessoriesViewController.init(sourceItem:supportsQuickControls:)(a3, a4);
}

- (void)viewDidLoad
{
  HUNearbyAccessoriesViewController *v2;

  v2 = self;
  sub_1B8ED7ACC();

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for NearbyAccessoriesViewController();
  v4 = v5.receiver;
  -[HUControllableItemCollectionViewController viewDidAppear:](&v5, sel_viewDidAppear_, v3);
  sub_1B8ED86BC();

}

- (void)updateViewConstraints
{
  HUNearbyAccessoriesViewController *v2;

  v2 = self;
  sub_1B8ED7F84();

}

- (void)doneButtonPressedWithSender:(id)a3
{
  sub_1B8ED8650(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_1B8ED83C8);
}

- (void)displayEditorWithSender:(id)a3
{
  sub_1B8ED8650(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_1B8ED8490);
}

- (id)layoutSectionForSection:(int64_t)a3 layoutEnvironment:(id)a4
{
  HUNearbyAccessoriesViewController *v7;
  id v8;

  swift_unknownObjectRetain();
  v7 = self;
  v8 = sub_1B8ED8AB0(a3, a4);
  swift_unknownObjectRelease();

  return v8;
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  HUNearbyAccessoriesViewController *v11;
  unsigned int v12;
  uint64_t v14;

  v6 = sub_1B93EB900();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B93EB8C4();
  v10 = a3;
  v11 = self;
  v12 = objc_msgSend(v10, sel_conformsToProtocol_, &unk_1EF2AC0A8);

  if (v12)
    type metadata accessor for AccessoryTileCell();
  else
    sub_1B8E23A60(0, (unint64_t *)&qword_1ED57E670);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)configureCell:(id)a3 forItem:(id)a4
{
  id v6;
  id v7;
  HUNearbyAccessoriesViewController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1B8ED8E0C(v6, v7);

}

- (void)itemManager:(id)a3 didUpdateResultsForSourceItem:(id)a4
{
  id v6;
  id v7;
  HUNearbyAccessoriesViewController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1B8ED90F4((uint64_t)v6, (uint64_t)v7);

}

- (id)displayedItemsInSection:(id)a3
{
  HUNearbyAccessoriesViewController *v4;
  HFItemManager *v5;
  void *v6;
  id v7;
  void *v8;

  sub_1B93EDDB4();
  v4 = self;
  v5 = -[HUItemCollectionViewController itemManager](v4, sel_itemManager);
  v6 = (void *)sub_1B93EDD84();
  v7 = -[HFItemManager displayedItemsInSectionWithIdentifier:](v5, sel_displayedItemsInSectionWithIdentifier_, v6);

  sub_1B8E23A60(0, (unint64_t *)&qword_1ED57F910);
  sub_1B93EDF4C();

  swift_bridgeObjectRelease();
  v8 = (void *)sub_1B93EDF34();
  swift_bridgeObjectRelease();
  return v8;
}

- (BOOL)shouldShowHeaderForSection:(id)a3
{
  HUNearbyAccessoriesViewController *v4;
  HFItemManager *v5;
  void *v6;
  id v7;
  HFItemManager *v8;
  id v9;

  sub_1B93EDDB4();
  v4 = self;
  v5 = -[HUItemCollectionViewController itemManager](v4, sel_itemManager);
  v6 = (void *)sub_1B93EDD84();
  v7 = -[HFItemManager sectionIndexForDisplayedSectionIdentifier:](v5, sel_sectionIndexForDisplayedSectionIdentifier_, v6);

  v8 = -[HUItemCollectionViewController itemManager](v4, sel_itemManager);
  v9 = -[HFItemManager titleForSection:](v8, sel_titleForSection_, v7);

  swift_bridgeObjectRelease();
  if (v9)

  return v9 != 0;
}

- (BOOL)presentationCoordinator:(id)a3 shouldBeginLongPressPresentationWithContext:(id)a4
{
  return 0;
}

- (BOOL)presentationCoordinator:(id)a3 shouldBeginPresentationWithContext:(id)a4
{
  id v6;
  id v7;
  _BYTE *v8;
  char v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for NearbyAccessoriesViewController();
  v6 = a3;
  v7 = a4;
  v8 = v11.receiver;
  if (-[HUControllableItemCollectionViewController presentationCoordinator:shouldBeginPresentationWithContext:](&v11, sel_presentationCoordinator_shouldBeginPresentationWithContext_, v6, v7))
  {
    v9 = v8[OBJC_IVAR___HUNearbyAccessoriesViewController_supportsQuickControls];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)presentationCoordinatorShouldProvideCancellationFeedback:(id)a3
{
  return (*((_BYTE *)&self->super.super.super.super.super.super.super.isa
          + OBJC_IVAR___HUNearbyAccessoriesViewController_supportsQuickControls) & 1) == 0;
}

- (HUNearbyAccessoriesViewController)initWithItemManager:(id)a3 collectionViewLayout:(id)a4
{
  id v5;
  id v6;
  HUNearbyAccessoriesViewController *result;

  v5 = a3;
  v6 = a4;
  result = (HUNearbyAccessoriesViewController *)_swift_stdlib_reportUnimplementedInitializer();
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
  sub_1B8ED9844((uint64_t)self + OBJC_IVAR___HUNearbyAccessoriesViewController_nearbyAccessoriesDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUNearbyAccessoriesViewController_currentAccessory));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUNearbyAccessoriesViewController_layoutManager));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUNearbyAccessoriesViewController__userInfoDescription));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUNearbyAccessoriesViewController__userInfoHeading));
}

@end
