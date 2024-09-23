@implementation InteractiveSectionBackgroundView

- (_TtC20ProductPageExtension32InteractiveSectionBackgroundView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension32InteractiveSectionBackgroundView *)sub_1001D3344(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension32InteractiveSectionBackgroundView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  return (_TtC20ProductPageExtension32InteractiveSectionBackgroundView *)sub_1001D53F0();
}

- (void)layoutSubviews
{
  _TtC20ProductPageExtension32InteractiveSectionBackgroundView *v2;

  v2 = self;
  sub_1001D3620();

}

- (void)prepareForReuse
{
  _TtC20ProductPageExtension32InteractiveSectionBackgroundView *v2;

  v2 = self;
  sub_1001D370C();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension32InteractiveSectionBackgroundView_materialView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension32InteractiveSectionBackgroundView_topBackgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension32InteractiveSectionBackgroundView_bottomBackgroundView));
  sub_100010F2C((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension32InteractiveSectionBackgroundView_currentState, (uint64_t *)&unk_10081EB80);
}

@end
