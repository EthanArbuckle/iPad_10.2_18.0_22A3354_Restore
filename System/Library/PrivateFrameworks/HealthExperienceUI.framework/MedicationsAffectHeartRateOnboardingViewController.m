@implementation MedicationsAffectHeartRateOnboardingViewController

- (void)viewDidLoad
{
  _TtC18HealthExperienceUI50MedicationsAffectHeartRateOnboardingViewController *v2;

  v2 = self;
  sub_1A964AF28();

}

- (void)hxui_primaryFooterButtonTapped
{
  char *v3;
  uint64_t v4;
  uint64_t ObjectType;
  void (*v6)(uint64_t, uint64_t);
  _TtC18HealthExperienceUI50MedicationsAffectHeartRateOnboardingViewController *v7;

  v3 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI50MedicationsAffectHeartRateOnboardingViewController_delegate;
  swift_beginAccess();
  if (MEMORY[0x1AF41CA2C](v3))
  {
    v4 = *((_QWORD *)v3 + 1);
    ObjectType = swift_getObjectType();
    v6 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
    v7 = self;
    v6(ObjectType, v4);

    swift_unknownObjectRelease();
  }
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI50MedicationsAffectHeartRateOnboardingViewController_healthStore));
  swift_release();
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI50MedicationsAffectHeartRateOnboardingViewController_primaryButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI50MedicationsAffectHeartRateOnboardingViewController_primaryButtonTintColorOverride));
  sub_1A961AEDC((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI50MedicationsAffectHeartRateOnboardingViewController_delegate);
  swift_bridgeObjectRelease();
}

@end
