@implementation ConversationControlsTrailingActionsView

- (_TtC15ConversationKit39ConversationControlsTrailingActionsView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  ConversationControlsTrailingActionsView.init(coder:)();
}

- (_TtC15ConversationKit39ConversationControlsTrailingActionsView)initWithFrame:(CGRect)a3
{
  ConversationControlsTrailingActionsView.init(frame:)();
}

- (void).cxx_destruct
{
  outlined destroy of RemoteControlRequest((uint64_t)self + OBJC_IVAR____TtC15ConversationKit39ConversationControlsTrailingActionsView_recipe, (uint64_t (*)(_QWORD))type metadata accessor for ConversationControlsRecipe);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit39ConversationControlsTrailingActionsView_controlsManager));
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit39ConversationControlsTrailingActionsView_menuHostViewController);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit39ConversationControlsTrailingActionsView____lazy_storage___actionButtonsHStack));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit39ConversationControlsTrailingActionsView____lazy_storage___showCallDetailsButton));
}

@end
