@implementation SFFluidTabOverviewViewController

- (SFFluidTabOverviewViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = sub_1D7E8CF48();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (SFFluidTabOverviewViewController *)sub_1D7E6AD18(v5, v7, a4);
}

- (SFFluidTabOverviewViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  _sSo32SFFluidTabOverviewViewControllerC14MobileSafariUIE5coderABSgSo7NSCoderC_tcfc_0();
}

- (UIGestureRecognizer)pinchPresentationGestureRecognizer
{
  _QWORD *v2;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___SFFluidTabOverviewViewController_pinchInteraction);
  if (v2)
    return (UIGestureRecognizer *)objc_retainAutoreleaseReturnValue(*(id *)((char *)v2
                                                                          + *(_QWORD *)(qword_1F0161B78
                                                                                      + (*MEMORY[0x1E0DEEDD8] & *v2)
                                                                                      + 48)));
  __break(1u);
  return self;
}

- (SFCapsuleCollectionView)capsuleCollectionView
{
  return (SFCapsuleCollectionView *)sub_1D7E72214((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SFFluidTabOverviewViewController_capsuleCollectionView);
}

- (void)setCapsuleCollectionView:(id)a3
{
  id v5;
  SFFluidTabOverviewViewController *v6;

  swift_beginAccess();
  swift_unknownObjectWeakAssign();
  v5 = a3;
  v6 = self;
  sub_1D7E6B2FC();

}

- (TabController)tabController
{
  return (TabController *)sub_1D7E72214((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SFFluidTabOverviewViewController_tabController);
}

- (void)setTabController:(id)a3
{
  id v5;
  SFFluidTabOverviewViewController *v6;

  v5 = a3;
  v6 = self;
  SFFluidTabOverviewViewController.tabController.setter(a3);

}

- (void)viewDidLoad
{
  SFFluidTabOverviewViewController *v2;

  v2 = self;
  SFFluidTabOverviewViewController.viewDidLoad()();

}

- (void)viewWillLayoutSubviews
{
  SFFluidTabOverviewViewController *v2;

  v2 = self;
  SFFluidTabOverviewViewController.viewWillLayoutSubviews()();

}

- (void)viewDidLayoutSubviews
{
  SFFluidTabOverviewViewController *v2;

  v2 = self;
  SFFluidTabOverviewViewController.viewDidLayoutSubviews()();

}

- (void)viewSafeAreaInsetsDidChange
{
  SFFluidTabOverviewViewController *v2;

  v2 = self;
  SFFluidTabOverviewViewController.viewSafeAreaInsetsDidChange()();

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  SFFluidTabOverviewViewController *v6;

  swift_unknownObjectRetain();
  v6 = self;
  SFFluidTabOverviewViewController.viewWillTransition(to:with:)(a4);
  swift_unknownObjectRelease();

}

- (int64_t)presentationState
{
  return *(int64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR___SFFluidTabOverviewViewController__presentationState);
}

- (void)presentAnimated:(BOOL)a3
{
  SFFluidTabOverviewViewController *v4;

  v4 = self;
  sub_1D7E6FE40(a3);

}

- (void)dismissAnimated:(BOOL)a3
{
  SFFluidTabOverviewViewController *v4;

  v4 = self;
  sub_1D7E70B28(a3);

}

- (void)addPresentationObserver:(id)a3
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR___SFFluidTabOverviewViewController_presentationObservers), sel_addObject_, a3);
}

- (void)removePresentationObserver:(id)a3
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR___SFFluidTabOverviewViewController_presentationObservers), sel_removeObject_, a3);
}

- (void)tabPinchInteractionDidBegin:(id)a3
{
  sub_1D7E71FC4(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_1D7E71750);
}

- (void)tabPinchInteractionDidUpdate:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  SFFluidTabOverviewViewController *v9;
  uint64_t v10;

  v4 = sub_1D7E8C7B0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4, v6);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D7E8C798();
  v9 = self;
  sub_1D7E6DB00();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

- (void)tabPinchInteractionDidEnd:(id)a3
{
  sub_1D7E71FC4(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_1D7E7195C);
}

- (void)capsuleInteractionDidBegin:(id)a3
{
  sub_1D7E71FC4(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_1D7E71C44);
}

- (void)capsuleInteractionDidEnd:(id)a3
{
  sub_1D7E71FC4(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_1D7E71E7C);
}

- (double)alternateBottomSafeAreaInset
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___SFFluidTabOverviewViewController_alternateBottomSafeAreaInset);
  swift_beginAccess();
  return *v2;
}

- (void)setAlternateBottomSafeAreaInset:(double)a3
{
  double *v5;
  double v6;
  SFFluidTabOverviewViewController *v7;
  id v8;

  v5 = (double *)((char *)self + OBJC_IVAR___SFFluidTabOverviewViewController_alternateBottomSafeAreaInset);
  swift_beginAccess();
  v6 = *v5;
  *v5 = a3;
  if (v6 != a3)
  {
    v7 = self;
    v8 = -[SFFluidTabOverviewViewController viewIfLoaded](v7, sel_viewIfLoaded);
    objc_msgSend(v8, sel_setNeedsLayout);

  }
}

- (TabThumbnailCollectionViewDelegate)delegate
{
  return (TabThumbnailCollectionViewDelegate *)sub_1D7E72214((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SFFluidTabOverviewViewController_delegate);
}

- (void)setDelegate:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (BOOL)defersActivation
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___SFFluidTabOverviewViewController_defersActivation;
  swift_beginAccess();
  return *v2;
}

- (void)setDefersActivation:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___SFFluidTabOverviewViewController_defersActivation;
  swift_beginAccess();
  *v4 = a3;
}

- (TabCollectionItem)itemToActivate
{
  swift_beginAccess();
  return (TabCollectionItem *)(id)swift_unknownObjectRetain();
}

- (void)setItemToActivate:(id)a3
{
  id *v4;

  v4 = (id *)((char *)&self->super.super.super.isa + OBJC_IVAR___SFFluidTabOverviewViewController_itemToActivate);
  swift_beginAccess();
  *v4 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (int64_t)itemDragContentType
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR___SFFluidTabOverviewViewController_itemDragContentType);
  swift_beginAccess();
  return *v2;
}

- (void)setItemDragContentType:(int64_t)a3
{
  int64_t *v4;

  v4 = (int64_t *)((char *)self + OBJC_IVAR___SFFluidTabOverviewViewController_itemDragContentType);
  swift_beginAccess();
  *v4 = a3;
}

- (NSArray)items
{
  SFFluidTabOverviewViewController *v2;
  void *v3;

  v2 = self;
  SFFluidTabOverviewViewController.items.getter();

  __swift_instantiateConcreteTypeFromMangledName(&qword_1F0160A00);
  v3 = (void *)sub_1D7E8CF84();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (SFTabCollectionSearchController)searchController
{
  return (SFTabCollectionSearchController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                    + OBJC_IVAR___SFFluidTabOverviewViewController__searchController));
}

- (TabOverviewToolbar)toolbar
{
  SFFluidTabOverviewViewController *v2;
  id v3;

  v2 = self;
  -[SFFluidTabOverviewViewController loadViewIfNeeded](v2, sel_loadViewIfNeeded);
  v3 = sub_1D7E6D2A4();

  return (TabOverviewToolbar *)v3;
}

- (void)enumerateItemsOrderedByVisibility:(id)a3
{
  void *v4;
  SFFluidTabOverviewViewController *v5;
  _QWORD v6[4];

  v4 = _Block_copy(a3);
  v6[2] = v4;
  v5 = self;
  sub_1D7E729D4(sub_1D7E7C6A0, (uint64_t)v6);
  _Block_release(v4);

}

- (void)test_scrollToTopWithoutAnimation
{
  SFFluidTabOverviewViewController *v2;

  v2 = self;
  sub_1D7E72FF0();

}

- (double)desiredSnapshotScale
{
  return 0.5;
}

- (unint64_t)snapshotBorderOptions
{
  if (tabSnapshotHasTransparentBorderPadding())
    return 15;
  else
    return 0;
}

- (int64_t)estimatedSnapshotsPerPageForBounds:(CGRect)a3 withTraitCollection:(id)a4
{
  return 8;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  sub_1D7E7CABC((uint64_t)self + OBJC_IVAR___SFFluidTabOverviewViewController___activeItem, &qword_1F0160278);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___SFFluidTabOverviewViewController_capsuleInteraction));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___SFFluidTabOverviewViewController_dragDropHandler));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___SFFluidTabOverviewViewController_explanationView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___SFFluidTabOverviewViewController__fluidCollectionView));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___SFFluidTabOverviewViewController_headerForSizing));
  swift_release();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___SFFluidTabOverviewViewController_pinchInteraction));
  sub_1D7E7CABC((uint64_t)self + OBJC_IVAR___SFFluidTabOverviewViewController___swipeDeleteItem, &qword_1F0160278);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___SFFluidTabOverviewViewController_presentationObservers));
  sub_1D7E7CA20((uint64_t)self + OBJC_IVAR___SFFluidTabOverviewViewController_delegate);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___SFFluidTabOverviewViewController__searchController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___SFFluidTabOverviewViewController____lazy_storage____toolbar));
}

- (void)tabControllerDocumentCountDidChange:(id)a3
{
  id v4;
  SFFluidTabOverviewViewController *v5;

  v4 = a3;
  v5 = self;
  _sSo32SFFluidTabOverviewViewControllerC14MobileSafariUIE03tabE22DocumentCountDidChangeyySo0bE0CF_0();

}

- (void)tabController:(id)a3 didSwitchFromTabDocument:(id)a4 toTabDocument:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  id v13;
  id v14;
  id v15;
  SFFluidTabOverviewViewController *v16;
  uint64_t v17;
  uint64_t v18;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F0160200);
  MEMORY[0x1E0C80A78](v9, v10);
  v12 = (uint64_t *)((char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = self;
  *v12 = objc_msgSend(v15, sel_itemForTabCollectionView_, v16);
  v17 = type metadata accessor for SFFluidTabOverviewItem();
  swift_storeEnumTagMultiPayload();
  (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v12, 0, 1, v17);
  sub_1D7E6C0E0((uint64_t)v12, &OBJC_IVAR___SFFluidTabOverviewViewController___activeItem);
  sub_1D7E6E864();

}

- (void)tabController:(id)a3 didSwitchFromTabGroup:(id)a4
{
  id v6;
  id v7;
  SFFluidTabOverviewViewController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  SFFluidTabOverviewViewController.tabController(_:didSwitchFrom:)(v6, (uint64_t)v7);

}

- (void)tabControllerWillBeginUpdates:(id)a3
{
  *((_BYTE *)&self->super.super.super.isa
  + OBJC_IVAR___SFFluidTabOverviewViewController_tabControllerIsPerformingBatchUpdates) = 1;
}

- (void)tabControllerDidEndUpdates:(id)a3
{
  id v4;
  SFFluidTabOverviewViewController *v5;

  *((_BYTE *)&self->super.super.super.isa
  + OBJC_IVAR___SFFluidTabOverviewViewController_tabControllerIsPerformingBatchUpdates) = 0;
  v4 = a3;
  v5 = self;
  _sSo32SFFluidTabOverviewViewControllerC14MobileSafariUIE03tabE22DocumentCountDidChangeyySo0bE0CF_0();
  *(Class *)((char *)&v5->super.super.super.isa + OBJC_IVAR___SFFluidTabOverviewViewController_edgeForPreviousTabGroup) = 0;

}

- (void)tabSnapshotCache:(id)a3 didCacheSnapshotWithIdentifier:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  SFFluidTabOverviewViewController *v12;
  id v13;
  void *v14;
  void *v15;
  SFFluidTabOverviewViewController *v16;
  uint64_t v17;
  uint64_t v18;

  v6 = sub_1D7E8C7EC();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6, v8);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D7E8C7D4();
  v11 = a3;
  v12 = self;
  v13 = sub_1D7E75894();
  if (v13)
  {
    v14 = v13;
    v15 = (void *)sub_1D7E8C7BC();
    v16 = (SFFluidTabOverviewViewController *)objc_msgSend(v11, sel_snapshotWithIdentifier_, v15);

    v17 = sub_1D7E8CC30();
    objc_opt_self();
    objc_msgSend((id)swift_dynamicCastObjCClassUnconditional(), sel_setSnapshotImage_, v16);

    v11 = (id)v17;
    v12 = v16;
  }

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
}

- (void)tabSnapshotCache:(id)a3 didEvictSnapshotWithIdentifier:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  SFFluidTabOverviewViewController *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;

  v6 = sub_1D7E8C7EC();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6, v8);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D7E8C7D4();
  v11 = a3;
  v12 = self;
  v13 = sub_1D7E75894();
  if (v13)
  {
    v14 = v13;
    v15 = sub_1D7E8CC30();
    objc_opt_self();
    objc_msgSend((id)swift_dynamicCastObjCClassUnconditional(), sel_setSnapshotImage_, 0);

    v11 = v14;
    v12 = (SFFluidTabOverviewViewController *)v15;
  }

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  SFFluidTabOverviewViewController *v5;

  v4 = a3;
  v5 = self;
  _sSo32SFFluidTabOverviewViewControllerC14MobileSafariUIE06scrollD9DidScrollyySo08UIScrollD0CF_0();

}

- (void)searchControllerWillBeginSearch:(id)a3
{
  id v4;
  SFFluidTabOverviewViewController *v5;

  v4 = a3;
  v5 = self;
  _sSo32SFFluidTabOverviewViewControllerC14MobileSafariUIE06searchE15WillBeginSearchyySo015SFTabCollectionlE0CF_0();

}

- (void)searchControllerDidUpdateHasEmptyResults:(id)a3
{
  id v4;
  SFFluidTabOverviewViewController *v5;

  v4 = a3;
  v5 = self;
  _sSo32SFFluidTabOverviewViewControllerC14MobileSafariUIE06searchE24DidUpdateHasEmptyResultsyySo021SFTabCollectionSearchE0CF_0();

}

@end
