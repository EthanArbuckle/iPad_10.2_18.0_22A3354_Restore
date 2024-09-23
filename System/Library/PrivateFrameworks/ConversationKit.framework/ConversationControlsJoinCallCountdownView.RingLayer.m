@implementation ConversationControlsJoinCallCountdownView.RingLayer

- (double)percentage
{
  double result;

  ConversationControlsJoinCallCountdownView.RingLayer.percentage.getter();
  return result;
}

- (void)setPercentage:(double)a3
{
  _TtCC15ConversationKit41ConversationControlsJoinCallCountdownView9RingLayer *v4;

  v4 = self;
  ConversationControlsJoinCallCountdownView.RingLayer.percentage.setter(a3);

}

- (_TtCC15ConversationKit41ConversationControlsJoinCallCountdownView9RingLayer)init
{
  return (_TtCC15ConversationKit41ConversationControlsJoinCallCountdownView9RingLayer *)ConversationControlsJoinCallCountdownView.RingLayer.init()();
}

- (_TtCC15ConversationKit41ConversationControlsJoinCallCountdownView9RingLayer)initWithLayer:(id)a3
{
  _TtCC15ConversationKit41ConversationControlsJoinCallCountdownView9RingLayer *result;

  @objc ConversationControlsJoinCallCountdownView.RingLayer.init(layer:)((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t *))ConversationControlsJoinCallCountdownView.RingLayer.init(layer:));
  return result;
}

- (_TtCC15ConversationKit41ConversationControlsJoinCallCountdownView9RingLayer)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  ConversationControlsJoinCallCountdownView.RingLayer.init(coder:)();
}

+ (BOOL)needsDisplayForKey:(id)a3
{
  char v3;

  static String._unconditionallyBridgeFromObjectiveC(_:)();
  swift_getObjCClassMetadata();
  v3 = static ConversationControlsJoinCallCountdownView.RingLayer.needsDisplay(forKey:)();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

- (id)actionForKey:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtCC15ConversationKit41ConversationControlsJoinCallCountdownView9RingLayer *v7;
  void *v8;
  void *v9;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v6 = v5;
  v7 = self;
  ConversationControlsJoinCallCountdownView.RingLayer.action(forKey:)(v4, v6);
  v9 = v8;

  swift_bridgeObjectRelease();
  return v9;
}

- (void)drawInContext:(CGContext *)a3
{
  CGContext *v4;
  _TtCC15ConversationKit41ConversationControlsJoinCallCountdownView9RingLayer *v5;

  v4 = a3;
  v5 = self;
  ConversationControlsJoinCallCountdownView.RingLayer.draw(in:)(v4);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtCC15ConversationKit41ConversationControlsJoinCallCountdownView9RingLayer_fillColor));
  OUTLINED_FUNCTION_23_77(*(id *)((char *)&self->super.super.isa
                                + OBJC_IVAR____TtCC15ConversationKit41ConversationControlsJoinCallCountdownView9RingLayer_strokeColor));
}

@end
