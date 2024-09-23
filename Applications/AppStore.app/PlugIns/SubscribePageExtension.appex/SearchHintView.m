@implementation SearchHintView

- (_TtC22SubscribePageExtension14SearchHintView)init
{
  return (_TtC22SubscribePageExtension14SearchHintView *)sub_100548F78();
}

- (_TtC22SubscribePageExtension14SearchHintView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC22SubscribePageExtension14SearchHintView *result;

  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC22SubscribePageExtension14SearchHintView_isHighlighted) = 0;
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC22SubscribePageExtension14SearchHintView_showSeparator) = 0;
  v5 = OBJC_IVAR____TtC22SubscribePageExtension14SearchHintView_separatorView;
  v6 = objc_allocWithZone((Class)type metadata accessor for SeparatorView(0));
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC22SubscribePageExtension14SearchHintView_iconImage) = 0;

  result = (_TtC22SubscribePageExtension14SearchHintView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010062E5C0, "SubscribePageExtension/SearchHintView.swift", 43, 2, 78, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC22SubscribePageExtension14SearchHintView *v2;

  v2 = self;
  sub_1005494B4();

}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  double height;
  double width;
  _TtC22SubscribePageExtension14SearchHintView *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  JUMeasurements result;

  height = a3.height;
  width = a3.width;
  swift_unknownObjectRetain(a4);
  v8 = self;
  v9 = sub_10054A1B4(a4, width, height);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  swift_unknownObjectRelease(a4);

  v16 = v9;
  v17 = v11;
  v18 = v13;
  v19 = v15;
  result.var3 = v19;
  result.var2 = v18;
  result.var1 = v17;
  result.var0 = v16;
  return result;
}

- (_TtC22SubscribePageExtension14SearchHintView)initWithFrame:(CGRect)a3
{
  _TtC22SubscribePageExtension14SearchHintView *result;

  result = (_TtC22SubscribePageExtension14SearchHintView *)_swift_stdlib_reportUnimplementedInitializer("SubscribePageExtension.SearchHintView", 37, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension14SearchHintView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension14SearchHintView_iconView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension14SearchHintView_separatorView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension14SearchHintView_iconImage));
}

@end
