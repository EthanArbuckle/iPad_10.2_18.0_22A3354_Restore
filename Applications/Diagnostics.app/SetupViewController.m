@implementation SetupViewController

- (void)viewWillAppear:(BOOL)a3
{
  _TtC11Diagnostics19SetupViewController *v4;

  v4 = self;
  sub_10002FCB4(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC11Diagnostics19SetupViewController *v4;

  v4 = self;
  sub_100030088(a3);

}

- (void)applicationWillSuspend
{
  _TtC11Diagnostics19SetupViewController *v2;

  v2 = self;
  sub_10003304C();

}

- (void)applicationDidResume
{
  _TtC11Diagnostics19SetupViewController *v2;

  v2 = self;
  sub_1000330F4();

}

- (_TtC11Diagnostics19SetupViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC11Diagnostics19SetupViewController *)sub_100033900(v5, v7, a4);
}

- (_TtC11Diagnostics19SetupViewController)initWithCoder:(id)a3
{
  return (_TtC11Diagnostics19SetupViewController *)sub_100033AE4(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics19SetupViewController_loadingViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics19SetupViewController_termsAndConditionsViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics19SetupViewController____lazy_storage___noSessionNavigationController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics19SetupViewController____lazy_storage___storageFullscreenAlertViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics19SetupViewController____lazy_storage___diagnosticsCompletedNavigationController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics19SetupViewController____lazy_storage___enhancedLoggingCompletedNavigationController));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC11Diagnostics19SetupViewController_onScreenErrors));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics19SetupViewController_currentViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics19SetupViewController_retryTimer));
}

@end
