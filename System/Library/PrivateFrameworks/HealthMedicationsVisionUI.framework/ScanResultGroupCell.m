@implementation ScanResultGroupCell

- (_TtC25HealthMedicationsVisionUI19ScanResultGroupCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  char *v8;
  objc_class *v9;
  _TtC25HealthMedicationsVisionUI19ScanResultGroupCell *v10;
  id v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (char *)self + OBJC_IVAR____TtC25HealthMedicationsVisionUI19ScanResultGroupCell_item;
  v9 = (objc_class *)type metadata accessor for ScanResultGroupCell();
  *(_OWORD *)v8 = 0u;
  *((_OWORD *)v8 + 1) = 0u;
  *((_QWORD *)v8 + 4) = 0;
  v13.receiver = self;
  v13.super_class = v9;
  v10 = -[ScanResultGroupCell initWithFrame:](&v13, sel_initWithFrame_, x, y, width, height);
  sub_21C2C1A48();
  v11 = (id)*MEMORY[0x24BDE58E8];
  sub_21C2C2468();

  return v10;
}

- (_TtC25HealthMedicationsVisionUI19ScanResultGroupCell)initWithCoder:(id)a3
{
  char *v4;
  id v5;
  _TtC25HealthMedicationsVisionUI19ScanResultGroupCell *result;

  v4 = (char *)self + OBJC_IVAR____TtC25HealthMedicationsVisionUI19ScanResultGroupCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  v5 = a3;

  result = (_TtC25HealthMedicationsVisionUI19ScanResultGroupCell *)sub_21C2C26C0();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_21C29E8F8((uint64_t)self + OBJC_IVAR____TtC25HealthMedicationsVisionUI19ScanResultGroupCell_item);
}

@end
