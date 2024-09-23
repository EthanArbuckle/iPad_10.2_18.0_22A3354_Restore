@implementation InAppPurchaseInstallPageViewController

- (_TtC8AppStore38InAppPurchaseInstallPageViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10021D6B0();
}

- (void)willEnterForeground
{
  __n128 v2;
  _TtC8AppStore38InAppPurchaseInstallPageViewController *v3;

  v3 = self;
  sub_1002193FC(1, v2);
  *((_BYTE *)&v3->super.super.super.isa
  + OBJC_IVAR____TtC8AppStore38InAppPurchaseInstallPageViewController_isInBackground) = 0;

}

- (void)didEnterBackground
{
  __n128 v2;
  _TtC8AppStore38InAppPurchaseInstallPageViewController *v3;

  v3 = self;
  sub_1002193FC(0, v2);
  *((_BYTE *)&v3->super.super.super.isa
  + OBJC_IVAR____TtC8AppStore38InAppPurchaseInstallPageViewController_isInBackground) = 1;
  *((_BYTE *)&v3->super.super.super.isa
  + OBJC_IVAR____TtC8AppStore38InAppPurchaseInstallPageViewController_didProgressWhileForegrounded) = 0;

}

- (void)viewDidLoad
{
  _TtC8AppStore38InAppPurchaseInstallPageViewController *v2;

  v2 = self;
  sub_100219A98();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC8AppStore38InAppPurchaseInstallPageViewController *v4;

  v4 = self;
  sub_100219B8C(a3);

}

- (void)as_viewWillBecomeFullyVisible
{
  _TtC8AppStore38InAppPurchaseInstallPageViewController *v2;

  v2 = self;
  sub_100219F38((SEL *)&selRef_as_viewWillBecomeFullyVisible, (unsigned int *)&enum case for StoreViewControllerLifecycleEvent.willAppear(_:));

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC8AppStore38InAppPurchaseInstallPageViewController *v4;

  v4 = self;
  sub_100219D78(a3);

}

- (void)as_viewDidBecomeFullyVisible
{
  _TtC8AppStore38InAppPurchaseInstallPageViewController *v2;

  v2 = self;
  sub_100219F38((SEL *)&selRef_as_viewDidBecomeFullyVisible, (unsigned int *)&enum case for StoreViewControllerLifecycleEvent.didAppear(_:));

}

- (void)as_viewWillBecomePartiallyVisible
{
  _TtC8AppStore38InAppPurchaseInstallPageViewController *v2;

  v2 = self;
  sub_10021A0CC();

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC8AppStore38InAppPurchaseInstallPageViewController *v4;

  v4 = self;
  sub_10021A260(a3);

}

- (void)as_viewDidBecomePartiallyVisible
{
  _TtC8AppStore38InAppPurchaseInstallPageViewController *v2;

  v2 = self;
  sub_100219F38((SEL *)&selRef_as_viewDidBecomePartiallyVisible, (unsigned int *)&enum case for StoreViewControllerLifecycleEvent.didDisappear(_:));

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC8AppStore38InAppPurchaseInstallPageViewController *v4;

  v4 = self;
  sub_10021A464(a3);

}

- (void)viewWillLayoutSubviews
{
  _TtC8AppStore38InAppPurchaseInstallPageViewController *v2;

  v2 = self;
  sub_10021A60C();

}

- (unint64_t)supportedInterfaceOrientations
{
  _TtC8AppStore38InAppPurchaseInstallPageViewController *v2;
  id v3;
  id v4;

  v2 = self;
  v3 = -[InAppPurchaseInstallPageViewController traitCollection](v2, "traitCollection");
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 == (id)1)
    return 30;
  else
    return 2;
}

- (void)askToBuyRequestNotificationReceived:(id)a3
{
  sub_10021CF1C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_10021C6D0);
}

- (void)didCompletePurchase:(id)a3
{
  sub_10021CF1C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_10021CA90);
}

- (_TtC8AppStore38InAppPurchaseInstallPageViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC8AppStore38InAppPurchaseInstallPageViewController *result;

  v4 = a4;
  result = (_TtC8AppStore38InAppPurchaseInstallPageViewController *)_swift_stdlib_reportUnimplementedInitializer("AppStore.InAppPurchaseInstallPageViewController", 47, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1000834F4((uint64_t)self + OBJC_IVAR____TtC8AppStore38InAppPurchaseInstallPageViewController_delegate);
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore38InAppPurchaseInstallPageViewController_presenter));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore38InAppPurchaseInstallPageViewController_objectGraph));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore38InAppPurchaseInstallPageViewController_artworkLoader));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore38InAppPurchaseInstallPageViewController_installOfferView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore38InAppPurchaseInstallPageViewController_preInstallFreeOfferView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore38InAppPurchaseInstallPageViewController_preInstallPaidOfferView));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore38InAppPurchaseInstallPageViewController_inAppPurchaseIntentAction));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC8AppStore38InAppPurchaseInstallPageViewController_activeView));
  sub_1000057AC((uint64_t)self + OBJC_IVAR____TtC8AppStore38InAppPurchaseInstallPageViewController_appAdamId, (uint64_t *)&unk_1008477F0);
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore38InAppPurchaseInstallPageViewController_pendingAction));
  sub_1000057AC((uint64_t)self + OBJC_IVAR____TtC8AppStore38InAppPurchaseInstallPageViewController_lifecycleObserver, (uint64_t *)&unk_10082B470);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore38InAppPurchaseInstallPageViewController_overlayViewController));
}

@end
