@implementation CalendarMonthHeaderView

- (_TtC8HealthUI23CalendarMonthHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC8HealthUI23CalendarMonthHeaderView *)CalendarMonthHeaderView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8HealthUI23CalendarMonthHeaderView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D7B2BE48();
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4;
  _TtC8HealthUI23CalendarMonthHeaderView *v5;

  v4 = a3;
  v5 = self;
  sub_1D7B2BAEC((uint64_t)v4);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8HealthUI23CalendarMonthHeaderView_monthLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8HealthUI23CalendarMonthHeaderView_xPositionConstraint));
}

@end
