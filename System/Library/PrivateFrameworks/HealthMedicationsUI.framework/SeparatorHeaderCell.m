@implementation SeparatorHeaderCell

- (_TtC19HealthMedicationsUI19SeparatorHeaderCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  char *v7;
  _TtC19HealthMedicationsUI19SeparatorHeaderCell *v8;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI19SeparatorHeaderCell_item;
  *(_OWORD *)v7 = 0u;
  *((_OWORD *)v7 + 1) = 0u;
  *((_QWORD *)v7 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI19SeparatorHeaderCell____lazy_storage___separatorView) = 0;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for SeparatorHeaderCell();
  v8 = -[SeparatorHeaderCell initWithFrame:](&v10, sel_initWithFrame_, x, y, width, height);
  sub_1BC1AA14C();

  return v8;
}

- (_TtC19HealthMedicationsUI19SeparatorHeaderCell)initWithCoder:(id)a3
{
  char *v4;
  id v5;
  _TtC19HealthMedicationsUI19SeparatorHeaderCell *v6;
  _TtC19HealthMedicationsUI19SeparatorHeaderCell *v7;
  _TtC19HealthMedicationsUI19SeparatorHeaderCell *v8;
  objc_super v10;

  v4 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI19SeparatorHeaderCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI19SeparatorHeaderCell____lazy_storage___separatorView) = 0;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for SeparatorHeaderCell();
  v5 = a3;
  v6 = -[SeparatorHeaderCell initWithCoder:](&v10, sel_initWithCoder_, v5);
  v7 = v6;
  if (v6)
  {
    v8 = v6;
    sub_1BC1AA14C();

  }
  return v7;
}

- (void).cxx_destruct
{
  sub_1BC0F7954((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI19SeparatorHeaderCell_item);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI19SeparatorHeaderCell____lazy_storage___separatorView));
}

@end
