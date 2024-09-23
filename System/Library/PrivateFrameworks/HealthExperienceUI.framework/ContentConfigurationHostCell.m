@implementation ContentConfigurationHostCell

- (_TtC18HealthExperienceUI28ContentConfigurationHostCell)initWithCoder:(id)a3
{
  return (_TtC18HealthExperienceUI28ContentConfigurationHostCell *)ContentConfigurationHostCell.init(coder:)(a3);
}

- (_TtC18HealthExperienceUI28ContentConfigurationHostCell)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUI28ContentConfigurationHostCell *)ContentConfigurationHostCell.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)layoutSubviews
{
  _TtC18HealthExperienceUI28ContentConfigurationHostCell *v2;

  v2 = self;
  sub_1A98D0710();

}

- (void)didLongPress:(id)a3
{
  _TtC18HealthExperienceUI28ContentConfigurationHostCell *v4;
  uint64_t v5;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1A9A96670();
  swift_unknownObjectRelease();
  sub_1A98D0864();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v5);
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC18HealthExperienceUI28ContentConfigurationHostCell *v8;
  uint64_t v9;

  v4 = sub_1A9A93DB4();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A9A93D9C();
  v8 = self;
  sub_1A98D1950((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void).cxx_destruct
{
  swift_release();
  swift_unknownObjectWeakDestroy();
  sub_1A9761AD0((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI28ContentConfigurationHostCell_currentViewModel, (uint64_t)&qword_1ED277110, (uint64_t)&qword_1ED277108, (uint64_t)&protocol descriptor for PluginViewModel, (uint64_t (*)(_QWORD))sub_1A961F3D8);
  sub_1A9761AD0((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI28ContentConfigurationHostCell_previousViewModel, (uint64_t)&qword_1ED277110, (uint64_t)&qword_1ED277108, (uint64_t)&protocol descriptor for PluginViewModel, (uint64_t (*)(_QWORD))sub_1A961F3D8);
  swift_release();
  sub_1A9761AD0((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI28ContentConfigurationHostCell_configurationProvider, (uint64_t)&qword_1ED277B18, (uint64_t)&qword_1ED277B10, (uint64_t)&protocol descriptor for AnyConfigurationProvider, (uint64_t (*)(_QWORD))sub_1A961F3D8);
  swift_bridgeObjectRelease();
  sub_1A9761AD0((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI28ContentConfigurationHostCell_item, (uint64_t)&qword_1ED27B9E0, (uint64_t)&qword_1ED27B9D0, MEMORY[0x1E0D2A060], (uint64_t (*)(_QWORD))sub_1A961F3D8);
}

@end
