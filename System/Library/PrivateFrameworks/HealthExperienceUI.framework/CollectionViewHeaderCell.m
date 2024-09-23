@implementation CollectionViewHeaderCell

- (_TtC18HealthExperienceUI24CollectionViewHeaderCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  char *v8;
  objc_class *v9;
  _TtC18HealthExperienceUI24CollectionViewHeaderCell *v10;
  void (*v11)(void);
  _TtC18HealthExperienceUI24CollectionViewHeaderCell *v12;
  objc_super v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI24CollectionViewHeaderCell_item;
  v9 = (objc_class *)type metadata accessor for CollectionViewHeaderCell();
  *(_OWORD *)v8 = 0u;
  *((_OWORD *)v8 + 1) = 0u;
  *((_QWORD *)v8 + 4) = 0;
  v14.receiver = self;
  v14.super_class = v9;
  v10 = -[CollectionViewHeaderCell initWithFrame:](&v14, sel_initWithFrame_, x, y, width, height);
  v11 = *(void (**)(void))((*MEMORY[0x1E0DEEDD8] & (uint64_t)v10->super.super.super.super.super.super.isa) + 0x70);
  v12 = v10;
  v11();

  return v12;
}

- (_TtC18HealthExperienceUI24CollectionViewHeaderCell)initWithCoder:(id)a3
{
  char *v4;
  id v5;
  _TtC18HealthExperienceUI24CollectionViewHeaderCell *result;

  v4 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI24CollectionViewHeaderCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  v5 = a3;

  result = (_TtC18HealthExperienceUI24CollectionViewHeaderCell *)sub_1A9A96970();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1A961F39C((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI24CollectionViewHeaderCell_item, (unint64_t *)&qword_1ED27B9E0, (unint64_t *)&qword_1ED27B9D0);
}

@end
