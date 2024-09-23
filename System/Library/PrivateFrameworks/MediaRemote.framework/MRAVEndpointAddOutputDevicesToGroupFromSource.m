@implementation MRAVEndpointAddOutputDevicesToGroupFromSource

uint64_t __MRAVEndpointAddOutputDevicesToGroupFromSource_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

@end
