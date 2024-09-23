@implementation DMFAtomicFileWritingLog

void __DMFAtomicFileWritingLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.dmd", "AtomicFileWriting");
  v1 = (void *)DMFAtomicFileWritingLog_log;
  DMFAtomicFileWritingLog_log = (uint64_t)v0;

}

@end
