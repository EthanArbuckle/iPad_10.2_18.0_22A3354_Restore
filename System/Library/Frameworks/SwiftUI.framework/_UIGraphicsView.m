@implementation _UIGraphicsView

- (_TtC7SwiftUI15_UIGraphicsView)initWithFrame:(CGRect)a3
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
  v8.super_class = (Class)type metadata accessor for _UIGraphicsView();
  return -[_UIGraphicsView initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC7SwiftUI15_UIGraphicsView *v7;
  id v8;
  unsigned int v9;
  void *v10;
  BOOL v11;
  objc_super v13;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v6 = v5;
  v7 = self;
  v8 = -[_UIGraphicsView layer](v7, sel_layer);
  v9 = objc_msgSend(v8, sel_hasBeenCommitted);

  if (v9)
  {
    v10 = (void *)MEMORY[0x18D75CC88](v4, v6);
    v13.receiver = v7;
    v13.super_class = (Class)type metadata accessor for _UIGraphicsView();
    v11 = -[_UIGraphicsView _shouldAnimatePropertyWithKey:](&v13, sel__shouldAnimatePropertyWithKey_, v10);

    swift_bridgeObjectRelease();
  }
  else
  {

    swift_bridgeObjectRelease();
    return 0;
  }
  return v11;
}

- (_TtC7SwiftUI15_UIGraphicsView)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for _UIGraphicsView();
  return -[_UIGraphicsView initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end
