@implementation ProductReviewsShelfHeaderView

- (_TtC8AppStore29ProductReviewsShelfHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore29ProductReviewsShelfHeaderView *)sub_1004D1D2C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore29ProductReviewsShelfHeaderView)initWithCoder:(id)a3
{
  _QWORD *v4;
  id v5;
  _TtC8AppStore29ProductReviewsShelfHeaderView *result;

  v4 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC8AppStore29ProductReviewsShelfHeaderView_sortButtonAction);
  *v4 = 0;
  v4[1] = 0;
  v5 = a3;

  result = (_TtC8AppStore29ProductReviewsShelfHeaderView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001006A63C0, "AppStore/ProductReviewsShelfHeaderView.swift", 44, 2, 61, 0);
  __break(1u);
  return result;
}

- (void)prepareForReuse
{
  _TtC8AppStore29ProductReviewsShelfHeaderView *v2;

  v2 = self;
  sub_1004D2094();

}

- (void)layoutSubviews
{
  _TtC8AppStore29ProductReviewsShelfHeaderView *v2;

  v2 = self;
  sub_1004D27C4();

}

- (void)sortButtonTapped
{
  _TtC8AppStore29ProductReviewsShelfHeaderView *v2;

  v2 = self;
  sub_1004D2B34();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore29ProductReviewsShelfHeaderView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore29ProductReviewsShelfHeaderView_sortButton));
  sub_10003A350(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC8AppStore29ProductReviewsShelfHeaderView_sortButtonAction), *(_QWORD *)&self->titleLabel[OBJC_IVAR____TtC8AppStore29ProductReviewsShelfHeaderView_sortButtonAction]);
}

@end
