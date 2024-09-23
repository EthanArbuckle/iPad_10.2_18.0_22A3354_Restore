@implementation SummarySharingOnboardingInfoViewController

- (void)viewDidLoad
{
  _TtC18HealthExperienceUI42SummarySharingOnboardingInfoViewController *v2;

  v2 = self;
  sub_1A98AD160();

}

- (void)nextButtonTapped:(id)a3
{
  _TtC18HealthExperienceUI42SummarySharingOnboardingInfoViewController *v4;
  uint64_t v5;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1A9A96670();
  swift_unknownObjectRelease();
  sub_1A98AD424();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v5);
}

- (void)cancelButtonTapped:(id)a3
{
  _TtC18HealthExperienceUI42SummarySharingOnboardingInfoViewController *v4;
  _QWORD v5[4];
  char v6;
  _BYTE v7[32];

  swift_unknownObjectRetain();
  v4 = self;
  sub_1A9A96670();
  swift_unknownObjectRelease();
  if (*(Class *)((char *)&v4->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC18HealthExperienceUI42SummarySharingOnboardingInfoViewController_selectionFlowContext))
  {
    memset(v5, 0, 24);
    v5[3] = 12;
    v6 = 0;
    swift_retain();
    sub_1A963A758(v4, (uint64_t)v5);

    swift_release();
  }
  else
  {

  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
}

- (void).cxx_destruct
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self+ OBJC_IVAR____TtC18HealthExperienceUI42SummarySharingOnboardingInfoViewController_healthExperienceStore);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI42SummarySharingOnboardingInfoViewController_healthStore));
}

@end
