@implementation ParticipantView

- (CGAffineTransform)transform
{
  _TtC15ConversationKit15ParticipantView *v4;
  CGAffineTransform *result;
  CGAffineTransform v6;

  v4 = self;
  ParticipantView.transform.getter();

  *retstr = v6;
  return result;
}

- (void)setTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  _TtC15ConversationKit15ParticipantView *v4;
  _OWORD v5[3];

  v3 = *(_OWORD *)&a3->c;
  v5[0] = *(_OWORD *)&a3->a;
  v5[1] = v3;
  v5[2] = *(_OWORD *)&a3->tx;
  v4 = self;
  ParticipantView.transform.setter(v5);

}

- (_TtC15ConversationKit23ParticipantMonogramView)monogramView
{
  return (_TtC15ConversationKit23ParticipantMonogramView *)ParticipantView.monogramView.getter();
}

- (_TtC15ConversationKit19ParticipantInfoView)infoView
{
  _TtC15ConversationKit15ParticipantView *v2;
  char *v3;

  v2 = self;
  v3 = ParticipantView.infoView.getter();

  return (_TtC15ConversationKit19ParticipantInfoView *)v3;
}

- (void)setInfoView:(id)a3
{
  id v4;
  _TtC15ConversationKit15ParticipantView *v5;

  v4 = a3;
  v5 = self;
  ParticipantView.infoView.setter((uint64_t)v4);

}

- (_TtC15ConversationKit21ParticipantViewButton)kickMemberButton
{
  return (_TtC15ConversationKit21ParticipantViewButton *)ParticipantView.kickMemberButton.getter();
}

- (BOOL)isInRoster
{
  char v2;

  ParticipantView.isInRoster.getter();
  return v2 & 1;
}

- (void)setIsInRoster:(BOOL)a3
{
  _TtC15ConversationKit15ParticipantView *v4;

  v4 = self;
  ParticipantView.isInRoster.setter(a3);

}

- (BOOL)shouldOverrideShadowHidden
{
  char v2;

  ParticipantView.shouldOverrideShadowHidden.getter();
  return v2 & 1;
}

- (void)setShouldOverrideShadowHidden:(BOOL)a3
{
  _TtC15ConversationKit15ParticipantView *v4;

  v4 = self;
  ParticipantView.shouldOverrideShadowHidden.setter(a3);

}

- (BOOL)isExpanded
{
  char v2;

  ParticipantView.isExpanded.getter();
  return v2 & 1;
}

- (void)setIsExpanded:(BOOL)a3
{
  _TtC15ConversationKit15ParticipantView *v4;

  v4 = self;
  ParticipantView.isExpanded.setter(a3);

}

- (_TtC15ConversationKit15ParticipantView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  ParticipantView.init(coder:)();
}

- (void)dealloc
{
  _TtC15ConversationKit15ParticipantView *v2;

  v2 = self;
  ParticipantView.__deallocating_deinit();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit15ParticipantView_backgroundEffectsView));
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit15ParticipantView_contentView);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit15ParticipantView_monogramView);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit15ParticipantView_videoView);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit15ParticipantView_alertView);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit15ParticipantView_videoOverlayView);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit15ParticipantView____lazy_storage___infoView);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit15ParticipantView_prominenceBorderView);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit15ParticipantView_debugLabel);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit15ParticipantView_kickMemberButton);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit15ParticipantView_gradientOverlayView);
  v3 = (char *)self + OBJC_IVAR____TtC15ConversationKit15ParticipantView_loggingIdentifier;
  v4 = OUTLINED_FUNCTION_33_0();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit15ParticipantView_hideInfoViewTimer);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit15ParticipantView_hideAlertViewTimer);
  swift_release();
  outlined destroy of ZStack<ModifiedContent<ConversationStatusView, _PaddingLayout>?>((uint64_t)self + OBJC_IVAR____TtC15ConversationKit15ParticipantView_participantIdentifier, (uint64_t *)&demangling cache variable for type metadata for UUID?);
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit15ParticipantView_delegate);
}

- (void)layoutSubviews
{
  _TtC15ConversationKit15ParticipantView *v2;

  v2 = self;
  ParticipantView.layoutSubviews()();

}

- (void)didTapKickMember
{
  _TtC15ConversationKit15ParticipantView *v2;

  v2 = self;
  ParticipantView.didTapKickMember()();

}

- (_TtC15ConversationKit15ParticipantView)initWithFrame:(CGRect)a3
{
  ParticipantView.init(frame:)();
}

@end
