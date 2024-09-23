@implementation APReceiverScreenSinkCreateAirPlay

uint64_t __APReceiverScreenSinkCreateAirPlay_block_invoke()
{
  CMNotificationCenterGetDefaultLocalCenter();
  return CMNotificationCenterAddListener();
}

@end
