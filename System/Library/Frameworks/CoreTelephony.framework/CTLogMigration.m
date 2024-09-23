@implementation CTLogMigration

os_log_t __CTLogMigration_block_invoke()
{
  os_log_t result;

  result = os_log_create(kCTLoggingSubsystem, "Migration");
  CTLogMigration_logger = (uint64_t)result;
  return result;
}

@end
