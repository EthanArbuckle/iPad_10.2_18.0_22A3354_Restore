@implementation PlayerViewControllerBehavior

- (void)willMoveToContext:(id)a3
{
  PlayerViewControllerBehavior *v5;

  swift_unknownObjectRetain();
  v5 = self;
  sub_210C3A7F8(a3);
  swift_unknownObjectRelease();

}

- (void)skipToPreviousItem
{
  PlayerViewControllerBehavior *v2;

  v2 = self;
  sub_210C8C738();

}

- (void)skipToNextItem
{
  PlayerViewControllerBehavior *v2;

  v2 = self;
  sub_210C8C774();

}

- (void)contextWillHandleUserAction:(int64_t)a3
{
  PlayerViewControllerBehavior *v4;

  v4 = self;
  sub_210C8C7B0(a3);

}

- (PlayerViewControllerBehavior)init
{
  sub_210C8EE68();
}

- (void).cxx_destruct
{
  sub_210C3BEB4((uint64_t)self + OBJC_IVAR___PlayerViewControllerBehavior_delegate);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)self + OBJC_IVAR___PlayerViewControllerBehavior_reporter);
}

@end
