@implementation ConversationControlsJoinCallCountdownView.CountingLayer

- (int64_t)value
{
  int64_t result;

  ConversationControlsJoinCallCountdownView.CountingLayer.value.getter();
  return result;
}

- (void)setValue:(int64_t)a3
{
  _TtCC15ConversationKit41ConversationControlsJoinCallCountdownView13CountingLayer *v4;

  v4 = self;
  ConversationControlsJoinCallCountdownView.CountingLayer.value.setter(a3);

}

- (_TtCC15ConversationKit41ConversationControlsJoinCallCountdownView13CountingLayer)init
{
  _TtCC15ConversationKit41ConversationControlsJoinCallCountdownView13CountingLayer *result;

  ConversationControlsJoinCallCountdownView.CountingLayer.init()();
  return result;
}

- (_TtCC15ConversationKit41ConversationControlsJoinCallCountdownView13CountingLayer)initWithLayer:(id)a3
{
  _TtCC15ConversationKit41ConversationControlsJoinCallCountdownView13CountingLayer *result;

  @objc ConversationControlsJoinCallCountdownView.RingLayer.init(layer:)((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t *))ConversationControlsJoinCallCountdownView.CountingLayer.init(layer:));
  return result;
}

- (_TtCC15ConversationKit41ConversationControlsJoinCallCountdownView13CountingLayer)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  ConversationControlsJoinCallCountdownView.CountingLayer.init(coder:)();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC15ConversationKit41ConversationControlsJoinCallCountdownView13CountingLayer_valueFont));
}

@end
