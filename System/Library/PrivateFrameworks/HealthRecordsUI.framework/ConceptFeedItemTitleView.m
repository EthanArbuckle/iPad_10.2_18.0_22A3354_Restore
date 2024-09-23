@implementation ConceptFeedItemTitleView

- (NSLayoutYAxisAnchor)lastBaselineAnchor
{
  return (NSLayoutYAxisAnchor *)objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC15HealthRecordsUI24ConceptFeedItemTitleView_titleLabel), sel_lastBaselineAnchor);
}

- (_TtC15HealthRecordsUI24ConceptFeedItemTitleView)initWithFrame:(CGRect)a3
{
  return (_TtC15HealthRecordsUI24ConceptFeedItemTitleView *)ConceptFeedItemTitleView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC15HealthRecordsUI24ConceptFeedItemTitleView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1BC38E2B4();
}

- (void)traitCollectionDidChangeWithTraitEnvironment:(id)a3 previousTraitCollection:(id)a4
{
  id v6;
  _TtC15HealthRecordsUI24ConceptFeedItemTitleView *v7;

  swift_unknownObjectRetain();
  v6 = a4;
  v7 = self;
  sub_1BC38E5BC(a4);
  swift_unknownObjectRelease();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI24ConceptFeedItemTitleView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI24ConceptFeedItemTitleView_dateLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI24ConceptFeedItemTitleView_chevronView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI24ConceptFeedItemTitleView____lazy_storage___bottomConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI24ConceptFeedItemTitleView____lazy_storage___dateChevronConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI24ConceptFeedItemTitleView____lazy_storage___dateTrailingConstraint));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI24ConceptFeedItemTitleView_headerImage));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI24ConceptFeedItemTitleView_categoryColor));
  swift_bridgeObjectRelease();
  sub_1BC38CD88((uint64_t)self + OBJC_IVAR____TtC15HealthRecordsUI24ConceptFeedItemTitleView_viewData);
}

@end
