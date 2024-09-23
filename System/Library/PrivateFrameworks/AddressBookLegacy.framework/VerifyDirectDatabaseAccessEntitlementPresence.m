@implementation VerifyDirectDatabaseAccessEntitlementPresence

uint64_t ___VerifyDirectDatabaseAccessEntitlementPresence_block_invoke()
{
  uint64_t result;
  void *v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  result = _CurrentProcessHasDirectDatabaseAccessEntitlement();
  if ((result & 1) == 0)
  {
    v1 = (void *)objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v2 = _CallStackSymbolsIncludeFrameworkWithName(v1, (uint64_t)CFSTR("Contacts"));
    result = _CallStackSymbolsIncludeFrameworkWithName(v1, (uint64_t)CFSTR("IMCore"));
    if ((v2 & 1) == 0 && (result & 1) == 0)
    {
      result = _CallStackSymbolsIncludeFrameworkWithName(v1, (uint64_t)CFSTR("AddressBook"));
      if ((result & 1) == 0)
      {
        ABDiagnosticsEnabled();
        _ABLog2(3, (uint64_t)"void _VerifyDirectDatabaseAccessEntitlementPresence(void)_block_invoke", 185, 0, (uint64_t)CFSTR("AddressBookLegacy.framework requires BOOLean entitlement: com.apple.Contacts.database-allow"), v3, v4, v5, v6);
        return (uint64_t)ABLogSimulateCrashReport((uint64_t)CFSTR("AddressBookLegacy.framework requires BOOLean entitlement: com.apple.Contacts.database-allow"));
      }
    }
  }
  return result;
}

@end
