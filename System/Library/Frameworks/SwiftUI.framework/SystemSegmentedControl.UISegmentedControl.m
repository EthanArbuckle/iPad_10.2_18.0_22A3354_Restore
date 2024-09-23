@implementation SystemSegmentedControl.UISegmentedControl

- (_TtCV7SwiftUIP33_D74FE142C3C5A6C2CEA4987A69AEBD7522SystemSegmentedControl18UISegmentedControl)initWithFrame:(CGRect)a3
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
  v8.super_class = (Class)swift_getObjectType();
  return -[SystemSegmentedControl.UISegmentedControl initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtCV7SwiftUIP33_D74FE142C3C5A6C2CEA4987A69AEBD7522SystemSegmentedControl18UISegmentedControl)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return -[SystemSegmentedControl.UISegmentedControl initWithCoder:](&v5, sel_initWithCoder_, a3);
}

- (_TtCV7SwiftUIP33_D74FE142C3C5A6C2CEA4987A69AEBD7522SystemSegmentedControl18UISegmentedControl)initWithItems:(id)isa
{
  objc_class *ObjectType;
  _TtCV7SwiftUIP33_D74FE142C3C5A6C2CEA4987A69AEBD7522SystemSegmentedControl18UISegmentedControl *v6;
  objc_super v8;

  ObjectType = (objc_class *)swift_getObjectType();
  if (isa)
  {
    static Array._unconditionallyBridgeFromObjectiveC(_:)();
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  v8.receiver = self;
  v8.super_class = ObjectType;
  v6 = -[SystemSegmentedControl.UISegmentedControl initWithItems:](&v8, sel_initWithItems_, isa);

  return v6;
}

@end
