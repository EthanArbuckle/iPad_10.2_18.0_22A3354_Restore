@implementation MRLogCategoryMigrationOversize

void __MRLogCategoryMigrationOversize_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.amp.mediaremote", "MigrationOversize");
  v1 = (void *)MRLogCategoryMigrationOversize__log;
  MRLogCategoryMigrationOversize__log = (uint64_t)v0;

}

@end
