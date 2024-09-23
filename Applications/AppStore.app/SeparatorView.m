@implementation SeparatorView

- (_TtC8AppStore13SeparatorView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore13SeparatorView *)sub_1002A1C64(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore13SeparatorView)initWithCoder:(id)a3
{
  id v3;
  __n128 v4;

  v3 = a3;
  sub_1002A2580(v4);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  _TtC8AppStore13SeparatorView *v10;
  double v11;
  double v12;
  double v13;
  _BYTE v15[24];
  CGSize result;

  width = a3.width;
  v5 = type metadata accessor for Separator(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = &v15[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v9 = (char *)self + OBJC_IVAR____TtC8AppStore13SeparatorView_separator;
  swift_beginAccess((char *)self + OBJC_IVAR____TtC8AppStore13SeparatorView_separator, v15, 0, 0);
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v8, v9, v5);
  v10 = self;
  v11 = Separator.height(in:)();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

  v12 = width;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (CGSize)intrinsicContentSize
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  _TtC8AppStore13SeparatorView *v8;
  double v9;
  double v10;
  double v11;
  _BYTE v13[24];
  CGSize result;

  v3 = type metadata accessor for Separator(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = &v13[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v7 = (char *)self + OBJC_IVAR____TtC8AppStore13SeparatorView_separator;
  swift_beginAccess((char *)self + OBJC_IVAR____TtC8AppStore13SeparatorView_separator, v13, 0, 0);
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v6, v7, v3);
  v8 = self;
  v9 = Separator.height(in:)();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  v10 = UIViewNoIntrinsicMetric;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)layoutSubviews
{
  _TtC8AppStore13SeparatorView *v2;

  v2 = self;
  sub_1002A21D8();

}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_1000608D4((uint64_t)self + OBJC_IVAR____TtC8AppStore13SeparatorView_lineCompositingFilter);
  v3 = (char *)self + OBJC_IVAR____TtC8AppStore13SeparatorView_separator;
  v4 = type metadata accessor for Separator(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
