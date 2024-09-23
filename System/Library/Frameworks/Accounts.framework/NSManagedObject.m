@implementation NSManagedObject

void __48__NSManagedObject_Accounts___obsoleteAttributes__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("credentialAvailability"), CFSTR("owningTeamID"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)__sACDObsoleteAttributes;
  __sACDObsoleteAttributes = v0;

}

@end
