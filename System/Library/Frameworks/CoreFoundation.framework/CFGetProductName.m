@implementation CFGetProductName

void ___CFGetProductName_block_invoke()
{
  char *v0;
  const char *v1;
  int v2;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const __CFString *v12;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  size_t v25;
  _OWORD v26[16];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v0 = getenv("CLASSIC_SUFFIX");
  if (v0)
  {
    v1 = v0;
    if (!strncmp(v0, "iphone", 6uLL))
    {
      v4 = _CFBundleResourceLogger();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
        ___CFGetProductName_block_invoke_cold_2(v4, v5, v6, v7, v8, v9, v10, v11);
      goto LABEL_16;
    }
    if (!strncmp(v1, "ipad", 4uLL))
    {
      v16 = _CFBundleResourceLogger();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        ___CFGetProductName_block_invoke_cold_3(v16, v17, v18, v19, v20, v21, v22, v23);
LABEL_39:
      v12 = CFSTR("ipad");
      goto LABEL_41;
    }
  }
  memset(v26, 0, sizeof(v26));
  v25 = 256;
  v2 = sysctlbyname("hw.machine", v26, &v25, 0, 0);
  if (v2 && (v2 != -1 || *__error() != 12))
    goto LABEL_42;
  if (v25 >= 6)
  {
    if (LODWORD(v26[0]) != 1869107305 || WORD2(v26[0]) != 25966)
      goto LABEL_18;
LABEL_16:
    v12 = CFSTR("iphone");
LABEL_41:
    _CFGetProductName__cfBundlePlatform = (uint64_t)v12;
    goto LABEL_42;
  }
  if (v25 < 4)
    goto LABEL_42;
LABEL_18:
  if (LODWORD(v26[0]) == 1685016681)
  {
    v12 = CFSTR("ipod");
    goto LABEL_41;
  }
  if (LODWORD(v26[0]) == 1684099177)
    goto LABEL_39;
  if (v25 < 5)
    goto LABEL_42;
  if (LODWORD(v26[0]) == 1668571479 && BYTE4(v26[0]) == 104)
  {
    v12 = CFSTR("applewatch");
    goto LABEL_41;
  }
  if (v25 < 7)
    goto LABEL_42;
  if (LODWORD(v26[0]) == 1819308097 && *(_DWORD *)((char *)v26 + 3) == 1448371564)
  {
    v12 = CFSTR("appletv");
    goto LABEL_41;
  }
  if (v25 >= 0xD && *(_QWORD *)&v26[0] == 0x447974696C616552 && *(_QWORD *)((char *)v26 + 5) == 0x6563697665447974)
  {
    v12 = CFSTR("applevision");
    goto LABEL_41;
  }
LABEL_42:
  v24 = _CFBundleResourceLogger();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    ___CFGetProductName_block_invoke_cold_1(v24);
}

void ___CFGetProductName_block_invoke_cold_1(os_log_t log)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 138412290;
  v2 = _CFGetProductName__cfBundlePlatform;
  _os_log_debug_impl(&dword_182A8C000, log, OS_LOG_TYPE_DEBUG, "Using ~%@ resources", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_2_18();
}

void ___CFGetProductName_block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_24(&dword_182A8C000, a1, a3, "Using ~iphone resources (classic)", a5, a6, a7, a8, 0);
}

void ___CFGetProductName_block_invoke_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_24(&dword_182A8C000, a1, a3, "Using ~ipad resources (classic)", a5, a6, a7, a8, 0);
}

@end
