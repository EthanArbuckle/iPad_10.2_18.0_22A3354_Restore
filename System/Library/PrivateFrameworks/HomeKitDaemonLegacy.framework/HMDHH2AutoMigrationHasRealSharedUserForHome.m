@implementation HMDHH2AutoMigrationHasRealSharedUserForHome

BOOL __HMDHH2AutoMigrationHasRealSharedUserForHome_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;
  void *v4;

  v2 = a2;
  if ((objc_msgSend(v2, "isOwner") & 1) != 0 || (objc_msgSend(v2, "isRemoteGateway") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(v2, "userID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v4 != 0;

  }
  return v3;
}

@end
