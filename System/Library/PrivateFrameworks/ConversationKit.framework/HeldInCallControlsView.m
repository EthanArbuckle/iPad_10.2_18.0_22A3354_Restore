@implementation HeldInCallControlsView

- (_TtC15ConversationKit22HeldInCallControlsView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  HeldInCallControlsView.init(coder:)();
}

- (void)layoutSubviews
{
  _TtC15ConversationKit22HeldInCallControlsView *v2;

  v2 = self;
  HeldInCallControlsView.layoutSubviews()();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  _TtC15ConversationKit22HeldInCallControlsView *v5;
  CGSize v6;
  double v7;
  double v8;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = HeldInCallControlsView.sizeThatFits(_:)((CGSize)__PAIR128__(*(unint64_t *)&height, *(unint64_t *)&width));

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
  _TtC15ConversationKit22HeldInCallControlsView *v7;
  __C::UILayoutPriority v8;
  __C::UILayoutPriority v9;
  CGSize v10;
  double v11;
  double v12;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v7 = self;
  v10 = HeldInCallControlsView.systemLayoutSizeFitting(_:withHorizontalFittingPriority:verticalFittingPriority:)((CGSize)__PAIR128__(*(unint64_t *)&height, *(unint64_t *)&width), v8, v9);

  v11 = v10.width;
  v12 = v10.height;
  result.height = v12;
  result.width = v11;
  return result;
}

- (CGSize)intrinsicContentSize
{
  _TtC15ConversationKit22HeldInCallControlsView *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v2 = self;
  HeldInCallControlsView.intrinsicContentSize.getter();
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (_TtC15ConversationKit22HeldInCallControlsView)initWithFrame:(CGRect)a3
{
  HeldInCallControlsView.init(frame:)();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit22HeldInCallControlsView_avatar));
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit22HeldInCallControlsView_brandedIconView);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit22HeldInCallControlsView_primaryLabel);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit22HeldInCallControlsView_secondaryLabel);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit22HeldInCallControlsView_blurView);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit22HeldInCallControlsView_swapButton));
}

@end
