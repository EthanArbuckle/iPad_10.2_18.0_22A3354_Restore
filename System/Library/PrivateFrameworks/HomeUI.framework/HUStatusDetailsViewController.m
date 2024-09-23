@implementation HUStatusDetailsViewController

- (HUStatusDetailsViewControllerDelegate)statusDetailsDelegate
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___HUStatusDetailsViewController_statusDetailsDelegate;
  swift_beginAccess();
  return (HUStatusDetailsViewControllerDelegate *)(id)MEMORY[0x1BCCC1DA8](v2);
}

- (void)setStatusDetailsDelegate:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (HUStatusDetailsViewController)initWithStatusItem:(id)a3 delegate:(id)a4
{
  id v4;

  v4 = a3;
  swift_unknownObjectRetain();
  return (HUStatusDetailsViewController *)StatusDetailsViewController.init(statusItem:delegate:)(v4);
}

- (void)viewDidLoad
{
  HUStatusDetailsViewController *v2;

  v2 = self;
  sub_1B9019910();

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for StatusDetailsViewController();
  v4 = v5.receiver;
  -[HUControllableItemCollectionViewController viewDidAppear:](&v5, sel_viewDidAppear_, v3);
  objc_msgSend((id)objc_opt_self(), sel_sendEvent_, 34, v5.receiver, v5.super_class);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  id v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for StatusDetailsViewController();
  v4 = v6.receiver;
  -[HUControllableItemCollectionViewController viewDidDisappear:](&v6, sel_viewDidDisappear_, v3);
  v5 = objc_msgSend(v4, sel_itemManager, v6.receiver, v6.super_class);
  objc_opt_self();
  objc_msgSend((id)swift_dynamicCastObjCClassUnconditional(), sel_resetItemPrioritiesToDefaults);

}

- (void)doneButtonPressed:(id)a3
{
  id v4;
  HUStatusDetailsViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1B901BC00();

}

- (BOOL)presentationCoordinator:(id)a3 shouldBeginInteractivePresentationWithTouchLocation:(CGPoint)a4 view:(id)a5
{
  double y;
  double x;
  id v9;
  id v10;
  HUStatusDetailsViewController *v11;
  char v12;

  y = a4.y;
  x = a4.x;
  v9 = a3;
  v10 = a5;
  v11 = self;
  v12 = sub_1B9019CAC((uint64_t)v9, (uint64_t)v10, x, y);

  return v12 & 1;
}

- (BOOL)hasDetailsActionForPresentationCoordinator:(id)a3 item:(id)a4
{
  return swift_dynamicCastObjCProtocolConditional() != 0;
}

- (id)detailsViewControllerForPresentationCoordinator:(id)a3 item:(id)a4
{
  id v6;
  id v7;
  HUStatusDetailsViewController *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = (void *)sub_1B901BDF0();

  return v9;
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  HUStatusDetailsViewController *v11;
  HFItemManager *v12;
  unsigned int v13;
  uint64_t v15;

  v6 = sub_1B93EB900();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B93EB8C4();
  v10 = a3;
  v11 = self;
  v12 = -[HUItemCollectionViewController itemManager](v11, sel_itemManager);
  objc_opt_self();
  v13 = objc_msgSend((id)swift_dynamicCastObjCClassUnconditional(), sel_shouldUseTitleDescriptionStyleForItem_, v10);

  if (v13)
    sub_1B8E23A60(0, &qword_1EF210F50);
  else
    type metadata accessor for AccessoryTileCell();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)configureCell:(id)a3 forItem:(id)a4
{
  id v6;
  id v7;
  HUStatusDetailsViewController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1B901A17C(v6, v7);

}

- (id)layoutSectionForSection:(int64_t)a3 layoutEnvironment:(id)a4
{
  HUStatusDetailsViewController *v7;
  id v8;

  swift_unknownObjectRetain();
  v7 = self;
  v8 = sub_1B901A874(a3, a4);
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
  HUStatusDetailsViewController *v19;
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
  v15[4] = &unk_1EF211060;
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

- (id)prepareToPerformToggleActionForItem:(id)a3 sourceItem:(id)a4
{
  id v6;
  id v7;
  HUStatusDetailsViewController *v8;
  HFItemManager *v9;
  id v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = -[HUItemCollectionViewController itemManager](v8, sel_itemManager);
  objc_opt_self();
  objc_msgSend((id)swift_dynamicCastObjCClassUnconditional(), sel_maintainMinimumPriorityForItem_, v7);

  v12.receiver = v8;
  v12.super_class = (Class)type metadata accessor for StatusDetailsViewController();
  v10 = -[HUControllableItemCollectionViewController prepareToPerformToggleActionForItem:sourceItem:](&v12, sel_prepareToPerformToggleActionForItem_sourceItem_, v6, v7);

  return v10;
}

- (void)presentationCoordinator:(id)a3 willBeginPresentationWithContext:(id)a4
{
  id v6;
  id v7;
  HUStatusDetailsViewController *v8;
  HFItemManager *v9;
  void *v10;
  id v11;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = -[HUItemCollectionViewController itemManager](v8, sel_itemManager);
  objc_opt_self();
  v10 = (void *)swift_dynamicCastObjCClassUnconditional();
  v11 = objc_msgSend(v7, sel_item);
  objc_msgSend(v10, sel_maintainMinimumPriorityForItem_, v11);

  v12.receiver = v8;
  v12.super_class = (Class)type metadata accessor for StatusDetailsViewController();
  -[HUControllableItemCollectionViewController presentationCoordinator:willBeginPresentationWithContext:](&v12, sel_presentationCoordinator_willBeginPresentationWithContext_, v6, v7);

}

- (HUStatusDetailsViewController)initWithItemManager:(id)a3 collectionViewLayout:(id)a4
{
  id v5;
  id v6;
  HUStatusDetailsViewController *result;

  v5 = a3;
  v6 = a4;
  result = (HUStatusDetailsViewController *)_swift_stdlib_reportUnimplementedInitializer();
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
  sub_1B8E7A1E8((uint64_t)self + OBJC_IVAR___HUStatusDetailsViewController_statusDetailsDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUStatusDetailsViewController____lazy_storage___collectionLayoutManager));
}

- (id)displayedItemsInSection:(id)a3
{
  HUStatusDetailsViewController *v4;
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
  return 1;
}

- (id)transform:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, sel_setSectionTopMargin_, 0.0);
  return v3;
}

- (void)aboutResidentDeviceViewControllerDidFinish:(id)a3
{
  -[HUStatusDetailsViewController dismissViewControllerAnimated:completion:](self, sel_dismissViewControllerAnimated_completion_, 1, 0);
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  HUStatusDetailsViewController *v14;
  uint64_t v16;

  v9 = sub_1B93EB798();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B93EB780();
  v13 = a3;
  v14 = self;
  LOBYTE(a6) = sub_1B901C074((uint64_t)v12, a6);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  return a6 & 1;
}

@end
