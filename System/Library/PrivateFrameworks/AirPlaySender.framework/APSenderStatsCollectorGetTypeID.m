@implementation APSenderStatsCollectorGetTypeID

uint64_t __APSenderStatsCollectorGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  APSenderStatsCollectorGetTypeID_typeID = result;
  return result;
}

@end
