@implementation LocalParticipantControlsView

- (UIControl)effectsButton
{
  return (UIControl *)LocalParticipantControlsView.effectsButton.getter();
}

- (UIControl)cameraBlurButton
{
  return (UIControl *)LocalParticipantControlsView.cameraBlurButton.getter();
}

- (UIControl)cinematicFramingButton
{
  return (UIControl *)LocalParticipantControlsView.cinematicFramingButton.getter();
}

- (UIControl)collapseButton
{
  return (UIControl *)LocalParticipantControlsView.collapseButton.getter();
}

- (UIControl)rotateButton
{
  return (UIControl *)LocalParticipantControlsView.rotateButton.getter();
}

- (UIControl)cameraFlipButton
{
  return (UIControl *)LocalParticipantControlsView.cameraFlipButton.getter();
}

- (UIControl)reactionEffectGestureButton
{
  return (UIControl *)LocalParticipantControlsView.reactionEffectGestureButton.getter();
}

- (UIControl)studioLightButton
{
  return (UIControl *)LocalParticipantControlsView.studioLightButton.getter();
}

- (UIControl)videoPauseButton
{
  return (UIControl *)LocalParticipantControlsView.videoPauseButton.getter();
}

- (UIView)shutterButton
{
  _TtC15ConversationKit28LocalParticipantControlsView *v2;
  void *v3;
  void *v4;

  v2 = self;
  LocalParticipantControlsView.shutterButton.getter();
  v4 = v3;

  return (UIView *)v4;
}

- (void)setShutterButton:(id)a3
{
  id v4;
  _TtC15ConversationKit28LocalParticipantControlsView *v5;

  v4 = a3;
  v5 = self;
  LocalParticipantControlsView.shutterButton.setter((uint64_t)v4);

}

- (_TtC15ConversationKit28LocalParticipantControlsView)init
{
  _TtC15ConversationKit28LocalParticipantControlsView *result;

  LocalParticipantControlsView.init()();
  return result;
}

- (_TtC15ConversationKit28LocalParticipantControlsView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  LocalParticipantControlsView.init(coder:)();
}

- (void)layoutSubviews
{
  _TtC15ConversationKit28LocalParticipantControlsView *v2;

  v2 = self;
  LocalParticipantControlsView.layoutSubviews()();

}

- (void)handleEffectsTapped
{
  _TtC15ConversationKit28LocalParticipantControlsView *v2;

  v2 = self;
  LocalParticipantControlsView.handleEffectsTapped()();

}

- (void)handleCinematicFramingTapped
{
  _TtC15ConversationKit28LocalParticipantControlsView *v2;

  v2 = self;
  LocalParticipantControlsView.handleCinematicFramingTapped()();

}

- (void)handleCameraBlurTapped
{
  _TtC15ConversationKit28LocalParticipantControlsView *v2;

  v2 = self;
  LocalParticipantControlsView.handleCameraBlurTapped()();

}

- (void)handleCollapseButtonTapped
{
  _TtC15ConversationKit28LocalParticipantControlsView *v2;

  v2 = self;
  LocalParticipantControlsView.handleCollapseButtonTapped()();

}

- (void)handleRotateButtonTapped
{
  _TtC15ConversationKit28LocalParticipantControlsView *v2;

  v2 = self;
  LocalParticipantControlsView.handleRotateButtonTapped()();

}

- (void)handleCameraFlipTapped
{
  _TtC15ConversationKit28LocalParticipantControlsView *v2;

  v2 = self;
  LocalParticipantControlsView.handleCameraFlipTapped()();

}

- (void)handleReactionEffectGestureTapped
{
  _TtC15ConversationKit28LocalParticipantControlsView *v2;

  v2 = self;
  LocalParticipantControlsView.handleReactionEffectGestureTapped()();

}

- (void)handleStudioLightTapped
{
  _TtC15ConversationKit28LocalParticipantControlsView *v2;

  v2 = self;
  LocalParticipantControlsView.handleStudioLightTapped()();

}

- (void)handleVideoMessageButtonTapped
{
  _TtC15ConversationKit28LocalParticipantControlsView *v2;

  v2 = self;
  LocalParticipantControlsView.handleVideoMessageButtonTapped()();

}

- (void)showCallDetails
{
  _TtC15ConversationKit28LocalParticipantControlsView *v2;

  v2 = self;
  LocalParticipantControlsView.showCallDetails()();

}

- (void)callBack
{
  _TtC15ConversationKit28LocalParticipantControlsView *v2;

  v2 = self;
  LocalParticipantControlsView.callBack()();

}

- (void)close
{
  _TtC15ConversationKit28LocalParticipantControlsView *v2;

  v2 = self;
  LocalParticipantControlsView.close()();

}

- (void)handleShutterButtonTapped
{
  _TtC15ConversationKit28LocalParticipantControlsView *v2;

  v2 = self;
  LocalParticipantControlsView.handleShutterButtonTapped()();

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  id v8;
  _TtC15ConversationKit28LocalParticipantControlsView *v9;
  UIView_optional *v10;
  void *v11;
  void *v12;
  UIEvent_optional v14;

  y = a3.y;
  x = a3.x;
  v8 = a4;
  v9 = self;
  v14.value.super.isa = (Class)a4;
  LocalParticipantControlsView.hitTest(_:with:)(v10, (CGPoint)__PAIR128__(*(unint64_t *)&y, *(unint64_t *)&x), v14);
  v12 = v11;

  return v12;
}

- (_TtC15ConversationKit28LocalParticipantControlsView)initWithFrame:(CGRect)a3
{
  LocalParticipantControlsView.init(frame:)();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit28LocalParticipantControlsView_effectsButton));
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit28LocalParticipantControlsView_cameraBlurButton);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit28LocalParticipantControlsView_cinematicFramingButton);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit28LocalParticipantControlsView_collapseButton);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit28LocalParticipantControlsView_rotateButton);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit28LocalParticipantControlsView_cameraFlipButton);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit28LocalParticipantControlsView_reactionEffectGestureButton);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit28LocalParticipantControlsView_studioLightButton);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit28LocalParticipantControlsView_videoPauseButton);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit28LocalParticipantControlsView_videoMessageControls);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit28LocalParticipantControlsView____lazy_storage___videoMessageViewModel);
  swift_unknownObjectWeakDestroy();
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit28LocalParticipantControlsView____lazy_storage___spinnerView);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit28LocalParticipantControlsView____lazy_storage___shutterButton);
  swift_bridgeObjectRelease();
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit28LocalParticipantControlsView_delegate);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit28LocalParticipantControlsView_controlsLayoutGuide);
  outlined destroy of AccountUpdateNotice((uint64_t)self + OBJC_IVAR____TtC15ConversationKit28LocalParticipantControlsView_viewModel, type metadata accessor for LocalParticipantControlsView.ViewModel);
  v3 = (char *)self + OBJC_IVAR____TtC15ConversationKit28LocalParticipantControlsView__videoMessagingState;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<VideoMessageController.State>);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  swift_release();
}

@end
