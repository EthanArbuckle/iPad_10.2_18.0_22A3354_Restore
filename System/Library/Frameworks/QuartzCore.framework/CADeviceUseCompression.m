@implementation CADeviceUseCompression

void __CADeviceUseCompression_block_invoke()
{
  uint64_t v0;
  BOOL v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  int AppBooleanValue;
  NSObject *v6;
  const char *v7;
  Boolean keyExistsAndHasValidFormat[4];
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (CADeviceSupportsCIF10::once != -1)
    dispatch_once(&CADeviceSupportsCIF10::once, &__block_literal_global_10_9744);
  if (CADeviceSupportsCIF10::supports_cif10)
  {
    if (CADeviceIsVirtualized::once[0] != -1)
      dispatch_once(CADeviceIsVirtualized::once, &__block_literal_global_204);
    if (!CADeviceIsVirtualized::is_virtualized)
    {
      keyExistsAndHasValidFormat[0] = 0;
      v0 = MGGetSInt64Answer();
      if (v0)
      {
        v1 = 0;
        if (v0 != 28672)
        {
          v2 = 1;
          v3 = 3;
          while (v2 != 4)
          {
            v4 = CADeviceVertexCoordinateSubpixelBits::four_bit_chip_ids[v2++];
            if (v4 == v0)
            {
              v3 = v2 - 2;
              break;
            }
          }
          v1 = v3 > 2;
        }
        CADeviceUseCompression::enable_compression = v1;
      }
      AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("CAEnableIOSurfaceCompression"), (CFStringRef)*MEMORY[0x1E0C9B248], keyExistsAndHasValidFormat);
      if (keyExistsAndHasValidFormat[0])
        CADeviceUseCompression::enable_compression = AppBooleanValue != 0;
    }
  }
  if (x_log_hook_p())
  {
    x_log_();
  }
  else
  {
    v6 = x_log_category_utilities;
    if (os_log_type_enabled((os_log_t)x_log_category_utilities, OS_LOG_TYPE_INFO))
    {
      if (CADeviceUseCompression::enable_compression)
        v7 = "YES";
      else
        v7 = "NO";
      *(_DWORD *)keyExistsAndHasValidFormat = 136315138;
      v9 = v7;
      _os_log_impl(&dword_184457000, v6, OS_LOG_TYPE_INFO, "IOSurface Compression Enabled: %s\n", keyExistsAndHasValidFormat, 0xCu);
    }
  }
}

@end
