@implementation EMShouldOverrideGreymatterAvailability

BOOL ___EMShouldOverrideGreymatterAvailability_block_invoke()
{
  _BOOL8 result;

  result = (EFIsRunningUnitTests() & 1) != 0
        || +[EMInternalPreferences preferenceEnabled:](EMInternalPreferences, "preferenceEnabled:", 49);
  _EMShouldOverrideGreymatterAvailability_overrideIsGreymatterAvailability = result;
  return result;
}

@end
