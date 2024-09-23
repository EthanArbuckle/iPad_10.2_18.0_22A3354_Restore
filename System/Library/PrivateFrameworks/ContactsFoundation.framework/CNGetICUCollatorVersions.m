@implementation CNGetICUCollatorVersions

void __CNGetICUCollatorVersions_block_invoke()
{
  int v0;

  v0 = 0;
  if (ucol_open())
  {
    ucol_getVersion();
    ucol_getUCAVersion();
    CNGetICUCollatorVersions_cachedCollatorVersion = 0;
    CNGetICUCollatorVersions_cachedUCAVersion = 0;
    ucol_close();
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    __CNGetICUCollatorVersions_block_invoke_cold_1(&v0);
  }
}

void __CNGetICUCollatorVersions_block_invoke_cold_1(int *a1)
{
  int v1;
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = *a1;
  v2[0] = 67109120;
  v2[1] = v1;
  _os_log_error_impl(&dword_18F80C000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error opening root collator to retrieve version number, code=%d", (uint8_t *)v2, 8u);
}

@end
