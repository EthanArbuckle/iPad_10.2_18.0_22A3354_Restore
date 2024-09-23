@implementation AVOutputDeviceCopySharedRouteDiscovererForRouteDescriptor

const void *__AVOutputDeviceCopySharedRouteDiscovererForRouteDescriptor_block_invoke_2(uint64_t a1)
{
  const void *result;

  if (objc_msgSend((id)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 40), (const void *)*MEMORY[0x1E0D48A38]), "BOOLValue"))
  {
    result = (const void *)gAVOutputDeviceRouteDiscoverer_Screen;
    if (!gAVOutputDeviceRouteDiscoverer_Screen)
    {
      result = (const void *)AVCreateRouteDiscovererWithType(0);
      gAVOutputDeviceRouteDiscoverer_Screen = (uint64_t)result;
      if (!result)
        goto LABEL_8;
      CMNotificationCenterGetDefaultLocalCenter();
      CMNotificationCenterAddListener();
      result = (const void *)gAVOutputDeviceRouteDiscoverer_Screen;
      if (!gAVOutputDeviceRouteDiscoverer_Screen)
        goto LABEL_8;
    }
LABEL_7:
    result = CFRetain(result);
    goto LABEL_8;
  }
  result = (const void *)gAVOutputDeviceRouteDiscoverer_AudioVideo;
  if (gAVOutputDeviceRouteDiscoverer_AudioVideo)
    goto LABEL_7;
  result = (const void *)AVCreateRouteDiscovererWithType(3);
  gAVOutputDeviceRouteDiscoverer_AudioVideo = (uint64_t)result;
  if (result)
  {
    CMNotificationCenterGetDefaultLocalCenter();
    CMNotificationCenterAddListener();
    result = (const void *)gAVOutputDeviceRouteDiscoverer_AudioVideo;
    if (gAVOutputDeviceRouteDiscoverer_AudioVideo)
      goto LABEL_7;
  }
LABEL_8:
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

dispatch_queue_t __AVOutputDeviceCopySharedRouteDiscovererForRouteDescriptor_block_invoke()
{
  NSObject *v0;
  dispatch_queue_t result;

  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  result = dispatch_queue_create("com.apple.avfoundation.avoutputdevice.routediscovererqueue", v0);
  gAVOutputDeviceRouteDiscovererQueue = (uint64_t)result;
  return result;
}

@end
