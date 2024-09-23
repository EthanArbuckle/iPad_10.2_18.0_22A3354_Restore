@implementation CallAgainHUDView

- (UIButton)callBackButton
{
  return (UIButton *)CallAgainHUDView.callBackButton.getter();
}

- (UIButton)closeButton
{
  return (UIButton *)CallAgainHUDView.closeButton.getter();
}

- (UIButton)videoMessageButton
{
  return (UIButton *)CallAgainHUDView.videoMessageButton.getter();
}

- (_TtC15ConversationKit16CallAgainHUDView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  CallAgainHUDView.init(coder:)();
}

- (void)layoutSubviews
{
  _TtC15ConversationKit16CallAgainHUDView *v2;

  v2 = self;
  CallAgainHUDView.layoutSubviews()();

}

- (void)handleContentSizeCategoryDidChange:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  _TtC15ConversationKit16CallAgainHUDView *v10;
  uint64_t v11;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Notification?);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    static Notification._unconditionallyBridgeFromObjectiveC(_:)();
    v8 = type metadata accessor for Notification();
    v9 = 0;
  }
  else
  {
    v8 = type metadata accessor for Notification();
    v9 = 1;
  }
  __swift_storeEnumTagSinglePayload((uint64_t)v7, v9, 1, v8);
  v10 = self;
  CallAgainHUDView.handleContentSizeCategoryDidChange(_:)((uint64_t)v10);

  outlined destroy of Notification?((uint64_t)v7);
}

- (_TtC15ConversationKit16CallAgainHUDView)initWithFrame:(CGRect)a3
{
  CallAgainHUDView.init(frame:)();
}

- (void).cxx_destruct
{
  outlined destroy of ConversationControlsRecipe((uint64_t)self + OBJC_IVAR____TtC15ConversationKit16CallAgainHUDView_recipe);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit16CallAgainHUDView_bottomButtonConstraint);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit16CallAgainHUDView_avatarBottomConstraint);
  swift_unknownObjectWeakDestroy();
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit16CallAgainHUDView_primaryLabel);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit16CallAgainHUDView_callTypeLabel);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit16CallAgainHUDView_avatarStack);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit16CallAgainHUDView_videoMessageStackView);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit16CallAgainHUDView_callBackButton);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit16CallAgainHUDView_closeButton);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit16CallAgainHUDView_videoMessageButton);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit16CallAgainHUDView_effectsView);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit16CallAgainHUDView_showCallDetailsButton));
}

@end
