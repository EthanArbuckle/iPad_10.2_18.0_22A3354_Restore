@implementation ArcadeSubscribeViewController

- (_TtC8AppStore29ArcadeSubscribeViewController)initWithCoder:(id)a3
{
  char *v5;
  id v6;
  _TtC8AppStore29ArcadeSubscribeViewController *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8AppStore29ArcadeSubscribeViewController_overlayViewController) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8AppStore29ArcadeSubscribeViewController_fallbackDismissButton) = 0;
  v5 = (char *)self + OBJC_IVAR____TtC8AppStore29ArcadeSubscribeViewController_delegate;
  *((_QWORD *)v5 + 1) = 0;
  swift_unknownObjectWeakInit(v5, 0);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8AppStore29ArcadeSubscribeViewController_delayedDismissalReappearanceItem) = 0;
  v6 = a3;

  result = (_TtC8AppStore29ArcadeSubscribeViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001006A63C0, "AppStore/ArcadeSubscribeViewController.swift", 44, 2, 74, 0);
  __break(1u);
  return result;
}

- (void)dealloc
{
  objc_class *ObjectType;
  void *v4;
  _TtC8AppStore29ArcadeSubscribeViewController *v5;
  id v6;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  v4 = (void *)objc_opt_self(NSNotificationCenter);
  v5 = self;
  v6 = objc_msgSend(v4, "defaultCenter");
  objc_msgSend(v6, "removeObserver:", v5);

  v7.receiver = v5;
  v7.super_class = ObjectType;
  -[ArcadeSubscribeViewController dealloc](&v7, "dealloc");
}

- (void).cxx_destruct
{
  _s8AppStore27ProductRatingsRegularLayoutV7MetricsVwxx_0((Class *)((char *)&self->super.super.super.isa
                                                                  + OBJC_IVAR____TtC8AppStore29ArcadeSubscribeViewController_lifecycleObserver));
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore29ArcadeSubscribeViewController_pageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore29ArcadeSubscribeViewController_overlayViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore29ArcadeSubscribeViewController_fallbackDismissButton));
  sub_1000834F4((uint64_t)self + OBJC_IVAR____TtC8AppStore29ArcadeSubscribeViewController_delegate);
  swift_release();
}

- (void)viewDidLoad
{
  id v2;
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = v4.receiver;
  -[ArcadeSubscribeViewController viewDidLoad](&v4, "viewDidLoad");
  ArcadeSubscribePresenter.didLoad()();
  objc_msgSend(v2, "setModalInPresentation:", 1, v4.receiver, v4.super_class);
  v3 = objc_msgSend(v2, "navigationItem");
  objc_msgSend(v3, "setLargeTitleDisplayMode:", 2);

  objc_msgSend(v2, "setTitle:", 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC8AppStore29ArcadeSubscribeViewController *v4;

  v4 = self;
  ArcadeSubscribeViewController.viewWillAppear(_:)(a3);

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC8AppStore29ArcadeSubscribeViewController *v4;

  v4 = self;
  ArcadeSubscribeViewController.viewDidAppear(_:)(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC8AppStore29ArcadeSubscribeViewController *v4;

  v4 = self;
  ArcadeSubscribeViewController.viewWillDisappear(_:)(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_class *ObjectType;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  _TtC8AppStore29ArcadeSubscribeViewController *v10;
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
  -[ArcadeSubscribeViewController viewDidDisappear:](&v13, "viewDidDisappear:", v3);
  v11 = *(_QWORD *)&v10->lifecycleObserver[OBJC_IVAR____TtC8AppStore29ArcadeSubscribeViewController_lifecycleObserver
                                         + 16];
  v12 = *(_QWORD *)&v10->lifecycleObserver[OBJC_IVAR____TtC8AppStore29ArcadeSubscribeViewController_lifecycleObserver
                                         + 24];
  sub_100060B40((Class *)((char *)&v10->super.super.super.isa+ OBJC_IVAR____TtC8AppStore29ArcadeSubscribeViewController_lifecycleObserver), v11);
  (*(void (**)(char *, _QWORD, uint64_t))(v7 + 104))(v9, enum case for StoreViewControllerLifecycleEvent.didDisappear(_:), v6);
  dispatch thunk of StoreViewControllerLifecycleObserver.observe(lifecycleEvent:)(v9, v11, v12);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

}

- (void)as_viewWillBecomeFullyVisible
{
  sub_10050EB00(self, (uint64_t)a2, (const char **)&selRef_as_viewWillBecomeFullyVisible, (unsigned int *)&enum case for StoreViewControllerLifecycleEvent.willAppear(_:));
}

- (void)as_viewDidBecomeFullyVisible
{
  _TtC8AppStore29ArcadeSubscribeViewController *v2;

  v2 = self;
  ArcadeSubscribeViewController.as_viewDidBecomeFullyVisible()();

}

- (void)as_viewWillBecomePartiallyVisible
{
  _TtC8AppStore29ArcadeSubscribeViewController *v2;

  v2 = self;
  ArcadeSubscribeViewController.as_viewWillBecomePartiallyVisible()();

}

- (void)as_viewDidBecomePartiallyVisible
{
  sub_10050EB00(self, (uint64_t)a2, (const char **)&selRef_as_viewDidBecomePartiallyVisible, (unsigned int *)&enum case for StoreViewControllerLifecycleEvent.didDisappear(_:));
}

- (void)viewWillLayoutSubviews
{
  _TtC8AppStore29ArcadeSubscribeViewController *v2;

  v2 = self;
  ArcadeSubscribeViewController.viewWillLayoutSubviews()();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  v4 = v8.receiver;
  v5 = a3;
  -[ArcadeSubscribeViewController traitCollectionDidChange:](&v8, "traitCollectionDidChange:", v5);
  v6 = objc_msgSend(v4, "view", v8.receiver, v8.super_class);
  if (v6)
  {
    v7 = v6;
    objc_msgSend(v6, "setNeedsLayout");

  }
  else
  {
    __break(1u);
  }
}

- (unint64_t)supportedInterfaceOrientations
{
  _TtC8AppStore29ArcadeSubscribeViewController *v2;
  id v3;
  id v4;

  v2 = self;
  v3 = -[ArcadeSubscribeViewController traitCollection](v2, "traitCollection");
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 == (id)1)
    return 30;
  else
    return 2;
}

- (void)appEnteredWhileAppeared
{
  sub_10050F3AC((char *)self, (uint64_t)a2, (unsigned int *)&enum case for StoreViewControllerLifecycleEvent.appEnteredWhileAppeared(_:));
}

- (void)appExitedWhileAppeared
{
  sub_10050F3AC((char *)self, (uint64_t)a2, (unsigned int *)&enum case for StoreViewControllerLifecycleEvent.appExitedWhileAppeared(_:));
}

- (void)dismissPressed:(id)a3
{
  _TtC8AppStore29ArcadeSubscribeViewController *v5;
  uint64_t v6;
  _TtC8AppStore29ArcadeSubscribeViewController *v7;
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
  sub_10050F480();

  sub_1000057AC((uint64_t)v8, (uint64_t *)&unk_10082B490);
}

- (_TtC8AppStore29ArcadeSubscribeViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC8AppStore29ArcadeSubscribeViewController *result;

  v4 = a4;
  result = (_TtC8AppStore29ArcadeSubscribeViewController *)_swift_stdlib_reportUnimplementedInitializer("AppStore.ArcadeSubscribeViewController", 38, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

@end
