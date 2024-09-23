@implementation MenstrualCyclesOnboardingWelcomeViewController

- (void)viewDidLoad
{
  _TtC24MenstrualCyclesAppPlugin46MenstrualCyclesOnboardingWelcomeViewController *v2;

  v2 = self;
  sub_231ABFD2C();

}

- (void)nextButtonTapped:(id)a3
{
  _TtC24MenstrualCyclesAppPlugin46MenstrualCyclesOnboardingWelcomeViewController *v4;
  uint64_t v5;

  swift_unknownObjectRetain();
  v4 = self;
  sub_231CA27D8();
  swift_unknownObjectRelease();
  sub_231AC0B98();

  _s24MenstrualCyclesAppPlugin32NotificationAuthorizationManagerVwxx_0((uint64_t)&v5);
}

- (void)cancelButtonTapped:(id)a3
{
  _TtC24MenstrualCyclesAppPlugin46MenstrualCyclesOnboardingWelcomeViewController *v4;
  char *v5;
  uint64_t v6;
  uint64_t ObjectType;
  uint64_t v8;

  swift_unknownObjectRetain();
  v4 = self;
  sub_231CA27D8();
  swift_unknownObjectRelease();
  v5 = (char *)v4 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin46MenstrualCyclesOnboardingWelcomeViewController_delegate;
  if (MEMORY[0x2348EE70C]((char *)v4+ OBJC_IVAR____TtC24MenstrualCyclesAppPlugin46MenstrualCyclesOnboardingWelcomeViewController_delegate))
  {
    v6 = *((_QWORD *)v5 + 1);
    ObjectType = swift_getObjectType();
    (*(void (**)(_TtC24MenstrualCyclesAppPlugin46MenstrualCyclesOnboardingWelcomeViewController *, uint64_t, uint64_t))(v6 + 16))(v4, ObjectType, v6);

    swift_unknownObjectRelease();
  }
  else
  {

  }
  _s24MenstrualCyclesAppPlugin32NotificationAuthorizationManagerVwxx_0((uint64_t)&v8);
}

- (_TtC24MenstrualCyclesAppPlugin46MenstrualCyclesOnboardingWelcomeViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  _TtC24MenstrualCyclesAppPlugin46MenstrualCyclesOnboardingWelcomeViewController *result;

  result = (_TtC24MenstrualCyclesAppPlugin46MenstrualCyclesOnboardingWelcomeViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC24MenstrualCyclesAppPlugin46MenstrualCyclesOnboardingWelcomeViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6;
  _TtC24MenstrualCyclesAppPlugin46MenstrualCyclesOnboardingWelcomeViewController *result;

  v6 = a5;
  result = (_TtC24MenstrualCyclesAppPlugin46MenstrualCyclesOnboardingWelcomeViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_23190C114((uint64_t)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin46MenstrualCyclesOnboardingWelcomeViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin46MenstrualCyclesOnboardingWelcomeViewController_analysis));
  v3 = (char *)self
     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin46MenstrualCyclesOnboardingWelcomeViewController_securityVariant;
  v4 = sub_231C9DF78();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_release();
  _s24MenstrualCyclesAppPlugin32NotificationAuthorizationManagerVwxx_0((uint64_t)self+ OBJC_IVAR____TtC24MenstrualCyclesAppPlugin46MenstrualCyclesOnboardingWelcomeViewController_pinnedContentManager);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin46MenstrualCyclesOnboardingWelcomeViewController____lazy_storage___reviewCycleFactorsViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin46MenstrualCyclesOnboardingWelcomeViewController____lazy_storage___ongoingCycleFactorsViewController));
}

@end
