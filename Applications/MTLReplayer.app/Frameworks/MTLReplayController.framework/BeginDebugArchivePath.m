@implementation BeginDebugArchivePath

void __BeginDebugArchivePath_block_invoke(uint64_t a1)
{
  size_t v2;
  uint64_t v3;
  unint64_t v4;

  v2 = os_proc_available_memory();
  v3 = v2 - 0x10000000;
  if (v2 - 0x10000000 >= 0x18000000)
    v3 = 402653184;
  if (v2 >> 28)
    v4 = v3;
  else
    v4 = 0;
  GTMTLReplayController_optimizeRestores(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), v4);
}

@end
