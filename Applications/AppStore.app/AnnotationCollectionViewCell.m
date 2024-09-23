@implementation AnnotationCollectionViewCell

- (_TtC8AppStore28AnnotationCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore28AnnotationCollectionViewCell *)sub_1000FC254(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore28AnnotationCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100101104();
}

- (void)prepareForReuse
{
  _TtC8AppStore28AnnotationCollectionViewCell *v2;

  v2 = self;
  sub_1000FC958();

}

- (void)layoutSubviews
{
  _TtC8AppStore28AnnotationCollectionViewCell *v2;

  v2 = self;
  sub_1000FCD04();

}

- (void)linkLabelTapped:(id)a3
{
  id v4;
  _TtC8AppStore28AnnotationCollectionViewCell *v5;

  v4 = a3;
  v5 = self;
  sub_1001012D0();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC8AppStore28AnnotationCollectionViewCell *v6;

  v5 = a3;
  v6 = self;
  sub_1000FDD3C((uint64_t)a3);

}

- (NSArray)accessibilityDetailItems
{
  _TtC8AppStore28AnnotationCollectionViewCell *v2;
  _QWORD *v3;
  Class isa;

  v2 = self;
  v3 = sub_1000FDE7C();

  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return (NSArray *)isa;
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                        + OBJC_IVAR____TtC8AppStore28AnnotationCollectionViewCell_titleLabel));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilitySummaryLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                        + OBJC_IVAR____TtC8AppStore28AnnotationCollectionViewCell_summaryLabel));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityLinkLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                        + OBJC_IVAR____TtC8AppStore28AnnotationCollectionViewCell_linkLabel));
}

- (BOOL)accessibilityCellIsExpanded
{
  return *((_BYTE *)&self->super.super.super.super.super.isa
         + OBJC_IVAR____TtC8AppStore28AnnotationCollectionViewCell_isExpanded);
}

- (BOOL)accessibilityIsSummaryExpandable
{
  _TtC8AppStore28AnnotationCollectionViewCell *v2;
  BOOL v3;

  v2 = self;
  v3 = sub_1000FADE8();

  return v3;
}

- (void)accessibilityLinkLabelTapped
{
  _TtC8AppStore28AnnotationCollectionViewCell *v2;

  v2 = self;
  sub_1001012D0();

}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_1000057AC((uint64_t)self + OBJC_IVAR____TtC8AppStore28AnnotationCollectionViewCell_itemLayoutContext, &qword_10082D9A0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore28AnnotationCollectionViewCell_disclosureView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore28AnnotationCollectionViewCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore28AnnotationCollectionViewCell_summaryLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore28AnnotationCollectionViewCell_linkLabel));
  v3 = (char *)self + OBJC_IVAR____TtC8AppStore28AnnotationCollectionViewCell_detailViewPool;
  v4 = sub_10007B804(&qword_10082D808);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC8AppStore28AnnotationCollectionViewCell_detailViews));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore28AnnotationCollectionViewCell_separatorLineView));
  swift_bridgeObjectRelease(*(_QWORD *)&self->disclosureView[OBJC_IVAR____TtC8AppStore28AnnotationCollectionViewCell_titleText]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->disclosureView[OBJC_IVAR____TtC8AppStore28AnnotationCollectionViewCell_explicitSummary]);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC8AppStore28AnnotationCollectionViewCell_detailItems));
  sub_1000057AC((uint64_t)self + OBJC_IVAR____TtC8AppStore28AnnotationCollectionViewCell_linkAction, (uint64_t *)&unk_100835F20);
}

@end
