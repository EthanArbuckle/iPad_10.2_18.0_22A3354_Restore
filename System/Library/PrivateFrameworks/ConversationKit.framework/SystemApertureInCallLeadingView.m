@implementation SystemApertureInCallLeadingView

- (_TtC15ConversationKit31SystemApertureInCallLeadingView)initWithFrame:(CGRect)a3
{
  SystemApertureInCallLeadingView.init(frame:)();
}

- (_TtC15ConversationKit31SystemApertureInCallLeadingView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  SystemApertureInCallLeadingView.init(coder:)();
}

- (void)dealloc
{
  _TtC15ConversationKit31SystemApertureInCallLeadingView *v2;

  v2 = self;
  SystemApertureInCallLeadingView.__deallocating_deinit();
}

- (void).cxx_destruct
{
  outlined consume of SystemApertureIconAsset(*(void **)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC15ConversationKit31SystemApertureInCallLeadingView_icon), *(_QWORD *)((char *)&self->super.super._responderFlags+ OBJC_IVAR____TtC15ConversationKit31SystemApertureInCallLeadingView_icon), *(void **)((char *)&self->super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC15ConversationKit31SystemApertureInCallLeadingView_icon), *(uint64_t *)((char *)&self->super._constraintsExceptingSubviewAutoresizingConstraints+ OBJC_IVAR____TtC15ConversationKit31SystemApertureInCallLeadingView_icon), *(uint64_t *)((char *)&self->super._cachedTraitCollection+ OBJC_IVAR____TtC15ConversationKit31SystemApertureInCallLeadingView_icon), *((_BYTE *)&self->super._animationInfo + OBJC_IVAR____TtC15ConversationKit31SystemApertureInCallLeadingView_icon));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit31SystemApertureInCallLeadingView_iconView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit31SystemApertureInCallLeadingView_durationView));
}

- (void)layoutSubviews
{
  _TtC15ConversationKit31SystemApertureInCallLeadingView *v2;

  v2 = self;
  SystemApertureInCallLeadingView.layoutSubviews()();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  _TtC15ConversationKit31SystemApertureInCallLeadingView *v5;
  CGSize v6;
  double v7;
  double v8;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = SystemApertureInCallLeadingView.sizeThatFits(_:)((CGSize)__PAIR128__(*(unint64_t *)&height, *(unint64_t *)&width));

  v7 = v6.width;
  v8 = v6.height;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3 forLayoutMode:(int64_t)a4
{
  _TtC15ConversationKit31SystemApertureInCallLeadingView *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  v4 = self;
  SystemApertureInCallLeadingView.sizeThatFits(_:for:)();
  v6 = v5;
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

@end
