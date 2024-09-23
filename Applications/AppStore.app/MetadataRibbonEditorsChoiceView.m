@implementation MetadataRibbonEditorsChoiceView

- (_TtC8AppStore31MetadataRibbonEditorsChoiceView)initWithFrame:(CGRect)a3
{
  _TtC8AppStore31MetadataRibbonEditorsChoiceView *result;

  sub_10020DBE4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (_TtC8AppStore31MetadataRibbonEditorsChoiceView)initWithCoder:(id)a3
{
  char *v5;
  char *v6;
  uint64_t v7;
  char *v8;
  id v9;
  _TtC8AppStore31MetadataRibbonEditorsChoiceView *result;

  v5 = (char *)self + OBJC_IVAR____TtC8AppStore31MetadataRibbonEditorsChoiceView_id;
  *(_OWORD *)v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *((_QWORD *)v5 + 4) = 0;
  v6 = (char *)self + OBJC_IVAR____TtC8AppStore31MetadataRibbonEditorsChoiceView_itemType;
  v7 = type metadata accessor for MetadataRibbonItemType(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 1, 1, v7);
  v8 = (char *)self + OBJC_IVAR____TtC8AppStore31MetadataRibbonEditorsChoiceView_labelMaxWidth;
  *(_QWORD *)v8 = 0;
  v8[8] = 1;
  v9 = a3;

  result = (_TtC8AppStore31MetadataRibbonEditorsChoiceView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001006A63C0, "AppStore/MetadataRibbonEditorsChoiceView.swift", 46, 2, 59, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC8AppStore31MetadataRibbonEditorsChoiceView *v2;

  v2 = self;
  sub_10020E580();

}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  double height;
  CGFloat width;
  _TtC8AppStore31MetadataRibbonEditorsChoiceView *v8;
  __n128 v9;
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
  double v20;
  JUMeasurements result;

  height = a3.height;
  width = a3.width;
  swift_unknownObjectRetain(a4);
  v8 = self;
  v9.n128_f64[0] = width;
  v10 = sub_10020E788((uint64_t)a4, v9, height);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  swift_unknownObjectRelease(a4);

  v17 = v10;
  v18 = v12;
  v19 = v14;
  v20 = v16;
  result.var3 = v20;
  result.var2 = v19;
  result.var1 = v18;
  result.var0 = v17;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31MetadataRibbonEditorsChoiceView_leadingLaurelImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31MetadataRibbonEditorsChoiceView_trailingLaurelImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31MetadataRibbonEditorsChoiceView_editorsChoiceLabel));
  sub_1000057AC((uint64_t)self + OBJC_IVAR____TtC8AppStore31MetadataRibbonEditorsChoiceView_id, &qword_100829F10);
  sub_1000057AC((uint64_t)self + OBJC_IVAR____TtC8AppStore31MetadataRibbonEditorsChoiceView_itemType, &qword_100829F18);
}

@end
