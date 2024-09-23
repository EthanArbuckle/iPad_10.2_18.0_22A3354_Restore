@implementation DataTypeDetailChartCell

- (NSString)description
{
  _TtC18HealthExperienceUI23DataTypeDetailChartCell *v3;
  void *v4;

  swift_getObjectType();
  v3 = self;
  sub_1A9A96D90();
  sub_1A9A9592C();
  swift_bridgeObjectRelease();
  sub_1A9A9592C();
  sub_1A9A9691C();

  v4 = (void *)sub_1A9A9580C();
  swift_bridgeObjectRelease();
  return (NSString *)v4;
}

- (_TtC18HealthExperienceUI23DataTypeDetailChartCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  char *v8;
  objc_class *v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI23DataTypeDetailChartCell_chartViewController) = 0;
  v8 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI23DataTypeDetailChartCell_item;
  v9 = (objc_class *)type metadata accessor for DataTypeDetailChartCell();
  *(_OWORD *)v8 = 0u;
  *((_OWORD *)v8 + 1) = 0u;
  *((_QWORD *)v8 + 4) = 0;
  v11.receiver = self;
  v11.super_class = v9;
  return -[DataTypeDetailChartCell initWithFrame:](&v11, sel_initWithFrame_, x, y, width, height);
}

- (_TtC18HealthExperienceUI23DataTypeDetailChartCell)initWithCoder:(id)a3
{
  char *v5;
  objc_class *v6;
  objc_super v8;

  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI23DataTypeDetailChartCell_chartViewController) = 0;
  v5 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI23DataTypeDetailChartCell_item;
  v6 = (objc_class *)type metadata accessor for DataTypeDetailChartCell();
  *(_OWORD *)v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *((_QWORD *)v5 + 4) = 0;
  v8.receiver = self;
  v8.super_class = v6;
  return -[DataTypeDetailChartCell initWithCoder:](&v8, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI23DataTypeDetailChartCell_chartViewController));
  sub_1A961F39C((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI23DataTypeDetailChartCell_item, (unint64_t *)&qword_1ED27B9E0, (unint64_t *)&qword_1ED27B9D0);
}

- (NSString)chartOverlayVersion
{
  _TtC18HealthExperienceUI23DataTypeDetailChartCell *v2;
  id v3;

  v2 = self;
  v3 = DataTypeDetailChartCell.chartOverlayVersion.getter();

  return (NSString *)v3;
}

@end
