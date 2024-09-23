@implementation APSGetAllowPersistentGroupsOnInfra

uint64_t __APSGetAllowPersistentGroupsOnInfra_block_invoke()
{
  uint64_t result;

  if (APSIsVirtualMachine_sCheckOnceForVM != -1)
    dispatch_once(&APSIsVirtualMachine_sCheckOnceForVM, &__block_literal_global_233);
  APSGetAllowPersistentGroupsOnInfra_sAllowPersistentGroupsOnInfra = APSIsVirtualMachine_sIsVirtualMachine;
  result = IsAppleInternalBuild();
  if ((_DWORD)result)
  {
    result = APSSettingsGetIntWithOverrideAndDefault(CFSTR("allowPersistentGroupsOnInfra"), 0, APSGetAllowPersistentGroupsOnInfra_sAllowPersistentGroupsOnInfra);
    APSGetAllowPersistentGroupsOnInfra_sAllowPersistentGroupsOnInfra = result;
  }
  return result;
}

@end
