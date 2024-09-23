@implementation AdvertisableFeatureContentView

- (_TtC18HealthExperienceUI30AdvertisableFeatureContentView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1A9662098();
}

- (void)switchValueChangedWithSender:(id)a3
{
  _TtC18HealthExperienceUI30AdvertisableFeatureContentView *v4;
  id v5;

  if (*(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC18HealthExperienceUI30AdvertisableFeatureContentView_advertisableFeatureModel))
  {
    swift_unknownObjectRetain();
    v4 = self;
    swift_retain();
    v5 = sub_1A96607E8();
    objc_msgSend(v5, sel_isOn);

    sub_1A9A930A0();
    swift_unknownObjectRelease();

    swift_release();
  }
}

- (_TtC18HealthExperienceUI30AdvertisableFeatureContentView)initWithFrame:(CGRect)a3
{
  _TtC18HealthExperienceUI30AdvertisableFeatureContentView *result;

  result = (_TtC18HealthExperienceUI30AdvertisableFeatureContentView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI30AdvertisableFeatureContentView____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI30AdvertisableFeatureContentView____lazy_storage___descriptionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI30AdvertisableFeatureContentView____lazy_storage___iconView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI30AdvertisableFeatureContentView____lazy_storage___enabledSwitch));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI30AdvertisableFeatureContentView_iconHeightConstraint));
}

@end
