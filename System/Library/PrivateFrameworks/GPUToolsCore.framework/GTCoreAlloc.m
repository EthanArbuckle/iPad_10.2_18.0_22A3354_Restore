@implementation GTCoreAlloc

void __GTCoreAlloc_block_invoke(uint64_t a1)
{
  NSObject *v2;
  mach_error_t v3;
  FILE *v4;
  mach_error_t v5;
  char *v6;
  uint8_t buf[4];
  mach_error_t v8;
  __int16 v9;
  char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (s_logUsingOsLog)
  {
    v2 = gt_default_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v3 = *(_DWORD *)(a1 + 32);
      *(_DWORD *)buf = 67109378;
      v8 = v3;
      v9 = 2080;
      v10 = mach_error_string(v3);
      _os_log_error_impl(&dword_23C6D4000, v2, OS_LOG_TYPE_ERROR, "warning: failed to mark memory(GRAPHICS) error 0x%x (%s)", buf, 0x12u);
    }
  }
  else
  {
    v4 = (FILE *)*MEMORY[0x24BDAC8D8];
    v5 = *(_DWORD *)(a1 + 32);
    v6 = mach_error_string(v5);
    fprintf(v4, "warning: failed to mark memory(GRAPHICS) error 0x%x (%s)\n", v5, v6);
  }
}

@end
