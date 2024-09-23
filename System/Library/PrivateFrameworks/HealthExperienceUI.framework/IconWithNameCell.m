@implementation IconWithNameCell

- (_TtC18HealthExperienceUI16IconWithNameCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  char *v8;
  objc_class *v9;
  _TtC18HealthExperienceUI16IconWithNameCell *v10;
  void (*v11)(void);
  _TtC18HealthExperienceUI16IconWithNameCell *v12;
  objc_super v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI16IconWithNameCell_item;
  v9 = (objc_class *)type metadata accessor for IconWithNameCell();
  *(_OWORD *)v8 = 0u;
  *((_OWORD *)v8 + 1) = 0u;
  *((_QWORD *)v8 + 4) = 0;
  v14.receiver = self;
  v14.super_class = v9;
  v10 = -[IconWithNameCell initWithFrame:](&v14, sel_initWithFrame_, x, y, width, height);
  v11 = *(void (**)(void))((*MEMORY[0x1E0DEEDD8] & (uint64_t)v10->super.super.super.super.super.super.isa) + 0x70);
  v12 = v10;
  v11();

  return v12;
}

- (_TtC18HealthExperienceUI16IconWithNameCell)initWithCoder:(id)a3
{
  char *v4;
  id v5;
  _TtC18HealthExperienceUI16IconWithNameCell *result;

  v4 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI16IconWithNameCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  v5 = a3;

  result = (_TtC18HealthExperienceUI16IconWithNameCell *)sub_1A9A96970();
  __break(1u);
  return result;
}

- (void)prepareForReuse
{
  _QWORD *v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for IconWithNameCell();
  v2 = v3.receiver;
  -[IconWithNameCell prepareForReuse](&v3, sel_prepareForReuse);
  (*(void (**)(_QWORD, _QWORD, _QWORD))((*MEMORY[0x1E0DEEDD8] & *v2) + 0x88))(0, 0, 0);

}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC18HealthExperienceUI16IconWithNameCell *v8;
  uint64_t v9;

  v4 = sub_1A9A93DB4();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A9A93D9C();
  v8 = self;
  sub_1A992A81C();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void).cxx_destruct
{
  sub_1A961F39C((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI16IconWithNameCell_item, (unint64_t *)&qword_1ED27B9E0, (unint64_t *)&qword_1ED27B9D0);
}

@end
