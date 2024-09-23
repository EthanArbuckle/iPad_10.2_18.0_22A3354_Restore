@implementation TopAlignedIconListCell

- (_TtC15HealthRecordsUI22TopAlignedIconListCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  char *v7;
  objc_super v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = (char *)self + OBJC_IVAR____TtC15HealthRecordsUI22TopAlignedIconListCell_item;
  *(_OWORD *)v7 = 0u;
  *((_OWORD *)v7 + 1) = 0u;
  *((_QWORD *)v7 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC15HealthRecordsUI22TopAlignedIconListCell_iconView) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC15HealthRecordsUI22TopAlignedIconListCell_listContentView) = 0;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for TopAlignedIconListCell();
  return -[TopAlignedIconListCell initWithFrame:](&v9, sel_initWithFrame_, x, y, width, height);
}

- (_TtC15HealthRecordsUI22TopAlignedIconListCell)initWithCoder:(id)a3
{
  char *v4;
  objc_super v6;

  v4 = (char *)self + OBJC_IVAR____TtC15HealthRecordsUI22TopAlignedIconListCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC15HealthRecordsUI22TopAlignedIconListCell_iconView) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC15HealthRecordsUI22TopAlignedIconListCell_listContentView) = 0;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for TopAlignedIconListCell();
  return -[TopAlignedIconListCell initWithCoder:](&v6, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  sub_1BC37AE60((uint64_t)self + OBJC_IVAR____TtC15HealthRecordsUI22TopAlignedIconListCell_item);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI22TopAlignedIconListCell_iconView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI22TopAlignedIconListCell_listContentView));
}

@end
