@implementation ProductReviewActionsView

- (_TtC22SubscribePageExtension24ProductReviewActionsView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension24ProductReviewActionsView *)sub_1003CAEA0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension24ProductReviewActionsView)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  void (*v7)(char *, uint64_t, uint64_t, uint64_t);
  id v8;
  _TtC22SubscribePageExtension24ProductReviewActionsView *result;

  v5 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension24ProductReviewActionsView_writeReviewAction;
  v6 = sub_10000DF3C((uint64_t *)&unk_1008052D0);
  v7 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56);
  v7(v5, 1, 1, v6);
  v7((char *)self + OBJC_IVAR____TtC22SubscribePageExtension24ProductReviewActionsView_supportAction, 1, 1, v6);
  v8 = a3;

  result = (_TtC22SubscribePageExtension24ProductReviewActionsView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010062E5C0, "SubscribePageExtension/ProductReviewActionsView.swift", 53, 2, 95, 0);
  __break(1u);
  return result;
}

- (void)writeReviewWithSender:(id)a3
{
  sub_1003CB628(self, (uint64_t)a2, (uint64_t)a3, (void (*)(id, __n128))sub_1003CB3C4);
}

- (void)supportWithSender:(id)a3
{
  sub_1003CB628(self, (uint64_t)a2, (uint64_t)a3, (void (*)(id, __n128))sub_1003CB3DC);
}

- (void)layoutSubviews
{
  _TtC22SubscribePageExtension24ProductReviewActionsView *v2;

  v2 = self;
  sub_1003CBF50();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC22SubscribePageExtension24ProductReviewActionsView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = sub_1003CC328(width, height);
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension24ProductReviewActionsView_writeReviewButton));
  sub_100011088((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension24ProductReviewActionsView_writeReviewAction, (uint64_t *)&unk_1008052E0);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension24ProductReviewActionsView_supportButton));
  sub_100011088((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension24ProductReviewActionsView_supportAction, (uint64_t *)&unk_1008052E0);
}

@end
