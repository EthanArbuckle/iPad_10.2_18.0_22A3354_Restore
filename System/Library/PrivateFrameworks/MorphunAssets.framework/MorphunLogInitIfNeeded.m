@implementation MorphunLogInitIfNeeded

void __MorphunLogInitIfNeeded_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.siri.morphun", (const char *)kMorphunLogContextAsset);
  v1 = (void *)MorphunAssetOSLog;
  MorphunAssetOSLog = (uint64_t)v0;

}

@end
