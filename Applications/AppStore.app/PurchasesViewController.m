@implementation PurchasesViewController

- (void)viewDidLoad
{
  _TtC8AppStore23PurchasesViewController *v2;

  v2 = self;
  sub_10039E0E0();

}

- (void)viewWillAppear:(BOOL)a3
{
  sub_10039F3D4(self, (uint64_t)a2, a3, (const char **)&selRef_viewWillAppear_, 0);
}

- (void)as_viewWillBecomeFullyVisible
{
  sub_10039F458(self, (uint64_t)a2, (const char **)&selRef_as_viewWillBecomeFullyVisible, 0);
}

- (void)viewDidDisappear:(BOOL)a3
{
  sub_10039F3D4(self, (uint64_t)a2, a3, (const char **)&selRef_viewDidDisappear_, 1);
}

- (void)as_viewDidBecomePartiallyVisible
{
  sub_10039F458(self, (uint64_t)a2, (const char **)&selRef_as_viewDidBecomePartiallyVisible, 1);
}

- (void)viewDidLayoutSubviews
{
  _TtC8AppStore23PurchasesViewController *v2;

  v2 = self;
  sub_10039F4C4();

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  _TtC8AppStore23PurchasesViewController *v8;

  height = a3.height;
  width = a3.width;
  swift_unknownObjectRetain(a4);
  v8 = self;
  sub_10039F7F4((uint64_t)a4, width, height);
  swift_unknownObjectRelease(a4);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC8AppStore23PurchasesViewController *v6;

  v5 = a3;
  v6 = self;
  sub_10039FC30((uint64_t)a3);

}

- (unint64_t)supportedInterfaceOrientations
{
  _TtC8AppStore23PurchasesViewController *v2;
  id v3;
  id v4;

  v2 = self;
  v3 = -[PurchasesViewController traitCollection](v2, "traitCollection");
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 == (id)1)
    return 30;
  else
    return 2;
}

- (void)unhideAll
{
  _TtC8AppStore23PurchasesViewController *v2;

  v2 = self;
  PurchasesContentPresenter.unhideAll()();

}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _TtC8AppStore23PurchasesViewController *v10;

  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v8 = v7;
  v9 = a3;
  v10 = self;
  swift_bridgeObjectRetain(v8);
  PurchasesContentPresenter.term.setter(v6, v8);

  swift_bridgeObjectRelease(v8);
}

- (void)searchBarSearchButtonClicked:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _TtC8AppStore23PurchasesViewController *v10;

  v4 = a3;
  v10 = self;
  objc_msgSend(v4, "resignFirstResponder");
  v5 = objc_msgSend(v4, "text");
  if (v5)
  {
    v6 = v5;
    v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(v5);
    v9 = v8;

  }
  else
  {
    v7 = 0;
    v9 = 0;
  }
  PurchasesContentPresenter.term.setter(v7, v9);

}

- (CGRect)_searchBar:(id)a3 proposedSearchFieldFrame:(CGRect)a4
{
  CGFloat height;
  CGFloat y;
  _TtC8AppStore23PurchasesViewController *v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGRect result;

  height = a4.size.height;
  y = a4.origin.y;
  v7 = self;
  v8 = a3;
  -[PurchasesViewController pageMarginInsets](v7, "pageMarginInsets");
  v10 = v9;
  v12 = v11;
  v13 = -[PurchasesViewController view](v7, "view");
  if (v13)
  {
    v18 = v13;
    objc_msgSend(v13, "bounds");
    v20 = v19;

    v21 = v20 - v10 - v12;
    -[PurchasesViewController pageMarginInsets](v7, "pageMarginInsets");
    v23 = v22;

    v14 = v23;
    v15 = y;
    v16 = v21;
    v17 = height;
  }
  else
  {
    __break(1u);
  }
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore23PurchasesViewController_shelfDataSource));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore23PurchasesViewController_presenter));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore23PurchasesViewController_artworkLoader));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore23PurchasesViewController_purchasesCollectionViewDataSource));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore23PurchasesViewController_purchasesCollectionViewDelegate));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore23PurchasesViewController_collectionViewTableLayout));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore23PurchasesViewController_navigationBarPalettePresenter));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore23PurchasesViewController_segmentedControlView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore23PurchasesViewController_searchBar));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore23PurchasesViewController_hideAllButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore23PurchasesViewController_doneButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore23PurchasesViewController_emptyStateView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore23PurchasesViewController_flowPreviewing));
}

@end
