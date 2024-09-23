@implementation SendRemoteControlSessionOutgoingMessage

void ___SendRemoteControlSessionOutgoingMessage_block_invoke(uint64_t a1)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = AirPlayReceiverSessionSendCommandForObject(*(_QWORD *)(a1 + 40), *(const __CFNumber **)(a1 + 48), *(const void **)(a1 + 56), 0, 0);
  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    APSLogErrorAt();
  CFRelease(*(CFTypeRef *)(a1 + 40));
  CFRelease(*(CFTypeRef *)(a1 + 48));
  CFRelease(*(CFTypeRef *)(a1 + 56));
}

@end
