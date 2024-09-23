@implementation FigTransportConnectionIDSCreate

void *__FigTransportConnectionIDSCreate_block_invoke()
{
  void *v0;
  void *v1;
  void *result;
  void *v3;

  v0 = dlopen("/System/Library/PrivateFrameworks/IDSFoundation.framework/IDSFoundation", 1);
  if (v0)
  {
    v1 = v0;
    ids_IDSOpenSocketOptionTransportKey = (uint64_t)dlsym(v0, "IDSOpenSocketOptionTransportKey");
    ids_IDSOpenSocketOptionPriorityKey = (uint64_t)dlsym(v1, "IDSOpenSocketOptionPriorityKey");
    ids_IDSOpenSocketOptionScopeKey = (uint64_t)dlsym(v1, "IDSOpenSocketOptionScopeKey");
  }
  result = dlopen("/System/Library/PrivateFrameworks/IDS.framework/IDS", 1);
  if (result)
  {
    v3 = result;
    ids_IDSDeviceConnectionClass = (uint64_t)objc_getClass("IDSDeviceConnection");
    ids_IDSServiceClass = (uint64_t)objc_getClass("IDSService");
    ids_IDSLinkPreferenceOptionPacketsPerSecondKey = (uint64_t)dlsym(v3, "IDSLinkPreferenceOptionPacketsPerSecondKey");
    ids_IDSLinkPreferenceOptionInputBytesPerSecondKey = (uint64_t)dlsym(v3, "IDSLinkPreferenceOptionInputBytesPerSecondKey");
    result = dlsym(v3, "IDSLinkPreferenceOptionOutputBytesPerSecondKey");
    ids_IDSLinkPreferenceOptionOutputBytesPerSecondKey = (uint64_t)result;
  }
  return result;
}

@end
