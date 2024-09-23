@implementation ChartCell

- (_TtC15HealthRecordsUI9ChartCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  char *v8;
  objc_class *v9;
  _TtC15HealthRecordsUI9ChartCell *v10;
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (char *)self + OBJC_IVAR____TtC15HealthRecordsUI9ChartCell_item;
  v9 = (objc_class *)type metadata accessor for ChartCell();
  *(_OWORD *)v8 = 0u;
  *((_OWORD *)v8 + 1) = 0u;
  *((_QWORD *)v8 + 4) = 0;
  v12.receiver = self;
  v12.super_class = v9;
  v10 = -[ChartCell initWithFrame:](&v12, sel_initWithFrame_, x, y, width, height);
  sub_1BC55BC3C();

  return v10;
}

- (_TtC15HealthRecordsUI9ChartCell)initWithCoder:(id)a3
{
  char *v5;
  objc_class *v6;
  objc_super v8;

  v5 = (char *)self + OBJC_IVAR____TtC15HealthRecordsUI9ChartCell_item;
  v6 = (objc_class *)type metadata accessor for ChartCell();
  *(_OWORD *)v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *((_QWORD *)v5 + 4) = 0;
  v8.receiver = self;
  v8.super_class = v6;
  return -[ChartCell initWithCoder:](&v8, sel_initWithCoder_, a3);
}

- (void)awakeFromNib
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ChartCell();
  v2 = v3.receiver;
  -[ChartCell awakeFromNib](&v3, sel_awakeFromNib);
  sub_1BC55BC3C();

}

- (void)didMoveToSuperview
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE v5[24];
  uint64_t v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for ChartCell();
  v2 = v7.receiver;
  -[ChartCell didMoveToSuperview](&v7, sel_didMoveToSuperview);
  v3 = (uint64_t)v2 + OBJC_IVAR____TtC15HealthRecordsUI9ChartCell_item;
  swift_beginAccess();
  sub_1BC37ADB0(v3, (uint64_t)v5);
  v4 = v6;
  sub_1BC37AE60((uint64_t)v5);
  if (v4)
    sub_1BC55C3AC();

}

- (void).cxx_destruct
{
  sub_1BC37AE60((uint64_t)self + OBJC_IVAR____TtC15HealthRecordsUI9ChartCell_item);
}

@end
