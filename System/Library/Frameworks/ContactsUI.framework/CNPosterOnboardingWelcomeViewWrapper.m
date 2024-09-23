@implementation CNPosterOnboardingWelcomeViewWrapper

- (UIViewController)hostingController
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa
            + OBJC_IVAR____TtC10ContactsUI36CNPosterOnboardingWelcomeViewWrapper_hostingController);
  swift_beginAccess();
  return (UIViewController *)*v2;
}

- (void)setHostingController:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.isa
               + OBJC_IVAR____TtC10ContactsUI36CNPosterOnboardingWelcomeViewWrapper_hostingController);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (_TtC10ContactsUI36CNPosterOnboardingWelcomeViewWrapper)initWithContact:(id)a3 hasOptionToSkip:(BOOL)a4 hasExistingNickname:(BOOL)a5 navigationBarHeight:(double)a6 delegate:(id)a7 windowScene:(id)a8
{
  _BOOL4 v11;
  _BOOL4 v12;
  id v13;
  id v14;
  _TtC10ContactsUI36CNPosterOnboardingWelcomeViewWrapper *v15;

  v11 = a5;
  v12 = a4;
  v13 = a3;
  swift_unknownObjectRetain();
  v14 = a8;
  v15 = (_TtC10ContactsUI36CNPosterOnboardingWelcomeViewWrapper *)sub_18AD10028(v13, v12, v11, a6, (uint64_t)a7, v14);

  swift_unknownObjectRelease();
  return v15;
}

- (_TtC10ContactsUI36CNPosterOnboardingWelcomeViewWrapper)init
{
  _TtC10ContactsUI36CNPosterOnboardingWelcomeViewWrapper *result;

  result = (_TtC10ContactsUI36CNPosterOnboardingWelcomeViewWrapper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10ContactsUI36CNPosterOnboardingWelcomeViewWrapper_hostingController));
}

@end
