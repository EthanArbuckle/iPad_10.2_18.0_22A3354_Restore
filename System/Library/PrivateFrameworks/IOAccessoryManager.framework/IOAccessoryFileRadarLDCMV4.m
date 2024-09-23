@implementation IOAccessoryFileRadarLDCMV4

void __IOAccessoryFileRadarLDCMV4_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  if (v5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "IOAccessoryFileRadarLDCMV4_block_invoke";
    v8 = 2112;
    v9 = v5;
    _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s Error while filing radar. %@\n", (uint8_t *)&v6, 0x16u);
  }

}

@end
