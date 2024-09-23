@implementation CNPosterOnboardingPrivacyViewWrapper

- (UIViewController)hostingController
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa
            + OBJC_IVAR____TtC10ContactsUI36CNPosterOnboardingPrivacyViewWrapper_hostingController);
  swift_beginAccess();
  return (UIViewController *)*v2;
}

- (void)setHostingController:(id)a3
{
  sub_18ACB6198((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC10ContactsUI36CNPosterOnboardingPrivacyViewWrapper_hostingController);
}

- (_TtC10ContactsUI34CNPosterOnboardingPrivacyViewModel)model
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR____TtC10ContactsUI36CNPosterOnboardingPrivacyViewWrapper_model);
  swift_beginAccess();
  return (_TtC10ContactsUI34CNPosterOnboardingPrivacyViewModel *)*v2;
}

- (void)setModel:(id)a3
{
  sub_18ACB6198((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC10ContactsUI36CNPosterOnboardingPrivacyViewWrapper_model);
}

- (_TtC10ContactsUI36CNPosterOnboardingPrivacyViewWrapper)initWithDelegate:(id)a3
{
  swift_unknownObjectRetain();
  return (_TtC10ContactsUI36CNPosterOnboardingPrivacyViewWrapper *)CNPosterOnboardingPrivacyViewWrapper.init(delegate:)();
}

- (_TtC10ContactsUI36CNPosterOnboardingPrivacyViewWrapper)init
{
  _TtC10ContactsUI36CNPosterOnboardingPrivacyViewWrapper *result;

  result = (_TtC10ContactsUI36CNPosterOnboardingPrivacyViewWrapper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10ContactsUI36CNPosterOnboardingPrivacyViewWrapper_hostingController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10ContactsUI36CNPosterOnboardingPrivacyViewWrapper_model));
}

@end
