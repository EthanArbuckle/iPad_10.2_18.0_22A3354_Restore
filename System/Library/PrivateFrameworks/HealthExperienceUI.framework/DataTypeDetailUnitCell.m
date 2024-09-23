@implementation DataTypeDetailUnitCell

- (_TtC18HealthExperienceUI22DataTypeDetailUnitCell)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUI22DataTypeDetailUnitCell *)DataTypeDetailUnitCell.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18HealthExperienceUI22DataTypeDetailUnitCell)initWithCoder:(id)a3
{
  char *v5;
  id v6;
  _TtC18HealthExperienceUI22DataTypeDetailUnitCell *result;

  swift_unknownObjectWeakInit();
  v5 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI22DataTypeDetailUnitCell_item;
  *(_OWORD *)v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *((_QWORD *)v5 + 4) = 0;
  v6 = a3;

  result = (_TtC18HealthExperienceUI22DataTypeDetailUnitCell *)sub_1A9A96970();
  __break(1u);
  return result;
}

- (void)configureCell
{
  _TtC18HealthExperienceUI22DataTypeDetailUnitCell *v2;

  v2 = self;
  sub_1A9925A9C();

}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC18HealthExperienceUI22DataTypeDetailUnitCell *v8;
  void *v9;
  objc_class *v10;
  objc_super v11;

  v4 = sub_1A9A93DB4();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A9A93D9C();
  v8 = self;
  v9 = (void *)sub_1A9A93D90();
  v10 = (objc_class *)type metadata accessor for DataTypeDetailUnitCell();
  v11.receiver = v8;
  v11.super_class = v10;
  -[DataTypeDetailUnitCell _bridgedUpdateConfigurationUsingState:](&v11, sel__bridgedUpdateConfigurationUsingState_, v9);

  sub_1A97F9330();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  sub_1A976B244((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI22DataTypeDetailUnitCell_item, (uint64_t)&qword_1ED27B9E0, (uint64_t)sub_1A96184A8, (uint64_t (*)(_QWORD, uint64_t, uint64_t, _QWORD))sub_1A961D988);
}

@end
