@implementation MBAppGroupRelativePathsNotToRestore

void __MBAppGroupRelativePathsNotToRestore_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  MBAppRelativePathsNotToRestore();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("Library/Saved Application State"), CFSTR("SystemData/com.apple.AuthenticationServices"), CFSTR("Library/SplashBoard"), 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setByAddingObjectsFromSet:", v0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)MBAppGroupRelativePathsNotToRestore_sSet;
  MBAppGroupRelativePathsNotToRestore_sSet = v1;

}

@end
