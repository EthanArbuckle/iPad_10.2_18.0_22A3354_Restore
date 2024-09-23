@implementation FigCPEOctaviaExternalProtectionMonitorCreate

uint64_t __FigCPEOctaviaExternalProtectionMonitorCreate_block_invoke(uint64_t a1, int a2)
{
  uint64_t result;

  if (a2 == 1937006947 || a2 == 1937007971)
  {
    CMNotificationCenterGetDefaultLocalCenter();
    return CMNotificationCenterPostNotification();
  }
  return result;
}

@end
