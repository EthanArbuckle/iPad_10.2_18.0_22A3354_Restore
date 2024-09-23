@implementation CPLPrimaryScopeIdentifierForCurrentUniverse

void __CPLPrimaryScopeIdentifierForCurrentUniverse_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  CPLCurrentUniverseName();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  CPLPrimaryScopeIdentifierForUniverseName(v2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)CPLPrimaryScopeIdentifierForCurrentUniverse_result;
  CPLPrimaryScopeIdentifierForCurrentUniverse_result = v0;

}

@end
