@implementation CAAnimation(ClipUIServicesExtras)

- (uint64_t)cps_setDelegateWithDidStartHandler:()ClipUIServicesExtras didStopHandler:
{
  return +[CPSCAAnimationBlockDelegate attachToAnimation:didStartHandler:didStopHandler:](CPSCAAnimationBlockDelegate, "attachToAnimation:didStartHandler:didStopHandler:", a1, a3, a4);
}

@end
