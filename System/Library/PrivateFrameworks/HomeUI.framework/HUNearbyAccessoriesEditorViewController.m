@implementation HUNearbyAccessoriesEditorViewController

- (HUNearbyAccessoriesEditorViewController)initWithPrimaryAccessory:(id)a3 completionHandler:(id)a4
{
  void *v5;
  uint64_t v6;

  v5 = _Block_copy(a4);
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = v5;
  return (HUNearbyAccessoriesEditorViewController *)NearbyAccessoriesEditorViewController.init(primaryAccessory:completionHandler:)(a3, (uint64_t)sub_1B8F07950, v6);
}

- (void)viewDidLoad
{
  HUNearbyAccessoriesEditorViewController *v2;

  v2 = self;
  sub_1B8F44404();

}

- (void)dismissEditorWithSender:(id)a3
{
  HUNearbyAccessoriesEditorViewController *v4;
  uint64_t v5;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1B93EE69C();
  swift_unknownObjectRelease();
  sub_1B8F44644();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v5);
}

- (void)cancelEditingWithSender:(id)a3
{
  HUNearbyAccessoriesEditorViewController *v4;
  uint64_t v5;
  void *v6;
  HUNearbyAccessoriesEditorViewController *v7;
  _QWORD v8[6];
  _BYTE v9[32];

  swift_unknownObjectRetain();
  v4 = self;
  sub_1B93EE69C();
  swift_unknownObjectRelease();
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v8[4] = sub_1B8F47688;
  v8[5] = v5;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 1107296256;
  v8[2] = sub_1B8EA3E34;
  v8[3] = &block_descriptor_21_0;
  v6 = _Block_copy(v8);
  v7 = v4;
  swift_release();
  -[HUNearbyAccessoriesEditorViewController dismissViewControllerAnimated:completion:](v7, sel_dismissViewControllerAnimated_completion_, 1, v6);
  _Block_release(v6);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
}

- (id)hu_preloadContent
{
  HUNearbyAccessoriesEditorViewController *v2;
  id v3;

  v2 = self;
  v3 = sub_1B8F45A1C();

  return v3;
}

- (id)layoutSectionForSection:(int64_t)a3 layoutEnvironment:(id)a4
{
  HUNearbyAccessoriesEditorViewController *v7;
  id v8;

  swift_unknownObjectRetain();
  v7 = self;
  v8 = sub_1B8F469E4(a3, (uint64_t)a4);
  swift_unknownObjectRelease();

  return v8;
}

- (id)buildItemModuleControllerForModule:(id)a3
{
  id v4;
  HUNearbyAccessoriesEditorViewController *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = sub_1B8F47410(v4);

  return v6;
}

- (id)displayedItemsInSection:(id)a3
{
  HUNearbyAccessoriesEditorViewController *v4;
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
  HUNearbyAccessoriesEditorViewController *v4;
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

- (HUNearbyAccessoriesEditorViewController)initWithItemManager:(id)a3 collectionViewLayout:(id)a4
{
  id v5;
  id v6;
  HUNearbyAccessoriesEditorViewController *result;

  v5 = a3;
  v6 = a4;
  result = (HUNearbyAccessoriesEditorViewController *)_swift_stdlib_reportUnimplementedInitializer();
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
                     + OBJC_IVAR___HUNearbyAccessoriesEditorViewController_EmptySetIdentifier));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUNearbyAccessoriesEditorViewController_accessoryElementModule));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUNearbyAccessoriesEditorViewController_instructionModule));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUNearbyAccessoriesEditorViewController_layoutManager));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUNearbyAccessoriesEditorViewController_primaryAccessory));
  swift_release();
}

@end
