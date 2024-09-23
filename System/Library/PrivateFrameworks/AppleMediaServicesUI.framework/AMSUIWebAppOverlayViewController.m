@implementation AMSUIWebAppOverlayViewController

- (AMSUIWebAppOverlayViewController)initWithAppAdamID:(id)a3 hostBundleIdentifier:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = sub_21124639C();
  v6 = v5;
  v7 = sub_21124639C();
  return (AMSUIWebAppOverlayViewController *)sub_2111CA748(v4, v6, v7, v8);
}

- (AMSUIWebAppOverlayViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    sub_21124639C();
  v5 = a4;
  sub_2111CA874();
}

- (AMSUIWebAppOverlayViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_2111CA92C();
}

- (void)loadView
{
  AMSUIWebAppOverlayViewController *v2;

  v2 = self;
  sub_2111CA9D4();

}

- (id)preload
{
  AMSUIWebAppOverlayViewController *v2;
  id v3;

  v2 = self;
  v3 = sub_2111CB454();

  return v3;
}

- (void)viewDidLayoutSubviews
{
  AMSUIWebAppOverlayViewController *v2;

  v2 = self;
  sub_2111CB4B0();

}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___AMSUIWebAppOverlayViewController_lockupViewPromise));
}

- (id)presentingViewControllerForLockupView:(id)a3
{
  id v4;
  AMSUIWebAppOverlayViewController *v5;

  v4 = a3;
  v5 = self;
  sub_2111CB6AC();
}

- (void)lockupViewDidBeginRequest:(id)a3
{
  id v4;

  v4 = a3;
  self;
  sub_2111CB824();
}

- (void)lockupViewDidFinishRequest:(id)a3
{
  id v4;

  v4 = a3;
  self;
  sub_2111CB988();
}

- (void)lockupView:(id)a3 didFailRequestWithError:(id)a4
{
  id v6;
  AMSUIWebAppOverlayViewController *v7;

  v6 = a3;
  a4;
  v7 = self;
  sub_2111CBB4C();
}

@end
