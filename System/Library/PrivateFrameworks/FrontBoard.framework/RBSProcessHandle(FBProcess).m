@implementation RBSProcessHandle(FBProcess)

- (uint64_t)fb_canTaskSuspend
{
  return objc_msgSend(a1, "isDaemon") ^ 1;
}

@end
