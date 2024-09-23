@implementation AVOutputContextManagerServerConnectionDied

void __AVOutputContextManagerServerConnectionDied_block_invoke()
{
  CMNotificationCenterGetDefaultLocalCenter();
  CMNotificationCenterRemoveListener();
  if (sSharedAgent)
  {
    CFRelease((CFTypeRef)sSharedAgent);
    sSharedAgent = 0;
  }
}

@end
