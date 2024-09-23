@implementation Sidebar.ViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtCO17ContinuityDisplay7Sidebar14ViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100019E3C();
}

- (void)loadView
{
  _TtCO17ContinuityDisplay7Sidebar14ViewController *v2;

  v2 = self;
  sub_100019F0C();

}

- (void)_actionButtonPressed:(id)a3
{
  id v4;
  _TtCO17ContinuityDisplay7Sidebar14ViewController *v5;

  v4 = a3;
  v5 = self;
  sub_10001A8A0();

}

- (void)_stateButtonPressed:(id)a3
{
  id v4;
  _TtCO17ContinuityDisplay7Sidebar14ViewController *v5;

  v4 = a3;
  v5 = self;
  sub_10001A944();

}

- (void)_toggleButtonDown:(id)a3
{
  id v4;
  _TtCO17ContinuityDisplay7Sidebar14ViewController *v5;

  v4 = a3;
  v5 = self;
  sub_10001AA08(v4);

}

- (void)_toggleButtonUpIn:(id)a3
{
  id v4;
  _TtCO17ContinuityDisplay7Sidebar14ViewController *v5;

  v4 = a3;
  v5 = self;
  sub_10001AA84(v4);

}

- (_TtCO17ContinuityDisplay7Sidebar14ViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v5 = a4;
  sub_10001B4A8();
}

- (void).cxx_destruct
{
  sub_1000189E4((uint64_t)self + OBJC_IVAR____TtCO17ContinuityDisplay7Sidebar14ViewController_delegate, (uint64_t)a2);
  sub_100018C6C(OBJC_IVAR____TtCO17ContinuityDisplay7Sidebar14ViewController_stack);
  sub_100018C6C(OBJC_IVAR____TtCO17ContinuityDisplay7Sidebar14ViewController_topStack);
  sub_100018C6C(OBJC_IVAR____TtCO17ContinuityDisplay7Sidebar14ViewController_centerStack);
  sub_100018C6C(OBJC_IVAR____TtCO17ContinuityDisplay7Sidebar14ViewController_bottomStack);
  sub_100018C6C(OBJC_IVAR____TtCO17ContinuityDisplay7Sidebar14ViewController_topMarginConstraint);
  sub_100018C6C(OBJC_IVAR____TtCO17ContinuityDisplay7Sidebar14ViewController_bottomMarginConstraint);
  sub_100018C6C(OBJC_IVAR____TtCO17ContinuityDisplay7Sidebar14ViewController_widthConstraint);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtCO17ContinuityDisplay7Sidebar14ViewController_buttonIdentifiers));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtCO17ContinuityDisplay7Sidebar14ViewController_buttonsByIdentifer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCO17ContinuityDisplay7Sidebar14ViewController__lastDownButton));
}

@end
