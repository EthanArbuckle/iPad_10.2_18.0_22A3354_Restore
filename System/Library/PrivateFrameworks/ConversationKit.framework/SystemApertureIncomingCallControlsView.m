@implementation SystemApertureIncomingCallControlsView

- (_TtC15ConversationKit38SystemApertureIncomingCallControlsView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  SystemApertureIncomingCallControlsView.init(coder:)();
}

- (void)layoutSubviews
{
  _TtC15ConversationKit38SystemApertureIncomingCallControlsView *v2;

  v2 = self;
  SystemApertureIncomingCallControlsView.layoutSubviews()();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  _TtC15ConversationKit38SystemApertureIncomingCallControlsView *v5;
  CGSize v6;
  double v7;
  double v8;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = SystemApertureIncomingCallControlsView.sizeThatFits(_:)((CGSize)__PAIR128__(*(unint64_t *)&height, *(unint64_t *)&width));

  v7 = v6.width;
  v8 = v6.height;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  CGFloat height;
  CGFloat width;
  _TtC15ConversationKit38SystemApertureIncomingCallControlsView *v7;
  __C::UILayoutPriority v8;
  __C::UILayoutPriority v9;
  CGSize v10;
  double v11;
  double v12;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v7 = self;
  v10 = SystemApertureIncomingCallControlsView.systemLayoutSizeFitting(_:withHorizontalFittingPriority:verticalFittingPriority:)((CGSize)__PAIR128__(*(unint64_t *)&height, *(unint64_t *)&width), v8, v9);

  v11 = v10.width;
  v12 = v10.height;
  result.height = v12;
  result.width = v11;
  return result;
}

- (CGSize)intrinsicContentSize
{
  _TtC15ConversationKit38SystemApertureIncomingCallControlsView *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v2 = self;
  SystemApertureIncomingCallControlsView.intrinsicContentSize.getter();
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (_TtC15ConversationKit38SystemApertureIncomingCallControlsView)initWithFrame:(CGRect)a3
{
  SystemApertureIncomingCallControlsView.init(frame:)();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit38SystemApertureIncomingCallControlsView_features));
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit38SystemApertureIncomingCallControlsView_leadingView);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit38SystemApertureIncomingCallControlsView_primaryLabel);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit38SystemApertureIncomingCallControlsView_secondaryBadge);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit38SystemApertureIncomingCallControlsView_secondaryLabel);
  swift_release();
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit38SystemApertureIncomingCallControlsView_rejectButton);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit38SystemApertureIncomingCallControlsView_acceptButton);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit38SystemApertureIncomingCallControlsView_controlsManager);
  outlined destroy of AccountUpdateNotice((uint64_t)self + OBJC_IVAR____TtC15ConversationKit38SystemApertureIncomingCallControlsView_recipe, (uint64_t (*)(_QWORD))type metadata accessor for ConversationControlsRecipe);
  OUTLINED_FUNCTION_0();
}

@end
