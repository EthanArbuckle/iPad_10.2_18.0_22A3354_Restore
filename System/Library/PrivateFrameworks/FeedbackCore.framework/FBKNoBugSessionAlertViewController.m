@implementation FBKNoBugSessionAlertViewController

+ (void)showInController:(id)a3 forDevice:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  _s12FeedbackCore34FBKNoBugSessionAlertViewControllerC06showInH0_9forDeviceySo06UIViewH0C_So010FBKGroupedL0CtFZ_0(v5);

}

- (_TtC12FeedbackCore34FBKNoBugSessionAlertViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _TtC12FeedbackCore34FBKNoBugSessionAlertViewController *v9;
  objc_super v11;

  if (a3)
  {
    sub_21DAC481C();
    v6 = a4;
    v7 = (void *)sub_21DAC4810();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = a4;
    v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for FBKNoBugSessionAlertViewController();
  v9 = -[FBKNoBugSessionAlertViewController initWithNibName:bundle:](&v11, sel_initWithNibName_bundle_, v7, a4);

  return v9;
}

- (_TtC12FeedbackCore34FBKNoBugSessionAlertViewController)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FBKNoBugSessionAlertViewController();
  return -[FBKNoBugSessionAlertViewController initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end
