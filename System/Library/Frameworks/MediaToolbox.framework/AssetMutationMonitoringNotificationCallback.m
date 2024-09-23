@implementation AssetMutationMonitoringNotificationCallback

void __AssetMutationMonitoringNotificationCallback_block_invoke(CFTypeRef *a1)
{
  const __CFDictionary *v2;
  CFTypeRef v3;
  __int128 v4;
  CFTypeRef v5;

  v4 = *((_OWORD *)a1 + 2);
  v3 = a1[6];
  v2 = (const __CFDictionary *)a1[7];
  v5 = v3;
  CFDictionaryApplyFunction(v2, (CFDictionaryApplierFunction)AssessMonitoredAssetPropertyChange, &v4);
  CFRelease(a1[4]);
  CFRelease(a1[7]);
  CFRelease(a1[5]);
  CFRelease(a1[6]);
}

@end
