@implementation ZL9GetCIProcv

const char *___ZL9GetCIProcv_block_invoke()
{
  void *v0;
  const char *result;
  char *v2;
  char __path[72];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  strcpy(__path, "/System/Library/Frameworks/QuartzCore.framework/QuartzCore");
  v0 = dlopen(__path, 257);
  if (v0)
  {
    result = (const char *)dlsym(v0, "CICreateCGImageRefFromYCbCrData");
    g_ciGetCGImageRefFromYCbCrData = (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, double, double))result;
  }
  else
  {
    v2 = dlerror();
    return LogError("GetCIProc_block_invoke", 573, "cannot access 'QuartzCore.framework' - %s\n", v2);
  }
  return result;
}

@end
