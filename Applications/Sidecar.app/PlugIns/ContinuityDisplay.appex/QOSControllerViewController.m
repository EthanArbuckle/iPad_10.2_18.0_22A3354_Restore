@implementation QOSControllerViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC17ContinuityDisplay27QOSControllerViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10000F7DC();
}

- (void)loadView
{
  _TtC17ContinuityDisplay27QOSControllerViewController *v2;

  v2 = self;
  sub_10000F89C();

}

- (_TtC17ContinuityDisplay27QOSControllerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v5 = a4;
  sub_10000FD8C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17ContinuityDisplay27QOSControllerViewController_stack));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17ContinuityDisplay27QOSControllerViewController_label));
  swift_bridgeObjectRelease(*(_QWORD *)&self->stack[OBJC_IVAR____TtC17ContinuityDisplay27QOSControllerViewController_connectionDescription]);
}

@end
