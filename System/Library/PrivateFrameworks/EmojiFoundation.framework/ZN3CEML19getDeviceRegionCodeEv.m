@implementation ZN3CEML19getDeviceRegionCodeEv

void *___ZN3CEML19getDeviceRegionCodeEv_block_invoke()
{
  void *result;

  result = dlopen("/usr/lib/libMobileGestalt.dylib", 261);
  if (result)
  {
    result = dlsym(result, "MGCopyAnswer");
    if (result)
      result = (void *)((uint64_t (*)(const __CFString *, _QWORD))result)(CFSTR("RegionCode"), 0);
  }
  CEM::getDeviceRegionCode(void)::__regionCode = (uint64_t)result;
  return result;
}

@end
