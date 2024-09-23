@implementation OnboardingLandingPageCloseActionHandler

- (void)handleCloseActionOnPresenter:(id)a3
{
  _TtC7NewsUI239OnboardingLandingPageCloseActionHandler *v4;

  if (MEMORY[0x1D82919D4]((char *)self + OBJC_IVAR____TtC7NewsUI239OnboardingLandingPageCloseActionHandler_delegate, a2))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    v4 = self;
    sub_1D6E1BD94();
    swift_unknownObjectRelease();

    swift_unknownObjectRelease();
  }
}

- (_TtC7NewsUI239OnboardingLandingPageCloseActionHandler)init
{
  _TtC7NewsUI239OnboardingLandingPageCloseActionHandler *result;

  result = (_TtC7NewsUI239OnboardingLandingPageCloseActionHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1D5FF43C0((uint64_t)self + OBJC_IVAR____TtC7NewsUI239OnboardingLandingPageCloseActionHandler_delegate);
}

@end
