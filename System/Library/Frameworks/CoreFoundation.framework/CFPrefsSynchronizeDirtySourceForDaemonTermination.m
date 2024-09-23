@implementation CFPrefsSynchronizeDirtySourceForDaemonTermination

uint64_t ___CFPrefsSynchronizeDirtySourceForDaemonTermination_block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "syncWriteToDisk");
}

@end
