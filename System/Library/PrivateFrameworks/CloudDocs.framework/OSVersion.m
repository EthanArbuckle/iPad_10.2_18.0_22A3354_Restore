@implementation OSVersion

void __OSVersion_block_invoke()
{
  uint64_t v0;
  void *v1;
  int v2;
  void *v3;
  NSObject *v4;
  size_t v5;
  int v6[3];
  _BYTE v7[20];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)v6 = 0x4100000001;
  v5 = 20;
  if (sysctl(v6, 2u, v7, &v5, 0, 0) < 0)
  {
    v2 = *__error();
    brc_bread_crumbs((uint64_t)"OSVersion_block_invoke", 24);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, (os_log_type_t)0x90u))
      __OSVersion_block_invoke_cold_1((uint64_t)v3, v2, v4);

    *__error() = v2;
  }
  else
  {
    v7[19] = 0;
    v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", v7);
    v1 = (void *)OSVersion_OSVersion;
    OSVersion_OSVersion = v0;

  }
}

void __OSVersion_block_invoke_cold_1(uint64_t a1, int a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3[0] = 67109378;
  v3[1] = a2;
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl(&dword_19CBF0000, log, (os_log_type_t)0x90u, "[ERROR] sysctl(kern.osversion) failed %{errno}d%@", (uint8_t *)v3, 0x12u);
}

@end
