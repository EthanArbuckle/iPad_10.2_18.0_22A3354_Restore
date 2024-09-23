@implementation ColorCell

- (_TtC19HealthMedicationsUI9ColorCell)initWithFrame:(CGRect)a3
{
  return (_TtC19HealthMedicationsUI9ColorCell *)sub_1BC2879A0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC19HealthMedicationsUI9ColorCell)initWithCoder:(id)a3
{
  sub_1BC288BA4((char *)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC19HealthMedicationsUI9ColorCell_deselectionBehavior, &OBJC_IVAR____TtC19HealthMedicationsUI9ColorCell____lazy_storage___gradientView, &OBJC_IVAR____TtC19HealthMedicationsUI9ColorCell_item);
}

- (void)layoutSubviews
{
  _TtC19HealthMedicationsUI9ColorCell *v2;

  v2 = self;
  sub_1BC287BF8();

}

- (BOOL)_accessibilityCellIsSelected
{
  _TtC19HealthMedicationsUI9ColorCell *v2;
  char v3;

  v2 = self;
  v3 = sub_1BC288500();

  return v3 & 1;
}

- (void).cxx_destruct
{
  sub_1BC289A7C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC19HealthMedicationsUI9ColorCell_deselectionBehavior, &OBJC_IVAR____TtC19HealthMedicationsUI9ColorCell____lazy_storage___gradientView, &OBJC_IVAR____TtC19HealthMedicationsUI9ColorCell_item);
}

@end
