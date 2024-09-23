@implementation SystemApertureIncomingCallLeadingView

- (_TtC15ConversationKit37SystemApertureIncomingCallLeadingView)initWithFrame:(CGRect)a3
{
  SystemApertureIncomingCallLeadingView.init(frame:)();
}

- (_TtC15ConversationKit37SystemApertureIncomingCallLeadingView)initWithCoder:(id)a3
{
  SystemApertureIncomingCallLeadingView.init(coder:)();
}

- (void)layoutSubviews
{
  _TtC15ConversationKit37SystemApertureIncomingCallLeadingView *v2;

  v2 = self;
  SystemApertureIncomingCallLeadingView.layoutSubviews()();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  _TtC15ConversationKit37SystemApertureIncomingCallLeadingView *v3;
  unint64_t v4;
  unint64_t v5;
  CGSize v6;
  double width;
  double height;
  CGSize result;

  v3 = self;
  v6 = SystemApertureIncomingCallLeadingView.sizeThatFits(_:)((CGSize)__PAIR128__(v5, v4));

  width = v6.width;
  height = v6.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3 forLayoutMode:(int64_t)a4
{
  _TtC15ConversationKit37SystemApertureIncomingCallLeadingView *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  v4 = self;
  SystemApertureIncomingCallLeadingView.sizeThatFits(_:for:)();
  v6 = v5;
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit37SystemApertureIncomingCallLeadingView_leadingView));
}

@end
