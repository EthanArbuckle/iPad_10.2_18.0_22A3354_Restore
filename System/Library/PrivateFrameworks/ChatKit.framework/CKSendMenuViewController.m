@implementation CKSendMenuViewController

- (CKSendMenuViewControllerDelegate)sendMenuViewControllerDelegate
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___CKSendMenuViewController_sendMenuViewControllerDelegate;
  swift_beginAccess();
  return (CKSendMenuViewControllerDelegate *)(id)MEMORY[0x193FF501C](v2);
}

- (void)setSendMenuViewControllerDelegate:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (BOOL)isPresentingAudioRecordingQuickSend
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___CKSendMenuViewController_isPresentingAudioRecordingQuickSend;
  swift_beginAccess();
  return *v2;
}

- (void)setIsPresentingAudioRecordingQuickSend:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___CKSendMenuViewController_isPresentingAudioRecordingQuickSend;
  swift_beginAccess();
  *v4 = a3;
}

- (CKSendMenuViewController)initWithPresentationContext:(id)a3
{
  swift_unknownObjectRetain();
  return (CKSendMenuViewController *)SendMenuViewController.init(presentationContext:)((uint64_t)a3);
}

- (CKSendMenuViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_18E5DB9E8();
}

- (void)loadView
{
  CKSendMenuViewController *v2;
  id v3;

  v2 = self;
  v3 = sub_18E5D4254();
  -[CKSendMenuViewController setView:](v2, sel_setView_, v3);

}

- (void)viewDidLoad
{
  CKSendMenuViewController *v2;

  v2 = self;
  sub_18E5D4838();

}

- (void)viewWillAppear:(BOOL)a3
{
  CKSendMenuViewController *v4;

  v4 = self;
  sub_18E5D531C(a3);

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  _BYTE *v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SendMenuViewController();
  v4 = v5.receiver;
  -[CKSendMenuViewController viewDidAppear:](&v5, sel_viewDidAppear_, v3);
  if ((v4[OBJC_IVAR___CKSendMenuViewController_hasPerformedInitialContentAppearance] & 1) == 0)
  {
    v4[OBJC_IVAR___CKSendMenuViewController_hasPerformedInitialContentAppearance] = 1;
    sub_18E5D54B0(1);
  }

}

- (void)viewDidLayoutSubviews
{
  CKSendMenuViewController *v2;

  v2 = self;
  sub_18E5D5998();

}

- (void)updatePreferredContentSize
{
  CKSendMenuViewController *v2;

  v2 = self;
  sub_18E5D75C0();

}

- (void)rePresentSendMenu
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  CKSendMenuViewController *v8;
  char *v9;
  char *v10;
  uint64_t v11;

  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE0F4650);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_18E7662C0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = (char *)self + OBJC_IVAR___CKSendMenuViewController_activeDismissAnimationIdentifier;
  swift_beginAccess();
  v8 = self;
  sub_18E5DBC78((uint64_t)v5, (uint64_t)v7);
  swift_endAccess();
  v9 = (char *)sub_18E5D4254();
  v10 = &v9[OBJC_IVAR____TtC7ChatKit18SendMenuParentView_allowsHitTesting];
  swift_beginAccess();
  *v10 = 1;

  sub_18E5D54B0(0);
}

- (void)performFullScreenDismissAnimationWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t (*v7)(char);
  CKSendMenuViewController *v8;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v5;
    v7 = sub_18E52EBB0;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  v8 = self;
  sub_18E5D7E0C((uint64_t)v7, v6);
  sub_18E011A40((uint64_t)v7);

}

- (BOOL)shouldEnablePagingForScrollView:(id)a3
{
  id v4;
  CKSendMenuViewController *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_18E5DA2E4(v4);

  return self & 1;
}

- (void)pluginIconUpdatedWithNotification:(id)a3
{
  id v4;
  CKSendMenuViewController *v5;

  v4 = a3;
  v5 = self;
  sub_18E5DA434(v4);

}

- (void)loadMoreAppsSection
{
  CKSendMenuViewController *v2;

  v2 = self;
  sub_18E5DA830();

}

- (BOOL)prefersStatusBarHidden
{
  CKSendMenuViewController *v2;
  char v3;

  v2 = self;
  v3 = sub_18E5DA96C();

  return v3 & 1;
}

- (void)collectionViewBackgroundTapped:(id)a3
{
  char *v5;
  uint64_t v6;
  void *v7;
  id v8;
  CKSendMenuViewController *v9;

  v5 = (char *)self + OBJC_IVAR___CKSendMenuViewController_sendMenuViewControllerDelegate;
  swift_beginAccess();
  v6 = MEMORY[0x193FF501C](v5);
  if (v6)
  {
    v7 = (void *)v6;
    v8 = a3;
    v9 = self;
    objc_msgSend(v7, sel_sendMenuViewControllerRequestDismiss_, v9);

    swift_unknownObjectRelease();
  }
}

- (NSArray)accessibilityCustomActions
{
  CKSendMenuViewController *v2;
  id v3;
  void *v4;

  v2 = self;
  v3 = sub_18E5DAC84();

  if (v3)
  {
    sub_18E00F31C(0, &qword_1EE10BD18);
    v4 = (void *)sub_18E768AC8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return (NSArray *)v4;
}

- (void)anchorViewDidMove
{
  CKSendMenuViewController *v2;

  v2 = self;
  sub_18E5DB048();

}

- (CKSendMenuViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  CKSendMenuViewController *result;

  v4 = a4;
  result = (CKSendMenuViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR___CKSendMenuViewController_contentProvider);
  swift_unknownObjectRelease();
  sub_18E00FA98((uint64_t)self + OBJC_IVAR___CKSendMenuViewController_activeDismissAnimationIdentifier, (uint64_t *)&unk_1EE0F4650);
  sub_18E522F74((uint64_t)self + OBJC_IVAR___CKSendMenuViewController_sendMenuViewControllerDelegate);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CKSendMenuViewController____lazy_storage___sendMenuCollectionView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CKSendMenuViewController____lazy_storage___collectionViewLayout));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CKSendMenuViewController_collectionViewDismissingLayout));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CKSendMenuViewController____lazy_storage___sendMenuDataSource));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CKSendMenuViewController____lazy_storage___backdropView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CKSendMenuViewController____lazy_storage___sendMenuParentView));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CKSendMenuViewController_collectionViewTopConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CKSendMenuViewController_collectionViewBottomConstraint));
  swift_bridgeObjectRelease();
}

- (void)_handleReorderingGesture:(id)a3
{
  UILongPressGestureRecognizer *v4;
  CKSendMenuViewController *v5;

  v4 = (UILongPressGestureRecognizer *)a3;
  v5 = self;
  SendMenuViewController.handleReorderingGesture(_:)(v4);

}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  CKSendMenuViewController *v11;
  uint64_t v12;

  v6 = sub_18E76644C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18E76641C();
  v10 = a3;
  v11 = self;
  SendMenuViewController.collectionView(_:didSelectItemAt:)(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  CKSendMenuViewController *v5;

  v4 = a3;
  v5 = self;
  SendMenuViewController.updateVisibleCellsForScrollPosition()();
  sub_18E5DA0F8();

}

- (BOOL)_collectionView:(id)a3 shouldApplyTransitionContentOffset:(CGPoint)a4 contentSize:(CGSize)a5
{
  return 0;
}

- (double)calculatePercentVisibleForSection:(int64_t)a3
{
  CKSendMenuViewController *v4;
  id v5;
  double *v6;
  double v7;
  double v8;
  double v9;

  v4 = self;
  v5 = sub_18E5D40FC();
  v6 = (double *)((char *)v4 + OBJC_IVAR___CKSendMenuViewController_yPointForBoundaryBetweenSections);
  swift_beginAccess();
  v7 = *v6;
  if (*((_BYTE *)v6 + 8))
    v7 = 0.0;
  sub_18E52CFB0(a3, v7);
  v9 = v8;

  return v9;
}

- (id)collectionView:(id)a3 targetIndexPathForMoveOfItemFromOriginalIndexPath:(id)a4 atCurrentIndexPath:(id)a5 toProposedIndexPath:(id)a6
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  id v20;
  CKSendMenuViewController *v21;
  void (*v22)(char *, uint64_t);
  void *v23;
  uint64_t v25;
  CKSendMenuViewController *v26;

  v26 = self;
  v7 = sub_18E76644C();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v11);
  v13 = (char *)&v25 - v12;
  MEMORY[0x1E0C80A78](v14);
  v16 = (char *)&v25 - v15;
  MEMORY[0x1E0C80A78](v17);
  v19 = (char *)&v25 - v18;
  sub_18E76641C();
  sub_18E76641C();
  sub_18E76641C();
  v20 = a3;
  v21 = v26;
  SendMenuViewController.collectionView(_:targetIndexPathForMoveOfItemFromOriginalIndexPath:atCurrentIndexPath:toProposedIndexPath:)((uint64_t)v10, (uint64_t)v19);

  v22 = *(void (**)(char *, uint64_t))(v8 + 8);
  v22(v10, v7);
  v22(v13, v7);
  v22(v16, v7);
  v23 = (void *)sub_18E766410();
  v22(v19, v7);
  return v23;
}

@end
