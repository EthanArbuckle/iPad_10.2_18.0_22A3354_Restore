@implementation FCURLForContainerizedUserAccountCachesDirectory

void __FCURLForContainerizedUserAccountCachesDirectory_block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;

  FCURLForDirectoryInDomain(NSCachesDirectory, 1uLL);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_161;
  _MergedGlobals_161 = v0;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 0;
  objc_msgSend(v2, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", _MergedGlobals_161, 1, 0, &v3);

}

@end
