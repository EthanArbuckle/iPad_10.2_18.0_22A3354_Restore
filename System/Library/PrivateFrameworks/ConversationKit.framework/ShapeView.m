@implementation ShapeView

+ (Class)layerClass
{
  static ShapeView.layerClass.getter();
  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC15ConversationKit9ShapeView)initWithFrame:(CGRect)a3
{
  return (_TtC15ConversationKit9ShapeView *)ShapeView.init(frame:)();
}

- (_TtC15ConversationKit9ShapeView)initWithCoder:(id)a3
{
  _TtC15ConversationKit9ShapeView *result;

  ShapeView.init(coder:)((uint64_t)a3);
  return result;
}

@end
