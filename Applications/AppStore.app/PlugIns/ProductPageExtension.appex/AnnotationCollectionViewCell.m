@implementation AnnotationCollectionViewCell

- (_TtC20ProductPageExtension28AnnotationCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension28AnnotationCollectionViewCell *)sub_1002B31F8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension28AnnotationCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1002B6200();
}

- (void)prepareForReuse
{
  _TtC20ProductPageExtension28AnnotationCollectionViewCell *v2;

  v2 = self;
  sub_1002B38FC();

}

- (void)layoutSubviews
{
  _TtC20ProductPageExtension28AnnotationCollectionViewCell *v2;

  v2 = self;
  sub_1002B3CA8();

}

- (void)linkLabelTapped:(id)a3
{
  id v4;
  _TtC20ProductPageExtension28AnnotationCollectionViewCell *v5;

  v4 = a3;
  v5 = self;
  sub_1002B63CC();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC20ProductPageExtension28AnnotationCollectionViewCell *v6;

  v5 = a3;
  v6 = self;
  sub_1002B4CE0((uint64_t)a3);

}

- (NSArray)accessibilityDetailItems
{
  _TtC20ProductPageExtension28AnnotationCollectionViewCell *v2;
  _QWORD *v3;
  Class isa;

  v2 = self;
  v3 = sub_1002B4E20();

  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return (NSArray *)isa;
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                        + OBJC_IVAR____TtC20ProductPageExtension28AnnotationCollectionViewCell_titleLabel));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilitySummaryLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                        + OBJC_IVAR____TtC20ProductPageExtension28AnnotationCollectionViewCell_summaryLabel));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityLinkLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                        + OBJC_IVAR____TtC20ProductPageExtension28AnnotationCollectionViewCell_linkLabel));
}

- (BOOL)accessibilityCellIsExpanded
{
  return *((_BYTE *)&self->super.super.super.super.super.isa
         + OBJC_IVAR____TtC20ProductPageExtension28AnnotationCollectionViewCell_isExpanded);
}

- (BOOL)accessibilityIsSummaryExpandable
{
  _TtC20ProductPageExtension28AnnotationCollectionViewCell *v2;
  BOOL v3;

  v2 = self;
  v3 = sub_1002B1D8C();

  return v3;
}

- (void)accessibilityLinkLabelTapped
{
  _TtC20ProductPageExtension28AnnotationCollectionViewCell *v2;

  v2 = self;
  sub_1002B63CC();

}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_100010F2C((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension28AnnotationCollectionViewCell_itemLayoutContext, &qword_1008081F0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension28AnnotationCollectionViewCell_disclosureView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension28AnnotationCollectionViewCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension28AnnotationCollectionViewCell_summaryLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension28AnnotationCollectionViewCell_linkLabel));
  v3 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension28AnnotationCollectionViewCell_detailViewPool;
  v4 = sub_10000DAF8((uint64_t *)&unk_100819840);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC20ProductPageExtension28AnnotationCollectionViewCell_detailViews));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension28AnnotationCollectionViewCell_separatorLineView));
  swift_bridgeObjectRelease(*(_QWORD *)&self->disclosureView[OBJC_IVAR____TtC20ProductPageExtension28AnnotationCollectionViewCell_titleText]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->disclosureView[OBJC_IVAR____TtC20ProductPageExtension28AnnotationCollectionViewCell_explicitSummary]);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC20ProductPageExtension28AnnotationCollectionViewCell_detailItems));
  sub_100010F2C((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension28AnnotationCollectionViewCell_linkAction, &qword_100819850);
}

@end
