@implementation ABOSLogGeneral

os_log_t __ABOSLogGeneral_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.contacts.AddressBookLegacy", "General");
  ABOSLogGeneral_generalLog = (uint64_t)result;
  return result;
}

@end
