@implementation CopyAvailableEndpoints

uint64_t __remoteXPCRouteDiscoverer_CopyAvailableEndpoints_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 24);
  if (result)
  {
    result = FigEndpointRPCCacheApplyObjectDeltas();
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
    if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    {
      result = FigEndpointRPCCacheCopyAvailableObjects();
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
    }
  }
  return result;
}

@end
