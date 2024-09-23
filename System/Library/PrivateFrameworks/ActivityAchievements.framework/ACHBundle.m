@implementation ACHBundle

void __ACHBundle_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  if (ACHSystemRootDirectory_onceToken != -1)
    dispatch_once(&ACHSystemRootDirectory_onceToken, &__block_literal_global_335);
  objc_msgSend((id)ACHSystemRootDirectory_systemRootDirectory, "stringByAppendingPathComponent:", CFSTR("/System/Library/PrivateFrameworks/ActivityAchievementsUI.framework"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", v2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)ACHBundle___bundle;
  ACHBundle___bundle = v0;

}

@end
