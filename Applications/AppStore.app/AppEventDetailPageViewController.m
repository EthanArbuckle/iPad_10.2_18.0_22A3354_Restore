@implementation AppEventDetailPageViewController

- (_TtC8AppStore32AppEventDetailPageViewController)initWithCoder:(id)a3
{
  id v4;
  _TtC8AppStore32AppEventDetailPageViewController *result;

  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore32AppEventDetailPageViewController_isCollapsing) = 0;
  v4 = a3;

  result = (_TtC8AppStore32AppEventDetailPageViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001006A63C0, "AppStore/AppEventDetailPageViewController.swift", 47, 2, 88, 0);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  id v2;
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType(self, a2);
  v2 = v4.receiver;
  v3 = -[AppEventDetailPageViewController viewDidLoad](&v4, "viewDidLoad");
  dispatch thunk of BasePresenter.didLoad()(v3);

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC8AppStore32AppEventDetailPageViewController *v4;

  v4 = self;
  sub_100188898(a3);

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC8AppStore32AppEventDetailPageViewController *v4;

  v4 = self;
  sub_100188ABC(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC8AppStore32AppEventDetailPageViewController *v4;

  v4 = self;
  sub_100188DDC(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC8AppStore32AppEventDetailPageViewController *v4;

  v4 = self;
  sub_1001890BC(a3);

}

- (void)as_viewWillBecomeFullyVisible
{
  _TtC8AppStore32AppEventDetailPageViewController *v2;

  v2 = self;
  sub_10018979C((SEL *)&selRef_as_viewWillBecomeFullyVisible, (unsigned int *)&enum case for StoreViewControllerLifecycleEvent.willAppear(_:), (void (*)(void))&dispatch thunk of VideoPlaybackCoordinator.resumeAutoPlayVideo());

}

- (void)as_viewDidBecomeFullyVisible
{
  _TtC8AppStore32AppEventDetailPageViewController *v2;

  v2 = self;
  sub_100189464();

}

- (void)as_viewWillBecomePartiallyVisible
{
  _TtC8AppStore32AppEventDetailPageViewController *v2;

  v2 = self;
  sub_1001895F8();

}

- (void)as_viewDidBecomePartiallyVisible
{
  _TtC8AppStore32AppEventDetailPageViewController *v2;

  v2 = self;
  sub_10018979C((SEL *)&selRef_as_viewDidBecomePartiallyVisible, (unsigned int *)&enum case for StoreViewControllerLifecycleEvent.didDisappear(_:), (void (*)(void))&dispatch thunk of VideoPlaybackCoordinator.pauseAutoPlayVideo());

}

- (void)viewWillLayoutSubviews
{
  uint64_t v2;
  _TtC8AppStore32AppEventDetailPageViewController *v3;

  v3 = self;
  sub_100189934((uint64_t)v3, v2);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC8AppStore32AppEventDetailPageViewController *v6;

  v5 = a3;
  v6 = self;
  sub_100189AA0(a3, (uint64_t)v6);

}

- (unint64_t)supportedInterfaceOrientations
{
  _TtC8AppStore32AppEventDetailPageViewController *v2;
  id v3;
  id v4;

  v2 = self;
  v3 = -[AppEventDetailPageViewController traitCollection](v2, "traitCollection");
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 == (id)1)
    return 30;
  else
    return 2;
}

- (void)appEnteredWhileAppeared
{
  _TtC8AppStore32AppEventDetailPageViewController *v2;

  v2 = self;
  sub_100189D2C();

}

- (void)appExitedWhileAppeared
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  _TtC8AppStore32AppEventDetailPageViewController *v9;
  uint64_t v10;

  v3 = type metadata accessor for StoreViewControllerLifecycleEvent(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(_QWORD *)&self->lifecycleObserver[OBJC_IVAR____TtC8AppStore32AppEventDetailPageViewController_lifecycleObserver
                                         + 16];
  v8 = *(_QWORD *)&self->lifecycleObserver[OBJC_IVAR____TtC8AppStore32AppEventDetailPageViewController_lifecycleObserver
                                         + 24];
  sub_100060B40((Class *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC8AppStore32AppEventDetailPageViewController_lifecycleObserver), v7);
  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v6, enum case for StoreViewControllerLifecycleEvent.appExitedWhileAppeared(_:), v3);
  v9 = self;
  dispatch thunk of StoreViewControllerLifecycleObserver.observe(lifecycleEvent:)(v6, v7, v8);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

}

- (uint64_t)closeButtonPressed:(uint64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  uint64_t v10;
  __n128 v11;
  id v12;
  __n128 v13;
  uint64_t v14;
  uint64_t v15;
  _OWORD v17[2];

  v5 = type metadata accessor for StoreViewControllerLifecycleEvent(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    v9 = a1;
    swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v17, v10);
    v11 = swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v17, 0, sizeof(v17));
    v12 = a1;
  }
  v13.n128_f64[0] = (*(double (**)(char *, _QWORD, uint64_t, __n128))(v6 + 104))(v8, enum case for StoreViewControllerLifecycleEvent.dismissedByBackButton(_:), v5, v11);
  v14 = type metadata accessor for AppEventDetailPagePresenter(0, v13);
  v15 = sub_100057438(&qword_1008316C8, 255, (uint64_t (*)(uint64_t))&type metadata accessor for AppEventDetailPagePresenter, (uint64_t)&protocol conformance descriptor for BasePresenter);
  MetricsPagePresenter.observe(lifecycleEvent:)(v8, v14, v15);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  objc_msgSend(a1, "dismissViewControllerAnimated:completion:", 1, 0);

  return sub_1000057AC((uint64_t)v17, (uint64_t *)&unk_10082B490);
}

- (void)lockupTapGestureRecognized:(id)a3
{
  _TtC8AppStore32AppEventDetailPageViewController *v5;
  uint64_t v6;
  _TtC8AppStore32AppEventDetailPageViewController *v7;
  _OWORD v8[2];

  if (a3)
  {
    v5 = self;
    swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v8, v6);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v7 = self;
  }
  sub_10018A098();

  sub_1000057AC((uint64_t)v8, (uint64_t *)&unk_10082B490);
}

- (BOOL)accessibilityPerformEscape
{
  uint64_t v3;
  uint64_t v4;
  __n128 v5;
  uint64_t v6;
  char *v7;
  __n128 v8;
  uint64_t v9;
  uint64_t v10;
  _TtC8AppStore32AppEventDetailPageViewController *v11;
  uint64_t v13;

  v3 = type metadata accessor for StoreViewControllerLifecycleEvent(0);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = __chkstk_darwin(v3);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8.n128_f64[0] = (*(double (**)(char *, _QWORD, uint64_t, __n128))(v4 + 104))(v7, enum case for StoreViewControllerLifecycleEvent.dismissedByBackButton(_:), v3, v5);
  v9 = type metadata accessor for AppEventDetailPagePresenter(0, v8);
  v10 = sub_100057438(&qword_1008316C8, 255, (uint64_t (*)(uint64_t))&type metadata accessor for AppEventDetailPagePresenter, (uint64_t)&protocol conformance descriptor for BasePresenter);
  v11 = self;
  MetricsPagePresenter.observe(lifecycleEvent:)(v7, v9, v10);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  -[AppEventDetailPageViewController dismissViewControllerAnimated:completion:](v11, "dismissViewControllerAnimated:completion:", 1, 0);

  return 1;
}

- (NSArray)keyCommands
{
  _TtC8AppStore32AppEventDetailPageViewController *v2;
  unint64_t v3;
  NSArray v4;

  v2 = self;
  v3 = sub_10018A97C();

  if (v3)
  {
    sub_100008FE4(0, (unint64_t *)&qword_10082C580, UIKeyCommand_ptr);
    v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v3);
  }
  else
  {
    v4.super.isa = 0;
  }
  return (NSArray *)v4.super.isa;
}

- (void)handleDismissKeyCommandWithCommand:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  __n128 v7;
  uint64_t v8;
  char *v9;
  __n128 v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  _TtC8AppStore32AppEventDetailPageViewController *v14;
  uint64_t v15;

  v5 = type metadata accessor for StoreViewControllerLifecycleEvent(0);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = __chkstk_darwin(v5);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10.n128_f64[0] = (*(double (**)(char *, _QWORD, uint64_t, __n128))(v6 + 104))(v9, enum case for StoreViewControllerLifecycleEvent.dismissedByBackButton(_:), v5, v7);
  v11 = type metadata accessor for AppEventDetailPagePresenter(0, v10);
  v12 = sub_100057438(&qword_1008316C8, 255, (uint64_t (*)(uint64_t))&type metadata accessor for AppEventDetailPagePresenter, (uint64_t)&protocol conformance descriptor for BasePresenter);
  v13 = a3;
  v14 = self;
  MetricsPagePresenter.observe(lifecycleEvent:)(v9, v11, v12);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  -[AppEventDetailPageViewController dismissViewControllerAnimated:completion:](v14, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (_TtC8AppStore32AppEventDetailPageViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC8AppStore32AppEventDetailPageViewController *result;

  v4 = a4;
  result = (_TtC8AppStore32AppEventDetailPageViewController *)_swift_stdlib_reportUnimplementedInitializer("AppStore.AppEventDetailPageViewController", 41, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  _s8AppStore27ProductRatingsRegularLayoutV7MetricsVwxx_0((Class *)((char *)&self->super.super.super.isa
                                                                  + OBJC_IVAR____TtC8AppStore32AppEventDetailPageViewController_lifecycleObserver));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore32AppEventDetailPageViewController_artworkLoader));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore32AppEventDetailPageViewController_objectGraph));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore32AppEventDetailPageViewController_presenter));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore32AppEventDetailPageViewController_pageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore32AppEventDetailPageViewController_containerTransitioningDelegate));
}

@end
