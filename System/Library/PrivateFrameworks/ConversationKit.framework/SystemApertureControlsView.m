@implementation SystemApertureControlsView

- (_TtC15ConversationKit26SystemApertureControlsView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  SystemApertureControlsView.init(coder:)();
}

- (void)layoutSubviews
{
  _TtC15ConversationKit26SystemApertureControlsView *v2;

  v2 = self;
  SystemApertureControlsView.layoutSubviews()();

}

- (_TtC15ConversationKit26SystemApertureControlsView)initWithFrame:(CGRect)a3
{
  SystemApertureControlsView.init(frame:)();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit26SystemApertureControlsView_controlsManager));
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit26SystemApertureControlsView_ephemeralAlertTimer);
  outlined consume of ConversationControlsRecipe.View?(*(void **)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC15ConversationKit26SystemApertureControlsView_ephemeralAlert), *(void **)((char *)&self->super.super._responderFlags+ OBJC_IVAR____TtC15ConversationKit26SystemApertureControlsView_ephemeralAlert));
  outlined destroy of ConversationControlsRecipe((uint64_t)self + OBJC_IVAR____TtC15ConversationKit26SystemApertureControlsView_recipe);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit26SystemApertureControlsView_statusView);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit26SystemApertureControlsView____lazy_storage___ephemeralAlertNotice);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit26SystemApertureControlsView_buttonShelfView);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit26SystemApertureControlsView_trailingActionsView);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit26SystemApertureControlsView_leadingAccessoryView);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit26SystemApertureControlsView_appLaunchPillView));
}

@end
