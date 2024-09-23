@implementation ShapeCell

- (_TtC19HealthMedicationsUI9ShapeCell)initWithFrame:(CGRect)a3
{
  return (_TtC19HealthMedicationsUI9ShapeCell *)sub_1BC2888AC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC19HealthMedicationsUI9ShapeCell)initWithCoder:(id)a3
{
  sub_1BC288BA4((char *)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC19HealthMedicationsUI9ShapeCell_deselectionBehavior, &OBJC_IVAR____TtC19HealthMedicationsUI9ShapeCell____lazy_storage___shapeView, &OBJC_IVAR____TtC19HealthMedicationsUI9ShapeCell_item);
}

- (void)layoutSubviews
{
  _TtC19HealthMedicationsUI9ShapeCell *v2;

  v2 = self;
  sub_1BC288C7C();

}

- (void)prepareForReuse
{
  id v2;
  uint64_t v3;
  _OWORD v4[2];
  uint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  v2 = v6.receiver;
  -[ShapeCell prepareForReuse](&v6, sel_prepareForReuse);
  v5 = 0;
  memset(v4, 0, sizeof(v4));
  v3 = (uint64_t)v2 + OBJC_IVAR____TtC19HealthMedicationsUI9ShapeCell_item;
  swift_beginAccess();
  sub_1BC0F3E44((uint64_t)v4, v3);
  swift_endAccess();
  sub_1BC288E18();
  sub_1BC0E1CFC((uint64_t)v4, (unint64_t *)&qword_1EDA0F7D0, (void (*)(uint64_t))sub_1BC0E1B94);

}

- (BOOL)_accessibilityCellIsSelected
{
  _TtC19HealthMedicationsUI9ShapeCell *v2;
  char v3;

  v2 = self;
  v3 = sub_1BC28982C();

  return v3 & 1;
}

- (void).cxx_destruct
{
  sub_1BC289A7C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC19HealthMedicationsUI9ShapeCell_deselectionBehavior, &OBJC_IVAR____TtC19HealthMedicationsUI9ShapeCell____lazy_storage___shapeView, &OBJC_IVAR____TtC19HealthMedicationsUI9ShapeCell_item);
}

@end
