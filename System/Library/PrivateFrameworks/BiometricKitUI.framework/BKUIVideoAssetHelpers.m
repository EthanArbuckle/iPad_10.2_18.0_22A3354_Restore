@implementation BKUIVideoAssetHelpers

+ (id)iPadVideoURLForAssetName:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB34D0];
  v4 = a3;
  objc_msgSend(v3, "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLForResource:withExtension:subdirectory:", v4, CFSTR("mov"), CFSTR("iPad_videos"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
