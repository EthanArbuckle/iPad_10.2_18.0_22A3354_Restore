@implementation ZN16GpsdPlatformInfo8instanceEN24GpsdPlatformInfoHardware8HardwareE

GpsdPlatformInfo *___ZN16GpsdPlatformInfo8instanceEN24GpsdPlatformInfoHardware8HardwareE_block_invoke(GpsdPlatformInfoHardware *a1)
{
  int v1;
  NSObject *v2;
  GpsdPlatformInfo *v3;
  GpsdPlatformInfo *result;
  _DWORD v5[2];
  __int16 v6;
  int has_internal_diagnostics;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v1 = *((_DWORD *)a1 + 8);
  if (!v1)
  {
    v1 = GpsdPlatformInfoHardware::detectHardware(a1);
    v2 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      v5[0] = 67240448;
      v5[1] = v1;
      v6 = 1026;
      has_internal_diagnostics = os_variant_has_internal_diagnostics();
      _os_log_impl(&dword_2293C9000, v2, OS_LOG_TYPE_DEFAULT, "PlatformInfo,Product type detected,%{public}d,isInternal,%{public}d", (uint8_t *)v5, 0xEu);
    }
  }
  v3 = (GpsdPlatformInfo *)operator new();
  result = GpsdPlatformInfo::GpsdPlatformInfo(v3, v1);
  GpsdPlatformInfo::fInstance = (uint64_t)v3;
  return result;
}

@end
