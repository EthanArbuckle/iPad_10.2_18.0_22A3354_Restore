@implementation ControlDragWindow.ControlDragViewController

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (_TtCC15ControlCenterUI17ControlDragWindowP33_DBABBCE4349E03AF86A0E6B1A7346F4125ControlDragViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _TtCC15ControlCenterUI17ControlDragWindowP33_DBABBCE4349E03AF86A0E6B1A7346F4125ControlDragViewController *v9;
  objc_super v11;

  if (a3)
  {
    sub_1CFBFA894();
    v6 = a4;
    v7 = (void *)sub_1CFBFA870();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = a4;
    v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for ControlDragWindow.ControlDragViewController();
  v9 = -[ControlDragWindow.ControlDragViewController initWithNibName:bundle:](&v11, sel_initWithNibName_bundle_, v7, a4);

  return v9;
}

- (_TtCC15ControlCenterUI17ControlDragWindowP33_DBABBCE4349E03AF86A0E6B1A7346F4125ControlDragViewController)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ControlDragWindow.ControlDragViewController();
  return -[ControlDragWindow.ControlDragViewController initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end
