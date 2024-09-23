@implementation MetadataRibbonIconWithLabelView

- (_TtC22SubscribePageExtension31MetadataRibbonIconWithLabelView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension31MetadataRibbonIconWithLabelView *)sub_1002C6884(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension31MetadataRibbonIconWithLabelView)initWithCoder:(id)a3
{
  sub_1002C8D78((uint64_t)a3);
}

- (void)layoutSubviews
{
  uint64_t v2;
  _TtC22SubscribePageExtension31MetadataRibbonIconWithLabelView *v3;

  v3 = self;
  sub_1002C715C((uint64_t)v3, v2);

}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  double height;
  double width;
  _TtC22SubscribePageExtension31MetadataRibbonIconWithLabelView *v8;
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
  v9 = sub_1002C736C((uint64_t)a4, width, height);
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

- (_TtC11AppStoreKit11ArtworkView)accessibilityArtworkView
{
  return (_TtC11AppStoreKit11ArtworkView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                   + OBJC_IVAR____TtC22SubscribePageExtension31MetadataRibbonIconWithLabelView_artworkView));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityUILabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                        + OBJC_IVAR____TtC22SubscribePageExtension31MetadataRibbonIconWithLabelView_label));
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension31MetadataRibbonIconWithLabelView_metrics;
  v4 = type metadata accessor for MetadataRibbonIconWithLabelViewLayout.Metrics(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension31MetadataRibbonIconWithLabelView_label));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension31MetadataRibbonIconWithLabelView_artworkView));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC22SubscribePageExtension31MetadataRibbonIconWithLabelView_artwork));
  sub_100011088((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension31MetadataRibbonIconWithLabelView_id, (uint64_t *)&unk_1007F9850);
  sub_100011088((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension31MetadataRibbonIconWithLabelView_itemType, &qword_1007F6CD0);
  sub_1002C8C54((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension31MetadataRibbonIconWithLabelView_configuration);
}

@end
