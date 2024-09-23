@implementation MetadataRibbonStarRatingView

- (_TtC22SubscribePageExtension28MetadataRibbonStarRatingView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension28MetadataRibbonStarRatingView *)sub_1005BDF64(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension28MetadataRibbonStarRatingView)initWithCoder:(id)a3
{
  char *v4;
  char *v5;
  uint64_t v6;
  char *v7;
  _TtC22SubscribePageExtension28MetadataRibbonStarRatingView *result;

  static MetadataRibbonStarRatingViewLayout.Metrics.standard.getter(a3);
  v4 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension28MetadataRibbonStarRatingView_id;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  v5 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension28MetadataRibbonStarRatingView_itemType;
  v6 = type metadata accessor for MetadataRibbonItemType(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension28MetadataRibbonStarRatingView_labelMaxWidth;
  *(_QWORD *)v7 = 0;
  v7[8] = 1;

  result = (_TtC22SubscribePageExtension28MetadataRibbonStarRatingView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010062E5C0, "SubscribePageExtension/MetadataRibbonStarRatingView.swift", 57, 2, 60, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC22SubscribePageExtension28MetadataRibbonStarRatingView *v2;

  v2 = self;
  sub_1005BE4EC();

}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  double height;
  double width;
  _TtC22SubscribePageExtension28MetadataRibbonStarRatingView *v8;
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
  v9 = sub_1005BE6F8((uint64_t)a4, width, height);
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

- (_TtC22SubscribePageExtension10RatingView)accessibilityStarRatingView
{
  return (_TtC22SubscribePageExtension10RatingView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                             + OBJC_IVAR____TtC22SubscribePageExtension28MetadataRibbonStarRatingView_starRatingView));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityRatingCountLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                        + OBJC_IVAR____TtC22SubscribePageExtension28MetadataRibbonStarRatingView_ratingCountLabel));
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension28MetadataRibbonStarRatingView_starRatingView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension28MetadataRibbonStarRatingView_ratingCountLabel));
  v3 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension28MetadataRibbonStarRatingView_metrics;
  v4 = type metadata accessor for MetadataRibbonStarRatingViewLayout.Metrics(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_100011088((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension28MetadataRibbonStarRatingView_id, (uint64_t *)&unk_1007F9850);
  sub_100011088((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension28MetadataRibbonStarRatingView_itemType, &qword_1007F6CD0);
}

@end
