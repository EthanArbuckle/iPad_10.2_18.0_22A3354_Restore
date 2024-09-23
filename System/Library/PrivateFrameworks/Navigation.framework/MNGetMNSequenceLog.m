@implementation MNGetMNSequenceLog

void __MNGetMNSequenceLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Navigation", "MNSequence");
  v1 = (void *)_MergedGlobals_22;
  _MergedGlobals_22 = (uint64_t)v0;

}

@end
