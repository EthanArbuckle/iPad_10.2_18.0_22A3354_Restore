@implementation MetadataRibbonBorderedLabelWithDescriptionView

- (_TtC22SubscribePageExtension46MetadataRibbonBorderedLabelWithDescriptionView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension46MetadataRibbonBorderedLabelWithDescriptionView *)sub_1005D8610(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension46MetadataRibbonBorderedLabelWithDescriptionView)initWithCoder:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  __n128 v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  char *v16;
  _TtC22SubscribePageExtension46MetadataRibbonBorderedLabelWithDescriptionView *result;

  v4 = OBJC_IVAR____TtC22SubscribePageExtension46MetadataRibbonBorderedLabelWithDescriptionView_metrics;
  v5 = qword_1007F32D8;
  v6 = a3;
  if (v5 != -1)
    swift_once(&qword_1007F32D8, sub_1005D9668);
  v8 = type metadata accessor for MetadataRibbonBorderedLabelWithDescriptionViewLayout.Metrics(0, v7);
  v9 = sub_1000117A8(v8, (uint64_t)static MetadataRibbonBorderedLabelWithDescriptionViewLayout.Metrics.standard);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 16))((char *)self + v4, v9, v8);
  v10 = (char *)self
      + OBJC_IVAR____TtC22SubscribePageExtension46MetadataRibbonBorderedLabelWithDescriptionView_borderLabelViewPlacement;
  v11 = enum case for MetadataRibbonSecondaryViewPlacement.leading(_:);
  v12 = type metadata accessor for MetadataRibbonSecondaryViewPlacement(0);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 104))(v10, v11, v12);
  v13 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension46MetadataRibbonBorderedLabelWithDescriptionView_id;
  *(_OWORD *)v13 = 0u;
  *((_OWORD *)v13 + 1) = 0u;
  *((_QWORD *)v13 + 4) = 0;
  v14 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension46MetadataRibbonBorderedLabelWithDescriptionView_itemType;
  v15 = type metadata accessor for MetadataRibbonItemType(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v14, 1, 1, v15);
  v16 = (char *)self
      + OBJC_IVAR____TtC22SubscribePageExtension46MetadataRibbonBorderedLabelWithDescriptionView_labelMaxWidth;
  *(_QWORD *)v16 = 0;
  v16[8] = 1;

  result = (_TtC22SubscribePageExtension46MetadataRibbonBorderedLabelWithDescriptionView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010062E5C0, "SubscribePageExtension/MetadataRibbonBorderedTextLabelView.swift", 64, 2, 76, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC22SubscribePageExtension46MetadataRibbonBorderedLabelWithDescriptionView *v2;

  v2 = self;
  sub_1005D8C28();

}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  double height;
  CGFloat width;
  _TtC22SubscribePageExtension46MetadataRibbonBorderedLabelWithDescriptionView *v8;
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
  v10 = sub_1005D8E0C((uint64_t)a4, v9, height);
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

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityBorderedLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                        + OBJC_IVAR____TtC22SubscribePageExtension46MetadataRibbonBorderedLabelWithDescriptionView_borderedLabel));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityDescriptionLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                        + OBJC_IVAR____TtC22SubscribePageExtension46MetadataRibbonBorderedLabelWithDescriptionView_descriptionLabel));
}

- (void).cxx_destruct
{
  char *v3;
  __n128 v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension46MetadataRibbonBorderedLabelWithDescriptionView_borderedLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension46MetadataRibbonBorderedLabelWithDescriptionView_descriptionLabel));
  v3 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension46MetadataRibbonBorderedLabelWithDescriptionView_metrics;
  v5 = type metadata accessor for MetadataRibbonBorderedLabelWithDescriptionViewLayout.Metrics(0, v4);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v3, v5);
  v6 = (char *)self
     + OBJC_IVAR____TtC22SubscribePageExtension46MetadataRibbonBorderedLabelWithDescriptionView_borderLabelViewPlacement;
  v7 = type metadata accessor for MetadataRibbonSecondaryViewPlacement(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  sub_100011088((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension46MetadataRibbonBorderedLabelWithDescriptionView_id, (uint64_t *)&unk_1007F9850);
  sub_100011088((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension46MetadataRibbonBorderedLabelWithDescriptionView_itemType, &qword_1007F6CD0);
}

@end
