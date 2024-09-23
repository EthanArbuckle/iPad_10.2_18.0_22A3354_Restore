@implementation ColorWellView

- (_TtC11EmojiPoster13ColorWellView)initWithFrame:(CGRect)a3
{
  return (_TtC11EmojiPoster13ColorWellView *)sub_1DD2CE560(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC11EmojiPoster13ColorWellView)initWithCoder:(id)a3
{
  return (_TtC11EmojiPoster13ColorWellView *)sub_1DD2CE6A0(a3);
}

- (void)layoutSubviews
{
  _TtC11EmojiPoster13ColorWellView *v2;
  double v3;
  id v4;

  v2 = self;
  v4 = -[ColorWellView layer](v2, sel_layer);
  -[ColorWellView bounds](v2, sel_bounds);
  objc_msgSend(v4, sel_setCornerRadius_, v3 * 0.5);

}

@end
