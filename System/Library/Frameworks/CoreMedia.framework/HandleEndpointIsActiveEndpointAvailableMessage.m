@implementation HandleEndpointIsActiveEndpointAvailableMessage

uint64_t __HandleEndpointIsActiveEndpointAvailableMessage_block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = gActiveEndpoint != 0;
  return result;
}

@end
