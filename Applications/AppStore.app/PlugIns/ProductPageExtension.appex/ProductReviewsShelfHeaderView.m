@implementation ProductReviewsShelfHeaderView

- (_TtC20ProductPageExtension29ProductReviewsShelfHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension29ProductReviewsShelfHeaderView *)sub_1004DDCA4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension29ProductReviewsShelfHeaderView)initWithCoder:(id)a3
{
  _QWORD *v4;
  id v5;
  _TtC20ProductPageExtension29ProductReviewsShelfHeaderView *result;

  v4 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC20ProductPageExtension29ProductReviewsShelfHeaderView_sortButtonAction);
  *v4 = 0;
  v4[1] = 0;
  v5 = a3;

  result = (_TtC20ProductPageExtension29ProductReviewsShelfHeaderView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100685560, "ProductPageExtension/ProductReviewsShelfHeaderView.swift", 56, 2, 61, 0);
  __break(1u);
  return result;
}

- (void)prepareForReuse
{
  _TtC20ProductPageExtension29ProductReviewsShelfHeaderView *v2;

  v2 = self;
  sub_1004DE00C();

}

- (void)layoutSubviews
{
  _TtC20ProductPageExtension29ProductReviewsShelfHeaderView *v2;

  v2 = self;
  sub_1004DE73C();

}

- (void)sortButtonTapped
{
  _TtC20ProductPageExtension29ProductReviewsShelfHeaderView *v2;

  v2 = self;
  sub_1004DEAAC();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension29ProductReviewsShelfHeaderView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension29ProductReviewsShelfHeaderView_sortButton));
  sub_100018908(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC20ProductPageExtension29ProductReviewsShelfHeaderView_sortButtonAction), *(_QWORD *)&self->titleLabel[OBJC_IVAR____TtC20ProductPageExtension29ProductReviewsShelfHeaderView_sortButtonAction]);
}

@end
