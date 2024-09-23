@implementation SearchViewController

- (_TtC8AppStore20SearchViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10036466C();
}

- (void)viewDidLoad
{
  _TtC8AppStore20SearchViewController *v2;

  v2 = self;
  sub_10035EFC0();

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC8AppStore20SearchViewController *v4;

  v4 = self;
  sub_10035F4A4(a3);

}

- (unint64_t)supportedInterfaceOrientations
{
  _TtC8AppStore20SearchViewController *v2;
  id v3;
  id v4;

  v2 = self;
  v3 = -[SearchViewController traitCollection](v2, "traitCollection");
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 == (id)1)
    return 30;
  else
    return 2;
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v6;
  _TtC8AppStore20SearchViewController *v7;

  v6 = a3;
  swift_unknownObjectRetain(a4);
  v7 = self;
  sub_10035F680(v6, (uint64_t)a4);

  swift_unknownObjectRelease(a4);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC8AppStore20SearchViewController *v6;

  v5 = a3;
  v6 = self;
  sub_10035F798(a3);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  char *v7;
  objc_super v8;

  height = a3.height;
  width = a3.width;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for SearchViewController(0);
  swift_unknownObjectRetain(a4);
  v7 = (char *)v8.receiver;
  -[SearchViewController viewWillTransitionToSize:withTransitionCoordinator:](&v8, "viewWillTransitionToSize:withTransitionCoordinator:", a4, width, height);
  objc_msgSend(*(id *)&v7[OBJC_IVAR____TtC8AppStore20SearchViewController_searchResultsContainerViewController], "viewWillTransitionToSize:withTransitionCoordinator:", a4, width, height, v8.receiver, v8.super_class);
  swift_unknownObjectRelease(a4);

}

- (void)viewWillLayoutSubviews
{
  char *v2;
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for SearchViewController(0);
  v2 = (char *)v4.receiver;
  -[SearchViewController viewWillLayoutSubviews](&v4, "viewWillLayoutSubviews");
  v3 = objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC8AppStore20SearchViewController_searchController], "searchBar", v4.receiver, v4.super_class);
  objc_msgSend(v2, "pageMarginInsets");
  objc_msgSend(v3, "setLayoutMargins:");

}

- (void)viewDidLayoutSubviews
{
  _TtC8AppStore20SearchViewController *v2;

  v2 = self;
  sub_10035FAC4();

}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4;
  _TtC8AppStore20SearchViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1003647C4();

}

- (void)presentSearchController:(id)a3
{
  id v4;
  _TtC8AppStore20SearchViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1003605AC(v4);

}

- (void)willDismissSearchController:(id)a3
{
  id v4;
  _TtC8AppStore20SearchViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1003606E4(v4);

}

- (void)didDismissSearchController:(id)a3
{
  id v4;
  _TtC8AppStore20SearchViewController *v5;

  v4 = a3;
  v5 = self;
  sub_10017A428(0);

}

- (void)willPresentSearchController:(id)a3
{
  id v4;
  _TtC8AppStore20SearchViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1005BB8EC();

}

- (void)updateSearchResultsForSearchController:(id)a3
{
  id v4;
  _TtC8AppStore20SearchViewController *v5;

  v4 = a3;
  v5 = self;
  sub_100360A28(v4);

}

- (_TtC8AppStore20SearchViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC8AppStore20SearchViewController *result;

  v4 = a4;
  result = (_TtC8AppStore20SearchViewController *)_swift_stdlib_reportUnimplementedInitializer("AppStore.SearchViewController", 29, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore20SearchViewController_objectGraph));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore20SearchViewController_facetsPresenter));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore20SearchViewController_guidedSearchPresenter));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore20SearchViewController_palettePresenter));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore20SearchViewController____lazy_storage___resultsMessageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore20SearchViewController____lazy_storage___tokenPalette));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore20SearchViewController_searchTextInput));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore20SearchViewController_searchTextPresenter));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore20SearchViewController_actionRunner));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore20SearchViewController_searchController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore20SearchViewController_searchResultsContainerViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore20SearchViewController_searchLandingViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore20SearchViewController_facetNavigationController));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC8AppStore20SearchViewController_activeSearchBarObservingViewController));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore20SearchViewController_pendingSearchAction));
  sub_1000057AC((uint64_t)self + OBJC_IVAR____TtC8AppStore20SearchViewController_guidedSearchContainerImpressionMetrics, &qword_10082E4B0);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC8AppStore20SearchViewController_navigationAccessories));
}

@end
