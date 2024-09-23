@implementation DividerView

- (_TtC8AppStore11DividerView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore11DividerView *)sub_1005B0764(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore11DividerView)initWithCoder:(id)a3
{
  _OWORD *v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  _TtC8AppStore11DividerView *result;

  v4 = (_OWORD *)((char *)self + OBJC_IVAR____TtC8AppStore11DividerView_separatorInset);
  v5 = *(_OWORD *)&UIEdgeInsetsZero.bottom;
  *v4 = *(_OWORD *)&UIEdgeInsetsZero.top;
  v4[1] = v5;
  v6 = OBJC_IVAR____TtC8AppStore11DividerView_style;
  v7 = qword_100829168;
  v8 = a3;
  if (v7 != -1)
    swift_once(&qword_100829168, sub_1005B05AC);
  v9 = type metadata accessor for DividerView.Style(0);
  v10 = sub_10007AF70(v9, (uint64_t)qword_1008905C8);
  sub_1002885FC(v10, (uint64_t)self + v6);

  result = (_TtC8AppStore11DividerView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001006A63C0, "AppStore/DividerView.swift", 26, 2, 78, 0);
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  _TtC8AppStore11DividerView *v14;
  _TtC8AppStore11DividerView *v15;
  double v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  _BYTE v22[24];
  CGSize result;

  width = a3.width;
  v5 = type metadata accessor for FloatingPointRoundingRule(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = &v22[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v9 = type metadata accessor for DividerView.Style(0);
  __chkstk_darwin(v9);
  v11 = &v22[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v12 = (char *)self + OBJC_IVAR____TtC8AppStore11DividerView_style;
  swift_beginAccess((char *)self + OBJC_IVAR____TtC8AppStore11DividerView_style, v22, 0, 0);
  sub_1002885FC((uint64_t)v12, (uint64_t)v11);
  v13 = qword_100829160;
  v14 = self;
  v15 = v14;
  if (v13 != -1)
    v14 = (_TtC8AppStore11DividerView *)swift_once(&qword_100829160, sub_1005B0544);
  v16 = floor(*(double *)&qword_1008905C0);
  static Dimensions.defaultRoundingRule.getter(v14);
  v17 = type metadata accessor for StaticDimension(0);
  v18 = AnyDimension.value(in:rounded:)(v15, v8, v17, &protocol witness table for StaticDimension);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  sub_100288684((uint64_t)v11);

  v19 = width;
  v20 = v16 + v18;
  result.height = v20;
  result.width = v19;
  return result;
}

- (void)layoutSubviews
{
  _TtC8AppStore11DividerView *v2;

  v2 = self;
  sub_1005B0B6C();

}

- (void).cxx_destruct
{

  sub_100288684((uint64_t)self + OBJC_IVAR____TtC8AppStore11DividerView_style);
}

@end
