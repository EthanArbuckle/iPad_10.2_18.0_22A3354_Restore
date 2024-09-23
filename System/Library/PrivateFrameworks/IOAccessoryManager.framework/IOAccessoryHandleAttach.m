@implementation IOAccessoryHandleAttach

void __IOAccessoryHandleAttach_block_invoke(uint64_t a1)
{
  int v2;
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v2 = 136315138;
    v3 = "IOAccessoryHandleAttach_block_invoke";
    _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s starting local asset query\n", (uint8_t *)&v2, 0xCu);
  }
  performAssetQuery(1, *(_DWORD *)(a1 + 32));
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v2 = 136315138;
    v3 = "IOAccessoryHandleAttach_block_invoke";
    _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s finished local asset query\n", (uint8_t *)&v2, 0xCu);
  }
}

uint64_t __IOAccessoryHandleAttach_block_invoke_652(uint64_t a1)
{
  return performEisMeasurement(*(void **)(a1 + 32));
}

@end
