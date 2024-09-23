@implementation BrandedIconView

- (_TtC15ConversationKit15BrandedIconView)initWithCoder:(id)a3
{
  _TtC15ConversationKit15BrandedIconView *result;

  BrandedIconView.init(coder:)(a3);
  return result;
}

- (void)layoutSubviews
{
  _TtC15ConversationKit15BrandedIconView *v2;

  v2 = self;
  BrandedIconView.layoutSubviews()();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  _TtC15ConversationKit15BrandedIconView *v5;
  CGSize v6;
  double v7;
  double v8;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = BrandedIconView.sizeThatFits(_:)((CGSize)__PAIR128__(*(unint64_t *)&height, *(unint64_t *)&width));

  v7 = v6.width;
  v8 = v6.height;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGSize)intrinsicContentSize
{
  _TtC15ConversationKit15BrandedIconView *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v2 = self;
  BrandedIconView.intrinsicContentSize.getter();
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (_TtC15ConversationKit15BrandedIconView)initWithFrame:(CGRect)a3
{
  BrandedIconView.init(frame:)();
}

- (void).cxx_destruct
{

}

@end
