@implementation SearchViewController

- (_TtC20ProductPageExtension20SearchViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10021EB38();
}

- (void)viewDidLoad
{
  _TtC20ProductPageExtension20SearchViewController *v2;

  v2 = self;
  sub_100219914();

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC20ProductPageExtension20SearchViewController *v4;

  v4 = self;
  sub_100219DF8(a3);

}

- (unint64_t)supportedInterfaceOrientations
{
  _TtC20ProductPageExtension20SearchViewController *v2;
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
  _TtC20ProductPageExtension20SearchViewController *v7;

  v6 = a3;
  swift_unknownObjectRetain(a4);
  v7 = self;
  sub_100219FD4(v6, (uint64_t)a4);

  swift_unknownObjectRelease();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC20ProductPageExtension20SearchViewController *v6;

  v5 = a3;
  v6 = self;
  sub_10021A0EC(a3);

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
  objc_msgSend(*(id *)&v7[OBJC_IVAR____TtC20ProductPageExtension20SearchViewController_searchResultsContainerViewController], "viewWillTransitionToSize:withTransitionCoordinator:", a4, width, height, v8.receiver, v8.super_class);
  swift_unknownObjectRelease();

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
  v3 = objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC20ProductPageExtension20SearchViewController_searchController], "searchBar", v4.receiver, v4.super_class);
  objc_msgSend(v2, "pageMarginInsets");
  objc_msgSend(v3, "setLayoutMargins:");

}

- (void)viewDidLayoutSubviews
{
  _TtC20ProductPageExtension20SearchViewController *v2;

  v2 = self;
  sub_10021A418();

}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4;
  _TtC20ProductPageExtension20SearchViewController *v5;

  v4 = a3;
  v5 = self;
  sub_10021EC90();

}

- (void)presentSearchController:(id)a3
{
  id v4;
  _TtC20ProductPageExtension20SearchViewController *v5;

  v4 = a3;
  v5 = self;
  sub_10021AF00(v4);

}

- (void)willDismissSearchController:(id)a3
{
  id v4;
  _TtC20ProductPageExtension20SearchViewController *v5;

  v4 = a3;
  v5 = self;
  sub_10021B038(v4);

}

- (void)didDismissSearchController:(id)a3
{
  id v4;
  _TtC20ProductPageExtension20SearchViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1004FDA1C(0);

}

- (void)willPresentSearchController:(id)a3
{
  id v4;
  _TtC20ProductPageExtension20SearchViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1000BD9F4();

}

- (void)updateSearchResultsForSearchController:(id)a3
{
  id v4;
  _TtC20ProductPageExtension20SearchViewController *v5;

  v4 = a3;
  v5 = self;
  sub_10021B37C(v4);

}

- (_TtC20ProductPageExtension20SearchViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC20ProductPageExtension20SearchViewController *result;

  v4 = a4;
  result = (_TtC20ProductPageExtension20SearchViewController *)_swift_stdlib_reportUnimplementedInitializer("ProductPageExtension.SearchViewController", 41, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension20SearchViewController____lazy_storage___resultsMessageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension20SearchViewController____lazy_storage___tokenPalette));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension20SearchViewController_searchTextInput));
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension20SearchViewController_searchController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension20SearchViewController_searchResultsContainerViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension20SearchViewController_searchLandingViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension20SearchViewController_facetNavigationController));
  swift_unknownObjectRelease();
  swift_release();
  sub_100010F2C((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension20SearchViewController_guidedSearchContainerImpressionMetrics, &qword_1008131E0);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC20ProductPageExtension20SearchViewController_navigationAccessories));
}

@end
