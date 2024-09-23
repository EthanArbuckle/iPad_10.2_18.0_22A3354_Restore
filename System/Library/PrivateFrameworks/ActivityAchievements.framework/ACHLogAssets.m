@implementation ACHLogAssets

void __ACHLogAssets_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.ActivityAchievements", "assets");
  v1 = (void *)ACHLogAssets_category;
  ACHLogAssets_category = (uint64_t)v0;

}

@end
