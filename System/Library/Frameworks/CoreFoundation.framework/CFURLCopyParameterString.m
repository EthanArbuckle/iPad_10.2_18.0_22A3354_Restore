@implementation CFURLCopyParameterString

void __CFURLCopyParameterString_block_invoke_24(uint64_t a1)
{
  NSObject *v2;

  v2 = _CFOSLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __CFURLCopyParameterString_block_invoke_24_cold_1(a1, v2);
}

void __CFURLCopyParameterString_block_invoke_24_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = 138477827;
  v4 = v2;
  _os_log_debug_impl(&dword_182A8C000, a2, OS_LOG_TYPE_DEBUG, "CFURLCopyParameterString is deprecated and now always returns NULL. The path component now includes the part of the URL string which CFURLCopyParameterString used to return.\nURL = %{private}@", (uint8_t *)&v3, 0xCu);
}

@end
