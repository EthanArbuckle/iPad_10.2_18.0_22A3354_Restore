@implementation MBAppGroupRelativePathsNotToBackup

void __MBAppGroupRelativePathsNotToBackup_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;

  MBAppRelativePathsNotToBackup();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR(".com.apple.mobile_container_manager.metadata.plist"), CFSTR("Library/Saved Application State"), CFSTR("SystemData/com.apple.AuthenticationServices"), CFSTR("Library/SplashBoard"), 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setByAddingObjectsFromSet:", v0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)MBAppGroupRelativePathsNotToBackup_sSet;
  MBAppGroupRelativePathsNotToBackup_sSet = v1;

}

@end
