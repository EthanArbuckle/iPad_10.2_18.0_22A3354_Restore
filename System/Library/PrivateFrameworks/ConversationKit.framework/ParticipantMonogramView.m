@implementation ParticipantMonogramView

- (UIButton)ringButton
{
  return (UIButton *)ParticipantMonogramView.ringButton.getter();
}

- (void)setRingButton:(id)a3
{
  id v4;
  _TtC15ConversationKit23ParticipantMonogramView *v5;

  v4 = a3;
  v5 = self;
  ParticipantMonogramView.ringButton.setter((uint64_t)v4);

}

- (_TtC15ConversationKit33ParticipantViewLabelContainerView)titleLabelContainer
{
  return (_TtC15ConversationKit33ParticipantViewLabelContainerView *)ParticipantMonogramView.titleLabelContainer.getter();
}

- (_TtC15ConversationKit33ParticipantViewLabelContainerView)subtitleLabelContainer
{
  return (_TtC15ConversationKit33ParticipantViewLabelContainerView *)ParticipantMonogramView.subtitleLabelContainer.getter();
}

- (_TtC15ConversationKit23ParticipantMonogramView)init
{
  ParticipantMonogramView.init()();
}

- (_TtC15ConversationKit23ParticipantMonogramView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  ParticipantMonogramView.init(coder:)();
}

- (_TtC15ConversationKit23ParticipantMonogramView)initWithFrame:(CGRect)a3
{
  ParticipantMonogramView.init(frame:)();
}

- (void)layoutSubviews
{
  _TtC15ConversationKit23ParticipantMonogramView *v2;

  v2 = self;
  ParticipantMonogramView.layoutSubviews()();

}

- (void)didTapRingButton
{
  _TtC15ConversationKit23ParticipantMonogramView *v2;

  v2 = self;
  ParticipantMonogramView.didTapRingButton()();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit23ParticipantMonogramView_contactView));
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit23ParticipantMonogramView_glowClippingView);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit23ParticipantMonogramView_glowView);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit23ParticipantMonogramView_audioVisualizationView);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit23ParticipantMonogramView_ringButton);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit23ParticipantMonogramView_titleLabelContainer);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit23ParticipantMonogramView_subtitleLabelContainer);
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit23ParticipantMonogramView_delegate);
  swift_release();
}

@end
