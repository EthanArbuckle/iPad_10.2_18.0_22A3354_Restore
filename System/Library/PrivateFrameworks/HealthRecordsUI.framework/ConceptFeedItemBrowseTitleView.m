@implementation ConceptFeedItemBrowseTitleView

- (_TtC15HealthRecordsUI30ConceptFeedItemBrowseTitleView)initWithFrame:(CGRect)a3
{
  return (_TtC15HealthRecordsUI30ConceptFeedItemBrowseTitleView *)ConceptFeedItemBrowseTitleView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC15HealthRecordsUI30ConceptFeedItemBrowseTitleView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1BC45CDA0();
}

- (void)traitCollectionDidChangeWithTraitEnvironment:(id)a3 previousTraitCollection:(id)a4
{
  id v6;
  _TtC15HealthRecordsUI30ConceptFeedItemBrowseTitleView *v7;

  swift_unknownObjectRetain();
  v6 = a4;
  v7 = self;
  sub_1BC45D074(a4);
  swift_unknownObjectRelease();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI30ConceptFeedItemBrowseTitleView_categoryIconImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI30ConceptFeedItemBrowseTitleView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI30ConceptFeedItemBrowseTitleView_dateLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI30ConceptFeedItemBrowseTitleView_chevronView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI30ConceptFeedItemBrowseTitleView____lazy_storage___bottomConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI30ConceptFeedItemBrowseTitleView____lazy_storage___dateChevronConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI30ConceptFeedItemBrowseTitleView____lazy_storage___dateTrailingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI30ConceptFeedItemBrowseTitleView____lazy_storage___chevronTrailingConstraint));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI30ConceptFeedItemBrowseTitleView_headerImage));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI30ConceptFeedItemBrowseTitleView_categoryColor));
  swift_bridgeObjectRelease();
  sub_1BC38CD88((uint64_t)self + OBJC_IVAR____TtC15HealthRecordsUI30ConceptFeedItemBrowseTitleView_viewData);
}

@end
