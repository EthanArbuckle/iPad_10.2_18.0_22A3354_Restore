@implementation CTLogPacket

os_log_t __CTLogPacket_block_invoke()
{
  os_log_t result;

  result = os_log_create(kCTLoggingSubsystem, "Packet");
  CTLogPacket_logger = (uint64_t)result;
  return result;
}

@end
