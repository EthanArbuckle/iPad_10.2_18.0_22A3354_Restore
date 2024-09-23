@implementation ABCGetICUCollatorVersions

void __ABCGetICUCollatorVersions_block_invoke()
{
  NSObject *v0;
  int v1;

  v1 = 0;
  if (ucol_open())
  {
    ucol_getVersion();
    ucol_getUCAVersion();
    ABCGetICUCollatorVersions_cachedCollatorVersion = 0;
    ABCGetICUCollatorVersions_cachedUCAVersion = 0;
    ucol_close();
  }
  else
  {
    v0 = ABOSLogGeneral();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
      __ABCGetICUCollatorVersions_block_invoke_cold_1(&v1, v0);
  }
}

void __ABCGetICUCollatorVersions_block_invoke_cold_1(int *a1, NSObject *a2)
{
  int v2;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_19BC4B000, a2, OS_LOG_TYPE_ERROR, "Error opening root collator to retrieve version number, code=%d", (uint8_t *)v3, 8u);
}

@end
