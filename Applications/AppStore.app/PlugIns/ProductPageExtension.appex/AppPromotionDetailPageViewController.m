@implementation AppPromotionDetailPageViewController

- (_TtC20ProductPageExtension36AppPromotionDetailPageViewController)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  void (*v7)(char *, uint64_t, uint64_t, uint64_t);
  id v8;
  _TtC20ProductPageExtension36AppPromotionDetailPageViewController *result;

  *((_BYTE *)&self->super.super.super.isa
  + OBJC_IVAR____TtC20ProductPageExtension36AppPromotionDetailPageViewController_isCollapsing) = 0;
  v5 = (char *)self
     + OBJC_IVAR____TtC20ProductPageExtension36AppPromotionDetailPageViewController_learnMoreActionMetrics;
  v6 = type metadata accessor for ActionMetrics(0, a2);
  v7 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56);
  v7(v5, 1, 1, v6);
  v7((char *)self + OBJC_IVAR____TtC20ProductPageExtension36AppPromotionDetailPageViewController_backButtonActionMetrics, 1, 1, v6);
  v7((char *)self + OBJC_IVAR____TtC20ProductPageExtension36AppPromotionDetailPageViewController_closeButtonActionMetrics, 1, 1, v6);
  v8 = a3;

  result = (_TtC20ProductPageExtension36AppPromotionDetailPageViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100685560, "ProductPageExtension/AppPromotionDetailPageViewController.swift", 63, 2, 108, 0);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  char *v2;
  __n128 v3;
  uint64_t v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v2 = (char *)v5.receiver;
  -[AppPromotionDetailPageViewController viewDidLoad](&v5, "viewDidLoad");
  *(_QWORD *)(*(_QWORD *)&v2[OBJC_IVAR____TtC20ProductPageExtension36AppPromotionDetailPageViewController_detailPageView]
            + OBJC_IVAR____TtC20ProductPageExtension26AppPromotionDetailPageView_delegate
            + 8) = &off_10074CE30;
  v4 = swift_unknownObjectWeakAssign(v3);
  dispatch thunk of BasePresenter.didLoad()(v4);

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC20ProductPageExtension36AppPromotionDetailPageViewController *v4;

  v4 = self;
  sub_10032B1C4(a3);

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC20ProductPageExtension36AppPromotionDetailPageViewController *v4;

  v4 = self;
  sub_10032B3F0(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC20ProductPageExtension36AppPromotionDetailPageViewController *v4;

  v4 = self;
  sub_10032B67C(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC20ProductPageExtension36AppPromotionDetailPageViewController *v4;

  v4 = self;
  sub_10032B95C(a3);

}

- (void)as_viewWillBecomeFullyVisible
{
  _TtC20ProductPageExtension36AppPromotionDetailPageViewController *v2;

  v2 = self;
  sub_10032BF44((SEL *)&selRef_as_viewWillBecomeFullyVisible, (unsigned int *)&enum case for StoreViewControllerLifecycleEvent.willAppear(_:), (void (*)(void))&dispatch thunk of VideoPlaybackCoordinator.resumeAutoPlayVideo());

}

- (void)as_viewDidBecomeFullyVisible
{
  _TtC20ProductPageExtension36AppPromotionDetailPageViewController *v2;

  v2 = self;
  sub_10032BC0C();

}

- (void)as_viewWillBecomePartiallyVisible
{
  _TtC20ProductPageExtension36AppPromotionDetailPageViewController *v2;

  v2 = self;
  sub_10032BDA0();

}

- (void)as_viewDidBecomePartiallyVisible
{
  _TtC20ProductPageExtension36AppPromotionDetailPageViewController *v2;

  v2 = self;
  sub_10032BF44((SEL *)&selRef_as_viewDidBecomePartiallyVisible, (unsigned int *)&enum case for StoreViewControllerLifecycleEvent.didDisappear(_:), (void (*)(void))&dispatch thunk of VideoPlaybackCoordinator.pauseAutoPlayVideo());

}

- (void)viewWillLayoutSubviews
{
  _TtC20ProductPageExtension36AppPromotionDetailPageViewController *v2;

  v2 = self;
  sub_10032C0DC();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC20ProductPageExtension36AppPromotionDetailPageViewController *v6;

  v5 = a3;
  v6 = self;
  sub_10032C248(a3);

}

- (unint64_t)supportedInterfaceOrientations
{
  _TtC20ProductPageExtension36AppPromotionDetailPageViewController *v2;
  id v3;
  id v4;

  v2 = self;
  v3 = -[AppPromotionDetailPageViewController traitCollection](v2, "traitCollection");
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 == (id)1)
    return 30;
  else
    return 2;
}

- (void)appEnteredWhileAppeared
{
  _TtC20ProductPageExtension36AppPromotionDetailPageViewController *v2;

  v2 = self;
  sub_10032C4D4();

}

- (void)appExitedWhileAppeared
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  _TtC20ProductPageExtension36AppPromotionDetailPageViewController *v9;
  uint64_t v10;

  v3 = type metadata accessor for StoreViewControllerLifecycleEvent(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(_QWORD *)&self->lifecycleObserver[OBJC_IVAR____TtC20ProductPageExtension36AppPromotionDetailPageViewController_lifecycleObserver
                                         + 16];
  v8 = *(_QWORD *)&self->lifecycleObserver[OBJC_IVAR____TtC20ProductPageExtension36AppPromotionDetailPageViewController_lifecycleObserver
                                         + 24];
  sub_100010F08((Class *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC20ProductPageExtension36AppPromotionDetailPageViewController_lifecycleObserver), v7);
  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v6, enum case for StoreViewControllerLifecycleEvent.appExitedWhileAppeared(_:), v3);
  v9 = self;
  dispatch thunk of StoreViewControllerLifecycleObserver.observe(lifecycleEvent:)(v6, v7, v8);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

}

- (BOOL)accessibilityPerformEscape
{
  uint64_t v3;
  uint64_t v4;
  __n128 v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  _TtC20ProductPageExtension36AppPromotionDetailPageViewController *v10;
  uint64_t v12;

  v3 = type metadata accessor for StoreViewControllerLifecycleEvent(0);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = __chkstk_darwin(v3);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, _QWORD, uint64_t, __n128))(v4 + 104))(v7, enum case for StoreViewControllerLifecycleEvent.didDisappear(_:), v3, v5);
  v8 = type metadata accessor for AppPromotionDetailPagePresenter(0);
  v9 = sub_10000E720(&qword_10081C878, (uint64_t (*)(uint64_t))&type metadata accessor for AppPromotionDetailPagePresenter, (uint64_t)&protocol conformance descriptor for BasePresenter);
  v10 = self;
  MetricsPagePresenter.observe(lifecycleEvent:)(v7, v8, v9);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  -[AppPromotionDetailPageViewController dismissViewControllerAnimated:completion:](v10, "dismissViewControllerAnimated:completion:", 1, 0);

  return 1;
}

- (NSArray)keyCommands
{
  _TtC20ProductPageExtension36AppPromotionDetailPageViewController *v2;
  unint64_t v3;
  NSArray v4;

  v2 = self;
  v3 = sub_10009DA60();

  if (v3)
  {
    sub_100018B6C(0, (unint64_t *)&qword_100808190, UIKeyCommand_ptr);
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
  uint64_t v10;
  uint64_t v11;
  id v12;
  _TtC20ProductPageExtension36AppPromotionDetailPageViewController *v13;
  uint64_t v14;

  v5 = type metadata accessor for StoreViewControllerLifecycleEvent(0);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = __chkstk_darwin(v5);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, _QWORD, uint64_t, __n128))(v6 + 104))(v9, enum case for StoreViewControllerLifecycleEvent.didDisappear(_:), v5, v7);
  v10 = type metadata accessor for AppPromotionDetailPagePresenter(0);
  v11 = sub_10000E720(&qword_10081C878, (uint64_t (*)(uint64_t))&type metadata accessor for AppPromotionDetailPagePresenter, (uint64_t)&protocol conformance descriptor for BasePresenter);
  v12 = a3;
  v13 = self;
  MetricsPagePresenter.observe(lifecycleEvent:)(v9, v10, v11);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  -[AppPromotionDetailPageViewController dismissViewControllerAnimated:completion:](v13, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (_TtC20ProductPageExtension36AppPromotionDetailPageViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC20ProductPageExtension36AppPromotionDetailPageViewController *result;

  v4 = a4;
  result = (_TtC20ProductPageExtension36AppPromotionDetailPageViewController *)_swift_stdlib_reportUnimplementedInitializer("ProductPageExtension.AppPromotionDetailPageViewController", 57, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0((Class *)((char *)&self->super.super.super.isa
                                                                 + OBJC_IVAR____TtC20ProductPageExtension36AppPromotionDetailPageViewController_lifecycleObserver));
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension36AppPromotionDetailPageViewController_detailPageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension36AppPromotionDetailPageViewController_containerTransitioningDelegate));
  sub_100010F2C((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension36AppPromotionDetailPageViewController_learnMoreActionMetrics, &qword_10081C870);
  sub_100010F2C((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension36AppPromotionDetailPageViewController_backButtonActionMetrics, &qword_10081C870);
  sub_100010F2C((uint64_t)self+ OBJC_IVAR____TtC20ProductPageExtension36AppPromotionDetailPageViewController_closeButtonActionMetrics, &qword_10081C870);
}

@end
