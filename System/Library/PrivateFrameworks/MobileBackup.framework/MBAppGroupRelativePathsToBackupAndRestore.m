@implementation MBAppGroupRelativePathsToBackupAndRestore

void __MBAppGroupRelativePathsToBackupAndRestore_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &stru_1E995F798, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)MBAppGroupRelativePathsToBackupAndRestore_sSet;
  MBAppGroupRelativePathsToBackupAndRestore_sSet = v0;

}

@end
