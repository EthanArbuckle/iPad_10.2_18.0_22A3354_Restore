@implementation HRClinicalSharingOnboardingInformationalViewController

- (HRClinicalSharingOnboardingInformationalViewController)initWithOnboardingSession:(id)a3 flowType:(int64_t)a4 selectedAccount:(id)a5 delegate:(id)a6
{
  char *v9;
  id v10;

  v9 = (char *)a3;
  v10 = a5;
  swift_unknownObjectRetain();
  return (HRClinicalSharingOnboardingInformationalViewController *)ClinicalSharingOnboardingInformationalViewController.init(onboardingSession:flowType:selectedAccount:delegate:)(v9, (char *)a4, a5, (uint64_t)a6);
}

- (void)dealloc
{
  HRClinicalSharingOnboardingInformationalViewController *v3;
  HRClinicalSharingOnboardingInformationalViewController *v4;
  objc_super v5;

  if (*(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR___HRClinicalSharingOnboardingInformationalViewController_accountStateCancellable))
  {
    v3 = self;
    swift_retain();
    sub_1BC62BEAC();
    swift_release();
  }
  else
  {
    v4 = self;
  }
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ClinicalSharingOnboardingInformationalViewController();
  -[HRClinicalSharingOnboardingInformationalViewController dealloc](&v5, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___HRClinicalSharingOnboardingInformationalViewController_onboardingSession));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___HRClinicalSharingOnboardingInformationalViewController_selectedAccount));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___HRClinicalSharingOnboardingInformationalViewController_gatewayProxyToTry));
  sub_1BC359FDC((uint64_t)self + OBJC_IVAR___HRClinicalSharingOnboardingInformationalViewController_delegate);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___HRClinicalSharingOnboardingInformationalViewController____lazy_storage___logoView));
}

- (void)viewDidLoad
{
  HRClinicalSharingOnboardingInformationalViewController *v2;

  v2 = self;
  sub_1BC57AF1C();

}

- (void)nextButtonTappedForProviderSearch:(id)a3
{
  HRClinicalSharingOnboardingInformationalViewController *v4;
  uint64_t v5;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1BC62D088();
  swift_unknownObjectRelease();
  sub_1BC57C6B4();

  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v5);
}

- (void)nextButtonTappedForAccountLogin:(id)a3
{
  sub_1BC361704(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_1BC57C988);
}

- (void)nextButtonTappedForAuthorizationSelection:(id)a3
{
  sub_1BC361704(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_1BC57D204);
}

- (void)skipButtonTappedForAuthorizationSelection:(id)a3
{
  sub_1BC361704(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_1BC57D358);
}

- (void)cancelButtonTapped:(id)a3
{
  HRClinicalSharingOnboardingInformationalViewController *v4;
  uint64_t v5;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1BC62D088();
  swift_unknownObjectRelease();
  -[HRClinicalSharingOnboardingInformationalViewController dismissViewControllerAnimated:completion:](v4, sel_dismissViewControllerAnimated_completion_, 1, 0);

  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v5);
}

- (HRClinicalSharingOnboardingInformationalViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  HRClinicalSharingOnboardingInformationalViewController *result;

  result = (HRClinicalSharingOnboardingInformationalViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (HRClinicalSharingOnboardingInformationalViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6;
  HRClinicalSharingOnboardingInformationalViewController *result;

  v6 = a5;
  result = (HRClinicalSharingOnboardingInformationalViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)didReceiveOAuthCompletionWithNotification:(id)a3
{
  sub_1BC57F01C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_1BC57DF78);
}

- (void)didReceiveClinicalAccountOnboardingCompletionWithNotification:(id)a3
{
  sub_1BC57F01C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_1BC57E8D8);
}

@end
