@implementation ParticipantInfoView

- (_TtC15ConversationKit33ParticipantViewLabelContainerView)nameLabel
{
  return (_TtC15ConversationKit33ParticipantViewLabelContainerView *)ParticipantInfoView.nameLabel.getter();
}

- (BOOL)isMomentsAvailable
{
  char v2;

  ParticipantInfoView.isMomentsAvailable.getter();
  return v2 & 1;
}

- (void)setIsMomentsAvailable:(BOOL)a3
{
  _TtC15ConversationKit19ParticipantInfoView *v4;

  v4 = self;
  ParticipantInfoView.isMomentsAvailable.setter(a3);

}

- (_TtC15ConversationKit19ParticipantInfoView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  ParticipantInfoView.init(coder:)();
}

- (void)layoutSubviews
{
  _TtC15ConversationKit19ParticipantInfoView *v2;

  v2 = self;
  ParticipantInfoView.layoutSubviews()();

}

- (void)didTapExpandButton
{
  _TtC15ConversationKit19ParticipantInfoView *v2;

  v2 = self;
  ParticipantInfoView.didTapExpandButton()();

}

- (void)didTapShutterButton
{
  _TtC15ConversationKit19ParticipantInfoView *v2;

  v2 = self;
  ParticipantInfoView.didTapShutterButton()();

}

- (_TtC15ConversationKit19ParticipantInfoView)initWithFrame:(CGRect)a3
{
  ParticipantInfoView.init(frame:)();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit19ParticipantInfoView_gradientView));
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit19ParticipantInfoView_nameLabel);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit19ParticipantInfoView_shutterButton);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit19ParticipantInfoView_expandButton);
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit19ParticipantInfoView_delegate);
}

@end
