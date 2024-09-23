@implementation MBAppRelativePathsToBackupAndRestore

void __MBAppRelativePathsToBackupAndRestore_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("Documents"), CFSTR("Library"), CFSTR("GeoJSON"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)MBAppRelativePathsToBackupAndRestore_sSet;
  MBAppRelativePathsToBackupAndRestore_sSet = v0;

}

@end
