@implementation TabSwitcher

- (_TtC12MobileSafari11TabSwitcher)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_18B9EE31C();
}

- (void)loadView
{
  objc_class *v3;
  char *v4;
  char *v5;
  _TtC12MobileSafari11TabSwitcher *v6;
  _TtC12MobileSafari11TabSwitcher *v7;
  objc_super v8;

  v3 = (objc_class *)type metadata accessor for TabSwitcherView();
  v4 = (char *)objc_allocWithZone(v3);
  v5 = &v4[OBJC_IVAR____TtC12MobileSafariP33_10AE7CC66F702E7BDA2FA135062253C815TabSwitcherView_lastLayoutBounds];
  *(_OWORD *)v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  v5[32] = 1;
  swift_unknownObjectUnownedInit();
  v8.receiver = v4;
  v8.super_class = v3;
  v6 = self;
  v7 = -[TabSwitcher initWithFrame:](&v8, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  -[TabSwitcher setView:](v6, sel_setView_, v7, v8.receiver, v8.super_class);

}

- (void)viewDidLoad
{
  _TtC12MobileSafari11TabSwitcher *v2;

  v2 = self;
  sub_18B9CFC98();

}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  objc_super v8;

  v4 = a4;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for TabSwitcher(0);
  v6 = a3;
  v7 = v8.receiver;
  -[TabSwitcher viewDidMoveToWindow:shouldAppearOrDisappear:](&v8, sel_viewDidMoveToWindow_shouldAppearOrDisappear_, v6, v4);
  sub_18B9D344C();

}

- (void)viewWillLayoutSubviews
{
  _TtC12MobileSafari11TabSwitcher *v2;

  v2 = self;
  sub_18B9D6AF0();

}

- (void)viewDidLayoutSubviews
{
  _TtC12MobileSafari11TabSwitcher *v2;

  v2 = self;
  sub_18B9D6C2C();

}

- (BOOL)becomeFirstResponder
{
  _TtC12MobileSafari11TabSwitcher *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = self;
  v3 = sub_18B9CF7A0();
  sub_18B8D36E8();
  v5 = v4;

  LOBYTE(v3) = objc_msgSend(v5, sel_becomeFirstResponder);
  return (char)v3;
}

- (BOOL)canBecomeFirstResponder
{
  return *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC12MobileSafari11TabSwitcher_isVisible);
}

- (_TtC12MobileSafari11TabSwitcher)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC12MobileSafari11TabSwitcher *result;

  v4 = a4;
  result = (_TtC12MobileSafari11TabSwitcher *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  sub_18B894A1C((uint64_t)self + OBJC_IVAR____TtC12MobileSafari11TabSwitcher_borrowedContentViewRegistration, (uint64_t *)&unk_1EDFF15A8);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12MobileSafari11TabSwitcher_thumbnailMatchMoveViewOwningBorrowedContent));
  sub_18B894A1C((uint64_t)self + OBJC_IVAR____TtC12MobileSafari11TabSwitcher_currentTransaction, &qword_1EDFEA318);
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC12MobileSafari11TabSwitcher_interactivelyInsertedPageID;
  v4 = sub_18BAC0088();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_18B894A1C((uint64_t)self + OBJC_IVAR____TtC12MobileSafari11TabSwitcher_pendingMoveIntent, (uint64_t *)&unk_1EDFEA360);
  sub_18B894A9C((uint64_t)self + OBJC_IVAR____TtC12MobileSafari11TabSwitcher_resolvedContent, _s7ContentVMa);
  swift_bridgeObjectRelease();
  sub_18B894A9C((uint64_t)self + OBJC_IVAR____TtC12MobileSafari11TabSwitcher_unresolvedContent, _s7ContentVMa);
  sub_18B894A1C((uint64_t)self + OBJC_IVAR____TtC12MobileSafari11TabSwitcher_itemToPresentToAfterNextLayoutPass, qword_1EDFF4420);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12MobileSafari11TabSwitcher____lazy_storage___quickTabSwitcherDisplayItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12MobileSafari11TabSwitcher____lazy_storage___tabOverviewDisplayItem));
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_18B8D1DAC(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC12MobileSafari11TabSwitcher_tabOverviewVisibilityObserver));
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_18B913BBC((uint64_t)self + OBJC_IVAR____TtC12MobileSafari11TabSwitcher_presentationObserver);
  swift_bridgeObjectRelease();
  swift_release();
}

@end
