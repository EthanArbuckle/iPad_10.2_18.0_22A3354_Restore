@implementation FigRoutingManagerUtilities

void __FigRoutingManagerUtilities_UnRegisterAirPlayStreamCapabilitiesDidChangeListener_block_invoke(uint64_t a1)
{
  CMSMUtility_UpdateSupportedOutputChannelLayouts(*(void **)(a1 + 32));
}

@end
