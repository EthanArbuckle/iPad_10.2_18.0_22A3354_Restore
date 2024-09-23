@implementation CMSessionMgrInterruptVoiceAssistantIfCarSupportsAuxStream

uint64_t __CMSessionMgrInterruptVoiceAssistantIfCarSupportsAuxStream_block_invoke()
{
  uint64_t result;

  result = FigRoutingManager_iOSIsCarPlayAuxStreamSupported();
  if ((_DWORD)result)
    return CMSMUtility_InterruptActiveSiriSession();
  return result;
}

@end
