@implementation MKFTrigger

void __27___MKFTrigger_homeRelation__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("home.modelID == $HOMEMODELID"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)homeRelation__hmf_once_v1_200072;
  homeRelation__hmf_once_v1_200072 = v0;

}

@end
