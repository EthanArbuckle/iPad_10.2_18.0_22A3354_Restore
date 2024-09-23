@implementation SummarySharingProfileHeaderCell

- (_TtC18HealthExperienceUI31SummarySharingProfileHeaderCell)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUI31SummarySharingProfileHeaderCell *)sub_1A96E72D4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18HealthExperienceUI31SummarySharingProfileHeaderCell)initWithCoder:(id)a3
{
  uint64_t *v5;
  id v6;
  uint64_t v7;
  _TtC18HealthExperienceUI31SummarySharingProfileHeaderCell *result;

  v5 = (uint64_t *)((char *)self
                 + OBJC_IVAR____TtC18HealthExperienceUI31SummarySharingProfileHeaderCell_sharingProfileView);
  type metadata accessor for SummarySharingProfileHeaderItem();
  swift_allocObject();
  v6 = a3;
  sub_1A96E8630();
  sub_1A96156AC(&qword_1EEB0E650, (uint64_t (*)(uint64_t))type metadata accessor for SummarySharingProfileHeaderItem, (uint64_t)&unk_1A9AA80A8);
  *v5 = sub_1A9A94B40();
  v5[1] = v7;

  result = (_TtC18HealthExperienceUI31SummarySharingProfileHeaderCell *)sub_1A9A96970();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
}

@end
