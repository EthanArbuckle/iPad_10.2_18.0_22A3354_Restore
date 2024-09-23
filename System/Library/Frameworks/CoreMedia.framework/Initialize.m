@implementation Initialize

void __brokeredPlugin_Initialize_block_invoke(uint64_t a1)
{
  CFArrayAppendValue(*(CFMutableArrayRef *)(*(_QWORD *)(a1 + 32) + 40), *(const void **)(a1 + 40));
}

void *__figMobileAsset_Initialize_block_invoke()
{
  void *result;

  fig_note_initialize_category_with_default_work_cf((uint64_t)&gFigMobileAssetTrace[1], CFSTR("mobileasset_trace"), CFSTR("com.apple.coremedia"), (uint64_t)", (uint64_t)"com.apple.coremedia", 0, 0, gFigMobileAssetTrace);
  fig_note_initialize_category_with_default_work_cf((uint64_t)&dword_1EE141E68, CFSTR("mobileasset_trace"), CFSTR("com.apple.coremedia"), (uint64_t)", (uint64_t)"com.apple.coremedia", 0, 0, &qword_1EE141E60);
  result = dlopen("/System/Library/PrivateFrameworks/MobileAsset.framework/MobileAsset", 4);
  sMobileAssetLib = (uint64_t)result;
  if (result)
  {
    sMAAssetClass = (uint64_t)objc_getClass("MAAsset");
    sMAAssetQueryClass = (uint64_t)objc_getClass("MAAssetQuery");
    result = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], 0);
    gRegisteredAssetTypes = (uint64_t)result;
  }
  return result;
}

void __plugin_Initialize_block_invoke(uint64_t a1)
{
  CFArrayAppendValue(*(CFMutableArrayRef *)(*(_QWORD *)(a1 + 32) + 24), *(const void **)(a1 + 40));
}

uint64_t __plugin_Initialize_block_invoke_2(uint64_t a1)
{
  const void *v2;
  uint64_t DerivedStorage;
  uint64_t (*v4)(CFAllocatorRef, unint64_t *);
  CFAllocatorRef v5;
  unint64_t *v6;
  uint64_t result;
  __CFNotificationCenter *DefaultLocalCenter;

  v2 = *(const void **)(a1 + 40);
  DerivedStorage = CMBaseObjectGetDerivedStorage((uint64_t)v2);
  v4 = *(uint64_t (**)(CFAllocatorRef, unint64_t *))(DerivedStorage + 56);
  v5 = CFGetAllocator(v2);
  v6 = (unint64_t *)(DerivedStorage + 64);
  result = v4(v5, v6);
  if (!(_DWORD)result)
  {
    DefaultLocalCenter = CMNotificationCenterGetDefaultLocalCenter();
    CMNotificationCenterAddListener(DefaultLocalCenter, v2, (void (__cdecl *)(CFNotificationCenterRef, void *, CFNotificationName, const void *, CFDictionaryRef))ActivatedEndpointsChangedNotificationCallback, CFSTR("EndpointManager_ActivatedEndpointsChanged"), *v6);
    result = PeruseActivatedEndpoints(v2);
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void __endpointCentricPlugin_Initialize_block_invoke(uint64_t a1)
{
  uint64_t v2;
  const void *v3;
  uint64_t DerivedStorage;
  uint64_t (*v5)(CFAllocatorRef, uint64_t);
  CFAllocatorRef v6;
  unint64_t *v7;
  int v8;
  __CFNotificationCenter *DefaultLocalCenter;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    *(_QWORD *)(*(_QWORD *)(a1 + 48) + 64) = v2;
  v3 = *(const void **)(a1 + 56);
  DerivedStorage = CMBaseObjectGetDerivedStorage((uint64_t)v3);
  v5 = *(uint64_t (**)(CFAllocatorRef, uint64_t))(DerivedStorage + 32);
  v6 = CFGetAllocator(v3);
  v7 = (unint64_t *)(DerivedStorage + 40);
  v8 = v5(v6, DerivedStorage + 40);
  if (!v8)
  {
    DefaultLocalCenter = CMNotificationCenterGetDefaultLocalCenter();
    CMNotificationCenterAddListener(DefaultLocalCenter, v3, (void (__cdecl *)(CFNotificationCenterRef, void *, CFNotificationName, const void *, CFDictionaryRef))endpointCentricPlugin_ActivatedEndpointsChangedNotificationCallback, CFSTR("EndpointManager_ActivatedEndpointsChanged"), *v7);
    endpointCentricPlugin_PeruseActivatedEndpoints((uint64_t)v3);
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v8;
  CFRelease(*(CFTypeRef *)(a1 + 56));
}

@end
