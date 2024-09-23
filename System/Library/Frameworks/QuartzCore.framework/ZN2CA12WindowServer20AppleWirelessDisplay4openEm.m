@implementation ZN2CA12WindowServer20AppleWirelessDisplay4openEm

_QWORD *___ZN2CA12WindowServer20AppleWirelessDisplay4openEm_block_invoke_2()
{
  malloc_zone_t *malloc_zone;
  _QWORD *v1;
  _QWORD *v2;
  _DWORD *v3;
  _QWORD *v4;

  malloc_zone = (malloc_zone_t *)get_malloc_zone();
  v1 = malloc_type_zone_calloc(malloc_zone, 1uLL, 0x6F18uLL, 0x743898A5uLL);
  v2 = v1;
  if (v1)
  {
    v3 = (_DWORD *)((char *)v1 + 745);
    v4 = CA::WindowServer::AppleExternalDisplay::AppleExternalDisplay(v1);
    *v2 = off_1E158F828;
    *((_BYTE *)v2 + 28432) = 0;
    *v3 |= 0x40u;
    CA::WindowServer::IOMFBDisplay::set_signal_type((uint64_t)v4, 2);
  }
  return v2;
}

void *___ZN2CA12WindowServer20AppleWirelessDisplay4openEm_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/Celestial.framework/Celestial", 1);
  if (result)
  {
    result = dlsym(result, "FigInstallVirtualDisplay");
    if (result)
      return (void *)((uint64_t (*)(void))result)();
  }
  return result;
}

@end
