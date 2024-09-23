@implementation MKFSoftwareUpdate

void __34___MKFSoftwareUpdate_homeRelation__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("accessory.home.modelID == $HOMEMODELID"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)homeRelation__hmf_once_v1_133738;
  homeRelation__hmf_once_v1_133738 = v0;

}

@end
