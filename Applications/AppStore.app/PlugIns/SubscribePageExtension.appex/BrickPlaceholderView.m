@implementation BrickPlaceholderView

- (_TtC22SubscribePageExtension20BrickPlaceholderView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension20BrickPlaceholderView *)sub_1005164A8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension20BrickPlaceholderView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10051690C();
}

- (void)layoutSubviews
{
  _TtC22SubscribePageExtension20BrickPlaceholderView *v2;

  v2 = self;
  sub_100516608();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension20BrickPlaceholderView_artworkPlaceholder));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension20BrickPlaceholderView_supplementaryTextPlaceholder));
}

@end
