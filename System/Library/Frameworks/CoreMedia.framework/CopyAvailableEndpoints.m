@implementation CopyAvailableEndpoints

uint64_t __remoteXPCEndpointManager_CopyAvailableEndpoints_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = (uint64_t)FigEndpointRPCCacheApplyObjectDeltas(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 32), *(xpc_object_t *)(a1 + 56), *(xpc_object_t *)(a1 + 64));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    result = FigEndpointRPCCacheCopyAvailableObjects(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 32), (__CFArray **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  }
  return result;
}

@end
