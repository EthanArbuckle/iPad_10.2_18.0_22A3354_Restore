@implementation CAFUISegmentedControl

- (void)layoutSubviews
{
  id v2;
  double v3;
  double v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CAFUISegmentedControl();
  v2 = v5.receiver;
  -[CAFUISegmentedControl layoutSubviews](&v5, sel_layoutSubviews);
  objc_msgSend(v2, sel_frame, v5.receiver, v5.super_class);
  v4 = v3;
  if (one-time initialization token for targetHeight != -1)
    swift_once();
  if (v4 != *(double *)&static CAFUISegmentedControl.targetHeight)
  {
    objc_msgSend(v2, sel_frame);
    objc_msgSend(v2, sel_setFrame_, 0.0, 0.0);
  }

}

- (_TtC5CAFUI21CAFUISegmentedControl)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for CAFUISegmentedControl();
  return -[CAFUISegmentedControl initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC5CAFUI21CAFUISegmentedControl)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CAFUISegmentedControl();
  return -[CAFUISegmentedControl initWithCoder:](&v5, sel_initWithCoder_, a3);
}

- (_TtC5CAFUI21CAFUISegmentedControl)initWithItems:(id)a3
{
  NSArray v4;
  _TtC5CAFUI21CAFUISegmentedControl *v5;
  objc_super v7;

  if (a3)
  {
    static Array._unconditionallyBridgeFromObjectiveC(_:)();
    v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.isa = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for CAFUISegmentedControl();
  v5 = -[CAFUISegmentedControl initWithItems:](&v7, sel_initWithItems_, v4.super.isa);

  return v5;
}

@end
