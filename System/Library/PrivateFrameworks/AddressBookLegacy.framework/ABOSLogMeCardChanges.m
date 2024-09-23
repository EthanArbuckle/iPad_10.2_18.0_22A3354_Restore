@implementation ABOSLogMeCardChanges

os_log_t __ABOSLogMeCardChanges_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.contacts.AddressBookLegacy", "me-card-changes");
  ABOSLogMeCardChanges_meCardLog = (uint64_t)result;
  return result;
}

@end
