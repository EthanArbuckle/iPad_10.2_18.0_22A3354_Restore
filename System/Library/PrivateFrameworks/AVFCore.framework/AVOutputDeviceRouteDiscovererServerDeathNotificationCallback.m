@implementation AVOutputDeviceRouteDiscovererServerDeathNotificationCallback

void __AVOutputDeviceRouteDiscovererServerDeathNotificationCallback_block_invoke()
{
  CMNotificationCenterGetDefaultLocalCenter();
  CMNotificationCenterRemoveListener();
  CMNotificationCenterGetDefaultLocalCenter();
  CMNotificationCenterRemoveListener();
  if (gAVOutputDeviceRouteDiscoverer_Screen)
  {
    CFRelease((CFTypeRef)gAVOutputDeviceRouteDiscoverer_Screen);
    gAVOutputDeviceRouteDiscoverer_Screen = 0;
  }
  if (gAVOutputDeviceRouteDiscoverer_AudioVideo)
  {
    CFRelease((CFTypeRef)gAVOutputDeviceRouteDiscoverer_AudioVideo);
    gAVOutputDeviceRouteDiscoverer_AudioVideo = 0;
  }
}

@end
