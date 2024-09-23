@implementation InteractionNoneFoundCell

- (_TtC19HealthMedicationsUI24InteractionNoneFoundCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  char *v8;
  objc_class *found;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI24InteractionNoneFoundCell_item;
  found = (objc_class *)type metadata accessor for InteractionNoneFoundCell();
  *(_OWORD *)v8 = 0u;
  *((_OWORD *)v8 + 1) = 0u;
  *((_QWORD *)v8 + 4) = 0;
  v11.receiver = self;
  v11.super_class = found;
  return -[InteractionNoneFoundCell initWithFrame:](&v11, sel_initWithFrame_, x, y, width, height);
}

- (_TtC19HealthMedicationsUI24InteractionNoneFoundCell)initWithCoder:(id)a3
{
  char *v5;
  objc_class *found;
  objc_super v8;

  v5 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI24InteractionNoneFoundCell_item;
  found = (objc_class *)type metadata accessor for InteractionNoneFoundCell();
  *(_OWORD *)v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *((_QWORD *)v5 + 4) = 0;
  v8.receiver = self;
  v8.super_class = found;
  return -[InteractionNoneFoundCell initWithCoder:](&v8, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  sub_1BC0E1CFC((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI24InteractionNoneFoundCell_item, (unint64_t *)&qword_1EDA0F7D0, (void (*)(uint64_t))sub_1BC0E1B94);
}

@end
