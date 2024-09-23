@implementation InteractiveProductReviewsShelfHeaderView

- (_TtC22SubscribePageExtension40InteractiveProductReviewsShelfHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension40InteractiveProductReviewsShelfHeaderView *)sub_1001E0370(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension40InteractiveProductReviewsShelfHeaderView)initWithCoder:(id)a3
{
  char *v4;
  id v5;
  _TtC22SubscribePageExtension40InteractiveProductReviewsShelfHeaderView *result;

  v4 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension40InteractiveProductReviewsShelfHeaderView_currentState;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  v4[40] = 1;
  v5 = a3;

  result = (_TtC22SubscribePageExtension40InteractiveProductReviewsShelfHeaderView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010062E5C0, "SubscribePageExtension/InteractiveProductReviewsShelfHeaderView.swift", 69, 2, 36, 0);
  __break(1u);
  return result;
}

- (void)prepareForReuse
{
  char *v2;
  char *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType(self, a2);
  v2 = (char *)v4.receiver;
  -[InteractiveProductReviewsShelfHeaderView prepareForReuse](&v4, "prepareForReuse");
  objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC22SubscribePageExtension40InteractiveProductReviewsShelfHeaderView_firstColumnLabel], "setText:", 0, v4.receiver, v4.super_class);
  objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC22SubscribePageExtension40InteractiveProductReviewsShelfHeaderView_pinnedLabel], "setText:", 0);
  v3 = &v2[OBJC_IVAR____TtC22SubscribePageExtension40InteractiveProductReviewsShelfHeaderView_currentState];
  *(_OWORD *)v3 = 0u;
  *((_OWORD *)v3 + 1) = 0u;
  *((_QWORD *)v3 + 4) = 0;
  v3[40] = 1;

}

- (void)layoutSubviews
{
  uint64_t v2;
  _TtC22SubscribePageExtension40InteractiveProductReviewsShelfHeaderView *v3;

  v3 = self;
  sub_1001E0B2C((uint64_t)v3, v2);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension40InteractiveProductReviewsShelfHeaderView_firstColumnLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension40InteractiveProductReviewsShelfHeaderView_pinnedLabel));
}

@end
