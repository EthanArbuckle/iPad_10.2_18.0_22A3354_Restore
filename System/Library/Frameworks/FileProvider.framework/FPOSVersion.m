@implementation FPOSVersion

void __FPOSVersion_block_invoke()
{
  uint64_t v0;
  NSObject *v1;
  size_t v2;
  int v3[2];
  _QWORD v4[2];
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v4[0] = 0;
  v4[1] = 0;
  v5 = 0;
  *(_QWORD *)v3 = 0x4100000001;
  v2 = 20;
  if (sysctl(v3, 2u, v4, &v2, 0, 0) < 0)
  {
    fp_current_or_default_log();
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
      __FPOSVersion_block_invoke_cold_1(v1);
  }
  else
  {
    HIBYTE(v5) = 0;
    v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", v4);
    v1 = FPOSVersion_OSVersion;
    FPOSVersion_OSVersion = v0;
  }

}

void __FPOSVersion_block_invoke_cold_1(NSObject *a1)
{
  int v2;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = *__error();
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_1A0A34000, a1, OS_LOG_TYPE_ERROR, "[ERROR] sysctl(kern.osversion) failed %{errno}d", (uint8_t *)v3, 8u);
}

@end
