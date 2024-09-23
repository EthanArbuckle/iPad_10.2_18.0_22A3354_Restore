@implementation MBMaxLogSize

void __MBMaxLogSize_block_invoke()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v0 = getenv("MBMaxLogSize");
  if (v0)
  {
    v1 = strtol(v0, 0, 10);
    if ((unint64_t)(v1 - 1) >= 0x7FFFFFFFFFFFFFFELL)
      v2 = 10485760;
    else
      v2 = v1;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v3 = 134217984;
      v4 = v2;
      _os_log_impl(&dword_1D5213000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "MBMaxLogSize=%ld", (uint8_t *)&v3, 0xCu);
    }
  }
  else
  {
    v2 = 10485760;
  }
  MBMaxLogSize_sMaxLogSize = v2;
}

@end
