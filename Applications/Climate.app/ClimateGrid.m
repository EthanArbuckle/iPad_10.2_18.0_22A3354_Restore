@implementation ClimateGrid

- (_TtC7Climate11ClimateGrid)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Climate11ClimateGrid_grid) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for ClimateGrid();
  return -[ClimateGrid initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC7Climate11ClimateGrid)initWithCoder:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Climate11ClimateGrid_grid) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ClimateGrid();
  return -[ClimateGrid initWithCoder:](&v5, "initWithCoder:", a3);
}

- (void).cxx_destruct
{

}

@end
