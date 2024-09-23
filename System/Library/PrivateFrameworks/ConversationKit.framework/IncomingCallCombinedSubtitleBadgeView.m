@implementation IncomingCallCombinedSubtitleBadgeView

- (_TtC15ConversationKit37IncomingCallCombinedSubtitleBadgeView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  IncomingCallCombinedSubtitleBadgeView.init(coder:)();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  _TtC15ConversationKit37IncomingCallCombinedSubtitleBadgeView *v5;
  CGSize v6;
  double v7;
  double v8;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = IncomingCallCombinedSubtitleBadgeView.sizeThatFits(_:)((CGSize)__PAIR128__(*(unint64_t *)&height, *(unint64_t *)&width));

  v7 = v6.width;
  v8 = v6.height;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)layoutSubviews
{
  _TtC15ConversationKit37IncomingCallCombinedSubtitleBadgeView *v2;

  v2 = self;
  IncomingCallCombinedSubtitleBadgeView.layoutSubviews()();

}

- (_TtC15ConversationKit37IncomingCallCombinedSubtitleBadgeView)initWithFrame:(CGRect)a3
{
  IncomingCallCombinedSubtitleBadgeView.init(frame:)();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit37IncomingCallCombinedSubtitleBadgeView_brandedIcon));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit37IncomingCallCombinedSubtitleBadgeView_multiSimBadge));
}

@end
