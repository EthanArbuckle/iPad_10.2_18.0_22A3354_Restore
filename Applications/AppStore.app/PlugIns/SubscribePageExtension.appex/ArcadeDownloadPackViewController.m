@implementation ArcadeDownloadPackViewController

- (void)viewDidLoad
{
  id v2;
  id v3;
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ArcadeDownloadPackViewController();
  v2 = v5.receiver;
  v3 = -[ArcadeDownloadPackViewController viewDidLoad](&v5, "viewDidLoad");
  dispatch thunk of BasePresenter.didLoad()(v3);
  v4 = objc_msgSend(v2, "navigationItem", v5.receiver, v5.super_class);
  objc_msgSend(v4, "setLargeTitleDisplayMode:", 2);

}

- (void)viewWillAppear:(BOOL)a3
{
  sub_100166580(self, (uint64_t)a2, a3, (const char **)&selRef_viewWillAppear_, (unsigned int *)&enum case for StoreViewControllerLifecycleEvent.willAppear(_:));
}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC22SubscribePageExtension32ArcadeDownloadPackViewController *v4;

  v4 = self;
  sub_100166128(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC22SubscribePageExtension32ArcadeDownloadPackViewController *v4;

  v4 = self;
  sub_1001662F0(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  sub_100166580(self, (uint64_t)a2, a3, (const char **)&selRef_viewDidDisappear_, (unsigned int *)&enum case for StoreViewControllerLifecycleEvent.didDisappear(_:));
}

- (void)appEnteredWhileAppeared
{
  sub_100166694((char *)self, (uint64_t)a2, (unsigned int *)&enum case for StoreViewControllerLifecycleEvent.appEnteredWhileAppeared(_:));
}

- (void)appExitedWhileAppeared
{
  sub_100166694((char *)self, (uint64_t)a2, (unsigned int *)&enum case for StoreViewControllerLifecycleEvent.appExitedWhileAppeared(_:));
}

- (void)viewWillLayoutSubviews
{
  _TtC22SubscribePageExtension32ArcadeDownloadPackViewController *v2;

  v2 = self;
  sub_100166768();

}

- (void)viewDidLayoutSubviews
{
  _TtC22SubscribePageExtension32ArcadeDownloadPackViewController *v2;

  v2 = self;
  sub_100166880();

}

- (UIView)contentView
{
  return (UIView *)*(id *)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC22SubscribePageExtension32ArcadeDownloadPackViewController_pageView];
}

- (double)_headerTopOffset
{
  return 0.0;
}

- (BOOL)includePaddingAboveContentView
{
  return 0;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  char *v5;
  uint64_t v6;
  __n128 v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t ObjectType;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for ArcadeDownloadPackViewController();
  v4 = a3;
  v5 = (char *)v12.receiver;
  -[ArcadeDownloadPackViewController scrollViewDidScroll:](&v12, "scrollViewDidScroll:", v4);
  v6 = *(_QWORD *)&v5[OBJC_IVAR____TtC22SubscribePageExtension32ArcadeDownloadPackViewController_pageView + 8];
  v8 = BasePresenter.impressionsCalculator.getter(v7);
  v9 = objc_msgSend(v5, "view", v12.receiver, v12.super_class);
  if (v9)
  {
    v10 = v9;
    ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, void *, uint64_t, uint64_t))(v6 + 8))(v8, v10, ObjectType, v6);

    swift_release(v8);
  }
  else
  {
    __break(1u);
  }
}

- (_TtC22SubscribePageExtension32ArcadeDownloadPackViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  _TtC22SubscribePageExtension32ArcadeDownloadPackViewController *result;

  result = (_TtC22SubscribePageExtension32ArcadeDownloadPackViewController *)_swift_stdlib_reportUnimplementedInitializer("SubscribePageExtension.ArcadeDownloadPackViewController", 55, "init(title:detailText:symbolName:contentLayout:)", 48, 0);
  __break(1u);
  return result;
}

- (_TtC22SubscribePageExtension32ArcadeDownloadPackViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6;
  _TtC22SubscribePageExtension32ArcadeDownloadPackViewController *result;

  v6 = a5;
  result = (_TtC22SubscribePageExtension32ArcadeDownloadPackViewController *)_swift_stdlib_reportUnimplementedInitializer("SubscribePageExtension.ArcadeDownloadPackViewController", 55, "init(title:detailText:icon:contentLayout:)", 42, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(_QWORD *)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC22SubscribePageExtension32ArcadeDownloadPackViewController_objectGraph]);
  swift_release(*(_QWORD *)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC22SubscribePageExtension32ArcadeDownloadPackViewController_presenter]);
  _s22SubscribePageExtension38ProductRatingsCompactProductPageLayoutV7MetricsVwxx_0(&self->OBWelcomeController_opaque[OBJC_IVAR____TtC22SubscribePageExtension32ArcadeDownloadPackViewController_lifecycleObserver]);

}

@end
