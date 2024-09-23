@implementation CalDatabaseIsCurrentProcessCalaccessd

uint64_t __CalDatabaseIsCurrentProcessCalaccessd_block_invoke()
{
  pid_t v0;
  uint64_t result;
  BOOL v3;
  _OWORD v4[8];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  memset(v4, 0, sizeof(v4));
  v0 = getpid();
  result = proc_name(v0, v4, 0x80u);
  v3 = *(_QWORD *)&v4[0] == 0x73656363616C6163 && *(_QWORD *)((char *)v4 + 3) == 0x64737365636361;
  CalDatabaseIsCurrentProcessCalaccessd_isCalaccessd = v3;
  return result;
}

@end
