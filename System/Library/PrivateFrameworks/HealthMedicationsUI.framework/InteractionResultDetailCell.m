@implementation InteractionResultDetailCell

- (_TtC19HealthMedicationsUI27InteractionResultDetailCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  char *v7;
  _TtC19HealthMedicationsUI27InteractionResultDetailCell *v8;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI27InteractionResultDetailCell_item;
  *(_OWORD *)v7 = 0u;
  *((_OWORD *)v7 + 1) = 0u;
  *((_QWORD *)v7 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI27InteractionResultDetailCell____lazy_storage___firstFactorView) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI27InteractionResultDetailCell____lazy_storage___separatorView) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI27InteractionResultDetailCell____lazy_storage___secondFactorView) = 0;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for InteractionResultDetailCell();
  v8 = -[InteractionResultDetailCell initWithFrame:](&v10, sel_initWithFrame_, x, y, width, height);
  -[InteractionResultDetailCell setUserInteractionEnabled:](v8, sel_setUserInteractionEnabled_, 0);
  sub_1BC19E820();
  sub_1BC19E920();

  return v8;
}

- (_TtC19HealthMedicationsUI27InteractionResultDetailCell)initWithCoder:(id)a3
{
  return (_TtC19HealthMedicationsUI27InteractionResultDetailCell *)sub_1BC19E5C8(a3);
}

- (void)awakeFromNib
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)type metadata accessor for InteractionResultDetailCell();
  -[InteractionResultDetailCell awakeFromNib](&v2, sel_awakeFromNib);
}

- (void).cxx_destruct
{
  sub_1BC0E7B24((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI27InteractionResultDetailCell_item, (unint64_t *)&qword_1EDA0F7D0, (unint64_t *)&qword_1EDA0F7C0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI27InteractionResultDetailCell____lazy_storage___firstFactorView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI27InteractionResultDetailCell____lazy_storage___separatorView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI27InteractionResultDetailCell____lazy_storage___secondFactorView));
}

@end
