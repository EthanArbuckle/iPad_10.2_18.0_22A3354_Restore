@implementation ProductReviewsShelfHeaderView

- (_TtC22SubscribePageExtension29ProductReviewsShelfHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension29ProductReviewsShelfHeaderView *)sub_100199544(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension29ProductReviewsShelfHeaderView)initWithCoder:(id)a3
{
  _QWORD *v4;
  id v5;
  _TtC22SubscribePageExtension29ProductReviewsShelfHeaderView *result;

  v4 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC22SubscribePageExtension29ProductReviewsShelfHeaderView_sortButtonAction);
  *v4 = 0;
  v4[1] = 0;
  v5 = a3;

  result = (_TtC22SubscribePageExtension29ProductReviewsShelfHeaderView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010062E5C0, "SubscribePageExtension/ProductReviewsShelfHeaderView.swift", 58, 2, 61, 0);
  __break(1u);
  return result;
}

- (void)prepareForReuse
{
  _TtC22SubscribePageExtension29ProductReviewsShelfHeaderView *v2;

  v2 = self;
  sub_1001998AC();

}

- (void)layoutSubviews
{
  _TtC22SubscribePageExtension29ProductReviewsShelfHeaderView *v2;

  v2 = self;
  sub_10019A3E0();

}

- (void)sortButtonTapped
{
  _TtC22SubscribePageExtension29ProductReviewsShelfHeaderView *v2;

  v2 = self;
  sub_10019A750();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension29ProductReviewsShelfHeaderView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension29ProductReviewsShelfHeaderView_sortButton));
  sub_100019310(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC22SubscribePageExtension29ProductReviewsShelfHeaderView_sortButtonAction), *(_QWORD *)&self->titleLabel[OBJC_IVAR____TtC22SubscribePageExtension29ProductReviewsShelfHeaderView_sortButtonAction]);
}

@end
