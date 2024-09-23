@implementation DisplayModalAlert

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC17ContinuityDisplay17DisplayModalAlert)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10001D88C();
}

- (void)loadView
{
  _TtC17ContinuityDisplay17DisplayModalAlert *v2;

  v2 = self;
  sub_10001D984();

}

- (void)_disconnectPressedWithSender:(id)a3
{
  id v4;
  _TtC17ContinuityDisplay17DisplayModalAlert *v5;

  v4 = a3;
  v5 = self;
  sub_10001E28C();

}

- (_TtC17ContinuityDisplay17DisplayModalAlert)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v5 = a4;
  sub_10001E324();
}

- (void).cxx_destruct
{
  sub_1000189E4((uint64_t)self + OBJC_IVAR____TtC17ContinuityDisplay17DisplayModalAlert_delegate, (uint64_t)a2);
  swift_errorRelease(*(Class *)((char *)&self->super.super.super.isa
                              + OBJC_IVAR____TtC17ContinuityDisplay17DisplayModalAlert_error));
  sub_100018C6C(OBJC_IVAR____TtC17ContinuityDisplay17DisplayModalAlert_disconnectButton);
  sub_100018C6C(OBJC_IVAR____TtC17ContinuityDisplay17DisplayModalAlert_mainLabel);
  sub_100018C6C(OBJC_IVAR____TtC17ContinuityDisplay17DisplayModalAlert_secondaryLabel);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17ContinuityDisplay17DisplayModalAlert_debugLabel));
}

@end
