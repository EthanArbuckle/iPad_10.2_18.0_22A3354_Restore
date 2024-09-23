@implementation BrickPlaceholderView

- (_TtC8AppStore20BrickPlaceholderView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore20BrickPlaceholderView *)sub_1004F9938(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore20BrickPlaceholderView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1004F9D9C();
}

- (void)layoutSubviews
{
  _TtC8AppStore20BrickPlaceholderView *v2;

  v2 = self;
  sub_1004F9A98();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore20BrickPlaceholderView_artworkPlaceholder));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore20BrickPlaceholderView_supplementaryTextPlaceholder));
}

@end
