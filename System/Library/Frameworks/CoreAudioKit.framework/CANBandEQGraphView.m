@implementation CANBandEQGraphView

- (void)tintColorDidChange
{
  _TtC12CoreAudioKit18CANBandEQGraphView *v2;

  v2 = self;
  sub_213196DE0();

}

- (void)doubleTapped:(id)a3
{
  id v4;
  _TtC12CoreAudioKit18CANBandEQGraphView *v5;

  v4 = a3;
  v5 = self;
  sub_213196F7C(v4);

}

- (_TtC12CoreAudioKit18CANBandEQGraphView)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CANBandEQGraphView();
  return -[CAAUEQGraphView initWithCoder:](&v5, sel_initWithCoder_, a3);
}

- (_TtC12CoreAudioKit18CANBandEQGraphView)initWithFrame:(CGRect)a3
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
  v8.super_class = (Class)type metadata accessor for CANBandEQGraphView();
  return -[CAAUEQGraphView initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

@end
