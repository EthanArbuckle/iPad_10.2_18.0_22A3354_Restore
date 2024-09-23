@implementation AudioVisualizationRingLayer

- (_TtC15ConversationKit27AudioVisualizationRingLayer)initWithLayer:(id)a3
{
  uint64_t v4;

  swift_unknownObjectRetain();
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  return (_TtC15ConversationKit27AudioVisualizationRingLayer *)AudioVisualizationRingLayer.init(layer:)((uint64_t)&v4);
}

- (_TtC15ConversationKit27AudioVisualizationRingLayer)initWithCoder:(id)a3
{
  AudioVisualizationRingLayer.init(coder:)();
}

- (float)opacity
{
  _TtC15ConversationKit27AudioVisualizationRingLayer *v2;
  float v3;

  v2 = self;
  v3 = AudioVisualizationRingLayer.opacity.getter();

  return v3;
}

- (void)setOpacity:(float)a3
{
  _TtC15ConversationKit27AudioVisualizationRingLayer *v4;

  v4 = self;
  AudioVisualizationRingLayer.opacity.setter(a3);

}

- (CGRect)bounds
{
  _TtC15ConversationKit27AudioVisualizationRingLayer *v2;
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
  AudioVisualizationRingLayer.bounds.getter();
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
  _TtC15ConversationKit27AudioVisualizationRingLayer *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  AudioVisualizationRingLayer.bounds.setter(x, y, width, height);

}

- (_TtC15ConversationKit27AudioVisualizationRingLayer)init
{
  AudioVisualizationRingLayer.init()();
}

@end
