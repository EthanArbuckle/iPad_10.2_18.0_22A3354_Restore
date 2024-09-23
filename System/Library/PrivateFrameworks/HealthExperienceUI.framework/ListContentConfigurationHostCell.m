@implementation ListContentConfigurationHostCell

- (int64_t)tintAdjustmentMode
{
  _TtC18HealthExperienceUI32ListContentConfigurationHostCell *v2;
  id v3;

  v2 = self;
  v3 = sub_1A9A647D8();

  return (int64_t)v3;
}

- (void)setTintAdjustmentMode:(int64_t)a3
{
  _TtC18HealthExperienceUI32ListContentConfigurationHostCell *v4;

  v4 = self;
  sub_1A9A64A28(a3);

}

- (_TtC18HealthExperienceUI32ListContentConfigurationHostCell)initWithCoder:(id)a3
{
  return (_TtC18HealthExperienceUI32ListContentConfigurationHostCell *)ListContentConfigurationHostCell.init(coder:)(a3);
}

- (_TtC18HealthExperienceUI32ListContentConfigurationHostCell)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUI32ListContentConfigurationHostCell *)ListContentConfigurationHostCell.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC18HealthExperienceUI32ListContentConfigurationHostCell *v8;
  uint64_t v9;

  v4 = sub_1A9A93DB4();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A9A93D9C();
  v8 = self;
  sub_1A9A65D28((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void).cxx_destruct
{
  swift_release();
  swift_unknownObjectWeakDestroy();
  sub_1A961F39C((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI32ListContentConfigurationHostCell_currentViewModel, (unint64_t *)&qword_1ED277110, (unint64_t *)&qword_1ED277108);
  sub_1A961F39C((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI32ListContentConfigurationHostCell_configurationProvider, &qword_1ED277B18, &qword_1ED277B10);
  swift_bridgeObjectRelease();
  sub_1A961F39C((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI32ListContentConfigurationHostCell_item, (unint64_t *)&qword_1ED27B9E0, (unint64_t *)&qword_1ED27B9D0);
}

@end
