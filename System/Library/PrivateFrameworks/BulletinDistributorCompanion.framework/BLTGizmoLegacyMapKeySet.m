@implementation BLTGizmoLegacyMapKeySet

void __BLTGizmoLegacyMapKeySet_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("publisherBulletinID"), CFSTR("categoryID"), CFSTR("sectionInfo"), CFSTR("sectionSubtype"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)BLTGizmoLegacyMapKeySet___BLTGizmoLegacyMapKeySet;
  BLTGizmoLegacyMapKeySet___BLTGizmoLegacyMapKeySet = v0;

}

@end
