@implementation TopChartsDiffablePageViewController

- (_TtC8AppStore35TopChartsDiffablePageViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100200FBC();
}

- (void)viewDidLoad
{
  _TtC8AppStore35TopChartsDiffablePageViewController *v2;

  v2 = self;
  sub_1001FDC88();

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  _BYTE *v4;
  id v5;
  uint64_t v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for TopChartsDiffablePageViewController();
  v4 = v7.receiver;
  v5 = -[TopChartsDiffablePageViewController viewWillAppear:](&v7, "viewWillAppear:", v3);
  v6 = OBJC_IVAR____TtC8AppStore35TopChartsDiffablePageViewController_isPresenterLoaded;
  if ((v4[OBJC_IVAR____TtC8AppStore35TopChartsDiffablePageViewController_isPresenterLoaded] & 1) == 0)
  {
    dispatch thunk of TimedMetricsPagePresenter.didLoad()(v5);
    v4[v6] = 1;
  }

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TopChartsDiffablePageViewController();
  v4 = v5.receiver;
  -[TopChartsDiffablePageViewController viewDidAppear:](&v5, "viewDidAppear:", v3);
  TopChartsDiffablePagePresenter.viewDidAppear()();

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  objc_class *v9;
  _TtC8AppStore35TopChartsDiffablePageViewController *v10;
  objc_super v11;

  v3 = a3;
  v5 = type metadata accessor for ViewWillDisappearReason(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = (objc_class *)type metadata accessor for TopChartsDiffablePageViewController();
  v11.receiver = self;
  v11.super_class = v9;
  v10 = self;
  -[TopChartsDiffablePageViewController viewWillDisappear:](&v11, "viewWillDisappear:", v3);
  static ViewWillDisappearReason.inferred(for:)(v10);
  TopChartsDiffablePagePresenter.viewWillDisappear(forReason:)(v8);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

}

- (void)viewWillLayoutSubviews
{
  _TtC8AppStore35TopChartsDiffablePageViewController *v2;

  v2 = self;
  sub_1001FE4C8();

}

- (unint64_t)supportedInterfaceOrientations
{
  _TtC8AppStore35TopChartsDiffablePageViewController *v2;
  id v3;
  id v4;

  v2 = self;
  v3 = -[TopChartsDiffablePageViewController traitCollection](v2, "traitCollection");
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 == (id)1)
    return 30;
  else
    return 2;
}

- (id)contentScrollViewForEdge:(unint64_t)a3
{
  id v4;
  id v5;
  id v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for TopChartsDiffablePageViewController();
  v4 = v8.receiver;
  v5 = -[TopChartsDiffablePageViewController contentScrollViewForEdge:](&v8, "contentScrollViewForEdge:", a3);
  if (!v5)
  {
    v6 = objc_allocWithZone((Class)UIScrollView);
    v5 = objc_msgSend(v6, "init", v8.receiver, v8.super_class);
  }

  return v5;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for TopChartsDiffablePageViewController();
  v4 = a3;
  v5 = v6.receiver;
  -[TopChartsDiffablePageViewController traitCollectionDidChange:](&v6, "traitCollectionDidChange:", v4);
  if (objc_msgSend(v5, "isViewLoaded", v6.receiver, v6.super_class))
    sub_100021288(0, 0, 1);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  _TtC8AppStore35TopChartsDiffablePageViewController *v8;

  height = a3.height;
  width = a3.width;
  swift_unknownObjectRetain(a4);
  v8 = self;
  sub_1001FE770(a4, width, height);
  swift_unknownObjectRelease(a4);

}

- (void)showCategoriesFor:(id)a3
{
  id v4;
  _TtC8AppStore35TopChartsDiffablePageViewController *v5;

  v4 = a3;
  v5 = self;
  sub_100201E74();

}

- (_TtC8AppStore35TopChartsDiffablePageViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC8AppStore35TopChartsDiffablePageViewController *result;

  v4 = a4;
  result = (_TtC8AppStore35TopChartsDiffablePageViewController *)_swift_stdlib_reportUnimplementedInitializer("AppStore.TopChartsDiffablePageViewController", 44, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore35TopChartsDiffablePageViewController_objectGraph));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore35TopChartsDiffablePageViewController_artworkLoader));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore35TopChartsDiffablePageViewController_presenter));
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC8AppStore35TopChartsDiffablePageViewController_palette);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore35TopChartsDiffablePageViewController_paletteContents));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC8AppStore35TopChartsDiffablePageViewController_segmentViewControllers));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore35TopChartsDiffablePageViewController_categoriesBarButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore35TopChartsDiffablePageViewController_overlayViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore35TopChartsDiffablePageViewController_selectCategoryViewController));
}

@end
