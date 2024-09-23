@implementation NEGetRootUUID

void __NEGetRootUUID_block_invoke()
{
  uint64_t v0;
  void *v1;

  NECopyUserUUIDSimple(0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)NEGetRootUUID_rootUUID;
  NEGetRootUUID_rootUUID = v0;

}

@end
