@implementation CAFUIHeaderFooterView

- (_TtC5CAFUI21CAFUIHeaderFooterView)initWithReuseIdentifier:(id)a3
{
  uint64_t v4;
  void *v5;
  _TtC5CAFUI21CAFUIHeaderFooterView *v6;
  objc_super v8;

  if (a3)
  {
    v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v5 = (void *)MEMORY[0x23B812F68](v4);
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for CAFUIHeaderFooterView();
  v6 = -[CAFUIHeaderFooterView initWithReuseIdentifier:](&v8, sel_initWithReuseIdentifier_, v5);

  return v6;
}

- (_TtC5CAFUI21CAFUIHeaderFooterView)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CAFUIHeaderFooterView();
  return -[CAFUIHeaderFooterView initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end
