@implementation InteractionSeparatorLineCell

- (_TtC19HealthMedicationsUI28InteractionSeparatorLineCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  char *v7;
  _TtC19HealthMedicationsUI28InteractionSeparatorLineCell *v8;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI28InteractionSeparatorLineCell_item;
  *(_OWORD *)v7 = 0u;
  *((_OWORD *)v7 + 1) = 0u;
  *((_QWORD *)v7 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI28InteractionSeparatorLineCell____lazy_storage___separatorView) = 0;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for InteractionSeparatorLineCell();
  v8 = -[InteractionSeparatorLineCell initWithFrame:](&v10, sel_initWithFrame_, x, y, width, height);
  sub_1BC160AD8();

  return v8;
}

- (_TtC19HealthMedicationsUI28InteractionSeparatorLineCell)initWithCoder:(id)a3
{
  char *v4;
  objc_super v6;

  v4 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI28InteractionSeparatorLineCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI28InteractionSeparatorLineCell____lazy_storage___separatorView) = 0;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for InteractionSeparatorLineCell();
  return -[InteractionSeparatorLineCell initWithCoder:](&v6, sel_initWithCoder_, a3);
}

- (void)awakeFromNib
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for InteractionSeparatorLineCell();
  v2 = v3.receiver;
  -[InteractionSeparatorLineCell awakeFromNib](&v3, sel_awakeFromNib);
  sub_1BC160AD8();

}

- (void).cxx_destruct
{
  sub_1BC0F7954((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI28InteractionSeparatorLineCell_item);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI28InteractionSeparatorLineCell____lazy_storage___separatorView));
}

@end
