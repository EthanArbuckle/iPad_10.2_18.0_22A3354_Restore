@implementation ASSendRichMessagePayloadToDestination

uint64_t __ASSendRichMessagePayloadToDestination_block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 0;
  return result;
}

@end
