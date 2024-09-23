@implementation SystemApertureContainerView

- (_TtC15ConversationKit27SystemApertureContainerView)init
{
  return (_TtC15ConversationKit27SystemApertureContainerView *)SystemApertureContainerView.init()();
}

- (_TtC15ConversationKit27SystemApertureContainerView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  SystemApertureContainerView.init(coder:)();
}

- (void)layoutSubviews
{
  _TtC15ConversationKit27SystemApertureContainerView *v2;

  v2 = self;
  SystemApertureContainerView.layoutSubviews()();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  _TtC15ConversationKit27SystemApertureContainerView *v5;
  CGSize v6;
  double v7;
  double v8;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = SystemApertureContainerView.sizeThatFits(_:)((CGSize)__PAIR128__(*(unint64_t *)&height, *(unint64_t *)&width));

  v7 = v6.width;
  v8 = v6.height;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGSize)intrinsicContentSize
{
  _TtC15ConversationKit27SystemApertureContainerView *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v2 = self;
  SystemApertureContainerView.intrinsicContentSize.getter();
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3 forLayoutMode:(int64_t)a4
{
  double height;
  double width;
  _TtC15ConversationKit27SystemApertureContainerView *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v7 = self;
  v8 = SystemApertureContainerView.sizeThatFits(_:for:)(a4, width, height);
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (NSString)accessibilityLabel
{
  _TtC15ConversationKit27SystemApertureContainerView *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v2 = self;
  SystemApertureContainerView.accessibilityLabel.getter();
  v4 = v3;
  v6 = v5;

  if (v6)
  {
    v7 = (void *)MEMORY[0x1C3B72E00](v4, v6);
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = 0;
  }
  return (NSString *)v7;
}

- (void)setAccessibilityLabel:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC15ConversationKit27SystemApertureContainerView *v7;

  if (a3)
  {
    v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = self;
  SystemApertureContainerView.accessibilityLabel.setter(v4, v6);

}

- (_TtC15ConversationKit27SystemApertureContainerView)initWithFrame:(CGRect)a3
{
  SystemApertureContainerView.init(frame:)();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit27SystemApertureContainerView_content));
}

@end
