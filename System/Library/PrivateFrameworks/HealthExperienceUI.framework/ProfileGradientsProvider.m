@implementation ProfileGradientsProvider

- (_TtC18HealthExperienceUI24ProfileGradientsProvider)init
{
  objc_class *v3;
  uint64_t v4;
  _TtC18HealthExperienceUI24ProfileGradientsProvider *v5;
  objc_super v7;
  objc_class *v8;

  v3 = (objc_class *)MEMORY[0x1E0DEE9D8];
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18HealthExperienceUI24ProfileGradientsProvider_topCategories) = (Class)MEMORY[0x1E0DEE9D8];
  v4 = OBJC_IVAR____TtC18HealthExperienceUI24ProfileGradientsProvider_colors;
  v8 = v3;
  sub_1A965DDD4();
  swift_allocObject();
  v5 = self;
  *(Class *)((char *)&self->super.isa + v4) = (Class)sub_1A9A94780();
  *(Class *)((char *)&v5->super.isa + OBJC_IVAR____TtC18HealthExperienceUI24ProfileGradientsProvider_categoriesMetadata) = v3;

  v7.receiver = v5;
  v7.super_class = (Class)type metadata accessor for ProfileGradientsProvider();
  return -[ProfileGradientsProvider init](&v7, sel_init);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
}

@end
