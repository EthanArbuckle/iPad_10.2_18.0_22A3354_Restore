@implementation InAppPurchaseInstallPageViewController

- (_TtC22SubscribePageExtension38InAppPurchaseInstallPageViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1004BB184();
}

- (void)willEnterForeground
{
  __n128 v2;
  _TtC22SubscribePageExtension38InAppPurchaseInstallPageViewController *v3;

  v3 = self;
  sub_1004B6F84(1, v2);
  *((_BYTE *)&v3->super.super.super.isa
  + OBJC_IVAR____TtC22SubscribePageExtension38InAppPurchaseInstallPageViewController_isInBackground) = 0;

}

- (void)didEnterBackground
{
  __n128 v2;
  _TtC22SubscribePageExtension38InAppPurchaseInstallPageViewController *v3;

  v3 = self;
  sub_1004B6F84(0, v2);
  *((_BYTE *)&v3->super.super.super.isa
  + OBJC_IVAR____TtC22SubscribePageExtension38InAppPurchaseInstallPageViewController_isInBackground) = 1;
  *((_BYTE *)&v3->super.super.super.isa
  + OBJC_IVAR____TtC22SubscribePageExtension38InAppPurchaseInstallPageViewController_didProgressWhileForegrounded) = 0;

}

- (void)viewDidLoad
{
  _TtC22SubscribePageExtension38InAppPurchaseInstallPageViewController *v2;

  v2 = self;
  sub_1004B7620();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC22SubscribePageExtension38InAppPurchaseInstallPageViewController *v4;

  v4 = self;
  sub_1004B7714(a3);

}

- (void)as_viewWillBecomeFullyVisible
{
  _TtC22SubscribePageExtension38InAppPurchaseInstallPageViewController *v2;

  v2 = self;
  sub_1004B7AC0((SEL *)&selRef_as_viewWillBecomeFullyVisible, (unsigned int *)&enum case for StoreViewControllerLifecycleEvent.willAppear(_:));

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC22SubscribePageExtension38InAppPurchaseInstallPageViewController *v4;

  v4 = self;
  sub_1004B7900(a3);

}

- (void)as_viewDidBecomeFullyVisible
{
  _TtC22SubscribePageExtension38InAppPurchaseInstallPageViewController *v2;

  v2 = self;
  sub_1004B7AC0((SEL *)&selRef_as_viewDidBecomeFullyVisible, (unsigned int *)&enum case for StoreViewControllerLifecycleEvent.didAppear(_:));

}

- (void)as_viewWillBecomePartiallyVisible
{
  _TtC22SubscribePageExtension38InAppPurchaseInstallPageViewController *v2;

  v2 = self;
  sub_1004B7C54();

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC22SubscribePageExtension38InAppPurchaseInstallPageViewController *v4;

  v4 = self;
  sub_1004B7DE8(a3);

}

- (void)as_viewDidBecomePartiallyVisible
{
  _TtC22SubscribePageExtension38InAppPurchaseInstallPageViewController *v2;

  v2 = self;
  sub_1004B7AC0((SEL *)&selRef_as_viewDidBecomePartiallyVisible, (unsigned int *)&enum case for StoreViewControllerLifecycleEvent.didDisappear(_:));

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC22SubscribePageExtension38InAppPurchaseInstallPageViewController *v4;

  v4 = self;
  sub_1004B7FEC(a3);

}

- (void)viewWillLayoutSubviews
{
  _TtC22SubscribePageExtension38InAppPurchaseInstallPageViewController *v2;

  v2 = self;
  sub_1004B8194();

}

- (unint64_t)supportedInterfaceOrientations
{
  _TtC22SubscribePageExtension38InAppPurchaseInstallPageViewController *v2;
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
  sub_1004BAAA4(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_1004BA258);
}

- (void)didCompletePurchase:(id)a3
{
  sub_1004BAAA4(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_1004BA618);
}

- (_TtC22SubscribePageExtension38InAppPurchaseInstallPageViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC22SubscribePageExtension38InAppPurchaseInstallPageViewController *result;

  v4 = a4;
  result = (_TtC22SubscribePageExtension38InAppPurchaseInstallPageViewController *)_swift_stdlib_reportUnimplementedInitializer("SubscribePageExtension.InAppPurchaseInstallPageViewController", 61, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100010E34((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension38InAppPurchaseInstallPageViewController_delegate);
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC22SubscribePageExtension38InAppPurchaseInstallPageViewController_presenter));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC22SubscribePageExtension38InAppPurchaseInstallPageViewController_objectGraph));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC22SubscribePageExtension38InAppPurchaseInstallPageViewController_artworkLoader));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension38InAppPurchaseInstallPageViewController_installOfferView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension38InAppPurchaseInstallPageViewController_preInstallFreeOfferView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension38InAppPurchaseInstallPageViewController_preInstallPaidOfferView));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC22SubscribePageExtension38InAppPurchaseInstallPageViewController_inAppPurchaseIntentAction));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC22SubscribePageExtension38InAppPurchaseInstallPageViewController_activeView));
  sub_100011088((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension38InAppPurchaseInstallPageViewController_appAdamId, (uint64_t *)&unk_1008083B0);
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC22SubscribePageExtension38InAppPurchaseInstallPageViewController_pendingAction));
  sub_100011088((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension38InAppPurchaseInstallPageViewController_lifecycleObserver, (uint64_t *)&unk_100802A10);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension38InAppPurchaseInstallPageViewController_overlayViewController));
}

@end
