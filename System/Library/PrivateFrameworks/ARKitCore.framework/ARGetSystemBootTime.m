@implementation ARGetSystemBootTime

void __ARGetSystemBootTime_block_invoke()
{
  int v0;
  int v1;
  NSObject *v2;
  int v3;
  char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  __memset_chk();
  v0 = sysctlnametomib("kern.boottime", ARGetSystemBootTime_bootTimeMIB, (size_t *)&ARGetSystemBootTime_bootTimeMIBSize);
  if (v0)
  {
    v1 = v0;
    _ARLogGeneral_4();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v3 = 136380675;
      v4 = strerror(v1);
      _os_log_impl(&dword_1B3A68000, v2, OS_LOG_TYPE_ERROR, "Failed to get kern.boottime MIB with error: %{private}s", (uint8_t *)&v3, 0xCu);
    }

    ARGetSystemBootTime_bootTimeMIBSize = 0;
  }
}

@end
