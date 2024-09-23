@implementation GKGameCenterUIFrameworkBundle

void __GKGameCenterUIFrameworkBundle_block_invoke()
{
  id v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;

  v0 = objc_alloc(MEMORY[0x1E0CB34D0]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/System/Library/PrivateFrameworks/GameCenterUI.framework"), GSSystemRootDirectory());
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v0, "initWithPath:", v1);
  v3 = (void *)GKGameCenterUIFrameworkBundle_sBundle;
  GKGameCenterUIFrameworkBundle_sBundle = v2;

  v4 = objc_alloc(MEMORY[0x1E0CB34D0]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/System/iOSSupport/System/Library/PrivateFrameworks/GameCenterUI.framework"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "initWithPath:", v7);
  v6 = (void *)GKGameCenterUIFrameworkBundle_sIOSMacBundle;
  GKGameCenterUIFrameworkBundle_sIOSMacBundle = v5;

}

@end
