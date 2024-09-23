@implementation BadgedLabel

- (_TtC15ConversationKit11BadgedLabel)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  BadgedLabel.init(coder:)();
}

- (void)layoutSubviews
{
  _TtC15ConversationKit11BadgedLabel *v2;

  v2 = self;
  BadgedLabel.layoutSubviews()();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  _TtC15ConversationKit11BadgedLabel *v5;
  CGSize v6;
  double v7;
  double v8;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = BadgedLabel.sizeThatFits(_:)((CGSize)__PAIR128__(*(unint64_t *)&height, *(unint64_t *)&width));

  v7 = v6.width;
  v8 = v6.height;
  result.height = v8;
  result.width = v7;
  return result;
}

- (_TtC15ConversationKit11BadgedLabel)initWithFrame:(CGRect)a3
{
  BadgedLabel.init(frame:)();
}

- (void).cxx_destruct
{

}

@end
