@implementation CMTimeSyncClockCreateForSystemDomainClockIdentifier

os_log_t __CMTimeSyncClockCreateForSystemDomainClockIdentifier_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.coremedia", "FigTimeSyncClock");
  sLog = (uint64_t)result;
  return result;
}

@end
