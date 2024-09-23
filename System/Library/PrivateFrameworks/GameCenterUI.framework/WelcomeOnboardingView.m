@implementation WelcomeOnboardingView

- (_TtC12GameCenterUI21WelcomeOnboardingView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AB6B7420();
}

- (void)primaryAction
{
  _TtC12GameCenterUI21WelcomeOnboardingView *v2;

  v2 = self;
  sub_1AB6B7860();

}

- (void)secondaryAction
{
  _TtC12GameCenterUI21WelcomeOnboardingView *v2;

  v2 = self;
  sub_1AB6B7B0C();

}

- (void).cxx_destruct
{
  sub_1AB4CB5BC((uint64_t)self + OBJC_IVAR____TtC12GameCenterUI21WelcomeOnboardingView_delegate);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI21WelcomeOnboardingView_privacyLinkView);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI21WelcomeOnboardingView_welcomeArtworkView);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI21WelcomeOnboardingView_primaryTrayButton);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI21WelcomeOnboardingView____lazy_storage___secondaryBarButton);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI21WelcomeOnboardingView____lazy_storage___artworkHeight);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI21WelcomeOnboardingView_gameCenterIcon);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI21WelcomeOnboardingView_whatsNewBullets));
}

@end
