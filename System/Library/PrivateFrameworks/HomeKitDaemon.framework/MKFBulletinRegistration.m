@implementation MKFBulletinRegistration

void __40___MKFBulletinRegistration_homeRelation__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("user.home.modelID == $HOMEMODELID"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)homeRelation__hmf_once_v1_115381;
  homeRelation__hmf_once_v1_115381 = v0;

}

@end
