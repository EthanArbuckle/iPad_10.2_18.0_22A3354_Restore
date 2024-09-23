@implementation MetadataRibbonBorderedLabelWithDescriptionView

- (_TtC8AppStore46MetadataRibbonBorderedLabelWithDescriptionView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore46MetadataRibbonBorderedLabelWithDescriptionView *)sub_1000925FC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore46MetadataRibbonBorderedLabelWithDescriptionView)initWithCoder:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  char *v15;
  _TtC8AppStore46MetadataRibbonBorderedLabelWithDescriptionView *result;

  v4 = OBJC_IVAR____TtC8AppStore46MetadataRibbonBorderedLabelWithDescriptionView_metrics;
  v5 = qword_100826A98;
  v6 = a3;
  if (v5 != -1)
    swift_once(&qword_100826A98, sub_1000936FC);
  v7 = type metadata accessor for MetadataRibbonBorderedLabelWithDescriptionViewLayout.Metrics(0);
  v8 = sub_10007AF70(v7, (uint64_t)static MetadataRibbonBorderedLabelWithDescriptionViewLayout.Metrics.standard);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 16))((char *)self + v4, v8, v7);
  v9 = (char *)self + OBJC_IVAR____TtC8AppStore46MetadataRibbonBorderedLabelWithDescriptionView_borderLabelViewPlacement;
  v10 = enum case for MetadataRibbonSecondaryViewPlacement.leading(_:);
  v11 = type metadata accessor for MetadataRibbonSecondaryViewPlacement(0);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 104))(v9, v10, v11);
  v12 = (char *)self + OBJC_IVAR____TtC8AppStore46MetadataRibbonBorderedLabelWithDescriptionView_id;
  *(_OWORD *)v12 = 0u;
  *((_OWORD *)v12 + 1) = 0u;
  *((_QWORD *)v12 + 4) = 0;
  v13 = (char *)self + OBJC_IVAR____TtC8AppStore46MetadataRibbonBorderedLabelWithDescriptionView_itemType;
  v14 = type metadata accessor for MetadataRibbonItemType(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v13, 1, 1, v14);
  v15 = (char *)self + OBJC_IVAR____TtC8AppStore46MetadataRibbonBorderedLabelWithDescriptionView_labelMaxWidth;
  *(_QWORD *)v15 = 0;
  v15[8] = 1;

  result = (_TtC8AppStore46MetadataRibbonBorderedLabelWithDescriptionView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001006A63C0, "AppStore/MetadataRibbonBorderedTextLabelView.swift", 50, 2, 76, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  uint64_t v2;
  _TtC8AppStore46MetadataRibbonBorderedLabelWithDescriptionView *v3;

  v3 = self;
  sub_100092C14((uint64_t)v3, v2);

}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  double height;
  double width;
  _TtC8AppStore46MetadataRibbonBorderedLabelWithDescriptionView *v8;
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
  v9 = sub_100092DF8((uint64_t)a4, width, height);
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

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityBorderedLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                        + OBJC_IVAR____TtC8AppStore46MetadataRibbonBorderedLabelWithDescriptionView_borderedLabel));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityDescriptionLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                        + OBJC_IVAR____TtC8AppStore46MetadataRibbonBorderedLabelWithDescriptionView_descriptionLabel));
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore46MetadataRibbonBorderedLabelWithDescriptionView_borderedLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore46MetadataRibbonBorderedLabelWithDescriptionView_descriptionLabel));
  v3 = (char *)self + OBJC_IVAR____TtC8AppStore46MetadataRibbonBorderedLabelWithDescriptionView_metrics;
  v4 = type metadata accessor for MetadataRibbonBorderedLabelWithDescriptionViewLayout.Metrics(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC8AppStore46MetadataRibbonBorderedLabelWithDescriptionView_borderLabelViewPlacement;
  v6 = type metadata accessor for MetadataRibbonSecondaryViewPlacement(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  sub_1000057AC((uint64_t)self + OBJC_IVAR____TtC8AppStore46MetadataRibbonBorderedLabelWithDescriptionView_id, &qword_100829F10);
  sub_1000057AC((uint64_t)self + OBJC_IVAR____TtC8AppStore46MetadataRibbonBorderedLabelWithDescriptionView_itemType, &qword_100829F18);
}

@end
