@implementation LocalParticipantView

- (_TtC15ConversationKit28LocalParticipantControlsView)controlsView
{
  return (_TtC15ConversationKit28LocalParticipantControlsView *)LocalParticipantView.controlsView.getter();
}

- (_TtC15ConversationKit20LocalParticipantView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  LocalParticipantView.init(coder:)();
}

- (_TtC15ConversationKit20LocalParticipantView)initWithFrame:(CGRect)a3
{
  LocalParticipantView.init(frame:)();
}

- (void)handleLongPress:(id)a3
{
  UILongPressGestureRecognizer *v4;
  _TtC15ConversationKit20LocalParticipantView *v5;

  v4 = (UILongPressGestureRecognizer *)a3;
  v5 = self;
  LocalParticipantView.handleLongPress(_:)(v4);

}

- (void)layoutSubviews
{
  _TtC15ConversationKit20LocalParticipantView *v2;

  v2 = self;
  LocalParticipantView.layoutSubviews()();

}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit20LocalParticipantView_participantView));
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit20LocalParticipantView_controlsView);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit20LocalParticipantView_countdownLabel);
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit20LocalParticipantView_delegate);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit20LocalParticipantView____lazy_storage___overlayBlurView);
  v3 = (char *)self + OBJC_IVAR____TtC15ConversationKit20LocalParticipantView__videoMessagingState;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<VideoMessageController.State>);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

- (void)updateCountdownWith:(int64_t)a3
{
  _TtC15ConversationKit20LocalParticipantView *v4;

  v4 = self;
  LocalParticipantView.updateCountdownWith(_:)(a3);

}

@end
