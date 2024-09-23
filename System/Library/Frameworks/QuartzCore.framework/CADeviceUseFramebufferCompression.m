@implementation CADeviceUseFramebufferCompression

void __CADeviceUseFramebufferCompression_block_invoke()
{
  int AppBooleanValue;
  NSObject *v1;
  const char *v2;
  Boolean keyExistsAndHasValidFormat[4];
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (CADeviceUseCompression::once != -1)
    dispatch_once(&CADeviceUseCompression::once, &__block_literal_global_15);
  CADeviceUseFramebufferCompression::enable_compression = CADeviceUseCompression::enable_compression;
  if (CADeviceUseCIF10::once != -1)
    dispatch_once(&CADeviceUseCIF10::once, &__block_literal_global_9735);
  if (CADeviceUseCIF10::enable_cif10)
  {
    keyExistsAndHasValidFormat[0] = 0;
    AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("CAEnableFramebufferCompression"), (CFStringRef)*MEMORY[0x1E0C9B248], keyExistsAndHasValidFormat);
    if (keyExistsAndHasValidFormat[0])
      CADeviceUseFramebufferCompression::enable_compression = AppBooleanValue != 0;
  }
  if (x_log_hook_p())
  {
    x_log_();
  }
  else
  {
    v1 = x_log_category_utilities;
    if (os_log_type_enabled((os_log_t)x_log_category_utilities, OS_LOG_TYPE_INFO))
    {
      if (CADeviceUseFramebufferCompression::enable_compression)
        v2 = "YES";
      else
        v2 = "NO";
      *(_DWORD *)keyExistsAndHasValidFormat = 136315138;
      v4 = v2;
      _os_log_impl(&dword_184457000, v1, OS_LOG_TYPE_INFO, "System UI Framebuffer Compression Enabled: %s\n", keyExistsAndHasValidFormat, 0xCu);
    }
  }
}

@end
