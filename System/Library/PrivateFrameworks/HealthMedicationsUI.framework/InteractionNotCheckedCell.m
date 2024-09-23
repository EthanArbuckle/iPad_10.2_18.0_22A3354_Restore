@implementation InteractionNotCheckedCell

- (_TtC19HealthMedicationsUI25InteractionNotCheckedCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  char *v7;
  _TtC19HealthMedicationsUI25InteractionNotCheckedCell *v8;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI25InteractionNotCheckedCell_item;
  *(_OWORD *)v7 = 0u;
  *((_OWORD *)v7 + 1) = 0u;
  *((_QWORD *)v7 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI25InteractionNotCheckedCell____lazy_storage___medicationView) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI25InteractionNotCheckedCell____lazy_storage___titleLabel) = 0;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for InteractionNotCheckedCell();
  v8 = -[InteractionNotCheckedCell initWithFrame:](&v10, sel_initWithFrame_, x, y, width, height);
  sub_1BC103DF4();

  return v8;
}

- (_TtC19HealthMedicationsUI25InteractionNotCheckedCell)initWithCoder:(id)a3
{
  char *v4;
  objc_super v6;

  v4 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI25InteractionNotCheckedCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI25InteractionNotCheckedCell____lazy_storage___medicationView) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI25InteractionNotCheckedCell____lazy_storage___titleLabel) = 0;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for InteractionNotCheckedCell();
  return -[InteractionNotCheckedCell initWithCoder:](&v6, sel_initWithCoder_, a3);
}

- (void)awakeFromNib
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for InteractionNotCheckedCell();
  v2 = v3.receiver;
  -[InteractionNotCheckedCell awakeFromNib](&v3, sel_awakeFromNib);
  sub_1BC103DF4();

}

- (void).cxx_destruct
{
  sub_1BC0E1CFC((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI25InteractionNotCheckedCell_item, (unint64_t *)&qword_1EDA0F7D0, (void (*)(uint64_t))sub_1BC0E1B94);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI25InteractionNotCheckedCell____lazy_storage___medicationView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI25InteractionNotCheckedCell____lazy_storage___titleLabel));
}

@end
