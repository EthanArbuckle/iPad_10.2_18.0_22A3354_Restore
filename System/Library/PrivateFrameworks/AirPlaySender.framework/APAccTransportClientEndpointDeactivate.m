@implementation APAccTransportClientEndpointDeactivate

uint64_t __APAccTransportClientEndpointDeactivate_block_invoke(uint64_t a1)
{
  uint64_t result;

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = accTransportClientEndpointDestroyEndpoint(*(_QWORD *)(a1 + 40));
  result = *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if ((_DWORD)result)
    return APSLogErrorAt();
  return result;
}

@end
