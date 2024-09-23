@implementation MKFZone

uint64_t __75___MKFZone_ResidentSyncCoding__shouldIncludeForRestrictedGuestWithContext___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;
  v6 = v5;
  if (v5)
    v7 = objc_msgSend(v5, "shouldIncludeForRestrictedGuestWithContext:", *(_QWORD *)(a1 + 32));
  else
    v7 = 0;

  return v7;
}

void __24___MKFZone_homeRelation__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("home.modelID == $HOMEMODELID"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)homeRelation__hmf_once_v1_177822;
  homeRelation__hmf_once_v1_177822 = v0;

}

@end
