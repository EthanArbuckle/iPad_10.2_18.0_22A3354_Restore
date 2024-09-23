@implementation NPKIsRunningInNPKCompanionAgent

void __NPKIsRunningInNPKCompanionAgent_block_invoke()
{
  id v0;

  NPKGetMyProcessName();
  v0 = (id)objc_claimAutoreleasedReturnValue();
  NPKIsRunningInNPKCompanionAgent_runningInNPKCompanionAgent = objc_msgSend(v0, "isEqualToString:", CFSTR("NPKCompanionAgent"));

}

@end
