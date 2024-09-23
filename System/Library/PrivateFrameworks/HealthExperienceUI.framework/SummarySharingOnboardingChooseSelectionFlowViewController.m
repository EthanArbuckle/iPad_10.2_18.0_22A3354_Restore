@implementation SummarySharingOnboardingChooseSelectionFlowViewController

- (void)viewDidAppear:(BOOL)a3
{
  _TtC18HealthExperienceUI57SummarySharingOnboardingChooseSelectionFlowViewController *v4;

  v4 = self;
  sub_1A994BF20(a3);

}

- (void)nextButtonTapped:(id)a3
{
  sub_1A966943C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_1A994BFD8);
}

- (void)manualFlowButtonTapped:(id)a3
{
  sub_1A966943C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_1A994C37C);
}

- (void)cancelButtonTapped:(id)a3
{
  _TtC18HealthExperienceUI57SummarySharingOnboardingChooseSelectionFlowViewController *v4;
  _QWORD v5[4];
  char v6;
  _BYTE v7[32];

  swift_unknownObjectRetain();
  v4 = self;
  sub_1A9A96670();
  swift_unknownObjectRelease();
  memset(v5, 0, 24);
  v5[3] = 12;
  v6 = 0;
  swift_retain();
  sub_1A963A758(v4, (uint64_t)v5);

  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self+ OBJC_IVAR____TtC18HealthExperienceUI57SummarySharingOnboardingChooseSelectionFlowViewController_healthExperienceStore);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI57SummarySharingOnboardingChooseSelectionFlowViewController_healthStore));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI57SummarySharingOnboardingChooseSelectionFlowViewController_selectedContact));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI57SummarySharingOnboardingChooseSelectionFlowViewController____lazy_storage___setUpManuallyButton));
}

@end
