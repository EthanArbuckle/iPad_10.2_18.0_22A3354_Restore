@implementation HomeUIComonIsRunningInSpringBoard

void ___HomeUIComonIsRunningInSpringBoard_block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x24BE4D098], "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  _MergedGlobals_7 = objc_msgSend(v0, "hostProcess") == 100;

}

@end
