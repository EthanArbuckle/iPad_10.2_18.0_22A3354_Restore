@implementation SFTabSwitcher

- (SFTabSwitcher)initWithTabIconPool:(id)a3 tabSnapshotPool:(id)a4
{
  id v5;
  id v6;
  SFTabSwitcher *v7;

  v5 = a3;
  v6 = a4;
  v7 = (SFTabSwitcher *)sub_18B998514((uint64_t)v5, (uint64_t)v6);

  return v7;
}

- (SFTabSwitcher)initWithCoder:(id)a3
{
  SFTabSwitcher *result;

  result = (SFTabSwitcher *)sub_18BAC18C4();
  __break(1u);
  return result;
}

- (void)loadView
{
  SFTabSwitcher *v2;

  v2 = self;
  SFTabSwitcher.loadView()();

}

- (void)animateSwitchingToItem:(id)a3
{
  sub_18B994D28(self, (uint64_t)a2, (char *)a3, (void (*)(char *))sub_18B9DF034);
}

- (void)applyConfiguration:(id)a3
{
  id v4;
  SFTabSwitcher *v5;

  v4 = a3;
  v5 = self;
  sub_18B991820(v4);

}

- (void)applyContent:(id)a3
{
  -[SFTabSwitcher applyContent:animated:](self, sel_applyContent_animated_, a3, 0);
}

- (void)applyContent:(id)a3 animated:(BOOL)a4
{
  id v6;
  SFTabSwitcher *v7;

  v6 = a3;
  v7 = self;
  sub_18B994438((uint64_t)v6, a4);

}

- (BOOL)becomeFirstResponder
{
  return objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR___SFTabSwitcher_wrapped), sel_becomeFirstResponder);
}

- (void)beginAnimatedSizeTransition
{
  SFTabSwitcher *v2;

  v2 = self;
  sub_18B9945F4();

}

- (void)beginSearching
{
  SFTabSwitcher *v2;

  v2 = self;
  sub_18B9946FC();

}

- (void)beginSearchingWithQuery:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  SFTabSwitcher *v7;
  id v8;

  v4 = sub_18BAC0DFC();
  v6 = v5;
  v7 = self;
  v8 = sub_18B9CF7A0();
  sub_18B8DD5BC(v4, v6);

  swift_bridgeObjectRelease();
}

- (void)beginRetitlingVisiblePage
{
  SFTabSwitcher *v2;

  v2 = self;
  sub_18B9948B4();

}

- (UIEdgeInsets)browserContentInsets
{
  double *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  v2 = (double *)(*(char **)((char *)&self->super.super.super.isa + OBJC_IVAR___SFTabSwitcher_wrapped)
                + OBJC_IVAR____TtC12MobileSafari11TabSwitcher_browserContentInsets);
  v3 = *v2;
  v4 = v2[1];
  v5 = v2[2];
  v6 = v2[3];
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (void)setBrowserContentInsets:(UIEdgeInsets)a3
{
  SFTabSwitcher *v3;

  *(UIEdgeInsets *)(*(char **)((char *)&self->super.super.super.isa + OBJC_IVAR___SFTabSwitcher_wrapped)
                  + OBJC_IVAR____TtC12MobileSafari11TabSwitcher_browserContentInsets) = a3;
  v3 = self;
  sub_18B9CF830();

}

- (BOOL)canBecomeFirstResponder
{
  return objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR___SFTabSwitcher_wrapped), sel_canBecomeFirstResponder);
}

- (void)cancelRetitlingVisiblePage
{
  SFTabSwitcher *v2;
  id v3;

  v2 = self;
  v3 = sub_18B9CF7A0();
  sub_18B8E7090();

}

- (CGRect)capsuleReferenceFrame
{
  double *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v2 = (double *)(*(char **)((char *)&self->super.super.super.isa + OBJC_IVAR___SFTabSwitcher_wrapped)
                + OBJC_IVAR____TtC12MobileSafari11TabSwitcher_capsuleReferenceFrame);
  v3 = *v2;
  v4 = v2[1];
  v5 = v2[2];
  v6 = v2[3];
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)setCapsuleReferenceFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  SFTabSwitcher *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  sub_18B994B6C(x, y, width, height);

}

- (void)clearHighlightedCapsule
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  SFTabSwitcher *v11;

  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDFEA3A0);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = self;
  v6 = (char *)sub_18B9CF7A0();
  v7 = *(void **)&v6[OBJC_IVAR____TtC12MobileSafari22TabOverviewDisplayItem_capsuleView];
  v8 = v7;

  if (v7)
  {
    v9 = _s14descr1E21F17F1O4ItemVMa();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v5, 1, 1, v9);
    sub_18B945880((uint64_t)v5);

  }
  else
  {

  }
}

- (void)detachBorrowedCapsuleForItem:(id)a3
{
  sub_18B994D28(self, (uint64_t)a2, (char *)a3, (void (*)(char *))sub_18B9D2568);
}

- (void)didReceivePanGesture:(id)a3
{
  id v4;
  SFTabSwitcher *v5;
  char *v6;
  id v7;

  v4 = a3;
  v5 = self;
  v6 = (char *)sub_18B9CF784();
  v7 = *(id *)&v6[OBJC_IVAR____TtC12MobileSafari27QuickTabSwitcherDisplayItem_quickTabSwitcher];

  sub_18BAA2F78(v4);
}

- (void)dismissToItem:(id)a3
{
  sub_18B994D28(self, (uint64_t)a2, (char *)a3, sub_18B9DF6B0);
}

- (void)endAnimatedSizeTransition
{
  SFTabSwitcher *v2;

  v2 = self;
  sub_18B994EAC();

}

- (BOOL)isSelectingInteractivelyInsertedItem
{
  SFTabSwitcher *v2;
  char *v3;
  _BYTE *v4;

  v2 = self;
  v3 = (char *)sub_18B9CF784();
  v4 = *(id *)&v3[OBJC_IVAR____TtC12MobileSafari27QuickTabSwitcherDisplayItem_quickTabSwitcher];

  LOBYTE(v3) = v4[qword_1EE0086B8];
  return (char)v3;
}

- (BOOL)isVisible
{
  return (*(_BYTE **)((char *)&self->super.super.super.isa + OBJC_IVAR___SFTabSwitcher_wrapped))[OBJC_IVAR____TtC12MobileSafari11TabSwitcher_isVisible];
}

- (double)linkedPanGesturePageWidth
{
  SFTabSwitcher *v2;
  char *v3;
  char *v4;
  double v5;
  double result;

  v2 = self;
  v3 = (char *)sub_18B9CF784();
  v4 = (char *)*(id *)&v3[OBJC_IVAR____TtC12MobileSafari27QuickTabSwitcherDisplayItem_quickTabSwitcher];

  v5 = *(double *)&v4[qword_1EE0086E0 + 112];
  LODWORD(v3) = v4[qword_1EE0086E0 + 120];

  result = 0.0;
  if (!(_DWORD)v3)
    return v5;
  return result;
}

- (void)setLinkedPanGesturePageWidth:(double)a3
{
  SFTabSwitcher *v4;

  v4 = self;
  sub_18B995118(a3);

}

- (UIPanGestureRecognizer)panGestureRecognizer
{
  return (UIPanGestureRecognizer *)sub_18B99524C(self, (uint64_t)a2, (uint64_t (*)(void))sub_18BA9EB40);
}

- (UIPanGestureRecognizer)panGestureRecognizerForTrackingPinchTranslationVelocity
{
  return (UIPanGestureRecognizer *)sub_18B99524C(self, (uint64_t)a2, (uint64_t (*)(void))sub_18BA9EB5C);
}

- (void)performTransaction:(id)a3 withUpdates:(id)a4
{
  void *v6;
  id v7;
  SFTabSwitcher *v8;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = a3;
  v8 = self;
  sub_18B9985E4(v7, (uint64_t)v8, v6);
  _Block_release(v6);
  _Block_release(v6);

}

- (UIPinchGestureRecognizer)pinchGestureRecognizer
{
  return (UIPinchGestureRecognizer *)sub_18B99524C(self, (uint64_t)a2, (uint64_t (*)(void))sub_18BA9EBD4);
}

- (void)present
{
  SFTabSwitcher *v2;

  v2 = self;
  sub_18B9952C0();

}

- (SFTabSwitcherPresentationObserving)presentationObserver
{
  return (SFTabSwitcherPresentationObserving *)(id)MEMORY[0x18D77FD08](*(char **)((char *)&self->super.super.super.isa+ OBJC_IVAR___SFTabSwitcher_wrapped)+ OBJC_IVAR____TtC12MobileSafari11TabSwitcher_presentationObserver, a2);
}

- (void)setPresentationObserver:(id)a3
{
  swift_unknownObjectWeakAssign();
}

- (int64_t)presentationState
{
  return *(_QWORD *)(*(char **)((char *)&self->super.super.super.isa + OBJC_IVAR___SFTabSwitcher_wrapped)
                   + OBJC_IVAR____TtC12MobileSafari11TabSwitcher_presentationState);
}

- (double)quickTabSwitcherPageWidth
{
  SFTabSwitcher *v2;
  char *v3;
  char *v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  double v9;
  double Width;
  CGRect v12;

  v2 = self;
  v3 = (char *)sub_18B9CF784();
  v4 = (char *)*(id *)&v3[OBJC_IVAR____TtC12MobileSafari27QuickTabSwitcherDisplayItem_quickTabSwitcher];

  v5 = *(double *)&v4[qword_1EE0086E0 + 48];
  v6 = *(double *)&v4[qword_1EE0086E0 + 56];
  v7 = *(double *)&v4[qword_1EE0086E0 + 64];
  v8 = *(double *)&v4[qword_1EE0086E0 + 72];
  v9 = *(double *)&v4[qword_1EE0086E0 + 136];

  v12.origin.x = v5;
  v12.origin.y = v6;
  v12.size.width = v7;
  v12.size.height = v8;
  Width = CGRectGetWidth(v12);

  return v9 + Width;
}

- (CGRect)quickTabSwitcherFrameForItemWithIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  SFTabSwitcher *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  CGRect result;

  v4 = sub_18BAC0088();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18BAC0070();
  v8 = self;
  v9 = sub_18B99556C((uint64_t)v7);
  v11 = v10;
  v13 = v12;
  v15 = v14;

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v16 = v9;
  v17 = v11;
  v18 = v13;
  v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (void)scrollToNextPage
{
  sub_18B995BE4(self, (uint64_t)a2, sub_18B95B954);
}

- (void)scrollToPage:(id)a3
{
  id v4;
  SFTabSwitcher *v5;

  v4 = a3;
  v5 = self;
  sub_18B9959A0((uint64_t)v4);

}

- (void)scrollToPreviousPage
{
  sub_18B995BE4(self, (uint64_t)a2, sub_18B95BF94);
}

- (void)scrollVisiblePageToTopWithoutAnimation
{
  SFTabSwitcher *v2;

  v2 = self;
  sub_18B995C48();

}

- (void)setBorrowedContentSize:(CGSize)a3 obscuredInsets:(UIEdgeInsets)a4
{
  CGSize *v4;
  CGSize v5;
  SFTabSwitcher *v6;
  _OWORD v7[3];

  v4 = (CGSize *)(*(char **)((char *)&self->super.super.super.isa + OBJC_IVAR___SFTabSwitcher_wrapped)
                + OBJC_IVAR____TtC12MobileSafari11TabSwitcher_borrowedContentMetrics);
  v5 = v4[1];
  v7[0] = *v4;
  v7[1] = v5;
  v7[2] = v4[2];
  *(UIEdgeInsets *)&v4->width = a4;
  v4[2] = a3;
  v6 = self;
  sub_18B9D2DB8((double *)v7);

}

- (BOOL)showsSidebarToggle
{
  SFTabSwitcher *v2;
  _BYTE *v3;
  char v4;

  v2 = self;
  v3 = sub_18B9CF7A0();
  v4 = v3[OBJC_IVAR____TtC12MobileSafari22TabOverviewDisplayItem_showsSidebarToggle];

  return v4;
}

- (void)setShowsSidebarToggle:(BOOL)a3
{
  SFTabSwitcher *v4;

  v4 = self;
  sub_18B995E98(a3);

}

- (UIBarButtonItem)sidebarToggleBarButtonItem
{
  SFTabSwitcher *v2;
  id v3;
  void *v4;

  v2 = self;
  v3 = sub_18B9CF7A0();
  sub_18B8D3104();
  v4 = (void *)sub_18B9B3CB0(0xAu);

  swift_release();
  return (UIBarButtonItem *)v4;
}

- (NSArray)sortedSelectedItems
{
  return (NSArray *)sub_18B98D194(self, (uint64_t)a2, (void (*)(void))sub_18B995FBC, (void (*)(void))type metadata accessor for SFTabSwitcherItem);
}

- (BOOL)tabOverviewIsVisible
{
  SFTabSwitcher *v2;
  _BYTE *v3;
  char v4;
  double v5;

  v2 = self;
  v3 = sub_18B9CF7A0();
  v4 = v3[OBJC_IVAR____TtC12MobileSafari22TabOverviewDisplayItem_state + 8];
  v5 = *(double *)&v3[OBJC_IVAR____TtC12MobileSafari22TabOverviewDisplayItem_state + 16];

  return (v5 > 0.01) | v4 & 1;
}

- (SFTabSwitcherPage)visiblePage
{
  SFTabSwitcher *v2;
  id v3;

  v2 = self;
  v3 = sub_18B9965E4();

  return (SFTabSwitcherPage *)v3;
}

- (int64_t)visibleSnapshotLimitForBounds:(CGRect)a3 traitCollection:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  SFTabSwitcher *v10;
  id v11;
  int64_t v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v10 = self;
  v11 = sub_18B9CF7A0();
  v12 = sub_18B8E272C(v9, x, y, width, height);

  return v12;
}

- (SFTabSwitcher)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  SFTabSwitcher *result;

  v4 = a4;
  result = (SFTabSwitcher *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
