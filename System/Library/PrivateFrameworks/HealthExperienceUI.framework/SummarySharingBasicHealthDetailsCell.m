@implementation SummarySharingBasicHealthDetailsCell

- (_TtC18HealthExperienceUI36SummarySharingBasicHealthDetailsCell)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUI36SummarySharingBasicHealthDetailsCell *)sub_1A998BD10(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18HealthExperienceUI36SummarySharingBasicHealthDetailsCell)initWithCoder:(id)a3
{
  uint64_t *v5;
  id v6;
  uint64_t v7;
  _TtC18HealthExperienceUI36SummarySharingBasicHealthDetailsCell *result;

  v5 = (uint64_t *)((char *)self
                 + OBJC_IVAR____TtC18HealthExperienceUI36SummarySharingBasicHealthDetailsCell_basicHealthDetailsView);
  type metadata accessor for SummarySharingBasicHealthDetailsItem();
  swift_allocObject();
  v6 = a3;
  sub_1A998C6D0();
  sub_1A998CBF8();
  *v5 = sub_1A9A94B40();
  v5[1] = v7;

  result = (_TtC18HealthExperienceUI36SummarySharingBasicHealthDetailsCell *)sub_1A9A96970();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
}

@end
