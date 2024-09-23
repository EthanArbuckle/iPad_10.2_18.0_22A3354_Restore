@implementation HandleIncomingMessage

void __rcsMediaRemote_HandleIncomingMessage_block_invoke(uint64_t a1)
{
  APReceiverMediaRemoteXPCService_PostEvent(CFSTR("didReceiveMediaRemoteData"), *(const void **)(a1 + 32), *(const __CFData **)(a1 + 40));
  CFRelease(*(CFTypeRef *)(a1 + 32));
  CFRelease(*(CFTypeRef *)(a1 + 48));
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

void __rcsSenderUIEventsChannel_HandleIncomingMessage_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t, uint64_t);

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80);
  v4 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 152);
  if (v4)
    v4(v3, v2);
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

@end
