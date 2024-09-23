@implementation ParticipantViewLabelContainerView

- (UILabel)label
{
  return (UILabel *)ParticipantViewLabelContainerView.label.getter();
}

- (_TtC15ConversationKit33ParticipantViewLabelContainerView)initWithFrame:(CGRect)a3
{
  return (_TtC15ConversationKit33ParticipantViewLabelContainerView *)ParticipantViewLabelContainerView.init(frame:)();
}

- (CGSize)intrinsicContentSize
{
  _TtC15ConversationKit33ParticipantViewLabelContainerView *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  v2 = self;
  v3 = ParticipantViewLabelContainerView.intrinsicContentSize.getter((uint64_t)v2);
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (_TtC15ConversationKit33ParticipantViewLabelContainerView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  ParticipantViewLabelContainerView.init(coder:)();
}

+ (Class)layerClass
{
  static ParticipantViewLabelContainerView.layerClass.getter();
  return (Class)swift_getObjCClassFromMetadata();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit33ParticipantViewLabelContainerView_label));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
