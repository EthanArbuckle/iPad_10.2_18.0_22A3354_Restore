@implementation OngoingTelephonyControlsView

- (_TtC15ConversationKit28OngoingTelephonyControlsView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  OngoingTelephonyControlsView.init(coder:)();
}

- (void)layoutSubviews
{
  _TtC15ConversationKit28OngoingTelephonyControlsView *v2;

  v2 = self;
  OngoingTelephonyControlsView.layoutSubviews()();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  _TtC15ConversationKit28OngoingTelephonyControlsView *v5;
  CGSize v6;
  double v7;
  double v8;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = OngoingTelephonyControlsView.sizeThatFits(_:)((CGSize)__PAIR128__(*(unint64_t *)&height, *(unint64_t *)&width));

  v7 = v6.width;
  v8 = v6.height;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGSize)intrinsicContentSize
{
  _TtC15ConversationKit28OngoingTelephonyControlsView *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v2 = self;
  OngoingTelephonyControlsView.intrinsicContentSize.getter();
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (_TtC15ConversationKit28OngoingTelephonyControlsView)initWithFrame:(CGRect)a3
{
  OngoingTelephonyControlsView.init(frame:)();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit28OngoingTelephonyControlsView_avatarView));
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit28OngoingTelephonyControlsView_brandedIconView);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit28OngoingTelephonyControlsView_primaryLabel);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit28OngoingTelephonyControlsView_secondaryLabel);
  swift_release();
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit28OngoingTelephonyControlsView_changeRouteButton);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit28OngoingTelephonyControlsView_hangUpButton);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit28OngoingTelephonyControlsView_controlsManager);
  outlined destroy of ConversationControlsAction((uint64_t)self + OBJC_IVAR____TtC15ConversationKit28OngoingTelephonyControlsView_recipe, (uint64_t (*)(_QWORD))type metadata accessor for ConversationControlsRecipe);
  OUTLINED_FUNCTION_0();
}

@end
