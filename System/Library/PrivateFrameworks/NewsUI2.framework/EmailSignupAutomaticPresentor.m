@implementation EmailSignupAutomaticPresentor

- (_TtC7NewsUI229EmailSignupAutomaticPresentor)init
{
  _TtC7NewsUI229EmailSignupAutomaticPresentor *result;

  result = (_TtC7NewsUI229EmailSignupAutomaticPresentor *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1D5FF43C0((uint64_t)self + OBJC_IVAR____TtC7NewsUI229EmailSignupAutomaticPresentor_delegate);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI229EmailSignupAutomaticPresentor_sportsOnboardingManager);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI229EmailSignupAutomaticPresentor_emailSignupModelFactory);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI229EmailSignupAutomaticPresentor_fineGrainedNewslettersHandler);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

- (void)bundleSubscriptionDidSubscribe:(id)a3
{
  objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC7NewsUI229EmailSignupAutomaticPresentor_userInfo), sel_setNewsletterSignupLastSeenDate_, 0);
}

- (void)bundleSubscriptionDidExpire:(id)a3
{
  objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC7NewsUI229EmailSignupAutomaticPresentor_newsletterManager), sel_optOutOfIssues, a3);
}

@end
