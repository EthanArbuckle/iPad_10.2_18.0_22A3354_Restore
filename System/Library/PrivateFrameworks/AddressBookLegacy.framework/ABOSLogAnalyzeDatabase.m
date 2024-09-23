@implementation ABOSLogAnalyzeDatabase

os_log_t __ABOSLogAnalyzeDatabase_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.contacts.AddressBookLegacy", "analyze-database");
  ABOSLogAnalyzeDatabase_analyzeDatabaseLog = (uint64_t)result;
  return result;
}

@end
