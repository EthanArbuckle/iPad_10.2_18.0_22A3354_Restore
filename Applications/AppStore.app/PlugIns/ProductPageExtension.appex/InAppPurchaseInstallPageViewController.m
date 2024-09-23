@implementation InAppPurchaseInstallPageViewController

- (_TtC20ProductPageExtension38InAppPurchaseInstallPageViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1000B87C0();
}

- (void)willEnterForeground
{
  __n128 v2;
  _TtC20ProductPageExtension38InAppPurchaseInstallPageViewController *v3;

  v3 = self;
  sub_1000B4480(1, v2);
  *((_BYTE *)&v3->super.super.super.isa
  + OBJC_IVAR____TtC20ProductPageExtension38InAppPurchaseInstallPageViewController_isInBackground) = 0;

}

- (void)didEnterBackground
{
  __n128 v2;
  _TtC20ProductPageExtension38InAppPurchaseInstallPageViewController *v3;

  v3 = self;
  sub_1000B4480(0, v2);
  *((_BYTE *)&v3->super.super.super.isa
  + OBJC_IVAR____TtC20ProductPageExtension38InAppPurchaseInstallPageViewController_isInBackground) = 1;
  *((_BYTE *)&v3->super.super.super.isa
  + OBJC_IVAR____TtC20ProductPageExtension38InAppPurchaseInstallPageViewController_didProgressWhileForegrounded) = 0;

}

- (void)viewDidLoad
{
  _TtC20ProductPageExtension38InAppPurchaseInstallPageViewController *v2;

  v2 = self;
  sub_1000B4B1C();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC20ProductPageExtension38InAppPurchaseInstallPageViewController *v4;

  v4 = self;
  sub_1000B4C10(a3);

}

- (void)as_viewWillBecomeFullyVisible
{
  _TtC20ProductPageExtension38InAppPurchaseInstallPageViewController *v2;

  v2 = self;
  sub_1000B4FBC((SEL *)&selRef_as_viewWillBecomeFullyVisible, (unsigned int *)&enum case for StoreViewControllerLifecycleEvent.willAppear(_:));

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC20ProductPageExtension38InAppPurchaseInstallPageViewController *v4;

  v4 = self;
  sub_1000B4DFC(a3);

}

- (void)as_viewDidBecomeFullyVisible
{
  _TtC20ProductPageExtension38InAppPurchaseInstallPageViewController *v2;

  v2 = self;
  sub_1000B4FBC((SEL *)&selRef_as_viewDidBecomeFullyVisible, (unsigned int *)&enum case for StoreViewControllerLifecycleEvent.didAppear(_:));

}

- (void)as_viewWillBecomePartiallyVisible
{
  _TtC20ProductPageExtension38InAppPurchaseInstallPageViewController *v2;

  v2 = self;
  sub_1000B5150();

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC20ProductPageExtension38InAppPurchaseInstallPageViewController *v4;

  v4 = self;
  sub_1000B52E4(a3);

}

- (void)as_viewDidBecomePartiallyVisible
{
  _TtC20ProductPageExtension38InAppPurchaseInstallPageViewController *v2;

  v2 = self;
  sub_1000B4FBC((SEL *)&selRef_as_viewDidBecomePartiallyVisible, (unsigned int *)&enum case for StoreViewControllerLifecycleEvent.didDisappear(_:));

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC20ProductPageExtension38InAppPurchaseInstallPageViewController *v4;

  v4 = self;
  sub_1000B54E8(a3);

}

- (void)viewWillLayoutSubviews
{
  _TtC20ProductPageExtension38InAppPurchaseInstallPageViewController *v2;

  v2 = self;
  sub_1000B5690();

}

- (unint64_t)supportedInterfaceOrientations
{
  _TtC20ProductPageExtension38InAppPurchaseInstallPageViewController *v2;
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
  sub_1000B7FA0(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_1000B7754);
}

- (void)didCompletePurchase:(id)a3
{
  sub_1000B7FA0(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_1000B7B14);
}

- (_TtC20ProductPageExtension38InAppPurchaseInstallPageViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC20ProductPageExtension38InAppPurchaseInstallPageViewController *result;

  v4 = a4;
  result = (_TtC20ProductPageExtension38InAppPurchaseInstallPageViewController *)_swift_stdlib_reportUnimplementedInitializer("ProductPageExtension.InAppPurchaseInstallPageViewController", 59, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100010D1C((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension38InAppPurchaseInstallPageViewController_delegate);
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension38InAppPurchaseInstallPageViewController_installOfferView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension38InAppPurchaseInstallPageViewController_preInstallFreeOfferView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension38InAppPurchaseInstallPageViewController_preInstallPaidOfferView));
  swift_release();
  swift_unknownObjectRelease();
  sub_100010F2C((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension38InAppPurchaseInstallPageViewController_appAdamId, &qword_100808390);
  swift_release();
  sub_100010F2C((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension38InAppPurchaseInstallPageViewController_lifecycleObserver, &qword_10080AFE0);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension38InAppPurchaseInstallPageViewController_overlayViewController));
}

@end
