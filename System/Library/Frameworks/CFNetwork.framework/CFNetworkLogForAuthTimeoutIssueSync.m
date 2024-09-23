@implementation CFNetworkLogForAuthTimeoutIssueSync

uint64_t ____CFNetworkLogForAuthTimeoutIssueSync_block_invoke()
{
  uint64_t result;

  result = CFPreferencesGetAppBooleanValue(CFSTR("CFNETWORK_LOG_AUTH_TIMEOUT"), (CFStringRef)*MEMORY[0x1E0C9B248], 0);
  __CFNetworkLogForAuthTimeoutIssueSync::shouldLog = result;
  return result;
}

@end
