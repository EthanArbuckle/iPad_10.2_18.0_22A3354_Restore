@implementation AnnotationCollectionViewCell

- (_TtC22SubscribePageExtension28AnnotationCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension28AnnotationCollectionViewCell *)sub_100220BC4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension28AnnotationCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1002242E0();
}

- (void)prepareForReuse
{
  _TtC22SubscribePageExtension28AnnotationCollectionViewCell *v2;

  v2 = self;
  sub_1002212C8();

}

- (void)layoutSubviews
{
  _TtC22SubscribePageExtension28AnnotationCollectionViewCell *v2;

  v2 = self;
  sub_100221674();

}

- (void)linkLabelTapped:(id)a3
{
  id v4;
  _TtC22SubscribePageExtension28AnnotationCollectionViewCell *v5;

  v4 = a3;
  v5 = self;
  sub_1002244AC();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC22SubscribePageExtension28AnnotationCollectionViewCell *v6;

  v5 = a3;
  v6 = self;
  sub_100222D48((uint64_t)a3);

}

- (NSArray)accessibilityDetailItems
{
  _TtC22SubscribePageExtension28AnnotationCollectionViewCell *v2;
  _QWORD *v3;
  Class isa;

  v2 = self;
  v3 = sub_100222E88();

  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return (NSArray *)isa;
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                        + OBJC_IVAR____TtC22SubscribePageExtension28AnnotationCollectionViewCell_titleLabel));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilitySummaryLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                        + OBJC_IVAR____TtC22SubscribePageExtension28AnnotationCollectionViewCell_summaryLabel));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityLinkLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                        + OBJC_IVAR____TtC22SubscribePageExtension28AnnotationCollectionViewCell_linkLabel));
}

- (BOOL)accessibilityCellIsExpanded
{
  return *((_BYTE *)&self->super.super.super.super.super.isa
         + OBJC_IVAR____TtC22SubscribePageExtension28AnnotationCollectionViewCell_isExpanded);
}

- (BOOL)accessibilityIsSummaryExpandable
{
  _TtC22SubscribePageExtension28AnnotationCollectionViewCell *v2;
  BOOL v3;

  v2 = self;
  v3 = sub_100221EE8();

  return v3;
}

- (void)accessibilityLinkLabelTapped
{
  _TtC22SubscribePageExtension28AnnotationCollectionViewCell *v2;

  v2 = self;
  sub_1002244AC();

}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_100011088((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension28AnnotationCollectionViewCell_itemLayoutContext, &qword_1007F4A50);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension28AnnotationCollectionViewCell_disclosureView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension28AnnotationCollectionViewCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension28AnnotationCollectionViewCell_summaryLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension28AnnotationCollectionViewCell_linkLabel));
  v3 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension28AnnotationCollectionViewCell_detailViewPool;
  v4 = sub_10000DF3C((uint64_t *)&unk_100802210);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC22SubscribePageExtension28AnnotationCollectionViewCell_detailViews));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension28AnnotationCollectionViewCell_separatorLineView));
  swift_bridgeObjectRelease(*(_QWORD *)&self->disclosureView[OBJC_IVAR____TtC22SubscribePageExtension28AnnotationCollectionViewCell_titleText]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->disclosureView[OBJC_IVAR____TtC22SubscribePageExtension28AnnotationCollectionViewCell_explicitSummary]);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC22SubscribePageExtension28AnnotationCollectionViewCell_detailItems));
  sub_100011088((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension28AnnotationCollectionViewCell_linkAction, (uint64_t *)&unk_1008052E0);
}

@end
