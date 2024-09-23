@implementation ArcadeWelcomeViewController

- (_TtC8AppStore27ArcadeWelcomeViewController)initWithCoder:(id)a3
{
  id v4;
  _TtC8AppStore27ArcadeWelcomeViewController *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8AppStore27ArcadeWelcomeViewController_overlayViewController) = 0;
  v4 = a3;

  result = (_TtC8AppStore27ArcadeWelcomeViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001006A63C0, "AppStore/ArcadeWelcomeViewController.swift", 42, 2, 64, 0);
  __break(1u);
  return result;
}

- (void)viewWillLayoutSubviews
{
  uint64_t v2;
  _TtC8AppStore27ArcadeWelcomeViewController *v3;

  v3 = self;
  sub_100469A40((uint64_t)v3, v2);

}

- (void)viewDidLoad
{
  _TtC8AppStore27ArcadeWelcomeViewController *v2;

  v2 = self;
  sub_100469C38();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC8AppStore27ArcadeWelcomeViewController *v4;

  v4 = self;
  sub_100469D98(a3);

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC8AppStore27ArcadeWelcomeViewController *v4;

  v4 = self;
  sub_100469F8C(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC8AppStore27ArcadeWelcomeViewController *v4;

  v4 = self;
  sub_10046A204(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_class *ObjectType;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  _TtC8AppStore27ArcadeWelcomeViewController *v10;
  uint64_t v11;
  uint64_t v12;
  objc_super v13;

  v3 = a3;
  ObjectType = (objc_class *)swift_getObjectType();
  v6 = type metadata accessor for StoreViewControllerLifecycleEvent(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13.receiver = self;
  v13.super_class = ObjectType;
  v10 = self;
  -[ArcadeWelcomeViewController viewDidDisappear:](&v13, "viewDidDisappear:", v3);
  v11 = *(_QWORD *)&v10->artworkLoader[OBJC_IVAR____TtC8AppStore27ArcadeWelcomeViewController_lifecycleObserver];
  v12 = *(_QWORD *)&v10->lifecycleObserver[OBJC_IVAR____TtC8AppStore27ArcadeWelcomeViewController_lifecycleObserver];
  sub_100060B40((Class *)((char *)&v10->super.super.super.isa+ OBJC_IVAR____TtC8AppStore27ArcadeWelcomeViewController_lifecycleObserver), v11);
  (*(void (**)(char *, _QWORD, uint64_t))(v7 + 104))(v9, enum case for StoreViewControllerLifecycleEvent.didDisappear(_:), v6);
  dispatch thunk of StoreViewControllerLifecycleObserver.observe(lifecycleEvent:)(v9, v11, v12);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

}

- (void)appEnteredWhileAppeared
{
  sub_10046A650((char *)self, (uint64_t)a2, (unsigned int *)&enum case for StoreViewControllerLifecycleEvent.appEnteredWhileAppeared(_:));
}

- (void)appExitedWhileAppeared
{
  sub_10046A650((char *)self, (uint64_t)a2, (unsigned int *)&enum case for StoreViewControllerLifecycleEvent.appExitedWhileAppeared(_:));
}

- (_TtC8AppStore27ArcadeWelcomeViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC8AppStore27ArcadeWelcomeViewController *result;

  v4 = a4;
  result = (_TtC8AppStore27ArcadeWelcomeViewController *)_swift_stdlib_reportUnimplementedInitializer("AppStore.ArcadeWelcomeViewController", 36, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore27ArcadeWelcomeViewController_objectGraph));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore27ArcadeWelcomeViewController_presenter));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore27ArcadeWelcomeViewController_artworkLoader));
  _s8AppStore27ProductRatingsRegularLayoutV7MetricsVwxx_0((Class *)((char *)&self->super.super.super.isa
                                                                  + OBJC_IVAR____TtC8AppStore27ArcadeWelcomeViewController_lifecycleObserver));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore27ArcadeWelcomeViewController_impressionsCalculator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore27ArcadeWelcomeViewController_pageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore27ArcadeWelcomeViewController_overlayViewController));
}

@end
