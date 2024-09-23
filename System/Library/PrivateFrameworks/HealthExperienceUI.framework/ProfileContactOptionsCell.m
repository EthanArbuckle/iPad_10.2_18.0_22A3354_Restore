@implementation ProfileContactOptionsCell

- (_TtC18HealthExperienceUI25ProfileContactOptionsCell)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUI25ProfileContactOptionsCell *)ProfileContactOptionsCell.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18HealthExperienceUI25ProfileContactOptionsCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1A99D68C0();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC18HealthExperienceUI25ProfileContactOptionsCell *v6;

  v5 = a3;
  v6 = self;
  sub_1A99D30E4(a3);

}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  sub_1A9618418((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI25ProfileContactOptionsCell_item);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI25ProfileContactOptionsCell_allOptionsStack));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI25ProfileContactOptionsCell_vibrancyView));
}

@end
