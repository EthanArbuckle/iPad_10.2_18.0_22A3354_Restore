@implementation ParticipantGridView

- (_TtC15ConversationKit19ParticipantGridView)init
{
  return (_TtC15ConversationKit19ParticipantGridView *)ParticipantGridView.init()();
}

- (_TtC15ConversationKit19ParticipantGridView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  ParticipantGridView.init(coder:)();
}

- (_TtC15ConversationKit19ParticipantGridView)initWithFrame:(CGRect)a3
{
  ParticipantGridView.init(frame:)();
}

- (void)layoutSubviews
{
  _TtC15ConversationKit19ParticipantGridView *v2;

  v2 = self;
  ParticipantGridView.layoutSubviews()();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC15ConversationKit19ParticipantGridView *v6;
  _TtC15ConversationKit19ParticipantGridView *v7;
  UITraitCollection_optional v8;

  v5 = a3;
  v6 = self;
  v8.is_nil = (char)v6;
  v7 = v6;
  v8.value.super.isa = (Class)a3;
  ParticipantGridView.traitCollectionDidChange(_:)(v8);

}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit19ParticipantGridView_unfocusedParticipantOverlay));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit19ParticipantGridView_featureFlags));
  OUTLINED_FUNCTION_9_42((uint64_t)self + OBJC_IVAR____TtC15ConversationKit19ParticipantGridView_currentlyFocusedParticipantIdentifier);
  OUTLINED_FUNCTION_9_42((uint64_t)self + OBJC_IVAR____TtC15ConversationKit19ParticipantGridView_mostProminentParticipantIdentifier);
  outlined destroy of ZStack<ModifiedContent<ConversationStatusView, _PaddingLayout>?>((uint64_t)self + OBJC_IVAR____TtC15ConversationKit19ParticipantGridView_fullScreenFocusedParticipantInfo, &demangling cache variable for type metadata for ParticipantGridView.FullScreenFocusedParticipantInfo?);
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit19ParticipantGridView_delegate);
  outlined destroy of ZStack<ModifiedContent<ConversationStatusView, _PaddingLayout>?>((uint64_t)self + OBJC_IVAR____TtC15ConversationKit19ParticipantGridView_currentAnimationInfo, &demangling cache variable for type metadata for ParticipantGridView.AnimationInfo?);
  swift_release();
  swift_bridgeObjectRelease();
}

@end
