@implementation InlineBubbleTipView

- (_TtC7MusicUI19InlineBubbleTipView)initWithCoder:(id)a3
{
  sub_21CE008FC();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  _TtC7MusicUI19InlineBubbleTipView *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  v3 = self;
  sub_21CE00960();
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (CGSize)intrinsicContentSize
{
  _TtC7MusicUI19InlineBubbleTipView *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v2 = self;
  sub_21CE00A08();
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (_TtC7MusicUI19InlineBubbleTipView)initWithFrame:(CGRect)a3
{
  InlineBubbleTipView.init(frame:)();
}

- (void).cxx_destruct
{
  OUTLINED_FUNCTION_5_11((uint64_t)self, OBJC_IVAR____TtC7MusicUI19InlineBubbleTipView_contentView);
}

@end
