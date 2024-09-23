@implementation BLTGizmoLegacyMapSectionInfoKeySet

void __BLTGizmoLegacyMapSectionInfoKeySet_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("sectionID"), CFSTR("parentSectionID"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)BLTGizmoLegacyMapSectionInfoKeySet___BLTGizmoLegacyMapSectionInfoKeySet;
  BLTGizmoLegacyMapSectionInfoKeySet___BLTGizmoLegacyMapSectionInfoKeySet = v0;

}

@end
