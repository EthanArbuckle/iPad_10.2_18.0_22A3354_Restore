@implementation IOAccessoryServiceMatchingCallback

void __IOAccessoryServiceMatchingCallback_block_invoke(uint64_t a1)
{
  int v2;
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v2 = 136315138;
    v3 = "IOAccessoryServiceMatchingCallback_block_invoke";
    _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s starting remote asset query\n", (uint8_t *)&v2, 0xCu);
  }
  performAssetQuery(0, *(_DWORD *)(a1 + 32));
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v2 = 136315138;
    v3 = "IOAccessoryServiceMatchingCallback_block_invoke";
    _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s finished remote asset query\n", (uint8_t *)&v2, 0xCu);
  }
}

uint64_t __IOAccessoryServiceMatchingCallback_block_invoke_498(uint64_t a1)
{
  return performEisMeasurement(*(void **)(a1 + 32));
}

@end
