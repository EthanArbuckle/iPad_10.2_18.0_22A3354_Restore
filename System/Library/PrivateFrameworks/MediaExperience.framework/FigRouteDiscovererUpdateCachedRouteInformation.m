@implementation FigRouteDiscovererUpdateCachedRouteInformation

const __CFArray *__FigRouteDiscovererUpdateCachedRouteInformation_block_invoke(uint64_t a1)
{
  const __CFArray *result;

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = FigRouteDiscoveryManagerCopyRoutesForTypeAndAudioSessionID(*MEMORY[0x1E0C9AE00], *(_DWORD *)(*(_QWORD *)(a1 + 56) + 40), *(_DWORD *)(a1 + 64), *(_QWORD *)(*(_QWORD *)(a1 + 56) + 24), (CFMutableArrayRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 40)+ 8)+ 24));
  result = FigRouteDiscoveryManagerCopyRouteDescriptorsFromEndpointsAndAudioSessionID(*(const __CFArray **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), *(unsigned int *)(a1 + 64));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

@end
