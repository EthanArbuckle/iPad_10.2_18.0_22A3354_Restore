@implementation CTLogRadioModule

os_log_t __CTLogRadioModule_block_invoke()
{
  os_log_t result;

  result = os_log_create(kCTLoggingSubsystem, "RadioModule");
  CTLogRadioModule_logger = (uint64_t)result;
  return result;
}

@end
