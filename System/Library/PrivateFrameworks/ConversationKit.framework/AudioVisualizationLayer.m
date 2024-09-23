@implementation AudioVisualizationLayer

- (_TtC15ConversationKit23AudioVisualizationLayer)init
{
  _TtC15ConversationKit23AudioVisualizationLayer *result;

  AudioVisualizationLayer.init()();
  return result;
}

- (_TtC15ConversationKit23AudioVisualizationLayer)initWithLayer:(id)a3
{
  uint64_t v4;

  swift_unknownObjectRetain();
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  return (_TtC15ConversationKit23AudioVisualizationLayer *)AudioVisualizationLayer.init(layer:)((uint64_t)&v4);
}

- (_TtC15ConversationKit23AudioVisualizationLayer)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  AudioVisualizationLayer.init(coder:)();
}

- (void)dealloc
{
  _TtC15ConversationKit23AudioVisualizationLayer *v2;

  v2 = self;
  AudioVisualizationLayer.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

- (CGRect)bounds
{
  _TtC15ConversationKit23AudioVisualizationLayer *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  v2 = self;
  AudioVisualizationLayer.bounds.getter();
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC15ConversationKit23AudioVisualizationLayer *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  AudioVisualizationLayer.bounds.setter(x, y, width, height);

}

- (void)addAnimation:(id)a3 forKey:(id)a4
{
  void *v6;
  uint32_t v7;
  uint32_t v8;
  objc_class *v9;
  _TtC15ConversationKit23AudioVisualizationLayer *v10;
  Swift::String_optional v11;
  CAAnimation v12;

  if (a4)
  {
    v6 = (void *)static String._unconditionallyBridgeFromObjectiveC(_:)();
    v8 = v7;
  }
  else
  {
    v6 = 0;
    v8 = 0;
  }
  v9 = (objc_class *)a3;
  v10 = self;
  v12.super.isa = v9;
  v12._attr = v6;
  v12._flags = v8;
  AudioVisualizationLayer.add(_:forKey:)(v12, v11);

  swift_bridgeObjectRelease();
}

@end
