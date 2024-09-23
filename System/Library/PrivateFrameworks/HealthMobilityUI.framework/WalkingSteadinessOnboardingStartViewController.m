@implementation WalkingSteadinessOnboardingStartViewController

- (void)viewDidLoad
{
  _TtC16HealthMobilityUI46WalkingSteadinessOnboardingStartViewController *v2;

  v2 = self;
  sub_1D77D35B4();

}

- (void)primaryFooterButtonTapped
{
  char *v3;
  uint64_t v4;
  void (*v5)(void);
  _TtC16HealthMobilityUI46WalkingSteadinessOnboardingStartViewController *v6;

  v3 = (char *)self + OBJC_IVAR____TtC16HealthMobilityUI46WalkingSteadinessOnboardingStartViewController_delegate;
  swift_beginAccess();
  if (MEMORY[0x1D829C934](v3))
  {
    v4 = *((_QWORD *)v3 + 1);
    swift_getObjectType();
    v5 = *(void (**)(void))(v4 + 8);
    v6 = self;
    v5();

    swift_unknownObjectRelease();
  }
}

- (void)secondaryFooterButtonTapped
{
  char *v3;
  uint64_t v4;
  void (*v5)(void);
  _TtC16HealthMobilityUI46WalkingSteadinessOnboardingStartViewController *v6;

  v3 = (char *)self + OBJC_IVAR____TtC16HealthMobilityUI46WalkingSteadinessOnboardingStartViewController_delegate;
  swift_beginAccess();
  if (MEMORY[0x1D829C934](v3))
  {
    v4 = *((_QWORD *)v3 + 1);
    swift_getObjectType();
    v5 = *(void (**)(void))(v4 + 16);
    v6 = self;
    v5();

    swift_unknownObjectRelease();
  }
}

- (void)cancelButtonTapped
{
  char *v3;
  uint64_t v4;
  void (*v5)(void);
  _TtC16HealthMobilityUI46WalkingSteadinessOnboardingStartViewController *v6;

  v3 = (char *)self + OBJC_IVAR____TtC16HealthMobilityUI46WalkingSteadinessOnboardingStartViewController_delegate;
  swift_beginAccess();
  if (MEMORY[0x1D829C934](v3))
  {
    v4 = *((_QWORD *)v3 + 1);
    swift_getObjectType();
    v5 = *(void (**)(void))(v4 + 24);
    v6 = self;
    v5();

    swift_unknownObjectRelease();
  }
}

- (_TtC16HealthMobilityUI46WalkingSteadinessOnboardingStartViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  _TtC16HealthMobilityUI46WalkingSteadinessOnboardingStartViewController *result;

  result = (_TtC16HealthMobilityUI46WalkingSteadinessOnboardingStartViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC16HealthMobilityUI46WalkingSteadinessOnboardingStartViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6;
  _TtC16HealthMobilityUI46WalkingSteadinessOnboardingStartViewController *result;

  v6 = a5;
  result = (_TtC16HealthMobilityUI46WalkingSteadinessOnboardingStartViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1D77C564C((uint64_t)self + OBJC_IVAR____TtC16HealthMobilityUI46WalkingSteadinessOnboardingStartViewController_delegate);
}

@end
