@implementation HUIsRunningInSpringBoard

void ___HUIsRunningInSpringBoard_block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0D313C8], "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  _MergedGlobals_621 = objc_msgSend(v0, "hostProcess") == 100;

}

@end
