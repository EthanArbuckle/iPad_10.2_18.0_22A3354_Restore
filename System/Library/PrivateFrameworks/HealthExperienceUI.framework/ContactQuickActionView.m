@implementation ContactQuickActionView

- (_TtC18HealthExperienceUIP33_67EC7A45FB9328F5A1BEF31B99AA524322ContactQuickActionView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1A99D6A74();
}

- (void)buttonTapped:(id)a3
{
  id v4;
  _TtC18HealthExperienceUIP33_67EC7A45FB9328F5A1BEF31B99AA524322ContactQuickActionView *v5;

  v4 = a3;
  v5 = self;
  sub_1A99D6B60();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC18HealthExperienceUIP33_67EC7A45FB9328F5A1BEF31B99AA524322ContactQuickActionView *v6;

  v5 = a3;
  v6 = self;
  sub_1A99D5968(a3);

}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  sub_1A961AEDC((uint64_t)self+ OBJC_IVAR____TtC18HealthExperienceUIP33_67EC7A45FB9328F5A1BEF31B99AA524322ContactQuickActionView_contactButtonDelegate);
  sub_1A9642C9C(*(uint64_t *)((char *)&self->super.super.super.super.super.super.isa
                           + OBJC_IVAR____TtC18HealthExperienceUIP33_67EC7A45FB9328F5A1BEF31B99AA524322ContactQuickActionView_didTapAction));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUIP33_67EC7A45FB9328F5A1BEF31B99AA524322ContactQuickActionView____lazy_storage___contactIconImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUIP33_67EC7A45FB9328F5A1BEF31B99AA524322ContactQuickActionView____lazy_storage___label));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUIP33_67EC7A45FB9328F5A1BEF31B99AA524322ContactQuickActionView____lazy_storage___labelWithIconView));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
