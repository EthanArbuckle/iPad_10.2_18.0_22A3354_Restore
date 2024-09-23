@implementation SeparatorView

- (_TtC22SubscribePageExtension13SeparatorView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension13SeparatorView *)sub_1005980C8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension13SeparatorView)initWithCoder:(id)a3
{
  id v3;
  __n128 v4;

  v3 = a3;
  sub_100598890(v4);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  __n128 v10;
  _TtC22SubscribePageExtension13SeparatorView *v11;
  double v12;
  double v13;
  double v14;
  _BYTE v16[24];
  CGSize result;

  width = a3.width;
  v5 = type metadata accessor for Separator(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = &v16[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v9 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension13SeparatorView_separator;
  v10 = swift_beginAccess((char *)self + OBJC_IVAR____TtC22SubscribePageExtension13SeparatorView_separator, v16, 0, 0);
  (*(void (**)(char *, char *, uint64_t, __n128))(v6 + 16))(v8, v9, v5, v10);
  v11 = self;
  v12 = Separator.height(in:)();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

  v13 = width;
  v14 = v12;
  result.height = v14;
  result.width = v13;
  return result;
}

- (CGSize)intrinsicContentSize
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  __n128 v8;
  _TtC22SubscribePageExtension13SeparatorView *v9;
  double v10;
  double v11;
  double v12;
  _BYTE v14[24];
  CGSize result;

  v3 = type metadata accessor for Separator(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = &v14[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v7 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension13SeparatorView_separator;
  v8 = swift_beginAccess((char *)self + OBJC_IVAR____TtC22SubscribePageExtension13SeparatorView_separator, v14, 0, 0);
  (*(void (**)(char *, char *, uint64_t, __n128))(v4 + 16))(v6, v7, v3, v8);
  v9 = self;
  v10 = Separator.height(in:)();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  v11 = UIViewNoIntrinsicMetric;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)layoutSubviews
{
  _TtC22SubscribePageExtension13SeparatorView *v2;

  v2 = self;
  sub_1005984E8();

}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension13SeparatorView_lineView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension13SeparatorView_lineColor));
  sub_1000131E0((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension13SeparatorView_lineCompositingFilter);
  v3 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension13SeparatorView_separator;
  v4 = type metadata accessor for Separator(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
