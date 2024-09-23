@implementation MBMaxLogCount

void __MBMaxLogCount_block_invoke()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v0 = getenv("MBMaxLogCount");
  v1 = 10;
  if (v0)
  {
    v2 = strtol(v0, 0, 10);
    if ((unint64_t)(v2 - 1) < 0x7FFFFFFFFFFFFFFELL)
      v1 = v2;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v3 = 134217984;
      v4 = v1;
      _os_log_impl(&dword_1D5213000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "MBMaxLogCount=%ld", (uint8_t *)&v3, 0xCu);
    }
  }
  MBMaxLogCount_sMaxLogCount = v1;
}

@end
