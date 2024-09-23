@implementation MomentsIndicatorBubble

- (_TtC15ConversationKit22MomentsIndicatorBubble)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  MomentsIndicatorBubble.init(coder:)();
}

- (void)start
{
  _TtC15ConversationKit22MomentsIndicatorBubble *v2;

  v2 = self;
  MomentsIndicatorBubble.start()();

}

- (NSString)description
{
  _TtC15ConversationKit22MomentsIndicatorBubble *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = self;
  v3 = MomentsIndicatorBubble.description.getter();
  v5 = v4;

  v6 = (void *)MEMORY[0x1C3B72E00](v3, v5);
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (_TtC15ConversationKit22MomentsIndicatorBubble)initWithFrame:(CGRect)a3
{
  MomentsIndicatorBubble.init(frame:)();
}

- (void).cxx_destruct
{
  swift_release();
  outlined destroy of MomentsIndicatorBubbleDelegate?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit22MomentsIndicatorBubble_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit22MomentsIndicatorBubble_bottomConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit22MomentsIndicatorBubble_indicator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit22MomentsIndicatorBubble_timer));
}

@end
