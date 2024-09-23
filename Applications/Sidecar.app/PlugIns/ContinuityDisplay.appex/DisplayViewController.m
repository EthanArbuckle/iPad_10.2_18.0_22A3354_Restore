@implementation DisplayViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  DisplayViewController *v2;

  v2 = self;
  sub_1000225A8();

}

- (UIView)displayView
{
  return (UIView *)sub_10002296C();
}

- (void)setDisplayView:(id)a3
{
  id v4;
  DisplayViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1000229C4((uint64_t)v4);

}

- (DisplayViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v5 = a4;
  return (DisplayViewController *)sub_100024CE8();
}

- (DisplayViewController)initWithCoder:(id)a3
{
  return (DisplayViewController *)sub_100024F4C(a3);
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___DisplayViewController_delegate));
  sub_100018C6C(OBJC_IVAR___DisplayViewController_touchController);
  sub_100018C6C(OBJC_IVAR___DisplayViewController_displayViewPointerInteraction);
  sub_100018C6C(OBJC_IVAR___DisplayViewController_displayView);
  swift_release(*(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___DisplayViewController_hidObserver));
  sub_100018C6C(OBJC_IVAR___DisplayViewController_session);
  sub_100018C6C(OBJC_IVAR___DisplayViewController_videoStream);

}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v5;

  sub_100025280((uint64_t)self, (uint64_t)a2, a5);
  return v5;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v6;
  id v7;
  DisplayViewController *v8;
  id v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_1000252B8();

  return v9;
}

@end
