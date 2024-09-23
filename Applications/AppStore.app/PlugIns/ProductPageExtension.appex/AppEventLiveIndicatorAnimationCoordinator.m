@implementation AppEventLiveIndicatorAnimationCoordinator

- (_TtC20ProductPageExtension41AppEventLiveIndicatorAnimationCoordinator)init
{
  return (_TtC20ProductPageExtension41AppEventLiveIndicatorAnimationCoordinator *)sub_100137758();
}

- (void)appEnteredWhileAppeared
{
  _TtC20ProductPageExtension41AppEventLiveIndicatorAnimationCoordinator *v2;

  v2 = self;
  sub_1001383E8();

}

- (void)appExitedWhileAppeared
{
  _TtC20ProductPageExtension41AppEventLiveIndicatorAnimationCoordinator *v2;

  v2 = self;
  sub_100137B94();

}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC20ProductPageExtension41AppEventLiveIndicatorAnimationCoordinator_animatingViews));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension41AppEventLiveIndicatorAnimationCoordinator_sleepTimer));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension41AppEventLiveIndicatorAnimationCoordinator_currentAnimator));
}

@end
