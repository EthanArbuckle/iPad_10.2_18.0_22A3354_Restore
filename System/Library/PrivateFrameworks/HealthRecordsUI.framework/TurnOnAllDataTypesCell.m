@implementation TurnOnAllDataTypesCell

- (_TtC15HealthRecordsUI22TurnOnAllDataTypesCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  char *v8;
  objc_class *v9;
  _TtC15HealthRecordsUI22TurnOnAllDataTypesCell *v10;
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *((_BYTE *)&self->super.super.super.super.super.super.isa
  + OBJC_IVAR____TtC15HealthRecordsUI22TurnOnAllDataTypesCell_allSwitchesOn) = 0;
  v8 = (char *)self + OBJC_IVAR____TtC15HealthRecordsUI22TurnOnAllDataTypesCell_item;
  v9 = (objc_class *)type metadata accessor for TurnOnAllDataTypesCell();
  *(_OWORD *)v8 = 0u;
  *((_OWORD *)v8 + 1) = 0u;
  *((_QWORD *)v8 + 4) = 0;
  v12.receiver = self;
  v12.super_class = v9;
  v10 = -[TurnOnAllDataTypesCell initWithFrame:](&v12, sel_initWithFrame_, x, y, width, height);
  sub_1BC401D9C();

  return v10;
}

- (_TtC15HealthRecordsUI22TurnOnAllDataTypesCell)initWithCoder:(id)a3
{
  char *v4;
  id v5;
  _TtC15HealthRecordsUI22TurnOnAllDataTypesCell *v6;
  _TtC15HealthRecordsUI22TurnOnAllDataTypesCell *v7;
  _TtC15HealthRecordsUI22TurnOnAllDataTypesCell *v8;
  objc_super v10;

  *((_BYTE *)&self->super.super.super.super.super.super.isa
  + OBJC_IVAR____TtC15HealthRecordsUI22TurnOnAllDataTypesCell_allSwitchesOn) = 0;
  v4 = (char *)self + OBJC_IVAR____TtC15HealthRecordsUI22TurnOnAllDataTypesCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for TurnOnAllDataTypesCell();
  v5 = a3;
  v6 = -[TurnOnAllDataTypesCell initWithCoder:](&v10, sel_initWithCoder_, v5);
  v7 = v6;
  if (v6)
  {
    v8 = v6;
    sub_1BC401D9C();

  }
  return v7;
}

- (void).cxx_destruct
{
  sub_1BC37AE60((uint64_t)self + OBJC_IVAR____TtC15HealthRecordsUI22TurnOnAllDataTypesCell_item);
}

@end
