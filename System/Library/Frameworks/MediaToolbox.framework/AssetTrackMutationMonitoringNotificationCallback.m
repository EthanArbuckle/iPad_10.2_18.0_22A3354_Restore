@implementation AssetTrackMutationMonitoringNotificationCallback

void __AssetTrackMutationMonitoringNotificationCallback_block_invoke(CFTypeRef *a1)
{
  CFTypeRef context;
  __int128 v3;

  context = a1[4];
  v3 = *(_OWORD *)(a1 + 5);
  CFDictionaryApplyFunction(*(CFDictionaryRef *)(v3 + 72), (CFDictionaryApplierFunction)AssessMonitoredAssetTrackPropertyChange, &context);
  CFRelease(a1[4]);
  CFRelease(a1[5]);
  CFRelease(a1[6]);
}

@end
