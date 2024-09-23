@implementation SearchTransparencyView

- (_TtC22SubscribePageExtension22SearchTransparencyView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension22SearchTransparencyView *)sub_10001125C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension22SearchTransparencyView)initWithCoder:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  id v13;
  _TtC22SubscribePageExtension22SearchTransparencyView *result;
  uint64_t v15;

  v5 = type metadata accessor for FontUseCase(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = OBJC_IVAR____TtC22SubscribePageExtension22SearchTransparencyView_linkedLabel;
  v10 = qword_1007F2608;
  v11 = a3;
  if (v10 != -1)
    swift_once(&qword_1007F2608, sub_1004164F4);
  v12 = sub_1000117A8(v5, (uint64_t)qword_100855700);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v12, v5);
  v13 = objc_allocWithZone((Class)type metadata accessor for DynamicTypeLinkedLabel(0));
  *(Class *)((char *)&self->super.super.super.super.isa + v9) = (Class)sub_100059FA0((uint64_t)v8, 0, 0, 0);

  result = (_TtC22SubscribePageExtension22SearchTransparencyView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010062E5C0, "SubscribePageExtension/SearchTransparencyView.swift", 51, 2, 54, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC22SubscribePageExtension22SearchTransparencyView *v2;

  v2 = self;
  sub_1000115D8();

}

- (void)prepareForReuse
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SearchTransparencyView();
  v2 = v3.receiver;
  -[SearchTransparencyView prepareForReuse](&v3, "prepareForReuse");
  sub_10005A648();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension22SearchTransparencyView_linkedLabel));
}

@end
