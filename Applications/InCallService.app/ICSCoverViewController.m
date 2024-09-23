@implementation ICSCoverViewController

- (ICSCoverViewController)initWithCallDisplayStyleManager:(id)a3
{
  return (ICSCoverViewController *)sub_10017EEE8(a3);
}

- (ICSCoverViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10017F020();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  ICSCoverViewController *v2;

  v2 = self;
  sub_10017F0F4();

}

- (void)updateViews
{
  ICSCoverViewController *v2;

  v2 = self;
  sub_10017F490();

}

- (ICSCoverViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v5 = a4;
  sub_10017F8B4();
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICSCoverViewController_callParticipantsViewController));

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR___ICSCoverViewController_layoutGuideConstraints));
}

@end
