@implementation BrickPlaceholderView

- (_TtC20ProductPageExtension20BrickPlaceholderView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension20BrickPlaceholderView *)sub_10054AC98(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension20BrickPlaceholderView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10054B0FC();
}

- (void)layoutSubviews
{
  _TtC20ProductPageExtension20BrickPlaceholderView *v2;

  v2 = self;
  sub_10054ADF8();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension20BrickPlaceholderView_artworkPlaceholder));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension20BrickPlaceholderView_supplementaryTextPlaceholder));
}

@end
