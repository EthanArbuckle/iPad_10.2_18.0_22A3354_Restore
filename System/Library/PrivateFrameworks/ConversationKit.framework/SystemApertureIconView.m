@implementation SystemApertureIconView

- (_TtC15ConversationKit22SystemApertureIconView)initWithFrame:(CGRect)a3
{
  SystemApertureIconView.init(frame:)();
}

- (_TtC15ConversationKit22SystemApertureIconView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  SystemApertureIconView.init(coder:)();
}

- (void)layoutSubviews
{
  _TtC15ConversationKit22SystemApertureIconView *v2;

  v2 = self;
  SystemApertureIconView.layoutSubviews()();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  _TtC15ConversationKit22SystemApertureIconView *v5;
  CGSize v6;
  double v7;
  double v8;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = SystemApertureIconView.sizeThatFits(_:)((CGSize)__PAIR128__(*(unint64_t *)&height, *(unint64_t *)&width));

  v7 = v6.width;
  v8 = v6.height;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3 forLayoutMode:(int64_t)a4
{
  _TtC15ConversationKit22SystemApertureIconView *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  v4 = self;
  SystemApertureIconView.sizeThatFits(_:for:)();
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
  outlined consume of SystemApertureIconAsset(*(void **)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC15ConversationKit22SystemApertureIconView_icon), *(_QWORD *)((char *)&self->super.super._responderFlags+ OBJC_IVAR____TtC15ConversationKit22SystemApertureIconView_icon), *(void **)((char *)&self->super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC15ConversationKit22SystemApertureIconView_icon), *(uint64_t *)((char *)&self->super._constraintsExceptingSubviewAutoresizingConstraints+ OBJC_IVAR____TtC15ConversationKit22SystemApertureIconView_icon), *(uint64_t *)((char *)&self->super._cachedTraitCollection+ OBJC_IVAR____TtC15ConversationKit22SystemApertureIconView_icon), *((_BYTE *)&self->super._animationInfo + OBJC_IVAR____TtC15ConversationKit22SystemApertureIconView_icon));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit22SystemApertureIconView_iconView));
}

@end
