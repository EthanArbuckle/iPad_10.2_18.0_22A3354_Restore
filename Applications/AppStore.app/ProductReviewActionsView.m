@implementation ProductReviewActionsView

- (_TtC8AppStore24ProductReviewActionsView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore24ProductReviewActionsView *)sub_1001C7D60(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore24ProductReviewActionsView)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  void (*v7)(char *, uint64_t, uint64_t, uint64_t);
  id v8;
  _TtC8AppStore24ProductReviewActionsView *result;

  v5 = (char *)self + OBJC_IVAR____TtC8AppStore24ProductReviewActionsView_writeReviewAction;
  v6 = sub_10007B804((uint64_t *)&unk_100833700);
  v7 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56);
  v7(v5, 1, 1, v6);
  v7((char *)self + OBJC_IVAR____TtC8AppStore24ProductReviewActionsView_supportAction, 1, 1, v6);
  v8 = a3;

  result = (_TtC8AppStore24ProductReviewActionsView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001006A63C0, "AppStore/ProductReviewActionsView.swift", 39, 2, 95, 0);
  __break(1u);
  return result;
}

- (void)writeReviewWithSender:(id)a3
{
  sub_1001C8950(self, (uint64_t)a2, (uint64_t)a3, (void (*)(id, __n128))sub_1001C86EC);
}

- (void)supportWithSender:(id)a3
{
  sub_1001C8950(self, (uint64_t)a2, (uint64_t)a3, (void (*)(id, __n128))sub_1001C8704);
}

- (void)layoutSubviews
{
  _TtC8AppStore24ProductReviewActionsView *v2;

  v2 = self;
  sub_1001C9278();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC8AppStore24ProductReviewActionsView *v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v7 = sub_1001C9650(width, height, (uint64_t)v5, v6);
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore24ProductReviewActionsView_writeReviewButton));
  sub_1000057AC((uint64_t)self + OBJC_IVAR____TtC8AppStore24ProductReviewActionsView_writeReviewAction, (uint64_t *)&unk_100835F20);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore24ProductReviewActionsView_supportButton));
  sub_1000057AC((uint64_t)self + OBJC_IVAR____TtC8AppStore24ProductReviewActionsView_supportAction, (uint64_t *)&unk_100835F20);
}

@end
