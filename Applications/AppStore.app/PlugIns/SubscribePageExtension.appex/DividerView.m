@implementation DividerView

- (_TtC22SubscribePageExtension11DividerView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension11DividerView *)sub_1003FCB1C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension11DividerView)initWithCoder:(id)a3
{
  _OWORD *v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  _TtC22SubscribePageExtension11DividerView *result;

  v4 = (_OWORD *)((char *)self + OBJC_IVAR____TtC22SubscribePageExtension11DividerView_separatorInset);
  v5 = *(_OWORD *)&UIEdgeInsetsZero.bottom;
  *v4 = *(_OWORD *)&UIEdgeInsetsZero.top;
  v4[1] = v5;
  v6 = OBJC_IVAR____TtC22SubscribePageExtension11DividerView_style;
  v7 = qword_1007F2030;
  v8 = a3;
  if (v7 != -1)
    swift_once(&qword_1007F2030, sub_1003FC964);
  v9 = type metadata accessor for DividerView.Style(0);
  v10 = sub_1000117A8(v9, (uint64_t)qword_100854640);
  sub_1000FB5B0(v10, (uint64_t)self + v6);

  result = (_TtC22SubscribePageExtension11DividerView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010062E5C0, "SubscribePageExtension/DividerView.swift", 40, 2, 78, 0);
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
  _TtC22SubscribePageExtension11DividerView *v14;
  _TtC22SubscribePageExtension11DividerView *v15;
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
  v12 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension11DividerView_style;
  swift_beginAccess((char *)self + OBJC_IVAR____TtC22SubscribePageExtension11DividerView_style, v22, 0, 0);
  sub_1000FB5B0((uint64_t)v12, (uint64_t)v11);
  v13 = qword_1007F2028;
  v14 = self;
  v15 = v14;
  if (v13 != -1)
    v14 = (_TtC22SubscribePageExtension11DividerView *)swift_once(&qword_1007F2028, sub_1003FC8FC);
  v16 = floor(*(double *)&qword_100854638);
  static Dimensions.defaultRoundingRule.getter(v14);
  v17 = type metadata accessor for StaticDimension(0);
  v18 = AnyDimension.value(in:rounded:)(v15, v8, v17, &protocol witness table for StaticDimension);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  sub_1000FB638((uint64_t)v11);

  v19 = width;
  v20 = v16 + v18;
  result.height = v20;
  result.width = v19;
  return result;
}

- (void)layoutSubviews
{
  _TtC22SubscribePageExtension11DividerView *v2;

  v2 = self;
  sub_1003FCF24();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension11DividerView_separatorView));
  sub_1000FB638((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension11DividerView_style);
}

@end
