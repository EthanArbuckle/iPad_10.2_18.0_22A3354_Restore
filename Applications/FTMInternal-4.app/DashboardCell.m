@implementation DashboardCell

- (_TtC13FTMInternal_413DashboardCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  return (_TtC13FTMInternal_413DashboardCell *)sub_100164E98((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1001638D4);
}

- (_TtC13FTMInternal_413DashboardCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10016610C();
}

- (void)prepareForReuse
{
  sub_10016346C(self, (uint64_t)a2, type metadata accessor for DashboardCell, (void (*)(id))sub_10016457C);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13FTMInternal_413DashboardCell____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13FTMInternal_413DashboardCell____lazy_storage___subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13FTMInternal_413DashboardCell____lazy_storage___bottomLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13FTMInternal_413DashboardCell____lazy_storage___valueLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13FTMInternal_413DashboardCell____lazy_storage___activityIndicator));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13FTMInternal_413DashboardCell____lazy_storage___separatorView));
}

@end
