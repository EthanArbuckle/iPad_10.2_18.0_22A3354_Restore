@implementation ABPeoplePickerPrefs

uint64_t __ABPeoplePickerPrefs_block_invoke()
{
  uint64_t result;

  result = CPCopySharedResourcesPreferencesDomainForDomain();
  ABPeoplePickerPrefs__peoplePickerPrefs = result;
  return result;
}

@end
