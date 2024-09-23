@implementation ConversationHUDControlsView

- (_TtC15ConversationKit27ConversationHUDControlsView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  ConversationHUDControlsView.init(coder:)();
}

- (void)layoutSubviews
{
  _TtC15ConversationKit27ConversationHUDControlsView *v2;

  v2 = self;
  ConversationHUDControlsView.layoutSubviews()();

}

- (_TtC15ConversationKit27ConversationHUDControlsView)initWithFrame:(CGRect)a3
{
  ConversationHUDControlsView.init(frame:)();
}

- (void).cxx_destruct
{
  outlined destroy of ConversationControlsRecipe((uint64_t)self + OBJC_IVAR____TtC15ConversationKit27ConversationHUDControlsView_recipe);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit27ConversationHUDControlsView_controlsManager);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit27ConversationHUDControlsView_ephemeralAlertTimer);
  outlined consume of ConversationControlsRecipe.View?(*(void **)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC15ConversationKit27ConversationHUDControlsView_ephemeralAlert), *(void **)((char *)&self->super.super._responderFlags+ OBJC_IVAR____TtC15ConversationKit27ConversationHUDControlsView_ephemeralAlert));
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit27ConversationHUDControlsView_statusView);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit27ConversationHUDControlsView_buttonShelfView);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit27ConversationHUDControlsView____lazy_storage___ephemeralAlertNotice));
}

@end
