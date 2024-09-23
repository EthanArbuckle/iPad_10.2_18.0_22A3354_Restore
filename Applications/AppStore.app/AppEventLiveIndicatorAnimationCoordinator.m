@implementation AppEventLiveIndicatorAnimationCoordinator

- (_TtC8AppStore41AppEventLiveIndicatorAnimationCoordinator)init
{
  return (_TtC8AppStore41AppEventLiveIndicatorAnimationCoordinator *)sub_1000142B0();
}

- (void)appEnteredWhileAppeared
{
  _TtC8AppStore41AppEventLiveIndicatorAnimationCoordinator *v2;

  v2 = self;
  sub_100082DD4();

}

- (void)appExitedWhileAppeared
{
  _TtC8AppStore41AppEventLiveIndicatorAnimationCoordinator *v2;

  v2 = self;
  sub_1000D7C74();

}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC8AppStore41AppEventLiveIndicatorAnimationCoordinator_animatingViews));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8AppStore41AppEventLiveIndicatorAnimationCoordinator_sleepTimer));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8AppStore41AppEventLiveIndicatorAnimationCoordinator_currentAnimator));
}

@end
