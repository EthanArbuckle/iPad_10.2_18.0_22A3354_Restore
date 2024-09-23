@implementation MIUninstallProfilesForAppIdentifier

uint64_t __MIUninstallProfilesForAppIdentifier_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  uint64_t result;
  void *v8;

  if (!a7)
    return 1;
  if (!MISEntitlementDictionaryAllowsEntitlementValue())
    return 1;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
    MOLogWrite();
  result = MISRemoveProvisioningProfile();
  if ((_DWORD)result)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      MIErrorStringForMISError(result);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      MOLogWrite();

    }
    return 0;
  }
  return result;
}

@end
