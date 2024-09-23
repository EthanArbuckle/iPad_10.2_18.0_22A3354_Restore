@implementation SummarySharingOnboardingSettingUpViewController

- (void)viewDidLoad
{
  _TtC18HealthExperienceUI47SummarySharingOnboardingSettingUpViewController *v2;

  v2 = self;
  sub_1A98CCFC0();

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SummarySharingOnboardingSettingUpViewController();
  v4 = v5.receiver;
  -[OBBaseWelcomeController viewDidAppear:](&v5, sel_viewDidAppear_, v3);
  sub_1A98CD3E4();

}

- (void)onCancelTapped
{
  _TtC18HealthExperienceUI47SummarySharingOnboardingSettingUpViewController *v2;

  v2 = self;
  sub_1A98CD2B8();

}

- (_TtC18HealthExperienceUI47SummarySharingOnboardingSettingUpViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  _TtC18HealthExperienceUI47SummarySharingOnboardingSettingUpViewController *result;

  result = (_TtC18HealthExperienceUI47SummarySharingOnboardingSettingUpViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC18HealthExperienceUI47SummarySharingOnboardingSettingUpViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6;
  _TtC18HealthExperienceUI47SummarySharingOnboardingSettingUpViewController *result;

  v6 = a5;
  result = (_TtC18HealthExperienceUI47SummarySharingOnboardingSettingUpViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self+ OBJC_IVAR____TtC18HealthExperienceUI47SummarySharingOnboardingSettingUpViewController_healthExperienceStore);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI47SummarySharingOnboardingSettingUpViewController_healthStore));
}

@end
