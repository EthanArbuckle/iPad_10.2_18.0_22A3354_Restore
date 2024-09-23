@implementation GKGameKitBundle

void __GKGameKitBundle_block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = objc_alloc(MEMORY[0x1E0CB34D0]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/System/Library/Frameworks/GameKit.framework"), GSSystemRootDirectory());
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "initWithPath:", v3);
  v2 = (void *)GKGameKitBundle_sBundle;
  GKGameKitBundle_sBundle = v1;

}

@end
