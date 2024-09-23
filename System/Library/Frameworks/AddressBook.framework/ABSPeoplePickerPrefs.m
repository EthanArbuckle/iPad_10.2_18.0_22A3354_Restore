@implementation ABSPeoplePickerPrefs

uint64_t __ABSPeoplePickerPrefs_block_invoke()
{
  uint64_t result;

  result = CPCopySharedResourcesPreferencesDomainForDomain();
  ABSPeoplePickerPrefs__peoplePickerPrefs = result;
  return result;
}

@end
