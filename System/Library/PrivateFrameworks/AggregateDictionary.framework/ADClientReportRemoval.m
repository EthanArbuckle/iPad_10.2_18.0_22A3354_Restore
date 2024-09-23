@implementation ADClientReportRemoval

void __ADClientReportRemoval_block_invoke()
{
  uint8_t v0[16];

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v0 = 0;
    _os_log_impl(&dword_18A0EF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "AggregateDictionary is deprecated and has been removed. Please migrate to Core Analytics.", v0, 2u);
  }
}

@end
