@implementation FigRouteDiscoveryManagerCopyRouteDescriptorsFromEndpointsAndAudioSessionID

__CFArray *__FigRouteDiscoveryManagerCopyRouteDescriptorsFromEndpointsAndAudioSessionID_block_invoke(uint64_t a1)
{
  __CFArray *result;

  result = FigEndpointDescriptorUtility_CopyDescriptorsForEndpoints(*(const __CFArray **)(a1 + 40), *(unsigned int *)(a1 + 48));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
