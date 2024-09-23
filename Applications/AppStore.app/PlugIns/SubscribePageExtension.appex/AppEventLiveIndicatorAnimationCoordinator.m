@implementation AppEventLiveIndicatorAnimationCoordinator

- (_TtC22SubscribePageExtension41AppEventLiveIndicatorAnimationCoordinator)init
{
  return (_TtC22SubscribePageExtension41AppEventLiveIndicatorAnimationCoordinator *)sub_10016D6D8();
}

- (void)appEnteredWhileAppeared
{
  _TtC22SubscribePageExtension41AppEventLiveIndicatorAnimationCoordinator *v2;

  v2 = self;
  sub_10016E004();

}

- (void)appExitedWhileAppeared
{
  _TtC22SubscribePageExtension41AppEventLiveIndicatorAnimationCoordinator *v2;

  v2 = self;
  sub_10016D7B0();

}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC22SubscribePageExtension41AppEventLiveIndicatorAnimationCoordinator_animatingViews));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension41AppEventLiveIndicatorAnimationCoordinator_sleepTimer));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension41AppEventLiveIndicatorAnimationCoordinator_currentAnimator));
}

@end
