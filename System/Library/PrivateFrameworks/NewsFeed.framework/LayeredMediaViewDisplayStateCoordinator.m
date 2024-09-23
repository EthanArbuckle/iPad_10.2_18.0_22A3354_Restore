@implementation LayeredMediaViewDisplayStateCoordinator

- (void)sceneDidEnterBackground
{
  sub_1BB280D5C((uint64_t)self, (uint64_t)a2, 1);
}

- (void)sceneWillEnterForeground
{
  sub_1BB280D5C((uint64_t)self, (uint64_t)a2, 0);
}

- (void)reduceMotionStatusDidChange
{
  swift_retain();
  LayeredMediaViewDisplayStateCoordinator.updateDisplay()();
  swift_release();
}

@end
