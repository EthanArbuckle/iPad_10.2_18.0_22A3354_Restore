@implementation MBAppRelativePathsNotToRestore

void __MBAppRelativePathsNotToRestore_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("NewsstandArtwork"), CFSTR("Library/Saved Application State"), CFSTR("SystemData/com.apple.AuthenticationServices"), CFSTR("Library/SplashBoard"), CFSTR("SystemData/com.apple.chrono"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)MBAppRelativePathsNotToRestore_sSet;
  MBAppRelativePathsNotToRestore_sSet = v0;

}

@end
