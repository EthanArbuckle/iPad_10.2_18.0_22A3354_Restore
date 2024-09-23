@implementation GenericAccountPageViewController

- (_TtC8AppStore32GenericAccountPageViewController)initWithCoder:(id)a3
{
  id v4;
  _TtC8AppStore32GenericAccountPageViewController *result;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC8AppStore32GenericAccountPageViewController_overlayViewController) = 0;
  v4 = a3;

  result = (_TtC8AppStore32GenericAccountPageViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001006A63C0, "AppStore/GenericAccountPageViewController.swift", 47, 2, 67, 0);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC8AppStore32GenericAccountPageViewController *v2;

  v2 = self;
  sub_10051E0B8();

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  id v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for GenericAccountPageViewController();
  v4 = v6.receiver;
  v5 = -[GenericAccountPageViewController viewDidAppear:](&v6, "viewDidAppear:", v3);
  if (dispatch thunk of BasePresenter.pageRenderMetrics.getter(v5))
  {
    PageRenderMetricsPresenter.viewDidAppear()();

    swift_release();
  }
  else
  {

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  objc_class *v9;
  _TtC8AppStore32GenericAccountPageViewController *v10;
  id v11;
  __n128 v12;
  objc_super v13;

  v3 = a3;
  v5 = type metadata accessor for ViewWillDisappearReason(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = (objc_class *)type metadata accessor for GenericAccountPageViewController();
  v13.receiver = self;
  v13.super_class = v9;
  v10 = self;
  v11 = -[GenericAccountPageViewController viewWillDisappear:](&v13, "viewWillDisappear:", v3);
  if (dispatch thunk of BasePresenter.pageRenderMetrics.getter(v11))
  {
    static ViewWillDisappearReason.inferred(for:)(v10);
    PageRenderMetricsPresenter.viewWillDisappear(forReason:)(v8);
    v12 = swift_release();
    (*(void (**)(char *, uint64_t, __n128))(v6 + 8))(v8, v5, v12);
  }

}

- (void)viewWillLayoutSubviews
{
  _TtC8AppStore32GenericAccountPageViewController *v2;

  v2 = self;
  sub_10051E5B8();

}

- (unint64_t)supportedInterfaceOrientations
{
  _TtC8AppStore32GenericAccountPageViewController *v2;
  id v3;
  id v4;

  v2 = self;
  v3 = -[GenericAccountPageViewController traitCollection](v2, "traitCollection");
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 == (id)1)
    return 30;
  else
    return 2;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC8AppStore32GenericAccountPageViewController *v6;

  v5 = a3;
  v6 = self;
  sub_10051E744(a3);

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id v4;
  _TtC8AppStore32GenericAccountPageViewController *v5;
  int64_t v6;

  v4 = a3;
  v5 = self;
  v6 = dispatch thunk of GenericAccountPagePresenter.numberOfSections.getter();

  return v6;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6;
  _TtC8AppStore32GenericAccountPageViewController *v7;
  int64_t v8;

  v6 = a3;
  v7 = self;
  v8 = dispatch thunk of GenericAccountPagePresenter.numberOfItems(in:)(a4);

  return v8;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  return sub_10051FD58(self, (uint64_t)a2, a3, a4, (uint64_t (*)(_QWORD))_s8AppStore10HeaderViewCMa_0);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC8AppStore32GenericAccountPageViewController *v12;
  void *v13;
  uint64_t v15;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  v13 = (void *)sub_10051E9E8(v11, (uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v13;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  return sub_10051FD58(self, (uint64_t)a2, a3, a4, (uint64_t (*)(_QWORD))type metadata accessor for LinkableFooterView);
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v6;
  _TtC8AppStore32GenericAccountPageViewController *v7;
  double v8;
  double v9;

  v6 = a3;
  v7 = self;
  sub_10051FE00(v6, a4);
  v9 = v8;

  return v9;
}

- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5
{
  id v8;
  id v9;
  _TtC8AppStore32GenericAccountPageViewController *v10;

  v8 = a3;
  v9 = a4;
  v10 = self;
  sub_10052006C(v8, v9, a5);

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC8AppStore32GenericAccountPageViewController *v12;
  uint64_t v13;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_1005203A8(v11, (uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  id v6;
  _TtC8AppStore32GenericAccountPageViewController *v7;
  double v8;
  double v9;

  v6 = a3;
  v7 = self;
  sub_100520928(v6, a4);
  v9 = v8;

  return v9;
}

- (void)tableView:(id)a3 willDisplayFooterView:(id)a4 forSection:(int64_t)a5
{
  id v8;
  id v9;
  _TtC8AppStore32GenericAccountPageViewController *v10;

  v8 = a3;
  v9 = a4;
  v10 = self;
  sub_100520AC8(v8, v9, a5);

}

- (_TtC8AppStore32GenericAccountPageViewController)initWithStyle:(int64_t)a3
{
  _TtC8AppStore32GenericAccountPageViewController *result;

  result = (_TtC8AppStore32GenericAccountPageViewController *)_swift_stdlib_reportUnimplementedInitializer("AppStore.GenericAccountPageViewController", 41, "init(style:)", 12, 0);
  __break(1u);
  return result;
}

- (_TtC8AppStore32GenericAccountPageViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC8AppStore32GenericAccountPageViewController *result;

  v4 = a4;
  result = (_TtC8AppStore32GenericAccountPageViewController *)_swift_stdlib_reportUnimplementedInitializer("AppStore.GenericAccountPageViewController", 41, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore32GenericAccountPageViewController_objectGraph));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore32GenericAccountPageViewController_presenter));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore32GenericAccountPageViewController_overlayViewController));
}

@end
