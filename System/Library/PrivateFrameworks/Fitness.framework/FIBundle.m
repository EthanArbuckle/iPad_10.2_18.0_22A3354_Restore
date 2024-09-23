@implementation FIBundle

void __FIBundle_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  if (FISystemRootDirectory_onceToken != -1)
    dispatch_once(&FISystemRootDirectory_onceToken, &__block_literal_global_10);
  objc_msgSend((id)FISystemRootDirectory_systemRootDirectory, "stringByAppendingPathComponent:", CFSTR("/System/Library/PrivateFrameworks/FitnessUI.framework"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", v2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)FIBundle___bundle;
  FIBundle___bundle = v0;

}

@end
